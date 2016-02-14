package se.plankter.dronedelivery;

public class Map {

	private final int width;
	private final int height;
	
	public Map(int width, int height) {
		this.width = width;
		this.height = height;
	}

	public int getWidth() {
		return width;
	}

	public int getHeight() {
		return height;
	}
}
