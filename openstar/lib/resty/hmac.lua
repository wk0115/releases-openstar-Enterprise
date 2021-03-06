LJD   -   9   B -  9  BK  �HMAC_CTX_freeHMAC_CTX_new"   -   9   D  �HMAC_CTX_new+  -  9   BK  �HMAC_CTX_free;   -   - B - 9   BL  ���HMAC_CTX_init.  -  9   BK  �HMAC_CTX_cleanup� -  B X�- 9 - 9   	 +
  B	  X�+  L -  - B- 5 =- D �������	_ctx  HMAC_Init_exmd5 K -  9 9   B  X�+ X�+ L �	_ctxHMAC_Update� $
  X
�-  9 9   B	  X�+  L -  99 - - B	 X� X�- - - - : B C  - - - : D +  L �����HMAC_Final	_ctxHMAC_Update P -  9 9 +  )  , B  X�+ X�+ L �	_ctxHMAC_Init_ex�  * @6   ' B 9 6  ' B999996	 6	
 5
 5 =
9' B ' B ' B ' B5 9B=9B=9B=9B=, 6 3 B  X�3 3 X�3  3! ="
3# =
3% =$
3' =&
3) =(
2  �L
  
reset 
final update 
ALGOS     
pcallSHA512EVP_sha512SHA256EVP_sha256	SHA1EVP_sha1MD5  EVP_md5HMAC_CTX[1]unsigned int[1]unsigned char[64]�typedef struct engine_st ENGINE;
typedef struct evp_pkey_ctx_st EVP_PKEY_CTX;
typedef struct env_md_ctx_st EVP_MD_CTX;
typedef struct env_md_st EVP_MD;

struct env_md_ctx_st
    {
    const EVP_MD *digest;
    ENGINE *engine;
    unsigned long flags;
    void *md_data;
    EVP_PKEY_CTX *pctx;
    int (*update)(EVP_MD_CTX *ctx,const void *data,size_t count);
    };

struct env_md_st
    {
    int type;
    int pkey_type;
    int md_size;
    unsigned long flags;
    int (*init)(EVP_MD_CTX *ctx);
    int (*update)(EVP_MD_CTX *ctx,const void *data,size_t count);
    int (*final)(EVP_MD_CTX *ctx,unsigned char *md);
    int (*copy)(EVP_MD_CTX *to,const EVP_MD_CTX *from);
    int (*cleanup)(EVP_MD_CTX *ctx);

    int (*sign)(int type, const unsigned char *m, unsigned int m_length, unsigned char *sigret, unsigned int *siglen, void *key);
    int (*verify)(int type, const unsigned char *m, unsigned int m_length, const unsigned char *sigbuf, unsigned int siglen, void *key);
    int required_pkey_type[5];
    int block_size;
    int ctx_size;
    int (*md_ctrl)(EVP_MD_CTX *ctx, int cmd, int p1, void *p2);
    };

typedef struct hmac_ctx_st
    {
    const EVP_MD *md;
    EVP_MD_CTX md_ctx;
    EVP_MD_CTX i_ctx;
    EVP_MD_CTX o_ctx;
    unsigned int key_length;
    unsigned char key[128];
    } HMAC_CTX;

//OpenSSL 1.0
void HMAC_CTX_init(HMAC_CTX *ctx);
void HMAC_CTX_cleanup(HMAC_CTX *ctx);

//OpenSSL 1.1
HMAC_CTX *HMAC_CTX_new(void);
void HMAC_CTX_free(HMAC_CTX *ctx);

int HMAC_Init_ex(HMAC_CTX *ctx, const void *key, int len, const EVP_MD *md, ENGINE *impl);
int HMAC_Update(HMAC_CTX *ctx, const unsigned char *data, size_t len);
int HMAC_Final(HMAC_CTX *ctx, unsigned char *md, unsigned int *len);

const EVP_MD *EVP_md5(void);
const EVP_MD *EVP_sha1(void);
const EVP_MD *EVP_sha256(void);
const EVP_MD *EVP_sha512(void);
	cdef__index   _VERSION	0.02
errorsetmetatableCtypeofgcstringnewffito_hexresty.stringrequire 