package main.controller;

import main.model.Property;
import main.service.StorageService;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/property")
public class PropertyController {

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getProperty(@PathParam("id") String id) {
        Property property = StorageService.getProperty(id);
        if (property != null)
            return Response.status(200).entity(property).build();
        else
            return Response.status(404).build();

    }

    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    public Response createProperty(Property property) {
        return Response.status(201).entity(StorageService.createProperty(property)).build();
    }
}
