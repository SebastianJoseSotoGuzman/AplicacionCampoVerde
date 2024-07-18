package com.cv.model.entity;


import java.text.SimpleDateFormat;
import java.util.Date;

public class Message {

    private String user;
    private String message;
    private long timestamp;
    private String fileName;

    public Message(String user, String message, long timestamp, String fileName) {
        this.user = user;
        this.message = message;
        this.timestamp = timestamp;
        this.fileName = fileName;
    }

    public String getUser() {
        return user;
    }

    public String getMessage() {
        return message;
    }

    public long getTimestamp() {
        return timestamp;
    }

    public String getFileName() {
        return fileName;
    }

    public String getFormattedTimestamp() {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        return sdf.format(new Date(timestamp));
    }

    public String getFileUrl() {
        if (fileName != null) {
            return "uploads/" + fileName;
        }
        return null;
    }

}
