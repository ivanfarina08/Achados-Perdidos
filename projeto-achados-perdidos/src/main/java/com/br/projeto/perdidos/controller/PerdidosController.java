package com.br.projeto.perdidos.controller;

import com.br.projeto.perdidos.models.PerdidosEntity;
import com.br.projeto.perdidos.service.PerdidosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping
public class PerdidosController {
    @Autowired
    private PerdidosService perdidosService;

    @GetMapping("/cadastroPerdido")
    public String cadastroAchado(){
        return "cadastroAchado";
    }

    @PostMapping("/cadastroPerdido")
    public String cadastrar(@ModelAttribute("perdido") PerdidosEntity perdidosEntity, @RequestParam MultipartFile[] files) throws IOException {
        perdidosService.salvar(perdidosEntity, files);

        return "redirect:/listarPerdidos";
    }

    @RequestMapping("/listarPerdidos")
    public ModelAndView meusAchados() throws UnsupportedEncodingException {
        List<PerdidosEntity> perdidos = perdidosService.findAll();

        ModelAndView modelAndView = new ModelAndView("meusPerdidos");
        modelAndView.addObject("perdidos", perdidos);

        return modelAndView;
    }

    @GetMapping("/visualizarPerdido")
    public ModelAndView vizualizarAchado(@RequestParam("idPerdido") Long idAchado) throws Exception {
        PerdidosEntity perdidosEntity = perdidosService.buscar(idAchado);

        ModelAndView modelAndView = new ModelAndView("visualizarPerdido");
        modelAndView.addObject("value", perdidosEntity);

        return modelAndView;
    }

    @GetMapping("/editarPerdido")
    public ModelAndView editarAchado(@RequestParam("idPerdido") Long idAchado) throws Exception {
        PerdidosEntity perdido = perdidosService.buscar(idAchado);

        ModelAndView modelAndView = new ModelAndView("editarPerdido");
        modelAndView.addObject("value", perdido);

        return modelAndView;
    }

    @PostMapping("/editarPerdido")
    public String atualizar(@ModelAttribute("perdido") PerdidosEntity perdidosEntity, @RequestParam(value = "files", required = false) MultipartFile[] files) throws Exception {
        perdidosService.atualizar(perdidosEntity, files);

        return "redirect:/listarPerdidos";
    }

    @GetMapping("/excluirPerdido")
    public String excluir(@RequestParam("idPerdido") Long idAchado) {
        perdidosService.excluir(idAchado);

        return "redirect:/listarPerdidos";
    }
}
