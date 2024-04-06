Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B92F689A989
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 09:17:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 369202D62;
	Sat,  6 Apr 2024 09:17:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 369202D62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712387854;
	bh=Qvr3bA0CZ05QmolsgTBN5IInGB0KerKma9mhd0z7OA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K2C0CqS7UoGNZ28JLRSWQ91GxjTlK2EGTJRo77r5PJeyEn9do5nU+tQLWxUKlfkAz
	 wLJE1YCU+b8UBBjQZ4GUdHGXukSYKpIRyRfHvTOtyUQkzC3Vvb4HNDiH5ZiO9gkoJG
	 ZkRusKfJb63Niq9Tknl/dqGL7HwkyY0Qob6beSeQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9879AF8067A; Sat,  6 Apr 2024 09:15:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B19CAF8068A;
	Sat,  6 Apr 2024 09:15:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21844F8016E; Sat,  6 Apr 2024 09:01:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D9D64F80238
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 09:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9D64F80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=rgjEmQWZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712386852; x=1712991652;
	i=oswald.buddenhagen@gmx.de;
	bh=ToXqItrdxbVBXK7vINSYov0aEjVqUUKZhVs+g8M/vAk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=rgjEmQWZ0NmmW8MVfFB4fId0wEU/gC770wJ5BCwgZl60U6J+x4MVwrMdFNXHWjoi
	 A9AVgXv03s2LCuyRjo5Qb5GeyONv3eWoF9sGTFzEkZWABS7Df1otYwJDt87Rox3Uy
	 FH47IFiKvdrcri8RM3XkUwqEmvN8cHupLLMuSS22I5s8rvo5QRMroMSfyHAHcKI43
	 Po1bxFel/NukVN5YBFhP01jdU/l0wUutYNMxVP259zqDhVmeVCfTD+0SkjLw5hrdG
	 4Wgqi/uNV0X1YxBrHIoYdbQbuQm2midPblUCv/QTQsvoYMNr2lkzQxDlqehS6+9xW
	 Ac2GzrfAq0Mn6My21A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.118]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4hzZ-1suHX23dl1-011hr8; Sat, 06
 Apr 2024 09:00:51 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rszqo-JrK-00; Sat, 06 Apr 2024 08:48:30 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v3 11/17] ALSA: emu10k1: merge conditions in patch loader
Date: Sat,  6 Apr 2024 08:48:24 +0200
Message-ID: <20240406064830.1029573-12-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
References: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rlGr/LT2MU5uaCOgGWeZKX+A00/ocXL7je1NPlFivX7/57Alldx
 O+pgbjnlNHwZAabcKJmvYwnCbFtY6mW5XGfxOpPFlKfXv+dnAXc8jaBrg/5beDiKdg2zVmF
 HXixR7+BCkG8yRdZdngXT/UWFF5yVym2Y/I6F8TAVok8K8YqCN+sYKk1/oKzuvknnAOl6W9
 xZc25Hr2VIWIFYOKAUp3Q==
UI-OutboundReport: notjunk:1;M01:P0:LnFOOsnFfUQ=;cq2oFxD8z79a3qa5Vl2A10suq0T
 moPSoPa+9RKurBGxOFxtY4T04ZK6a8KjN6fsvm6aHeCHkgUedbf/DvRRZExOBibuW7rhZ8foF
 nudG2A1IQwHyge7XuIdxU5pso4GQiufQSyFMqdQJdDJTyFAVOFBIvK5s9r6NaT0w/mVe/Ksg9
 iYyEyX8uDmB2YWsgeH1umfABnX7oDJHBda/W152pzVx/SBMCxneX2r8Gyx5aeZlb/IlNBldC4
 pzxaMpdgfhlWVgyVW8t/buzlYUIk1uYXkdUE9EjD2eIEjeIJyyIvhbMziyR/NLN3Sl28+MC46
 x/8kcxO4a/Ydro/GZpEWoknoEy3wQp3nZ9rSgQZ7lzI82MBRldyloQMS806TrUZZblggRYzSf
 9h7v3HD5RyMR/EoIzsah8kvpb9lHdpxAdowTNTI8d0hAm6qfKTVxmTL7GHgd1N2HyosSNPbL0
 OsDMItEPDi5jabx7TJIaOqVIkwtWU24hYR1olpa1sYI2YkWXnAUSrT0Ywl7ly0SIOXk9oGwa9
 O2IVHmwOolyDVxtjY6kiJIEVzR6L9HCVBHx0CzrnKWYGysg8JY8Krv4GalgyREnVYz2jyRV1Y
 A6+jXUGuRTe87iW9fzuXvRrcAk82xn3ImWmAaP2bk0hQb53PO/e82y8UwFZdWfUFgyyPehjzZ
 bZCq5IZnzPs/KLDWY/7MJtxVnbeCyOdc2ncBb2vnotYMr8oP4Fl/OgMCYmormgGZah6lV1tiW
 pZ41TqXSo33SJ1rwRY+yvZx4Qmj4vapJyaFC/YAVK3LBI+dX317YqiUWiYavO9Z4aP6hHMaZr
 jSHy9FU4/EMbSi4YWkY4DUf4F85BbaSq2xpsR6URv5Sbo=
Message-ID-Hash: CRPYJKCMPPX3EESAIEA65EQZOVDYJOHN
X-Message-ID-Hash: CRPYJKCMPPX3EESAIEA65EQZOVDYJOHN
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This de-duplicates the code slightly. But the real reason is that it
moves the code up, which the next patch will depend on.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_patch.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1_=
patch.c
index eb3d1ef8a33a..281881f7d0a4 100644
--- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -53,8 +53,14 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_=
sf_sample *sp,
=20
 	/* compute true data size to be loaded */
 	truesize =3D sp->v.size + BLANK_HEAD_SIZE;
-	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_NO_BLANK)
+	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_NO_BLANK) {
 		truesize +=3D BLANK_LOOP_SIZE;
+		/* if no blank loop is attached in the sample, add it */
+		if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_SINGLESHOT) {
+			sp->v.loopstart =3D sp->v.end + BLANK_LOOP_START;
+			sp->v.loopend =3D sp->v.end + BLANK_LOOP_END;
+		}
+	}
=20
 	/* try to allocate a memory block */
 	blocksize =3D truesize;
@@ -93,14 +99,6 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_=
sf_sample *sp,
 	if (offset < blocksize)
 		snd_emu10k1_synth_memset(emu, sp->block, offset, blocksize - offset, fil=
l);
=20
-	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_NO_BLANK) {
-		/* if no blank loop is attached in the sample, add it */
-		if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_SINGLESHOT) {
-			sp->v.loopstart =3D sp->v.end + BLANK_LOOP_START;
-			sp->v.loopend =3D sp->v.end + BLANK_LOOP_END;
-		}
-	}
-
 	/* recalculate offset */
 	start_addr =3D BLANK_HEAD_SIZE * 2;
 	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
--=20
2.44.0.701.g2cf7baacf3.dirty

