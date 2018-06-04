package com.demo.dao;

import java.util.List;

import org.hibernate.Criteria;

import com.demo.model.OrderHistory;
import com.demo.model.TicketHistory;
import com.demo.model.Tickets;

public interface TicketHistoryDaoInt {
	void insertTicketHistory(Tickets ticket);
	List<TicketHistory> getHistoryByTicketNumber(Long ticketNumber);
	
	List<TicketHistory> getAllTicketHistoryByTicketNumber();
}