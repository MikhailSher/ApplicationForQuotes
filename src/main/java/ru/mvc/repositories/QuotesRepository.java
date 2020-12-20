package ru.mvc.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import ru.mvc.models.Quote;

import java.util.List;

/**
 * 20.12.2020
 * QuotesRepository
 *
 * @author Sherstobitov Mikhail
 * @version v1.0
 */
public interface QuotesRepository extends JpaRepository<Quote, Long> {
    List<Quote> findAllByAuthor_LoginOrderByScoreDesc(String login);
    Quote findCarById(long id);
    List<Quote> findAllByOrderByScoreDesc();
    Quote findCarByQuot(String quot);

    @Query("select quere.id from #{#entityName} quere")
    List<Long> findAllId();
}