Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1C97E0640
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:19:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CFB684D;
	Fri,  3 Nov 2023 17:18:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CFB684D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028388;
	bh=4sMjpEWPnxTpFeZtEZi9FJ/TO2equr8HTkptmC/bILs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C/lYOZDWqmQw1RYhgD82I31YnQFj2ONvk2VOD/HPTO4zWKOvxhJvvuphv2rjdT4pe
	 NVDuoGYe+Tgq9KaLSfsANochk8MrW+5H+Pnuy/o8he/SAspLIB+BwGqE2hgMG35esU
	 z3TugeRN4DcTOEAIOs+/B2A55XZgdUIT8lLYwoXo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EED5F8055B; Fri,  3 Nov 2023 17:18:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0EC0F8055B;
	Fri,  3 Nov 2023 17:18:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 94AD3F8019B; Fri, 27 Oct 2023 16:50:43 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C49D1F8010B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 16:50:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C49D1F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=hRYqv+1Q
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 153589C3343;
	Fri, 27 Oct 2023 10:50:37 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 0Kyk5zieHL1z; Fri, 27 Oct 2023 10:50:36 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 8C2189C3359;
	Fri, 27 Oct 2023 10:50:36 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 8C2189C3359
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1698418236; bh=u9QYi3UK49RvCOM0jwOPRvXLix0O7m+OZA9DnyWKw9g=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=hRYqv+1Q/pQ1cbd7+SYhSx8Cpuy/9YDuFdiVSJRRkXkNRmfGCrSTdEJZivZdC7vH9
	 rwDN2oPRUSFtlVemGa9QP8QIyKQZeOkv5cNTQa5bplOdY/jzoKXkAAl7m8EHEFNjWy
	 yHW1Bg08HUoS+oLKVqjhQNYuiu+c6syfQUgsNtDcfA5u955kOGmJNzeZF17Uz1JcEB
	 ZTTShp8n65aCBfGMU3oo8tzZRfOrz2SioBEDnPnInM4YkzcWLwXkpkL6S14b0lXgEE
	 uzq/iggRbkgrfZCvIeHzkJ5Ubvi087xGtuZiVIWL+7MmEE32f77tfeKovsr/2mcczH
	 AUjUEOnGRIbMw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id GHMkVeD95BLh; Fri, 27 Oct 2023 10:50:36 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id A25259C3343;
	Fri, 27 Oct 2023 10:50:35 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	broonie@kernel.org
Cc: elinor.montmasson@savoirfairelinux.com,
	alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com
Subject: [PATCHv2 01/10] ASoC: fsl-asoc-card: add support for dai links with
 multiple codecs
Date: Fri, 27 Oct 2023 16:47:26 +0200
Message-Id: <20231027144734.3654829-2-elinor.montmasson@savoirfairelinux.com>
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
Message-ID-Hash: TV2TKEHEUMOMS2F4PO3PYELUODBYL2UN
X-Message-ID-Hash: TV2TKEHEUMOMS2F4PO3PYELUODBYL2UN
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:18:03 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TV2TKEHEUMOMS2F4PO3PYELUODBYL2UN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for dai links using multiple codecs for multi-codec
use cases.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index 7518ab9d768e..cde31fd38262 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -809,10 +809,10 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
=20
 	/* Normal DAI Link */
 	priv->dai_link[0].cpus->of_node =3D cpu_np;
-	priv->dai_link[0].codecs->dai_name =3D codec_dai_name;
+	priv->dai_link[0].codecs[0].dai_name =3D codec_dai_name;
=20
 	if (!fsl_asoc_card_is_ac97(priv))
-		priv->dai_link[0].codecs->of_node =3D codec_np;
+		priv->dai_link[0].codecs[0].of_node =3D codec_np;
 	else {
 		u32 idx;
=20
@@ -823,11 +823,11 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
 			goto asrc_fail;
 		}
=20
-		priv->dai_link[0].codecs->name =3D
+		priv->dai_link[0].codecs[0].name =3D
 				devm_kasprintf(&pdev->dev, GFP_KERNEL,
 					       "ac97-codec.%u",
 					       (unsigned int)idx);
-		if (!priv->dai_link[0].codecs->name) {
+		if (!priv->dai_link[0].codecs[0].name) {
 			ret =3D -ENOMEM;
 			goto asrc_fail;
 		}
@@ -838,13 +838,19 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
 	priv->card.num_links =3D 1;
=20
 	if (asrc_pdev) {
+		int i;
+		struct snd_soc_dai_link_component *codec;
+		struct snd_soc_dai_link *link;
+
 		/* DPCM DAI Links only if ASRC exists */
 		priv->dai_link[1].cpus->of_node =3D asrc_np;
 		priv->dai_link[1].platforms->of_node =3D asrc_np;
-		priv->dai_link[2].codecs->dai_name =3D codec_dai_name;
-		priv->dai_link[2].codecs->of_node =3D codec_np;
-		priv->dai_link[2].codecs->name =3D
-				priv->dai_link[0].codecs->name;
+		link =3D &(priv->dai_link[2]);
+		for_each_link_codecs(link, i, codec) {
+			codec->dai_name =3D priv->dai_link[0].codecs[i].dai_name;
+			codec->of_node =3D priv->dai_link[0].codecs[i].of_node;
+			codec->name =3D priv->dai_link[0].codecs[i].name;
+		}
 		priv->dai_link[2].cpus->of_node =3D cpu_np;
 		priv->dai_link[2].dai_fmt =3D priv->dai_fmt;
 		priv->card.num_links =3D 3;
--=20
2.25.1
