package com.br.projeto.achados.controller;

import com.br.projeto.achados.models.AchadoEntity;
import com.br.projeto.achados.service.AchadoService;
import org.apache.tomcat.util.codec.binary.Base64;
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
public class AchadoController {
    @Autowired
    private AchadoService achadoService;

    @GetMapping("/cadastroAchado")
    public String cadastroAchado(){
        return "cadastroAchado";
    }

    @PostMapping("/cadastroAchado")
    public String cadastrar(@ModelAttribute("usuarioEntrada") AchadoEntity achadoEntity, @RequestParam MultipartFile[] files) throws IOException {
        achadoService.salvar(achadoEntity, files);

        return "redirect:/meusAchados";
    }

    @GetMapping("/meusAchados")
    public ModelAndView meusAchados() throws UnsupportedEncodingException {
        List<AchadoEntity> achados = achadoService.findAll();

        ModelAndView modelAndView = new ModelAndView("meusAchados");
        modelAndView.addObject("achados", achados);

        return modelAndView;
    }

    @GetMapping("/visualizarAchado")
    public ModelAndView vizualizarAchado(@RequestParam("idAchado") Long idAchado) throws Exception {
        AchadoEntity achado = achadoService.buscar(idAchado);

        byte[] encodeBase64 = Base64.encodeBase64(achado.getImagem().getData());
        String base64Encoded = new String(encodeBase64, "UTF-8");

        ModelAndView modelAndView = new ModelAndView("visualizarAchado");
        modelAndView.addObject("value", achado);
        modelAndView.addObject("imagem", base64Encoded);

        return modelAndView;
    }

    @GetMapping("/editarAchado")
    public ModelAndView editarAchado(@RequestParam(value = "idAchado", required = false) Long idAchado) throws Exception {
        AchadoEntity achado = achadoService.buscar(idAchado);

        ModelAndView modelAndView = new ModelAndView("editarAchado");
        modelAndView.addObject("value", achado);

        return modelAndView;
    }

    @PostMapping("/editarAchado")
    public String atualizar(@ModelAttribute("achado") AchadoEntity achadoEntity, @RequestParam(value = "files", required = false) MultipartFile[] files) throws Exception {
        achadoService.atualizar(achadoEntity, files);

        return "redirect:meusAchados";
    }

    @GetMapping("/excluirAchado")
    public String excluir(@RequestParam("idAchado") Long idAchado) throws Exception {
        achadoService.excluir(idAchado);

        return "redirect:meusAchados";
    }
}
