Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABFF8A64CF
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Apr 2024 09:18:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13F501060;
	Tue, 16 Apr 2024 09:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13F501060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713251929;
	bh=9tLdQa1pwwBhUSykKr4mr5bn/tTz6nvsWgUVai9A2Co=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fM1buvdQRwPh0sRPN+8DvkL+a/It+BZikW4NSmmUrX5Gx8s3UbVaOeBqXFI9Ft7/a
	 d5vqFCwLY2X872vAJR3jFSIuwdrTKiCo1b1xs1atmuQ0Wb3WXFjR+bLhP14PV5NFpz
	 RXk0hbQeCw2TJ7vzuLChkA0pCNG/Os50h9umFJa4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25178F805B4; Tue, 16 Apr 2024 09:16:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC7AFF806FA;
	Tue, 16 Apr 2024 09:16:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D418DF80568; Tue, 16 Apr 2024 09:14:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED713F8025A
	for <alsa-devel@alsa-project.org>; Tue, 16 Apr 2024 09:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED713F8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=wpXxXTQ+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713251682;
	bh=9tLdQa1pwwBhUSykKr4mr5bn/tTz6nvsWgUVai9A2Co=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wpXxXTQ+G+n0AhJh5kvieSzhRYGVK8a/Tewx/AzVVlbmzqXPlUxEbW2NDqal2QyuZ
	 hjzBtfsnozHDbei22YEOMPMPx/eKO9+QGhNHdKEcYD8V4UDvIwLYN1QYcsc8BaT53q
	 AhcFuR4ZwFajMPt/i9W9/yLmRaqQ5UiXwXHLRnKIXKqt3ok5kpkL/c5tsvHvdI32fT
	 R0wG5i1CNlObhCVqY4kfkBm+2I8UILsYN/6TpDXR7fPG26eYfq+WY4bjBxeWrOdYE9
	 bre51Oic2KPLRHOW0VgAps/9ZQiRzzfek/Cayyst0Fz/9trnb8afho1j30CVi2RRu4
	 CFCDIywLX1uXA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 29FD137820F9;
	Tue, 16 Apr 2024 07:14:40 +0000 (UTC)
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
Subject: [PATCH v5 10/18] ASoC: mediatek: mt8186-rt1019: Migrate to the common
 mtk_soundcard_startup
Date: Tue, 16 Apr 2024 09:14:02 +0200
Message-ID: <20240416071410.75620-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416071410.75620-1-angelogioacchino.delregno@collabora.com>
References: <20240416071410.75620-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F4WVBYOEWNVHZTTR5HLYQ6XRAGYIFX6N
X-Message-ID-Hash: F4WVBYOEWNVHZTTR5HLYQ6XRAGYIFX6N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F4WVBYOEWNVHZTTR5HLYQ6XRAGYIFX6N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add a const mtk_pcm_constraints_data struct array with all of the
(again, constant) constraints for all of the supported usecases,
remove the duplicated functions and call mtk_soundcard_startup()
instead in all of the .startup() callbacks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 132 +++++-------------
 1 file changed, 36 insertions(+), 96 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index f8856a100b27..28140ca0ebff 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -332,98 +332,6 @@ static int mt8186_sof_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 	return ret;
 }
 
-static int mt8186_mt6366_rt1019_rt5682s_playback_startup(struct snd_pcm_substream *substream)
-{
-	static const unsigned int rates[] = {
-		48000
-	};
-	static const unsigned int channels[] = {
-		2
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_rates = {
-		.count = ARRAY_SIZE(rates),
-		.list  = rates,
-		.mask = 0,
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_channels = {
-		.count = ARRAY_SIZE(channels),
-		.list  = channels,
-		.mask = 0,
-	};
-
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	int ret;
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_RATE,
-					 &constraints_rates);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
-		return ret;
-	}
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_CHANNELS,
-					 &constraints_channels);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list channel failed\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops mt8186_mt6366_rt1019_rt5682s_playback_ops = {
-	.startup = mt8186_mt6366_rt1019_rt5682s_playback_startup,
-};
-
-static int mt8186_mt6366_rt1019_rt5682s_capture_startup(struct snd_pcm_substream *substream)
-{
-	static const unsigned int rates[] = {
-		48000
-	};
-	static const unsigned int channels[] = {
-		1, 2
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_rates = {
-		.count = ARRAY_SIZE(rates),
-		.list  = rates,
-		.mask = 0,
-	};
-	static const struct snd_pcm_hw_constraint_list constraints_channels = {
-		.count = ARRAY_SIZE(channels),
-		.list  = channels,
-		.mask = 0,
-	};
-
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	int ret;
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_RATE,
-					 &constraints_rates);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
-		return ret;
-	}
-
-	ret = snd_pcm_hw_constraint_list(runtime, 0,
-					 SNDRV_PCM_HW_PARAM_CHANNELS,
-					 &constraints_channels);
-	if (ret < 0) {
-		dev_err(rtd->dev, "hw_constraint_list channel failed\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static const struct snd_soc_ops mt8186_mt6366_rt1019_rt5682s_capture_ops = {
-	.startup = mt8186_mt6366_rt1019_rt5682s_capture_startup,
-};
-
 /* FE */
 SND_SOC_DAILINK_DEFS(playback1,
 		     DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
@@ -644,7 +552,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
-		.ops = &mt8186_mt6366_rt1019_rt5682s_playback_ops,
+		.ops = &mtk_soundcard_common_playback_ops,
 		SND_SOC_DAILINK_REG(playback1),
 	},
 	{
@@ -678,7 +586,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
-		.ops = &mt8186_mt6366_rt1019_rt5682s_playback_ops,
+		.ops = &mtk_soundcard_common_playback_ops,
 		SND_SOC_DAILINK_REG(playback3),
 	},
 	{
@@ -745,7 +653,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
-		.ops = &mt8186_mt6366_rt1019_rt5682s_capture_ops,
+		.ops = &mtk_soundcard_common_capture_ops,
 		SND_SOC_DAILINK_REG(capture2),
 	},
 	{
@@ -767,7 +675,7 @@ static struct snd_soc_dai_link mt8186_mt6366_rt1019_rt5682s_dai_links[] = {
 		.dpcm_merged_format = 1,
 		.dpcm_merged_chan = 1,
 		.dpcm_merged_rate = 1,
-		.ops = &mt8186_mt6366_rt1019_rt5682s_capture_ops,
+		.ops = &mtk_soundcard_common_capture_ops,
 		SND_SOC_DAILINK_REG(capture4),
 	},
 	{
@@ -1220,6 +1128,32 @@ static int mt8186_mt6366_soc_card_probe(struct mtk_soc_card_data *soc_card_data,
 	return 0;
 }
 
+static const unsigned int mt8186_pcm_playback_channels[] = { 2 };
+static const unsigned int mt8186_pcm_capture_channels[] = { 1, 2 };
+static const unsigned int mt8186_pcm_rates[] = { 48000 };
+
+static const struct snd_pcm_hw_constraint_list mt8186_rate_constraint = {
+	.list = mt8186_pcm_rates,
+	.count = ARRAY_SIZE(mt8186_pcm_rates)
+};
+
+static const struct mtk_pcm_constraints_data mt8186_pcm_constraints[MTK_CONSTRAINT_CAPTURE + 1] = {
+	[MTK_CONSTRAINT_PLAYBACK] = {
+		.channels = &(const struct snd_pcm_hw_constraint_list) {
+			.list = mt8186_pcm_playback_channels,
+			.count = ARRAY_SIZE(mt8186_pcm_playback_channels)
+		},
+		.rates = &mt8186_rate_constraint,
+	},
+	[MTK_CONSTRAINT_CAPTURE] = {
+		.channels = &(const struct snd_pcm_hw_constraint_list) {
+			.list = mt8186_pcm_capture_channels,
+			.count = ARRAY_SIZE(mt8186_pcm_capture_channels)
+		},
+		.rates = &mt8186_rate_constraint,
+	}
+};
+
 static const struct mtk_sof_priv mt8186_sof_priv = {
 	.conn_streams = g_sof_conn_streams,
 	.num_streams = ARRAY_SIZE(g_sof_conn_streams),
@@ -1230,6 +1164,8 @@ static const struct mtk_soundcard_pdata mt8186_mt6366_rt1019_rt5682s_pdata = {
 	.card_data = &(struct mtk_platform_card_data) {
 		.card = &mt8186_mt6366_rt1019_rt5682s_soc_card,
 		.num_jacks = MT8186_JACK_MAX,
+		.pcm_constraints = mt8186_pcm_constraints,
+		.num_pcm_constraints = ARRAY_SIZE(mt8186_pcm_constraints),
 	},
 	.sof_priv = &mt8186_sof_priv,
 	.soc_probe = mt8186_mt6366_soc_card_probe
@@ -1239,6 +1175,8 @@ static const struct mtk_soundcard_pdata mt8186_mt6366_rt5682s_max98360_pdata = {
 	.card_data = &(struct mtk_platform_card_data) {
 		.card = &mt8186_mt6366_rt5682s_max98360_soc_card,
 		.num_jacks = MT8186_JACK_MAX,
+		.pcm_constraints = mt8186_pcm_constraints,
+		.num_pcm_constraints = ARRAY_SIZE(mt8186_pcm_constraints),
 	},
 	.sof_priv = &mt8186_sof_priv,
 	.soc_probe = mt8186_mt6366_soc_card_probe
@@ -1248,6 +1186,8 @@ static const struct mtk_soundcard_pdata mt8186_mt6366_rt5650_pdata = {
 	.card_data = &(struct mtk_platform_card_data) {
 		.card = &mt8186_mt6366_rt5650_soc_card,
 		.num_jacks = MT8186_JACK_MAX,
+		.pcm_constraints = mt8186_pcm_constraints,
+		.num_pcm_constraints = ARRAY_SIZE(mt8186_pcm_constraints),
 	},
 	.sof_priv = &mt8186_sof_priv,
 	.soc_probe = mt8186_mt6366_soc_card_probe
-- 
2.44.0

