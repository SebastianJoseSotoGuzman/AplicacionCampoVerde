package com.cv.controller;
/*
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONException;

import org.json.JSONObject;

@WebServlet("/ConsultaDniServlet")
public class ConsultaDniServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String dni = request.getParameter("dni");
        String jsonResponse = null;

        if (dni == null || dni.trim().isEmpty() || dni.length() != 8) {
            JSONObject errorJson = new JSONObject();
            try {
                errorJson.put("error", "El DNI debe tener exactamente 8 dígitos");
            } catch (JSONException ex) {
                Logger.getLogger(ConsultaDniServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            jsonResponse = errorJson.toString();
        } else {
            try {
                jsonResponse = consultarDni(dni);
            } catch (JSONException ex) {
                Logger.getLogger(ConsultaDniServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        out.print(jsonResponse);
    }

    private String consultarDni(String dni) throws IOException, JSONException {
        // String apiUrl = "https://api.apis.net.pe/v1/dni?numero=" + dni;
        String apiUrl = "https://apiperu.dev/api/dni/" + dni + "?api_token=fa1abbdf9e5d072c51295d6b13192d6035f864966ecfb1b73eb4b687374f3fa5";
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");

        int responseCode = connection.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) {
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
            return response.toString();
        } else {
            JSONObject errorJson = new JSONObject();
            errorJson.put("error", "No se pudo consultar el DNI");
            return errorJson.toString();
        }
    }
}
*/
