Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D68F7E0642
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 17:20:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF7A8AEA;
	Fri,  3 Nov 2023 17:19:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF7A8AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699028415;
	bh=oNczte9HFo5bOBvwDZfCH79WRTphw+0kei5hXG7UILY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Mbh6LEu6OITsxkExeeOkioPbGJOAKs18+kRE6/rNqI9bBFXiirTJW7UEBQAlpBTLU
	 FV0TYYcl1Vsp4R4S/AJzzmV/vS+oeZkal2YUkRLRtU3HnFucQ6yayRpW8TW8ikTX+C
	 UYHwESONLTIzG01yPZH5cgNuIAqUG6A41XrAWZ08=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8CC4F805A0; Fri,  3 Nov 2023 17:18:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26D8CF80588;
	Fri,  3 Nov 2023 17:18:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8451AF8019B; Fri, 27 Oct 2023 16:51:02 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id DACEFF8010B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 16:50:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DACEFF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=WyJxvDVV
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id AD25D9C3364;
	Fri, 27 Oct 2023 10:50:55 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id uZgATj-RoTBu; Fri, 27 Oct 2023 10:50:55 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 005DD9C3366;
	Fri, 27 Oct 2023 10:50:55 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 005DD9C3366
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1698418255; bh=509RHA07uFY2kq/qe141zWcBrV8/mr1HHQ48cfSaInM=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=WyJxvDVVWKTAalzxIU7QRK8ZflXlPxvfxo3MpBf/rd6mKsgfimf7Aoz4Xut8cwwMK
	 Z0frmNZm1iEJyfVH1CjKHxuqrXJc8xC0iWaEdCKtWFM5xIiBM4duUlGJ4d1ITGJDk+
	 3vLaG6RdWMWtUv3Cu7gshcRDV/utBbR0KPS9752waOZqQ8qg/7flY3m5CFxMvUoY3J
	 kYXV8WAs9FaGTfR7SiCf3HgyWFqOG7r0jLSzUAcUbH4KpO1fWDyCQRSJO9iASrRv5/
	 K0KM3tKN/QDxAmh/ji9dYUhDwR0JiG+Sn/RWgs1OQbea0FF28dGXWlrMtmUqE+WRl/
	 GHp76psbHZtyg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id nx1zihdU-E15; Fri, 27 Oct 2023 10:50:54 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 180AB9C3364;
	Fri, 27 Oct 2023 10:50:54 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	broonie@kernel.org
Cc: elinor.montmasson@savoirfairelinux.com,
	alsa-devel@alsa-project.org,
	philip-dylan.gleonec@savoirfairelinux.com
Subject: [PATCHv2 03/10] ASoC: fsl-asoc-card: add compatibility to use 2
 codecs from device tree
Date: Fri, 27 Oct 2023 16:47:28 +0200
Message-Id: <20231027144734.3654829-4-elinor.montmasson@savoirfairelinux.com>
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
Message-ID-Hash: F65Q7OW4M63XKMI7PXCQQOJYXITE4XW3
X-Message-ID-Hash: F65Q7OW4M63XKMI7PXCQQOJYXITE4XW3
X-Mailman-Approved-At: Fri, 03 Nov 2023 16:18:04 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F65Q7OW4M63XKMI7PXCQQOJYXITE4XW3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add compatibility with the use of 2 codecs from the device tree.
It will be needed for the generic codec case.
Use cases using one codec will ignore any given codecs other than the
first.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelin=
ux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 62 +++++++++++++++++++----------------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
index a62f26fe9802..55052da60ccc 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -541,16 +541,17 @@ static int fsl_asoc_card_late_probe(struct snd_soc_=
card *card)
=20
 static int fsl_asoc_card_probe(struct platform_device *pdev)
 {
-	struct device_node *cpu_np, *codec_np, *asrc_np;
+	struct device_node *cpu_np, *asrc_np;
+	struct device_node *codec_np[2];
 	struct device_node *np =3D pdev->dev.of_node;
 	struct platform_device *asrc_pdev =3D NULL;
 	struct device_node *bitclkprovider =3D NULL;
 	struct device_node *frameprovider =3D NULL;
 	struct platform_device *cpu_pdev;
 	struct fsl_asoc_card_priv *priv;
-	struct device *codec_dev =3D NULL;
+	struct device *codec_dev[2] =3D { NULL, NULL };
 	const char *codec_dai_name;
-	const char *codec_dev_name;
+	const char *codec_dev_name[2];
 	u32 asrc_fmt =3D 0;
 	u32 width;
 	int ret;
@@ -576,21 +577,25 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
 		goto fail;
 	}
=20
-	codec_np =3D of_parse_phandle(np, "audio-codec", 0);
-	if (codec_np) {
-		struct platform_device *codec_pdev;
-		struct i2c_client *codec_i2c;
+	codec_np[0] =3D of_parse_phandle(np, "audio-codec", 0);
+	codec_np[1] =3D of_parse_phandle(np, "audio-codec", 1);
=20
-		codec_i2c =3D of_find_i2c_device_by_node(codec_np);
-		if (codec_i2c) {
-			codec_dev =3D &codec_i2c->dev;
-			codec_dev_name =3D codec_i2c->name;
-		}
-		if (!codec_dev) {
-			codec_pdev =3D of_find_device_by_node(codec_np);
-			if (codec_pdev) {
-				codec_dev =3D &codec_pdev->dev;
-				codec_dev_name =3D codec_pdev->name;
+	for (int i =3D 0; i < 2; i++) {
+		if (codec_np[i]) {
+			struct platform_device *codec_pdev;
+			struct i2c_client *codec_i2c;
+
+			codec_i2c =3D of_find_i2c_device_by_node(codec_np[i]);
+			if (codec_i2c) {
+				codec_dev[i] =3D &codec_i2c->dev;
+				codec_dev_name[i] =3D codec_i2c->name;
+			}
+			if (!codec_dev[i]) {
+				codec_pdev =3D of_find_device_by_node(codec_np[i]);
+				if (codec_pdev) {
+					codec_dev[i] =3D &codec_pdev->dev;
+					codec_dev_name[i] =3D codec_pdev->name;
+				}
 			}
 		}
 	}
@@ -600,8 +605,8 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 		asrc_pdev =3D of_find_device_by_node(asrc_np);
=20
 	/* Get the MCLK rate only, and leave it controlled by CODEC drivers */
-	if (codec_dev) {
-		struct clk *codec_clk =3D clk_get(codec_dev, NULL);
+	if (codec_dev[0]) {
+		struct clk *codec_clk =3D clk_get(codec_dev[0], NULL);
=20
 		if (!IS_ERR(codec_clk)) {
 			priv->codec_priv.mclk_freq =3D clk_get_rate(codec_clk);
@@ -710,8 +715,8 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 		priv->codec_priv.fll_id =3D NAU8822_CLK_PLL;
 		priv->codec_priv.pll_id =3D NAU8822_CLK_PLL;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBM_CFM;
-		if (codec_dev)
-			priv->codec_priv.mclk =3D devm_clk_get(codec_dev, NULL);
+		if (codec_dev[0])
+			priv->codec_priv.mclk =3D devm_clk_get(codec_dev[0], NULL);
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
@@ -729,11 +734,11 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
 	if (bitclkprovider || frameprovider) {
 		unsigned int daifmt =3D snd_soc_daifmt_parse_format(np, NULL);
=20
-		if (codec_np =3D=3D bitclkprovider)
-			daifmt |=3D (codec_np =3D=3D frameprovider) ?
+		if (codec_np[0] =3D=3D bitclkprovider)
+			daifmt |=3D (codec_np[0] =3D=3D frameprovider) ?
 				SND_SOC_DAIFMT_CBP_CFP : SND_SOC_DAIFMT_CBP_CFC;
 		else
-			daifmt |=3D (codec_np =3D=3D frameprovider) ?
+			daifmt |=3D (codec_np[0] =3D=3D frameprovider) ?
 				SND_SOC_DAIFMT_CBC_CFP : SND_SOC_DAIFMT_CBC_CFC;
=20
 		/* Override dai_fmt with value from DT */
@@ -749,7 +754,7 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 	of_node_put(bitclkprovider);
 	of_node_put(frameprovider);
=20
-	if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
+	if (!fsl_asoc_card_is_ac97(priv) && !codec_dev[0]) {
 		dev_dbg(&pdev->dev, "failed to find codec device\n");
 		ret =3D -EPROBE_DEFER;
 		goto asrc_fail;
@@ -789,7 +794,7 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 	ret =3D snd_soc_of_parse_card_name(&priv->card, "model");
 	if (ret) {
 		snprintf(priv->name, sizeof(priv->name), "%s-audio",
-			 fsl_asoc_card_is_ac97(priv) ? "ac97" : codec_dev_name);
+			 fsl_asoc_card_is_ac97(priv) ? "ac97" : codec_dev_name[0]);
 		priv->card.name =3D priv->name;
 	}
 	priv->card.dai_link =3D priv->dai_link;
@@ -814,7 +819,7 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 	priv->dai_link[0].codecs[0].dai_name =3D codec_dai_name;
=20
 	if (!fsl_asoc_card_is_ac97(priv))
-		priv->dai_link[0].codecs[0].of_node =3D codec_np;
+		priv->dai_link[0].codecs[0].of_node =3D codec_np[0];
 	else {
 		u32 idx;
=20
@@ -922,7 +927,8 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
=20
 asrc_fail:
 	of_node_put(asrc_np);
-	of_node_put(codec_np);
+	of_node_put(codec_np[0]);
+	of_node_put(codec_np[1]);
 	put_device(&cpu_pdev->dev);
 fail:
 	of_node_put(cpu_np);
--=20
2.25.1
