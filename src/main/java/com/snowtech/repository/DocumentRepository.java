package com.snowtech.repository;

import com.snowtech.entity.Document;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

@Component
public interface DocumentRepository extends JpaRepository<Document, Integer> {

    Document findByFileName(String filename);

}
