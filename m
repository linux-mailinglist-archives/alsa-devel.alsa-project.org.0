Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2BE868FEA
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Feb 2024 13:13:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D92BE0F;
	Tue, 27 Feb 2024 13:13:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D92BE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709036035;
	bh=bN6L38ZdV4Cry6UWtn4L+ZSKaNSwvVl8TeIvJNWAOFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gefr3ifRnbhQSjSl+qe8jPthH+pCCzuKea7elk1oGZGUNqQ5X+3Sl8c5xaMrul7e+
	 3kXvU05yPzkYXh6LfBwgODj+OYOB3VdXxGPx002GmV3zvKLvMQSlQvTfK1sqnUCihf
	 xeEyHoGhHtlrbmVQ5nyEEGscR6AJ9YS88QwxOQIU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B92D3F80768; Tue, 27 Feb 2024 13:10:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F46CF805AD;
	Tue, 27 Feb 2024 13:10:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 667F2F806AA; Tue, 27 Feb 2024 13:10:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CDF80F80614
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 13:10:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDF80F80614
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=XTVx8OgZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709035834;
	bh=bN6L38ZdV4Cry6UWtn4L+ZSKaNSwvVl8TeIvJNWAOFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XTVx8OgZtl4rupN4FGOVbch2j6xS/pMf6CseCj9K7T0BQqGYQhfeUv+6FN1dPv0j0
	 prYSTjIQ1maMN1UF+vMQ6ecyBkYsiKmTD6HypH6E0K6/Qi/v5xX0nlEqaSsgJ+YA5P
	 YYdaGxVOOEJI0KEzN74B6mSZg1uJyreVhYwPNy9iW+8j+Vcx1lE01jO1mZ7tb4OQ0y
	 yfIEZMoB8omLRLYCuDMBX2BwISXyCSR3Fmf20/ZQ2dD9oT7esKF9u+id2Qv+YIEDfl
	 xLDHM8NusznN9soQ/Sv84MLnebbSR5HvRbKlma8a7BOIa5dvKfSy+/WU4Df8RyQDpZ
	 t6m2QbdbbfetA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1BB2437820E6;
	Tue, 27 Feb 2024 12:10:32 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: wenst@chromium.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com,
	arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com,
	shraash@google.com,
	amergnat@baylibre.com,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	dianders@chromium.org,
	frank.li@vivo.com,
	allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com,
	claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com,
	jiaxin.yu@mediatek.com,
	alpernebiyasak@gmail.com,
	ckeepax@opensource.cirrus.com,
	zhourui@huaqin.corp-partner.google.com,
	nfraprado@collabora.com,
	alsa-devel@alsa-project.org,
	shane.chien@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 10/22] ASoC: mediatek: mt8186: Migrate to
 mtk_soundcard_common_probe
Date: Tue, 27 Feb 2024 13:09:27 +0100
Message-ID: <20240227120939.290143-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PDABDJ22WPYCIJF2IMHAQHHAD2NFRU6P
X-Message-ID-Hash: PDABDJ22WPYCIJF2IMHAQHHAD2NFRU6P
X-MailFrom: angelogioacchino.delregno@collabora.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PDABDJ22WPYCIJF2IMHAQHHAD2NFRU6P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add mtk_soundcard_pdata platform data for the MediaTek common sound card
probe mechanism, including a driver/soc-specific probe extension (used
for bits that cannot be commonized  hence specific to this driver), and
change the probe function to mtk_soundcard_common_probe.

This is also adding the possibility of specifying the links and routing
with the audio-routing property and (x)-dai-link nodes in device trees
to stop hardcoding machine specific links in the card driver assupported
by the common probe function, but support for legacy device trees is
retained with a legacy_probe function, which is used only in case the
new properties are not found.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 220 ++++++++----------
 1 file changed, 96 insertions(+), 124 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index f78197c8e582..f8856a100b27 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -21,6 +21,7 @@
 #include "../common/mtk-afe-platform-driver.h"
 #include "../common/mtk-dsp-sof-common.h"
 #include "../common/mtk-soc-card.h"
+#include "../common/mtk-soundcard-driver.h"
 #include "mt8186-afe-common.h"
 #include "mt8186-afe-clk.h"
 #include "mt8186-afe-gpio.h"
@@ -38,11 +39,16 @@
 #define SOF_DMA_UL2 "SOF_DMA_UL2"
 
 struct mt8186_mt6366_rt1019_rt5682s_priv {
-	struct snd_soc_jack headset_jack, hdmi_jack;
 	struct gpio_desc *dmic_sel;
 	int dmic_switch;
 };
 
+enum mt8186_jacks {
+	MT8186_JACK_HEADSET,
+	MT8186_JACK_HDMI,
+	MT8186_JACK_MAX,
+};
+
 /* Headset jack detection DAPM pins */
 static struct snd_soc_jack_pin mt8186_jack_pins[] = {
 	{
@@ -165,8 +171,7 @@ static int mt8186_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct mtk_soc_card_data *soc_card_data =
 		snd_soc_card_get_drvdata(rtd->card);
-	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
-	struct snd_soc_jack *jack = &priv->headset_jack;
+	struct snd_soc_jack *jack = &soc_card_data->card_data->jacks[MT8186_JACK_HEADSET];
 	struct snd_soc_component *cmpnt_codec =
 		snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
@@ -257,7 +262,7 @@ static int mt8186_mt6366_rt1019_rt5682s_hdmi_init(struct snd_soc_pcm_runtime *rt
 		snd_soc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_soc_card_data *soc_card_data =
 		snd_soc_card_get_drvdata(rtd->card);
-	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
+	struct snd_soc_jack *jack = &soc_card_data->card_data->jacks[MT8186_JACK_HDMI];
 	int ret;
 
 	ret = mt8186_dai_i2s_set_share(afe, "I2S2", "I2S3");
@@ -266,13 +271,13 @@ static int mt8186_mt6366_rt1019_rt5682s_hdmi_init(struct snd_soc_pcm_runtime *rt
 		return ret;
 	}
 
-	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT, &priv->hdmi_jack);
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT, jack);
 	if (ret) {
 		dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
 		return ret;
 	}
 
-	return snd_soc_component_set_jack(cmpnt_codec, &priv->hdmi_jack, NULL);
+	return snd_soc_component_set_jack(cmpnt_codec, jack, NULL);
 }
 
 static int mt8186_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
@@ -1134,166 +1139,133 @@ static struct snd_soc_card mt8186_mt6366_rt5650_soc_card = {
 	.num_configs = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_codec_conf),
 };
 
-static int mt8186_mt6366_rt1019_rt5682s_dev_probe(struct platform_device *pdev)
+static int mt8186_mt6366_legacy_probe(struct mtk_soc_card_data *soc_card_data)
 {
-	struct snd_soc_card *card;
+	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
+	struct snd_soc_card *card = card_data->card;
+	struct device *dev = card->dev;
 	struct snd_soc_dai_link *dai_link;
-	struct mtk_soc_card_data *soc_card_data;
-	struct mt8186_mt6366_rt1019_rt5682s_priv *mach_priv;
-	struct device_node *platform_node, *headset_codec, *playback_codec, *adsp_node;
-	int sof_on = 0;
+	struct device_node *headset_codec, *playback_codec;
 	int ret, i;
 
-	card = (struct snd_soc_card *)device_get_match_data(&pdev->dev);
-	if (!card)
-		return -EINVAL;
-	card->dev = &pdev->dev;
-
-	soc_card_data = devm_kzalloc(&pdev->dev, sizeof(*soc_card_data), GFP_KERNEL);
-	if (!soc_card_data)
-		return -ENOMEM;
-	mach_priv = devm_kzalloc(&pdev->dev, sizeof(*mach_priv), GFP_KERNEL);
-	if (!mach_priv)
-		return -ENOMEM;
-
-	soc_card_data->mach_priv = mach_priv;
-
-	mach_priv->dmic_sel = devm_gpiod_get_optional(&pdev->dev,
-						      "dmic", GPIOD_OUT_LOW);
-	if (IS_ERR(mach_priv->dmic_sel)) {
-		dev_err(&pdev->dev, "DMIC gpio failed err=%ld\n",
-			PTR_ERR(mach_priv->dmic_sel));
-		return PTR_ERR(mach_priv->dmic_sel);
-	}
-
-	adsp_node = of_parse_phandle(pdev->dev.of_node, "mediatek,adsp", 0);
-	if (adsp_node) {
-		struct mtk_sof_priv *sof_priv;
+	playback_codec = of_get_child_by_name(dev->of_node, "playback-codecs");
+	if (!playback_codec)
+		return dev_err_probe(dev, -EINVAL,
+				     "Property 'playback-codecs' missing or invalid\n");
 
-		sof_priv = devm_kzalloc(&pdev->dev, sizeof(*sof_priv), GFP_KERNEL);
-		if (!sof_priv) {
-			ret = -ENOMEM;
-			goto err_adsp_node;
-		}
-		sof_priv->conn_streams = g_sof_conn_streams;
-		sof_priv->num_streams = ARRAY_SIZE(g_sof_conn_streams);
-		sof_priv->sof_dai_link_fixup = mt8186_sof_dai_link_fixup;
-		soc_card_data->sof_priv = sof_priv;
-		card->probe = mtk_sof_card_probe;
-		card->late_probe = mtk_sof_card_late_probe;
-		if (!card->topology_shortname_created) {
-			snprintf(card->topology_shortname, 32, "sof-%s", card->name);
-			card->topology_shortname_created = true;
-		}
-		card->name = card->topology_shortname;
-		sof_on = 1;
-	} else {
-		dev_dbg(&pdev->dev, "Probe without adsp\n");
-	}
-
-	if (of_property_read_bool(pdev->dev.of_node, "mediatek,dai-link")) {
-		ret = mtk_sof_dailink_parse_of(card, pdev->dev.of_node,
-					       "mediatek,dai-link",
-					       mt8186_mt6366_rt1019_rt5682s_dai_links,
-					       ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_dai_links));
-		if (ret) {
-			dev_dbg(&pdev->dev, "Parse dai-link fail\n");
-			goto err_adsp_node;
-		}
-	} else {
-		if (!sof_on)
-			card->num_links = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_dai_links)
-					- ARRAY_SIZE(g_sof_conn_streams);
-	}
-
-	platform_node = of_parse_phandle(pdev->dev.of_node, "mediatek,platform", 0);
-	if (!platform_node) {
-		ret = -EINVAL;
-		dev_err_probe(&pdev->dev, ret, "Property 'platform' missing or invalid\n");
-		goto err_platform_node;
-	}
-
-	playback_codec = of_get_child_by_name(pdev->dev.of_node, "playback-codecs");
-	if (!playback_codec) {
-		ret = -EINVAL;
-		dev_err_probe(&pdev->dev, ret, "Property 'playback-codecs' missing or invalid\n");
-		goto err_playback_codec;
-	}
-
-	headset_codec = of_get_child_by_name(pdev->dev.of_node, "headset-codec");
+	headset_codec = of_get_child_by_name(dev->of_node, "headset-codec");
 	if (!headset_codec) {
-		ret = -EINVAL;
-		dev_err_probe(&pdev->dev, ret, "Property 'headset-codec' missing or invalid\n");
-		goto err_headset_codec;
+		of_node_put(playback_codec);
+		return dev_err_probe(dev, -EINVAL,
+				     "Property 'headset-codec' missing or invalid\n");
 	}
 
 	for_each_card_prelinks(card, i, dai_link) {
 		ret = mt8186_mt6366_card_set_be_link(card, dai_link, playback_codec, "I2S3");
 		if (ret) {
-			dev_err_probe(&pdev->dev, ret, "%s set playback_codec fail\n",
+			dev_err_probe(dev, ret, "%s set playback_codec fail\n",
 				      dai_link->name);
-			goto err_probe;
+			break;
 		}
 
 		ret = mt8186_mt6366_card_set_be_link(card, dai_link, headset_codec, "I2S0");
 		if (ret) {
-			dev_err_probe(&pdev->dev, ret, "%s set headset_codec fail\n",
+			dev_err_probe(dev, ret, "%s set headset_codec fail\n",
 				      dai_link->name);
-			goto err_probe;
+			break;
 		}
 
 		ret = mt8186_mt6366_card_set_be_link(card, dai_link, headset_codec, "I2S1");
 		if (ret) {
-			dev_err_probe(&pdev->dev, ret, "%s set headset_codec fail\n",
+			dev_err_probe(dev, ret, "%s set headset_codec fail\n",
 				      dai_link->name);
-			goto err_probe;
+			break;
 		}
+	}
+	of_node_put(headset_codec);
+	of_node_put(playback_codec);
 
-		if (!strncmp(dai_link->name, "AFE_SOF", strlen("AFE_SOF")) && sof_on)
-			dai_link->platforms->of_node = adsp_node;
+	return ret;
+}
 
-		if (!dai_link->platforms->name && !dai_link->platforms->of_node)
-			dai_link->platforms->of_node = platform_node;
-	}
+static int mt8186_mt6366_soc_card_probe(struct mtk_soc_card_data *soc_card_data, bool legacy)
+{
+	struct mtk_platform_card_data *card_data = soc_card_data->card_data;
+	struct snd_soc_card *card = card_data->card;
+	struct mt8186_mt6366_rt1019_rt5682s_priv *mach_priv;
+	int ret;
 
-	snd_soc_card_set_drvdata(card, soc_card_data);
+	mach_priv = devm_kzalloc(card->dev, sizeof(*mach_priv), GFP_KERNEL);
+	if (!mach_priv)
+		return -ENOMEM;
 
-	ret = mt8186_afe_gpio_init(&pdev->dev);
-	if (ret) {
-		dev_err_probe(&pdev->dev, ret, "%s init gpio error\n", __func__);
-		goto err_probe;
+	soc_card_data->mach_priv = mach_priv;
+
+	mach_priv->dmic_sel = devm_gpiod_get_optional(card->dev,
+						      "dmic", GPIOD_OUT_LOW);
+	if (IS_ERR(mach_priv->dmic_sel))
+		return dev_err_probe(card->dev, PTR_ERR(mach_priv->dmic_sel),
+				     "DMIC gpio failed\n");
+
+	if (legacy) {
+		ret = mt8186_mt6366_legacy_probe(soc_card_data);
+		if (ret)
+			return ret;
 	}
 
-	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	ret = mt8186_afe_gpio_init(card->dev);
 	if (ret)
-		dev_err_probe(&pdev->dev, ret, "%s snd_soc_register_card fail\n", __func__);
+		return dev_err_probe(card->dev, ret, "init AFE gpio error\n");
 
-err_probe:
-	of_node_put(headset_codec);
-err_headset_codec:
-	of_node_put(playback_codec);
-err_playback_codec:
-	of_node_put(platform_node);
-err_platform_node:
-err_adsp_node:
-	of_node_put(adsp_node);
-
-	return ret;
+	return 0;
 }
 
+static const struct mtk_sof_priv mt8186_sof_priv = {
+	.conn_streams = g_sof_conn_streams,
+	.num_streams = ARRAY_SIZE(g_sof_conn_streams),
+	.sof_dai_link_fixup = mt8186_sof_dai_link_fixup
+};
+
+static const struct mtk_soundcard_pdata mt8186_mt6366_rt1019_rt5682s_pdata = {
+	.card_data = &(struct mtk_platform_card_data) {
+		.card = &mt8186_mt6366_rt1019_rt5682s_soc_card,
+		.num_jacks = MT8186_JACK_MAX,
+	},
+	.sof_priv = &mt8186_sof_priv,
+	.soc_probe = mt8186_mt6366_soc_card_probe
+};
+
+static const struct mtk_soundcard_pdata mt8186_mt6366_rt5682s_max98360_pdata = {
+	.card_data = &(struct mtk_platform_card_data) {
+		.card = &mt8186_mt6366_rt5682s_max98360_soc_card,
+		.num_jacks = MT8186_JACK_MAX,
+	},
+	.sof_priv = &mt8186_sof_priv,
+	.soc_probe = mt8186_mt6366_soc_card_probe
+};
+
+static const struct mtk_soundcard_pdata mt8186_mt6366_rt5650_pdata = {
+	.card_data = &(struct mtk_platform_card_data) {
+		.card = &mt8186_mt6366_rt5650_soc_card,
+		.num_jacks = MT8186_JACK_MAX,
+	},
+	.sof_priv = &mt8186_sof_priv,
+	.soc_probe = mt8186_mt6366_soc_card_probe
+};
+
 #if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id mt8186_mt6366_rt1019_rt5682s_dt_match[] = {
 	{
 		.compatible = "mediatek,mt8186-mt6366-rt1019-rt5682s-sound",
-		.data = &mt8186_mt6366_rt1019_rt5682s_soc_card,
+		.data = &mt8186_mt6366_rt1019_rt5682s_pdata,
 	},
 	{
 		.compatible = "mediatek,mt8186-mt6366-rt5682s-max98360-sound",
-		.data = &mt8186_mt6366_rt5682s_max98360_soc_card,
+		.data = &mt8186_mt6366_rt5682s_max98360_pdata,
 	},
 	{
 		.compatible = "mediatek,mt8186-mt6366-rt5650-sound",
-		.data = &mt8186_mt6366_rt5650_soc_card,
+		.data = &mt8186_mt6366_rt5650_pdata,
 	},
 	{}
 };
@@ -1308,7 +1280,7 @@ static struct platform_driver mt8186_mt6366_rt1019_rt5682s_driver = {
 #endif
 		.pm = &snd_soc_pm_ops,
 	},
-	.probe = mt8186_mt6366_rt1019_rt5682s_dev_probe,
+	.probe = mtk_soundcard_common_probe,
 };
 
 module_platform_driver(mt8186_mt6366_rt1019_rt5682s_driver);
-- 
2.44.0

