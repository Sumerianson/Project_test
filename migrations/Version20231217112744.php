<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20231217112744 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE chambre (id INT AUTO_INCREMENT NOT NULL, localis_chamb VARCHAR(255) NOT NULL, type_lit VARCHAR(255) NOT NULL, n_lit VARCHAR(255) NOT NULL, prix_chamb DOUBLE PRECISION NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE consultation (id INT AUTO_INCREMENT NOT NULL, personnel_id INT DEFAULT NULL, patient_id INT DEFAULT NULL, code_pat VARCHAR(20) NOT NULL, code_pers VARCHAR(20) NOT NULL, type_consult VARCHAR(255) NOT NULL, frais_consult VARCHAR(255) NOT NULL, date_consult DATE NOT NULL, INDEX IDX_964685A61C109075 (personnel_id), INDEX IDX_964685A66B899279 (patient_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE hospitalisation (id INT AUTO_INCREMENT NOT NULL, patient_id INT DEFAULT NULL, code_pat VARCHAR(20) NOT NULL, code_chambre VARCHAR(20) NOT NULL, date_arrive DATE NOT NULL, date_sort DATE NOT NULL, observation LONGTEXT NOT NULL, INDEX IDX_67C059596B899279 (patient_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE patient (id INT AUTO_INCREMENT NOT NULL, nom VARCHAR(255) NOT NULL, prenom VARCHAR(255) NOT NULL, n_secu VARCHAR(255) NOT NULL, adresse LONGTEXT NOT NULL, naissance DATE NOT NULL, telephone VARCHAR(16) NOT NULL, email VARCHAR(255) NOT NULL, gendre VARCHAR(255) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE personnel (id INT AUTO_INCREMENT NOT NULL, code_pers VARCHAR(255) NOT NULL, nom_pers VARCHAR(255) NOT NULL, gendre VARCHAR(255) NOT NULL, naissance DATE NOT NULL, email VARCHAR(255) NOT NULL, telephone VARCHAR(16) NOT NULL, adresse LONGTEXT NOT NULL, fonction VARCHAR(255) NOT NULL, code_service VARCHAR(16) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE traitement (id INT AUTO_INCREMENT NOT NULL, patient_id INT NOT NULL, personnel_id INT NOT NULL, code_pat VARCHAR(20) NOT NULL, code_maladie VARCHAR(20) NOT NULL, observation LONGTEXT NOT NULL, date_deb DATE NOT NULL, date_fin DATE NOT NULL, etat_pat VARCHAR(255) NOT NULL, INDEX IDX_2A356D276B899279 (patient_id), INDEX IDX_2A356D271C109075 (personnel_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE messenger_messages (id BIGINT AUTO_INCREMENT NOT NULL, body LONGTEXT NOT NULL, headers LONGTEXT NOT NULL, queue_name VARCHAR(190) NOT NULL, created_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', available_at DATETIME NOT NULL COMMENT \'(DC2Type:datetime_immutable)\', delivered_at DATETIME DEFAULT NULL COMMENT \'(DC2Type:datetime_immutable)\', INDEX IDX_75EA56E0FB7336F0 (queue_name), INDEX IDX_75EA56E0E3BD61CE (available_at), INDEX IDX_75EA56E016BA31DB (delivered_at), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE consultation ADD CONSTRAINT FK_964685A61C109075 FOREIGN KEY (personnel_id) REFERENCES personnel (id)');
        $this->addSql('ALTER TABLE consultation ADD CONSTRAINT FK_964685A66B899279 FOREIGN KEY (patient_id) REFERENCES patient (id)');
        $this->addSql('ALTER TABLE hospitalisation ADD CONSTRAINT FK_67C059596B899279 FOREIGN KEY (patient_id) REFERENCES patient (id)');
        $this->addSql('ALTER TABLE traitement ADD CONSTRAINT FK_2A356D276B899279 FOREIGN KEY (patient_id) REFERENCES patient (id)');
        $this->addSql('ALTER TABLE traitement ADD CONSTRAINT FK_2A356D271C109075 FOREIGN KEY (personnel_id) REFERENCES personnel (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE consultation DROP FOREIGN KEY FK_964685A61C109075');
        $this->addSql('ALTER TABLE consultation DROP FOREIGN KEY FK_964685A66B899279');
        $this->addSql('ALTER TABLE hospitalisation DROP FOREIGN KEY FK_67C059596B899279');
        $this->addSql('ALTER TABLE traitement DROP FOREIGN KEY FK_2A356D276B899279');
        $this->addSql('ALTER TABLE traitement DROP FOREIGN KEY FK_2A356D271C109075');
        $this->addSql('DROP TABLE chambre');
        $this->addSql('DROP TABLE consultation');
        $this->addSql('DROP TABLE hospitalisation');
        $this->addSql('DROP TABLE patient');
        $this->addSql('DROP TABLE personnel');
        $this->addSql('DROP TABLE traitement');
        $this->addSql('DROP TABLE messenger_messages');
    }
}
