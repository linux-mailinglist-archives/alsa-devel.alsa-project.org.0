Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CEC9105DA
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 15:27:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C26DEBE;
	Thu, 20 Jun 2024 15:27:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C26DEBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718890070;
	bh=vAbe3nu3Bi0XGuMn82hu/sUxLMfL3W8yf08fCduxYq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BnTsrCICns9/8WFrfqy98lyO7h8SOmFkOLSGs3YAUyBBpo6qgwK7CLANaXc5T099K
	 /3dQTGIljsnqADcX3+e2iF+gVEEfDVdYsLqsv+SqeoDCIwME1O0P3aIvw+MOVoAWPv
	 tYgs4NJ+zsGdc0CtRUxSgl9RLl4Pg7egrXuG8WkE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12646F805F7; Thu, 20 Jun 2024 15:26:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25194F80604;
	Thu, 20 Jun 2024 15:26:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2B54F805EE; Thu, 20 Jun 2024 15:26:49 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A3B11F80154
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 15:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3B11F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=t3aW+UUT
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 7F8DA9C5B16;
	Thu, 20 Jun 2024 09:26:36 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id tFNkJ9PjWVUN; Thu, 20 Jun 2024 09:26:33 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E5FEB9C3240;
	Thu, 20 Jun 2024 09:26:32 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com E5FEB9C3240
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1718889992; bh=dhNRfzKELW27kNOTUmIVEYQ4XrB9IeZ7AciW7pULV5c=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=t3aW+UUTLmXgrN9Nxa/ZD1jGCspPuSXdG6OOfOkKqfsKNqfurhmm+7dOQe4T+ZJI1
	 cnQbTU94v1YzqQ1QsD4us1b8JDI09ktwvl5uKRd3wHsnSDR38dNeXRNoNT0GCi2Ij1
	 Kh28GMckDv8MNp57s6vsAKS4FlYAjO8cyTaE8Aqn/zV5JuDAaLRbs+5kRizu3ffAPw
	 lpz9ZhXqefpUxYvLhuvTD58gBeZ4b0FAaRQe+fJ9+Pjn2Ln2IaVbJ6pcCwsBfr1U2j
	 5sqghZBat4Nk04XlkRgGpQC7/Mg019n5Kp4sYh2lJbJ5xTi6Okp6B8tNzgM9R56rid
	 KfJac31bNztxQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id WtGZEqs0qXbp; Thu, 20 Jun 2024 09:26:32 -0400 (EDT)
Received: from gerard.rennes.sfl
 (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 17A1B9C5A85;
	Thu, 20 Jun 2024 09:26:30 -0400 (EDT)
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
Subject: [PATCHv5 4/9] ASoC: fsl-asoc-card: add compatibility to use 2 codecs
 in dai-links
Date: Thu, 20 Jun 2024 15:25:06 +0200
Message-Id: <20240620132511.4291-5-elinor.montmasson@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
References: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VPQ3UW5K7KI6SQXVSB3GZAJ5DKYX7IO5
X-Message-ID-Hash: VPQ3UW5K7KI6SQXVSB3GZAJ5DKYX7IO5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPQ3UW5K7KI6SQXVSB3GZAJ5DKYX7IO5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Adapt the driver to work with configurations using two codecs or more.
Modify fsl_asoc_card_probe() to handle use cases where 2 codecs are
given in the device tree.
This will be needed to add support for the SPDIF.

Use cases using one codec will ignore any given codecs other than the
first.

Co-developed-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinu=
x.com>
Signed-off-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.=
com>
Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 279 ++++++++++++++++++++--------------
 1 file changed, 161 insertions(+), 118 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 805e2030bde4..87329731e02d 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -99,7 +99,7 @@ struct fsl_asoc_card_priv {
 	struct simple_util_jack hp_jack;
 	struct simple_util_jack mic_jack;
 	struct platform_device *pdev;
-	struct codec_priv codec_priv;
+	struct codec_priv codec_priv[2];
 	struct cpu_priv cpu_priv;
 	struct snd_soc_card card;
 	u8 streams;
@@ -172,10 +172,12 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_sub=
stream *substream,
 	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
 	struct fsl_asoc_card_priv *priv =3D snd_soc_card_get_drvdata(rtd->card);
 	bool tx =3D substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK;
-	struct codec_priv *codec_priv =3D &priv->codec_priv;
+	struct codec_priv *codec_priv;
+	struct snd_soc_dai *codec_dai;
 	struct cpu_priv *cpu_priv =3D &priv->cpu_priv;
 	struct device *dev =3D rtd->card->dev;
 	unsigned int pll_out;
+	int codec_idx;
 	int ret;
=20
 	priv->sample_rate =3D params_rate(params);
@@ -208,28 +210,32 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_sub=
stream *substream,
 	}
=20
 	/* Specific configuration for PLL */
-	if (codec_priv->pll_id >=3D 0 && codec_priv->fll_id >=3D 0) {
-		if (priv->sample_format =3D=3D SNDRV_PCM_FORMAT_S24_LE)
-			pll_out =3D priv->sample_rate * 384;
-		else
-			pll_out =3D priv->sample_rate * 256;
+	for_each_rtd_codec_dais(rtd, codec_idx, codec_dai) {
+		codec_priv =3D &priv->codec_priv[codec_idx];
=20
-		ret =3D snd_soc_dai_set_pll(snd_soc_rtd_to_codec(rtd, 0),
-					  codec_priv->pll_id,
-					  codec_priv->mclk_id,
-					  codec_priv->mclk_freq, pll_out);
-		if (ret) {
-			dev_err(dev, "failed to start FLL: %d\n", ret);
-			goto fail;
-		}
+		if (codec_priv->pll_id >=3D 0 && codec_priv->fll_id >=3D 0) {
+			if (priv->sample_format =3D=3D SNDRV_PCM_FORMAT_S24_LE)
+				pll_out =3D priv->sample_rate * 384;
+			else
+				pll_out =3D priv->sample_rate * 256;
=20
-		ret =3D snd_soc_dai_set_sysclk(snd_soc_rtd_to_codec(rtd, 0),
-					     codec_priv->fll_id,
-					     pll_out, SND_SOC_CLOCK_IN);
+			ret =3D snd_soc_dai_set_pll(codec_dai,
+						codec_priv->pll_id,
+						codec_priv->mclk_id,
+						codec_priv->mclk_freq, pll_out);
+			if (ret) {
+				dev_err(dev, "failed to start FLL: %d\n", ret);
+				goto fail;
+			}
=20
-		if (ret && ret !=3D -ENOTSUPP) {
-			dev_err(dev, "failed to set SYSCLK: %d\n", ret);
-			goto fail;
+			ret =3D snd_soc_dai_set_sysclk(codec_dai,
+						codec_priv->fll_id,
+						pll_out, SND_SOC_CLOCK_IN);
+
+			if (ret && ret !=3D -ENOTSUPP) {
+				dev_err(dev, "failed to set SYSCLK: %d\n", ret);
+				goto fail;
+			}
 		}
 	}
=20
@@ -244,28 +250,34 @@ static int fsl_asoc_card_hw_free(struct snd_pcm_subst=
ream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(substream);
 	struct fsl_asoc_card_priv *priv =3D snd_soc_card_get_drvdata(rtd->card);
-	struct codec_priv *codec_priv =3D &priv->codec_priv;
+	struct codec_priv *codec_priv;
+	struct snd_soc_dai *codec_dai;
 	struct device *dev =3D rtd->card->dev;
+	int codec_idx;
 	int ret;
=20
 	priv->streams &=3D ~BIT(substream->stream);
=20
-	if (!priv->streams && codec_priv->pll_id >=3D 0 && codec_priv->fll_id >=
=3D 0) {
-		/* Force freq to be free_freq to avoid error message in codec */
-		ret =3D snd_soc_dai_set_sysclk(snd_soc_rtd_to_codec(rtd, 0),
-					     codec_priv->mclk_id,
-					     codec_priv->free_freq,
-					     SND_SOC_CLOCK_IN);
-		if (ret) {
-			dev_err(dev, "failed to switch away from FLL: %d\n", ret);
-			return ret;
-		}
+	for_each_rtd_codec_dais(rtd, codec_idx, codec_dai) {
+		codec_priv =3D &priv->codec_priv[codec_idx];
=20
-		ret =3D snd_soc_dai_set_pll(snd_soc_rtd_to_codec(rtd, 0),
-					  codec_priv->pll_id, 0, 0, 0);
-		if (ret && ret !=3D -ENOTSUPP) {
-			dev_err(dev, "failed to stop FLL: %d\n", ret);
-			return ret;
+		if (!priv->streams && codec_priv->pll_id >=3D 0 && codec_priv->fll_id >=
=3D 0) {
+			/* Force freq to be free_freq to avoid error message in codec */
+			ret =3D snd_soc_dai_set_sysclk(codec_dai,
+						codec_priv->mclk_id,
+						codec_priv->free_freq,
+						SND_SOC_CLOCK_IN);
+			if (ret) {
+				dev_err(dev, "failed to switch away from FLL: %d\n", ret);
+				return ret;
+			}
+
+			ret =3D snd_soc_dai_set_pll(codec_dai,
+						codec_priv->pll_id, 0, 0, 0);
+			if (ret && ret !=3D -ENOTSUPP) {
+				dev_err(dev, "failed to stop FLL: %d\n", ret);
+				return ret;
+			}
 		}
 	}
=20
@@ -504,9 +516,10 @@ static int fsl_asoc_card_late_probe(struct snd_soc_car=
d *card)
 	struct fsl_asoc_card_priv *priv =3D snd_soc_card_get_drvdata(card);
 	struct snd_soc_pcm_runtime *rtd =3D list_first_entry(
 			&card->rtd_list, struct snd_soc_pcm_runtime, list);
-	struct snd_soc_dai *codec_dai =3D snd_soc_rtd_to_codec(rtd, 0);
-	struct codec_priv *codec_priv =3D &priv->codec_priv;
+	struct snd_soc_dai *codec_dai;
+	struct codec_priv *codec_priv;
 	struct device *dev =3D card->dev;
+	int codec_idx;
 	int ret;
=20
 	if (fsl_asoc_card_is_ac97(priv)) {
@@ -526,32 +539,37 @@ static int fsl_asoc_card_late_probe(struct snd_soc_ca=
rd *card)
 		return 0;
 	}
=20
-	ret =3D snd_soc_dai_set_sysclk(codec_dai, codec_priv->mclk_id,
-				     codec_priv->mclk_freq, SND_SOC_CLOCK_IN);
-	if (ret && ret !=3D -ENOTSUPP) {
-		dev_err(dev, "failed to set sysclk in %s\n", __func__);
-		return ret;
-	}
+	for_each_rtd_codec_dais(rtd, codec_idx, codec_dai) {
+		codec_priv =3D &priv->codec_priv[codec_idx];
=20
-	if (!IS_ERR_OR_NULL(codec_priv->mclk))
-		clk_prepare_enable(codec_priv->mclk);
+		ret =3D snd_soc_dai_set_sysclk(codec_dai, codec_priv->mclk_id,
+					codec_priv->mclk_freq, SND_SOC_CLOCK_IN);
+		if (ret && ret !=3D -ENOTSUPP) {
+			dev_err(dev, "failed to set sysclk in %s\n", __func__);
+			return ret;
+		}
+
+		if (!IS_ERR_OR_NULL(codec_priv->mclk))
+			clk_prepare_enable(codec_priv->mclk);
+	}
=20
 	return 0;
 }
=20
 static int fsl_asoc_card_probe(struct platform_device *pdev)
 {
-	struct device_node *cpu_np, *codec_np, *asrc_np;
+	struct device_node *cpu_np, *asrc_np;
 	struct snd_soc_dai_link_component *codec_comp;
+	struct device_node *codec_np[2];
 	struct device_node *np =3D pdev->dev.of_node;
 	struct platform_device *asrc_pdev =3D NULL;
 	struct device_node *bitclkprovider =3D NULL;
 	struct device_node *frameprovider =3D NULL;
 	struct platform_device *cpu_pdev;
 	struct fsl_asoc_card_priv *priv;
-	struct device *codec_dev =3D NULL;
-	const char *codec_dai_name;
-	const char *codec_dev_name;
+	struct device *codec_dev[2] =3D { NULL, NULL };
+	const char *codec_dai_name[2];
+	const char *codec_dev_name[2];
 	u32 asrc_fmt =3D 0;
 	int codec_idx;
 	u32 width;
@@ -580,21 +598,25 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
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
+	for (codec_idx =3D 0; codec_idx < 2; codec_idx++) {
+		if (codec_np[codec_idx]) {
+			struct platform_device *codec_pdev;
+			struct i2c_client *codec_i2c;
+
+			codec_i2c =3D of_find_i2c_device_by_node(codec_np[codec_idx]);
+			if (codec_i2c) {
+				codec_dev[codec_idx] =3D &codec_i2c->dev;
+				codec_dev_name[codec_idx] =3D codec_i2c->name;
+			}
+			if (!codec_dev[codec_idx]) {
+				codec_pdev =3D of_find_device_by_node(codec_np[codec_idx]);
+				if (codec_pdev) {
+					codec_dev[codec_idx] =3D &codec_pdev->dev;
+					codec_dev_name[codec_idx] =3D codec_pdev->name;
+				}
 			}
 		}
 	}
@@ -604,12 +626,14 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 		asrc_pdev =3D of_find_device_by_node(asrc_np);
=20
 	/* Get the MCLK rate only, and leave it controlled by CODEC drivers */
-	if (codec_dev) {
-		struct clk *codec_clk =3D clk_get(codec_dev, NULL);
+	for (codec_idx =3D 0; codec_idx < 2; codec_idx++) {
+		if (codec_dev[codec_idx]) {
+			struct clk *codec_clk =3D clk_get(codec_dev[codec_idx], NULL);
=20
-		if (!IS_ERR(codec_clk)) {
-			priv->codec_priv.mclk_freq =3D clk_get_rate(codec_clk);
-			clk_put(codec_clk);
+			if (!IS_ERR(codec_clk)) {
+				priv->codec_priv[codec_idx].mclk_freq =3D clk_get_rate(codec_clk);
+				clk_put(codec_clk);
+			}
 		}
 	}
=20
@@ -629,31 +653,33 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 	priv->card.num_dapm_routes =3D ARRAY_SIZE(audio_map);
 	priv->card.driver_name =3D DRIVER_NAME;
=20
-	priv->codec_priv.fll_id =3D -1;
-	priv->codec_priv.pll_id =3D -1;
+	for (codec_idx =3D 0; codec_idx < 2; codec_idx++) {
+		priv->codec_priv[codec_idx].fll_id =3D -1;
+		priv->codec_priv[codec_idx].pll_id =3D -1;
+	}
=20
 	/* Diversify the card configurations */
 	if (of_device_is_compatible(np, "fsl,imx-audio-cs42888")) {
-		codec_dai_name =3D "cs42888";
-		priv->cpu_priv.sysclk_freq[TX] =3D priv->codec_priv.mclk_freq;
-		priv->cpu_priv.sysclk_freq[RX] =3D priv->codec_priv.mclk_freq;
+		codec_dai_name[0] =3D "cs42888";
+		priv->cpu_priv.sysclk_freq[TX] =3D priv->codec_priv[0].mclk_freq;
+		priv->cpu_priv.sysclk_freq[RX] =3D priv->codec_priv[0].mclk_freq;
 		priv->cpu_priv.sysclk_dir[TX] =3D SND_SOC_CLOCK_OUT;
 		priv->cpu_priv.sysclk_dir[RX] =3D SND_SOC_CLOCK_OUT;
 		priv->cpu_priv.slot_width =3D 32;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBC_CFC;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-cs427x")) {
-		codec_dai_name =3D "cs4271-hifi";
-		priv->codec_priv.mclk_id =3D CS427x_SYSCLK_MCLK;
+		codec_dai_name[0] =3D "cs4271-hifi";
+		priv->codec_priv[0].mclk_id =3D CS427x_SYSCLK_MCLK;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-sgtl5000")) {
-		codec_dai_name =3D "sgtl5000";
-		priv->codec_priv.mclk_id =3D SGTL5000_SYSCLK;
+		codec_dai_name[0] =3D "sgtl5000";
+		priv->codec_priv[0].mclk_id =3D SGTL5000_SYSCLK;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic32x4")) {
-		codec_dai_name =3D "tlv320aic32x4-hifi";
+		codec_dai_name[0] =3D "tlv320aic32x4-hifi";
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic31xx")) {
-		codec_dai_name =3D "tlv320dac31xx-hifi";
+		codec_dai_name[0] =3D "tlv320dac31xx-hifi";
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBS_CFS;
 		priv->dai_link[1].dpcm_capture =3D 0;
 		priv->dai_link[2].dpcm_capture =3D 0;
@@ -662,23 +688,23 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 		priv->card.dapm_routes =3D audio_map_tx;
 		priv->card.num_dapm_routes =3D ARRAY_SIZE(audio_map_tx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8962")) {
-		codec_dai_name =3D "wm8962";
-		priv->codec_priv.mclk_id =3D WM8962_SYSCLK_MCLK;
-		priv->codec_priv.fll_id =3D WM8962_SYSCLK_FLL;
-		priv->codec_priv.pll_id =3D WM8962_FLL;
+		codec_dai_name[0] =3D "wm8962";
+		priv->codec_priv[0].mclk_id =3D WM8962_SYSCLK_MCLK;
+		priv->codec_priv[0].fll_id =3D WM8962_SYSCLK_FLL;
+		priv->codec_priv[0].pll_id =3D WM8962_FLL;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8960")) {
-		codec_dai_name =3D "wm8960-hifi";
-		priv->codec_priv.fll_id =3D WM8960_SYSCLK_AUTO;
-		priv->codec_priv.pll_id =3D WM8960_SYSCLK_AUTO;
+		codec_dai_name[0] =3D "wm8960-hifi";
+		priv->codec_priv[0].fll_id =3D WM8960_SYSCLK_AUTO;
+		priv->codec_priv[0].pll_id =3D WM8960_SYSCLK_AUTO;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-ac97")) {
-		codec_dai_name =3D "ac97-hifi";
+		codec_dai_name[0] =3D "ac97-hifi";
 		priv->dai_fmt =3D SND_SOC_DAIFMT_AC97;
 		priv->card.dapm_routes =3D audio_map_ac97;
 		priv->card.num_dapm_routes =3D ARRAY_SIZE(audio_map_ac97);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-mqs")) {
-		codec_dai_name =3D "fsl-mqs-dai";
+		codec_dai_name[0] =3D "fsl-mqs-dai";
 		priv->dai_fmt =3D SND_SOC_DAIFMT_LEFT_J |
 				SND_SOC_DAIFMT_CBC_CFC |
 				SND_SOC_DAIFMT_NB_NF;
@@ -687,7 +713,7 @@ static int fsl_asoc_card_probe(struct platform_device *=
pdev)
 		priv->card.dapm_routes =3D audio_map_tx;
 		priv->card.num_dapm_routes =3D ARRAY_SIZE(audio_map_tx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8524")) {
-		codec_dai_name =3D "wm8524-hifi";
+		codec_dai_name[0] =3D "wm8524-hifi";
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBC_CFC;
 		priv->dai_link[1].dpcm_capture =3D 0;
 		priv->dai_link[2].dpcm_capture =3D 0;
@@ -695,32 +721,32 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 		priv->card.dapm_routes =3D audio_map_tx;
 		priv->card.num_dapm_routes =3D ARRAY_SIZE(audio_map_tx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-si476x")) {
-		codec_dai_name =3D "si476x-codec";
+		codec_dai_name[0] =3D "si476x-codec";
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBC_CFC;
 		priv->card.dapm_routes =3D audio_map_rx;
 		priv->card.num_dapm_routes =3D ARRAY_SIZE(audio_map_rx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8958")) {
-		codec_dai_name =3D "wm8994-aif1";
+		codec_dai_name[0] =3D "wm8994-aif1";
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
-		priv->codec_priv.mclk_id =3D WM8994_FLL_SRC_MCLK1;
-		priv->codec_priv.fll_id =3D WM8994_SYSCLK_FLL1;
-		priv->codec_priv.pll_id =3D WM8994_FLL1;
-		priv->codec_priv.free_freq =3D priv->codec_priv.mclk_freq;
+		priv->codec_priv[0].mclk_id =3D WM8994_FLL_SRC_MCLK1;
+		priv->codec_priv[0].fll_id =3D WM8994_SYSCLK_FLL1;
+		priv->codec_priv[0].pll_id =3D WM8994_FLL1;
+		priv->codec_priv[0].free_freq =3D priv->codec_priv[0].mclk_freq;
 		priv->card.dapm_routes =3D NULL;
 		priv->card.num_dapm_routes =3D 0;
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-nau8822")) {
-		codec_dai_name =3D "nau8822-hifi";
-		priv->codec_priv.mclk_id =3D NAU8822_CLK_MCLK;
-		priv->codec_priv.fll_id =3D NAU8822_CLK_PLL;
-		priv->codec_priv.pll_id =3D NAU8822_CLK_PLL;
+		codec_dai_name[0] =3D "nau8822-hifi";
+		priv->codec_priv[0].mclk_id =3D NAU8822_CLK_MCLK;
+		priv->codec_priv[0].fll_id =3D NAU8822_CLK_PLL;
+		priv->codec_priv[0].pll_id =3D NAU8822_CLK_PLL;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBM_CFM;
-		if (codec_dev)
-			priv->codec_priv.mclk =3D devm_clk_get(codec_dev, NULL);
+		if (codec_dev[0])
+			priv->codec_priv[0].mclk =3D devm_clk_get(codec_dev[0], NULL);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8904")) {
-		codec_dai_name =3D "wm8904-hifi";
-		priv->codec_priv.mclk_id =3D WM8904_FLL_MCLK;
-		priv->codec_priv.fll_id =3D WM8904_CLK_FLL;
-		priv->codec_priv.pll_id =3D WM8904_FLL_MCLK;
+		codec_dai_name[0] =3D "wm8904-hifi";
+		priv->codec_priv[0].mclk_id =3D WM8904_FLL_MCLK;
+		priv->codec_priv[0].fll_id =3D WM8904_CLK_FLL;
+		priv->codec_priv[0].pll_id =3D WM8904_FLL_MCLK;
 		priv->dai_fmt |=3D SND_SOC_DAIFMT_CBP_CFP;
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
@@ -732,18 +758,30 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
 	 * Allow setting mclk-id from the device-tree node. Otherwise, the
 	 * default value for each card configuration is used.
 	 */
-	of_property_read_u32(np, "mclk-id", &priv->codec_priv.mclk_id);
+	for_each_link_codecs((&(priv->dai_link[0])), codec_idx, codec_comp) {
+		of_property_read_u32_index(np, "mclk-id", codec_idx,
+					&priv->codec_priv[codec_idx].mclk_id);
+	}
=20
 	/* Format info from DT is optional. */
 	snd_soc_daifmt_parse_clock_provider_as_phandle(np, NULL, &bitclkprovider,=
 &frameprovider);
 	if (bitclkprovider || frameprovider) {
 		unsigned int daifmt =3D snd_soc_daifmt_parse_format(np, NULL);
+		bool codec_bitclkprovider =3D false;
+		bool codec_frameprovider =3D false;
+
+		for_each_link_codecs((&(priv->dai_link[0])), codec_idx, codec_comp) {
+			if (bitclkprovider && codec_np[codec_idx] =3D=3D bitclkprovider)
+				codec_bitclkprovider =3D true;
+			if (frameprovider && codec_np[codec_idx] =3D=3D frameprovider)
+				codec_frameprovider =3D true;
+		}
=20
-		if (codec_np =3D=3D bitclkprovider)
-			daifmt |=3D (codec_np =3D=3D frameprovider) ?
+		if (codec_bitclkprovider)
+			daifmt |=3D (codec_frameprovider) ?
 				SND_SOC_DAIFMT_CBP_CFP : SND_SOC_DAIFMT_CBP_CFC;
 		else
-			daifmt |=3D (codec_np =3D=3D frameprovider) ?
+			daifmt |=3D (codec_frameprovider) ?
 				SND_SOC_DAIFMT_CBC_CFP : SND_SOC_DAIFMT_CBC_CFC;
=20
 		/* Override dai_fmt with value from DT */
@@ -759,7 +797,7 @@ static int fsl_asoc_card_probe(struct platform_device *=
pdev)
 	of_node_put(bitclkprovider);
 	of_node_put(frameprovider);
=20
-	if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
+	if (!fsl_asoc_card_is_ac97(priv) && !codec_dev[0]) {
 		dev_dbg(&pdev->dev, "failed to find codec device\n");
 		ret =3D -EPROBE_DEFER;
 		goto asrc_fail;
@@ -798,7 +836,7 @@ static int fsl_asoc_card_probe(struct platform_device *=
pdev)
 	ret =3D snd_soc_of_parse_card_name(&priv->card, "model");
 	if (ret) {
 		snprintf(priv->name, sizeof(priv->name), "%s-audio",
-			 fsl_asoc_card_is_ac97(priv) ? "ac97" : codec_dev_name);
+			 fsl_asoc_card_is_ac97(priv) ? "ac97" : codec_dev_name[0]);
 		priv->card.name =3D priv->name;
 	}
 	priv->card.dai_link =3D priv->dai_link;
@@ -820,11 +858,15 @@ static int fsl_asoc_card_probe(struct platform_device=
 *pdev)
=20
 	/* Normal DAI Link */
 	priv->dai_link[0].cpus->of_node =3D cpu_np;
-	priv->dai_link[0].codecs[0].dai_name =3D codec_dai_name;
+	for_each_link_codecs((&(priv->dai_link[0])), codec_idx, codec_comp) {
+		codec_comp->dai_name =3D codec_dai_name[codec_idx];
+	}
=20
-	if (!fsl_asoc_card_is_ac97(priv))
-		priv->dai_link[0].codecs[0].of_node =3D codec_np;
-	else {
+	if (!fsl_asoc_card_is_ac97(priv)) {
+		for_each_link_codecs((&(priv->dai_link[0])), codec_idx, codec_comp) {
+			codec_comp->of_node =3D codec_np[codec_idx];
+		}
+	} else {
 		u32 idx;
=20
 		ret =3D of_property_read_u32(cpu_np, "cell-index", &idx);
@@ -926,7 +968,8 @@ static int fsl_asoc_card_probe(struct platform_device *=
pdev)
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
2.34.1

