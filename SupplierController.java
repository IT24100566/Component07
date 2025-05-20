package com.ismysystem.inventorystocksystem.Controller;

import com.ismysystem.inventorystocksystem.Model.Supplier;
import com.ismysystem.inventorystocksystem.Service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/supplier")
public class SupplierController {

    private final SupplierService supplierService;

    @Autowired
    public SupplierController(SupplierService supplierService) {
        this.supplierService = supplierService;
    }

    @GetMapping("/list")
    public String listSuppliers(Model model) {
        model.addAttribute("suppliers", supplierService.getAllSuppliers());
        return "Component07/listSuppliers";
    }

    @GetMapping("/add")
    public String showAddSupplierForm(Model model) {
        model.addAttribute("supplier", new Supplier());
        return "Component07/addSupplier";
    }

    @PostMapping("/add")
    public String addSupplier(@ModelAttribute Supplier supplier, Model model) {
        supplierService.addSupplier(supplier);
        model.addAttribute("success", "Supplier added successfully.");
        return "redirect:/supplier/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditSupplierForm(@PathVariable Long id, Model model) {
        Supplier supplier = supplierService.getSupplierById(id);
        if (supplier == null) {
            model.addAttribute("error", "Supplier not found.");
            return "redirect:/supplier/list";
        }
        model.addAttribute("supplier", supplier);
        return "Component07/updateSupplier";
    }

    @PostMapping("/edit")
    public String updateSupplier(@ModelAttribute Supplier supplier, Model model) {
        supplierService.updateSupplier(supplier);
        model.addAttribute("success", "Supplier updated successfully.");
        return "redirect:/supplier/list";
    }

    @PostMapping("/delete/{id}")
    public String deleteSupplier(@PathVariable Long id, Model model) {
        supplierService.deleteSupplier(id);
        model.addAttribute("success", "Supplier deleted successfully.");
        return "redirect:/supplier/list";
    }
}