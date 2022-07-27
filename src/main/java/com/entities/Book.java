package com.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Book {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "book_id")
	private int bookId;
	@Column(name = "book_title")
	private String bookTitle;
	@Column(name = "book_subject")
	private String bookSubject;
	@Column(columnDefinition = "text", name = "book_content")
	private String bookContent;
	@Column(name = "book_author_id")
	private int bookAuthorId;
	@Column(name = "book_publish")
	private boolean bookPublish;
	@Column(name = "book_user")
	private boolean bookUser;
	@Column(name = "book_create_date")
	private Date bookCreateDate;

	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Book(String bookTitle, String bookSubject, String bookContent, int bookAuthorId, boolean bookPublish,
			boolean bookUser, Date bookCreateDate) {
		super();
		this.bookTitle = bookTitle;
		this.bookSubject = bookSubject;
		this.bookContent = bookContent;
		this.bookAuthorId = bookAuthorId;
		this.bookPublish = bookPublish;
		this.bookUser = bookUser;
		this.bookCreateDate = bookCreateDate;
	}

	public Book(int bookId, String bookTitle, String bookSubject, String bookContent, int bookAuthorId,
			boolean bookPublish, boolean bookUser, Date bookCreateDate) {
		super();
		this.bookId = bookId;
		this.bookTitle = bookTitle;
		this.bookSubject = bookSubject;
		this.bookContent = bookContent;
		this.bookAuthorId = bookAuthorId;
		this.bookPublish = bookPublish;
		this.bookUser = bookUser;
		this.bookCreateDate = bookCreateDate;
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public String getBookSubject() {
		return bookSubject;
	}

	public void setBookSubject(String bookSubject) {
		this.bookSubject = bookSubject;
	}

	public String getBookContent() {
		return bookContent;
	}

	public void setBookContent(String bookContent) {
		this.bookContent = bookContent;
	}

	public int getBookAuthorId() {
		return bookAuthorId;
	}

	public void setBookAuthorId(int bookAuthorId) {
		this.bookAuthorId = bookAuthorId;
	}

	public boolean isBookPublish() {
		return bookPublish;
	}

	public void setBookPublish(boolean bookPublish) {
		this.bookPublish = bookPublish;
	}

	public boolean isBookUser() {
		return bookUser;
	}

	public void setBookUser(boolean bookUser) {
		this.bookUser = bookUser;
	}

	public Date getBookCreateDate() {
		return bookCreateDate;
	}

	public void setBookCreateDate(Date bookCreateDate) {
		this.bookCreateDate = bookCreateDate;
	}

	@Override
	public String toString() {
		return "Book [bookId=" + bookId + ", bookTitle=" + bookTitle + ", bookSubject=" + bookSubject + ", bookContent="
				+ bookContent + ", bookAuthorId=" + bookAuthorId + ", bookPublish=" + bookPublish + ", bookUser="
				+ bookUser + ", bookCreateDate=" + bookCreateDate + "]";
	}

}
