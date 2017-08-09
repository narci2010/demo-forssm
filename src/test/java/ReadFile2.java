import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;

public class ReadFile2 {
	public static void main(String[] args) {

		List<Object> aa = new ArrayList<Object>();
		A t = new A(1, "1", "1");
		B t1 = new B(3, "1", "1");
		B t3 = new B(2, "1", "1");
		C t2 = new C(2, "1");
		List<A> a = new ArrayList<A>();
		a.add(t);
		List<B> b = new ArrayList<B>();
		b.add(t1);
		b.add(t3);
		List<C> c = new ArrayList<C>();
		c.add(t2);
		aa.addAll(a);
		aa.addAll(b);
		aa.addAll(c);
		
		System.out.println(JSON.toJSON(aa));

	}


}

class A {
	private int a;
	private String b;
	private String c;

	public int getA() {
		return a;
	}

	public void setA(int a) {
		this.a = a;
	}

	public A(int a, String b, String c) {
		super();
		this.a = a;
		this.b = b;
		this.c = c;
	}

	public String getB() {
		return b;
	}

	public void setB(String b) {
		this.b = b;
	}

	public String getC() {
		return c;
	}

	public void setC(String c) {
		this.c = c;
	}

}

class B {
	public int getA() {
		return a;
	}

	public void setA(int a) {
		this.a = a;
	}

	private int a;
	private String b;
	private String c;

	public String getB() {
		return b;
	}

	public void setB(String b) {
		this.b = b;
	}

	public String getC() {
		return c;
	}

	public void setC(String c) {
		this.c = c;
	}

	public B(String b, String c) {
		super();

		this.b = b;
		this.c = c;
	}
	public B(int a, String b, String c) {
		super();
		this.a = a;
		this.b = b;
		this.c = c;
	}

}

class C {
	private int a;
	private String b;

	public String getB() {
		return b;
	}

	public int getA() {
		return a;
	}

	public void setA(int a) {
		this.a = a;
	}

	public C(String b) {
		super();

		this.b = b;

	}

	public void setB(String b) {
		this.b = b;
	}
	public C(int a, String b) {
		super();
		this.a = a;
		this.b = b;
	}

}
