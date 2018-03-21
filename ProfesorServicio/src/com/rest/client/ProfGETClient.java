package com.rest.client;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

public class ProfGETClient {
	public static void main(String[] args) {
		Client client = Client.create();
		WebResource webresource = client.resource("http://localhost:8080/ProfesorServicio/rest/prof/get/100");
		
		ClientResponse response = webresource.type("application/xml").get(ClientResponse.class);
		
		System.out.println("Get Operation Response Processing...");
		String output = response.getEntity(String.class);
		System.out.println(output);
	}
}
