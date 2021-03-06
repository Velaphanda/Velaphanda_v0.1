package com.demo.reports;

import java.util.HashMap;
import java.util.Map;

import net.sf.jasperreports.engine.JRDataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.demo.service.TicketHistoryInt;
import com.demo.service.TicketsServiceInt;


@Controller
public class TicketDetailsReport {
	
	protected static Logger logger = Logger.getLogger("controller");
	@Autowired
	private TicketHistoryInt ticketHistoryInt;
	
	@Autowired
	private TicketsServiceInt ticketsServiceInt;

    @RequestMapping(value = "/ticketDownloadPDF", method = RequestMethod.GET)
    public ModelAndView doTicketDetailsReportPDF(@RequestParam("recordID") Long recordID) 
		 {
    	logger.debug("Received request to download PDF report");
		ModelAndView modelAndView = null;
		// Retrieve our data from a custom data provider
		// Our data comes from a DAO layer
		
		// Assign the datasource to an instance of JRDataSource
		// JRDataSource is the datasource that Jasper understands
		// This is basically a wrapper to Java's collection classes
		JRDataSource ticketDetails  = ticketsServiceInt.getTicketDetailsDataSource(recordID);
		
		// In order to use Spring's built-in Jasper support, 
		// We are required to pass our datasource as a map parameter
		// parameterMap is the Model of our application
		Map<String,Object> parameterMap = new HashMap<String,Object>();
		parameterMap.put("ticketDetialsDatasource",ticketDetails);
		
		// pdfReport is the View of our application
		// This is declared inside the /WEB-INF/jasper-views.xml
		modelAndView = new ModelAndView("ticketDetialsPdfReport", parameterMap);
		
		// Return the View and the Model combined
		return modelAndView;
	}

}
