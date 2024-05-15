Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EE18C67E4
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2024 15:56:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88DA1822;
	Wed, 15 May 2024 15:56:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88DA1822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715781374;
	bh=jfV/GT/gJI+RMAoSXE4yT0V7uZQi4slW0BMHFHokoAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QLJCkppexDlVQ+USDMWS2gJCl6fY5NR/YRQizhFG5lpsIYB9wPSzH/VwFBgx8M/cs
	 +/2me5PLLa6pQEoKExSC+uMJf9vFIDMNAEcGKZU3Ur9tEqCwCVzOrZiMWMHDyIFOFm
	 ns/yQW7sQ5dQMxzRMUNoYhQjKU4USZ/VNRZ+lWiM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E336F8057A; Wed, 15 May 2024 15:54:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04E4DF80637;
	Wed, 15 May 2024 15:54:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C334F805C6; Wed, 15 May 2024 15:54:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5FEECF800F5
	for <alsa-devel@alsa-project.org>; Wed, 15 May 2024 15:54:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FEECF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=vl0xUnXs
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 33B529C5902;
	Wed, 15 May 2024 09:54:29 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id oLQzmlB7ssmx; Wed, 15 May 2024 09:54:28 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 3607B9C5901;
	Wed, 15 May 2024 09:54:28 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 3607B9C5901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1715781268; bh=GpzR/17iMA4EadC53BL4NxQUIlEZs6QmMHR5Cm26pOc=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=vl0xUnXs7mucGwqzmCP+MNBzyr2Jb2/nqr2VjDOuYnWtx7jTAJ4VYP8JFa6m6EdM+
	 /ZoQzHHA7r4vZUXX0UPzUkQwldIWsUG4JTjOkI6AVVLFGBKfnhZuLGH3adNIPLv27T
	 ZAf3yuVbia7eNLCTGVhwVocSytJWsGToJTLgTHO/uzJ7OAQff+i/mVYGg2ImU8gH1x
	 WHqB7yja6jPuxMVVETkpSyaav86Njhh9gaAxDFnE51jc/nuqSe+trOREmcapXLSwfT
	 6/pQshTaoP6CyldZO/bG9ffHm4UJLvwQS8J/Hp5mNJpdaa3lw0vCZT90qIA6nQXAk8
	 4+IjC/yC/9TtQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 9M6HJKIjOg_U; Wed, 15 May 2024 09:54:28 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 3ED219C58F8;
	Wed, 15 May 2024 09:54:26 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Subject: [PATCHv4 4/9] ASoC: fsl-asoc-card: add new compatible for a generic
 codec use case
Date: Wed, 15 May 2024 15:54:06 +0200
Message-Id: <20240515135411.343333-5-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 7BN6EZJK2ZKQB5TLHDYN4OC4DKCCHLVH
X-Message-ID-Hash: 7BN6EZJK2ZKQB5TLHDYN4OC4DKCCHLVH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7BN6EZJK2ZKQB5TLHDYN4OC4DKCCHLVH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the new compatible "fsl,imx-audio-generic" for a generic codec
use case. It allows using the fsl-asoc-card driver with the
spdif_receiver and spdif_transmitter codec drivers used as dummy codecs.
It can be used for cases where there is no real codec or codecs which do
not require declaring controls.

Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux=
.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 620a25eb068a..a4ecc9093558 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -567,6 +567,7 @@ static int fsl_asoc_card_probe(struct platform_device *=
pdev)
 	struct platform_device *cpu_pdev;
 	struct fsl_asoc_card_priv *priv;
 	struct device *codec_dev[2] =3D { NULL, NULL };
+	const char *generic_codec_dai_names[2];
 	const char *codec_dai_name;
 	const char *codec_dev_name[2];
 	u32 asrc_fmt =3D 0;
@@ -744,6 +745,11 @@ static int fsl_asoc_card_probe(struct platform_device =
*pdev)
 		priv->codec_priv[0].fll_id =3D WM8904_CLK_FLL;
 		priv->codec_priv[0].pll_id =3D WM8904_FLL_MCLK;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
+	} else if (of_device_is_compatible(np, "fsl,imx-audio-generic")) {
+		generic_codec_dai_names[0] =3D "dit-hifi";
+		generic_codec_dai_names[1] =3D "dir-hifi";
+		priv->dai_link[0].num_codecs =3D 2;
+		priv->dai_link[2].num_codecs =3D 2;
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret =3D -EINVAL;
@@ -798,6 +804,12 @@ static int fsl_asoc_card_probe(struct platform_device =
*pdev)
 		ret =3D -EPROBE_DEFER;
 		goto asrc_fail;
 	}
+	if (of_device_is_compatible(np, "fsl,imx-audio-generic")
+	  && !codec_dev[1]) {
+		dev_dbg(&pdev->dev, "failed to find second codec device\n");
+		ret =3D -EPROBE_DEFER;
+		goto asrc_fail;
+	}
=20
 	/* Common settings for corresponding Freescale CPU DAI driver */
 	if (of_node_name_eq(cpu_np, "ssi")) {
@@ -855,11 +867,21 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
=20
 	/* Normal DAI Link */
 	priv->dai_link[0].cpus->of_node =3D cpu_np;
-	priv->dai_link[0].codecs[0].dai_name =3D codec_dai_name;
=20
-	if (!fsl_asoc_card_is_ac97(priv))
+	if (of_device_is_compatible(np, "fsl,imx-audio-generic")) {
+		priv->dai_link[0].codecs[0].dai_name =3D
+			generic_codec_dai_names[0];
+		priv->dai_link[0].codecs[1].dai_name =3D
+			generic_codec_dai_names[1];
+	} else {
+		priv->dai_link[0].codecs[0].dai_name =3D codec_dai_name;
+	}
+
+	if (!fsl_asoc_card_is_ac97(priv)) {
 		priv->dai_link[0].codecs[0].of_node =3D codec_np[0];
-	else {
+		if (of_device_is_compatible(np, "fsl,imx-audio-generic"))
+			priv->dai_link[0].codecs[1].of_node =3D codec_np[1];
+	} else {
 		u32 idx;
=20
 		ret =3D of_property_read_u32(cpu_np, "cell-index", &idx);
@@ -990,6 +1012,7 @@ static const struct of_device_id fsl_asoc_card_dt_ids[=
] =3D {
 	{ .compatible =3D "fsl,imx-audio-wm8958", },
 	{ .compatible =3D "fsl,imx-audio-nau8822", },
 	{ .compatible =3D "fsl,imx-audio-wm8904", },
+	{ .compatible =3D "fsl,imx-audio-generic", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asoc_card_dt_ids);
--=20
2.34.1

