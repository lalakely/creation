package com.creation.beans;

public class User {
	private String nom;
	private String mot_de_passe;
	private boolean actif;
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getMot_de_passe() {
		return mot_de_passe;
	}
	public void setMot_de_passe(String mot_de_passe) {
		this.mot_de_passe = mot_de_passe;
	}
	public boolean isActif() {
		return actif;
	}
	public void setActif(boolean actif) {
		this.actif = actif;
	}
}
