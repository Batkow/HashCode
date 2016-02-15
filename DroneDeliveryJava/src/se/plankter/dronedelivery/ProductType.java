package se.plankter.dronedelivery;

public class ProductType {

	public final int id;
	private final int weight;
	
	public ProductType(int id, int weight) {
		this.id = id;
		this.weight = weight;
	}
	
	public int getWeight() {
		return weight;
	}
}
