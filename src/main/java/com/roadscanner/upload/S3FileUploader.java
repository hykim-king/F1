package com.roadscanner.upload;

import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.S3Exception;
import software.amazon.awssdk.core.sync.RequestBody;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;

public class S3FileUploader {

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

    public S3FileUploader(String accessKey, String secretKey, String region, String bucketName) {
        this.accessKey = accessKey;
        this.secretKey = secretKey;
        this.region = region;
        this.bucketName = bucketName;
    }

    public void uploadFile(MultipartFile fileToUpload) throws IOException {
        S3Client s3Client = S3Client.builder()
                                    .region(Region.of(region))
                                    .credentialsProvider(StaticCredentialsProvider.create(
                                            AwsBasicCredentials.create(accessKey, secretKey)
                                    ))
                                    .build();

        try (InputStream inputStream = fileToUpload.getInputStream()) {
            PutObjectRequest request = PutObjectRequest.builder()
                                                       .bucket(bucketName)
                                                       .key(fileToUpload.getOriginalFilename()) // S3에 저장될 파일 이름
                                                       .build();

            s3Client.putObject(request, RequestBody.fromInputStream(inputStream, fileToUpload.getSize()));
            System.out.println("파일 업로드 성공!");
        } catch (S3Exception e) {
            System.err.println("에러: " + e.getMessage());
            throw e; // 업로드 실패 시 예외를 발생시킵니다. 이후 컨트롤러에서 예외 처리 가능
        } finally {
            s3Client.close(); // 클라이언트 리소스 정리
        }
    }
}
