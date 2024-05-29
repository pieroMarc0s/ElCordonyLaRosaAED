package org.example.model;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "Orden")
public class Pedido {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long ordenId;

    private Long idCliente;

    private Long empleadoId;

    private Long platosId;

    private LocalDateTime fechaOrden;

    private Double cantidadTotal;
}