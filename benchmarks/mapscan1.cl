#ifdef cl_clang_storage_class_specifiers
#pragma OPENCL EXTENSION cl_clang_storage_class_specifiers : enable
#endif
#pragma OPENCL EXTENSION cl_khr_byte_addressable_store : enable
__kernel void dummy_kernel(__global unsigned char *dummy, int n)
{
    const int thread_gid = get_global_id(0);
    
    if (thread_gid >= n)
        return;
}
typedef char int8_t;
typedef short int16_t;
typedef int int32_t;
typedef long int64_t;
typedef uchar uint8_t;
typedef ushort uint16_t;
typedef uint uint32_t;
typedef ulong uint64_t;
#ifdef cl_nv_pragma_unroll
static inline void mem_fence_global()
{
    asm("membar.gl;");
}
#else
static inline void mem_fence_global()
{
    mem_fence(CLK_LOCAL_MEM_FENCE | CLK_GLOBAL_MEM_FENCE);
}
#endif
static inline void mem_fence_local()
{
    mem_fence(CLK_LOCAL_MEM_FENCE);
}
static inline uint8_t add8(uint8_t x, uint8_t y)
{
    return x + y;
}
static inline uint16_t add16(uint16_t x, uint16_t y)
{
    return x + y;
}
static inline uint32_t add32(uint32_t x, uint32_t y)
{
    return x + y;
}
static inline uint64_t add64(uint64_t x, uint64_t y)
{
    return x + y;
}
static inline uint8_t sub8(uint8_t x, uint8_t y)
{
    return x - y;
}
static inline uint16_t sub16(uint16_t x, uint16_t y)
{
    return x - y;
}
static inline uint32_t sub32(uint32_t x, uint32_t y)
{
    return x - y;
}
static inline uint64_t sub64(uint64_t x, uint64_t y)
{
    return x - y;
}
static inline uint8_t mul8(uint8_t x, uint8_t y)
{
    return x * y;
}
static inline uint16_t mul16(uint16_t x, uint16_t y)
{
    return x * y;
}
static inline uint32_t mul32(uint32_t x, uint32_t y)
{
    return x * y;
}
static inline uint64_t mul64(uint64_t x, uint64_t y)
{
    return x * y;
}
static inline uint8_t udiv8(uint8_t x, uint8_t y)
{
    return x / y;
}
static inline uint16_t udiv16(uint16_t x, uint16_t y)
{
    return x / y;
}
static inline uint32_t udiv32(uint32_t x, uint32_t y)
{
    return x / y;
}
static inline uint64_t udiv64(uint64_t x, uint64_t y)
{
    return x / y;
}
static inline uint8_t udiv_up8(uint8_t x, uint8_t y)
{
    return (x + y - 1) / y;
}
static inline uint16_t udiv_up16(uint16_t x, uint16_t y)
{
    return (x + y - 1) / y;
}
static inline uint32_t udiv_up32(uint32_t x, uint32_t y)
{
    return (x + y - 1) / y;
}
static inline uint64_t udiv_up64(uint64_t x, uint64_t y)
{
    return (x + y - 1) / y;
}
static inline uint8_t umod8(uint8_t x, uint8_t y)
{
    return x % y;
}
static inline uint16_t umod16(uint16_t x, uint16_t y)
{
    return x % y;
}
static inline uint32_t umod32(uint32_t x, uint32_t y)
{
    return x % y;
}
static inline uint64_t umod64(uint64_t x, uint64_t y)
{
    return x % y;
}
static inline uint8_t udiv_safe8(uint8_t x, uint8_t y)
{
    return y == 0 ? 0 : x / y;
}
static inline uint16_t udiv_safe16(uint16_t x, uint16_t y)
{
    return y == 0 ? 0 : x / y;
}
static inline uint32_t udiv_safe32(uint32_t x, uint32_t y)
{
    return y == 0 ? 0 : x / y;
}
static inline uint64_t udiv_safe64(uint64_t x, uint64_t y)
{
    return y == 0 ? 0 : x / y;
}
static inline uint8_t udiv_up_safe8(uint8_t x, uint8_t y)
{
    return y == 0 ? 0 : (x + y - 1) / y;
}
static inline uint16_t udiv_up_safe16(uint16_t x, uint16_t y)
{
    return y == 0 ? 0 : (x + y - 1) / y;
}
static inline uint32_t udiv_up_safe32(uint32_t x, uint32_t y)
{
    return y == 0 ? 0 : (x + y - 1) / y;
}
static inline uint64_t udiv_up_safe64(uint64_t x, uint64_t y)
{
    return y == 0 ? 0 : (x + y - 1) / y;
}
static inline uint8_t umod_safe8(uint8_t x, uint8_t y)
{
    return y == 0 ? 0 : x % y;
}
static inline uint16_t umod_safe16(uint16_t x, uint16_t y)
{
    return y == 0 ? 0 : x % y;
}
static inline uint32_t umod_safe32(uint32_t x, uint32_t y)
{
    return y == 0 ? 0 : x % y;
}
static inline uint64_t umod_safe64(uint64_t x, uint64_t y)
{
    return y == 0 ? 0 : x % y;
}
static inline int8_t sdiv8(int8_t x, int8_t y)
{
    int8_t q = x / y;
    int8_t r = x % y;
    
    return q - ((r != 0 && r < 0 != y < 0) ? 1 : 0);
}
static inline int16_t sdiv16(int16_t x, int16_t y)
{
    int16_t q = x / y;
    int16_t r = x % y;
    
    return q - ((r != 0 && r < 0 != y < 0) ? 1 : 0);
}
static inline int32_t sdiv32(int32_t x, int32_t y)
{
    int32_t q = x / y;
    int32_t r = x % y;
    
    return q - ((r != 0 && r < 0 != y < 0) ? 1 : 0);
}
static inline int64_t sdiv64(int64_t x, int64_t y)
{
    int64_t q = x / y;
    int64_t r = x % y;
    
    return q - ((r != 0 && r < 0 != y < 0) ? 1 : 0);
}
static inline int8_t sdiv_up8(int8_t x, int8_t y)
{
    return sdiv8(x + y - 1, y);
}
static inline int16_t sdiv_up16(int16_t x, int16_t y)
{
    return sdiv16(x + y - 1, y);
}
static inline int32_t sdiv_up32(int32_t x, int32_t y)
{
    return sdiv32(x + y - 1, y);
}
static inline int64_t sdiv_up64(int64_t x, int64_t y)
{
    return sdiv64(x + y - 1, y);
}
static inline int8_t smod8(int8_t x, int8_t y)
{
    int8_t r = x % y;
    
    return r + (r == 0 || (x > 0 && y > 0) || (x < 0 && y < 0) ? 0 : y);
}
static inline int16_t smod16(int16_t x, int16_t y)
{
    int16_t r = x % y;
    
    return r + (r == 0 || (x > 0 && y > 0) || (x < 0 && y < 0) ? 0 : y);
}
static inline int32_t smod32(int32_t x, int32_t y)
{
    int32_t r = x % y;
    
    return r + (r == 0 || (x > 0 && y > 0) || (x < 0 && y < 0) ? 0 : y);
}
static inline int64_t smod64(int64_t x, int64_t y)
{
    int64_t r = x % y;
    
    return r + (r == 0 || (x > 0 && y > 0) || (x < 0 && y < 0) ? 0 : y);
}
static inline int8_t sdiv_safe8(int8_t x, int8_t y)
{
    return y == 0 ? 0 : sdiv8(x, y);
}
static inline int16_t sdiv_safe16(int16_t x, int16_t y)
{
    return y == 0 ? 0 : sdiv16(x, y);
}
static inline int32_t sdiv_safe32(int32_t x, int32_t y)
{
    return y == 0 ? 0 : sdiv32(x, y);
}
static inline int64_t sdiv_safe64(int64_t x, int64_t y)
{
    return y == 0 ? 0 : sdiv64(x, y);
}
static inline int8_t sdiv_up_safe8(int8_t x, int8_t y)
{
    return sdiv_safe8(x + y - 1, y);
}
static inline int16_t sdiv_up_safe16(int16_t x, int16_t y)
{
    return sdiv_safe16(x + y - 1, y);
}
static inline int32_t sdiv_up_safe32(int32_t x, int32_t y)
{
    return sdiv_safe32(x + y - 1, y);
}
static inline int64_t sdiv_up_safe64(int64_t x, int64_t y)
{
    return sdiv_safe64(x + y - 1, y);
}
static inline int8_t smod_safe8(int8_t x, int8_t y)
{
    return y == 0 ? 0 : smod8(x, y);
}
static inline int16_t smod_safe16(int16_t x, int16_t y)
{
    return y == 0 ? 0 : smod16(x, y);
}
static inline int32_t smod_safe32(int32_t x, int32_t y)
{
    return y == 0 ? 0 : smod32(x, y);
}
static inline int64_t smod_safe64(int64_t x, int64_t y)
{
    return y == 0 ? 0 : smod64(x, y);
}
static inline int8_t squot8(int8_t x, int8_t y)
{
    return x / y;
}
static inline int16_t squot16(int16_t x, int16_t y)
{
    return x / y;
}
static inline int32_t squot32(int32_t x, int32_t y)
{
    return x / y;
}
static inline int64_t squot64(int64_t x, int64_t y)
{
    return x / y;
}
static inline int8_t srem8(int8_t x, int8_t y)
{
    return x % y;
}
static inline int16_t srem16(int16_t x, int16_t y)
{
    return x % y;
}
static inline int32_t srem32(int32_t x, int32_t y)
{
    return x % y;
}
static inline int64_t srem64(int64_t x, int64_t y)
{
    return x % y;
}
static inline int8_t squot_safe8(int8_t x, int8_t y)
{
    return y == 0 ? 0 : x / y;
}
static inline int16_t squot_safe16(int16_t x, int16_t y)
{
    return y == 0 ? 0 : x / y;
}
static inline int32_t squot_safe32(int32_t x, int32_t y)
{
    return y == 0 ? 0 : x / y;
}
static inline int64_t squot_safe64(int64_t x, int64_t y)
{
    return y == 0 ? 0 : x / y;
}
static inline int8_t srem_safe8(int8_t x, int8_t y)
{
    return y == 0 ? 0 : x % y;
}
static inline int16_t srem_safe16(int16_t x, int16_t y)
{
    return y == 0 ? 0 : x % y;
}
static inline int32_t srem_safe32(int32_t x, int32_t y)
{
    return y == 0 ? 0 : x % y;
}
static inline int64_t srem_safe64(int64_t x, int64_t y)
{
    return y == 0 ? 0 : x % y;
}
static inline int8_t smin8(int8_t x, int8_t y)
{
    return x < y ? x : y;
}
static inline int16_t smin16(int16_t x, int16_t y)
{
    return x < y ? x : y;
}
static inline int32_t smin32(int32_t x, int32_t y)
{
    return x < y ? x : y;
}
static inline int64_t smin64(int64_t x, int64_t y)
{
    return x < y ? x : y;
}
static inline uint8_t umin8(uint8_t x, uint8_t y)
{
    return x < y ? x : y;
}
static inline uint16_t umin16(uint16_t x, uint16_t y)
{
    return x < y ? x : y;
}
static inline uint32_t umin32(uint32_t x, uint32_t y)
{
    return x < y ? x : y;
}
static inline uint64_t umin64(uint64_t x, uint64_t y)
{
    return x < y ? x : y;
}
static inline int8_t smax8(int8_t x, int8_t y)
{
    return x < y ? y : x;
}
static inline int16_t smax16(int16_t x, int16_t y)
{
    return x < y ? y : x;
}
static inline int32_t smax32(int32_t x, int32_t y)
{
    return x < y ? y : x;
}
static inline int64_t smax64(int64_t x, int64_t y)
{
    return x < y ? y : x;
}
static inline uint8_t umax8(uint8_t x, uint8_t y)
{
    return x < y ? y : x;
}
static inline uint16_t umax16(uint16_t x, uint16_t y)
{
    return x < y ? y : x;
}
static inline uint32_t umax32(uint32_t x, uint32_t y)
{
    return x < y ? y : x;
}
static inline uint64_t umax64(uint64_t x, uint64_t y)
{
    return x < y ? y : x;
}
static inline uint8_t shl8(uint8_t x, uint8_t y)
{
    return x << y;
}
static inline uint16_t shl16(uint16_t x, uint16_t y)
{
    return x << y;
}
static inline uint32_t shl32(uint32_t x, uint32_t y)
{
    return x << y;
}
static inline uint64_t shl64(uint64_t x, uint64_t y)
{
    return x << y;
}
static inline uint8_t lshr8(uint8_t x, uint8_t y)
{
    return x >> y;
}
static inline uint16_t lshr16(uint16_t x, uint16_t y)
{
    return x >> y;
}
static inline uint32_t lshr32(uint32_t x, uint32_t y)
{
    return x >> y;
}
static inline uint64_t lshr64(uint64_t x, uint64_t y)
{
    return x >> y;
}
static inline int8_t ashr8(int8_t x, int8_t y)
{
    return x >> y;
}
static inline int16_t ashr16(int16_t x, int16_t y)
{
    return x >> y;
}
static inline int32_t ashr32(int32_t x, int32_t y)
{
    return x >> y;
}
static inline int64_t ashr64(int64_t x, int64_t y)
{
    return x >> y;
}
static inline uint8_t and8(uint8_t x, uint8_t y)
{
    return x & y;
}
static inline uint16_t and16(uint16_t x, uint16_t y)
{
    return x & y;
}
static inline uint32_t and32(uint32_t x, uint32_t y)
{
    return x & y;
}
static inline uint64_t and64(uint64_t x, uint64_t y)
{
    return x & y;
}
static inline uint8_t or8(uint8_t x, uint8_t y)
{
    return x | y;
}
static inline uint16_t or16(uint16_t x, uint16_t y)
{
    return x | y;
}
static inline uint32_t or32(uint32_t x, uint32_t y)
{
    return x | y;
}
static inline uint64_t or64(uint64_t x, uint64_t y)
{
    return x | y;
}
static inline uint8_t xor8(uint8_t x, uint8_t y)
{
    return x ^ y;
}
static inline uint16_t xor16(uint16_t x, uint16_t y)
{
    return x ^ y;
}
static inline uint32_t xor32(uint32_t x, uint32_t y)
{
    return x ^ y;
}
static inline uint64_t xor64(uint64_t x, uint64_t y)
{
    return x ^ y;
}
static inline bool ult8(uint8_t x, uint8_t y)
{
    return x < y;
}
static inline bool ult16(uint16_t x, uint16_t y)
{
    return x < y;
}
static inline bool ult32(uint32_t x, uint32_t y)
{
    return x < y;
}
static inline bool ult64(uint64_t x, uint64_t y)
{
    return x < y;
}
static inline bool ule8(uint8_t x, uint8_t y)
{
    return x <= y;
}
static inline bool ule16(uint16_t x, uint16_t y)
{
    return x <= y;
}
static inline bool ule32(uint32_t x, uint32_t y)
{
    return x <= y;
}
static inline bool ule64(uint64_t x, uint64_t y)
{
    return x <= y;
}
static inline bool slt8(int8_t x, int8_t y)
{
    return x < y;
}
static inline bool slt16(int16_t x, int16_t y)
{
    return x < y;
}
static inline bool slt32(int32_t x, int32_t y)
{
    return x < y;
}
static inline bool slt64(int64_t x, int64_t y)
{
    return x < y;
}
static inline bool sle8(int8_t x, int8_t y)
{
    return x <= y;
}
static inline bool sle16(int16_t x, int16_t y)
{
    return x <= y;
}
static inline bool sle32(int32_t x, int32_t y)
{
    return x <= y;
}
static inline bool sle64(int64_t x, int64_t y)
{
    return x <= y;
}
static inline int8_t pow8(int8_t x, int8_t y)
{
    int8_t res = 1, rem = y;
    
    while (rem != 0) {
        if (rem & 1)
            res *= x;
        rem >>= 1;
        x *= x;
    }
    return res;
}
static inline int16_t pow16(int16_t x, int16_t y)
{
    int16_t res = 1, rem = y;
    
    while (rem != 0) {
        if (rem & 1)
            res *= x;
        rem >>= 1;
        x *= x;
    }
    return res;
}
static inline int32_t pow32(int32_t x, int32_t y)
{
    int32_t res = 1, rem = y;
    
    while (rem != 0) {
        if (rem & 1)
            res *= x;
        rem >>= 1;
        x *= x;
    }
    return res;
}
static inline int64_t pow64(int64_t x, int64_t y)
{
    int64_t res = 1, rem = y;
    
    while (rem != 0) {
        if (rem & 1)
            res *= x;
        rem >>= 1;
        x *= x;
    }
    return res;
}
static inline bool itob_i8_bool(int8_t x)
{
    return x;
}
static inline bool itob_i16_bool(int16_t x)
{
    return x;
}
static inline bool itob_i32_bool(int32_t x)
{
    return x;
}
static inline bool itob_i64_bool(int64_t x)
{
    return x;
}
static inline int8_t btoi_bool_i8(bool x)
{
    return x;
}
static inline int16_t btoi_bool_i16(bool x)
{
    return x;
}
static inline int32_t btoi_bool_i32(bool x)
{
    return x;
}
static inline int64_t btoi_bool_i64(bool x)
{
    return x;
}
#define sext_i8_i8(x) ((int8_t) (int8_t) x)
#define sext_i8_i16(x) ((int16_t) (int8_t) x)
#define sext_i8_i32(x) ((int32_t) (int8_t) x)
#define sext_i8_i64(x) ((int64_t) (int8_t) x)
#define sext_i16_i8(x) ((int8_t) (int16_t) x)
#define sext_i16_i16(x) ((int16_t) (int16_t) x)
#define sext_i16_i32(x) ((int32_t) (int16_t) x)
#define sext_i16_i64(x) ((int64_t) (int16_t) x)
#define sext_i32_i8(x) ((int8_t) (int32_t) x)
#define sext_i32_i16(x) ((int16_t) (int32_t) x)
#define sext_i32_i32(x) ((int32_t) (int32_t) x)
#define sext_i32_i64(x) ((int64_t) (int32_t) x)
#define sext_i64_i8(x) ((int8_t) (int64_t) x)
#define sext_i64_i16(x) ((int16_t) (int64_t) x)
#define sext_i64_i32(x) ((int32_t) (int64_t) x)
#define sext_i64_i64(x) ((int64_t) (int64_t) x)
#define zext_i8_i8(x) ((int8_t) (uint8_t) x)
#define zext_i8_i16(x) ((int16_t) (uint8_t) x)
#define zext_i8_i32(x) ((int32_t) (uint8_t) x)
#define zext_i8_i64(x) ((int64_t) (uint8_t) x)
#define zext_i16_i8(x) ((int8_t) (uint16_t) x)
#define zext_i16_i16(x) ((int16_t) (uint16_t) x)
#define zext_i16_i32(x) ((int32_t) (uint16_t) x)
#define zext_i16_i64(x) ((int64_t) (uint16_t) x)
#define zext_i32_i8(x) ((int8_t) (uint32_t) x)
#define zext_i32_i16(x) ((int16_t) (uint32_t) x)
#define zext_i32_i32(x) ((int32_t) (uint32_t) x)
#define zext_i32_i64(x) ((int64_t) (uint32_t) x)
#define zext_i64_i8(x) ((int8_t) (uint64_t) x)
#define zext_i64_i16(x) ((int16_t) (uint64_t) x)
#define zext_i64_i32(x) ((int32_t) (uint64_t) x)
#define zext_i64_i64(x) ((int64_t) (uint64_t) x)
#if defined(__OPENCL_VERSION__)
static int32_t futrts_popc8(int8_t x)
{
    return popcount(x);
}
static int32_t futrts_popc16(int16_t x)
{
    return popcount(x);
}
static int32_t futrts_popc32(int32_t x)
{
    return popcount(x);
}
static int32_t futrts_popc64(int64_t x)
{
    return popcount(x);
}
#elif defined(__CUDA_ARCH__)
static int32_t futrts_popc8(int8_t x)
{
    return __popc(zext_i8_i32(x));
}
static int32_t futrts_popc16(int16_t x)
{
    return __popc(zext_i16_i32(x));
}
static int32_t futrts_popc32(int32_t x)
{
    return __popc(x);
}
static int32_t futrts_popc64(int64_t x)
{
    return __popcll(x);
}
#else
static int32_t futrts_popc8(int8_t x)
{
    int c = 0;
    
    for (; x; ++c)
        x &= x - 1;
    return c;
}
static int32_t futrts_popc16(int16_t x)
{
    int c = 0;
    
    for (; x; ++c)
        x &= x - 1;
    return c;
}
static int32_t futrts_popc32(int32_t x)
{
    int c = 0;
    
    for (; x; ++c)
        x &= x - 1;
    return c;
}
static int32_t futrts_popc64(int64_t x)
{
    int c = 0;
    
    for (; x; ++c)
        x &= x - 1;
    return c;
}
#endif
#if defined(__OPENCL_VERSION__)
static uint8_t futrts_mul_hi8(uint8_t a, uint8_t b)
{
    return mul_hi(a, b);
}
static uint16_t futrts_mul_hi16(uint16_t a, uint16_t b)
{
    return mul_hi(a, b);
}
static uint32_t futrts_mul_hi32(uint32_t a, uint32_t b)
{
    return mul_hi(a, b);
}
static uint64_t futrts_mul_hi64(uint64_t a, uint64_t b)
{
    return mul_hi(a, b);
}
#elif defined(__CUDA_ARCH__)
static uint8_t futrts_mul_hi8(uint8_t a, uint8_t b)
{
    uint16_t aa = a;
    uint16_t bb = b;
    
    return aa * bb >> 8;
}
static uint16_t futrts_mul_hi16(uint16_t a, uint16_t b)
{
    uint32_t aa = a;
    uint32_t bb = b;
    
    return aa * bb >> 16;
}
static uint32_t futrts_mul_hi32(uint32_t a, uint32_t b)
{
    return mulhi(a, b);
}
static uint64_t futrts_mul_hi64(uint64_t a, uint64_t b)
{
    return mul64hi(a, b);
}
#else
static uint8_t futrts_mul_hi8(uint8_t a, uint8_t b)
{
    uint16_t aa = a;
    uint16_t bb = b;
    
    return aa * bb >> 8;
}
static uint16_t futrts_mul_hi16(uint16_t a, uint16_t b)
{
    uint32_t aa = a;
    uint32_t bb = b;
    
    return aa * bb >> 16;
}
static uint32_t futrts_mul_hi32(uint32_t a, uint32_t b)
{
    uint64_t aa = a;
    uint64_t bb = b;
    
    return aa * bb >> 32;
}
static uint64_t futrts_mul_hi64(uint64_t a, uint64_t b)
{
    __uint128_t aa = a;
    __uint128_t bb = b;
    
    return aa * bb >> 64;
}
#endif
#if defined(__OPENCL_VERSION__)
static uint8_t futrts_mad_hi8(uint8_t a, uint8_t b, uint8_t c)
{
    return mad_hi(a, b, c);
}
static uint16_t futrts_mad_hi16(uint16_t a, uint16_t b, uint16_t c)
{
    return mad_hi(a, b, c);
}
static uint32_t futrts_mad_hi32(uint32_t a, uint32_t b, uint32_t c)
{
    return mad_hi(a, b, c);
}
static uint64_t futrts_mad_hi64(uint64_t a, uint64_t b, uint64_t c)
{
    return mad_hi(a, b, c);
}
#else
static uint8_t futrts_mad_hi8(uint8_t a, uint8_t b, uint8_t c)
{
    return futrts_mul_hi8(a, b) + c;
}
static uint16_t futrts_mad_hi16(uint16_t a, uint16_t b, uint16_t c)
{
    return futrts_mul_hi16(a, b) + c;
}
static uint32_t futrts_mad_hi32(uint32_t a, uint32_t b, uint32_t c)
{
    return futrts_mul_hi32(a, b) + c;
}
static uint64_t futrts_mad_hi64(uint64_t a, uint64_t b, uint64_t c)
{
    return futrts_mul_hi64(a, b) + c;
}
#endif
#if defined(__OPENCL_VERSION__)
static int32_t futrts_clzz8(int8_t x)
{
    return clz(x);
}
static int32_t futrts_clzz16(int16_t x)
{
    return clz(x);
}
static int32_t futrts_clzz32(int32_t x)
{
    return clz(x);
}
static int32_t futrts_clzz64(int64_t x)
{
    return clz(x);
}
#elif defined(__CUDA_ARCH__)
static int32_t futrts_clzz8(int8_t x)
{
    return __clz(zext_i8_i32(x)) - 24;
}
static int32_t futrts_clzz16(int16_t x)
{
    return __clz(zext_i16_i32(x)) - 16;
}
static int32_t futrts_clzz32(int32_t x)
{
    return __clz(x);
}
static int32_t futrts_clzz64(int64_t x)
{
    return __clzll(x);
}
#else
static int32_t futrts_clzz8(int8_t x)
{
    int n = 0;
    int bits = sizeof(x) * 8;
    
    for (int i = 0; i < bits; i++) {
        if (x < 0)
            break;
        n++;
        x <<= 1;
    }
    return n;
}
static int32_t futrts_clzz16(int16_t x)
{
    int n = 0;
    int bits = sizeof(x) * 8;
    
    for (int i = 0; i < bits; i++) {
        if (x < 0)
            break;
        n++;
        x <<= 1;
    }
    return n;
}
static int32_t futrts_clzz32(int32_t x)
{
    int n = 0;
    int bits = sizeof(x) * 8;
    
    for (int i = 0; i < bits; i++) {
        if (x < 0)
            break;
        n++;
        x <<= 1;
    }
    return n;
}
static int32_t futrts_clzz64(int64_t x)
{
    int n = 0;
    int bits = sizeof(x) * 8;
    
    for (int i = 0; i < bits; i++) {
        if (x < 0)
            break;
        n++;
        x <<= 1;
    }
    return n;
}
#endif
#if defined(__OPENCL_VERSION__)
static int32_t futrts_ctzz8(int8_t x)
{
    int i = 0;
    
    for (; i < 8 && (x & 1) == 0; i++, x >>= 1)
        ;
    return i;
}
static int32_t futrts_ctzz16(int16_t x)
{
    int i = 0;
    
    for (; i < 16 && (x & 1) == 0; i++, x >>= 1)
        ;
    return i;
}
static int32_t futrts_ctzz32(int32_t x)
{
    int i = 0;
    
    for (; i < 32 && (x & 1) == 0; i++, x >>= 1)
        ;
    return i;
}
static int32_t futrts_ctzz64(int64_t x)
{
    int i = 0;
    
    for (; i < 64 && (x & 1) == 0; i++, x >>= 1)
        ;
    return i;
}
#elif defined(__CUDA_ARCH__)
static int32_t futrts_ctzz8(int8_t x)
{
    int y = __ffs(x);
    
    return y == 0 ? 8 : y - 1;
}
static int32_t futrts_ctzz16(int16_t x)
{
    int y = __ffs(x);
    
    return y == 0 ? 16 : y - 1;
}
static int32_t futrts_ctzz32(int32_t x)
{
    int y = __ffs(x);
    
    return y == 0 ? 32 : y - 1;
}
static int32_t futrts_ctzz64(int64_t x)
{
    int y = __ffsll(x);
    
    return y == 0 ? 64 : y - 1;
}
#else
static int32_t futrts_ctzz8(int8_t x)
{
    return x == 0 ? 8 : __builtin_ctz((uint32_t) x);
}
static int32_t futrts_ctzz16(int16_t x)
{
    return x == 0 ? 16 : __builtin_ctz((uint32_t) x);
}
static int32_t futrts_ctzz32(int32_t x)
{
    return x == 0 ? 32 : __builtin_ctz(x);
}
static int32_t futrts_ctzz64(int64_t x)
{
    return x == 0 ? 64 : __builtin_ctzl(x);
}
#endif
static inline float fdiv32(float x, float y)
{
    return x / y;
}
static inline float fadd32(float x, float y)
{
    return x + y;
}
static inline float fsub32(float x, float y)
{
    return x - y;
}
static inline float fmul32(float x, float y)
{
    return x * y;
}
static inline float fmin32(float x, float y)
{
    return fmin(x, y);
}
static inline float fmax32(float x, float y)
{
    return fmax(x, y);
}
static inline float fpow32(float x, float y)
{
    return pow(x, y);
}
static inline bool cmplt32(float x, float y)
{
    return x < y;
}
static inline bool cmple32(float x, float y)
{
    return x <= y;
}
static inline float sitofp_i8_f32(int8_t x)
{
    return (float) x;
}
static inline float sitofp_i16_f32(int16_t x)
{
    return (float) x;
}
static inline float sitofp_i32_f32(int32_t x)
{
    return (float) x;
}
static inline float sitofp_i64_f32(int64_t x)
{
    return (float) x;
}
static inline float uitofp_i8_f32(uint8_t x)
{
    return (float) x;
}
static inline float uitofp_i16_f32(uint16_t x)
{
    return (float) x;
}
static inline float uitofp_i32_f32(uint32_t x)
{
    return (float) x;
}
static inline float uitofp_i64_f32(uint64_t x)
{
    return (float) x;
}
static inline int8_t fptosi_f32_i8(float x)
{
    return (int8_t) x;
}
static inline int16_t fptosi_f32_i16(float x)
{
    return (int16_t) x;
}
static inline int32_t fptosi_f32_i32(float x)
{
    return (int32_t) x;
}
static inline int64_t fptosi_f32_i64(float x)
{
    return (int64_t) x;
}
static inline uint8_t fptoui_f32_i8(float x)
{
    return (uint8_t) x;
}
static inline uint16_t fptoui_f32_i16(float x)
{
    return (uint16_t) x;
}
static inline uint32_t fptoui_f32_i32(float x)
{
    return (uint32_t) x;
}
static inline uint64_t fptoui_f32_i64(float x)
{
    return (uint64_t) x;
}
static inline float futrts_log32(float x)
{
    return log(x);
}
static inline float futrts_log2_32(float x)
{
    return log2(x);
}
static inline float futrts_log10_32(float x)
{
    return log10(x);
}
static inline float futrts_sqrt32(float x)
{
    return sqrt(x);
}
static inline float futrts_exp32(float x)
{
    return exp(x);
}
static inline float futrts_cos32(float x)
{
    return cos(x);
}
static inline float futrts_sin32(float x)
{
    return sin(x);
}
static inline float futrts_tan32(float x)
{
    return tan(x);
}
static inline float futrts_acos32(float x)
{
    return acos(x);
}
static inline float futrts_asin32(float x)
{
    return asin(x);
}
static inline float futrts_atan32(float x)
{
    return atan(x);
}
static inline float futrts_cosh32(float x)
{
    return cosh(x);
}
static inline float futrts_sinh32(float x)
{
    return sinh(x);
}
static inline float futrts_tanh32(float x)
{
    return tanh(x);
}
static inline float futrts_acosh32(float x)
{
    return acosh(x);
}
static inline float futrts_asinh32(float x)
{
    return asinh(x);
}
static inline float futrts_atanh32(float x)
{
    return atanh(x);
}
static inline float futrts_atan2_32(float x, float y)
{
    return atan2(x, y);
}
static inline float futrts_gamma32(float x)
{
    return tgamma(x);
}
static inline float futrts_lgamma32(float x)
{
    return lgamma(x);
}
static inline bool futrts_isnan32(float x)
{
    return isnan(x);
}
static inline bool futrts_isinf32(float x)
{
    return isinf(x);
}
static inline int32_t futrts_to_bits32(float x)
{
    union {
        float f;
        int32_t t;
    } p;
    
    p.f = x;
    return p.t;
}
static inline float futrts_from_bits32(int32_t x)
{
    union {
        int32_t f;
        float t;
    } p;
    
    p.f = x;
    return p.t;
}
#ifdef __OPENCL_VERSION__
static inline float fmod32(float x, float y)
{
    return fmod(x, y);
}
static inline float futrts_round32(float x)
{
    return rint(x);
}
static inline float futrts_floor32(float x)
{
    return floor(x);
}
static inline float futrts_ceil32(float x)
{
    return ceil(x);
}
static inline float futrts_lerp32(float v0, float v1, float t)
{
    return mix(v0, v1, t);
}
static inline float futrts_mad32(float a, float b, float c)
{
    return mad(a, b, c);
}
static inline float futrts_fma32(float a, float b, float c)
{
    return fma(a, b, c);
}
#else
static inline float fmod32(float x, float y)
{
    return fmodf(x, y);
}
static inline float futrts_round32(float x)
{
    return rintf(x);
}
static inline float futrts_floor32(float x)
{
    return floorf(x);
}
static inline float futrts_ceil32(float x)
{
    return ceilf(x);
}
static inline float futrts_lerp32(float v0, float v1, float t)
{
    return v0 + (v1 - v0) * t;
}
static inline float futrts_mad32(float a, float b, float c)
{
    return a * b + c;
}
static inline float futrts_fma32(float a, float b, float c)
{
    return fmaf(a, b, c);
}
#endif
// Start of atomics.h

inline int32_t atomic_add_i32_global(volatile __global int32_t *p, int32_t x) {
#ifdef FUTHARK_CUDA
  return atomicAdd((int32_t*)p, x);
#else
  return atomic_add(p, x);
#endif
}

inline int32_t atomic_add_i32_local(volatile __local int32_t *p, int32_t x) {
#ifdef FUTHARK_CUDA
  return atomicAdd((int32_t*)p, x);
#else
  return atomic_add(p, x);
#endif
}

inline float atomic_fadd_f32_global(volatile __global float *p, float x) {
#ifdef FUTHARK_CUDA
  return atomicAdd((float*)p, x);
#else
  union { int32_t i; float f; } old;
  union { int32_t i; float f; } assumed;
  old.f = *p;
  do {
    assumed.f = old.f;
    old.f = old.f + x;
    old.i = atomic_cmpxchg((volatile __global int32_t*)p, assumed.i, old.i);
  } while (assumed.i != old.i);
  return old.f;
#endif
}

inline float atomic_fadd_f32_local(volatile __local float *p, float x) {
#ifdef FUTHARK_CUDA
  return atomicAdd((float*)p, x);
#else
  union { int32_t i; float f; } old;
  union { int32_t i; float f; } assumed;
  old.f = *p;
  do {
    assumed.f = old.f;
    old.f = old.f + x;
    old.i = atomic_cmpxchg((volatile __local int32_t*)p, assumed.i, old.i);
  } while (assumed.i != old.i);
  return old.f;
#endif
}

inline int32_t atomic_smax_i32_global(volatile __global int32_t *p, int32_t x) {
#ifdef FUTHARK_CUDA
  return atomicMax((int32_t*)p, x);
#else
  return atomic_max(p, x);
#endif
}

inline int32_t atomic_smax_i32_local(volatile __local int32_t *p, int32_t x) {
#ifdef FUTHARK_CUDA
  return atomicMax((int32_t*)p, x);
#else
  return atomic_max(p, x);
#endif
}

inline int32_t atomic_smin_i32_global(volatile __global int32_t *p, int32_t x) {
#ifdef FUTHARK_CUDA
  return atomicMin((int32_t*)p, x);
#else
  return atomic_min(p, x);
#endif
}

inline int32_t atomic_smin_i32_local(volatile __local int32_t *p, int32_t x) {
#ifdef FUTHARK_CUDA
  return atomicMin((int32_t*)p, x);
#else
  return atomic_min(p, x);
#endif
}

inline uint32_t atomic_umax_i32_global(volatile __global uint32_t *p, uint32_t x) {
#ifdef FUTHARK_CUDA
  return atomicMax((uint32_t*)p, x);
#else
  return atomic_max(p, x);
#endif
}

inline uint32_t atomic_umax_i32_local(volatile __local uint32_t *p, uint32_t x) {
#ifdef FUTHARK_CUDA
  return atomicMax((uint32_t*)p, x);
#else
  return atomic_max(p, x);
#endif
}

inline uint32_t atomic_umin_i32_global(volatile __global uint32_t *p, uint32_t x) {
#ifdef FUTHARK_CUDA
  return atomicMin((uint32_t*)p, x);
#else
  return atomic_min(p, x);
#endif
}

inline uint32_t atomic_umin_i32_local(volatile __local uint32_t *p, uint32_t x) {
#ifdef FUTHARK_CUDA
  return atomicMin((uint32_t*)p, x);
#else
  return atomic_min(p, x);
#endif
}

inline int32_t atomic_and_i32_global(volatile __global int32_t *p, int32_t x) {
#ifdef FUTHARK_CUDA
  return atomicAnd((int32_t*)p, x);
#else
  return atomic_and(p, x);
#endif
}

inline int32_t atomic_and_i32_local(volatile __local int32_t *p, int32_t x) {
#ifdef FUTHARK_CUDA
  return atomicAnd((int32_t*)p, x);
#else
  return atomic_and(p, x);
#endif
}

inline int32_t atomic_or_i32_global(volatile __global int32_t *p, int32_t x) {
#ifdef FUTHARK_CUDA
  return atomicOr((int32_t*)p, x);
#else
  return atomic_or(p, x);
#endif
}

inline int32_t atomic_or_i32_local(volatile __local int32_t *p, int32_t x) {
#ifdef FUTHARK_CUDA
  return atomicOr((int32_t*)p, x);
#else
  return atomic_or(p, x);
#endif
}

inline int32_t atomic_xor_i32_global(volatile __global int32_t *p, int32_t x) {
#ifdef FUTHARK_CUDA
  return atomicXor((int32_t*)p, x);
#else
  return atomic_xor(p, x);
#endif
}

inline int32_t atomic_xor_i32_local(volatile __local int32_t *p, int32_t x) {
#ifdef FUTHARK_CUDA
  return atomicXor((int32_t*)p, x);
#else
  return atomic_xor(p, x);
#endif
}

inline int32_t atomic_xchg_i32_global(volatile __global int32_t *p, int32_t x) {
#ifdef FUTHARK_CUDA
  return atomicExch((int32_t*)p, x);
#else
  return atomic_xor(p, x);
#endif
}

inline int32_t atomic_xchg_i32_local(volatile __local int32_t *p, int32_t x) {
#ifdef FUTHARK_CUDA
  return atomicExch((int32_t*)p, x);
#else
  return atomic_xor(p, x);
#endif
}

inline int32_t atomic_cmpxchg_i32_global(volatile __global int32_t *p,
                                         int32_t cmp, int32_t val) {
#ifdef FUTHARK_CUDA
  return atomicCAS((int32_t*)p, cmp, val);
#else
  return atomic_cmpxchg(p, cmp, val);
#endif
}

inline int32_t atomic_cmpxchg_i32_local(volatile __local int32_t *p,
                                         int32_t cmp, int32_t val) {
#ifdef FUTHARK_CUDA
  return atomicCAS((int32_t*)p, cmp, val);
#else
  return atomic_cmpxchg(p, cmp, val);
#endif
}

// End of atomics.h




__kernel void gpu_map_transpose_i32(__local volatile
                                    int64_t *block_9_backing_aligned_0,
                                    int32_t destoffset_1, int32_t srcoffset_3,
                                    int32_t num_arrays_4, int32_t x_elems_5,
                                    int32_t y_elems_6, int32_t mulx_7,
                                    int32_t muly_8, __global
                                    unsigned char *destmem_0, __global
                                    unsigned char *srcmem_2)
{
    const int block_dim0 = 0;
    const int block_dim1 = 1;
    const int block_dim2 = 2;
    __local volatile char *restrict block_9_backing_0 = (__local volatile
                                                         char *) block_9_backing_aligned_0;
    __local char *block_9;
    
    block_9 = (__local char *) block_9_backing_0;
    
    int32_t get_global_id_0_37;
    
    get_global_id_0_37 = get_global_id(0);
    
    int32_t get_local_id_0_38;
    
    get_local_id_0_38 = get_local_id(0);
    
    int32_t get_local_id_1_39;
    
    get_local_id_1_39 = get_local_id(1);
    
    int32_t get_group_id_0_40;
    
    get_group_id_0_40 = get_group_id(0);
    
    int32_t get_group_id_1_41;
    
    get_group_id_1_41 = get_group_id(1);
    
    int32_t get_group_id_2_42;
    
    get_group_id_2_42 = get_group_id(2);
    
    int32_t our_array_offset_30 = get_group_id_2_42 * x_elems_5 * y_elems_6;
    int32_t odata_offset_33 = squot32(destoffset_1, 4) + our_array_offset_30;
    int32_t idata_offset_34 = squot32(srcoffset_3, 4) + our_array_offset_30;
    int32_t x_index_31 = get_global_id_0_37;
    int32_t y_index_32 = get_group_id_1_41 * 32 + get_local_id_1_39;
    
    if (slt32(x_index_31, x_elems_5)) {
        for (int32_t j_43 = 0; j_43 < 4; j_43++) {
            int32_t index_in_35 = (y_index_32 + j_43 * 8) * x_elems_5 +
                    x_index_31;
            
            if (slt32(y_index_32 + j_43 * 8, y_elems_6)) {
                ((__local int32_t *) block_9)[sext_i32_i64((get_local_id_1_39 +
                                                            j_43 * 8) * 33 +
                                              get_local_id_0_38)] = ((__global
                                                                      int32_t *) srcmem_2)[sext_i32_i64(idata_offset_34 +
                                                                                           index_in_35)];
            }
        }
    }
    barrier(CLK_LOCAL_MEM_FENCE);
    x_index_31 = get_group_id_1_41 * 32 + get_local_id_0_38;
    y_index_32 = get_group_id_0_40 * 32 + get_local_id_1_39;
    if (slt32(x_index_31, y_elems_6)) {
        for (int32_t j_43 = 0; j_43 < 4; j_43++) {
            int32_t index_out_36 = (y_index_32 + j_43 * 8) * y_elems_6 +
                    x_index_31;
            
            if (slt32(y_index_32 + j_43 * 8, x_elems_5)) {
                ((__global int32_t *) destmem_0)[sext_i32_i64(odata_offset_33 +
                                                 index_out_36)] = ((__local
                                                                    int32_t *) block_9)[sext_i32_i64(get_local_id_0_38 *
                                                                                        33 +
                                                                                        get_local_id_1_39 +
                                                                                        j_43 *
                                                                                        8)];
            }
        }
    }
    
  error_0:
    return;
}
__kernel void gpu_map_transpose_i32_low_height(__local volatile
                                               int64_t *block_9_backing_aligned_0,
                                               int32_t destoffset_1,
                                               int32_t srcoffset_3,
                                               int32_t num_arrays_4,
                                               int32_t x_elems_5,
                                               int32_t y_elems_6,
                                               int32_t mulx_7, int32_t muly_8,
                                               __global
                                               unsigned char *destmem_0,
                                               __global unsigned char *srcmem_2)
{
    const int block_dim0 = 0;
    const int block_dim1 = 1;
    const int block_dim2 = 2;
    __local volatile char *restrict block_9_backing_0 = (__local volatile
                                                         char *) block_9_backing_aligned_0;
    __local char *block_9;
    
    block_9 = (__local char *) block_9_backing_0;
    
    int32_t get_global_id_0_37;
    
    get_global_id_0_37 = get_global_id(0);
    
    int32_t get_local_id_0_38;
    
    get_local_id_0_38 = get_local_id(0);
    
    int32_t get_local_id_1_39;
    
    get_local_id_1_39 = get_local_id(1);
    
    int32_t get_group_id_0_40;
    
    get_group_id_0_40 = get_group_id(0);
    
    int32_t get_group_id_1_41;
    
    get_group_id_1_41 = get_group_id(1);
    
    int32_t get_group_id_2_42;
    
    get_group_id_2_42 = get_group_id(2);
    
    int32_t our_array_offset_30 = get_group_id_2_42 * x_elems_5 * y_elems_6;
    int32_t odata_offset_33 = squot32(destoffset_1, 4) + our_array_offset_30;
    int32_t idata_offset_34 = squot32(srcoffset_3, 4) + our_array_offset_30;
    int32_t x_index_31 = get_group_id_0_40 * 16 * mulx_7 + get_local_id_0_38 +
            srem32(get_local_id_1_39, mulx_7) * 16;
    int32_t y_index_32 = get_group_id_1_41 * 16 + squot32(get_local_id_1_39,
                                                          mulx_7);
    int32_t index_in_35 = y_index_32 * x_elems_5 + x_index_31;
    
    if (slt32(x_index_31, x_elems_5) && slt32(y_index_32, y_elems_6)) {
        ((__local int32_t *) block_9)[sext_i32_i64(get_local_id_1_39 * 17 +
                                      get_local_id_0_38)] = ((__global
                                                              int32_t *) srcmem_2)[sext_i32_i64(idata_offset_34 +
                                                                                   index_in_35)];
    }
    barrier(CLK_LOCAL_MEM_FENCE);
    x_index_31 = get_group_id_1_41 * 16 + squot32(get_local_id_0_38, mulx_7);
    y_index_32 = get_group_id_0_40 * 16 * mulx_7 + get_local_id_1_39 +
        srem32(get_local_id_0_38, mulx_7) * 16;
    
    int32_t index_out_36 = y_index_32 * y_elems_6 + x_index_31;
    
    if (slt32(x_index_31, y_elems_6) && slt32(y_index_32, x_elems_5)) {
        ((__global int32_t *) destmem_0)[sext_i32_i64(odata_offset_33 +
                                         index_out_36)] = ((__local
                                                            int32_t *) block_9)[sext_i32_i64(get_local_id_0_38 *
                                                                                17 +
                                                                                get_local_id_1_39)];
    }
    
  error_0:
    return;
}
__kernel void gpu_map_transpose_i32_low_width(__local volatile
                                              int64_t *block_9_backing_aligned_0,
                                              int32_t destoffset_1,
                                              int32_t srcoffset_3,
                                              int32_t num_arrays_4,
                                              int32_t x_elems_5,
                                              int32_t y_elems_6, int32_t mulx_7,
                                              int32_t muly_8, __global
                                              unsigned char *destmem_0, __global
                                              unsigned char *srcmem_2)
{
    const int block_dim0 = 0;
    const int block_dim1 = 1;
    const int block_dim2 = 2;
    __local volatile char *restrict block_9_backing_0 = (__local volatile
                                                         char *) block_9_backing_aligned_0;
    __local char *block_9;
    
    block_9 = (__local char *) block_9_backing_0;
    
    int32_t get_global_id_0_37;
    
    get_global_id_0_37 = get_global_id(0);
    
    int32_t get_local_id_0_38;
    
    get_local_id_0_38 = get_local_id(0);
    
    int32_t get_local_id_1_39;
    
    get_local_id_1_39 = get_local_id(1);
    
    int32_t get_group_id_0_40;
    
    get_group_id_0_40 = get_group_id(0);
    
    int32_t get_group_id_1_41;
    
    get_group_id_1_41 = get_group_id(1);
    
    int32_t get_group_id_2_42;
    
    get_group_id_2_42 = get_group_id(2);
    
    int32_t our_array_offset_30 = get_group_id_2_42 * x_elems_5 * y_elems_6;
    int32_t odata_offset_33 = squot32(destoffset_1, 4) + our_array_offset_30;
    int32_t idata_offset_34 = squot32(srcoffset_3, 4) + our_array_offset_30;
    int32_t x_index_31 = get_group_id_0_40 * 16 + squot32(get_local_id_0_38,
                                                          muly_8);
    int32_t y_index_32 = get_group_id_1_41 * 16 * muly_8 + get_local_id_1_39 +
            srem32(get_local_id_0_38, muly_8) * 16;
    int32_t index_in_35 = y_index_32 * x_elems_5 + x_index_31;
    
    if (slt32(x_index_31, x_elems_5) && slt32(y_index_32, y_elems_6)) {
        ((__local int32_t *) block_9)[sext_i32_i64(get_local_id_1_39 * 17 +
                                      get_local_id_0_38)] = ((__global
                                                              int32_t *) srcmem_2)[sext_i32_i64(idata_offset_34 +
                                                                                   index_in_35)];
    }
    barrier(CLK_LOCAL_MEM_FENCE);
    x_index_31 = get_group_id_1_41 * 16 * muly_8 + get_local_id_0_38 +
        srem32(get_local_id_1_39, muly_8) * 16;
    y_index_32 = get_group_id_0_40 * 16 + squot32(get_local_id_1_39, muly_8);
    
    int32_t index_out_36 = y_index_32 * y_elems_6 + x_index_31;
    
    if (slt32(x_index_31, y_elems_6) && slt32(y_index_32, x_elems_5)) {
        ((__global int32_t *) destmem_0)[sext_i32_i64(odata_offset_33 +
                                         index_out_36)] = ((__local
                                                            int32_t *) block_9)[sext_i32_i64(get_local_id_0_38 *
                                                                                17 +
                                                                                get_local_id_1_39)];
    }
    
  error_0:
    return;
}
__kernel void gpu_map_transpose_i32_small(__local volatile
                                          int64_t *block_9_backing_aligned_0,
                                          int32_t destoffset_1,
                                          int32_t srcoffset_3,
                                          int32_t num_arrays_4,
                                          int32_t x_elems_5, int32_t y_elems_6,
                                          int32_t mulx_7, int32_t muly_8,
                                          __global unsigned char *destmem_0,
                                          __global unsigned char *srcmem_2)
{
    const int block_dim0 = 0;
    const int block_dim1 = 1;
    const int block_dim2 = 2;
    __local volatile char *restrict block_9_backing_0 = (__local volatile
                                                         char *) block_9_backing_aligned_0;
    __local char *block_9;
    
    block_9 = (__local char *) block_9_backing_0;
    
    int32_t get_global_id_0_37;
    
    get_global_id_0_37 = get_global_id(0);
    
    int32_t get_local_id_0_38;
    
    get_local_id_0_38 = get_local_id(0);
    
    int32_t get_local_id_1_39;
    
    get_local_id_1_39 = get_local_id(1);
    
    int32_t get_group_id_0_40;
    
    get_group_id_0_40 = get_group_id(0);
    
    int32_t get_group_id_1_41;
    
    get_group_id_1_41 = get_group_id(1);
    
    int32_t get_group_id_2_42;
    
    get_group_id_2_42 = get_group_id(2);
    
    int32_t our_array_offset_30 = squot32(get_global_id_0_37, y_elems_6 *
                                          x_elems_5) * (y_elems_6 * x_elems_5);
    int32_t x_index_31 = squot32(srem32(get_global_id_0_37, y_elems_6 *
                                        x_elems_5), y_elems_6);
    int32_t y_index_32 = srem32(get_global_id_0_37, y_elems_6);
    int32_t odata_offset_33 = squot32(destoffset_1, 4) + our_array_offset_30;
    int32_t idata_offset_34 = squot32(srcoffset_3, 4) + our_array_offset_30;
    int32_t index_in_35 = y_index_32 * x_elems_5 + x_index_31;
    int32_t index_out_36 = x_index_31 * y_elems_6 + y_index_32;
    
    if (slt32(get_global_id_0_37, x_elems_5 * y_elems_6 * num_arrays_4)) {
        ((__global int32_t *) destmem_0)[sext_i32_i64(odata_offset_33 +
                                         index_out_36)] = ((__global
                                                            int32_t *) srcmem_2)[sext_i32_i64(idata_offset_34 +
                                                                                 index_in_35)];
    }
    
  error_0:
    return;
}
__kernel void mainziscan_stage1_4828(__global int *global_failure,
                                     __local volatile
                                     int64_t *scan_arr_mem_5084_backing_aligned_0,
                                     int64_t i32_res_4697, int64_t m_4701,
                                     __global unsigned char *mem_param_4985,
                                     __global unsigned char *mem_4991,
                                     int32_t num_threads_5078)
{
    #define segscan_group_sizze_4870 (mainzisegscan_group_sizze_4822)
    
    const int block_dim0 = 0;
    const int block_dim1 = 1;
    const int block_dim2 = 2;
    __local volatile char *restrict scan_arr_mem_5084_backing_0 =
                          (__local volatile
                           char *) scan_arr_mem_5084_backing_aligned_0;
    
    if (*global_failure >= 0)
        return;
    
    int32_t global_tid_5079;
    int32_t local_tid_5080;
    int64_t group_sizze_5083;
    int32_t wave_sizze_5082;
    int32_t group_tid_5081;
    
    global_tid_5079 = get_global_id(0);
    local_tid_5080 = get_local_id(0);
    group_sizze_5083 = get_local_size(0);
    wave_sizze_5082 = LOCKSTEP_WIDTH;
    group_tid_5081 = get_group_id(0);
    
    int32_t phys_tid_4828;
    
    phys_tid_4828 = global_tid_5079;
    
    __local char *scan_arr_mem_5084;
    
    scan_arr_mem_5084 = (__local char *) scan_arr_mem_5084_backing_0;
    
    int32_t x_4874;
    int32_t x_4875;
    
    x_4874 = 0;
    for (int64_t j_5086 = 0; j_5086 < sdiv_up64(m_4701 * i32_res_4697,
                                                sext_i32_i64(num_threads_5078));
         j_5086++) {
        int64_t chunk_offset_5087 = segscan_group_sizze_4870 * j_5086 +
                sext_i32_i64(group_tid_5081) * (segscan_group_sizze_4870 *
                                                sdiv_up64(m_4701 * i32_res_4697,
                                                          sext_i32_i64(num_threads_5078)));
        int64_t flat_idx_5088 = chunk_offset_5087 +
                sext_i32_i64(local_tid_5080);
        int64_t gtid_4819 = squot64(flat_idx_5088, i32_res_4697);
        int64_t gtid_4827 = flat_idx_5088 - squot64(flat_idx_5088,
                                                    i32_res_4697) *
                i32_res_4697;
        
        // threads in bounds read input
        {
            if (slt64(gtid_4819, m_4701) && slt64(gtid_4827, i32_res_4697)) {
                int32_t index_primexp_4892 = sext_i64_i32(gtid_4819);
                int32_t x_4879 = ((__global
                                   int32_t *) mem_param_4985)[gtid_4819 *
                                                              i32_res_4697 +
                                                              gtid_4827];
                int32_t defunc_0_f_res_4880 = add32(x_4879, index_primexp_4892);
                
                // write to-scan values to parameters
                {
                    x_4875 = defunc_0_f_res_4880;
                }
                // write mapped values results to global memory
                { }
            }
        }
        // do one intra-group scan operation
        {
            // maybe restore some to-scan values to parameters, or read neutral
            {
                if (!(slt64(gtid_4819, m_4701) && slt64(gtid_4827,
                                                        i32_res_4697))) {
                    x_4875 = 0;
                }
            }
            // combine with carry and write to local memory
            {
                int32_t defunc_1_op_res_4876 = add32(x_4874, x_4875);
                
                ((__local
                  int32_t *) scan_arr_mem_5084)[sext_i32_i64(local_tid_5080)] =
                    defunc_1_op_res_4876;
            }
            barrier(CLK_LOCAL_MEM_FENCE);
            
            int32_t x_5089;
            int32_t x_5090;
            int32_t x_5092;
            int32_t x_5093;
            bool ltid_in_bounds_5095;
            
            ltid_in_bounds_5095 = slt64(sext_i32_i64(local_tid_5080),
                                        segscan_group_sizze_4870);
            
            int32_t skip_threads_5096;
            
            // read input for in-block scan
            {
                if (ltid_in_bounds_5095) {
                    x_5090 = ((volatile __local
                               int32_t *) scan_arr_mem_5084)[sext_i32_i64(local_tid_5080)];
                    if ((local_tid_5080 - squot32(local_tid_5080, 32) * 32) ==
                        0) {
                        x_5089 = x_5090;
                    }
                }
            }
            // in-block scan (hopefully no barriers needed)
            {
                skip_threads_5096 = 1;
                while (slt32(skip_threads_5096, 32)) {
                    if (sle32(skip_threads_5096, local_tid_5080 -
                              squot32(local_tid_5080, 32) * 32) &&
                        ltid_in_bounds_5095) {
                        // read operands
                        {
                            x_5089 = ((volatile __local
                                       int32_t *) scan_arr_mem_5084)[sext_i32_i64(local_tid_5080) -
                                                                     sext_i32_i64(skip_threads_5096)];
                        }
                        // perform operation
                        {
                            bool inactive_5097 =
                                 slt64(srem64(sext_i32_i64(local_tid_5080) +
                                              chunk_offset_5087, i32_res_4697),
                                       sext_i32_i64(local_tid_5080) +
                                       chunk_offset_5087 -
                                       (sext_i32_i64(local_tid_5080 -
                                        skip_threads_5096) +
                                        chunk_offset_5087));
                            
                            if (inactive_5097) {
                                x_5089 = x_5090;
                            }
                            if (!inactive_5097) {
                                int32_t defunc_1_op_res_5091 = add32(x_5089,
                                                                     x_5090);
                                
                                x_5089 = defunc_1_op_res_5091;
                            }
                        }
                    }
                    if (sle32(wave_sizze_5082, skip_threads_5096)) {
                        barrier(CLK_LOCAL_MEM_FENCE);
                    }
                    if (sle32(skip_threads_5096, local_tid_5080 -
                              squot32(local_tid_5080, 32) * 32) &&
                        ltid_in_bounds_5095) {
                        // write result
                        {
                            ((volatile __local
                              int32_t *) scan_arr_mem_5084)[sext_i32_i64(local_tid_5080)] =
                                x_5089;
                            x_5090 = x_5089;
                        }
                    }
                    if (sle32(wave_sizze_5082, skip_threads_5096)) {
                        barrier(CLK_LOCAL_MEM_FENCE);
                    }
                    skip_threads_5096 *= 2;
                }
            }
            barrier(CLK_LOCAL_MEM_FENCE);
            // last thread of block 'i' writes its result to offset 'i'
            {
                if ((local_tid_5080 - squot32(local_tid_5080, 32) * 32) == 31 &&
                    ltid_in_bounds_5095) {
                    ((volatile __local
                      int32_t *) scan_arr_mem_5084)[sext_i32_i64(squot32(local_tid_5080,
                                                                         32))] =
                        x_5089;
                }
            }
            barrier(CLK_LOCAL_MEM_FENCE);
            // scan the first block, after which offset 'i' contains carry-in for block 'i+1'
            {
                int32_t skip_threads_5098;
                
                // read input for in-block scan
                {
                    if (squot32(local_tid_5080, 32) == 0 &&
                        ltid_in_bounds_5095) {
                        x_5093 = ((volatile __local
                                   int32_t *) scan_arr_mem_5084)[sext_i32_i64(local_tid_5080)];
                        if ((local_tid_5080 - squot32(local_tid_5080, 32) *
                             32) == 0) {
                            x_5092 = x_5093;
                        }
                    }
                }
                // in-block scan (hopefully no barriers needed)
                {
                    skip_threads_5098 = 1;
                    while (slt32(skip_threads_5098, 32)) {
                        if (sle32(skip_threads_5098, local_tid_5080 -
                                  squot32(local_tid_5080, 32) * 32) &&
                            (squot32(local_tid_5080, 32) == 0 &&
                             ltid_in_bounds_5095)) {
                            // read operands
                            {
                                x_5092 = ((volatile __local
                                           int32_t *) scan_arr_mem_5084)[sext_i32_i64(local_tid_5080) -
                                                                         sext_i32_i64(skip_threads_5098)];
                            }
                            // perform operation
                            {
                                bool inactive_5099 =
                                     slt64(srem64(sext_i32_i64(local_tid_5080 *
                                                  32 + 32 - 1) +
                                                  chunk_offset_5087,
                                                  i32_res_4697),
                                           sext_i32_i64(local_tid_5080 * 32 +
                                           32 - 1) + chunk_offset_5087 -
                                           (sext_i32_i64((local_tid_5080 -
                                                          skip_threads_5098) *
                                            32 + 32 - 1) + chunk_offset_5087));
                                
                                if (inactive_5099) {
                                    x_5092 = x_5093;
                                }
                                if (!inactive_5099) {
                                    int32_t defunc_1_op_res_5094 = add32(x_5092,
                                                                         x_5093);
                                    
                                    x_5092 = defunc_1_op_res_5094;
                                }
                            }
                        }
                        if (sle32(wave_sizze_5082, skip_threads_5098)) {
                            barrier(CLK_LOCAL_MEM_FENCE);
                        }
                        if (sle32(skip_threads_5098, local_tid_5080 -
                                  squot32(local_tid_5080, 32) * 32) &&
                            (squot32(local_tid_5080, 32) == 0 &&
                             ltid_in_bounds_5095)) {
                            // write result
                            {
                                ((volatile __local
                                  int32_t *) scan_arr_mem_5084)[sext_i32_i64(local_tid_5080)] =
                                    x_5092;
                                x_5093 = x_5092;
                            }
                        }
                        if (sle32(wave_sizze_5082, skip_threads_5098)) {
                            barrier(CLK_LOCAL_MEM_FENCE);
                        }
                        skip_threads_5098 *= 2;
                    }
                }
            }
            barrier(CLK_LOCAL_MEM_FENCE);
            // carry-in for every block except the first
            {
                if (!(squot32(local_tid_5080, 32) == 0 ||
                      !ltid_in_bounds_5095)) {
                    // read operands
                    {
                        x_5090 = x_5089;
                        x_5089 = ((__local
                                   int32_t *) scan_arr_mem_5084)[sext_i32_i64(squot32(local_tid_5080,
                                                                                      32)) -
                                                                 1];
                    }
                    // perform operation
                    {
                        bool inactive_5100 =
                             slt64(srem64(sext_i32_i64(local_tid_5080) +
                                          chunk_offset_5087, i32_res_4697),
                                   sext_i32_i64(local_tid_5080) +
                                   chunk_offset_5087 -
                                   (sext_i32_i64(squot32(local_tid_5080, 32) *
                                    32 - 1) + chunk_offset_5087));
                        
                        if (inactive_5100) {
                            x_5089 = x_5090;
                        }
                        if (!inactive_5100) {
                            int32_t defunc_1_op_res_5091 = add32(x_5089,
                                                                 x_5090);
                            
                            x_5089 = defunc_1_op_res_5091;
                        }
                    }
                    // write final result
                    {
                        ((__local
                          int32_t *) scan_arr_mem_5084)[sext_i32_i64(local_tid_5080)] =
                            x_5089;
                    }
                }
            }
            barrier(CLK_LOCAL_MEM_FENCE);
            // restore correct values for first block
            {
                if (squot32(local_tid_5080, 32) == 0) {
                    ((__local
                      int32_t *) scan_arr_mem_5084)[sext_i32_i64(local_tid_5080)] =
                        x_5090;
                }
            }
            barrier(CLK_LOCAL_MEM_FENCE);
            // threads in bounds write partial scan result
            {
                if (slt64(gtid_4819, m_4701) && slt64(gtid_4827,
                                                      i32_res_4697)) {
                    ((__global int32_t *) mem_4991)[gtid_4819 * i32_res_4697 +
                                                    gtid_4827] = ((__local
                                                                   int32_t *) scan_arr_mem_5084)[sext_i32_i64(local_tid_5080)];
                }
            }
            barrier(CLK_LOCAL_MEM_FENCE);
            // first thread reads last element as carry-in for next iteration
            {
                bool crosses_segment_5101 = slt64(srem64(chunk_offset_5087 +
                                                         segscan_group_sizze_4870,
                                                         i32_res_4697),
                                                  chunk_offset_5087 +
                                                  segscan_group_sizze_4870 -
                                                  (chunk_offset_5087 +
                                                   segscan_group_sizze_4870 -
                                                   1));
                bool should_load_carry_5102 = local_tid_5080 == 0 &&
                     !crosses_segment_5101;
                
                if (should_load_carry_5102) {
                    x_4874 = ((__local
                               int32_t *) scan_arr_mem_5084)[segscan_group_sizze_4870 -
                                                             1];
                }
                if (!should_load_carry_5102) {
                    x_4874 = 0;
                }
            }
            barrier(CLK_LOCAL_MEM_FENCE);
        }
    }
    
  error_1:
    return;
    #undef segscan_group_sizze_4870
}
__kernel void mainziscan_stage2_4828(__global int *global_failure,
                                     __local volatile
                                     int64_t *scan_arr_mem_5108_backing_aligned_0,
                                     int64_t i32_res_4697, int64_t m_4701,
                                     __global unsigned char *mem_4991,
                                     int64_t stage1_num_groups_5077,
                                     int32_t num_threads_5078)
{
    #define segscan_group_sizze_4870 (mainzisegscan_group_sizze_4822)
    
    const int block_dim0 = 0;
    const int block_dim1 = 1;
    const int block_dim2 = 2;
    __local volatile char *restrict scan_arr_mem_5108_backing_0 =
                          (__local volatile
                           char *) scan_arr_mem_5108_backing_aligned_0;
    
    if (*global_failure >= 0)
        return;
    
    int32_t global_tid_5103;
    int32_t local_tid_5104;
    int64_t group_sizze_5107;
    int32_t wave_sizze_5106;
    int32_t group_tid_5105;
    
    global_tid_5103 = get_global_id(0);
    local_tid_5104 = get_local_id(0);
    group_sizze_5107 = get_local_size(0);
    wave_sizze_5106 = LOCKSTEP_WIDTH;
    group_tid_5105 = get_group_id(0);
    
    int32_t phys_tid_4828;
    
    phys_tid_4828 = global_tid_5103;
    
    __local char *scan_arr_mem_5108;
    
    scan_arr_mem_5108 = (__local char *) scan_arr_mem_5108_backing_0;
    
    int64_t flat_idx_5110;
    
    flat_idx_5110 = (sext_i32_i64(local_tid_5104) + 1) *
        (segscan_group_sizze_4870 * sdiv_up64(m_4701 * i32_res_4697,
                                              sext_i32_i64(num_threads_5078))) -
        1;
    
    int64_t gtid_4819;
    
    gtid_4819 = squot64(flat_idx_5110, i32_res_4697);
    
    int64_t gtid_4827;
    
    gtid_4827 = flat_idx_5110 - squot64(flat_idx_5110, i32_res_4697) *
        i32_res_4697;
    // threads in bound read carries; others get neutral element
    {
        if (slt64(gtid_4819, m_4701) && slt64(gtid_4827, i32_res_4697)) {
            ((__local
              int32_t *) scan_arr_mem_5108)[sext_i32_i64(local_tid_5104)] =
                ((__global int32_t *) mem_4991)[gtid_4819 * i32_res_4697 +
                                                gtid_4827];
        } else {
            ((__local
              int32_t *) scan_arr_mem_5108)[sext_i32_i64(local_tid_5104)] = 0;
        }
    }
    barrier(CLK_LOCAL_MEM_FENCE);
    
    int32_t x_4874;
    int32_t x_4875;
    int32_t x_5111;
    int32_t x_5112;
    bool ltid_in_bounds_5114;
    
    ltid_in_bounds_5114 = slt64(sext_i32_i64(local_tid_5104),
                                stage1_num_groups_5077);
    
    int32_t skip_threads_5115;
    
    // read input for in-block scan
    {
        if (ltid_in_bounds_5114) {
            x_4875 = ((volatile __local
                       int32_t *) scan_arr_mem_5108)[sext_i32_i64(local_tid_5104)];
            if ((local_tid_5104 - squot32(local_tid_5104, 32) * 32) == 0) {
                x_4874 = x_4875;
            }
        }
    }
    // in-block scan (hopefully no barriers needed)
    {
        skip_threads_5115 = 1;
        while (slt32(skip_threads_5115, 32)) {
            if (sle32(skip_threads_5115, local_tid_5104 -
                      squot32(local_tid_5104, 32) * 32) &&
                ltid_in_bounds_5114) {
                // read operands
                {
                    x_4874 = ((volatile __local
                               int32_t *) scan_arr_mem_5108)[sext_i32_i64(local_tid_5104) -
                                                             sext_i32_i64(skip_threads_5115)];
                }
                // perform operation
                {
                    bool inactive_5116 =
                         slt64(srem64((sext_i32_i64(local_tid_5104) + 1) *
                                      (segscan_group_sizze_4870 *
                                       sdiv_up64(m_4701 * i32_res_4697,
                                                 sext_i32_i64(num_threads_5078))) -
                                      1, i32_res_4697),
                               (sext_i32_i64(local_tid_5104) + 1) *
                               (segscan_group_sizze_4870 * sdiv_up64(m_4701 *
                                                                     i32_res_4697,
                                                                     sext_i32_i64(num_threads_5078))) -
                               1 - ((sext_i32_i64(local_tid_5104 -
                                     skip_threads_5115) + 1) *
                                    (segscan_group_sizze_4870 *
                                     sdiv_up64(m_4701 * i32_res_4697,
                                               sext_i32_i64(num_threads_5078))) -
                                    1));
                    
                    if (inactive_5116) {
                        x_4874 = x_4875;
                    }
                    if (!inactive_5116) {
                        int32_t defunc_1_op_res_4876 = add32(x_4874, x_4875);
                        
                        x_4874 = defunc_1_op_res_4876;
                    }
                }
            }
            if (sle32(wave_sizze_5106, skip_threads_5115)) {
                barrier(CLK_LOCAL_MEM_FENCE);
            }
            if (sle32(skip_threads_5115, local_tid_5104 -
                      squot32(local_tid_5104, 32) * 32) &&
                ltid_in_bounds_5114) {
                // write result
                {
                    ((volatile __local
                      int32_t *) scan_arr_mem_5108)[sext_i32_i64(local_tid_5104)] =
                        x_4874;
                    x_4875 = x_4874;
                }
            }
            if (sle32(wave_sizze_5106, skip_threads_5115)) {
                barrier(CLK_LOCAL_MEM_FENCE);
            }
            skip_threads_5115 *= 2;
        }
    }
    barrier(CLK_LOCAL_MEM_FENCE);
    // last thread of block 'i' writes its result to offset 'i'
    {
        if ((local_tid_5104 - squot32(local_tid_5104, 32) * 32) == 31 &&
            ltid_in_bounds_5114) {
            ((volatile __local
              int32_t *) scan_arr_mem_5108)[sext_i32_i64(squot32(local_tid_5104,
                                                                 32))] = x_4874;
        }
    }
    barrier(CLK_LOCAL_MEM_FENCE);
    // scan the first block, after which offset 'i' contains carry-in for block 'i+1'
    {
        int32_t skip_threads_5117;
        
        // read input for in-block scan
        {
            if (squot32(local_tid_5104, 32) == 0 && ltid_in_bounds_5114) {
                x_5112 = ((volatile __local
                           int32_t *) scan_arr_mem_5108)[sext_i32_i64(local_tid_5104)];
                if ((local_tid_5104 - squot32(local_tid_5104, 32) * 32) == 0) {
                    x_5111 = x_5112;
                }
            }
        }
        // in-block scan (hopefully no barriers needed)
        {
            skip_threads_5117 = 1;
            while (slt32(skip_threads_5117, 32)) {
                if (sle32(skip_threads_5117, local_tid_5104 -
                          squot32(local_tid_5104, 32) * 32) &&
                    (squot32(local_tid_5104, 32) == 0 && ltid_in_bounds_5114)) {
                    // read operands
                    {
                        x_5111 = ((volatile __local
                                   int32_t *) scan_arr_mem_5108)[sext_i32_i64(local_tid_5104) -
                                                                 sext_i32_i64(skip_threads_5117)];
                    }
                    // perform operation
                    {
                        bool inactive_5118 =
                             slt64(srem64((sext_i32_i64(local_tid_5104 * 32 +
                                           32 - 1) + 1) *
                                          (segscan_group_sizze_4870 *
                                           sdiv_up64(m_4701 * i32_res_4697,
                                                     sext_i32_i64(num_threads_5078))) -
                                          1, i32_res_4697),
                                   (sext_i32_i64(local_tid_5104 * 32 + 32 - 1) +
                                    1) * (segscan_group_sizze_4870 *
                                          sdiv_up64(m_4701 * i32_res_4697,
                                                    sext_i32_i64(num_threads_5078))) -
                                   1 - ((sext_i32_i64((local_tid_5104 -
                                                       skip_threads_5117) * 32 +
                                         32 - 1) + 1) *
                                        (segscan_group_sizze_4870 *
                                         sdiv_up64(m_4701 * i32_res_4697,
                                                   sext_i32_i64(num_threads_5078))) -
                                        1));
                        
                        if (inactive_5118) {
                            x_5111 = x_5112;
                        }
                        if (!inactive_5118) {
                            int32_t defunc_1_op_res_5113 = add32(x_5111,
                                                                 x_5112);
                            
                            x_5111 = defunc_1_op_res_5113;
                        }
                    }
                }
                if (sle32(wave_sizze_5106, skip_threads_5117)) {
                    barrier(CLK_LOCAL_MEM_FENCE);
                }
                if (sle32(skip_threads_5117, local_tid_5104 -
                          squot32(local_tid_5104, 32) * 32) &&
                    (squot32(local_tid_5104, 32) == 0 && ltid_in_bounds_5114)) {
                    // write result
                    {
                        ((volatile __local
                          int32_t *) scan_arr_mem_5108)[sext_i32_i64(local_tid_5104)] =
                            x_5111;
                        x_5112 = x_5111;
                    }
                }
                if (sle32(wave_sizze_5106, skip_threads_5117)) {
                    barrier(CLK_LOCAL_MEM_FENCE);
                }
                skip_threads_5117 *= 2;
            }
        }
    }
    barrier(CLK_LOCAL_MEM_FENCE);
    // carry-in for every block except the first
    {
        if (!(squot32(local_tid_5104, 32) == 0 || !ltid_in_bounds_5114)) {
            // read operands
            {
                x_4875 = x_4874;
                x_4874 = ((__local
                           int32_t *) scan_arr_mem_5108)[sext_i32_i64(squot32(local_tid_5104,
                                                                              32)) -
                                                         1];
            }
            // perform operation
            {
                bool inactive_5119 =
                     slt64(srem64((sext_i32_i64(local_tid_5104) + 1) *
                                  (segscan_group_sizze_4870 * sdiv_up64(m_4701 *
                                                                        i32_res_4697,
                                                                        sext_i32_i64(num_threads_5078))) -
                                  1, i32_res_4697),
                           (sext_i32_i64(local_tid_5104) + 1) *
                           (segscan_group_sizze_4870 * sdiv_up64(m_4701 *
                                                                 i32_res_4697,
                                                                 sext_i32_i64(num_threads_5078))) -
                           1 - ((sext_i32_i64(squot32(local_tid_5104, 32) * 32 -
                                 1) + 1) * (segscan_group_sizze_4870 *
                                            sdiv_up64(m_4701 * i32_res_4697,
                                                      sext_i32_i64(num_threads_5078))) -
                                1));
                
                if (inactive_5119) {
                    x_4874 = x_4875;
                }
                if (!inactive_5119) {
                    int32_t defunc_1_op_res_4876 = add32(x_4874, x_4875);
                    
                    x_4874 = defunc_1_op_res_4876;
                }
            }
            // write final result
            {
                ((__local
                  int32_t *) scan_arr_mem_5108)[sext_i32_i64(local_tid_5104)] =
                    x_4874;
            }
        }
    }
    barrier(CLK_LOCAL_MEM_FENCE);
    // restore correct values for first block
    {
        if (squot32(local_tid_5104, 32) == 0) {
            ((__local
              int32_t *) scan_arr_mem_5108)[sext_i32_i64(local_tid_5104)] =
                x_4875;
        }
    }
    barrier(CLK_LOCAL_MEM_FENCE);
    // threads in bounds write scanned carries
    {
        if (slt64(gtid_4819, m_4701) && slt64(gtid_4827, i32_res_4697)) {
            ((__global int32_t *) mem_4991)[gtid_4819 * i32_res_4697 +
                                            gtid_4827] = ((__local
                                                           int32_t *) scan_arr_mem_5108)[sext_i32_i64(local_tid_5104)];
        }
    }
    
  error_0:
    return;
    #undef segscan_group_sizze_4870
}
__kernel void mainziscan_stage3_4828(__global int *global_failure,
                                     int64_t i32_res_4697, int64_t m_4701,
                                     int64_t num_groups_4871, __global
                                     unsigned char *mem_4991,
                                     int32_t num_threads_5078,
                                     int32_t required_groups_5120)
{
    #define segscan_group_sizze_4870 (mainzisegscan_group_sizze_4822)
    
    const int block_dim0 = 0;
    const int block_dim1 = 1;
    const int block_dim2 = 2;
    
    if (*global_failure >= 0)
        return;
    
    int32_t global_tid_5121;
    int32_t local_tid_5122;
    int64_t group_sizze_5125;
    int32_t wave_sizze_5124;
    int32_t group_tid_5123;
    
    global_tid_5121 = get_global_id(0);
    local_tid_5122 = get_local_id(0);
    group_sizze_5125 = get_local_size(0);
    wave_sizze_5124 = LOCKSTEP_WIDTH;
    group_tid_5123 = get_group_id(0);
    
    int32_t phys_tid_4828;
    
    phys_tid_4828 = global_tid_5121;
    
    int32_t phys_group_id_5126;
    
    phys_group_id_5126 = get_group_id(0);
    for (int32_t i_5127 = 0; i_5127 < sdiv_up32(required_groups_5120 -
                                                phys_group_id_5126,
                                                sext_i64_i32(num_groups_4871));
         i_5127++) {
        int32_t virt_group_id_5128 = phys_group_id_5126 + i_5127 *
                sext_i64_i32(num_groups_4871);
        int64_t flat_idx_5129 = sext_i32_i64(virt_group_id_5128) *
                segscan_group_sizze_4870 + sext_i32_i64(local_tid_5122);
        int64_t gtid_4819 = squot64(flat_idx_5129, i32_res_4697);
        int64_t gtid_4827 = flat_idx_5129 - squot64(flat_idx_5129,
                                                    i32_res_4697) *
                i32_res_4697;
        int64_t orig_group_5130 = squot64(flat_idx_5129,
                                          segscan_group_sizze_4870 *
                                          sdiv_up64(m_4701 * i32_res_4697,
                                                    sext_i32_i64(num_threads_5078)));
        int64_t carry_in_flat_idx_5131 = orig_group_5130 *
                (segscan_group_sizze_4870 * sdiv_up64(m_4701 * i32_res_4697,
                                                      sext_i32_i64(num_threads_5078))) -
                1;
        
        if (slt64(gtid_4819, m_4701) && slt64(gtid_4827, i32_res_4697)) {
            if (!(orig_group_5130 == 0 || (flat_idx_5129 == (orig_group_5130 +
                                                             1) *
                                           (segscan_group_sizze_4870 *
                                            sdiv_up64(m_4701 * i32_res_4697,
                                                      sext_i32_i64(num_threads_5078))) -
                                           1 || slt64(srem64(flat_idx_5129,
                                                             i32_res_4697),
                                                      flat_idx_5129 -
                                                      carry_in_flat_idx_5131)))) {
                int32_t x_4874;
                int32_t x_4875;
                
                x_4874 = ((__global
                           int32_t *) mem_4991)[squot64(carry_in_flat_idx_5131,
                                                        i32_res_4697) *
                                                i32_res_4697 +
                                                (carry_in_flat_idx_5131 -
                                                 squot64(carry_in_flat_idx_5131,
                                                         i32_res_4697) *
                                                 i32_res_4697)];
                x_4875 = ((__global int32_t *) mem_4991)[gtid_4819 *
                                                         i32_res_4697 +
                                                         gtid_4827];
                
                int32_t defunc_1_op_res_4876;
                
                defunc_1_op_res_4876 = add32(x_4874, x_4875);
                x_4874 = defunc_1_op_res_4876;
                ((__global int32_t *) mem_4991)[gtid_4819 * i32_res_4697 +
                                                gtid_4827] = x_4874;
            }
        }
        barrier(CLK_GLOBAL_MEM_FENCE | CLK_LOCAL_MEM_FENCE);
    }
    
  error_0:
    return;
    #undef segscan_group_sizze_4870
}
__kernel void mainzisegmap_4732(__global int *global_failure, int32_t n_4695,
                                int64_t i32_res_4697, int64_t m_4701,
                                int64_t num_groups_4753, __global
                                unsigned char *mem_4908, __global
                                unsigned char *mem_4924, __global
                                unsigned char *mem_4944, __global
                                unsigned char *double_buffer_mem_5021)
{
    #define segmap_group_sizze_4752 (mainzisegmap_group_sizze_4734)
    
    const int block_dim0 = 0;
    const int block_dim1 = 1;
    const int block_dim2 = 2;
    
    if (*global_failure >= 0)
        return;
    
    int32_t global_tid_5041;
    int32_t local_tid_5042;
    int64_t group_sizze_5045;
    int32_t wave_sizze_5044;
    int32_t group_tid_5043;
    
    global_tid_5041 = get_global_id(0);
    local_tid_5042 = get_local_id(0);
    group_sizze_5045 = get_local_size(0);
    wave_sizze_5044 = LOCKSTEP_WIDTH;
    group_tid_5043 = get_group_id(0);
    
    int32_t phys_tid_4732;
    
    phys_tid_4732 = global_tid_5041;
    
    int32_t phys_group_id_5046;
    
    phys_group_id_5046 = get_group_id(0);
    for (int32_t i_5047 = 0; i_5047 < sdiv_up32(sext_i64_i32(sdiv_up64(m_4701,
                                                                       segmap_group_sizze_4752)) -
                                                phys_group_id_5046,
                                                sext_i64_i32(num_groups_4753));
         i_5047++) {
        int32_t virt_group_id_5048 = phys_group_id_5046 + i_5047 *
                sext_i64_i32(num_groups_4753);
        int64_t gtid_4731 = sext_i32_i64(virt_group_id_5048) *
                segmap_group_sizze_4752 + sext_i32_i64(local_tid_5042);
        
        if (slt64(gtid_4731, m_4701)) {
            int32_t i64_res_4758 = sext_i64_i32(gtid_4731);
            
            for (int64_t i_5049 = 0; i_5049 < i32_res_4697; i_5049++) {
                ((__global int32_t *) double_buffer_mem_5021)[phys_tid_4732 +
                                                              i_5049 *
                                                              (num_groups_4753 *
                                                               segmap_group_sizze_4752)] =
                    ((__global int32_t *) mem_4908)[gtid_4731 + i_5049 *
                                                    m_4701];
            }
            for (int32_t i_4760 = 0; i_4760 < 64; i_4760++) {
                int32_t discard_4903;
                int32_t scanacc_4899 = 0;
                
                for (int32_t i_4904 = 0; i_4904 < n_4695; i_4904++) {
                    int64_t i_4901 = sext_i32_i64(i_4904);
                    int32_t x_4766 = ((__global
                                       int32_t *) double_buffer_mem_5021)[phys_tid_4732 +
                                                                          i_4901 *
                                                                          (num_groups_4753 *
                                                                           segmap_group_sizze_4752)];
                    int32_t defunc_0_f_res_4767 = add32(i64_res_4758, x_4766);
                    int32_t defunc_1_op_res_4765 = add32(defunc_0_f_res_4767,
                                                         scanacc_4899);
                    
                    ((__global int32_t *) mem_4924)[phys_tid_4732 + i_4901 *
                                                    (num_groups_4753 *
                                                     segmap_group_sizze_4752)] =
                        defunc_1_op_res_4765;
                    
                    int32_t scanacc_tmp_5051 = defunc_1_op_res_4765;
                    
                    scanacc_4899 = scanacc_tmp_5051;
                }
                discard_4903 = scanacc_4899;
                for (int64_t i_5053 = 0; i_5053 < i32_res_4697; i_5053++) {
                    ((__global
                      int32_t *) double_buffer_mem_5021)[phys_tid_4732 +
                                                         i_5053 *
                                                         (num_groups_4753 *
                                                          segmap_group_sizze_4752)] =
                        ((__global int32_t *) mem_4924)[phys_tid_4732 + i_5053 *
                                                        (num_groups_4753 *
                                                         segmap_group_sizze_4752)];
                }
            }
            for (int64_t i_5054 = 0; i_5054 < i32_res_4697; i_5054++) {
                ((__global int32_t *) mem_4944)[i_5054 * m_4701 + gtid_4731] =
                    ((__global
                      int32_t *) double_buffer_mem_5021)[phys_tid_4732 +
                                                         i_5054 *
                                                         (num_groups_4753 *
                                                          segmap_group_sizze_4752)];
            }
        }
        barrier(CLK_GLOBAL_MEM_FENCE | CLK_LOCAL_MEM_FENCE);
    }
    
  error_0:
    return;
    #undef segmap_group_sizze_4752
}
__kernel void mainzisegmap_intragroup_4730(__global int *global_failure,
                                           __local volatile
                                           int64_t *mem_4964_backing_aligned_0,
                                           int64_t i32_res_4697, int64_t m_4701,
                                           __global unsigned char *mem_4947,
                                           __global unsigned char *mem_4977,
                                           __global
                                           unsigned char *double_buffer_mem_5025)
{
    const int block_dim0 = 0;
    const int block_dim1 = 1;
    const int block_dim2 = 2;
    __local volatile char *restrict mem_4964_backing_0 = (__local volatile
                                                          char *) mem_4964_backing_aligned_0;
    
    if (*global_failure >= 0)
        return;
    
    int32_t global_tid_5055;
    int32_t local_tid_5056;
    int64_t group_sizze_5059;
    int32_t wave_sizze_5058;
    int32_t group_tid_5057;
    
    global_tid_5055 = get_global_id(0);
    local_tid_5056 = get_local_id(0);
    group_sizze_5059 = get_local_size(0);
    wave_sizze_5058 = LOCKSTEP_WIDTH;
    group_tid_5057 = get_group_id(0);
    
    int32_t phys_tid_4730;
    
    phys_tid_4730 = group_tid_5057;
    
    int32_t ltid_pre_5060;
    
    ltid_pre_5060 = local_tid_5056;
    
    int64_t gtid_4725;
    
    gtid_4725 = sext_i32_i64(group_tid_5057);
    
    int32_t i64_res_4776 = sext_i64_i32(gtid_4725);
    __local char *mem_4964;
    
    mem_4964 = (__local char *) mem_4964_backing_0;
    ((__global int32_t *) double_buffer_mem_5025)[phys_tid_4730 * i32_res_4697 +
                                                  sext_i32_i64(local_tid_5056)] =
        ((__global int32_t *) mem_4947)[gtid_4725 +
                                        sext_i32_i64(local_tid_5056) * m_4701];
    barrier(CLK_LOCAL_MEM_FENCE);
    for (int32_t i_4778 = 0; i_4778 < 64; i_4778++) {
        int64_t gtid_4728 = sext_i32_i64(ltid_pre_5060);
        int32_t phys_tid_4729 = local_tid_5056;
        
        if (slt64(gtid_4728, i32_res_4697)) {
            int32_t x_4784 = ((__global
                               int32_t *) double_buffer_mem_5025)[phys_tid_4730 *
                                                                  i32_res_4697 +
                                                                  gtid_4728];
            int32_t defunc_0_f_res_4785 = add32(i64_res_4776, x_4784);
            
            ((__local int32_t *) mem_4964)[gtid_4728] = defunc_0_f_res_4785;
        }
        barrier(CLK_LOCAL_MEM_FENCE);
        
        int64_t dims_flat_5062;
        
        dims_flat_5062 = i32_res_4697;
        
        int32_t x_4781;
        int32_t x_4782;
        int32_t x_5064;
        int32_t x_5065;
        bool ltid_in_bounds_5067;
        
        ltid_in_bounds_5067 = slt64(sext_i32_i64(local_tid_5056), i32_res_4697);
        
        int32_t skip_threads_5068;
        
        // read input for in-block scan
        {
            if (ltid_in_bounds_5067) {
                x_4782 = ((volatile __local
                           int32_t *) mem_4964)[sext_i32_i64(local_tid_5056)];
                if ((local_tid_5056 - squot32(local_tid_5056, 32) * 32) == 0) {
                    x_4781 = x_4782;
                }
            }
        }
        // in-block scan (hopefully no barriers needed)
        {
            skip_threads_5068 = 1;
            while (slt32(skip_threads_5068, 32)) {
                if (sle32(skip_threads_5068, local_tid_5056 -
                          squot32(local_tid_5056, 32) * 32) &&
                    ltid_in_bounds_5067) {
                    // read operands
                    {
                        x_4781 = ((volatile __local
                                   int32_t *) mem_4964)[sext_i32_i64(local_tid_5056) -
                                                        sext_i32_i64(skip_threads_5068)];
                    }
                    // perform operation
                    {
                        bool inactive_5069 =
                             slt64(srem64(sext_i32_i64(local_tid_5056),
                                          i32_res_4697),
                                   sext_i32_i64(local_tid_5056) -
                                   sext_i32_i64(local_tid_5056 -
                                   skip_threads_5068));
                        
                        if (inactive_5069) {
                            x_4781 = x_4782;
                        }
                        if (!inactive_5069) {
                            int32_t defunc_1_op_res_4783 = add32(x_4781,
                                                                 x_4782);
                            
                            x_4781 = defunc_1_op_res_4783;
                        }
                    }
                }
                if (sle32(wave_sizze_5058, skip_threads_5068)) {
                    barrier(CLK_LOCAL_MEM_FENCE);
                }
                if (sle32(skip_threads_5068, local_tid_5056 -
                          squot32(local_tid_5056, 32) * 32) &&
                    ltid_in_bounds_5067) {
                    // write result
                    {
                        ((volatile __local
                          int32_t *) mem_4964)[sext_i32_i64(local_tid_5056)] =
                            x_4781;
                        x_4782 = x_4781;
                    }
                }
                if (sle32(wave_sizze_5058, skip_threads_5068)) {
                    barrier(CLK_LOCAL_MEM_FENCE);
                }
                skip_threads_5068 *= 2;
            }
        }
        barrier(CLK_LOCAL_MEM_FENCE);
        // last thread of block 'i' writes its result to offset 'i'
        {
            if ((local_tid_5056 - squot32(local_tid_5056, 32) * 32) == 31 &&
                ltid_in_bounds_5067) {
                ((volatile __local
                  int32_t *) mem_4964)[sext_i32_i64(squot32(local_tid_5056,
                                                            32))] = x_4781;
            }
        }
        barrier(CLK_LOCAL_MEM_FENCE);
        // scan the first block, after which offset 'i' contains carry-in for block 'i+1'
        {
            int32_t skip_threads_5070;
            
            // read input for in-block scan
            {
                if (squot32(local_tid_5056, 32) == 0 && ltid_in_bounds_5067) {
                    x_5065 = ((volatile __local
                               int32_t *) mem_4964)[sext_i32_i64(local_tid_5056)];
                    if ((local_tid_5056 - squot32(local_tid_5056, 32) * 32) ==
                        0) {
                        x_5064 = x_5065;
                    }
                }
            }
            // in-block scan (hopefully no barriers needed)
            {
                skip_threads_5070 = 1;
                while (slt32(skip_threads_5070, 32)) {
                    if (sle32(skip_threads_5070, local_tid_5056 -
                              squot32(local_tid_5056, 32) * 32) &&
                        (squot32(local_tid_5056, 32) == 0 &&
                         ltid_in_bounds_5067)) {
                        // read operands
                        {
                            x_5064 = ((volatile __local
                                       int32_t *) mem_4964)[sext_i32_i64(local_tid_5056) -
                                                            sext_i32_i64(skip_threads_5070)];
                        }
                        // perform operation
                        {
                            bool inactive_5071 =
                                 slt64(srem64(sext_i32_i64(local_tid_5056 * 32 +
                                              32 - 1), i32_res_4697),
                                       sext_i32_i64(local_tid_5056 * 32 + 32 -
                                       1) - sext_i32_i64((local_tid_5056 -
                                                          skip_threads_5070) *
                                       32 + 32 - 1));
                            
                            if (inactive_5071) {
                                x_5064 = x_5065;
                            }
                            if (!inactive_5071) {
                                int32_t defunc_1_op_res_5066 = add32(x_5064,
                                                                     x_5065);
                                
                                x_5064 = defunc_1_op_res_5066;
                            }
                        }
                    }
                    if (sle32(wave_sizze_5058, skip_threads_5070)) {
                        barrier(CLK_LOCAL_MEM_FENCE);
                    }
                    if (sle32(skip_threads_5070, local_tid_5056 -
                              squot32(local_tid_5056, 32) * 32) &&
                        (squot32(local_tid_5056, 32) == 0 &&
                         ltid_in_bounds_5067)) {
                        // write result
                        {
                            ((volatile __local
                              int32_t *) mem_4964)[sext_i32_i64(local_tid_5056)] =
                                x_5064;
                            x_5065 = x_5064;
                        }
                    }
                    if (sle32(wave_sizze_5058, skip_threads_5070)) {
                        barrier(CLK_LOCAL_MEM_FENCE);
                    }
                    skip_threads_5070 *= 2;
                }
            }
        }
        barrier(CLK_LOCAL_MEM_FENCE);
        // carry-in for every block except the first
        {
            if (!(squot32(local_tid_5056, 32) == 0 || !ltid_in_bounds_5067)) {
                // read operands
                {
                    x_4782 = x_4781;
                    x_4781 = ((__local
                               int32_t *) mem_4964)[sext_i32_i64(squot32(local_tid_5056,
                                                                         32)) -
                                                    1];
                }
                // perform operation
                {
                    bool inactive_5072 =
                         slt64(srem64(sext_i32_i64(local_tid_5056),
                                      i32_res_4697),
                               sext_i32_i64(local_tid_5056) -
                               sext_i32_i64(squot32(local_tid_5056, 32) * 32 -
                               1));
                    
                    if (inactive_5072) {
                        x_4781 = x_4782;
                    }
                    if (!inactive_5072) {
                        int32_t defunc_1_op_res_4783 = add32(x_4781, x_4782);
                        
                        x_4781 = defunc_1_op_res_4783;
                    }
                }
                // write final result
                {
                    ((__local
                      int32_t *) mem_4964)[sext_i32_i64(local_tid_5056)] =
                        x_4781;
                }
            }
        }
        barrier(CLK_LOCAL_MEM_FENCE);
        // restore correct values for first block
        {
            if (squot32(local_tid_5056, 32) == 0) {
                ((__local int32_t *) mem_4964)[sext_i32_i64(local_tid_5056)] =
                    x_4782;
            }
        }
        barrier(CLK_LOCAL_MEM_FENCE);
        ((__global int32_t *) double_buffer_mem_5025)[phys_tid_4730 *
                                                      i32_res_4697 +
                                                      sext_i32_i64(local_tid_5056)] =
            ((__local int32_t *) mem_4964)[sext_i32_i64(local_tid_5056)];
        barrier(CLK_LOCAL_MEM_FENCE);
    }
    if (local_tid_5056 == 0) {
        for (int64_t i_5073 = 0; i_5073 < i32_res_4697; i_5073++) {
            ((__global int32_t *) mem_4977)[gtid_4725 * i32_res_4697 + i_5073] =
                ((__global int32_t *) double_buffer_mem_5025)[phys_tid_4730 *
                                                              i32_res_4697 +
                                                              i_5073];
        }
    }
    
  error_1:
    return;
}
