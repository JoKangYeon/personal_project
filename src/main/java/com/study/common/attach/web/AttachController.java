package com.study.common.attach.web;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@Controller
public class AttachController {

    @RequestMapping("attach/showImg.wow")
    public ResponseEntity<byte[]> showIng(@RequestParam(value = "fileName", required = false) String fileName, String filePath) throws IOException {
        System.out.println("============>" + fileName);
        System.out.println("============>" +filePath);
        File file = new File(filePath, fileName);
        // if (img인지 아닌지 확인해야하긴함..)
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", Files.probeContentType(file.toPath()));
        ResponseEntity<byte[]> result = new ResponseEntity<>(FileUtils.readFileToByteArray(file),headers, HttpStatus.OK);

        return result;
    }
}
