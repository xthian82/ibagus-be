package com.snowtech.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
public class Document {

    @Id
    @GeneratedValue
    private Long id;

    @Column(nullable = false)
    private String fileName;

    @Column(nullable = false, columnDefinition = "longblob")
    private byte[] data;

    @ManyToOne
    private Category category = new Category();

}
