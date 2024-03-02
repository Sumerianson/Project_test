<?php

namespace App\Form;

use App\Entity\Chambre;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\NumberType;

class ChambreType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('localis_chamb', null, [
                'label' => 'Localisation de chambre'
            ])
            ->add('type_lit', null, [
                'label' => 'Type de lit'
            ])
            ->add('n_lit', null, [
                'label' => 'Numero de lit'
            ])
            ->add('prix_chamb', NumberType::class, [
                'label' => 'Prix de la chambre'
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Chambre::class,
        ]);
    }
}
