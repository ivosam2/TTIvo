package com.rest.profesor.model;

import java.net.URISyntaxException;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/prof")
public class ProfesorServicio {
	
	@GET
	@Path("/get/{profID}")
	@Produces(MediaType.APPLICATION_XML)
	public Profesor getProfesor(@PathParam("profID") String profID) {
		Profesor profesor = new Profesor();
		profesor.setProfID(profID);
		profesor.setName("Alexis Osnaya");
		profesor.setEmail("alexis.osnaya.ipn@gmail.com");
		return profesor;
	}
	
	@POST
	@Path("/create")
	@Consumes(MediaType.APPLICATION_XML)
	@Produces(MediaType.APPLICATION_XML)
	public Profesor createUser(Profesor profesor) {
		profesor.setName(profesor.getName() + " created");

		return profesor;
	}
	
	@PUT
	@Path("/update")
	@Consumes(MediaType.APPLICATION_XML)
	@Produces(MediaType.APPLICATION_XML)
	public Profesor UpdateProfesor(Profesor profesor) {
		
		profesor.setName(profesor.getName() + "updated");
		
		return profesor;
	}
	
	@DELETE
	@Path("/delete/{profID}")
	public Response deleteProfesor(@PathParam("profID") int profID) throws URISyntaxException {
	return Response.status(200).entity("Profesor con " + profID + " fue borrado satisfactoriamente.").build();
	}
	
	
	
	
}
