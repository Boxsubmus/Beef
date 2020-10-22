using System;
using System.Collections;
using System.Diagnostics;

namespace LibA
{
	struct LibAStruct
	{
		int mA;
	}

	interface IVal
	{
		int Val
		{
			get; set;
		}
	}

	class LibA0
	{
		public static int GetVal<T>(T val) where T : IVal
		{
			return val.Val;
		}

		public static void Dispose<T>(mut T val) where T : IDisposable
		{
			val.Dispose();
		}

		public static void Alloc<T>() where T : new, delete
		{
			let t = new T();
			delete t;
		}

		public static bool DictEquals(Dictionary<String, int> lhs, Dictionary<String, int> rhs)
		{
			return lhs == rhs;
		}

		public static int GetOverload0<T>() where T : var
		{
			T val = default;
			return Overload0(val);
		}
	}

	struct Handler
	{
		public static int Handle(Object obj)
		{
			return 0;
		}

		public static int HandleT<T>(T val) where T : var
		{
			return Handle(val);
		}
	}

	class LibA1
	{

	}

	class LibA2
	{
		public static void DoDispose<T>(mut T val) where T : IDisposable
		{
			val.Dispose();
		}

		public static bool DoDispose2<T>(mut T val) where T : var
		{
			return
				[IgnoreErrors(true)]
				{
					val.Dispose();
					true
				};
		}

		public static bool CheckEq<T>(T lhs, T rhs)
		{
			return lhs == rhs;
		}
	}
}

class LibClassA
{
	public int32 mA = GetVal(7, 10, "LibA.LibClassA.mA");

	public static int32 sMagic = 1;

	public static this()
	{
		sMagic += 10;
	}

	public this()
	{
		Debug.WriteLine("LibA.LibClassA()\n");
		mA += 100;
	}

	public this(int32 a)
	{
		mA += a;
	}

	public ~this()
	{
		sMagic += 20;
	}

	public static int32 GetVal(int32 val, int32 magic, String str)
	{
		Debug.WriteLine("GetVal: {}", str);
		sMagic += magic;
		return val;
	}

	public int GetVal2()
	{
		return 9;
	}

	public static int GetVal3(Object obj)
	{
		return 30;
	}

	public static LibClassA Create()
	{
		return new LibClassA();
	}
}

class LibClassB
{
	public static int DoGetVal3<T>(T val)
	{
		return LibClassA.GetVal3(val);
	}
}

static
{
	public static int Overload0(Object a)
	{
		return 0;
	}

	public static int Overload0(int8 a)
	{
		return 1;
	}
}
