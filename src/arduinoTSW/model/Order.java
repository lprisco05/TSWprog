package arduinoTSW.model;

public class Order extends Product {
	//oid pname uid quantity pricealcomprare
	private int orderId;
	private int uid;
	private int quantity;
	private String date;
	private Double total = 696969.0;
	private String p_name;
	
	public Order() {	
	}

	//o_id p_id u_id o_quantity o_date price_at_purchase

	public Order(int orderId,int productId, int uid, int quantity, String date,double price_at_purchase) {
		super();
		this.orderId = orderId;
		this.uid = uid;
		this.quantity = quantity;
		this.date = date;
		this.total = price_at_purchase;
	}

	public Order(int uid, int quantity, String date) {
		super();
		this.uid = uid;
		this.quantity = quantity;
		this.date = date;
		
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", uid=" + uid + ", quantity=" + quantity + ", date=" + date + "]";
	}

	public double getTotal() {
		return this.total;
	}

	public void setTotal(Double double1) {
		this.total = double1;
	}
	
	
}
