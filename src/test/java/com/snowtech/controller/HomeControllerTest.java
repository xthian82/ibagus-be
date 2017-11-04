package com.snowtech.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import com.snowtech.config.App;

@RunWith(SpringRunner.class)
@AutoConfigureMockMvc
@SpringBootTest
public class HomeControllerTest {
	
	@Autowired
	private MockMvc mockMvc;

	@Autowired
	private App app;
	
	@Test
	public void getDescription() throws Exception {
		mockMvc.perform(get("/")).andExpect(status().isOk()).andExpect(content().string(app.getDescription()));
	}

	@Test
	public void getVersion() throws Exception {
		mockMvc.perform(get("/version")).andExpect(status().isOk())
				.andExpect(content().string(app.getVersion()));
	}
}
