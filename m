Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 358C59105D7
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 15:27:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37FCEE64;
	Thu, 20 Jun 2024 15:27:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37FCEE64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718890059;
	bh=3ubglKc/KOQfIaZlNmwQ0fJ7AXhD9dtSkMjUYfLv3QM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dpW7J2rnn62U2klB8ogVJzlNegNGjBwuErx2u1wS2fsuZSNywt/Pf3EonoR55vGed
	 8g2o3/1RKZCRaqQJiC3SN1bjpdfEdJwAMeYHd/1v9H/5UrUxFTOp6hooGGoZDnS2fZ
	 3tezjsW860d84BfUSno5nYw+bPmnbd2lB1X/CR4U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A649F805F0; Thu, 20 Jun 2024 15:26:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD4FFF805E3;
	Thu, 20 Jun 2024 15:26:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E2F2F80266; Thu, 20 Jun 2024 15:26:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1A9DF80154
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 15:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1A9DF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=HsgPvPPT
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id C17259C5B16;
	Thu, 20 Jun 2024 09:26:30 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id fl0eZEgRxpZp; Thu, 20 Jun 2024 09:26:30 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 02A289C54A9;
	Thu, 20 Jun 2024 09:26:30 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 02A289C54A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1718889990; bh=QtA/pIJ8bF/vOwhsCRzTiYA82D2ZNAC429FN7VFxLnA=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=HsgPvPPTwoDHCG+RqNaaAdISoR3KxyHv0RlIXdjQtLwF4UX9EpmKxHFIxmkXt0laX
	 jSqcjZVnw+b5DoQepHdGe38tkkUkiAqkp6KK2FsF4FsHFbdTg/ab8sUeTwZYI5dALC
	 ffiigX34O60QNabSPcsrS2UZgUNOqZ1aqHMCjpwqVLjJ7BvF1F3AgItiT3Qf5lyK/M
	 mzbApItI6inGQzwQ33wAZc6y+ZVGejrBHeYyzZxoynIYNFE6MzT9HP6mn0v9AV0eyR
	 fw1HlujxwHJqU1B+vZXOur5cvVP4mFDhGhQgjbymZNwLGvL3RGtAXUTgqeB7gMMGBs
	 FqYBLbsvJHMeA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id UvN-nFUPYSQE; Thu, 20 Jun 2024 09:26:29 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 22B9B9C5B16;
	Thu, 20 Jun 2024 09:26:27 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>
Subject: [PATCHv5 3/9] ASoC: fsl-asoc-card: add second dai link component for
 codecs
Date: Thu, 20 Jun 2024 15:25:05 +0200
Message-Id: <20240620132511.4291-4-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
References: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: B4FOJ4BSGHKFCDJZ3ZWAUPOVDTTCRF4J
X-Message-ID-Hash: B4FOJ4BSGHKFCDJZ3ZWAUPOVDTTCRF4J
X-MailFrom: elinor.montmasson@savoirfairelinux.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4FOJ4BSGHKFCDJZ3ZWAUPOVDTTCRF4J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a second dai link component for codecs that will be used for use
cases with 2 codecs.
It is needed for future integration of the SPDIF support, which will
use spdif_receiver and spdif_transmitter drivers.

To prevent deferring in use cases using only one codec, also set
by default the number of codecs to 1 for the relevant dai links.

Co-developed-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinu=
x.com>
Signed-off-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.=
com>
Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index e8003fbc8092..805e2030bde4 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -296,7 +296,7 @@ static int be_hw_params_fixup(struct snd_soc_pcm_runtim=
e *rtd,
=20
 SND_SOC_DAILINK_DEFS(hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY(), COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
=20
 SND_SOC_DAILINK_DEFS(hifi_fe,
@@ -306,7 +306,7 @@ SND_SOC_DAILINK_DEFS(hifi_fe,
=20
 SND_SOC_DAILINK_DEFS(hifi_be,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+	DAILINK_COMP_ARRAY(COMP_EMPTY(), COMP_EMPTY()));
=20
 static const struct snd_soc_dai_link fsl_asoc_card_dai[] =3D {
 	/* Default ASoC DAI Link*/
@@ -622,6 +622,8 @@ static int fsl_asoc_card_probe(struct platform_device *=
pdev)
=20
 	memcpy(priv->dai_link, fsl_asoc_card_dai,
 	       sizeof(struct snd_soc_dai_link) * ARRAY_SIZE(priv->dai_link));
+	priv->dai_link[0].num_codecs =3D 1;
+	priv->dai_link[2].num_codecs =3D 1;
=20
 	priv->card.dapm_routes =3D audio_map;
 	priv->card.num_dapm_routes =3D ARRAY_SIZE(audio_map);
--=20
2.34.1

