Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCA270D125
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 04:22:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA8211ED;
	Tue, 23 May 2023 04:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA8211ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684808573;
	bh=5Lr5Cz/2dlyzR/YeGbEi9b6qQ03vAQX3T35+JzZwrac=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LFqv6KOrf+YNOZBWs0rffSbGxIwTlCwUYUsO681qZPG9hGYFDczwe/M6W4HuDY4pE
	 okb34z2rTixfMUyc4uP/jkBTzycGJ45CHN8EaY4i4mvJfBX3HXyDjj+RwhNtDoahQ0
	 jT+IMmzlrcUHXaKZ+QbfkgoIco/wi4IeZsTvN15E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76255F805C7; Tue, 23 May 2023 04:20:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29D12F805BD;
	Tue, 23 May 2023 04:20:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CF59F80249; Tue, 23 May 2023 04:20:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBC59F80425
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 04:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBC59F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=U4f4Fo+O
X-UUID: 42dc9fe8f91011edb20a276fd37b9834-20230523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/7BZMeYF+RUQql73CaQvBZU2ZcGHaUCaCkaQVFj7CTo=;
	b=U4f4Fo+OeuxD0IktNLaEw0v+DAzE5E54nIy5dZTzwSXIsPV4yMe6XCtMWHKDoqA6pFi1GpQtpZe3oYcu0rlj81YrHyTfl27quuYeqgDkaud0taAfSxYcia8PA96QTHyUmisPvAL3eFqvREbP4xS4kx8In1U55hUyJJBWVBIi9PE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:4730c0f6-cf8a-46e7-81c7-2de1f8249e6d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.25,REQID:4730c0f6-cf8a-46e7-81c7-2de1f8249e6d,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:d5b0ae3,CLOUDID:82ceab6c-2f20-4998-991c-3b78627e4938,B
	ulkID:230523101937I4TB7XU9,BulkQuantity:0,Recheck:0,SF:17|19|48|38|29|28,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 42dc9fe8f91011edb20a276fd37b9834-20230523
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1323017259; Tue, 23 May 2023 10:19:35 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 23 May 2023 10:19:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 23 May 2023 10:19:35 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 6/7] ASoC: mediatek: mt8188-mt6359: support new board with
 nau88255
Date: Tue, 23 May 2023 10:19:31 +0800
Message-ID: <20230523021933.3422-7-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230523021933.3422-1-trevor.wu@mediatek.com>
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: BXO2U666ZOZY2Z67SRH4L55ZTGS7QRRE
X-Message-ID-Hash: BXO2U666ZOZY2Z67SRH4L55ZTGS7QRRE
X-MailFrom: trevor.wu@mediatek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BXO2U666ZOZY2Z67SRH4L55ZTGS7QRRE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds multiple i2s codecs support including NAU88L25,
MAX98390, and the dumb amp like NAU8318 usage. In addition, dmic-codec
is also added to skip the beginning pop noise.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/Kconfig                |   4 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 330 +++++++++++++++++++++-
 2 files changed, 333 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 4baac72677d9..4ea012342b52 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -225,6 +225,10 @@ config SND_SOC_MT8188_MT6359
 	depends on SND_SOC_MT8188 && MTK_PMIC_WRAP
 	select SND_SOC_MT6359
 	select SND_SOC_HDMI_CODEC
+	select SND_SOC_DMIC
+	select SND_SOC_MAX98390
+	select SND_SOC_NAU8315
+	select SND_SOC_NAU8825
 	help
 	  This adds support for ASoC machine driver for MediaTek MT8188
 	  boards with the MT6359 and other I2S audio codecs.
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 6c3f36e2fffd..1d3673873f05 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -6,6 +6,7 @@
  * Author: Trevor Wu <trevor.wu@mediatek.com>
  */
 
+#include <linux/input.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
@@ -13,10 +14,27 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include "mt8188-afe-common.h"
+#include "../../codecs/nau8825.h"
 #include "../../codecs/mt6359.h"
 #include "../common/mtk-afe-platform-driver.h"
 #include "../common/mtk-soundcard-driver.h"
 
+#define NAU8825_HS_PRESENT	BIT(0)
+
+/*
+ * Maxim MAX98390
+ */
+#define MAX98390_CODEC_DAI     "max98390-aif1"
+#define MAX98390_DEV0_NAME     "max98390.0-0038" /* rear right */
+#define MAX98390_DEV1_NAME     "max98390.0-0039" /* rear left */
+#define MAX98390_DEV2_NAME     "max98390.0-003a" /* front right */
+#define MAX98390_DEV3_NAME     "max98390.0-003b" /* front left */
+
+/*
+ * Nau88l25
+ */
+#define NAU8825_CODEC_DAI  "nau8825-hifi"
+
 /* FE */
 SND_SOC_DAILINK_DEFS(playback2,
 		     DAILINK_COMP_ARRAY(COMP_CPU("DL2")),
@@ -143,12 +161,16 @@ SND_SOC_DAILINK_DEFS(pcm1,
 SND_SOC_DAILINK_DEFS(ul_src,
 		     DAILINK_COMP_ARRAY(COMP_CPU("UL_SRC")),
 		     DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
-						   "mt6359-snd-codec-aif1")),
+						   "mt6359-snd-codec-aif1"),
+					COMP_CODEC("dmic-codec",
+						   "dmic-hifi")),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 struct mt8188_mt6359_priv {
 	struct snd_soc_jack dp_jack;
 	struct snd_soc_jack hdmi_jack;
+	struct snd_soc_jack headset_jack;
+	void *private_data;
 };
 
 static struct snd_soc_jack_pin mt8188_hdmi_jack_pins[] = {
@@ -165,11 +187,50 @@ static struct snd_soc_jack_pin mt8188_dp_jack_pins[] = {
 	},
 };
 
+static struct snd_soc_jack_pin nau8825_jack_pins[] = {
+	{
+		.pin    = "Headphone Jack",
+		.mask   = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin    = "Headset Mic",
+		.mask   = SND_JACK_MICROPHONE,
+	},
+};
+
 struct mt8188_card_data {
 	const char *name;
 	unsigned long quirk;
 };
 
+static const struct snd_kcontrol_new mt8188_dumb_spk_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Ext Spk"),
+};
+
+static const struct snd_soc_dapm_widget mt8188_dumb_spk_widgets[] = {
+	SND_SOC_DAPM_SPK("Ext Spk", NULL),
+};
+
+static const struct snd_kcontrol_new mt8188_dual_spk_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+};
+
+static const struct snd_soc_dapm_widget mt8188_dual_spk_widgets[] = {
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+};
+
+static const struct snd_kcontrol_new mt8188_rear_spk_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Rear Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Rear Right Spk"),
+};
+
+static const struct snd_soc_dapm_widget mt8188_rear_spk_widgets[] = {
+	SND_SOC_DAPM_SPK("Rear Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Rear Right Spk", NULL),
+};
+
 static const struct snd_soc_dapm_widget mt8188_mt6359_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
@@ -182,6 +243,14 @@ static const struct snd_kcontrol_new mt8188_mt6359_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
 
+static const struct snd_soc_dapm_widget mt8188_nau8825_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+};
+
+static const struct snd_kcontrol_new mt8188_nau8825_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+};
+
 #define CKSYS_AUD_TOP_CFG 0x032c
 #define CKSYS_AUD_TOP_MON 0x0330
 
@@ -451,6 +520,189 @@ static int mt8188_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
+static int mt8188_dumb_amp_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret = 0;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_dumb_spk_widgets,
+					ARRAY_SIZE(mt8188_dumb_spk_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add Dumb Speaker dapm, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, mt8188_dumb_spk_controls,
+					ARRAY_SIZE(mt8188_dumb_spk_controls));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add Dumb card controls, ret %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int mt8188_max98390_hw_params(struct snd_pcm_substream *substream,
+				     struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	unsigned int bit_width = params_width(params);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai;
+	int i;
+
+	snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0xf, 4, bit_width);
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (!strcmp(codec_dai->component->name, MAX98390_DEV0_NAME))
+			snd_soc_dai_set_tdm_slot(codec_dai, 0x8, 0x3, 4, bit_width);
+
+		if (!strcmp(codec_dai->component->name, MAX98390_DEV1_NAME))
+			snd_soc_dai_set_tdm_slot(codec_dai, 0x4, 0x3, 4, bit_width);
+
+		if (!strcmp(codec_dai->component->name, MAX98390_DEV2_NAME))
+			snd_soc_dai_set_tdm_slot(codec_dai, 0x2, 0x3, 4, bit_width);
+
+		if (!strcmp(codec_dai->component->name, MAX98390_DEV3_NAME))
+			snd_soc_dai_set_tdm_slot(codec_dai, 0x1, 0x3, 4, bit_width);
+	}
+	return 0;
+}
+
+static const struct snd_soc_ops mt8188_max98390_ops = {
+	.hw_params = mt8188_max98390_hw_params,
+};
+
+static int mt8188_max98390_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	/* add regular speakers dapm route */
+	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_dual_spk_widgets,
+					ARRAY_SIZE(mt8188_dual_spk_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add Left/Right Speaker widget, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, mt8188_dual_spk_controls,
+					ARRAY_SIZE(mt8188_dual_spk_controls));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add Left/Right card controls, ret %d\n", ret);
+		return ret;
+	}
+
+	if (rtd->dai_link->num_codecs <= 2)
+		return ret;
+
+	/* add widgets/controls/dapm for rear speakers */
+	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_rear_spk_widgets,
+					ARRAY_SIZE(mt8188_rear_spk_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add Rear Speaker widget, ret %d\n", ret);
+		/* Don't need to add routes if widget addition failed */
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, mt8188_rear_spk_controls,
+					ARRAY_SIZE(mt8188_rear_spk_controls));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add Rear card controls, ret %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int mt8188_nau8825_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct mt8188_mt6359_priv *priv = snd_soc_card_get_drvdata(card);
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_jack *jack = &priv->headset_jack;
+	int ret;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, mt8188_nau8825_widgets,
+					ARRAY_SIZE(mt8188_nau8825_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add nau8825 card widget, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, mt8188_nau8825_controls,
+					ARRAY_SIZE(mt8188_nau8825_controls));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add nau8825 card controls, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
+					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
+					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+					 SND_JACK_BTN_3,
+					 jack,
+					 nau8825_jack_pins,
+					 ARRAY_SIZE(nau8825_jack_pins));
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+};
+
+static void mt8188_nau8825_codec_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+
+	snd_soc_component_set_jack(component, NULL, NULL);
+}
+
+static int mt8188_nau8825_hw_params(struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	unsigned int rate = params_rate(params);
+	unsigned int bit_width = params_width(params);
+	int clk_freq, ret;
+
+	clk_freq = rate * 2 * bit_width;
+
+	/* Configure clock for codec */
+	ret = snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_FLL_BLK, 0,
+				     SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(codec_dai->dev, "can't set BCLK clock %d\n", ret);
+		return ret;
+	}
+
+	/* Configure pll for codec */
+	ret = snd_soc_dai_set_pll(codec_dai, 0, 0, clk_freq,
+				  params_rate(params) * 256);
+	if (ret < 0) {
+		dev_err(codec_dai->dev, "can't set BCLK: %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static const struct snd_soc_ops mt8188_nau8825_ops = {
+	.hw_params = mt8188_nau8825_hw_params,
+};
 static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 	/* FE */
 	[DAI_LINK_DL2_FE] = {
@@ -708,6 +960,40 @@ static struct snd_soc_dai_link mt8188_mt6359_dai_links[] = {
 	},
 };
 
+static struct snd_kcontrol *ctl_find(struct snd_card *card, const char *name)
+{
+	struct snd_ctl_elem_id sid;
+
+	memset(&sid, 0, sizeof(sid));
+	strcpy(sid.name, name);
+	sid.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	return snd_ctl_find_id(card, &sid);
+}
+
+static void mt8188_fixup_controls(struct snd_soc_card *card)
+{
+	struct mt8188_mt6359_priv *priv = snd_soc_card_get_drvdata(card);
+	struct mt8188_card_data *card_data = (struct mt8188_card_data *)priv->private_data;
+	struct snd_kcontrol *kctl;
+
+	if (card_data->quirk && NAU8825_HS_PRESENT) {
+		struct snd_soc_dapm_widget *w, *next_w;
+
+		for_each_card_widgets_safe(card, w, next_w) {
+			if (strcmp(w->name, "Headphone"))
+				continue;
+
+			snd_soc_dapm_free_widget(w);
+		}
+
+		kctl = ctl_find(card->snd_card, "Headphone Switch");
+		if (kctl)
+			snd_ctl_remove(card->snd_card, kctl);
+		else
+			dev_warn(card->dev, "Cannot find ctl : Headphone Switch\n");
+	}
+}
+
 static struct snd_soc_card mt8188_mt6359_soc_card = {
 	.owner = THIS_MODULE,
 	.dai_link = mt8188_mt6359_dai_links,
@@ -716,6 +1002,7 @@ static struct snd_soc_card mt8188_mt6359_soc_card = {
 	.num_dapm_widgets = ARRAY_SIZE(mt8188_mt6359_widgets),
 	.controls = mt8188_mt6359_controls,
 	.num_controls = ARRAY_SIZE(mt8188_mt6359_controls),
+	.fixup_controls = mt8188_fixup_controls,
 };
 
 static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
@@ -726,6 +1013,9 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
 	struct mt8188_card_data *card_data;
 	struct snd_soc_dai_link *dai_link;
 	bool init_mt6359 = false;
+	bool init_nau8825 = false;
+	bool init_max98390 = false;
+	bool init_dumb = false;
 	int ret, i;
 
 	card_data = (struct mt8188_card_data *)of_device_get_match_data(&pdev->dev);
@@ -776,9 +1066,38 @@ static int mt8188_mt6359_dev_probe(struct platform_device *pdev)
 				dai_link->init = mt8188_mt6359_init;
 				init_mt6359 = true;
 			}
+		} else if (strcmp(dai_link->name, "ETDM1_OUT_BE") == 0 ||
+			   strcmp(dai_link->name, "ETDM2_OUT_BE") == 0 ||
+			   strcmp(dai_link->name, "ETDM1_IN_BE") == 0 ||
+			   strcmp(dai_link->name, "ETDM2_IN_BE") == 0) {
+			if (!strcmp(dai_link->codecs->dai_name, MAX98390_CODEC_DAI)) {
+				dai_link->ops = &mt8188_max98390_ops;
+				if (init_max98390)
+					continue;
+
+				dai_link->init = mt8188_max98390_codec_init;
+				init_max98390 = true;
+			} else if (!strcmp(dai_link->codecs->dai_name, NAU8825_CODEC_DAI)) {
+				dai_link->ops = &mt8188_nau8825_ops;
+				if (init_nau8825)
+					continue;
+
+				dai_link->init = mt8188_nau8825_codec_init;
+				dai_link->exit = mt8188_nau8825_codec_exit;
+				init_nau8825 = true;
+			} else {
+				if (strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai")) {
+					if (init_dumb)
+						continue;
+
+					dai_link->init = mt8188_dumb_amp_init;
+					init_dumb = true;
+				}
+			}
 		}
 	}
 
+	priv->private_data = card_data;
 	snd_soc_card_set_drvdata(card, priv);
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
@@ -795,11 +1114,20 @@ static struct mt8188_card_data mt8188_evb_card = {
 	.name = "mt8188_mt6359",
 };
 
+static struct mt8188_card_data mt8188_nau8825_card = {
+	.name = "mt8188_nau8825",
+	.quirk = NAU8825_HS_PRESENT,
+};
+
 static const struct of_device_id mt8188_mt6359_dt_match[] = {
 	{
 		.compatible = "mediatek,mt8188-mt6359-evb",
 		.data = &mt8188_evb_card,
 	},
+	{
+		.compatible = "mediatek,mt8188-nau8825",
+		.data = &mt8188_nau8825_card,
+	},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mt8188_mt6359_dt_match);
-- 
2.18.0

