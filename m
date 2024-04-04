Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A118984B0
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 12:07:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53C542CAE;
	Thu,  4 Apr 2024 12:07:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53C542CAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712225240;
	bh=8lNlf3jlZZqm/2NB4g/MllgFXVAvssLgW1cFiWUJeow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ek9jejG3EBZsx+mgzGjIGiPHZEeUmWJmJH96+4mJee+EucVisc1wxKuhApQyAe1Bh
	 CT4cubszyaFbpSZsIWl5Ee6oFFqQ8kr8MUKqlZf7LmflWcRqYsWltwkgAwy27fFsUv
	 Rdl8PW5MSa/gb+S4BN4e34nS3//NRoJDG/KX7St0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B552F80624; Thu,  4 Apr 2024 12:04:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A77AF80815;
	Thu,  4 Apr 2024 12:04:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02B29F80798; Thu,  4 Apr 2024 12:03:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C86CCF8057A
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 12:03:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C86CCF8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=dv/UnmzP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712224977; x=1712829777;
	i=oswald.buddenhagen@gmx.de;
	bh=cXVA4THpoOuQmvVhbCnJNxDK0wsu4gIMaNVjdufjhV4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=dv/UnmzPleMPU1w20UnzOfTbpJkFGXhmmP1ftlq0d+VM69TKpBAVpn+YvI2pzT9q
	 xoCgjV0TWqxDhrdtdpq0LAPbojfBtcO2C/NKTQEVir7+lOJ30rJNsBbxjipvdNuNt
	 EMMMdFgUXUpTCIhVgYYgDim3X0WrSNEgUg4e14HDEiaR2MhMnyIz9f4vNiBub9cso
	 qP4C/UiABtBWemHS9Q1uCP9lqhKqgRnmdZ7fogYWO5l9uEVlh6T8me+ILPj9VEwbs
	 NShO1mF+goXOH8/82rtzqwaUf8uLatDXZbi3TigsjnRKFvGrAVXSc8rr4wpkz4i61
	 iJtD3KVDiucFaPE4WQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.126]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4Qwg-1sqIoo47Wg-011TqA; Thu, 04
 Apr 2024 12:02:57 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rsJto-RFm-00; Thu, 04 Apr 2024 12:00:48 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Arthur Marsh <arthur.marsh@internode.on.net>
Subject: [PATCH v2 10/17] ALSA: emu10k1: fix playback of 8-bit wavetable
 samples
Date: Thu,  4 Apr 2024 12:00:41 +0200
Message-ID: <20240404100048.819674-11-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.42.0.419.g70bf8a5751
In-Reply-To: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
References: <20240404100048.819674-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IU96ncvC4RwCBM5LcW3eqCDw8rCZq1a7/Detz4fA2ZrjX5l3UE8
 mKRCIXHO+1MMzYBFmxy2V48O8p6pBj9NGjNJ29OZmAErZSa+GTCOVArkPdb9gL5aigHVIFp
 3+iObDGhqyxVEUVyt3s1aS6TXdfCDZ/9cf1e+L82yhuGljiMTA3PKGv3y4FXIwnxzz79TCb
 0tuold43IUw3cQL0w82ag==
UI-OutboundReport: notjunk:1;M01:P0:TK8heQhuk4Y=;2Evw5wNBAsT1gnKw6aUJ/WarTns
 8hh4Rd6D8oz0jT0jiKLuPVN4YCvxAJJsDrNw7Q90j5tRCfaFQSrOzTk0MzDRie0NgXlOw02Zv
 lTVT5ovWh1Q5UoazB8GoEn57hKBNsea0hC2/SAqHyJ1QG5YZwFaoj7GnWljfqGgdvn27JhyOO
 ZwNg1h4GdMu7C6V7naIUGm+H9idaYcfe+rGauou1S3dOgo6Xu2sWzDou8Nm3g1rPnQpuz+Pa9
 Fo314tghlGLJS+EXp7L6I6oy6Fkh35eresoXiQOkM0BRE3z6v1NP+49zDVvNIioz2z5p+N883
 qsoKpQpDzdJDHSuXkt/zeGGxkEgop0SjD2wss8h7gy9lf4JGqNYV/Q5FRrW2mYQCa6F+Oe1gO
 8/Nz3KXWNZw5KJqxfUkAhcg0aYiqZCr2wJWCxFE/lLD35GoZEV43OeYg/+mvV6cWwcZ6Znd6T
 9ntfVTL2kNV5R286DZ7/fI8fWbc+5i30z50M1S+r3pt3PZKsdN0ftLkz5UpD9b9wKPF/q9ldo
 V+cY8YkHq/wThWZ5XnmpJTbeJL1HMVu4xgDU9Pba9IsukcL/j1S7JTJBvAbs9Rc2qRy+NYp0T
 i/+5BbVzGrfB8ljzlgRMWuknAdcdi2G3dIG0FFLwAYWVLclUluN4D1hqglqXb2VJlUUE1cXrz
 dsy4jSN73JG/G5TioRWbW9ktUm4aFLmKO0G1c3IiI05cdOgOChXrpHy8Hq0pcA8g7zlViWc5J
 wcv51ftn6p9b9JTL8jECD76L7vzxdA4wCWt9vuCdoAEXYeDMJD+p2Wuz4MXMd2O3DJ8XCMTmL
 0FEpTgRJL9pjtN7YgXkitJQYigKTfOTXkHFbFsYzBn1Es=
Message-ID-Hash: HVGC6KTBMHXKTU4QU53KLYKUITZTKT2W
X-Message-ID-Hash: HVGC6KTBMHXKTU4QU53KLYKUITZTKT2W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVGC6KTBMHXKTU4QU53KLYKUITZTKT2W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Samples are byte-sized in this mode, and thus the offset calculation
needs no shifting.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
=2D--
 sound/pci/emu10k1/emu10k1_callback.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_callback.c b/sound/pci/emu10k1/emu1=
0k1_callback.c
index 941bfbf812ed..5f6c47cbb809 100644
=2D-- a/sound/pci/emu10k1/emu10k1_callback.c
+++ b/sound/pci/emu10k1/emu10k1_callback.c
@@ -310,27 +310,29 @@ start_voice(struct snd_emux_voice *vp)
 {
 	unsigned int temp;
 	int ch;
+	bool w_16;
 	u32 psst, dsl, map, ccca, vtarget;
 	unsigned int addr, mapped_offset;
 	struct snd_midi_channel *chan;
 	struct snd_emu10k1 *hw;
 	struct snd_emu10k1_memblk *emem;

 	hw =3D vp->hw;
 	ch =3D vp->ch;
 	if (snd_BUG_ON(ch < 0))
 		return -EINVAL;
 	chan =3D vp->chan;
+	w_16 =3D !(vp->reg.sample_mode & SNDRV_SFNT_SAMPLE_8BITS);

 	emem =3D (struct snd_emu10k1_memblk *)vp->block;
 	if (emem =3D=3D NULL)
 		return -EINVAL;
 	emem->map_locked++;
 	if (snd_emu10k1_memblk_map(hw, emem) < 0) {
 		/* dev_err(hw->card->devK, "emu: cannot map!\n"); */
 		return -ENOMEM;
 	}
-	mapped_offset =3D snd_emu10k1_memblk_offset(emem) >> 1;
+	mapped_offset =3D snd_emu10k1_memblk_offset(emem) >> w_16;
 	vp->reg.start +=3D mapped_offset;
 	vp->reg.end +=3D mapped_offset;
 	vp->reg.loopstart +=3D mapped_offset;
@@ -371,7 +373,7 @@ start_voice(struct snd_emux_voice *vp)
 		unsigned int shift =3D (vp->apitch - 0xe000) >> 10;
 		ccca |=3D shift << 25;
 	}
-	if (vp->reg.sample_mode & SNDRV_SFNT_SAMPLE_8BITS)
+	if (!w_16)
 		ccca |=3D CCCA_8BITSELECT;

 	vtarget =3D (unsigned int)vp->vtarget << 16;
=2D-
2.42.0.419.g70bf8a5751

