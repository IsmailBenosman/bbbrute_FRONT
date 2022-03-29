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

import Json.JsonViews.Common;
import Json.JsonViews.EvenementWithEleves;
import event.Evenement;
import exception.EvenementException;
import service.EvenementService;

@RestController
@RequestMapping("/api/listeEvent")
public class listEvent_RestController {

	@Autowired
	private EvenementService evenementService;

	//liste des evenements
	@GetMapping("")
	public List<Evenement> getAll() {
		return evenementService.getAll();
	}

	//liste des evenements avec les eleves en plus
	@JsonView(EvenementWithEleves.class)
	@GetMapping("")
	public List<Evenement> getAllEventWithEleves() {
		return evenementService.getAll();
	}

	// trouver un event avec id
	@JsonView(Common.class)
	@GetMapping("/{id}")
	public Evenement getById(@PathVariable Integer id) {
		return evenementService.getById(id);
	}

	@ResponseStatus(code = HttpStatus.NO_CONTENT)
	@DeleteMapping("/{id}")
	public void delete(@PathVariable Integer id) {
		evenementService.delete(id);
	}

	@ResponseStatus(code = HttpStatus.CREATED)
	@PostMapping("")
	@JsonView(Common.class)
	public Evenement create(@Valid @RequestBody Evenement Evenement, BindingResult br) {
		return save(Evenement, br);
	}

	@PutMapping("/{id}")
	@JsonView(Common.class)
	public Evenement update(@PathVariable Integer id, @Valid @RequestBody Evenement Evenement, BindingResult br) {
		Evenement.setId(id);
		return save(Evenement, br);
	}

	private Evenement save(Evenement Evenement, BindingResult br) {
		if (br.hasErrors()) {
			throw new EvenementException();
		}
		return evenementService.save(Evenement);
	}	

}
