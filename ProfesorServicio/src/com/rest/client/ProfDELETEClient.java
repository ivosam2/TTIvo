package com.rest.client;

import com.rest.profesor.model.Profesor;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

public class ProfDELETEClient {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Client client = Client.create();
		WebResource webresource = client.resource("http://localhost:8080/ProfesorServicio/rest/prof/delete/100");
		
		ClientResponse response = webresource.type("application/xml").delete(ClientResponse.class);
		
		System.out.println("Delete Operation Response Processing...");
		String output = response.getEntity(String.class);
		System.out.println(output);

	}

}
