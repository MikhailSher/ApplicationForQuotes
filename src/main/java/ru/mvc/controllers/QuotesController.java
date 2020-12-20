package ru.mvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ru.mvc.models.Quote;
import ru.mvc.repositories.QuotesRepository;
import ru.mvc.repositories.UsersRepository;

import javax.servlet.http.HttpSession;

/**
 * 20.12.2020
 * QuotesController
 *
 * @author Sherstobitov Mikhail
 * @version v1.0
 */
@Controller
public class QuotesController {

    @Autowired
    HttpSession httpSession;
    @Autowired
    private QuotesRepository quotesRepository;
    @Autowired
    private UsersRepository usersRepository;

    @RequestMapping(path = "/quotes", method = RequestMethod.POST)
    public String changeScore(long id,String score) {
        Quote quote = quotesRepository.findCarById(id);
        if(quote.getAuthor().getLogin().equals(httpSession.getAttribute("person"))){
            httpSession.setAttribute("error","You cannot vote for your quotes");
            return "redirect:/error";
        }

        if (score.equals("+")){
            quote.setScore(quote.getScore()+1);
        }
        else{
            quote.setScore(quote.getScore()-1);
        }
        quotesRepository.save(quote);
        return "redirect:/";
    }
    @RequestMapping(path = "/saveQuote", method = RequestMethod.POST)
    public String saveQuot(@RequestParam(required = false, name = "id") String id,String quot,HttpSession httpSession) {
        Quote quote =new Quote();
        if (id != null) {
            quote = quotesRepository.findCarById(Integer.parseInt(id));
            quote.setQuot(quot);
            quote.setScore(0);

        } else {
            quote.setScore(0);
            quote.setQuot(quot);
            quote.setAuthor(usersRepository.findAllByLogin((String)httpSession.getAttribute("person")).get(0));
        }
        if(quotesRepository.findCarByQuot(quot) == null){
            quotesRepository.save(quote);
        }
        else {
            httpSession.setAttribute("error","Quote is already in the system");
            return "redirect:/error";
        }
        return "redirect:/myQuotes";
    }
    @RequestMapping(path = "/delete", method = RequestMethod.POST)
    public String delete(@RequestParam(name = "id") String id) {
        quotesRepository.delete((long) Integer.parseInt(id));
        return "redirect:/myQuotes";
    }

}
