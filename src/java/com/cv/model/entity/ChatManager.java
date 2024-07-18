
package com.cv.model.entity;


import java.util.ArrayList;
import java.util.List;

public class ChatManager {
    private static final List<Message> messages = new ArrayList<>();

    public static synchronized void addMessage(Message message) {
        messages.add(message);
    }

    public static synchronized List<Message> getMessages() {
        return new ArrayList<>(messages);
    }
}
