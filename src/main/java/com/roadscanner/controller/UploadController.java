package com.roadscanner.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.roadscanner.upload.S3FileUploader;

@Controller
public class UploadController {
    final Logger LOG = LogManager.getLogger(getClass());
    
    // AWS 자격 증명 설정
    @Value("${cloud.aws.credentials.access-key}")
    private String accessKey;
    
    @Value("${cloud.aws.credentials.secret-key}")
    private String secretKey;
    
    @Value("${cloud.aws.region.static}")
    private String region;
    
    // S3 버킷 설정
    @Value("${cloud.aws.s3.bucket}")
    private String bucketName;
    
    @RequestMapping(value = "/feedback")
    public String feedback() {
        return "feedback";
    }
    
    @RequestMapping(value = "/upload")
    public String upload() {
        return "upload";
    }
    
    // 파일 업로드 처리
    @RequestMapping(value = "/fileUploaded", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String uploadFile(@RequestParam("file") MultipartFile file) {
        LOG.debug("┌──────────────────────────────┐");
        LOG.debug("│uploadFile");
        LOG.debug("└──────────────────────────────┘");
        
        if (!file.isEmpty()) {
            try {
                // S3FileUploader 인스턴스 생성
                S3FileUploader s3FileUploader = new S3FileUploader(accessKey, secretKey, region, bucketName);
                
                // 업로드된 파일을 S3에 전송
                s3FileUploader.uploadFile(file);

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
