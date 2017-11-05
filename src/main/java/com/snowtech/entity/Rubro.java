package com.snowtech.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.Size;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
public class Rubro {

    @GeneratedValue
    @Id
    private Integer id;

    @Size(min=3, max = 255)
    @Column(nullable = false, unique = true)
    private String descripcion;

}
