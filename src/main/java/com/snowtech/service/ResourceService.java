package com.snowtech.service;

import com.snowtech.entity.Document;
import com.snowtech.repository.CategoryRepository;
import com.snowtech.repository.DocumentRepository;
import java.io.IOException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
@Slf4j
public class ResourceService {

    @Autowired
    private DocumentRepository documentRepository;

    @Autowired
    private CategoryRepository categoryRepository;

    public void saveFiles(MultipartFile[] uploadingFiles, Integer categoryId) throws IOException {
        for (MultipartFile uploadedFile : uploadingFiles) {
            log.info("UpLoading File '{}'", uploadedFile.getOriginalFilename());
            Document uploadFile = new Document();
            uploadFile.setFileName(uploadedFile.getOriginalFilename());
            uploadFile.setData(uploadedFile.getBytes());
            uploadFile.setCategory(categoryRepository.getOne(categoryId));
            documentRepository.save(uploadFile);

        }
    }

    public Document loadFromResource(String filename) {
        return documentRepository.findByFileName(filename);
    }
}
