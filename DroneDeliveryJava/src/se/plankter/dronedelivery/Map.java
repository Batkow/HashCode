package se.plankter.dronedelivery;

public class Map {

	private final int rows;
	private final int cols;
	
	public Map(int rows, int cols) {
		this.rows = rows;
		this.cols = cols;
	}

	public int getRows() {
		return rows;
	}

	public int getCols() {
		return cols;
	}
}
