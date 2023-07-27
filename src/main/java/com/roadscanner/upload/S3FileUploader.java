package com.roadscanner.upload;

import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.S3Exception;

import java.io.File;
import java.io.IOException;

public class S3FileUploader {
	

    // AWS 자격 증명 설정
    private static final String ACCESS_KEY = "357109854816";
    private static final String SECRET_KEY = "rDxva&8&";
    private static final String REGION = "ap-northeast-2";

    // S3 버킷 설정
    private static final String BUCKET_NAME = "roadscanner-bucket";

    public static void uploadFile(File fileToUpload, String fileKey) throws IOException {
        S3Client s3Client = S3Client.builder()
                                    .region(Region.of(REGION))
                                    .credentialsProvider(StaticCredentialsProvider.create(
                                            AwsBasicCredentials.create(ACCESS_KEY, SECRET_KEY)
                                    ))
                                    .build();

        try {
            PutObjectRequest request = PutObjectRequest.builder()
                                                       .bucket(BUCKET_NAME)
                                                       .key(fileKey)
                                                       .build();

            s3Client.putObject(request, fileToUpload.toPath());
            System.out.println("File upload Success!");
        } catch (S3Exception e) {
            System.err.println("Error: " + e.getMessage());
            throw e; // 업로드 실패 시 예외를 발생시킵니다. 이후 컨트롤러에서 예외 처리 가능
        } finally {
            s3Client.close(); // 클라이언트 리소스 정리
        }
    }

}
