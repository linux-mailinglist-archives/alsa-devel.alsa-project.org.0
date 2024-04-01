Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6442A893AE1
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 14:23:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC09D238D;
	Mon,  1 Apr 2024 14:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC09D238D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711974180;
	bh=sMxR7didSW4peuOKg2wIx7TiCvta31TNa0qLvs3bktk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rWtqupOcIkj+acHUiaYzFtiIzO6boqQDYA1EouMFyD1M0+pr1oKjC1PA9G4XIIZXf
	 cbj3Jc2uISoO1k1v44NXyW4wNGrM6TtKrMUKvRDKMpAJIwN+7jFUwtWY13rG65Vsbk
	 4h5q0FthLACuXjGFduquhxTzI9Ie3aWxLj5vEumo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 923A0F80611; Mon,  1 Apr 2024 14:21:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5956F80607;
	Mon,  1 Apr 2024 14:21:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21E3FF805D4; Mon,  1 Apr 2024 14:21:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D630DF80236
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 14:21:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D630DF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=QY7TiEwx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1711974087; x=1712578887;
	i=oswald.buddenhagen@gmx.de;
	bh=VC6vB3IHWNk+FHs+yPTuGSG9dzbiQj4ozp9KMsU8LGQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=QY7TiEwxc2iPHNWeyDTwOga7/1zFu1ZGUaxCSFmsDlBFr6IpuWio7MmRNxxmaPL2
	 PDZ6u2tln7kTxmky1mlsfMvXlj74BGw7ev7VYuQFMuQmfV51TT3nZr3Fk9ECNWl/9
	 GsP0MMyQLz4XN89rpEZnuGOyHQpdByZtbK1fo2GmlLulQhtLefTaQrIZ+EKE13AyK
	 Oe4qKLTquD1b6GZ8OiiyQJObdiVlh4ZTZ/3bl04ap6hEeQGJRLdKpLe4DnIzpXeFB
	 ndGdYiYHlo/xl1RGOP9iE5PdyRxUQKnCuas2aVn1wgP4vN+QGRmrfUSRXBjjHbVZK
	 6nYoKckbBXfZbvv9Xg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.100]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3bWr-1sqU4K2pwR-010bOQ; Mon, 01
 Apr 2024 14:21:27 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rrEZq-7ed-00; Mon, 01 Apr 2024 12:07:42 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH 11/18] ALSA: emu10k1: make wavetable sample playback start
 position exact
Date: Mon,  1 Apr 2024 12:07:35 +0200
Message-ID: <20240401100742.506001-12-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
References: <20240401100742.506001-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2mwzfk61bk2+a3HrM9btjOsaYesGpukqwy42gIa8CEVbmYNQLGi
 dy9JsXHlnYB56+qKkpbEw0GpWLNC/tCO8weYJdV68ONEP4c7CYlVeDptibdoT75r3EtrVyp
 OpDum2N2R942EOn49hktN3kn72njYx0dCC35sa0KeVjjTjVh1adV3kmlkpdXmB8O77lE5V1
 V6Nueqm5ttxW2+1IBJf4Q==
UI-OutboundReport: notjunk:1;M01:P0:yTaERdMiZ1A=;Ch/VCJkl7v+Xd06+Ce/bXgOFmXs
 Y2GGfq5leJok53kuSdIE63amEYh/O1sxVVAO4UNnu5f4KPHahNrmV+le6xbmRLy/htx2+M/g4
 4q8tR+9h0z/FKFVUixFUZFjPNEthsLmNYRwu2ctCVfEFR7N6tSBIBrF0ToDefXKCRHEqKUBVU
 wE+arl/V5CM80+SSMhwkFWeBSx2MBBIl9BeZ1GmUEIYWXBeM+9TkFFn1yL/TqLB7HFb1fQoJT
 kc0pQu8d8gDvow4q7Xj+wkVJdn0Qg7FzcwjFei0l7mR5Jk7KoRIi5OQT8RjD56HkG+WRL7vDx
 9/VwDyn9vFRZOT0D+0P76r55/RoWA+5ZaBEunSTgPiX+wjehVBbGHxiFyCoqf+jYX2gA+LDZV
 LxZ7eul52Owa+cczy9bABxPlBIO8w5EMm8ykbLqQI33W1d58m/M3yni9t6r0+l2/WK7cSqkjp
 feqwCSainHm48QoYYLwoukPNfI11iWLufD7PiZs3gFFWstTOyJVa2k5VJFTeU/q53h8YP10Pf
 38XwqPTUADJ+WyFrCf38V4xIVGav5TvsFeLnincyB8zz7lgxOxYmB7v1mMhFUgFDMj7fJEceS
 5jxiIzQuKg4BmmBJ4psDhP1lY9v2b8287zq/hJlqYQuOH72Qs2FgZiX1H2o2a4oEmMFKOyYqo
 q1YyVrb6Wfo9xUMZSz8J2ZKTHuu9U+VGVGOO70I2HK715T+A0nJYHCjQ0f6XxsY2XCZckG/SX
 sQxgCzSb7LnrVDGK6oJEgjzyvIitlvy8EBVOwwSIv+ghVOaJcYYHE2cSS0Ig3DG5RQSTTwUZ9
 TY3jsfqlc+IQVHv/qmenM7gbpQNZ+79gyp/XUM4ePUh1w=
Message-ID-Hash: HFESYTFNA3KDHQBP3G5F5MTTG2OYG7SD
X-Message-ID-Hash: HFESYTFNA3KDHQBP3G5F5MTTG2OYG7SD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HFESYTFNA3KDHQBP3G5F5MTTG2OYG7SD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This amends df335e9a8b (ALSA: emu10k1: fix synthesizer sample playback
position and caching, 2023-05-18), because now I know that the samples
are preceded by a blank block anyway, so we can just compensate for the
interpolator read-ahead without any additional fiddling.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 sound/pci/emu10k1/emu10k1_callback.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_callback.c b/sound/pci/emu10k1/emu1=
0k1_callback.c
index 2ed72bea1d8f..ef26e4d3e2a3 100644
=2D-- a/sound/pci/emu10k1/emu10k1_callback.c
+++ b/sound/pci/emu10k1/emu10k1_callback.c
@@ -255,7 +255,7 @@ lookup_voices(struct snd_emux *emu, struct snd_emu10k1=
 *hw,
 		/* check if sample is finished playing (non-looping only) */
 		if (bp !=3D best + V_OFF && bp !=3D best + V_FREE &&
 		    (vp->reg.sample_mode & SNDRV_SFNT_SAMPLE_SINGLESHOT)) {
-			val =3D snd_emu10k1_ptr_read(hw, CCCA_CURRADDR, vp->ch) - 64;
+			val =3D snd_emu10k1_ptr_read(hw, CCCA_CURRADDR, vp->ch) - 64 + 3;
 			if (val >=3D vp->reg.loopstart)
 				bp =3D best + V_OFF;
 		}
@@ -364,7 +364,7 @@ start_voice(struct snd_emux_voice *vp)

 	map =3D (hw->silent_page.addr << hw->address_mode) | (hw->address_mode ?=
 MAP_PTI_MASK1 : MAP_PTI_MASK0);

-	addr =3D vp->reg.start + 64;
+	addr =3D vp->reg.start + 64 - 3;
 	temp =3D vp->reg.parm.filterQ;
 	ccca =3D (temp << 28) | addr;
 	if (vp->apitch < 0xe400)
=2D-
2.42.0.419.g70bf8a5751

