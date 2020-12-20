package ru.mvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ru.mvc.models.Quote;
import ru.mvc.repositories.QuotesRepository;
import ru.mvc.repositories.UsersRepository;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 20.12.2020
 * ControllerForQuotesList
 *
 * @author Sherstobitov Mikhail
 * @version v1.0
 */
@Controller
public class ControllerForQuotesList {

    @Autowired
    HttpSession httpSession;
    @Autowired
    private UsersRepository usersRepository;
    @Autowired
    private QuotesRepository quotesRepository;

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public ModelAndView user() {

        List<Quote> quotes = null;
        quotes = quotesRepository.findAllByOrderByScoreDesc();
        if(quotes.size()!=0& quotes.size()<10){
           quotes = quotes.subList(0, quotes.size());
        }
        else if (quotes.size()>=10) {
            quotes = quotes.subList(0,10);
        }
        ModelAndView modelAndView = new ModelAndView();

        if (httpSession.getAttribute("person")==null||httpSession.getAttribute("person").equals("NUll")){
            httpSession.setAttribute("person", "NUll" );
            modelAndView.setViewName("index");
        }
        else{
            modelAndView.setViewName("users");
            modelAndView.addObject("user",httpSession.getAttribute("person"));
        }
        modelAndView.addObject("quotes", quotes);

        List<Long>allId= quotesRepository.findAllId();
        long qty = quotesRepository.count();
        int id = (int) (Math.random() * (qty - 1) + 1);
        Quote quote = quotesRepository.findCarById( allId.get(id));
        modelAndView.addObject("random", quote.getQuot());
        return modelAndView;
    }
    @RequestMapping(path = "/allQuotes", method = RequestMethod.GET)
    public ModelAndView allQuotes() {
        List<Quote> quotes = null;
        quotes = quotesRepository.findAllByOrderByScoreDesc();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("allQuotes");
        modelAndView.addObject("quotes", quotes);
        return modelAndView;
    }
    @RequestMapping(path = "/myQuotes", method = RequestMethod.GET)
    public ModelAndView myQuotes() {
        List<Quote> quotes = null;
        quotes = quotesRepository.findAllByAuthor_LoginOrderByScoreDesc((String) httpSession.getAttribute("person"));
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("myQuotes");
        modelAndView.addObject("quotes", quotes);
        return modelAndView;
    }
}
