package ru.mvc.models;

import lombok.*;

import javax.persistence.*;

/**
 * 20.12.2020
 * Quote
 *
 * @author Sherstobitov Mikhail
 * @version v1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = "author")
@Entity
@Table(name = "quots")
public class Quote {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String quot;
    private Integer score;

    @ManyToOne
    @JoinColumn(name = "author")
    private User author;
}
