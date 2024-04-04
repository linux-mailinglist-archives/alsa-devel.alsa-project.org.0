Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1AD89849E
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 12:05:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 264203E;
	Thu,  4 Apr 2024 12:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 264203E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712225110;
	bh=2TCwY/Gyk4NOU2VJqc4FGFU3S5jupvdli4moBN3tV/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kCr0JTPc8YS6QNz8zq7vtQ5a4GfkQPugW0TgJh5d1VTdOy2/uGMqzftJSb9wGoz01
	 aa/5vSpS/FC7BHXPAtVsOkcFyFVBv17LDPeYrPDmJx5bBfhl4zjiokSv9o5GqMySWW
	 7OcoxOm2HuovOHTJLAGABaVwohkRGWF2JH8CjnzI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB36FF8069A; Thu,  4 Apr 2024 12:03:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 898F7F8069A;
	Thu,  4 Apr 2024 12:03:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40A29F8057E; Thu,  4 Apr 2024 12:03:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05F0DF80588
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 12:03:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05F0DF80588
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=p4D38zgs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712224976; x=1712829776;
	i=oswald.buddenhagen@gmx.de;
	bh=CAZ1ScoqbFZwHXnTKkLI/ab/oBnNr0cVzQYRhQr1P38=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=p4D38zgs0UcfkPr/ujp82xUhd7VQ1egRFyvx1xtOrrddQIVSVEoq8heU4ECMRzam
	 UqE8oucV3rVs5Qldru0TxPqjvbBI5N8ez6bBlDXmRmCwiRsQj1rxASQS04A+tNzSZ
	 jukY4wKpSIu/hKE+Jh/MlwmC/Qo8c7EK9+3MnPtWp381SwHcfYzp6KfGmPrywlmiI
	 ym8Q14TcGTqdhB7vY/jcFsZVld+rIaZVyaQnoI1aX5pP4ccWsPf2KqLtNsl7Abxad
	 nzkqhAe3C6skaIfTs6N3G7yedBZEtvyNcUNPHuNs/cXElbkVPM1OREx6vuaWy5n7x
	 U1JAcP+jYJ0iTR6bWw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.126]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAfYm-1rysS82E8G-00B1PM; Thu, 04
 Apr 2024 12:02:56 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsJto-RFh-00; Thu, 04 Apr 2024 12:00:48 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v2 09/17] ALSA: emu10k1: fix sample signedness issues in
 wavetable loader
Date: Thu,  4 Apr 2024 12:00:40 +0200
Message-ID: <20240404100048.819674-10-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+6fR5qoKew9hF6bnDQILkOU1HmuQA2JL/kftacw2bbtzw7lw/c7
 NQiP6Rdkftm0cvu1moBCBQXOpGwYwSe1qWCN2F0vsbWz6XHOQbqJbNEzUrjMxeeNhkRX+uq
 lnzPKKXCfKfUMO1PUfUkOs2rHfwErMNWSts5YvYg2pB9tbY8uilr3LMAHYEC+F+CxTgdDQF
 HwLHnXNEQCo7xAoN9O7dg==
UI-OutboundReport: notjunk:1;M01:P0:vZom+YAd6QQ=;y4o8DidJjaULG+KlDd9iTdTsS3Q
 ZjgOvP7vCLkpo4qbit0rVs2g9jhZnTniojk+hlK8a+fcjeK0aanFylaekYS/dI+ZRb33D5DeR
 TCLzs7mIJfdxBFCpfFedDb7qRMkOX3JHfkc2Ia87hsYeEbCtaJHbIyyvoOKh6euhqJc+Co6Gm
 9sMQRxl3r/e7obG1o+Jp5i/QLzmz5lG4pLYLJVmnY75wK2rgbY3PiyT8SvNH1C4RZu6tpZIT3
 S8d6zNAqnjZ2LnpdGgIqKZREjBO4dG1aeN6HOKtdU8oqmys61G32GPM/9C7q9BTUw/9xgLAM6
 /NNxpuKbbnHwEDcKKeUcL38LBkHG8cb3x5yP7eFawNydnOL0Rg7e2s1a4BEPf8YSRdX+GhShs
 /uxwGRNmOx7eK1AfYJUEAYWMUgMBfPnqhumq68wN2M9dOyPzA0RCpOUgTKM3BtNgekKIDGffO
 mslFS2S7/m5WZT+/+bVikYOFlQuqwPpDzkMs3Q85uYGnezzBDq3h79fieDwEoVin53xH63aEP
 jVQ1r/iYhi2DCRmIBjrODa6S7OY9qc3HuEvKEBlK7NzlFWI7XW9XLEp4Eck3gMuWz2N8M+lv6
 /WNZXDIzuZeD1MTg/EUeFpe+JDAezWk8P382Z58kh8gA1dFS8zQU+8B69K49icy4cMSM6sNMC
 k6573EFvKJ1WNufPdPNLT8sxquOmqVeJVrV3i1g6yXfwN4smCNOU9hg9NhKUWpgmdM1lfBdby
 EvsdSI4B/WPcfLwgHgOZ4fYRAhszZkhhNcsU8wAESpsppK6HmfHFiC2JEU34ym+9Z7yk6hCLb
 CVsmT9axO+/+ipVTgP0Q9Y45gSdse2YRaYD+/M2Z77w9w=
Message-ID-Hash: X6X6KRCZXTVMHR5OXTCTMWS6BMN6PL5H
X-Message-ID-Hash: X6X6KRCZXTVMHR5OXTCTMWS6BMN6PL5H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X6X6KRCZXTVMHR5OXTCTMWS6BMN6PL5H/>
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

