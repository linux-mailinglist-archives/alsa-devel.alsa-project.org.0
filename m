Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3AF89A98C
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 09:20:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 489482D4B;
	Sat,  6 Apr 2024 09:19:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 489482D4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712388005;
	bh=EmHJN1ikWgpJOH4MzzO3lIRmm9J1jB6N4+P1k1tTHGQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fSEDYVKvKzvH4TuIXFiEwmmvxJ3bIMXCKEFYySiGc1ESO3Dc+Jet3JweKcXvq5y4S
	 4NvrJ6UbTcRlH5hP8cAZDN2j6qPIA1FzpfY7gnMXYpqGfmtT++fT9FjeQ7ysiWQG4Q
	 0yxQ/JQGi5Qz06PNo5RMC9fu/AG8Hxv1Tsz7bJDY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87754F8057F; Sat,  6 Apr 2024 09:19:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C72CF8057F;
	Sat,  6 Apr 2024 09:19:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E6E6F8016E; Sat,  6 Apr 2024 09:01:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E285BF80568
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 09:00:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E285BF80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=QRuFMVlx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712386851; x=1712991651;
	i=oswald.buddenhagen@gmx.de;
	bh=GrGs9w7QVBfmnd57OsBEJMSLD44lBCfovL1piwD3FAE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=QRuFMVlxrIKO96jyrMfKhL4Sxi0DE1j+SZBIAvQw5Efm/VJwHTtLBNZqWaOqfST3
	 k7UXFTEctODmGXuzKWmGss/7Rdun5rEyUorhpG7QtWqXgvlpKZwSFk1SGuRpfmALY
	 v7+TGgmh0poh8/gwQx5M6/QxM9nf6VkccAYLbuXNnoi+0d0PbBDVWN0yCwLKVICTh
	 HmU37TyTYfXxbyp6PEVUsAlDYTVpWU7zAQGzDDTMfONVPuSuD52bQOk9MIHErf22L
	 QOzcjy7LSPBEk8aBf/rFnTBpVGc1Imx2Ma8MU0gqtRh6G5977XSuQWnTqD/awSC2K
	 0l0cZkpAyisc31gwRA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.118]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPXd2-1s6f330mN0-00MZcN; Sat, 06
 Apr 2024 09:00:51 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rszqo-JrU-00; Sat, 06 Apr 2024 08:48:30 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v3 13/17] ALSA: emu10k1: de-duplicate size calculations for
 16-bit samples
Date: Sat,  6 Apr 2024 08:48:26 +0200
Message-ID: <20240406064830.1029573-14-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
References: <20240406064830.1029573-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:w+XuBGtyRklhSUfscz2yiRZhl7nlV0YHnwVXvT/YC42ELoyDXn3
 fH+iypYSHcKAxMUb2fL9axTwYMeWvPB9SDN57oxDjInh98s9DWGuKwkb4doLlbzjo3+4HKA
 5LF2WP0gHMP00OjBvxxewDhl4L5ZQiH7LENXRUH/OQ3a3ks/dHlw+B4gd1HLem3pECpYigT
 rv/NjPL2uNflnmAjcqcxw==
UI-OutboundReport: notjunk:1;M01:P0:8NUHwK5NTGY=;OQEAx0h3IoNeavUdaRtveR0wKde
 bBkE9XqPY5wrNrwCd8v2mPBox14saluC+K0jaSOZCRLPgXLEj4e0scxdKkoS66D8IfHlX/1K1
 ldc5Cr4i51fw33/VFFXNA2lEEViPIARbza4VWPFcp62YKIlDXHJY/tCu5wm+r7/UKi2G0CHVW
 SsmsDXaAqMOKJS5SOudCRh7/2IzxOtZefCsMfcg0jlISpd4zi5CiNStMIxhwInugdGf0kYXFY
 2sgSzsHf4PsANrX1IlMuYK4X7crV2UHRSsU/8iCnZkQobYXRWLABADfeTen9Geqvj21hKCvON
 dB8Nq89fZizbKd6JbjFav7NA8fSdyeKquZslpx5rSRmXJZV85zqw7UwnGHOAtfaNADP4VzYP7
 qFKryHqojvX+5L3sy+Z6OoOJJ4niZEol/bnPSMDWlb8J4eKig9v3zg8qnrXXHaWe0O461wZ5r
 Q8jyBo1ujwpnahWnEeeC4pucK1Jp7U3Jq62kJWOfuATUcsdr1dAntIRTbavslyuOed736S0Oh
 3oweuxIIx9ZTtgWwIgocIg7bTAaQyYo7hSZObZS6vaxSJmDDNHH0ZdSMSxfIZHf04MdAC4sq9
 TRx7OjcHWSRffujk3iWlc1dtcGkGzCeAK4Oax3uRUPTEzLqCJOF1ke5B7aUC/ag0viB6v8xuZ
 C59Ung7LA19Lf/C4hEkZgnDn4yelBokxgMTUiINX60md6eVgTAJL5NTe0ZmcWT6r1dgiPo7zy
 aJtRetfPocI3qPbQNnpsJTSfo4EO8gUcfIBMTOcb4MSCtUfkfLcsBXia/YfFd225IwoB3yCWh
 l4M3+rj+BVEvQyFjZs/Z1TnAbI7voAdZNFpCLFyJUEHS8=
Message-ID-Hash: A3O2A2PUXYE7C6YS6AAP2IISJUWJPPJY
X-Message-ID-Hash: A3O2A2PUXYE7C6YS6AAP2IISJUWJPPJY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A3O2A2PUXYE7C6YS6AAP2IISJUWJPPJY/>
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
---
 sound/pci/emu10k1/emu10k1_patch.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_patch.c b/sound/pci/emu10k1/emu10k1_=
patch.c
index ad16de99b800..481fe03fef4d 100644
--- a/sound/pci/emu10k1/emu10k1_patch.c
+++ b/sound/pci/emu10k1/emu10k1_patch.c
@@ -28,6 +28,7 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_s=
f_sample *sp,
 {
 	u8 fill;
 	u32 xor;
+	int shift;
 	int offset;
 	int truesize, size, blocksize;
 	struct snd_emu10k1 *emu;
@@ -43,9 +44,11 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_=
sf_sample *sp,
 	}
=20
 	if (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS) {
+		shift =3D 0;
 		fill =3D 0x80;
 		xor =3D (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_UNSIGNED) ? 0 : 0x80808080;
 	} else {
+		shift =3D 1;
 		fill =3D 0;
 		xor =3D (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_UNSIGNED) ? 0x80008000 : 0;
 	}
@@ -68,9 +71,7 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd_s=
f_sample *sp,
 	sp->v.loopend +=3D BLANK_HEAD_SIZE;
=20
 	/* try to allocate a memory block */
-	blocksize =3D truesize;
-	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
-		blocksize *=3D 2;
+	blocksize =3D truesize << shift;
 	sp->block =3D snd_emu10k1_synth_alloc(emu, blocksize);
 	if (sp->block =3D=3D NULL) {
 		dev_dbg(emu->card->dev,
@@ -83,16 +84,12 @@ snd_emu10k1_sample_new(struct snd_emux *rec, struct snd=
_sf_sample *sp,
=20
 	/* write blank samples at head */
 	offset =3D 0;
-	size =3D BLANK_HEAD_SIZE;
-	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
-		size *=3D 2;
+	size =3D BLANK_HEAD_SIZE << shift;
 	snd_emu10k1_synth_memset(emu, sp->block, offset, size, fill);
 	offset +=3D size;
=20
 	/* copy provided samples */
-	size =3D sp->v.size;
-	if (! (sp->v.mode_flags & SNDRV_SFNT_SAMPLE_8BITS))
-		size *=3D 2;
+	size =3D sp->v.size << shift;
 	if (snd_emu10k1_synth_copy_from_user(emu, sp->block, offset, data, size, =
xor)) {
 		snd_emu10k1_synth_free(emu, sp->block);
 		sp->block =3D NULL;
--=20
2.44.0.701.g2cf7baacf3.dirty

