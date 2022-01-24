package com.br.projeto.usuario.controller;

import com.br.projeto.achados.models.AchadoEntity;
import com.br.projeto.usuario.models.SenhaModel;
import com.br.projeto.usuario.models.UsuarioEntity;
import com.br.projeto.usuario.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

@Controller
@RequestMapping
public class UsuarioController {
    @Autowired
    private UsuarioService usuarioService;

    @RequestMapping("/dadosUsuario")
    public ModelAndView dadosUsuario(HttpServletRequest request) throws UnsupportedEncodingException {
        HttpSession session = request.getSession();
        Long idUsuario = (Long) session.getAttribute("idUsuario");

        UsuarioEntity usuarioEntity = usuarioService.buscarPorId(idUsuario);

        ModelAndView modelAndView = new ModelAndView("perfil");
        modelAndView.addObject("value", usuarioEntity);

        return modelAndView;
    }

    @GetMapping("/editarUsuario")
    public ModelAndView editar(HttpServletRequest request) throws UnsupportedEncodingException {
        HttpSession session = request.getSession();
        Long idUsuario = (Long) session.getAttribute("idUsuario");

        UsuarioEntity usuarioEntity = usuarioService.buscarPorId(idUsuario);

        ModelAndView modelAndView = new ModelAndView("alterarPerfil");
        modelAndView.addObject("value", usuarioEntity);

        return modelAndView;
    }

    @PostMapping("/editarUsuario")
    public String editar2(@ModelAttribute("achado") UsuarioEntity usuarioEntity, @RequestParam(value = "files", required = false) MultipartFile[] files, HttpServletRequest request) throws IOException {
        HttpSession session = request.getSession();
        Long idUsuario = (Long) session.getAttribute("idUsuario");

        usuarioEntity.setId(idUsuario);

        usuarioService.atualizar(usuarioEntity, files);

        return "redirect:/dadosUsuario";
    }

    @RequestMapping("/excluirUsuario")
    public String excluir(HttpServletRequest request) {
        HttpSession session = request.getSession();
        Long idUsuario = (Long) session.getAttribute("idUsuario");

        usuarioService.excluirCadastros(idUsuario);

        return "redirect:/logout";
    }

    @RequestMapping("/editarSenha")
    public ModelAndView editarSenha() {
        return new ModelAndView("alterarSenha");
    }

    @PostMapping("/editarSenha")
    public String alterarSenha(Model model, @ModelAttribute("senha") SenhaModel senhaModel, HttpServletRequest request) throws UnsupportedEncodingException {
        HttpSession session = request.getSession();
        Long idUsuario = (Long) session.getAttribute("idUsuario");

        try {
            String resultado = usuarioService.alterarSenha(senhaModel, idUsuario);

            UsuarioEntity usuarioEntity = usuarioService.buscarPorId(idUsuario);

            model.addAttribute("message", resultado);
            model.addAttribute("value", usuarioEntity);

            return "perfil";
        } catch (Exception e) {
            model.addAttribute("message", e.getMessage());

            return "alterarSenha";
        }
    }
}
