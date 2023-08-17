Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF4C7827A3
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 13:13:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87193839;
	Mon, 21 Aug 2023 13:12:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87193839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692616385;
	bh=tE8D/TjXnSs4S/D2W7miJktvDJ4biX4N3O2EaWNuUGg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WiQ+QQuV4Yb8eJnHUiZE0uI/D+iyMFSG50nZmBSvy5cobaZI1tKEvI+cxk4ojkdFu
	 YuB2WKgTC6c4d8CmLrkA61gIstIJZ8MtwhpWgvyP2/1cFfegCCzqioJ//zqXVRSvp+
	 yNIhsIZU7jiHssgvqCNCXtEw1DbWE5Gvr94G7+Zc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44D18F8057E; Mon, 21 Aug 2023 13:11:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A797CF8057E;
	Mon, 21 Aug 2023 13:11:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73ADDF801EB; Thu, 17 Aug 2023 12:14:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D163F80254
	for <alsa-devel@alsa-project.org>; Thu, 17 Aug 2023 12:14:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D163F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=XpN5ma55
X-UUID: c83adb903ce611eeb20a276fd37b9834-20230817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=d9vHoPGosuZuoq3F4AyLLb7jsUad9L0e24SqQtFR830=;
	b=XpN5ma553cxW2cqHIghenMQ7290gPtxiearAvX3mwMEKvzg9kGfs2PcyBDpF0g9CAOxJoxYNYu57uuZ8dFV3Cin+NRq0LWXZoZjc+nuTdxswIw3RFJ8v6akKN+N4u1KDzmRuIflBeUUZNjAilX59p8SVFvSbc6sn0G77lXHam2Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:6731175c-dd07-4bb7-81f0-df2ad7ce1969,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:0ad78a4,CLOUDID:3414f7c1-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c83adb903ce611eeb20a276fd37b9834-20230817
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 867899799; Thu, 17 Aug 2023 18:13:59 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Aug 2023 18:13:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 17 Aug 2023 18:13:58 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>, Arnd
 Bergmann <arnd@arndb.de>, Mars Chen
	<chenxiangrui@huaqin.corp-partner.google.com>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH v4 4/6] ASoC: mediatek: mt7986: add machine driver with wm8960
Date: Thu, 17 Aug 2023 18:13:36 +0800
Message-ID: <20230817101338.18782-5-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230817101338.18782-1-maso.huang@mediatek.com>
References: <20230817101338.18782-1-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: maso.huang@mediatek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Y4RUX7ROUS6DMJWEPLKRDNGPFGSOR2IP
X-Message-ID-Hash: Y4RUX7ROUS6DMJWEPLKRDNGPFGSOR2IP
X-Mailman-Approved-At: Mon, 21 Aug 2023 11:11:02 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4RUX7ROUS6DMJWEPLKRDNGPFGSOR2IP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for mt7986 board with wm8960.

Signed-off-by: Maso Huang <maso.huang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/Kconfig                |  10 ++
 sound/soc/mediatek/mt7986/Makefile        |   1 +
 sound/soc/mediatek/mt7986/mt7986-wm8960.c | 196 ++++++++++++++++++++++
 3 files changed, 207 insertions(+)
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-wm8960.c

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 558827755a8d..8d1bc8814486 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -64,6 +64,16 @@ config SND_SOC_MT7986
 	  Select Y if you have such device.
 	  If unsure select "N".
 
+config SND_SOC_MT7986_WM8960
+	tristate "ASoc Audio driver for MT7986 with WM8960 codec"
+	depends on SND_SOC_MT7986 && I2C
+	select SND_SOC_WM8960
+	help
+	  This adds support for ASoC machine driver for MediaTek MT7986
+	  boards with the WM8960 codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
+
 config SND_SOC_MT8173
 	tristate "ASoC support for Mediatek MT8173 chip"
 	depends on ARCH_MEDIATEK
diff --git a/sound/soc/mediatek/mt7986/Makefile b/sound/soc/mediatek/mt7986/Makefile
index de0742a67cae..fc4c82559b29 100644
--- a/sound/soc/mediatek/mt7986/Makefile
+++ b/sound/soc/mediatek/mt7986/Makefile
@@ -6,3 +6,4 @@ snd-soc-mt7986-afe-objs := \
 	mt7986-dai-etdm.o
 
 obj-$(CONFIG_SND_SOC_MT7986) += snd-soc-mt7986-afe.o
+obj-$(CONFIG_SND_SOC_MT7986_WM8960) += mt7986-wm8960.o
diff --git a/sound/soc/mediatek/mt7986/mt7986-wm8960.c b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
new file mode 100644
index 000000000000..364d13b1c426
--- /dev/null
+++ b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mt7986-wm8960.c  --  MT7986-WM8960 ALSA SoC machine driver
+ *
+ * Copyright (c) 2023 MediaTek Inc.
+ * Authors: Vic Wu <vic.wu@mediatek.com>
+ *          Maso Huang <maso.huang@mediatek.com>
+ */
+
+#include <linux/module.h>
+#include <sound/soc.h>
+
+#include "mt7986-afe-common.h"
+
+struct mt7986_wm8960_priv {
+	struct device_node *platform_node;
+	struct device_node *codec_node;
+};
+
+static const struct snd_soc_dapm_widget mt7986_wm8960_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("AMIC", NULL),
+};
+
+static const struct snd_kcontrol_new mt7986_wm8960_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("AMIC"),
+};
+
+SND_SOC_DAILINK_DEFS(playback,
+	DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture,
+	DAILINK_COMP_ARRAY(COMP_CPU("UL1")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(codec,
+	DAILINK_COMP_ARRAY(COMP_CPU("ETDM")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8960-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link mt7986_wm8960_dai_links[] = {
+	/* FE */
+	{
+		.name = "wm8960-playback",
+		.stream_name = "wm8960-playback",
+		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
+			    SND_SOC_DPCM_TRIGGER_POST},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback),
+	},
+	{
+		.name = "wm8960-capture",
+		.stream_name = "wm8960-capture",
+		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
+			    SND_SOC_DPCM_TRIGGER_POST},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture),
+	},
+	/* BE */
+	{
+		.name = "wm8960-codec",
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS |
+			SND_SOC_DAIFMT_GATED,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(codec),
+	},
+};
+
+static struct snd_soc_card mt7986_wm8960_card = {
+	.name = "mt7986-wm8960",
+	.owner = THIS_MODULE,
+	.dai_link = mt7986_wm8960_dai_links,
+	.num_links = ARRAY_SIZE(mt7986_wm8960_dai_links),
+	.controls = mt7986_wm8960_controls,
+	.num_controls = ARRAY_SIZE(mt7986_wm8960_controls),
+	.dapm_widgets = mt7986_wm8960_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt7986_wm8960_widgets),
+};
+
+static int mt7986_wm8960_machine_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = &mt7986_wm8960_card;
+	struct snd_soc_dai_link *dai_link;
+	struct device_node *platform, *codec;
+	struct mt7986_wm8960_priv *priv;
+	int ret, i;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform = of_get_child_by_name(pdev->dev.of_node, "platform");
+
+	if (platform) {
+		priv->platform_node = of_parse_phandle(platform, "sound-dai", 0);
+		of_node_put(platform);
+
+		if (!priv->platform_node) {
+			dev_err(&pdev->dev, "Failed to parse platform/sound-dai property\n");
+			return -EINVAL;
+		}
+	} else {
+		dev_err(&pdev->dev, "Property 'platform' missing or invalid\n");
+		return -EINVAL;
+	}
+
+	for_each_card_prelinks(card, i, dai_link) {
+		if (dai_link->platforms->name)
+			continue;
+		dai_link->platforms->of_node = priv->platform_node;
+	}
+
+	card->dev = &pdev->dev;
+
+	codec = of_get_child_by_name(pdev->dev.of_node, "codec");
+
+	if (codec) {
+		priv->codec_node = of_parse_phandle(codec, "sound-dai", 0);
+		of_node_put(codec);
+
+		if (!priv->codec_node) {
+			of_node_put(priv->platform_node);
+			dev_err(&pdev->dev, "Failed to parse codec/sound-dai property\n");
+			return -EINVAL;
+		}
+	} else {
+		of_node_put(priv->platform_node);
+		dev_err(&pdev->dev, "Property 'codec' missing or invalid\n");
+		return -EINVAL;
+	}
+
+	for_each_card_prelinks(card, i, dai_link) {
+		if (dai_link->codecs->name)
+			continue;
+		dai_link->codecs->of_node = priv->codec_node;
+	}
+
+	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to parse audio-routing: %d\n", ret);
+		goto err_of_node_put;
+	}
+
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	if (ret) {
+		dev_err(&pdev->dev, "%s snd_soc_register_card fail: %d\n", __func__, ret);
+		goto err_of_node_put;
+	}
+
+err_of_node_put:
+	of_node_put(priv->codec_node);
+	of_node_put(priv->platform_node);
+	return ret;
+}
+
+static void mt7986_wm8960_machine_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct mt7986_wm8960_priv *priv = snd_soc_card_get_drvdata(card);
+
+	of_node_put(priv->codec_node);
+	of_node_put(priv->platform_node);
+}
+
+static const struct of_device_id mt7986_wm8960_machine_dt_match[] = {
+	{.compatible = "mediatek,mt7986-wm8960-sound"},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mt7986_wm8960_machine_dt_match);
+
+static struct platform_driver mt7986_wm8960_machine = {
+	.driver = {
+		.name = "mt7986-wm8960",
+		.of_match_table = mt7986_wm8960_machine_dt_match,
+	},
+	.probe = mt7986_wm8960_machine_probe,
+	.remove_new = mt7986_wm8960_machine_remove,
+};
+
+module_platform_driver(mt7986_wm8960_machine);
+
+/* Module information */
+MODULE_DESCRIPTION("MT7986 WM8960 ALSA SoC machine driver");
+MODULE_AUTHOR("Vic Wu <vic.wu@mediatek.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("mt7986 wm8960 soc card");
-- 
2.18.0

