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
import boutique.Boutique;

import exception.BoutiqueException;
import service.BoutiqueService;


@RestController
@RequestMapping("/api/listeBoutique")
public class listBoutique_RestController {

	@Autowired
	private BoutiqueService boutiqueService;
	
	//List des Boutiques	
	@JsonView(JsonViews.Common.class)
	@GetMapping("")
	public List<Boutique> getAll() {
		return boutiqueService.getAll();
	}
	
	//Boutiques par Id
	@JsonView(JsonViews.Common.class)
	@GetMapping("/{id}")
	public Boutique getById(@PathVariable Integer id) {
		return boutiqueService.getById(id);
	}
	//Cr�er ou mettre � jour	
	private Boutique createOrUpdate(Boutique boutique, BindingResult br) {
		if (br.hasErrors()) {
			throw new BoutiqueException();
		}
		return boutiqueService.save(boutique);
	}
	
	//Cr�er un �l�ve	
	@JsonView(JsonViews.Common.class)
	@PostMapping("")
	@ResponseStatus(code = HttpStatus.CREATED)
	public Boutique create(@Valid @RequestBody Boutique Boutique, BindingResult br) {
		return createOrUpdate(Boutique, br);
	}
	
	//Mettre � jour
	@JsonView(JsonViews.Common.class)
	@PutMapping("/{id}")
	public Boutique update(@PathVariable Integer id, @Valid @RequestBody Boutique Boutique, BindingResult br) {
		Boutique.setId(id);
		return createOrUpdate(Boutique, br);
	}
	
	
	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	@DeleteMapping("/{id}")
	public void delete(@PathVariable Integer id) {
		boutiqueService.delete(id);
	}
	
}
