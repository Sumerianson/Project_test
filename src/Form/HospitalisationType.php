<?php

namespace App\Form;

use App\Entity\Patient;
use App\Entity\Hospitalisation;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\DateType;

class HospitalisationType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('code_pat', null, [
                'label' => 'Code patient'
            ])
            ->add('code_chambre', null, [
                'label' => 'Code chambre'
            ])
            ->add('date_arrive', DateType::class, [
                'label' => 'Date arrivé',
                'widget' =>'single_text'
            ])
            ->add('date_sort', DateType::class, [
                'label' => 'Date sorti',
                'widget' =>'single_text'
            ])
            ->add('observation')
            ->add('patient', EntityType::class, [
                'class' => Patient::class,
                'choice_label' => 'id',
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Hospitalisation::class,
        ]);
    }
}
