package com.roadscanner.controller;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.roadscanner.upload.FileUtil;
import com.roadscanner.upload.S3FileUploader;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	
	@GetMapping(value = "/feedback") //http://localhost:8080/road-scanner/feedback
	public String feedback() {
		return "feedback";
	}
	
	@GetMapping(value = "/upload")
	public String upload() {
		return "upload";
	}
	
    // 파일 업로드 처리
    @PostMapping("/fileUploaded")
    public String uploadFile(@RequestParam("file") MultipartFile file) {
        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            try {
                // MultipartFile을 File로 변환
                File convertedFile = FileUtil.convertMultipartFileToFile(file);
                // 업로드된 파일을 S3에 전송
                S3FileUploader.uploadFile(convertedFile, fileName);
                return "upload"; // 파일 전송 완료 후에 원하는 페이지로 이동
            } catch (Exception e) {
                e.printStackTrace();
                // 파일 업로드 실패 시 처리할 로직 (예: 에러 메시지 출력 등)
                return "upload";
            }
        } else {
            // 파일이 비어있을 경우 처리할 로직 (예: 에러 메시지 출력 등)
            return "upload";
        }
    }
}
