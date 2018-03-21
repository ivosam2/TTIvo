package com.rest.client;

import com.rest.profesor.model.Profesor;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

public class ProfPOSTClient {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Client client = Client.create();
		WebResource webresource = client.resource("http://localhost:8080/ProfesorServicio/rest/prof/create");
		
		Profesor profesor = new Profesor();
		profesor.setProfID("123");
		profesor.setName("Ivo Sano");
		profesor.setEmail("ivosam2@gmail.com");
		
		
		
		ClientResponse response = webresource.type("application/xml").post(ClientResponse.class, profesor);
		
		System.out.println("Create Operation Response Processing...");
		String output = response.getEntity(String.class);
		System.out.println(output);

	}

}
