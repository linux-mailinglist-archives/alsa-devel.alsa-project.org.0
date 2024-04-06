Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4609989A977
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 09:07:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C9672D2C;
	Sat,  6 Apr 2024 09:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C9672D2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712387235;
	bh=pH8KkBimLLKgXaFhPqiDG6YL13iUBCUrphttR/Aifc8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s1NcfpTWO0pMIZQbO0MvfRqPOPa8yWzwdgucVXUOtPDtCBOfkSKK8g/jfCN6u5Db3
	 DhmznMcwzVAiF1Mdr1z3dCXjcD77rYXx5TJe1oV9qIYLiSrCzNG0bV5EN+pqTEH6qI
	 OOO9tC1etNYaLbVtzrRrXyIXP5LL+NkuGPD76l8M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1952F805B3; Sat,  6 Apr 2024 09:06:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AA06F805C4;
	Sat,  6 Apr 2024 09:06:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C888F80568; Sat,  6 Apr 2024 08:49:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FE8BF8020D
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 08:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FE8BF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=QXLQr4gZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712386111; x=1712990911;
	i=oswald.buddenhagen@gmx.de;
	bh=ptvax/9dSFpuGqKK44Xq0yGKMVoWvtRK5dnSVCgiW9M=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=QXLQr4gZZC2Ppg9/zuWzd+5lJ4OVQ+azB+ow08E8qUReC6au1iFy5wLmbKeVJocD
	 KLQIgVEWICA8b8u3K5gL29siV5slt9VNQAeI5xmr3Yqeo0zoWjq9RLYUR+DZ2Tpsp
	 rBQIZtf9Dow2mAJofTBxpcP4c+/565d5WZRpbwJPyCX9qcN5oGFhrGObqJqdKYTQb
	 CQ1CEwaZ+5PbNoyzJjCSpabpEXfsgFKZbjvgUqegzmsCZZ2gdajw4HUMlvBZe0hlW
	 yXAcQAyQhaQMUbRDKUtlIUW4K7nMTr48S56QECWaowB7fPtrJYtDrdsiJZDMuei30
	 qZBHW2ac+7y1j8PIZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.118]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MysRk-1sfisn0SME-00vu8r; Sat, 06
 Apr 2024 08:48:31 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rszqo-Jqv-00; Sat, 06 Apr 2024 08:48:30 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v3 06/17] ALSA: emux: centralize & improve patch info
 validation
Date: Sat,  6 Apr 2024 08:48:19 +0200
Message-ID: <20240406064830.1029573-7-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
References: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AdB2s0r0vGr6Noi0mGmFySLY67gC45icAGE1DnzxVuY9I0FHGCt
 u4L97pYlqtpn8H4o9JqhHK3A3rb8X4s5JTrA+lBNcMTl2pbNShZMEVNWmaG5TewE04py0qD
 C3S+/Hw8OhIPv6p3qHpJes5Zp063Nzr9yTNpeQedQXHxX4C7KmioLEHGKyY8Qt+OqEMMwFS
 YmvtfBofqN16N3lVeU8tg==
UI-OutboundReport: notjunk:1;M01:P0:kRe0qJHQ5gQ=;9yeI2nOgE5AAy+ugbI4k2NzSfem
 GnzyLW4e243AxbRGtKVCBzHgT28YtDvdq3Qgs9PH+Ruf5DPNhq44y/iXEsAgsEa50xyU46EWl
 kMbz19at919mk0od7CafKXcNN6Q+hxEhKtUzWfLAEhy8lYaBqXqTUyiTnxiLGpcxWaXvbAUb4
 pQT3Y+EYo3PpEb65B8VsAtRR2vohV5Eruz4+PaeoZNnmcmZ4/cbiRs/+iXfNO4SFfCNVfgM3u
 ccSMoH5B0pi3Jf+osD0yDkbpEl9qqu3gB5j6sfNc+lF7qElN51decqmh9LWN/hmLjsbLsJDl7
 968dXVTrn5wqSnKdUsYbjSG3wWAjfSnJttoCBH/kDNPTVhJaUvGkvyyNPSbSRTP5DTHXlJ0Er
 MC+bYV9Iffs907OvA6opqIifG2KYq3+TjmeNP7j3p3hXrmdMsGutEquIw9Y2J2otTbIORJhQ1
 z55XiMoYfHEcBmOBXAYsPz40K2wtaGaYxF2LLMz+R56a8EQODd8H4o2ktVDoO+XaJikF8RUAr
 FnIYlBovOM69wudFycFxeEoZEWIiM2XDESFKhZ7INY33JMmmnDAFXP0kTAGDX26xXHHo8xB26
 HC3b58sEFcdNzC/sX9PewRg5lMBK9y7b+2vTNimT75M5gY0+jKWlUCG/OYoSmSyj42/xcENnq
 GLIsq2Uailc4YFIEK/4vT++2lA1/fdmhJwCokW2T+0w9YZnscG1X5qRNcppECMbnWVgsc3pRV
 KuXDgikne+8aLUm5h21jl6zzBO7TcegMmb1mKnjako7zt5gufcatQCAKfbLe3Dg1iBWS6HctA
 Ln6vAm36akmbvxFdyHUDbZMtqnsjpM5ygTfCyJ/Fl+OxA=
Message-ID-Hash: WHWDQNEDV2R4FDO2INNT5SGBF4ZIX7C7
X-Message-ID-Hash: WHWDQNEDV2R4FDO2INNT5SGBF4ZIX7C7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WHWDQNEDV2R4FDO2INNT5SGBF4ZIX7C7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This does several closely related things:
- Move the code from the drivers into the SoundFont loader, which
  de-duplicates it.
- Sort of explain the weird "recalculate address offset" feature. Note
  that I don't think it actually makes any sense - the calling user
  space code should do that. The background is certainly that the source
  data (the SoundFont format) uses pointers into a single wave block
  (and the API allows doing the same for on-board ROM), but the API
  expects the wave data from user space to be pre-chopped into
  individual patches anyway.
- Make sure that the specified offsets actually lie within the supplied
  wave data. Note that we don't validate ROM offsets, so one can play
  back anything within the sound card's address space.
- In load_guspatch(), don't call the sample_new callback anymore when
  the patch size is zero, as was already the case in load_data(). The
  callbacks would instantly return in that case anyway; these checks are
  now removed.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/isa/sb/emu8000_patch.c      | 13 -----------
 sound/pci/emu10k1/emu10k1_patch.c | 16 -------------
 sound/synth/emux/soundfont.c      | 37 ++++++++++++++++++++++++++++++-
 3 files changed, 36 insertions(+), 30 deletions(-)

diff --git a/sound/isa/sb/emu8000_patch.c b/sound/isa/sb/emu8000_patch.c
index 8c1e7f2bfc34..ab4f988f080d 100644
--- a/sound/isa/sb/emu8000_patch.c
+++ b/sound/isa/sb/emu8000_patch.c
@@ -148,13 +148,6 @@ snd_emu8000_sample_new(struct snd_emux *rec, struct sn=
d_sf_sample *sp,
 	if (snd_BUG_ON(!sp))
 		return -EINVAL;
=20
-	if (sp->v.size =3D=3D 0)
-		return 0;
-
-	/* be sure loop points start < end */
-	if (sp->v.loopstart > sp->v.loopend)
-		swap(sp->v.loopstart, sp->v.loopend);
-
 	/* compute true data size to be loaded */
 	truesize =3D sp->v.size;
 	if (sp->v.mode_flags & (SNDRV_SFNT_SAMPLE_BIDIR_LOOP|SNDRV_SFNT_SAMPLE_RE=
VERSE_LOOP))
@@ -177,12 +170,6 @@ snd_emu8000_sample_new(struct snd_emux *rec, struct sn=
d_sf_sample *sp,
 			return -EFAULT;
 	}
=20
-	/* recalculate address offset */
-	sp->v.end -=3D sp->v.start;
-	sp->v.loopstart -=3D sp->v.start;
-	sp->v.loopend -=3D sp->v.start;
-	sp->v.start =3D 0;
-
 	/* dram position (in word) -- mem_offset is byte */
 	dram_offset =3D EMU8000_DRAM_OFFSET + (sp->block->offset >> 1);
 	dram_start =3D dram_offset;
diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1_=
patch.c
index 49214c226808..47d69a0e44bc 100644
--- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -35,28 +35,12 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd=
_sf_sample *sp,
 	if (snd_BUG_ON(!sp || !hdr))
 		return -EINVAL;
=20
-	if (sp->v.size =3D=3D 0) {
-		dev_dbg(emu->card->dev,
-			"emu: rom font for sample %d\n", sp->v.sample);
-		return 0;
-	}
-
 	if (sp->v.mode_flags & (SNDRV_SFNT_SAMPLE_BIDIR_LOOP | SNDRV_SFNT_SAMPLE_=
REVERSE_LOOP)) {
 		/* should instead return -ENOTSUPP; but compatibility */
 		printk(KERN_WARNING "Emu10k1 wavetable patch %d with unsupported loop fe=
ature\n",
 		       sp->v.sample);
 	}
=20
-	/* recalculate address offset */
-	sp->v.end -=3D sp->v.start;
-	sp->v.loopstart -=3D sp->v.start;
-	sp->v.loopend -=3D sp->v.start;
-	sp->v.start =3D 0;
-
-	/* be sure loop points start < end */
-	if (sp->v.loopstart >=3D sp->v.loopend)
-		swap(sp->v.loopstart, sp->v.loopend);
-
 	/* compute true data size to be loaded */
 	truesize =3D sp->v.size + BLANK_HEAD_SIZE;
 	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_NO_BLANK)
diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
index ad0231d7a39d..6d6f0102ed5b 100644
--- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -689,6 +689,21 @@ find_sample(struct snd_soundfont *sf, int sample_id)
 }
=20
=20
+static int
+validate_sample_info(struct soundfont_sample_info *si)
+{
+	if (si->end < 0 || si->end > si->size)
+		return -EINVAL;
+	if (si->loopstart < 0 || si->loopstart > si->end)
+		return -EINVAL;
+	if (si->loopend < 0 || si->loopend > si->end)
+		return -EINVAL;
+	/* be sure loop points start < end */
+	if (si->loopstart > si->loopend)
+		swap(si->loopstart, si->loopend);
+	return 0;
+}
+
 /*
  * Load sample information, this can include data to be loaded onto
  * the soundcard.  It can also just be a pointer into soundcard ROM.
@@ -727,6 +742,21 @@ load_data(struct snd_sf_list *sflist, const void __use=
r *data, long count)
 		return -EINVAL;
 	}
=20
+	if (sample_info.size > 0) {
+		if (sample_info.start < 0)
+			return -EINVAL;
+
+		// Here we "rebase out" the start address, because the
+		// real start is the start of the provided sample data.
+		sample_info.end -=3D sample_info.start;
+		sample_info.loopstart -=3D sample_info.start;
+		sample_info.loopend -=3D sample_info.start;
+		sample_info.start =3D 0;
+
+		if (validate_sample_info(&sample_info) < 0)
+			return -EINVAL;
+	}
+
 	/* Allocate a new sample structure */
 	sp =3D sf_sample_new(sflist, sf);
 	if (!sp)
@@ -974,6 +1004,11 @@ load_guspatch(struct snd_sf_list *sflist, const char =
__user *data, long count)
 	smp->v.loopend =3D patch.loop_end;
 	smp->v.size =3D patch.len;
=20
+	if (validate_sample_info(&smp->v) < 0) {
+		sf_sample_delete(sflist, sf, smp);
+		return -EINVAL;
+	}
+
 	/* set up mode flags */
 	smp->v.mode_flags =3D 0;
 	if (!(patch.mode & WAVE_16_BITS))
@@ -1011,7 +1046,7 @@ load_guspatch(struct snd_sf_list *sflist, const char =
__user *data, long count)
 	/*
 	 * load wave data
 	 */
-	if (sflist->callback.sample_new) {
+	if (smp->v.size > 0 && sflist->callback.sample_new) {
 		rc =3D sflist->callback.sample_new
 			(sflist->callback.private_data, smp, sflist->memhdr,
 			 data, count);
--=20
2.44.0.701.g2cf7baacf3.dirty

