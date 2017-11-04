package com.snowtech.controller;

import com.snowtech.config.Constants;
import com.snowtech.entity.Document;
import com.snowtech.service.ResourceService;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping(Constants.ApiVersionV1 + "/resource")
class ResourceController {

    @Autowired
    private ResourceService resourceService;

    @PostMapping("/{categoryId}")
    public void uploadingPost(@PathVariable Integer categoryId, @RequestParam MultipartFile[] uploadingFiles)
            throws IOException {
        resourceService.saveFiles(uploadingFiles, categoryId);
    }

    @GetMapping("/{categoryId}/files/{filename:.+}")
    @ResponseBody
    public ResponseEntity<Resource> serveFile(@PathVariable String filename) {
        Document document = resourceService.loadFromResource(filename);

        ByteArrayResource file = new ByteArrayResource(document.getData());

        return ResponseEntity
                .ok()
                .contentLength(file.contentLength())
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + document.getFileName() + "\"")
                .contentType(MediaType.parseMediaType("application/octet-stream"))
                .body(file);
    }
}
