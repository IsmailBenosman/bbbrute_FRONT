package restcontroller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.annotation.JsonView;

import Json.JsonViews;

import exception.ProduitException;
import produit.Produit;
import service.ProduitService;

@RestController
@RequestMapping("/api/listeProduit")
public class listProduit_RestController {

	@Autowired
	private ProduitService produitService;
	
	//List des Produits	
	@JsonView(JsonViews.Common.class)
	@GetMapping("")
	public List<Produit> getAll() {
		return produitService.getAll();
	}
	
	//Produits par Id
	@JsonView(JsonViews.Common.class)
	@GetMapping("/{id}")
	public Produit getById(@PathVariable Integer id) {
		return produitService.getById(id);
	}
	//Cr�er ou mettre � jour	
	private Produit createOrUpdate(Produit produit, BindingResult br) {
		if (br.hasErrors()) {
			throw new ProduitException();
		}
		return produitService.save(produit);
	}
	
	//Cr�er un �l�ve	
	@JsonView(JsonViews.Common.class)
	@PostMapping("")
	@ResponseStatus(code = HttpStatus.CREATED)
	public Produit create(@Valid @RequestBody Produit produit, BindingResult br) {
		return createOrUpdate(produit, br);
	}
	
	//Mettre � jour
	@JsonView(JsonViews.Common.class)
	@PutMapping("/{id}")
	public Produit update(@PathVariable Integer id, @Valid @RequestBody Produit produit, BindingResult br) {
		produit.setId(id);
		return createOrUpdate(produit, br);
	}
	
	
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	@DeleteMapping("/{id}")
	public void delete(@PathVariable Integer id) {
		produitService.deleteById(id);
	}
	
}
