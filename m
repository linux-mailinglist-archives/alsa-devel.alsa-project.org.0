Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B973689A984
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 09:16:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 622F42D5A;
	Sat,  6 Apr 2024 09:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 622F42D5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712387790;
	bh=pDiirN5vZLdZVcuhTKGgMaUGhzBytCabiuldfDR9JSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UWUHnxV5ren2/7StYwMS/nAkMtsvNrWbVtiuaJ51sVa2wGAmedQojFc1umZBgKy7D
	 V3ggdfYupDY3YwjXGjAsgyeR+uBUiHQ9oyCgBdx/HFg09Vj4nt1JdjoFkHvVnzO9qU
	 AzleWNHB+EvFr5N5YvivIBRSXRWoyWcGgHtwjtv4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67254F805D8; Sat,  6 Apr 2024 09:15:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8F5EF8056F;
	Sat,  6 Apr 2024 09:15:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3165DF8016E; Sat,  6 Apr 2024 08:51:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2BF6F80236
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 08:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2BF6F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=LUXOEcBL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712386113; x=1712990913;
	i=oswald.buddenhagen@gmx.de;
	bh=EjqL4Jn+wjqR1rBaH3UoJsuQTSccmGz+aWS4aNtp4hg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=LUXOEcBLoC9eP3/T5waUeScNGACa91aW8+6UU0zDy7gPJfrQGvPENHd4IIMOYM26
	 svjZc7KhjzJsqClvJ1KbwF1FivinVA9lNIOiQOrUUNXDckRGgS65La7n0QiizCLCl
	 SJvbv5iDOs1an0aQHE9TkYDBeKcma15dw9eVL9PNqVmlbYWJ9OAOXrkH/Sz3H1IyZ
	 dP2gPRjGxTPuMhRCbIN11sRWrCH8Eh8tqdCj/PyYpwX8JdUH+RzMfU/tGWqOwaYVz
	 PUIsTPxCdWZkSuJ5NfNYSjAce132XzA9hS8XnB8QbrhJqliPhhf1cn2+SqOq7Fce/
	 VQpJtpKin4nN9hAJpw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.118]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MXGvM-1sIjvE3Ht0-00YkHj; Sat, 06
 Apr 2024 08:48:33 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rszqo-JrA-00; Sat, 06 Apr 2024 08:48:30 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v3 09/17] ALSA: emu10k1: fix sample signedness issues in
 wavetable loader
Date: Sat,  6 Apr 2024 08:48:22 +0200
Message-ID: <20240406064830.1029573-10-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
References: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wFFC7F3LQJARijRCx1CYCCoYIm1fybJJWbiZGm3M05tc2ZXrWAa
 ZQlfMclYc/t6f3fHXUjFmRvIHWD+osGU7+55XQQF3ki9osyJsovSGKwe2JsyTFxr5ZyqxtD
 du4rzrm1skyfoP9j0JAvv51UhhUCr09aWZ87AYoMrwOYAQmTsGARBiUZF7kSkBbx8eUPPN7
 jMrHNCIuSjvbTvmSgozkQ==
UI-OutboundReport: notjunk:1;M01:P0:s52RjdTwwW0=;2wr1Oyo7uKVPY4Rw7pNZVNtU6U0
 nWPzCDWvvuC6BknyPt+UJsHCiK/MSFmFNJTeFVlNlIm5TWFXjfDu1Rg4XERJFnFzNAbdtjQft
 34yoaeJSrwoAsozcQxvPRSlAc3NeskHeJLiRJrFY9djJyAOnBhTXxq70NE2FDmOhYmgc8AVlG
 e4G58LhDePhN4gmjc71R7MPYqnGG+mTIQEvXaZeMRCKTYUJwWUJoSoLQFrk/k0pmRXbRbopsN
 j4yl4RE0gSkPALXG+SC8tk9eRzMLGtwY9gcum9SoRnjO43jI+0HxJDL/MsbvOnfdwVRilFnQv
 hK6Jm4YEMamK+ZoB+W2+aZqMhjc0mYn38KWP06KJniqWUvqUuPbkwqz/mbPjL3y6fdgp0tRcj
 ebyHOLfZ4D6NYBgMKSG0MrWkIE9h92QtVqs2csI862Lef7CCI/8IVLHE3Wd2S66v27t9VzX/V
 2Mh5XHzVvZBw0CJYzgqAZFOvItXtYCBY0Qvy58/ctF0zxUSA6ANIhh8gP+2LDtkNESeO38p3r
 Fp1CLoSv5brSBWjh7C2YxZpshEVHwxThxaHu+rFTp1UYWN9ghfWK6Cs03UnBe5bkMzVtid+vk
 dl1GaKnZBu5+USB+oCkvXQ2619fNhux3CCW2D1ws57g7FxKX/0H2K8J0CL7W6rg3JX868lbHs
 EescrNgSSSqRfyQNR1fvoY8eCvmbElnUE/NAm4RMTAISrMVRH2BJMxvi5LiS1uQpI13K7l4Xz
 SY95YSlP+JNUwtww3zQJhBDNt2JmMYmurOFIVg4BTuPTICB1CUJ0ac+k86i6PUPu1QHGf6IzQ
 Z0rubvdGk6d+U8JfaKtKeSWEjMSzMVw8KSEQc0Y/wwIqw=
Message-ID-Hash: C7JER6BQAA6RNJTEJXPO73X2RLZJA2JC
X-Message-ID-Hash: C7JER6BQAA6RNJTEJXPO73X2RLZJA2JC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C7JER6BQAA6RNJTEJXPO73X2RLZJA2JC/>
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
---
 include/sound/emu10k1.h           |  4 +--
 sound/pci/emu10k1/emu10k1_patch.c | 30 ++++++++-----------
 sound/pci/emu10k1/memory.c        | 49 +++++++++++++++++++++++++------
 3 files changed, 55 insertions(+), 28 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 1af9e6819392..9e3bd4f81460 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1882,8 +1882,8 @@ int snd_emu10k1_alloc_pages_maybe_wider(struct snd_em=
u10k1 *emu, size_t size,
 					struct snd_dma_buffer *dmab);
 struct snd_util_memblk *snd_emu10k1_synth_alloc(struct snd_emu10k1 *emu, u=
nsigned int size);
 int snd_emu10k1_synth_free(struct snd_emu10k1 *emu, struct snd_util_memblk=
 *blk);
-int snd_emu10k1_synth_bzero(struct snd_emu10k1 *emu, struct snd_util_membl=
k *blk, int offset, int size);
-int snd_emu10k1_synth_copy_from_user(struct snd_emu10k1 *emu, struct snd_u=
til_memblk *blk, int offset, const char __user *data, int size);
+int snd_emu10k1_synth_memset(struct snd_emu10k1 *emu, struct snd_util_memb=
lk *blk, int offset, int size, u8 value);
+int snd_emu10k1_synth_copy_from_user(struct snd_emu10k1 *emu, struct snd_u=
til_memblk *blk, int offset, const char __user *data, int size, u32 xor);
 int snd_emu10k1_memblk_map(struct snd_emu10k1 *emu, struct snd_emu10k1_mem=
blk *blk);
=20
 /* voice allocation */
diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1_=
patch.c
index 55bb60d31fe4..eb3d1ef8a33a 100644
--- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -26,6 +26,8 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_s=
f_sample *sp,
 		       struct snd_util_memhdr *hdr,
 		       const void __user *data, long count)
 {
+	u8 fill;
+	u32 xor;
 	int offset;
 	int truesize, size, blocksize;
 	unsigned int start_addr;
@@ -41,6 +43,14 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_=
sf_sample *sp,
 		       sp->v.sample);
 	}
=20
+	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS) {
+		fill =3D 0x80;
+		xor =3D (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_UNSIGNED) ? 0 : 0x80808080;
+	} else {
+		fill =3D 0;
+		xor =3D (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_UNSIGNED) ? 0x80008000 : 0;
+	}
+
 	/* compute true data size to be loaded */
 	truesize =3D sp->v.size + BLANK_HEAD_SIZE;
 	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_NO_BLANK)
@@ -65,46 +75,32 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd=
_sf_sample *sp,
 	size =3D BLANK_HEAD_SIZE;
 	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
 		size *=3D 2;
-	snd_emu10k1_synth_bzero(emu, sp->block, offset, size);
+	snd_emu10k1_synth_memset(emu, sp->block, offset, size, fill);
 	offset +=3D size;
=20
 	/* copy provided samples */
 	size =3D sp->v.size;
 	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
 		size *=3D 2;
-	if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size))=
 {
+	if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size, =
xor)) {
 		snd_emu10k1_synth_free(emu, sp->block);
 		sp->block =3D NULL;
 		return -EFAULT;
 	}
 	offset +=3D size;
=20
 	/* clear rest of samples (if any) */
 	if (offset < blocksize)
-		snd_emu10k1_synth_bzero(emu, sp->block, offset, blocksize - offset);
+		snd_emu10k1_synth_memset(emu, sp->block, offset, blocksize - offset, fil=
l);
=20
 	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_NO_BLANK) {
 		/* if no blank loop is attached in the sample, add it */
 		if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_SINGLESHOT) {
 			sp->v.loopstart =3D sp->v.end + BLANK_LOOP_START;
 			sp->v.loopend =3D sp->v.end + BLANK_LOOP_END;
 		}
 	}
=20
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
--- a/sound/pci/emu10k1/memory.c
+++ b/sound/pci/emu10k1/memory.c
@@ -565,10 +565,10 @@ static inline void *offset_ptr(struct snd_emu10k1 *em=
u, int page, int offset)
 }
=20
 /*
- * bzero(blk + offset, size)
+ * memset(blk + offset, value, size)
  */
-int snd_emu10k1_synth_bzero(struct snd_emu10k1 *emu, struct snd_util_membl=
k *blk,
-			    int offset, int size)
+int snd_emu10k1_synth_memset(struct snd_emu10k1 *emu, struct snd_util_memb=
lk *blk,
+			     int offset, int size, u8 value)
 {
 	int page, nextofs, end_offset, temp, temp1;
 	void *ptr;
@@ -588,20 +588,47 @@ int snd_emu10k1_synth_bzero(struct snd_emu10k1 *emu, =
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
=20
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
=20
 /*
- * copy_from_user(blk + offset, data, size)
+ * copy_from_user(blk + offset, data, size) ^ xor
  */
 int snd_emu10k1_synth_copy_from_user(struct snd_emu10k1 *emu, struct snd_u=
til_memblk *blk,
-				     int offset, const char __user *data, int size)
+				     int offset, const char __user *data, int size, u32 xor)
 {
 	int page, nextofs, end_offset, temp, temp1;
 	void *ptr;
@@ -620,8 +647,12 @@ int snd_emu10k1_synth_copy_from_user(struct snd_emu10k=
1 *emu, struct snd_util_me
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
--=20
2.44.0.701.g2cf7baacf3.dirty

