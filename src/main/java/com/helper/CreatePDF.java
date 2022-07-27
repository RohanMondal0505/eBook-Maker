package com.helper;

import java.io.FileOutputStream;

import com.entities.Book;
import com.entities.User;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

public class CreatePDF {

	public static String create(Book book, User user, String path) {

		String filename = book.getBookTitle() + "-" + book.getBookId() + ".pdf";

		try {

			Document document = new Document();
			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(path + filename));
			
			document.open();
			
			Font f1 = new Font(Font.FontFamily.TIMES_ROMAN, 25.0f, Font.BOLD, BaseColor.BLACK);
			Font f2 = new Font(Font.FontFamily.TIMES_ROMAN, 18.1f, Font.BOLDITALIC, BaseColor.BLACK);
			Font f3 = new Font(Font.FontFamily.TIMES_ROMAN, 12.0f, Font.BOLDITALIC, BaseColor.GRAY);
			Font f4 = new Font(Font.FontFamily.TIMES_ROMAN, 12.0f, Font.BOLDITALIC, BaseColor.LIGHT_GRAY);
			Font f5 = new Font(Font.FontFamily.TIMES_ROMAN);
			
			Chunk c1 = new Chunk(book.getBookTitle(), f1);
			Chunk c2 = new Chunk("Subject : "+book.getBookSubject(), f2);
			Chunk c3 = new Chunk("Author Name : "+user.getUserName(), f3);
			Chunk c4 = new Chunk("Date : "+book.getBookCreateDate(), f4);
			Chunk c5 = new Chunk("    "+book.getBookContent(), f5);
			
			Paragraph paragraph1 = new Paragraph(c1);
			Paragraph paragraph2 = new Paragraph(c2);
			Paragraph paragraph3 = new Paragraph(c3);
			Paragraph paragraph4 = new Paragraph(c4);
			Paragraph paragraph5 = new Paragraph(c5);
			
			paragraph1.setSpacingAfter(15);
			paragraph2.setSpacingAfter(10);
			paragraph3.setSpacingAfter(15);
			paragraph4.setSpacingAfter(15);
			paragraph5.setSpacingBefore(15);

			paragraph1.setAlignment(Element.ALIGN_CENTER);
			paragraph2.setAlignment(Element.ALIGN_CENTER);
			paragraph3.setAlignment(Element.ALIGN_CENTER);
			paragraph4.setAlignment(Element.ALIGN_RIGHT);
			paragraph5.setAlignment(Element.ALIGN_LEFT);
			

			
			document.add(paragraph1);
			document.add(paragraph2);
			document.add(paragraph3);
			document.add(paragraph4);
			document.add(paragraph5);
			
			

			
			document.close();
			writer.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return filename;

	}

}