package ru.ezhov;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@RestController
@RequestMapping("/")
public class TestController {
    @GetMapping
    public String text() throws IOException {
        return new String(Files.readAllBytes(new File("text.txt").toPath()));
    }
}
