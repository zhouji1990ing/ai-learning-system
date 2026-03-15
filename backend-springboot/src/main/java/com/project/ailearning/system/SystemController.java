package com.project.ailearning.system;

import com.project.ailearning.common.api.ApiResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.OffsetDateTime;
import java.util.Map;

@RestController
@RequestMapping("/api/system")
public class SystemController {

    @GetMapping("/health")
    public ApiResponse<Map<String, Object>> health() {
        return ApiResponse.ok(Map.of(
                "service", "backend-springboot",
                "status", "UP",
                "timestamp", OffsetDateTime.now()
        ));
    }
}