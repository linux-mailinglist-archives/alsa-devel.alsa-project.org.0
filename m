Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1EC893A03
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:10:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9FBA21DF;
	Mon,  1 Apr 2024 12:10:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9FBA21DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711966247;
	bh=2TCwY/Gyk4NOU2VJqc4FGFU3S5jupvdli4moBN3tV/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jgLaawZyRS0K7+4K/YGtcmChxO/pzVzLCscyVra9ElJLQ71kMQF2f/qGOhEVESZCI
	 xYgzy67hIFDVrcbExWIRC5JlJsj5evuQG0PlOOqashqUAT2w48Xz/v5rYC4qsfWKFT
	 axtoYhMu/qD6ohWnIGLjtVeGhkzyDvM8Afr9HEZQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 705E8F805DA; Mon,  1 Apr 2024 12:09:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDEFEF805DA;
	Mon,  1 Apr 2024 12:09:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73361F80568; Mon,  1 Apr 2024 12:09:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96B53F80238
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:07:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96B53F80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=WA8jeHMQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711966066; x=1712570866;
	i=oswald.buddenhagen@gmx.de;
	bh=CAZ1ScoqbFZwHXnTKkLI/ab/oBnNr0cVzQYRhQr1P38=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=WA8jeHMQOonFdZWwVErCyR9ueoxIOFIH7yPYIIPV5uf/A77FpwH2fNTGzyytx21x
	 wHzqIjNdtCmJ5TClnxqj/swbobPvLIedV+aHLGd0cgYcpX1RRS62chSy4WCe+rar5
	 n3+o/F6hl3rLHS/njEXDwMD7cV4dFMiKYLA+bCbBfAKMcshjbtcnKpb3riAsTve/X
	 PGZH8cNQD3oliJcz6eRz8uBhgSygLNzpnogqRXl4vWTuJ/rVooEDuTEYT9wJ1FK6/
	 LWgNBV18qNEdZzP+7Ug1fUD8USMfrJJsXCOWU3YawKFuQIt7uSSdZlX1FwUrZBnpz
	 wJGOukVFaWSgfII0FA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MfYPY-1sSWL03eCe-00fyO5; Mon, 01
 Apr 2024 12:07:45 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEZq-7eT-00; Mon, 01 Apr 2024 12:07:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH 09/18] ALSA: emu10k1: fix sample signedness issues in
 wavetable loader
Date: Mon,  1 Apr 2024 12:07:33 +0200
Message-ID: <20240401100742.506001-10-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/mu1YBF27/V9751SXEP/l9yIuLli7+cd559FkWQ3JwQCGyQuut6
 HbSjVWvI5SGX00E4JaG1hqy6XzLCqxWc7d5C9aPljwOGkm7xEOxXR6/MxWCY0ylhzARH1wY
 qfwCpzz+CBpIJJW9aSoRVv1GMwxKdD3UdS/PAgrL6Zr5s71QxO116ckwJnxN+TapzM86lrC
 tFmw3p0lEC+IK3hj74ONA==
UI-OutboundReport: notjunk:1;M01:P0:AbcgJMoWNeQ=;EaKkEKiijbkUJ9CU9DixzexXQP8
 4NTRLIpxFs1kcYjlywoOMmQf/MTq5YhoFaDFQl+f1NVyjG1rBDZd94RW6G/aKe/VDahusYLzR
 B2Qe5Jerd/dv8jAj2U/gKFYbpq3hemIysb6pfxNEoipoR4obYHZRzSn4S1tRXe9GCw/mLErel
 P1OK2rfCzp527zcbbfBgmBK5V1PuxwVqG86zOGq6cB6vfv5eZWA31+fAOqBPccu/vRru6Zse7
 KBfRPbjfP9R/cQ8SNhNdWqQM/r97mnJxKIbM4h1JK1M6hwPAWud8+Z3J/HO62dj1nZjfF54RO
 aa5LXCRv4+oTT9czZuTp14k72SOU2x4BVFwhsSOeEKH/pSC3dwzf3qWqWVVEsXyM6kvUEktXZ
 7YN4Y5S+gMYas+1JMzGxzd6vT10OMCFGLLczZDYgVekU/PIcDA+zmaxWiDTMq8cvIdzuYEe7V
 aiGVhxDpoPlrLzyyhhDdRmmhFJGJmQfPnYEwpO+OMjNO56hC4WTUKZNIYR0unts207DHBgeYH
 iG8A6f0QBYkSf1TtBBZoRxtXYQqcmnR9MSFmcFn4mP25yeN++rRkkLyJC2L6/gnxcp1F17VNk
 BuAVFQicySuALa6WMS+6adHT2SKLpaqdx34qfRNJ85JrxHuVh4p4jXvIKkqdjI0twu8p8nPb2
 5PjxolE5sFiuGke6xt5IkWNKmDBwScX1sEPhTlhd3cnUPYF1bY3gje78aeA9YHDK47iWVwD0U
 YHewJXtnmP5/sKHd/JGFnCcc29wPym8uyWFU5RYRkw0Af7SQNaKcsS+Tml3EFf8qG6PftG94V
 EicaCZmel5vKKM/3lN0lllOOKF7EHya7ks/omCr71Srko=
Message-ID-Hash: WFAWSG3YO6VFZWI7TJNOJLOVS5HACMCP
X-Message-ID-Hash: WFAWSG3YO6VFZWI7TJNOJLOVS5HACMCP
X-MailFrom: oswald.buddenhagen@gmx.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WFAWSG3YO6VFZWI7TJNOJLOVS5HACMCP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The hardware supports S16LE and U8 samples, while U16LE and S8 (which
the driver implicitly claims to support) require sign flipping.

Note that this matters only for the GUS patch loader, as the implemented
SoundFont v2.01 spec is limited to S16LE.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 include/sound/emu10k1.h           |  4 +--
 sound/pci/emu10k1/emu10k1_patch.c | 30 ++++++++-----------
 sound/pci/emu10k1/memory.c        | 49 +++++++++++++++++++++++++------
 3 files changed, 55 insertions(+), 28 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 1af9e6819392..9e3bd4f81460 100644
=2D-- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1882,8 +1882,8 @@ int snd_emu10k1_alloc_pages_maybe_wider(struct snd_e=
mu10k1 *emu, size_t size,
 					struct snd_dma_buffer *dmab);
 struct snd_util_memblk *snd_emu10k1_synth_alloc(struct snd_emu10k1 *emu, =
unsigned int size);
 int snd_emu10k1_synth_free(struct snd_emu10k1 *emu, struct snd_util_membl=
k *blk);
-int snd_emu10k1_synth_bzero(struct snd_emu10k1 *emu, struct snd_util_memb=
lk *blk, int offset, int size);
-int snd_emu10k1_synth_copy_from_user(struct snd_emu10k1 *emu, struct snd_=
util_memblk *blk, int offset, const char __user *data, int size);
+int snd_emu10k1_synth_memset(struct snd_emu10k1 *emu, struct snd_util_mem=
blk *blk, int offset, int size, u8 value);
+int snd_emu10k1_synth_copy_from_user(struct snd_emu10k1 *emu, struct snd_=
util_memblk *blk, int offset, const char __user *data, int size, u32 xor);
 int snd_emu10k1_memblk_map(struct snd_emu10k1 *emu, struct snd_emu10k1_me=
mblk *blk);

 /* voice allocation */
diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1=
_patch.c
index 55bb60d31fe4..eb3d1ef8a33a 100644
=2D-- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -26,6 +26,8 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_=
sf_sample *sp,
 		       struct snd_util_memhdr *hdr,
 		       const void __user *data, long count)
 {
+	u8 fill;
+	u32 xor;
 	int offset;
 	int truesize, size, blocksize;
 	unsigned int start_addr;
@@ -41,6 +43,14 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd=
_sf_sample *sp,
 		       sp->v.sample);
 	}

+	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS) {
+		fill =3D 0x80;
+		xor =3D (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_UNSIGNED) ? 0 : 0x8080808=
0;
+	} else {
+		fill =3D 0;
+		xor =3D (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_UNSIGNED) ? 0x80008000 : =
0;
+	}
+
 	/* compute true data size to be loaded */
 	truesize =3D sp->v.size + BLANK_HEAD_SIZE;
 	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_NO_BLANK)
@@ -65,46 +75,32 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct sn=
d_sf_sample *sp,
 	size =3D BLANK_HEAD_SIZE;
 	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
 		size *=3D 2;
-	snd_emu10k1_synth_bzero(emu, sp->block, offset, size);
+	snd_emu10k1_synth_memset(emu, sp->block, offset, size, fill);
 	offset +=3D size;

 	/* copy provided samples */
 	size =3D sp->v.size;
 	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
 		size *=3D 2;
-	if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size)=
) {
+	if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size,=
 xor)) {
 		snd_emu10k1_synth_free(emu, sp->block);
 		sp->block =3D NULL;
 		return -EFAULT;
 	}
 	offset +=3D size;

 	/* clear rest of samples (if any) */
 	if (offset < blocksize)
-		snd_emu10k1_synth_bzero(emu, sp->block, offset, blocksize - offset);
+		snd_emu10k1_synth_memset(emu, sp->block, offset, blocksize - offset, fi=
ll);

 	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_NO_BLANK) {
 		/* if no blank loop is attached in the sample, add it */
 		if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_SINGLESHOT) {
 			sp->v.loopstart =3D sp->v.end + BLANK_LOOP_START;
 			sp->v.loopend =3D sp->v.end + BLANK_LOOP_END;
 		}
 	}

-#if 0 /* not supported yet */
-	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_UNSIGNED) {
-		/* unsigned -> signed */
-		if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS)) {
-			unsigned short *wblock =3D (unsigned short*)block;
-			for (i =3D 0; i < truesize; i++)
-				wblock[i] ^=3D 0x8000;
-		} else {
-			for (i =3D 0; i < truesize; i++)
-				block[i] ^=3D 0x80;
-		}
-	}
-#endif
-
 	/* recalculate offset */
 	start_addr =3D BLANK_HEAD_SIZE * 2;
 	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
diff --git a/sound/pci/emu10k1/memory.c b/sound/pci/emu10k1/memory.c
index fc9444404151..d29711777161 100644
=2D-- a/sound/pci/emu10k1/memory.c
+++ b/sound/pci/emu10k1/memory.c
@@ -565,10 +565,10 @@ static inline void *offset_ptr(struct snd_emu10k1 *e=
mu, int page, int offset)
 }

 /*
- * bzero(blk + offset, size)
+ * memset(blk + offset, value, size)
  */
-int snd_emu10k1_synth_bzero(struct snd_emu10k1 *emu, struct snd_util_memb=
lk *blk,
-			    int offset, int size)
+int snd_emu10k1_synth_memset(struct snd_emu10k1 *emu, struct snd_util_mem=
blk *blk,
+			     int offset, int size, u8 value)
 {
 	int page, nextofs, end_offset, temp, temp1;
 	void *ptr;
@@ -588,20 +588,47 @@ int snd_emu10k1_synth_bzero(struct snd_emu10k1 *emu,=
 struct snd_util_memblk *blk
 			temp =3D temp1;
 		ptr =3D offset_ptr(emu, page + p->first_page, offset);
 		if (ptr)
-			memset(ptr, 0, temp);
+			memset(ptr, value, temp);
 		offset =3D nextofs;
 		page++;
 	} while (offset < end_offset);
 	return 0;
 }

-EXPORT_SYMBOL(snd_emu10k1_synth_bzero);
+EXPORT_SYMBOL(snd_emu10k1_synth_memset);
+
+// Note that the value is assumed to be suitably repetitive.
+static void xor_range(void *ptr, int size, u32 value)
+{
+	if ((long)ptr & 1) {
+		*(u8 *)ptr ^=3D (u8)value;
+		ptr++;
+		size--;
+	}
+	if (size > 1 && ((long)ptr & 2)) {
+		*(u16 *)ptr ^=3D (u16)value;
+		ptr +=3D 2;
+		size -=3D 2;
+	}
+	while (size > 3) {
+		*(u32 *)ptr ^=3D value;
+		ptr +=3D 4;
+		size -=3D 4;
+	}
+	if (size > 1) {
+		*(u16 *)ptr ^=3D (u16)value;
+		ptr +=3D 2;
+		size -=3D 2;
+	}
+	if (size > 0)
+		*(u8 *)ptr ^=3D (u8)value;
+}

 /*
- * copy_from_user(blk + offset, data, size)
+ * copy_from_user(blk + offset, data, size) ^ xor
  */
 int snd_emu10k1_synth_copy_from_user(struct snd_emu10k1 *emu, struct snd_=
util_memblk *blk,
-				     int offset, const char __user *data, int size)
+				     int offset, const char __user *data, int size, u32 xor)
 {
 	int page, nextofs, end_offset, temp, temp1;
 	void *ptr;
@@ -620,8 +647,12 @@ int snd_emu10k1_synth_copy_from_user(struct snd_emu10=
k1 *emu, struct snd_util_me
 		if (temp1 < temp)
 			temp =3D temp1;
 		ptr =3D offset_ptr(emu, page + p->first_page, offset);
-		if (ptr && copy_from_user(ptr, data, temp))
-			return -EFAULT;
+		if (ptr) {
+			if (copy_from_user(ptr, data, temp))
+				return -EFAULT;
+			if (xor)
+				xor_range(ptr, temp, xor);
+		}
 		offset =3D nextofs;
 		data +=3D temp;
 		page++;
=2D-
2.42.0.419.g70bf8a5751

