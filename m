Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E0D7E0641
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:19:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 790A6A4C;
	Fri,  3 Nov 2023 17:19:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 790A6A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028396;
	bh=HJuiZndxGbPAag6zIg3dcHrfIjZqXYwuX/ooR+96S8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KjekchvFNXkNfrsHXtat27nKyVqzMfiCIy1+6Wn+9kE+FjjHhgm9Muf8QBh2X2c8e
	 YZ2jRBDgqbNaWhriiCPSJfrkX6kXTriuY/njeC7eYXxyj8mo0Kwnqxr2wbrAvMCTiL
	 wjWV4Lf5hJs4uHRsluZQNeQjf5LK19qpslMipSRc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B54BF8056F; Fri,  3 Nov 2023 17:18:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B8EBF80579;
	Fri,  3 Nov 2023 17:18:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F045FF8019B; Fri, 27 Oct 2023 16:50:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DBB77F8010B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 16:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBB77F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=tABqpWzT
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 8FAF79C335E;
	Fri, 27 Oct 2023 10:50:47 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 9_6hwAtN1hrZ; Fri, 27 Oct 2023 10:50:47 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 1769D9C3363;
	Fri, 27 Oct 2023 10:50:47 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 1769D9C3363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1698418247; bh=xSd5bT3VHUf2LmY6gO6QlHovigVpPJKexFn+uptilyk=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=tABqpWzT7QoRJ+/QseLqW60z7whlW49uL63GXjwDYbYJpIDIDaORk0Jq8I/zPZame
	 7sLm7lruGpCs/DstY0RecSmYMu4lNbDQXs4TwFniPgGRB6NPehPJ+9qr8Lo5iqcT8L
	 3rLSnKWoT5Ch9VlKuKB4fDEFBI3DjXU2V2hMbzEy9qtaArTJfkmml3GhsREacZU1t/
	 Pw1zFMZh2hqnkq5WgEuZOPqHxbhCrc+cegkaaEmnxwNqDSjsaBnUvEmp3mW604DbQi
	 dpHfeCq5lXds9ooCrngJfhYj/UnwVN6+A0JxI0W1a/OEQuuS+MazWMyqmP/h6YNjlt
	 QiXxDN1iop75w==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id goheL8HQF4nc; Fri, 27 Oct 2023 10:50:47 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 2AEEE9C335E;
	Fri, 27 Oct 2023 10:50:46 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	broonie@kernel.org
Cc: elinor.montmasson@savoirfairelinux.com,
	alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com
Subject: [PATCHv2 02/10] ASoC: fsl-asoc-card: add second dai link component
 for codecs
Date: Fri, 27 Oct 2023 16:47:27 +0200
Message-Id: <20231027144734.3654829-3-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231027144734.3654829-1-elinor.montmasson@savoirfairelinux.com>
References: <20231027144734.3654829-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MailFrom: elinor.montmasson@savoirfairelinux.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NUFN3MLY7MCMBD2ROGSTFIPB5GR77EEU
X-Message-ID-Hash: NUFN3MLY7MCMBD2ROGSTFIPB5GR77EEU
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:18:03 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NUFN3MLY7MCMBD2ROGSTFIPB5GR77EEU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a second dai link component for codecs that will be use for the
generic codec use case.
It will use spdif_receiver and spdif_transmitter drivers as dummy codec
drivers, needing 2 codecs slots for the links.

To prevent deferrment for use cases using only one codec, also set
by default the number of codecs to 1 for the relevant dai links.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index cde31fd38262..a62f26fe9802 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -295,7 +295,7 @@ static int be_hw_params_fixup(struct snd_soc_pcm_runt=
ime *rtd,
=20
 SND_SOC_DAILINK_DEFS(hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY(), COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
=20
 SND_SOC_DAILINK_DEFS(hifi_fe,
@@ -305,7 +305,7 @@ SND_SOC_DAILINK_DEFS(hifi_fe,
=20
 SND_SOC_DAILINK_DEFS(hifi_be,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY(), COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_DUMMY()));
=20
 static const struct snd_soc_dai_link fsl_asoc_card_dai[] =3D {
@@ -618,6 +618,8 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
=20
 	memcpy(priv->dai_link, fsl_asoc_card_dai,
 	       sizeof(struct snd_soc_dai_link) * ARRAY_SIZE(priv->dai_link));
+	priv->dai_link[0].num_codecs =3D 1;
+	priv->dai_link[2].num_codecs =3D 1;
=20
 	priv->card.dapm_routes =3D audio_map;
 	priv->card.num_dapm_routes =3D ARRAY_SIZE(audio_map);
--=20
2.25.1
