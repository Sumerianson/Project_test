<?php

namespace App\Entity;

use App\Repository\ChambreRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ChambreRepository::class)]
class Chambre
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $localis_chamb = null;

    #[ORM\Column(length: 255)]
    private ?string $type_lit = null;

    #[ORM\Column(length: 255)]
    private ?string $n_lit = null;

    #[ORM\Column]
    private ?float $prix_chamb = null;

    #[ORM\OneToMany(mappedBy: 'chambre', targetEntity: Hospitalisation::class)]
    private Collection $hospitalisation;

    public function __construct()
    {
        $this->hospitalisation = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getLocalisChamb(): ?string
    {
        return $this->localis_chamb;
    }

    public function setLocalisChamb(string $localis_chamb): static
    {
        $this->localis_chamb = $localis_chamb;

        return $this;
    }

    public function getTypeLit(): ?string
    {
        return $this->type_lit;
    }

    public function setTypeLit(string $type_lit): static
    {
        $this->type_lit = $type_lit;

        return $this;
    }

    public function getNLit(): ?string
    {
        return $this->n_lit;
    }

    public function setNLit(string $n_lit): static
    {
        $this->n_lit = $n_lit;

        return $this;
    }

    public function getPrixChamb(): ?float
    {
        return $this->prix_chamb;
    }

    public function setPrixChamb(float $prix_chamb): static
    {
        $this->prix_chamb = $prix_chamb;

        return $this;
    }

    /**
     * @return Collection<int, Hospitalisation>
     */
    public function getHospitalisation(): Collection
    {
        return $this->hospitalisation;
    }

    public function addHospitalisation(Hospitalisation $hospitalisation): static
    {
        if (!$this->hospitalisation->contains($hospitalisation)) {
            $this->hospitalisation->add($hospitalisation);
            $hospitalisation->setChambre($this);
        }

        return $this;
    }

    public function removeHospitalisation(Hospitalisation $hospitalisation): static
    {
        if ($this->hospitalisation->removeElement($hospitalisation)) {
            // set the owning side to null (unless already changed)
            if ($hospitalisation->getChambre() === $this) {
                $hospitalisation->setChambre(null);
            }
        }

        return $this;
    }
}
