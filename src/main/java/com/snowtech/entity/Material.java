package com.snowtech.entity;

import java.math.BigDecimal;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Size;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
public class Material {

    @GeneratedValue
    @Id
    private Long id;

    @Size(min=3, max = 255)
    @Column(nullable = false, unique = true)
    private String descripcion;

    @Column
    private BigDecimal precio;

    @ManyToOne
    private Medida medida = new Medida();
}
