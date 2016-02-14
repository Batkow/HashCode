package se.plankter.dronedelivery;

import java.util.HashMap;
import java.util.Map;

public class Drone {

	private final int id;
	
	private int posX;
	private int posY;
	
	private final int maxPayload;
	
	private Map<ProductType, Integer> cargo = new HashMap<>();
	
	
	public Drone(int id, int posX, int posY, int maxPayload) {
		this.id = id;
		this.posX = posX;
		this.posY = posY;
		this.maxPayload = maxPayload;
	}

	
	public int getRoundedDistance(int x1, int y1, int x2, int y2) {
		// TODO add documentation
		double distance = Math.sqrt(Math.pow((x1-x2), 2) + Math.pow((y1-y2), 2));
		int roundedDist = (int) Math.ceil(distance);
		return roundedDist;
	}
}
