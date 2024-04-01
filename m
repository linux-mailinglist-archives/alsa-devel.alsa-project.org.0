Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6071893AE0
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 14:22:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FD0021B6;
	Mon,  1 Apr 2024 14:22:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FD0021B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711974168;
	bh=xyeTfR64KLMcUjtzhkWAPMzPv/EIOESNPTsCQma9bCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VAz5gPhJIBuKV9LGRihknlfPRukydh1KV5hvphjq2D+8HM5bog9PoFXZpTMqkSAKf
	 CmGpk13FhohKcEFmXAYybJOaTvyuRQsYjYlf2G6Iy6s9La0CBA9vaiON9z+DH9+xF1
	 k1UD1xAa3fQ8aqG4jQHGTSVjcq/wyUFdOwX5Ce24=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 907F0F805F4; Mon,  1 Apr 2024 14:21:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EBE0F805F9;
	Mon,  1 Apr 2024 14:21:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3D22F805B6; Mon,  1 Apr 2024 14:21:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C0F3F8055C
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 14:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C0F3F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=sai1W66J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711974088; x=1712578888;
	i=oswald.buddenhagen@gmx.de;
	bh=Xpjsn2AGjwSg6ZwqFy/jANXMV+0QadhgI0lm7U1ty64=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=sai1W66JRVw1DMmhm8mGZJHAj27/3AQArYvoZ1ApzBNxr+At8wcv8EtegPgxow1W
	 meowGXuulG3bICc8WmDMMs8NCVML3hIiLBeCDjsGHY6qA72IQ29ardtzXK1Jm6zbB
	 mcy3aEnP3ODuvwLEc3YNWkEDK4BSSoKITmyKQOMTipbs7/vA0PBMS7iFIfYtd/9Ae
	 WKVYf1RyOIUZH/0CVMUXCtfD5di9oP4JyrSunjB1vLptzm/4bGNB7ECkKPWjCVDeT
	 uqUhyuzsIIu7BNCyno/et1SBRuQVASv+DfrUj5nWKo/BJVONS3AChGy94HSYQzhkD
	 kisfgkP+teAweyhESA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFbRs-1s2nna0rUc-00HAmJ; Mon, 01
 Apr 2024 14:21:28 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEZq-7ex-00; Mon, 01 Apr 2024 12:07:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH 15/18] ALSA: emu10k1: de-duplicate size calculations for
 16-bit samples
Date: Mon,  1 Apr 2024 12:07:39 +0200
Message-ID: <20240401100742.506001-16-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FoIPsZ7m3ObqZm++3YeMx/0VJNAD7A44lR/K6Vg47P9Uk6kBo2I
 wRBX/n9zaZRQ20ajj2Sucs4ImXKWOZ1JMXXdLVGGHfq/3QTfW+BZvJVfSj9wr4p0jFNQWOr
 EkiwuJ3ZgCFxDnihgfTasQS9JpL2ZxGh4C0ik+84cUCJ3aBoxak8iNuWnj3E2URo8gJB0+x
 SdPqX1hdj2yT7XPXv+dKw==
UI-OutboundReport: notjunk:1;M01:P0:awqNW5ZKoPU=;NaTZ+X0pV5p+gUQp/CpKEW7A3UX
 tTsEVUdAUk/us/rhwmG5TrC0EEOzeOLT9jomMamDZ8EhT6+tUiA7yNG0GuQ25mabMuBgh0KRD
 HJ1KJkArqPXPuikSnBLomNEX2QjBT4vQlZbS7bGA9CGi0+LHbXkXf0Mu6WYcMPl/XYYF6klPQ
 QG23QfRiMwJRHG0OBZjBWMNdEiLQqGu0pADH/PkglOEL2fDHLNN++XjUtT9vHo0eZmKjJyClo
 hIxOrnOqbuzm7XiVADXbhfiRy5+DxXXgSzaKG72oG1q2IwfU5pIqqcIGDDtMTgYGtSXX76jAw
 Xj2lbTXGir0v0Gs02mUaQB2/dGe4g14JXEiryR+WPhA3Itg3441Y3etOsa78wvKe1cA5r/ppL
 T5S1hq4g7U/hQKZ5Js39ArpYThtBv1OwCKbzMLz8NWtJbZY8kJRHo/SNx03Op1fbcqqd5RBVL
 1fYKdjNmzdi/z+O8RYhPtwWpNrIWl7Oqu+PBfGzcxzE8lBjXQ4qMNVXUlVGBDCfozge4QmD9E
 l037u/C3OXEVZwBiC6VHqiO3Qce3YQT3p82Wfzh0b6aXVNSkYOThp0so8DQR5Qqmis97jtviT
 rN4URgSEZh54z4z09uhierNtTDF0hRJk30HyJoFj4kOAd0akRibvVnvjxAdkgAasRiVuelkGH
 +66ElVBRhahNDbKBvnODENF/N4uVt9KZY6GaOPQyJ9noERteJI0PMuk8T2B18m71eRTrgo0Il
 SoYyrpSBuf9Lktl24x20BAmOvDkht+zQxLiboYgTtpXmt2ZPVtJwjQ08mRgljmXNV0vET2Guo
 RZ0Wps+uBZ1YSSwFhlR8AeapnxYp2Ql4CXMoC+3LrNIhQ=
Message-ID-Hash: VFLGW6D4Q6PVD6YDJOTONDOZ66DPL673
X-Message-ID-Hash: VFLGW6D4Q6PVD6YDJOTONDOZ66DPL673
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VFLGW6D4Q6PVD6YDJOTONDOZ66DPL673/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of repeatedly checking the sample width, assign a size shift
centrally.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 sound/pci/emu10k1/emu10k1_patch.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1=
_patch.c
index eb8365650bd4..699aa0fec97b 100644
=2D-- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -28,6 +28,7 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_=
sf_sample *sp,
 {
 	u8 fill;
 	u32 xor;
+	int shift;
 	int offset;
 	int truesize, size, blocksize;
 	struct snd_emu10k1 *emu;
@@ -43,9 +44,11 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd=
_sf_sample *sp,
 	}

 	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS) {
+		shift =3D 0;
 		fill =3D 0x80;
 		xor =3D (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_UNSIGNED) ? 0 : 0x8080808=
0;
 	} else {
+		shift =3D 1;
 		fill =3D 0;
 		xor =3D (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_UNSIGNED) ? 0x80008000 : =
0;
 	}
@@ -68,9 +71,7 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_=
sf_sample *sp,
 	sp->v.loopend +=3D BLANK_HEAD_SIZE;

 	/* try to allocate a memory block */
-	blocksize =3D truesize;
-	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
-		blocksize *=3D 2;
+	blocksize =3D truesize << shift;
 	sp->block =3D snd_emu10k1_synth_alloc(emu, blocksize);
 	if (sp->block =3D=3D NULL) {
 		dev_dbg(emu->card->dev,
@@ -83,16 +84,12 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct sn=
d_sf_sample *sp,

 	/* write blank samples at head */
 	offset =3D 0;
-	size =3D BLANK_HEAD_SIZE;
-	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
-		size *=3D 2;
+	size =3D BLANK_HEAD_SIZE << shift;
 	snd_emu10k1_synth_memset(emu, sp->block, offset, size, fill);
 	offset +=3D size;

 	/* copy provided samples */
-	size =3D sp->v.size;
-	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
-		size *=3D 2;
+	size =3D sp->v.size << shift;
 	if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size,=
 xor)) {
 		snd_emu10k1_synth_free(emu, sp->block);
 		sp->block =3D NULL;
=2D-
2.42.0.419.g70bf8a5751

