package com.rest.client;

import com.rest.profesor.model.Profesor;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

public class ProfPUTClient {
	public static void main(String[] args) {
		Client client = Client.create();
		WebResource webresource = client.resource("http://localhost:8080/ProfesorServicio/rest/prof/update");
		
		Profesor profesor = new Profesor();
		profesor.setProfID("123");
		profesor.setName("Angeles Cerritos");
		profesor.setEmail("losan@gmail.com");
		
		ClientResponse response = webresource.type("application/xml").put(ClientResponse.class, profesor);
		
		System.out.println("Put Operation Response Processing...");
		String output = response.getEntity(String.class);
		System.out.println(output);
	}
}
