Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41591443FC6
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Nov 2021 11:03:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1F89167D;
	Wed,  3 Nov 2021 11:02:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1F89167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635933791;
	bh=/ZtmJ0e+PLo4SRBJHeeKx7p5QQ8z0Te0lZYMJLRvfAs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hCSqXZzwUKbYjtvh9M4NzAI18pAxZF7f0WWONea07H4pz32BR/MO4eLs/IYIBT76+
	 fVgTTn2Yp+YQ3SV8ld4YhvzIMF11tdaAjGCeQED2WVqw2FRHPbvE8cLrSH/8LY4F0O
	 +aFqsmWI8HB6q71o5xRaMvrdn1Mc+bAWOWsQAHxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70B6CF804FB;
	Wed,  3 Nov 2021 11:01:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AB47F804FA; Wed,  3 Nov 2021 11:01:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1233F80269
 for <alsa-devel@alsa-project.org>; Wed,  3 Nov 2021 11:00:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1233F80269
X-UUID: 36820a73575e47c88a8748271fe519c2-20211103
X-UUID: 36820a73575e47c88a8748271fe519c2-20211103
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <trevor.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 970169523; Wed, 03 Nov 2021 18:00:47 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Nov 2021 18:00:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 3 Nov 2021 18:00:46 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH 4/4] ASoC: mediatek: mt8195: add machine driver for MT8195 SOF
 support
Date: Wed, 3 Nov 2021 18:00:40 +0800
Message-ID: <20211103100040.11933-5-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211103100040.11933-1-trevor.wu@mediatek.com>
References: <20211103100040.11933-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, yc.hung@mediatek.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds SOF support for mt8195 board with mt6359, rt1019 and
rt5682.
We define connection table "sof_conn_stream" and add route path to
connect SOF driver path to backend of normal platform in the late
probe callback.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Signed-off-by: YC Hung <yc.hung@mediatek.com>
---
 sound/soc/mediatek/mt8195/Makefile            |   7 +-
 .../mt8195/mt8195-mt6359-rt1019-rt5682-sof.c  | 557 ++++++++++++++++++
 2 files changed, 563 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682-sof.c

diff --git a/sound/soc/mediatek/mt8195/Makefile b/sound/soc/mediatek/mt8195/Makefile
index 2edcd2855847..6f1ad0048826 100644
--- a/sound/soc/mediatek/mt8195/Makefile
+++ b/sound/soc/mediatek/mt8195/Makefile
@@ -14,10 +14,15 @@ obj-$(CONFIG_SND_SOC_MT8195) += snd-soc-mt8195-afe.o
 # machine driver
 snd-soc-mt8195-rt-common-objs := mt8195-common.o mt8195-realtek-common.o
 
+ifneq ($(CONFIG_SND_SOC_SOF_MT8195),)
+obj-$(CONFIG_SND_SOC_MT8195_MT6359_RT1019_RT5682) += \
+	snd-soc-mt8195-rt-common.o \
+	mt8195-mt6359-rt1019-rt5682-sof.o
+else
 obj-$(CONFIG_SND_SOC_MT8195_MT6359_RT1019_RT5682) += \
 	snd-soc-mt8195-rt-common.o \
 	mt8195-mt6359-rt1019-rt5682.o
-
+endif
 obj-$(CONFIG_SND_SOC_MT8195_MT6359_RT1011_RT5682) += \
 	snd-soc-mt8195-rt-common.o \
 	mt8195-mt6359-rt1011-rt5682.o
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682-sof.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682-sof.c
new file mode 100644
index 000000000000..9d2be7a77c7c
--- /dev/null
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682-sof.c
@@ -0,0 +1,557 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mt8195-rt1019-rt5682-sof.c  --
+ *	MT8195-MT6359-RT1019-RT5682 ALSA SoC machine driver for SOF
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Trevor Wu <trevor.wu@mediatek.com>
+ *         YC Hung <yc.hung@mediatek.com>
+ */
+
+#include <linux/module.h>
+#include <sound/soc.h>
+#include <sound/sof.h>
+#include "mt8195-common.h"
+#include "mt8195-realtek-common.h"
+
+#define SOF_DMA_DL2 "SOF_DMA_DL2"
+#define SOF_DMA_DL3 "SOF_DMA_DL3"
+#define SOF_DMA_UL4 "SOF_DMA_UL4"
+#define SOF_DMA_UL5 "SOF_DMA_UL5"
+
+struct sof_conn_stream {
+	const char *normal_link;
+	const char *sof_link;
+	const char *sof_dma;
+	int stream_dir;
+};
+
+static const struct snd_soc_dapm_widget
+	mt8195_mt6359_rt1019_rt5682_widgets[] = {
+	SND_SOC_DAPM_SPK("Speakers", NULL),
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIXER(SOF_DMA_DL2, SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER(SOF_DMA_DL3, SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER(SOF_DMA_UL4, SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER(SOF_DMA_UL5, SND_SOC_NOPM, 0, 0, NULL, 0),
+};
+
+static const struct snd_soc_dapm_route mt8195_mt6359_rt1019_rt5682_routes[] = {
+	/* speaker */
+	{ "Speakers", NULL, "Speaker" },
+	/* headset */
+	{ "Headphone Jack", NULL, "HPOL" },
+	{ "Headphone Jack", NULL, "HPOR" },
+	{ "IN1P", NULL, "Headset Mic" },
+	/* SOF Uplink */
+	{SOF_DMA_UL4, NULL, "O034"},
+	{SOF_DMA_UL4, NULL, "O035"},
+	{SOF_DMA_UL5, NULL, "O036"},
+	{SOF_DMA_UL5, NULL, "O037"},
+	/* SOF Downlink */
+	{"I070", NULL, SOF_DMA_DL2},
+	{"I071", NULL, SOF_DMA_DL2},
+	{"I020", NULL, SOF_DMA_DL3},
+	{"I021", NULL, SOF_DMA_DL3},
+};
+
+static const struct snd_kcontrol_new mt8195_mt6359_rt1019_rt5682_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speakers"),
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+enum {
+	DAI_LINK_DL10_FE,
+	DAI_LINK_DL_SRC_BE,
+	DAI_LINK_DPTX_BE,
+	DAI_LINK_ETDM1_IN_BE,
+	DAI_LINK_ETDM2_IN_BE,
+	DAI_LINK_ETDM1_OUT_BE,
+	DAI_LINK_ETDM2_OUT_BE,
+	DAI_LINK_ETDM3_OUT_BE,
+	DAI_LINK_PCM1_BE,
+	DAI_LINK_UL_SRC1_BE,
+	DAI_LINK_UL_SRC2_BE,
+	DAI_LINK_SOF_DL2_BE,
+	DAI_LINK_SOF_DL3_BE,
+	DAI_LINK_SOF_UL4_BE,
+	DAI_LINK_SOF_UL5_BE,
+};
+
+/* FE */
+SND_SOC_DAILINK_DEFS(DL10_FE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL10")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+/* BE */
+SND_SOC_DAILINK_DEFS(DL_SRC_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL_SRC")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
+						   "mt6359-snd-codec-aif1")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(DPTX_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DPTX")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(ETDM1_IN_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM1_IN")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(ETDM2_IN_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM2_IN")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(ETDM1_OUT_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM1_OUT")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(ETDM2_OUT_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM2_OUT")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC(RT1019_DEV0_NAME,
+						   RT1019_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(ETDM3_OUT_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM3_OUT")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(PCM1_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("PCM1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(UL_SRC1_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL_SRC1")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
+						   "mt6359-snd-codec-aif1"),
+					COMP_CODEC("dmic-codec",
+						   "dmic-hifi")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(UL_SRC2_BE,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL_SRC2")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
+						   "mt6359-snd-codec-aif2")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(AFE_SOF_DL2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_DL2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_PLATFORM("10803000.adsp")));
+
+SND_SOC_DAILINK_DEFS(AFE_SOF_DL3,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_DL3")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_PLATFORM("10803000.adsp")));
+
+SND_SOC_DAILINK_DEFS(AFE_SOF_UL4,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_UL4")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_PLATFORM("10803000.adsp")));
+
+SND_SOC_DAILINK_DEFS(AFE_SOF_UL5,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_UL5")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_PLATFORM("10803000.adsp")));
+
+static const struct sof_conn_stream g_sof_conn_streams[] = {
+	{ "ETDM2_OUT_BE", "AFE_SOF_DL2", SOF_DMA_DL2, SNDRV_PCM_STREAM_PLAYBACK},
+	{ "ETDM1_OUT_BE", "AFE_SOF_DL3", SOF_DMA_DL3, SNDRV_PCM_STREAM_PLAYBACK},
+	{ "UL_SRC1_BE", "AFE_SOF_UL4", SOF_DMA_UL4, SNDRV_PCM_STREAM_CAPTURE},
+	{ "ETDM2_IN_BE", "AFE_SOF_UL5", SOF_DMA_UL5, SNDRV_PCM_STREAM_CAPTURE},
+};
+
+/* fixup the BE DAI link to match any values from topology */
+static int mt8195_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
+				 struct snd_pcm_hw_params *params)
+{
+	int i, j, ret = 0;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai_link *sof_dai_link = NULL;
+	struct snd_soc_pcm_runtime *runtime;
+	struct snd_soc_dai *cpu_dai;
+
+	for (i = 0; i < ARRAY_SIZE(g_sof_conn_streams); i++) {
+		const struct sof_conn_stream *conn = &g_sof_conn_streams[i];
+
+		if (strcmp(rtd->dai_link->name, conn->normal_link))
+			continue;
+
+		for_each_card_rtds(card, runtime) {
+			if (strcmp(runtime->dai_link->name, conn->sof_link))
+				continue;
+
+			for_each_rtd_cpu_dais(runtime, j, cpu_dai) {
+				if (cpu_dai->stream_active[conn->stream_dir] > 0) {
+					sof_dai_link = runtime->dai_link;
+					break;
+				}
+			}
+			break;
+		}
+
+		if (sof_dai_link && sof_dai_link->be_hw_params_fixup) {
+			ret = sof_dai_link->be_hw_params_fixup(runtime, params);
+			if (!strcmp(rtd->dai_link->name, "ETDM2_IN_BE") ||
+			    !strcmp(rtd->dai_link->name, "ETDM1_OUT_BE")) {
+				mt8195_etdm_rt_hw_params_fixup(runtime, params);
+			}
+			break;
+		}
+	}
+
+	return ret;
+}
+
+static int mt8195_mt6359_rt1019_rt5682_card_late_probe(struct snd_soc_card *card)
+{
+	struct snd_soc_pcm_runtime *runtime;
+	struct snd_soc_component *sof_comp;
+	int i;
+
+	/* 1. find sof component */
+	for_each_card_rtds(card, runtime) {
+		for (i = 0; i < runtime->num_components; i++) {
+			if (!runtime->components[i]->driver->name)
+				continue;
+			if (!strcmp(runtime->components[i]->driver->name, "sof-audio-component")) {
+				sof_comp = runtime->components[i];
+				break;
+			}
+		}
+	}
+
+	if (!sof_comp) {
+		dev_info(card->dev, " probe without component\n");
+		return 0;
+	}
+	/* 2. add route path and fixup callback */
+	for (i = 0; i < ARRAY_SIZE(g_sof_conn_streams); i++) {
+		const struct sof_conn_stream *conn = &g_sof_conn_streams[i];
+		struct snd_soc_pcm_runtime *sof_rtd = NULL;
+		struct snd_soc_pcm_runtime *normal_rtd = NULL;
+		struct snd_soc_pcm_runtime *rtd = NULL;
+
+		for_each_card_rtds(card, rtd) {
+			if (!strcmp(rtd->dai_link->name, conn->sof_link)) {
+				sof_rtd = rtd;
+				continue;
+			}
+			if (!strcmp(rtd->dai_link->name, conn->normal_link)) {
+				normal_rtd = rtd;
+				continue;
+			}
+			if (normal_rtd && sof_rtd)
+				break;
+		}
+		if (normal_rtd && sof_rtd) {
+			int j;
+			struct snd_soc_dai *cpu_dai;
+
+			for_each_rtd_cpu_dais(sof_rtd, j, cpu_dai) {
+				struct snd_soc_dapm_route route;
+				struct snd_soc_dapm_path *p = NULL;
+				struct snd_soc_dapm_widget *play_widget =
+					cpu_dai->playback_widget;
+				struct snd_soc_dapm_widget *cap_widget =
+					cpu_dai->capture_widget;
+				memset(&route, 0, sizeof(route));
+				if (conn->stream_dir == SNDRV_PCM_STREAM_CAPTURE &&
+				    cap_widget) {
+					snd_soc_dapm_widget_for_each_sink_path(cap_widget, p) {
+						route.source = conn->sof_dma;
+						route.sink = p->sink->name;
+						snd_soc_dapm_add_routes(&card->dapm, &route, 1);
+					}
+				} else if (conn->stream_dir == SNDRV_PCM_STREAM_PLAYBACK &&
+						play_widget){
+					snd_soc_dapm_widget_for_each_source_path(play_widget, p) {
+						route.source = p->source->name;
+						route.sink = conn->sof_dma;
+						snd_soc_dapm_add_routes(&card->dapm, &route, 1);
+					}
+				} else {
+					dev_err(cpu_dai->dev, "stream dir and widget not pair\n");
+				}
+			}
+			normal_rtd->dai_link->be_hw_params_fixup = mt8195_dai_link_fixup;
+		}
+	}
+
+	return 0;
+}
+
+static struct snd_soc_dai_link mt8195_mt6359_rt1019_rt5682_dai_links[] = {
+	/* FE */
+	[DAI_LINK_DL10_FE] = {
+		.name = "DL10_FE",
+		.stream_name = "DL10 Playback",
+		.trigger = {
+			SND_SOC_DPCM_TRIGGER_POST,
+			SND_SOC_DPCM_TRIGGER_POST,
+		},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		.ops = &mt8195_hdmitx_dptx_playback_ops,
+		SND_SOC_DAILINK_REG(DL10_FE),
+	},
+	/* BE */
+	[DAI_LINK_DL_SRC_BE] = {
+		.name = "DL_SRC_BE",
+		.init = mt8195_mt6359_init,
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(DL_SRC_BE),
+	},
+	[DAI_LINK_DPTX_BE] = {
+		.name = "DPTX_BE",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		.ops = &mt8195_dptx_ops,
+		.be_hw_params_fixup = mt8195_dptx_hw_params_fixup,
+		SND_SOC_DAILINK_REG(DPTX_BE),
+	},
+	[DAI_LINK_ETDM1_IN_BE] = {
+		.name = "ETDM1_IN_BE",
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(ETDM1_IN_BE),
+	},
+	[DAI_LINK_ETDM2_IN_BE] = {
+		.name = "ETDM2_IN_BE",
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_capture = 1,
+		.init = mt8195_rt5682_init,
+		.ops = &mt8195_rt5682_etdm_ops,
+		.be_hw_params_fixup = mt8195_etdm_rt_hw_params_fixup,
+		SND_SOC_DAILINK_REG(ETDM2_IN_BE),
+	},
+	[DAI_LINK_ETDM1_OUT_BE] = {
+		.name = "ETDM1_OUT_BE",
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_playback = 1,
+		.ops = &mt8195_rt5682_etdm_ops,
+		.be_hw_params_fixup = mt8195_etdm_rt_hw_params_fixup,
+		SND_SOC_DAILINK_REG(ETDM1_OUT_BE),
+	},
+	[DAI_LINK_ETDM2_OUT_BE] = {
+		.name = "ETDM2_OUT_BE",
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(ETDM2_OUT_BE),
+	},
+	[DAI_LINK_ETDM3_OUT_BE] = {
+		.name = "ETDM3_OUT_BE",
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(ETDM3_OUT_BE),
+	},
+	[DAI_LINK_PCM1_BE] = {
+		.name = "PCM1_BE",
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(PCM1_BE),
+	},
+	[DAI_LINK_UL_SRC1_BE] = {
+		.name = "UL_SRC1_BE",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(UL_SRC1_BE),
+	},
+	[DAI_LINK_UL_SRC2_BE] = {
+		.name = "UL_SRC2_BE",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(UL_SRC2_BE),
+	},
+	/* SOF BE */
+	[DAI_LINK_SOF_DL2_BE] = {
+		.name = "AFE_SOF_DL2",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(AFE_SOF_DL2),
+	},
+	[DAI_LINK_SOF_DL3_BE] = {
+		.name = "AFE_SOF_DL3",
+		.no_pcm = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(AFE_SOF_DL3),
+	},
+	[DAI_LINK_SOF_UL4_BE] = {
+		.name = "AFE_SOF_UL4",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(AFE_SOF_UL4),
+	},
+	[DAI_LINK_SOF_UL5_BE] = {
+		.name = "AFE_SOF_UL5",
+		.no_pcm = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(AFE_SOF_UL5),
+	},
+};
+
+static struct snd_soc_card mt8195_mt6359_rt1019_rt5682_soc_card = {
+	.name = "mt8195_r1019_5682",
+	.owner = THIS_MODULE,
+	.dai_link = mt8195_mt6359_rt1019_rt5682_dai_links,
+	.num_links = ARRAY_SIZE(mt8195_mt6359_rt1019_rt5682_dai_links),
+	.controls = mt8195_mt6359_rt1019_rt5682_controls,
+	.num_controls = ARRAY_SIZE(mt8195_mt6359_rt1019_rt5682_controls),
+	.dapm_widgets = mt8195_mt6359_rt1019_rt5682_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8195_mt6359_rt1019_rt5682_widgets),
+	.dapm_routes = mt8195_mt6359_rt1019_rt5682_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8195_mt6359_rt1019_rt5682_routes),
+	.late_probe = mt8195_mt6359_rt1019_rt5682_card_late_probe,
+};
+
+static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = &mt8195_mt6359_rt1019_rt5682_soc_card;
+	struct snd_soc_dai_link *dai_link;
+	struct mt8195_priv *priv;
+	struct device_node *machine_node;
+	struct snd_soc_acpi_mach *mach;
+	int is5682s = 0;
+	int ret, i;
+
+	card->dev = &pdev->dev;
+	mach = pdev->dev.platform_data;
+	machine_node = mach->pdata;
+
+	ret = of_property_read_string_index(machine_node, "model",
+					    0, &card->name);
+	/*
+	 * EINVAL means the property does not exist. This is fine providing
+	 * card->name was previously set, which is checked later in
+	 * snd_soc_register_card.
+	 */
+	if (ret < 0 && ret != -EINVAL) {
+		dev_err(card->dev,
+			"ASoC: Property 'model' could not be read: %d\n",
+			ret);
+		return ret;
+	}
+
+	if (strstr(card->name, "_5682s"))
+		is5682s = 1;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->platform_node = of_parse_phandle(machine_node,
+					       "mediatek,platform", 0);
+
+	if (!priv->platform_node) {
+		dev_dbg(&pdev->dev, "Property 'platform' missing or invalid\n");
+		return -EINVAL;
+	}
+
+	for_each_card_prelinks(card, i, dai_link) {
+		if (!dai_link->platforms->name)
+			dai_link->platforms->of_node = priv->platform_node;
+
+		if (strcmp(dai_link->name, "DPTX_BE") == 0) {
+			priv->dp_node =
+				of_parse_phandle(machine_node,
+						 "mediatek,dptx-codec", 0);
+			if (!priv->dp_node) {
+				dev_dbg(&pdev->dev, "No property 'dptx-codec'\n");
+			} else {
+				dai_link->codecs->of_node = priv->dp_node;
+				dai_link->codecs->name = NULL;
+				dai_link->codecs->dai_name = "i2s-hifi";
+				dai_link->init = mt8195_dptx_codec_init;
+			}
+		} else if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
+			priv->hdmi_node =
+				of_parse_phandle(machine_node,
+						 "mediatek,hdmi-codec", 0);
+			if (!priv->hdmi_node) {
+				dev_dbg(&pdev->dev, "No property 'hdmi-codec'\n");
+			} else {
+				dai_link->codecs->of_node = priv->hdmi_node;
+				dai_link->codecs->name = NULL;
+				dai_link->codecs->dai_name = "i2s-hifi";
+				dai_link->init = mt8195_hdmi_codec_init;
+			}
+		} else if (strcmp(dai_link->name, "ETDM1_OUT_BE") == 0 ||
+			   strcmp(dai_link->name, "ETDM2_IN_BE") == 0) {
+			dai_link->codecs->name =
+				is5682s ? RT5682S_DEV0_NAME : RT5682_DEV0_NAME;
+			dai_link->codecs->dai_name =
+				is5682s ? RT5682S_CODEC_DAI : RT5682_CODEC_DAI;
+		}
+	}
+
+	snd_soc_card_set_drvdata(card, priv);
+
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	if (ret) {
+		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
+			__func__, ret);
+		of_node_put(priv->hdmi_node);
+		of_node_put(priv->dp_node);
+		of_node_put(priv->platform_node);
+	}
+
+	return ret;
+}
+
+static int mt8195_mt6359_rt1019_rt5682_dev_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct mt8195_priv *priv = snd_soc_card_get_drvdata(card);
+
+	of_node_put(priv->hdmi_node);
+	of_node_put(priv->dp_node);
+	of_node_put(priv->platform_node);
+
+	return 0;
+}
+
+static struct platform_driver mt8195_mt6359_rt1019_rt5682_driver = {
+	.driver = {
+		.name = "mt8195_mt6359_rt1019_rt5682",
+		.pm = &mt8195_pm_ops,
+	},
+	.probe = mt8195_mt6359_rt1019_rt5682_dev_probe,
+	.remove = mt8195_mt6359_rt1019_rt5682_dev_remove,
+};
+
+module_platform_driver(mt8195_mt6359_rt1019_rt5682_driver);
+
+/* Module information */
+MODULE_DESCRIPTION("MT8195-MT6359-RT1019-RT5682 ALSA SoC SOF machine driver");
+MODULE_AUTHOR("Trevor Wu <trevor.wu@mediatek.com>");
+MODULE_AUTHOR("YC Hung <yc.hung@mediatek.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("mt8195_mt6359_rt1019_rt5682 soc card");
-- 
2.18.0

