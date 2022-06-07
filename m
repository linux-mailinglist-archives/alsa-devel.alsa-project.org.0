Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05103531122
	for <lists+alsa-devel@lfdr.de>; Mon, 23 May 2022 15:36:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8003D1898;
	Mon, 23 May 2022 15:35:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8003D1898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653312962;
	bh=+9Vs1j71zwpsrE1T75gQYsGHx5AKunS1fuy3noEy+Cs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L/7Vv+MlvSHy9JlhL7IJ+Gd83wTSFnJ69+9k8Yqh7X8FX8qyDgw/uFABtA3ibjH1m
	 jha0GJ06vaGJbdsSHW7Gw5VFFL4jwgIIoyfSUl1BDz0AbYJaLXl+psTkbX05jKc1eW
	 KXY/v9INTaszWZOC723WvJQkyNwB+AROMz0qZKxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FA34F805E7;
	Mon, 23 May 2022 15:30:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EDFBF805B5; Mon, 23 May 2022 15:29:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 374D3F8051F
 for <alsa-devel@alsa-project.org>; Mon, 23 May 2022 15:29:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 374D3F8051F
X-UUID: 1b7ec415fd0b4f6db6f74deecabb9657-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:65312ac8-d499-48b2-b5f3-0374f9433033, OB:30,
 L
 OB:10,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,
 ACTION:release,TS:90
X-CID-INFO: VERSION:1.1.5, REQID:65312ac8-d499-48b2-b5f3-0374f9433033, OB:30,
 LOB
 :10,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,
 ACTION:quarantine,TS:90
X-CID-META: VersionHash:2a19b09, CLOUDID:17fa3de3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:d3526e3325c0,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:0,BEC:nil
X-UUID: 1b7ec415fd0b4f6db6f74deecabb9657-20220523
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1323849583; Mon, 23 May 2022 21:29:16 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 21:29:14 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 May 2022 21:29:13 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v5 14/20] ASoC: mediatek: mt8186: add platform driver
Date: Mon, 23 May 2022 21:28:52 +0800
Message-ID: <20220523132858.22166-15-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523132858.22166-1-jiaxin.yu@mediatek.com>
References: <20220523132858.22166-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
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

Add mt8186 platform and affiliated driver.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/mediatek/Kconfig                    |   44 +
 sound/soc/mediatek/Makefile                   |    1 +
 sound/soc/mediatek/mt8186/Makefile            |   22 +
 sound/soc/mediatek/mt8186/mt8186-afe-common.h |  235 ++
 .../soc/mediatek/mt8186/mt8186-afe-control.c  |  261 ++
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 3009 +++++++++++++++++
 6 files changed, 3572 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8186/Makefile
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-common.h
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-control.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 3b1ddea26a9e..11da3f1b3022 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -152,6 +152,50 @@ config SND_SOC_MT8183_DA7219_MAX98357A
 	  Select Y if you have such device.
 	  If unsure select "N".
 
+config SND_SOC_MT8186
+	tristate "ASoC support for Mediatek MT8186 chip"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on COMMON_CLK
+	select SND_SOC_MEDIATEK
+	select MFD_SYSCON if SND_SOC_MT6358
+	help
+	  This adds ASoC driver for Mediatek MT8186 boards
+	  that can be used with other codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
+
+config SND_SOC_MT8186_MT6366_DA7219_MAX98357
+	tristate "ASoC Audio driver for MT8186 with DA7219 MAX98357A codec"
+	depends on I2C && GPIOLIB
+	depends on SND_SOC_MT8186 && MTK_PMIC_WRAP
+	select SND_SOC_MT6358
+	select SND_SOC_MAX98357A
+	select SND_SOC_DA7219
+	select SND_SOC_BT_SCO
+	select SND_SOC_DMIC
+	select SND_SOC_HDMI_CODEC
+	help
+	  This adds ASoC driver for Mediatek MT8186 boards
+	  with the MT6366(MT6358) DA7219 MAX98357A codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
+
+config SND_SOC_MT8186_MT6366_RT1019_RT5682S
+	tristate "ASoC Audio driver for MT8186 with RT1019 RT5682S codec"
+	depends on I2C && GPIOLIB
+	depends on SND_SOC_MT8186 && MTK_PMIC_WRAP
+	select SND_SOC_MT6358
+	select SND_SOC_RT1015P
+	select SND_SOC_RT5682S
+	select SND_SOC_BT_SCO
+	select SND_SOC_DMIC
+	select SND_SOC_HDMI_CODEC
+	help
+	  This adds ASoC driver for Mediatek MT8186 boards
+	  with the MT6366(MT6358) RT1019 RT5682S codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
+
 config SND_SOC_MTK_BTCVSD
 	tristate "ALSA BT SCO CVSD/MSBC Driver"
 	help
diff --git a/sound/soc/mediatek/Makefile b/sound/soc/mediatek/Makefile
index 34778ca12106..5571c640a288 100644
--- a/sound/soc/mediatek/Makefile
+++ b/sound/soc/mediatek/Makefile
@@ -4,5 +4,6 @@ obj-$(CONFIG_SND_SOC_MT2701) += mt2701/
 obj-$(CONFIG_SND_SOC_MT6797) += mt6797/
 obj-$(CONFIG_SND_SOC_MT8173) += mt8173/
 obj-$(CONFIG_SND_SOC_MT8183) += mt8183/
+obj-$(CONFIG_SND_SOC_MT8186) += mt8186/
 obj-$(CONFIG_SND_SOC_MT8192) += mt8192/
 obj-$(CONFIG_SND_SOC_MT8195) += mt8195/
diff --git a/sound/soc/mediatek/mt8186/Makefile b/sound/soc/mediatek/mt8186/Makefile
new file mode 100644
index 000000000000..49b0026628a0
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/Makefile
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# platform driver
+snd-soc-mt8186-afe-objs := \
+	mt8186-afe-pcm.o \
+	mt8186-audsys-clk.o \
+	mt8186-afe-clk.o \
+	mt8186-afe-gpio.o \
+	mt8186-dai-adda.o \
+	mt8186-afe-control.o \
+	mt8186-dai-i2s.o \
+	mt8186-dai-hw-gain.o \
+	mt8186-dai-pcm.o \
+	mt8186-dai-src.o \
+	mt8186-dai-hostless.o \
+	mt8186-dai-tdm.o \
+	mt8186-misc-control.o \
+	mt8186-mt6366-common.o
+
+obj-$(CONFIG_SND_SOC_MT8186) += snd-soc-mt8186-afe.o
+obj-$(CONFIG_SND_SOC_MT8186_MT6366_DA7219_MAX98357) += mt8186-mt6366-da7219-max98357.o
+obj-$(CONFIG_SND_SOC_MT8186_MT6366_RT1019_RT5682S) += mt8186-mt6366-rt1019-rt5682s.o
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-common.h b/sound/soc/mediatek/mt8186/mt8186-afe-common.h
new file mode 100644
index 000000000000..dc888f2de10c
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-common.h
@@ -0,0 +1,235 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * mt8186-afe-common.h  --  Mediatek 8186 audio driver definitions
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
+ */
+
+#ifndef _MT_8186_AFE_COMMON_H_
+#define _MT_8186_AFE_COMMON_H_
+#include <sound/soc.h>
+#include <linux/list.h>
+#include <linux/regmap.h>
+#include "mt8186-reg.h"
+#include "../common/mtk-base-afe.h"
+
+enum {
+	MT8186_MEMIF_DL1,
+	MT8186_MEMIF_DL12,
+	MT8186_MEMIF_DL2,
+	MT8186_MEMIF_DL3,
+	MT8186_MEMIF_DL4,
+	MT8186_MEMIF_DL5,
+	MT8186_MEMIF_DL6,
+	MT8186_MEMIF_DL7,
+	MT8186_MEMIF_DL8,
+	MT8186_MEMIF_VUL12,
+	MT8186_MEMIF_VUL2,
+	MT8186_MEMIF_VUL3,
+	MT8186_MEMIF_VUL4,
+	MT8186_MEMIF_VUL5,
+	MT8186_MEMIF_VUL6,
+	MT8186_MEMIF_AWB,
+	MT8186_MEMIF_AWB2,
+	MT8186_MEMIF_NUM,
+	MT8186_DAI_ADDA = MT8186_MEMIF_NUM,
+	MT8186_DAI_AP_DMIC,
+	MT8186_DAI_CONNSYS_I2S,
+	MT8186_DAI_I2S_0,
+	MT8186_DAI_I2S_1,
+	MT8186_DAI_I2S_2,
+	MT8186_DAI_I2S_3,
+	MT8186_DAI_HW_GAIN_1,
+	MT8186_DAI_HW_GAIN_2,
+	MT8186_DAI_SRC_1,
+	MT8186_DAI_SRC_2,
+	MT8186_DAI_PCM,
+	MT8186_DAI_TDM_IN,
+	MT8186_DAI_HOSTLESS_LPBK,
+	MT8186_DAI_HOSTLESS_FM,
+	MT8186_DAI_HOSTLESS_HW_GAIN_AAUDIO,
+	MT8186_DAI_HOSTLESS_SRC_AAUDIO,
+	MT8186_DAI_HOSTLESS_SRC_1,	/* just an exmpale */
+	MT8186_DAI_HOSTLESS_SRC_BARGEIN,
+	MT8186_DAI_HOSTLESS_UL1,
+	MT8186_DAI_HOSTLESS_UL2,
+	MT8186_DAI_HOSTLESS_UL3,
+	MT8186_DAI_HOSTLESS_UL5,
+	MT8186_DAI_HOSTLESS_UL6,
+	MT8186_DAI_NUM,
+};
+
+#define MT8186_RECORD_MEMIF MT8186_MEMIF_VUL12
+#define MT8186_ECHO_REF_MEMIF MT8186_MEMIF_AWB
+#define MT8186_PRIMARY_MEMIF MT8186_MEMIF_DL1
+#define MT8186_FAST_MEMIF MT8186_MEMIF_DL2
+#define MT8186_DEEP_MEMIF MT8186_MEMIF_DL3
+#define MT8186_VOIP_MEMIF MT8186_MEMIF_DL12
+#define MT8186_MMAP_DL_MEMIF MT8186_MEMIF_DL5
+#define MT8186_MMAP_UL_MEMIF MT8186_MEMIF_VUL5
+#define MT8186_BARGEIN_MEMIF MT8186_MEMIF_AWB
+
+enum {
+	MT8186_IRQ_0,
+	MT8186_IRQ_1,
+	MT8186_IRQ_2,
+	MT8186_IRQ_3,
+	MT8186_IRQ_4,
+	MT8186_IRQ_5,
+	MT8186_IRQ_6,
+	MT8186_IRQ_7,
+	MT8186_IRQ_8,
+	MT8186_IRQ_9,
+	MT8186_IRQ_10,
+	MT8186_IRQ_11,
+	MT8186_IRQ_12,
+	MT8186_IRQ_13,
+	MT8186_IRQ_14,
+	MT8186_IRQ_15,
+	MT8186_IRQ_16,
+	MT8186_IRQ_17,
+	MT8186_IRQ_18,
+	MT8186_IRQ_19,
+	MT8186_IRQ_20,
+	MT8186_IRQ_21,
+	MT8186_IRQ_22,
+	MT8186_IRQ_23,
+	MT8186_IRQ_24,
+	MT8186_IRQ_25,
+	MT8186_IRQ_26,
+	MT8186_IRQ_NUM,
+};
+
+enum {
+	MT8186_AFE_IRQ_DIR_MCU = 0,
+	MT8186_AFE_IRQ_DIR_DSP,
+	MT8186_AFE_IRQ_DIR_BOTH,
+};
+
+enum {
+	MTKAIF_PROTOCOL_1 = 0,
+	MTKAIF_PROTOCOL_2,
+	MTKAIF_PROTOCOL_2_CLK_P2,
+};
+
+enum {
+	MTK_AFE_ADDA_DL_GAIN_MUTE = 0,
+	MTK_AFE_ADDA_DL_GAIN_NORMAL = 0xf74f,
+	/* SA suggest apply -0.3db to audio/speech path */
+};
+
+#define MTK_SPK_NOT_SMARTPA_STR "MTK_SPK_NOT_SMARTPA"
+#define MTK_SPK_RICHTEK_RT5509_STR "MTK_SPK_RICHTEK_RT5509"
+#define MTK_SPK_MEDIATEK_MT6660_STR "MTK_SPK_MEDIATEK_MT6660"
+#define MTK_SPK_GOODIX_TFA9874_STR "MTK_SPK_GOODIX_TFA9874"
+
+#define MTK_SPK_I2S_0_STR "MTK_SPK_I2S_0"
+#define MTK_SPK_I2S_1_STR "MTK_SPK_I2S_1"
+#define MTK_SPK_I2S_2_STR "MTK_SPK_I2S_2"
+#define MTK_SPK_I2S_3_STR "MTK_SPK_I2S_3"
+#define MTK_SPK_I2S_5_STR "MTK_SPK_I2S_5"
+#define MTK_SPK_I2S_6_STR "MTK_SPK_I2S_6"
+#define MTK_SPK_I2S_7_STR "MTK_SPK_I2S_7"
+#define MTK_SPK_I2S_8_STR "MTK_SPK_I2S_8"
+#define MTK_SPK_I2S_9_STR "MTK_SPK_I2S_9"
+
+/* MCLK */
+enum {
+	MT8186_I2S0_MCK = 0,
+	MT8186_I2S1_MCK,
+	MT8186_I2S2_MCK,
+	MT8186_I2S4_MCK,
+	MT8186_TDM_MCK,
+	MT8186_MCK_NUM,
+};
+
+enum mtk_spk_type {
+	MTK_SPK_NOT_SMARTPA = 0,
+	MTK_SPK_RICHTEK_RT5509,
+	MTK_SPK_MEDIATEK_MT6660,
+	MTK_SPK_GOODIX_TFA9874,
+	MTK_SPK_TYPE_NUM
+};
+
+enum mtk_spk_i2s_type {
+	MTK_SPK_I2S_TYPE_INVALID = -1,
+	MTK_SPK_I2S_0,
+	MTK_SPK_I2S_1,
+	MTK_SPK_I2S_2,
+	MTK_SPK_I2S_3,
+	MTK_SPK_I2S_5,
+	MTK_SPK_I2S_TYPE_NUM
+};
+
+/* SMC CALL Operations */
+enum mtk_audio_smc_call_op {
+	MTK_AUDIO_SMC_OP_INIT = 0,
+	MTK_AUDIO_SMC_OP_DRAM_REQUEST,
+	MTK_AUDIO_SMC_OP_DRAM_RELEASE,
+	MTK_AUDIO_SMC_OP_FM_REQUEST,
+	MTK_AUDIO_SMC_OP_FM_RELEASE,
+	MTK_AUDIO_SMC_OP_ADSP_REQUEST,
+	MTK_AUDIO_SMC_OP_ADSP_RELEASE,
+	MTK_AUDIO_SMC_OP_NUM
+};
+
+struct snd_pcm_substream;
+struct mtk_base_irq_data;
+struct clk;
+
+struct mt8186_afe_private {
+	struct clk **clk;
+	struct clk_lookup **lookup;
+	struct regmap *topckgen;
+	struct regmap *apmixedsys;
+	struct regmap *infracfg;
+	int irq_cnt[MT8186_MEMIF_NUM];
+	int stf_positive_gain_db;
+	int pm_runtime_bypass_reg_ctl;
+	int sgen_mode;
+	int sgen_rate;
+	int sgen_amplitude;
+
+	/* xrun assert */
+	int xrun_assert[MT8186_MEMIF_NUM];
+
+	/* dai */
+	bool dai_on[MT8186_DAI_NUM];
+	void *dai_priv[MT8186_DAI_NUM];
+
+	/* adda */
+	bool mtkaif_calibration_ok;
+	int mtkaif_protocol;
+	int mtkaif_chosen_phase[4];
+	int mtkaif_phase_cycle[4];
+	int mtkaif_calibration_num_phase;
+	int mtkaif_dmic;
+	int mtkaif_looback0;
+	int mtkaif_looback1;
+
+	/* mck */
+	int mck_rate[MT8186_MCK_NUM];
+};
+
+int mt8186_dai_adda_register(struct mtk_base_afe *afe);
+int mt8186_dai_i2s_register(struct mtk_base_afe *afe);
+int mt8186_dai_tdm_register(struct mtk_base_afe *afe);
+int mt8186_dai_hw_gain_register(struct mtk_base_afe *afe);
+int mt8186_dai_src_register(struct mtk_base_afe *afe);
+int mt8186_dai_pcm_register(struct mtk_base_afe *afe);
+int mt8186_dai_hostless_register(struct mtk_base_afe *afe);
+
+int mt8186_add_misc_control(struct snd_soc_component *component);
+
+unsigned int mt8186_general_rate_transform(struct device *dev,
+					   unsigned int rate);
+unsigned int mt8186_rate_transform(struct device *dev,
+				   unsigned int rate, int aud_blk);
+unsigned int mt8186_tdm_relatch_rate_transform(struct device *dev,
+					       unsigned int rate);
+
+int mt8186_dai_set_priv(struct mtk_base_afe *afe, int id,
+			int priv_size, const void *priv_data);
+
+#endif
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-control.c b/sound/soc/mediatek/mt8186/mt8186-afe-control.c
new file mode 100644
index 000000000000..2d78212c3c3f
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-control.c
@@ -0,0 +1,261 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// MediaTek ALSA SoC Audio Control
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
+
+#include "mt8186-afe-common.h"
+#include <linux/pm_runtime.h>
+
+enum {
+	MTK_AFE_RATE_8K = 0,
+	MTK_AFE_RATE_11K,
+	MTK_AFE_RATE_12K,
+	MTK_AFE_RATE_384K,
+	MTK_AFE_RATE_16K,
+	MTK_AFE_RATE_22K,
+	MTK_AFE_RATE_24K,
+	MTK_AFE_RATE_352K,
+	MTK_AFE_RATE_32K,
+	MTK_AFE_RATE_44K,
+	MTK_AFE_RATE_48K,
+	MTK_AFE_RATE_88K,
+	MTK_AFE_RATE_96K,
+	MTK_AFE_RATE_176K,
+	MTK_AFE_RATE_192K,
+	MTK_AFE_RATE_260K,
+};
+
+enum {
+	MTK_AFE_PCM_RATE_8K = 0,
+	MTK_AFE_PCM_RATE_16K,
+	MTK_AFE_PCM_RATE_32K,
+	MTK_AFE_PCM_RATE_48K,
+};
+
+enum {
+	MTK_AFE_TDM_RATE_8K = 0,
+	MTK_AFE_TDM_RATE_12K,
+	MTK_AFE_TDM_RATE_16K,
+	MTK_AFE_TDM_RATE_24K,
+	MTK_AFE_TDM_RATE_32K,
+	MTK_AFE_TDM_RATE_48K,
+	MTK_AFE_TDM_RATE_64K,
+	MTK_AFE_TDM_RATE_96K,
+	MTK_AFE_TDM_RATE_128K,
+	MTK_AFE_TDM_RATE_192K,
+	MTK_AFE_TDM_RATE_256K,
+	MTK_AFE_TDM_RATE_384K,
+	MTK_AFE_TDM_RATE_11K,
+	MTK_AFE_TDM_RATE_22K,
+	MTK_AFE_TDM_RATE_44K,
+	MTK_AFE_TDM_RATE_88K,
+	MTK_AFE_TDM_RATE_176K,
+	MTK_AFE_TDM_RATE_352K,
+};
+
+enum {
+	MTK_AFE_TDM_RELATCH_RATE_8K = 0,
+	MTK_AFE_TDM_RELATCH_RATE_11K,
+	MTK_AFE_TDM_RELATCH_RATE_12K,
+	MTK_AFE_TDM_RELATCH_RATE_16K,
+	MTK_AFE_TDM_RELATCH_RATE_22K,
+	MTK_AFE_TDM_RELATCH_RATE_24K,
+	MTK_AFE_TDM_RELATCH_RATE_32K,
+	MTK_AFE_TDM_RELATCH_RATE_44K,
+	MTK_AFE_TDM_RELATCH_RATE_48K,
+	MTK_AFE_TDM_RELATCH_RATE_88K,
+	MTK_AFE_TDM_RELATCH_RATE_96K,
+	MTK_AFE_TDM_RELATCH_RATE_176K,
+	MTK_AFE_TDM_RELATCH_RATE_192K,
+	MTK_AFE_TDM_RELATCH_RATE_352K,
+	MTK_AFE_TDM_RELATCH_RATE_384K,
+};
+
+unsigned int mt8186_general_rate_transform(struct device *dev,
+					   unsigned int rate)
+{
+	switch (rate) {
+	case 8000:
+		return MTK_AFE_RATE_8K;
+	case 11025:
+		return MTK_AFE_RATE_11K;
+	case 12000:
+		return MTK_AFE_RATE_12K;
+	case 16000:
+		return MTK_AFE_RATE_16K;
+	case 22050:
+		return MTK_AFE_RATE_22K;
+	case 24000:
+		return MTK_AFE_RATE_24K;
+	case 32000:
+		return MTK_AFE_RATE_32K;
+	case 44100:
+		return MTK_AFE_RATE_44K;
+	case 48000:
+		return MTK_AFE_RATE_48K;
+	case 88200:
+		return MTK_AFE_RATE_88K;
+	case 96000:
+		return MTK_AFE_RATE_96K;
+	case 176400:
+		return MTK_AFE_RATE_176K;
+	case 192000:
+		return MTK_AFE_RATE_192K;
+	case 260000:
+		return MTK_AFE_RATE_260K;
+	case 352800:
+		return MTK_AFE_RATE_352K;
+	case 384000:
+		return MTK_AFE_RATE_384K;
+	default:
+		dev_err(dev, "%s(), rate %u invalid, use %d!!!\n",
+			__func__, rate, MTK_AFE_RATE_48K);
+	}
+
+	return MTK_AFE_RATE_48K;
+}
+
+static unsigned int tdm_rate_transform(struct device *dev,
+				       unsigned int rate)
+{
+	switch (rate) {
+	case 8000:
+		return MTK_AFE_TDM_RATE_8K;
+	case 11025:
+		return MTK_AFE_TDM_RATE_11K;
+	case 12000:
+		return MTK_AFE_TDM_RATE_12K;
+	case 16000:
+		return MTK_AFE_TDM_RATE_16K;
+	case 22050:
+		return MTK_AFE_TDM_RATE_22K;
+	case 24000:
+		return MTK_AFE_TDM_RATE_24K;
+	case 32000:
+		return MTK_AFE_TDM_RATE_32K;
+	case 44100:
+		return MTK_AFE_TDM_RATE_44K;
+	case 48000:
+		return MTK_AFE_TDM_RATE_48K;
+	case 64000:
+		return MTK_AFE_TDM_RATE_64K;
+	case 88200:
+		return MTK_AFE_TDM_RATE_88K;
+	case 96000:
+		return MTK_AFE_TDM_RATE_96K;
+	case 128000:
+		return MTK_AFE_TDM_RATE_128K;
+	case 176400:
+		return MTK_AFE_TDM_RATE_176K;
+	case 192000:
+		return MTK_AFE_TDM_RATE_192K;
+	case 256000:
+		return MTK_AFE_TDM_RATE_256K;
+	case 352800:
+		return MTK_AFE_TDM_RATE_352K;
+	case 384000:
+		return MTK_AFE_TDM_RATE_384K;
+	default:
+		dev_err(dev, "%s(), rate %u invalid, use %d!!!\n",
+			__func__, rate, MTK_AFE_TDM_RATE_48K);
+	}
+
+	return MTK_AFE_TDM_RATE_48K;
+}
+
+static unsigned int pcm_rate_transform(struct device *dev,
+				       unsigned int rate)
+{
+	switch (rate) {
+	case 8000:
+		return MTK_AFE_PCM_RATE_8K;
+	case 16000:
+		return MTK_AFE_PCM_RATE_16K;
+	case 32000:
+		return MTK_AFE_PCM_RATE_32K;
+	case 48000:
+		return MTK_AFE_PCM_RATE_48K;
+	default:
+		dev_info(dev, "%s(), rate %u invalid, use %d!!!\n",
+			 __func__,
+			 rate, MTK_AFE_PCM_RATE_32K);
+		return MTK_AFE_PCM_RATE_32K;
+	}
+}
+
+unsigned int mt8186_tdm_relatch_rate_transform(struct device *dev,
+					       unsigned int rate)
+{
+	switch (rate) {
+	case 8000:
+		return MTK_AFE_TDM_RELATCH_RATE_8K;
+	case 11025:
+		return MTK_AFE_TDM_RELATCH_RATE_11K;
+	case 12000:
+		return MTK_AFE_TDM_RELATCH_RATE_12K;
+	case 16000:
+		return MTK_AFE_TDM_RELATCH_RATE_16K;
+	case 22050:
+		return MTK_AFE_TDM_RELATCH_RATE_22K;
+	case 24000:
+		return MTK_AFE_TDM_RELATCH_RATE_24K;
+	case 32000:
+		return MTK_AFE_TDM_RELATCH_RATE_32K;
+	case 44100:
+		return MTK_AFE_TDM_RELATCH_RATE_44K;
+	case 48000:
+		return MTK_AFE_TDM_RELATCH_RATE_48K;
+	case 88200:
+		return MTK_AFE_TDM_RELATCH_RATE_88K;
+	case 96000:
+		return MTK_AFE_TDM_RELATCH_RATE_96K;
+	case 176400:
+		return MTK_AFE_TDM_RELATCH_RATE_176K;
+	case 192000:
+		return MTK_AFE_TDM_RELATCH_RATE_192K;
+	case 352800:
+		return MTK_AFE_TDM_RELATCH_RATE_352K;
+	case 384000:
+		return MTK_AFE_TDM_RELATCH_RATE_384K;
+	default:
+		dev_info(dev, "%s(), rate %u invalid, use %d!!!\n",
+			 __func__,
+			 rate, MTK_AFE_TDM_RELATCH_RATE_48K);
+		return MTK_AFE_TDM_RELATCH_RATE_48K;
+	}
+}
+
+unsigned int mt8186_rate_transform(struct device *dev,
+				   unsigned int rate, int aud_blk)
+{
+	switch (aud_blk) {
+	case MT8186_DAI_PCM:
+		return pcm_rate_transform(dev, rate);
+	case MT8186_DAI_TDM_IN:
+		return tdm_rate_transform(dev, rate);
+	default:
+		return mt8186_general_rate_transform(dev, rate);
+	}
+}
+
+int mt8186_dai_set_priv(struct mtk_base_afe *afe, int id,
+			int priv_size, const void *priv_data)
+{
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	void *temp_data;
+
+	temp_data = devm_kzalloc(afe->dev,
+				 priv_size,
+				 GFP_KERNEL);
+	if (!temp_data)
+		return -ENOMEM;
+
+	if (priv_data)
+		memcpy(temp_data, priv_data, priv_size);
+
+	afe_priv->dai_priv[id] = temp_data;
+
+	return 0;
+}
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
new file mode 100644
index 000000000000..aaba8627d9e1
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -0,0 +1,3009 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Mediatek ALSA SoC AFE platform driver for 8186
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
+
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+#include <sound/soc.h>
+
+#include "../common/mtk-afe-platform-driver.h"
+#include "../common/mtk-afe-fe-dai.h"
+
+#include "mt8186-afe-common.h"
+#include "mt8186-afe-clk.h"
+#include "mt8186-afe-gpio.h"
+#include "mt8186-interconnection.h"
+
+static const struct snd_pcm_hardware mt8186_afe_hardware = {
+	.info = (SNDRV_PCM_INFO_MMAP |
+		 SNDRV_PCM_INFO_INTERLEAVED |
+		 SNDRV_PCM_INFO_MMAP_VALID),
+	.formats = (SNDRV_PCM_FMTBIT_S16_LE |
+		    SNDRV_PCM_FMTBIT_S24_LE |
+		    SNDRV_PCM_FMTBIT_S32_LE),
+	.period_bytes_min = 96,
+	.period_bytes_max = 4 * 48 * 1024,
+	.periods_min = 2,
+	.periods_max = 256,
+	.buffer_bytes_max = 4 * 48 * 1024,
+	.fifo_size = 0,
+};
+
+static int mt8186_fe_startup(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	struct mtk_base_afe_memif *memif = &afe->memif[id];
+	const struct snd_pcm_hardware *mtk_afe_hardware = afe->mtk_afe_hardware;
+	int ret;
+
+	memif->substream = substream;
+
+	snd_pcm_hw_constraint_step(substream->runtime, 0,
+				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 16);
+
+	snd_soc_set_runtime_hwparams(substream, mtk_afe_hardware);
+
+	ret = snd_pcm_hw_constraint_integer(runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0) {
+		dev_err(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+		return ret;
+	}
+
+	/* dynamic allocate irq to memif */
+	if (memif->irq_usage < 0) {
+		int irq_id = mtk_dynamic_irq_acquire(afe);
+
+		if (irq_id != afe->irqs_size) {
+			/* link */
+			memif->irq_usage = irq_id;
+		} else {
+			dev_err(afe->dev, "%s() error: no more asys irq\n",
+				__func__);
+			return -EBUSY;
+		}
+	}
+
+	return 0;
+}
+
+static void mt8186_fe_shutdown(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	struct mtk_base_afe_memif *memif = &afe->memif[id];
+	int irq_id = memif->irq_usage;
+
+	memif->substream = NULL;
+	afe_priv->irq_cnt[id] = 0;
+	afe_priv->xrun_assert[id] = 0;
+
+	if (!memif->const_irq) {
+		mtk_dynamic_irq_release(afe, irq_id);
+		memif->irq_usage = -1;
+		memif->substream = NULL;
+	}
+}
+
+static int mt8186_fe_hw_params(struct snd_pcm_substream *substream,
+			       struct snd_pcm_hw_params *params,
+			       struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	unsigned int channels = params_channels(params);
+	unsigned int rate = params_rate(params);
+	int ret;
+
+	ret = mtk_afe_fe_hw_params(substream, params, dai);
+	if (ret)
+		return ret;
+
+	/* channel merge configuration, enable control is in UL5_IN_MUX */
+	if (id == MT8186_MEMIF_VUL3) {
+		int update_cnt = 8;
+		unsigned int val = 0;
+		unsigned int mask = 0;
+		int fs_mode = mt8186_rate_transform(afe->dev, rate, id);
+
+		/* set rate, channel, update cnt, disable sgen */
+		val = fs_mode << CM1_FS_SELECT_SFT |
+			(channels - 1) << CHANNEL_MERGE0_CHNUM_SFT |
+			update_cnt << CHANNEL_MERGE0_UPDATE_CNT_SFT;
+		mask = CM1_FS_SELECT_MASK_SFT |
+			CHANNEL_MERGE0_CHNUM_MASK_SFT |
+			CHANNEL_MERGE0_UPDATE_CNT_MASK_SFT;
+		regmap_update_bits(afe->regmap, AFE_CM1_CON, mask, val);
+	}
+
+	return 0;
+}
+
+static int mt8186_fe_hw_free(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	int ret;
+
+	ret = mtk_afe_fe_hw_free(substream, dai);
+	if (ret)
+		goto exit;
+
+	/* wait for some platform related operation */
+exit:
+	return ret;
+}
+
+static int mt8186_fe_trigger(struct snd_pcm_substream *substream, int cmd,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_pcm_runtime * const runtime = substream->runtime;
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	struct mtk_base_afe_memif *memif = &afe->memif[id];
+	int irq_id = memif->irq_usage;
+	struct mtk_base_afe_irq *irqs = &afe->irqs[irq_id];
+	const struct mtk_base_irq_data *irq_data = irqs->irq_data;
+	unsigned int counter = runtime->period_size;
+	unsigned int rate = runtime->rate;
+	int fs;
+	int ret;
+
+	dev_dbg(afe->dev, "%s(), %s cmd %d, irq_id %d\n",
+		__func__, memif->data->name, cmd, irq_id);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		ret = mtk_memif_set_enable(afe, id);
+		if (ret) {
+			dev_err(afe->dev, "%s(), error, id %d, memif enable, ret %d\n",
+				__func__, id, ret);
+			return ret;
+		}
+
+		/*
+		 * for small latency record
+		 * ul memif need read some data before irq enable
+		 */
+		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
+		    ((runtime->period_size * 1000) / rate <= 10))
+			udelay(300);
+
+		/* set irq counter */
+		if (afe_priv->irq_cnt[id] > 0)
+			counter = afe_priv->irq_cnt[id];
+
+		regmap_update_bits(afe->regmap, irq_data->irq_cnt_reg,
+				   irq_data->irq_cnt_maskbit
+				   << irq_data->irq_cnt_shift,
+				   counter << irq_data->irq_cnt_shift);
+
+		/* set irq fs */
+		fs = afe->irq_fs(substream, runtime->rate);
+		if (fs < 0)
+			return -EINVAL;
+
+		regmap_update_bits(afe->regmap, irq_data->irq_fs_reg,
+				   irq_data->irq_fs_maskbit
+				   << irq_data->irq_fs_shift,
+				   fs << irq_data->irq_fs_shift);
+
+		/* enable interrupt */
+		if (runtime->stop_threshold != ~(0U))
+			regmap_update_bits(afe->regmap,
+					   irq_data->irq_en_reg,
+					   1 << irq_data->irq_en_shift,
+					   1 << irq_data->irq_en_shift);
+		return 0;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		if (afe_priv->xrun_assert[id] > 0) {
+			if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+				int avail = snd_pcm_capture_avail(runtime);
+
+				if (avail >= runtime->buffer_size) {
+					dev_err(afe->dev, "%s(), id %d, xrun assert\n",
+						__func__, id);
+				}
+			}
+		}
+
+		ret = mtk_memif_set_disable(afe, id);
+		if (ret)
+			dev_err(afe->dev, "%s(), error, id %d, memif enable, ret %d\n",
+				__func__, id, ret);
+
+		/* disable interrupt */
+		if (runtime->stop_threshold != ~(0U))
+			regmap_update_bits(afe->regmap,
+					   irq_data->irq_en_reg,
+					   1 << irq_data->irq_en_shift,
+					   0 << irq_data->irq_en_shift);
+
+		/* clear pending IRQ */
+		regmap_write(afe->regmap, irq_data->irq_clr_reg,
+			     1 << irq_data->irq_clr_shift);
+		return ret;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int mt8186_memif_fs(struct snd_pcm_substream *substream,
+			   unsigned int rate)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *component =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+
+	return mt8186_rate_transform(afe->dev, rate, id);
+}
+
+static int mt8186_get_dai_fs(struct mtk_base_afe *afe,
+			     int dai_id, unsigned int rate)
+{
+	return mt8186_rate_transform(afe->dev, rate, dai_id);
+}
+
+static int mt8186_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *component =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+
+	return mt8186_general_rate_transform(afe->dev, rate);
+}
+
+static int mt8186_get_memif_pbuf_size(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if ((runtime->period_size * 1000) / runtime->rate > 10)
+		return MT8186_MEMIF_PBUF_SIZE_256_BYTES;
+
+	return MT8186_MEMIF_PBUF_SIZE_32_BYTES;
+}
+
+static int mt8186_fe_prepare(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_pcm_runtime * const runtime = substream->runtime;
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	int id = asoc_rtd_to_cpu(rtd, 0)->id;
+	struct mtk_base_afe_memif *memif = &afe->memif[id];
+	int irq_id = memif->irq_usage;
+	struct mtk_base_afe_irq *irqs = &afe->irqs[irq_id];
+	const struct mtk_base_irq_data *irq_data = irqs->irq_data;
+	unsigned int counter = runtime->period_size;
+	int fs;
+	int ret;
+
+	ret = mtk_afe_fe_prepare(substream, dai);
+	if (ret)
+		return ret;
+
+	/* set irq counter */
+	regmap_update_bits(afe->regmap, irq_data->irq_cnt_reg,
+			   irq_data->irq_cnt_maskbit
+			   << irq_data->irq_cnt_shift,
+			   counter << irq_data->irq_cnt_shift);
+
+	/* set irq fs */
+	fs = afe->irq_fs(substream, runtime->rate);
+
+	if (fs < 0)
+		return -EINVAL;
+
+	regmap_update_bits(afe->regmap, irq_data->irq_fs_reg,
+			   irq_data->irq_fs_maskbit
+			   << irq_data->irq_fs_shift,
+			   fs << irq_data->irq_fs_shift);
+
+	return 0;
+}
+
+/* FE DAIs */
+static const struct snd_soc_dai_ops mt8186_memif_dai_ops = {
+	.startup	= mt8186_fe_startup,
+	.shutdown	= mt8186_fe_shutdown,
+	.hw_params	= mt8186_fe_hw_params,
+	.hw_free	= mt8186_fe_hw_free,
+	.prepare	= mt8186_fe_prepare,
+	.trigger	= mt8186_fe_trigger,
+};
+
+#define MTK_PCM_RATES (SNDRV_PCM_RATE_8000_48000 |\
+		       SNDRV_PCM_RATE_88200 |\
+		       SNDRV_PCM_RATE_96000 |\
+		       SNDRV_PCM_RATE_176400 |\
+		       SNDRV_PCM_RATE_192000)
+
+#define MTK_PCM_DAI_RATES (SNDRV_PCM_RATE_8000 |\
+			   SNDRV_PCM_RATE_16000 |\
+			   SNDRV_PCM_RATE_32000 |\
+			   SNDRV_PCM_RATE_48000)
+
+#define MTK_PCM_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			 SNDRV_PCM_FMTBIT_S24_LE |\
+			 SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver mt8186_memif_dai_driver[] = {
+	/* FE DAIs: memory intefaces to CPU */
+	{
+		.name = "DL1",
+		.id = MT8186_MEMIF_DL1,
+		.playback = {
+			.stream_name = "DL1",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8186_memif_dai_ops,
+	},
+	{
+		.name = "DL12",
+		.id = MT8186_MEMIF_DL12,
+		.playback = {
+			.stream_name = "DL12",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8186_memif_dai_ops,
+	},
+	{
+		.name = "DL2",
+		.id = MT8186_MEMIF_DL2,
+		.playback = {
+			.stream_name = "DL2",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8186_memif_dai_ops,
+	},
+	{
+		.name = "DL3",
+		.id = MT8186_MEMIF_DL3,
+		.playback = {
+			.stream_name = "DL3",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8186_memif_dai_ops,
+	},
+	{
+		.name = "DL4",
+		.id = MT8186_MEMIF_DL4,
+		.playback = {
+			.stream_name = "DL4",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8186_memif_dai_ops,
+	},
+	{
+		.name = "DL5",
+		.id = MT8186_MEMIF_DL5,
+		.playback = {
+			.stream_name = "DL5",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8186_memif_dai_ops,
+	},
+	{
+		.name = "DL6",
+		.id = MT8186_MEMIF_DL6,
+		.playback = {
+			.stream_name = "DL6",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8186_memif_dai_ops,
+	},
+	{
+		.name = "DL7",
+		.id = MT8186_MEMIF_DL7,
+		.playback = {
+			.stream_name = "DL7",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8186_memif_dai_ops,
+	},
+	{
+		.name = "DL8",
+		.id = MT8186_MEMIF_DL8,
+		.playback = {
+			.stream_name = "DL8",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8186_memif_dai_ops,
+	},
+	{
+		.name = "UL1",
+		.id = MT8186_MEMIF_VUL12,
+		.capture = {
+			.stream_name = "UL1",
+			.channels_min = 1,
+			.channels_max = 4,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8186_memif_dai_ops,
+	},
+	{
+		.name = "UL2",
+		.id = MT8186_MEMIF_AWB,
+		.capture = {
+			.stream_name = "UL2",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8186_memif_dai_ops,
+	},
+	{
+		.name = "UL3",
+		.id = MT8186_MEMIF_VUL2,
+		.capture = {
+			.stream_name = "UL3",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8186_memif_dai_ops,
+	},
+	{
+		.name = "UL4",
+		.id = MT8186_MEMIF_AWB2,
+		.capture = {
+			.stream_name = "UL4",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8186_memif_dai_ops,
+	},
+	{
+		.name = "UL5",
+		.id = MT8186_MEMIF_VUL3,
+		.capture = {
+			.stream_name = "UL5",
+			.channels_min = 1,
+			.channels_max = 12,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8186_memif_dai_ops,
+	},
+	{
+		.name = "UL6",
+		.id = MT8186_MEMIF_VUL4,
+		.capture = {
+			.stream_name = "UL6",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8186_memif_dai_ops,
+	},
+	{
+		.name = "UL7",
+		.id = MT8186_MEMIF_VUL5,
+		.capture = {
+			.stream_name = "UL7",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8186_memif_dai_ops,
+	},
+	{
+		.name = "UL8",
+		.id = MT8186_MEMIF_VUL6,
+		.capture = {
+			.stream_name = "UL8",
+			.channels_min = 1,
+			.channels_max = 2,
+			.rates = MTK_PCM_RATES,
+			.formats = MTK_PCM_FORMATS,
+		},
+		.ops = &mt8186_memif_dai_ops,
+	}
+};
+
+/* kcontrol */
+static int mt8186_irq_cnt1_get(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+
+	ucontrol->value.integer.value[0] =
+		afe_priv->irq_cnt[MT8186_PRIMARY_MEMIF];
+
+	return 0;
+}
+
+static int mt8186_irq_cnt1_set(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	int memif_num = MT8186_PRIMARY_MEMIF;
+	struct mtk_base_afe_memif *memif = &afe->memif[memif_num];
+	int irq_id = memif->irq_usage;
+	int irq_cnt = afe_priv->irq_cnt[memif_num];
+
+	dev_dbg(afe->dev, "%s(), irq_id %d, irq_cnt = %d, value = %ld\n",
+		__func__, irq_id, irq_cnt, ucontrol->value.integer.value[0]);
+
+	if (irq_cnt == ucontrol->value.integer.value[0])
+		return 0;
+
+	irq_cnt = ucontrol->value.integer.value[0];
+	afe_priv->irq_cnt[memif_num] = irq_cnt;
+
+	if (pm_runtime_status_suspended(afe->dev) || irq_id < 0) {
+		dev_info(afe->dev, "%s(), suspended || irq_id %d, not set\n",
+			 __func__, irq_id);
+	} else {
+		struct mtk_base_afe_irq *irqs = &afe->irqs[irq_id];
+		const struct mtk_base_irq_data *irq_data = irqs->irq_data;
+
+		regmap_update_bits(afe->regmap, irq_data->irq_cnt_reg,
+				   irq_data->irq_cnt_maskbit
+				   << irq_data->irq_cnt_shift,
+				   irq_cnt << irq_data->irq_cnt_shift);
+	}
+
+	return 1;
+}
+
+static int mt8186_irq_cnt2_get(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+
+	ucontrol->value.integer.value[0] =
+		afe_priv->irq_cnt[MT8186_RECORD_MEMIF];
+
+	return 0;
+}
+
+static int mt8186_irq_cnt2_set(struct snd_kcontrol *kcontrol,
+			       struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	int memif_num = MT8186_RECORD_MEMIF;
+	struct mtk_base_afe_memif *memif = &afe->memif[memif_num];
+	int irq_id = memif->irq_usage;
+	int irq_cnt = afe_priv->irq_cnt[memif_num];
+
+	dev_dbg(afe->dev, "%s(), irq_id %d, irq_cnt = %d, value = %ld\n",
+		__func__, irq_id, irq_cnt, ucontrol->value.integer.value[0]);
+
+	if (irq_cnt == ucontrol->value.integer.value[0])
+		return 0;
+
+	irq_cnt = ucontrol->value.integer.value[0];
+	afe_priv->irq_cnt[memif_num] = irq_cnt;
+
+	if (pm_runtime_status_suspended(afe->dev) || irq_id < 0) {
+		dev_info(afe->dev, "%s(), suspended || irq_id %d, not set\n",
+			 __func__, irq_id);
+	} else {
+		struct mtk_base_afe_irq *irqs = &afe->irqs[irq_id];
+		const struct mtk_base_irq_data *irq_data = irqs->irq_data;
+
+		regmap_update_bits(afe->regmap, irq_data->irq_cnt_reg,
+				   irq_data->irq_cnt_maskbit
+				   << irq_data->irq_cnt_shift,
+				   irq_cnt << irq_data->irq_cnt_shift);
+	}
+
+	return 1;
+}
+
+static int mt8186_record_xrun_assert_get(struct snd_kcontrol *kcontrol,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	int xrun_assert = afe_priv->xrun_assert[MT8186_RECORD_MEMIF];
+
+	ucontrol->value.integer.value[0] = xrun_assert;
+
+	return 0;
+}
+
+static int mt8186_record_xrun_assert_set(struct snd_kcontrol *kcontrol,
+					 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	int xrun_assert = ucontrol->value.integer.value[0];
+
+	dev_dbg(afe->dev, "%s(), xrun_assert %d\n", __func__, xrun_assert);
+
+	if (xrun_assert == afe_priv->xrun_assert[MT8186_RECORD_MEMIF])
+		return 0;
+
+	afe_priv->xrun_assert[MT8186_RECORD_MEMIF] = xrun_assert;
+
+	return 1;
+}
+
+static const struct snd_kcontrol_new mt8186_pcm_kcontrols[] = {
+	SOC_SINGLE_EXT("Audio IRQ1 CNT", SND_SOC_NOPM, 0, 0x3ffff, 0,
+		       mt8186_irq_cnt1_get, mt8186_irq_cnt1_set),
+	SOC_SINGLE_EXT("Audio IRQ2 CNT", SND_SOC_NOPM, 0, 0x3ffff, 0,
+		       mt8186_irq_cnt2_get, mt8186_irq_cnt2_set),
+	SOC_SINGLE_EXT("record_xrun_assert", SND_SOC_NOPM, 0, 0x1, 0,
+		       mt8186_record_xrun_assert_get,
+		       mt8186_record_xrun_assert_set),
+};
+
+/* dma widget & routes*/
+static const struct snd_kcontrol_new memif_ul1_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1 Switch", AFE_CONN21,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2 Switch", AFE_CONN21,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3 Switch", AFE_CONN21,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("TDM_IN_CH1 Switch", AFE_CONN21_1,
+				    I_TDM_IN_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul1_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1 Switch", AFE_CONN22,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2 Switch", AFE_CONN22,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3 Switch", AFE_CONN22,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4 Switch", AFE_CONN22,
+				    I_ADDA_UL_CH4, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("TDM_IN_CH2 Switch", AFE_CONN22_1,
+				    I_TDM_IN_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul1_ch3_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1 Switch", AFE_CONN9,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2 Switch", AFE_CONN9,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3 Switch", AFE_CONN9,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("TDM_IN_CH3 Switch", AFE_CONN9_1,
+				    I_TDM_IN_CH3, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul1_ch4_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1 Switch", AFE_CONN10,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2 Switch", AFE_CONN10,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3 Switch", AFE_CONN10,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4 Switch", AFE_CONN10,
+				    I_ADDA_UL_CH4, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("TDM_IN_CH4 Switch", AFE_CONN10_1,
+				    I_TDM_IN_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul2_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH1 Switch", AFE_CONN5,
+				    I_I2S0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1 Switch", AFE_CONN5,
+				    I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH1 Switch", AFE_CONN5,
+				    I_DL12_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1 Switch", AFE_CONN5,
+				    I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1 Switch", AFE_CONN5,
+				    I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1 Switch", AFE_CONN5_1,
+				    I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH1 Switch", AFE_CONN5_1,
+				    I_DL5_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH1 Switch", AFE_CONN5_1,
+				    I_DL6_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1 Switch", AFE_CONN5,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH1 Switch", AFE_CONN5,
+				    I_I2S2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("CONNSYS_I2S_CH1 Switch", AFE_CONN5_1,
+				    I_CONNSYS_I2S_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("SRC_1_OUT_CH1 Switch", AFE_CONN5_1,
+				    I_SRC_1_OUT_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul2_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH2 Switch", AFE_CONN6,
+				    I_I2S0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2 Switch", AFE_CONN6,
+				    I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH2 Switch", AFE_CONN6,
+				    I_DL12_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2 Switch", AFE_CONN6,
+				    I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2 Switch", AFE_CONN6,
+				    I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2 Switch", AFE_CONN6_1,
+				    I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH2 Switch", AFE_CONN6_1,
+				    I_DL5_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH2 Switch", AFE_CONN6_1,
+				    I_DL6_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH2 Switch", AFE_CONN6,
+				    I_PCM_1_CAP_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH2 Switch", AFE_CONN6,
+				    I_I2S2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("CONNSYS_I2S_CH2 Switch", AFE_CONN6_1,
+				    I_CONNSYS_I2S_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("SRC_1_OUT_CH2 Switch", AFE_CONN6_1,
+				    I_SRC_1_OUT_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul3_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("CONNSYS_I2S_CH1 Switch", AFE_CONN32_1,
+				    I_CONNSYS_I2S_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1 Switch", AFE_CONN32,
+				    I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1 Switch", AFE_CONN32,
+				    I_DL2_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul3_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("CONNSYS_I2S_CH2 Switch", AFE_CONN33_1,
+				    I_CONNSYS_I2S_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul4_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1 Switch", AFE_CONN38,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH1 Switch", AFE_CONN38,
+				    I_I2S0_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul4_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2 Switch", AFE_CONN39,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH2 Switch", AFE_CONN39,
+				    I_I2S0_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul5_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1 Switch", AFE_CONN44,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul5_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2 Switch", AFE_CONN45,
+				    I_ADDA_UL_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul6_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1 Switch", AFE_CONN46,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1 Switch", AFE_CONN46,
+				    I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH1 Switch", AFE_CONN46,
+				    I_DL12_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH1 Switch", AFE_CONN46_1,
+				    I_DL6_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1 Switch", AFE_CONN46,
+				    I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1 Switch", AFE_CONN46,
+				    I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1 Switch", AFE_CONN46_1,
+				    I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1 Switch", AFE_CONN46,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH1 Switch", AFE_CONN46,
+				    I_GAIN1_OUT_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul6_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2 Switch", AFE_CONN47,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2 Switch", AFE_CONN47,
+				    I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH2 Switch", AFE_CONN47,
+				    I_DL12_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH2 Switch", AFE_CONN47_1,
+				    I_DL6_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2 Switch", AFE_CONN47,
+				    I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2 Switch", AFE_CONN47,
+				    I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2 Switch", AFE_CONN47_1,
+				    I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH2 Switch", AFE_CONN47,
+				    I_PCM_1_CAP_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("GAIN1_OUT_CH2 Switch", AFE_CONN47,
+				    I_GAIN1_OUT_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul7_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1 Switch", AFE_CONN48,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_GAIN2_OUT_CH1 Switch", AFE_CONN48,
+				    I_GAIN2_OUT_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC_2_OUT_CH1 Switch", AFE_CONN48_1,
+				    I_SRC_2_OUT_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul7_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2 Switch", AFE_CONN49,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_GAIN2_OUT_CH2 Switch", AFE_CONN49,
+				    I_GAIN2_OUT_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC_2_OUT_CH2 Switch", AFE_CONN49_1,
+				    I_SRC_2_OUT_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul8_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1 Switch", AFE_CONN50,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul8_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2 Switch", AFE_CONN51,
+				    I_ADDA_UL_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new hw_cm1_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("TDM_IN_CH1 Switch", AFE_CONN58_1,
+				    I_TDM_IN_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH1 Switch", AFE_CONN58,
+				    I_I2S0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH1 Switch", AFE_CONN58,
+				    I_I2S2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1 Switch", AFE_CONN58,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1 Switch", AFE_CONN58,
+				    I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH1 Switch", AFE_CONN58,
+				    I_DL12_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH3 Switch", AFE_CONN58,
+				    I_DL12_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1 Switch", AFE_CONN58,
+				    I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1 Switch", AFE_CONN58,
+				    I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1 Switch", AFE_CONN58_1,
+				    I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH1 Switch", AFE_CONN58_1,
+				    I_DL5_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC1_OUT_CH1 Switch", AFE_CONN58_1,
+				    I_SRC_1_OUT_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC2_OUT_CH1 Switch", AFE_CONN58_1,
+				    I_SRC_2_OUT_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new hw_cm1_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("TDM_IN_CH2 Switch", AFE_CONN59_1,
+				    I_TDM_IN_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH2 Switch", AFE_CONN59,
+				    I_I2S0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH2 Switch", AFE_CONN59,
+				    I_I2S2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2 Switch", AFE_CONN59,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2 Switch", AFE_CONN59,
+				    I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH2 Switch", AFE_CONN59,
+				    I_DL12_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH4 Switch", AFE_CONN59,
+				    I_DL12_CH4, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2 Switch", AFE_CONN59,
+				    I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2 Switch", AFE_CONN59,
+				    I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2 Switch", AFE_CONN59_1,
+				    I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH2 Switch", AFE_CONN59_1,
+				    I_DL5_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC1_OUT_CH2 Switch", AFE_CONN59_1,
+				    I_SRC_1_OUT_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC2_OUT_CH2 Switch", AFE_CONN59_1,
+				    I_SRC_2_OUT_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new hw_cm1_ch3_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("TDM_IN_CH3 Switch", AFE_CONN60_1,
+				    I_TDM_IN_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH1 Switch", AFE_CONN60,
+				    I_I2S0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH1 Switch", AFE_CONN60,
+				    I_I2S2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1 Switch", AFE_CONN60,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1 Switch", AFE_CONN60,
+				    I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH1 Switch", AFE_CONN60,
+				    I_DL12_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH3 Switch", AFE_CONN60,
+				    I_DL12_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1 Switch", AFE_CONN60,
+				    I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1 Switch", AFE_CONN60,
+				    I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1 Switch", AFE_CONN60_1,
+				    I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH1 Switch", AFE_CONN60_1,
+				    I_DL5_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC1_OUT_CH1 Switch", AFE_CONN60_1,
+				    I_SRC_1_OUT_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC2_OUT_CH1 Switch", AFE_CONN60_1,
+				    I_SRC_2_OUT_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new hw_cm1_ch4_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("TDM_IN_CH4 Switch", AFE_CONN61_1,
+				    I_TDM_IN_CH4, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH2 Switch", AFE_CONN61,
+				    I_I2S0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH2 Switch", AFE_CONN61,
+				    I_I2S2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2 Switch", AFE_CONN61,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2 Switch", AFE_CONN61,
+				    I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH2 Switch", AFE_CONN61,
+				    I_DL12_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH4 Switch", AFE_CONN61,
+				    I_DL12_CH4, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2 Switch", AFE_CONN61,
+				    I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2 Switch", AFE_CONN61,
+				    I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2 Switch", AFE_CONN61_1,
+				    I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH2 Switch", AFE_CONN61_1,
+				    I_DL5_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC1_OUT_CH2 Switch", AFE_CONN61_1,
+				    I_SRC_1_OUT_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC2_OUT_CH2 Switch", AFE_CONN61_1,
+				    I_SRC_2_OUT_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new hw_cm1_ch5_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("TDM_IN_CH5 Switch", AFE_CONN62_1,
+				    I_TDM_IN_CH5, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH1 Switch", AFE_CONN62,
+				    I_I2S0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH1 Switch", AFE_CONN62,
+				    I_I2S2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1 Switch", AFE_CONN62,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1 Switch", AFE_CONN62,
+				    I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH1 Switch", AFE_CONN62,
+				    I_DL12_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH3 Switch", AFE_CONN62,
+				    I_DL12_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1 Switch", AFE_CONN62,
+				    I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1 Switch", AFE_CONN62,
+				    I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1 Switch", AFE_CONN62_1,
+				    I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH1 Switch", AFE_CONN62_1,
+				    I_DL5_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC1_OUT_CH1 Switch", AFE_CONN62_1,
+				    I_SRC_1_OUT_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC2_OUT_CH1 Switch", AFE_CONN62_1,
+				    I_SRC_2_OUT_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new hw_cm1_ch6_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("TDM_IN_CH6 Switch", AFE_CONN63_1,
+				    I_TDM_IN_CH6, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH2 Switch", AFE_CONN63,
+				    I_I2S0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH2 Switch", AFE_CONN63,
+				    I_I2S2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2 Switch", AFE_CONN63,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2 Switch", AFE_CONN63,
+				    I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH2 Switch", AFE_CONN63,
+				    I_DL12_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH4 Switch", AFE_CONN63,
+				    I_DL12_CH4, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2 Switch", AFE_CONN63,
+				    I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2 Switch", AFE_CONN63,
+				    I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2 Switch", AFE_CONN63_1,
+				    I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH2 Switch", AFE_CONN63_1,
+				    I_DL5_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC1_OUT_CH2 Switch", AFE_CONN63_1,
+				    I_SRC_1_OUT_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC2_OUT_CH2 Switch", AFE_CONN63_1,
+				    I_SRC_2_OUT_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new hw_cm1_ch7_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("TDM_IN_CH7 Switch", AFE_CONN64_1,
+				    I_TDM_IN_CH7, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH1 Switch", AFE_CONN64,
+				    I_I2S0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH1 Switch", AFE_CONN64,
+				    I_I2S2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1 Switch", AFE_CONN64,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1 Switch", AFE_CONN64,
+				    I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH1v", AFE_CONN64,
+				    I_DL12_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH3 Switch", AFE_CONN64,
+				    I_DL12_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1 Switch", AFE_CONN64,
+				    I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1 Switch", AFE_CONN64,
+				    I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1 Switch", AFE_CONN64_1,
+				    I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH1 Switch", AFE_CONN64_1,
+				    I_DL5_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC1_OUT_CH1 Switch", AFE_CONN64_1,
+				    I_SRC_1_OUT_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC2_OUT_CH1 Switch", AFE_CONN64_1,
+				    I_SRC_2_OUT_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new hw_cm1_ch8_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("TDM_IN_CH8 Switch", AFE_CONN65_1,
+				    I_TDM_IN_CH8, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH2 Switch", AFE_CONN65,
+				    I_I2S0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH2 Switch", AFE_CONN65,
+				    I_I2S2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2 Switch", AFE_CONN65,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2 Switch", AFE_CONN65,
+				    I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH2 Switch", AFE_CONN65,
+				    I_DL12_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH4 Switch", AFE_CONN65,
+				    I_DL12_CH4, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2 Switch", AFE_CONN65,
+				    I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2 Switch", AFE_CONN65,
+				    I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2 Switch", AFE_CONN65_1,
+				    I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH2 Switch", AFE_CONN65_1,
+				    I_DL5_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC1_OUT_CH2 Switch", AFE_CONN65_1,
+				    I_SRC_1_OUT_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC2_OUT_CH2 Switch", AFE_CONN65_1,
+				    I_SRC_2_OUT_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new hw_cm1_ch9_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH1 Switch", AFE_CONN66,
+				    I_I2S0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH1 Switch", AFE_CONN66,
+				    I_I2S2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1 Switch", AFE_CONN66,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1 Switch", AFE_CONN66,
+				    I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH1 Switch", AFE_CONN66,
+				    I_DL12_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH3 Switch", AFE_CONN66,
+				    I_DL12_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1 Switch", AFE_CONN66,
+				    I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1 Switch", AFE_CONN66,
+				    I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1 Switch", AFE_CONN66_1,
+				    I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH1 Switch", AFE_CONN66_1,
+				    I_DL5_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC1_OUT_CH1 Switch", AFE_CONN66_1,
+				    I_SRC_1_OUT_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC2_OUT_CH1 Switch", AFE_CONN66_1,
+				    I_SRC_2_OUT_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new hw_cm1_ch10_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH2 Switch", AFE_CONN67,
+				    I_I2S0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH2 Switch", AFE_CONN67,
+				    I_I2S2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2 Switch", AFE_CONN67,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2 Switch", AFE_CONN67,
+				    I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH2 Switch", AFE_CONN67,
+				    I_DL12_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH4 Switch", AFE_CONN67,
+				    I_DL12_CH4, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2 Switch", AFE_CONN67,
+				    I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2 Switch", AFE_CONN67,
+				    I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2 Switch", AFE_CONN67_1,
+				    I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH2 Switch", AFE_CONN67_1,
+				    I_DL5_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC1_OUT_CH2 Switch", AFE_CONN67_1,
+				    I_SRC_1_OUT_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC2_OUT_CH2 Switch", AFE_CONN67_1,
+				    I_SRC_2_OUT_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new hw_cm1_ch11_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH1 Switch", AFE_CONN68,
+				    I_I2S0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH1 Switch", AFE_CONN68,
+				    I_I2S2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1 Switch", AFE_CONN68,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1 Switch", AFE_CONN68,
+				    I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH1 Switch", AFE_CONN68,
+				    I_DL12_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH3 Switch", AFE_CONN68,
+				    I_DL12_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1 Switch", AFE_CONN68,
+				    I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1 Switch", AFE_CONN68,
+				    I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1 Switch", AFE_CONN68_1,
+				    I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH1 Switch", AFE_CONN68_1,
+				    I_DL5_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC1_OUT_CH1 Switch", AFE_CONN68_1,
+				    I_SRC_1_OUT_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC2_OUT_CH1 Switch", AFE_CONN68_1,
+				    I_SRC_2_OUT_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new hw_cm1_ch12_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S0_CH2 Switch", AFE_CONN69,
+				    I_I2S0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2S2_CH2 Switch", AFE_CONN69,
+				    I_I2S2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2 Switch", AFE_CONN69,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2 Switch", AFE_CONN69,
+				    I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH2 Switch", AFE_CONN69,
+				    I_DL12_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL12_CH4 Switch", AFE_CONN69,
+				    I_DL12_CH4, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2 Switch", AFE_CONN69,
+				    I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2 Switch", AFE_CONN69,
+				    I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2 Switch", AFE_CONN69_1,
+				    I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH2 Switch", AFE_CONN69_1,
+				    I_DL5_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC1_OUT_CH2 Switch", AFE_CONN69_1,
+				    I_SRC_1_OUT_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC2_OUT_CH2 Switch", AFE_CONN69_1,
+				    I_SRC_2_OUT_CH2, 1, 0),
+};
+
+/* ADDA UL MUX */
+enum {
+	UL5_IN_MUX_CM1 = 0,
+	UL5_IN_MUX_NORMAL,
+	UL5_IN_MUX_MASK = 0x1,
+};
+
+static const char * const ul5_in_mux_map[] = {
+	"UL5_IN_FROM_CM1", "UL5_IN_FROM_Normal"
+};
+
+static int ul5_in_map_value[] = {
+	UL5_IN_MUX_CM1,
+	UL5_IN_MUX_NORMAL,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(ul5_in_mux_map_enum,
+				  AFE_CM1_CON,
+				  VUL3_BYPASS_CM_SFT,
+				  VUL3_BYPASS_CM_MASK,
+				  ul5_in_mux_map,
+				  ul5_in_map_value);
+
+static const struct snd_kcontrol_new ul5_in_mux_control =
+	SOC_DAPM_ENUM("UL5_IN_MUX Select", ul5_in_mux_map_enum);
+
+static const struct snd_soc_dapm_widget mt8186_memif_widgets[] = {
+	/* inter-connections */
+	SND_SOC_DAPM_MIXER("UL1_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul1_ch1_mix, ARRAY_SIZE(memif_ul1_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL1_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul1_ch2_mix, ARRAY_SIZE(memif_ul1_ch2_mix)),
+	SND_SOC_DAPM_MIXER("UL1_CH3", SND_SOC_NOPM, 0, 0,
+			   memif_ul1_ch3_mix, ARRAY_SIZE(memif_ul1_ch3_mix)),
+	SND_SOC_DAPM_MIXER("UL1_CH4", SND_SOC_NOPM, 0, 0,
+			   memif_ul1_ch4_mix, ARRAY_SIZE(memif_ul1_ch4_mix)),
+
+	SND_SOC_DAPM_MIXER("UL2_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul2_ch1_mix, ARRAY_SIZE(memif_ul2_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL2_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul2_ch2_mix, ARRAY_SIZE(memif_ul2_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL3_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul3_ch1_mix, ARRAY_SIZE(memif_ul3_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL3_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul3_ch2_mix, ARRAY_SIZE(memif_ul3_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL4_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul4_ch1_mix, ARRAY_SIZE(memif_ul4_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL4_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul4_ch2_mix, ARRAY_SIZE(memif_ul4_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL5_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul5_ch1_mix, ARRAY_SIZE(memif_ul5_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL5_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul5_ch2_mix, ARRAY_SIZE(memif_ul5_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL6_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul6_ch1_mix, ARRAY_SIZE(memif_ul6_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL6_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul6_ch2_mix, ARRAY_SIZE(memif_ul6_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL7_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul7_ch1_mix, ARRAY_SIZE(memif_ul7_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL7_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul7_ch2_mix, ARRAY_SIZE(memif_ul7_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL8_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul8_ch1_mix, ARRAY_SIZE(memif_ul8_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL8_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul8_ch2_mix, ARRAY_SIZE(memif_ul8_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL5_2CH", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	SND_SOC_DAPM_MIXER("HW_CM1", SND_SOC_NOPM, 0, 0, NULL, 0),
+
+	/* CM1 en*/
+	SND_SOC_DAPM_SUPPLY_S("CM1_EN", 0, AFE_CM1_CON,
+			      CHANNEL_MERGE0_EN_SFT, 0, NULL,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MIXER("HW_CM1_CH1", SND_SOC_NOPM, 0, 0,
+			   hw_cm1_ch1_mix, ARRAY_SIZE(hw_cm1_ch1_mix)),
+	SND_SOC_DAPM_MIXER("HW_CM1_CH2", SND_SOC_NOPM, 0, 0,
+			   hw_cm1_ch2_mix, ARRAY_SIZE(hw_cm1_ch2_mix)),
+	SND_SOC_DAPM_MIXER("HW_CM1_CH3", SND_SOC_NOPM, 0, 0,
+			   hw_cm1_ch3_mix, ARRAY_SIZE(hw_cm1_ch3_mix)),
+	SND_SOC_DAPM_MIXER("HW_CM1_CH4", SND_SOC_NOPM, 0, 0,
+			   hw_cm1_ch4_mix, ARRAY_SIZE(hw_cm1_ch4_mix)),
+	SND_SOC_DAPM_MIXER("HW_CM1_CH5", SND_SOC_NOPM, 0, 0,
+			   hw_cm1_ch5_mix, ARRAY_SIZE(hw_cm1_ch5_mix)),
+	SND_SOC_DAPM_MIXER("HW_CM1_CH6", SND_SOC_NOPM, 0, 0,
+			   hw_cm1_ch6_mix, ARRAY_SIZE(hw_cm1_ch6_mix)),
+	SND_SOC_DAPM_MIXER("HW_CM1_CH7", SND_SOC_NOPM, 0, 0,
+			   hw_cm1_ch7_mix, ARRAY_SIZE(hw_cm1_ch7_mix)),
+	SND_SOC_DAPM_MIXER("HW_CM1_CH8", SND_SOC_NOPM, 0, 0,
+			   hw_cm1_ch8_mix, ARRAY_SIZE(hw_cm1_ch8_mix)),
+	SND_SOC_DAPM_MIXER("HW_CM1_CH9", SND_SOC_NOPM, 0, 0,
+			   hw_cm1_ch9_mix, ARRAY_SIZE(hw_cm1_ch9_mix)),
+	SND_SOC_DAPM_MIXER("HW_CM1_CH10", SND_SOC_NOPM, 0, 0,
+			   hw_cm1_ch10_mix, ARRAY_SIZE(hw_cm1_ch10_mix)),
+	SND_SOC_DAPM_MIXER("HW_CM1_CH11", SND_SOC_NOPM, 0, 0,
+			   hw_cm1_ch11_mix, ARRAY_SIZE(hw_cm1_ch11_mix)),
+	SND_SOC_DAPM_MIXER("HW_CM1_CH12", SND_SOC_NOPM, 0, 0,
+			   hw_cm1_ch12_mix, ARRAY_SIZE(hw_cm1_ch12_mix)),
+
+	SND_SOC_DAPM_MUX("UL5_IN_MUX", SND_SOC_NOPM, 0, 0,
+			 &ul5_in_mux_control),
+
+	SND_SOC_DAPM_INPUT("UL1_VIRTUAL_INPUT"),
+	SND_SOC_DAPM_INPUT("UL2_VIRTUAL_INPUT"),
+	SND_SOC_DAPM_INPUT("UL3_VIRTUAL_INPUT"),
+	SND_SOC_DAPM_INPUT("UL4_VIRTUAL_INPUT"),
+	SND_SOC_DAPM_INPUT("UL5_VIRTUAL_INPUT"),
+	SND_SOC_DAPM_INPUT("UL6_VIRTUAL_INPUT"),
+};
+
+static const struct snd_soc_dapm_route mt8186_memif_routes[] = {
+	{"UL1", NULL, "UL1_CH1"},
+	{"UL1", NULL, "UL1_CH2"},
+	{"UL1", NULL, "UL1_CH3"},
+	{"UL1", NULL, "UL1_CH4"},
+	{"UL1_CH1", "ADDA_UL_CH1 Switch", "ADDA_UL_Mux"},
+	{"UL1_CH1", "ADDA_UL_CH2 Switch", "ADDA_UL_Mux"},
+	{"UL1_CH2", "ADDA_UL_CH1 Switch", "ADDA_UL_Mux"},
+	{"UL1_CH2", "ADDA_UL_CH2 Switch", "ADDA_UL_Mux"},
+	{"UL1_CH3", "ADDA_UL_CH1 Switch", "ADDA_UL_Mux"},
+	{"UL1_CH3", "ADDA_UL_CH2 Switch", "ADDA_UL_Mux"},
+	{"UL1_CH4", "ADDA_UL_CH1 Switch", "ADDA_UL_Mux"},
+	{"UL1_CH4", "ADDA_UL_CH2 Switch", "ADDA_UL_Mux"},
+	{"UL1_CH1", "TDM_IN_CH1 Switch", "TDM IN"},
+	{"UL1_CH2", "TDM_IN_CH2 Switch", "TDM IN"},
+	{"UL1_CH3", "TDM_IN_CH3 Switch", "TDM IN"},
+	{"UL1_CH4", "TDM_IN_CH4 Switch", "TDM IN"},
+
+	{"UL2", NULL, "UL2_CH1"},
+	{"UL2", NULL, "UL2_CH2"},
+
+	/* cannot connect FE to FE directly */
+	{"UL2_CH1", "DL1_CH1 Switch", "Hostless_UL2 UL"},
+	{"UL2_CH2", "DL1_CH2 Switch", "Hostless_UL2 UL"},
+	{"UL2_CH1", "DL12_CH1 Switch", "Hostless_UL2 UL"},
+	{"UL2_CH2", "DL12_CH2 Switch", "Hostless_UL2 UL"},
+	{"UL2_CH1", "DL6_CH1 Switch", "Hostless_UL2 UL"},
+	{"UL2_CH2", "DL6_CH2 Switch", "Hostless_UL2 UL"},
+	{"UL2_CH1", "DL2_CH1 Switch", "Hostless_UL2 UL"},
+	{"UL2_CH2", "DL2_CH2 Switch", "Hostless_UL2 UL"},
+	{"UL2_CH1", "DL3_CH1 Switch", "Hostless_UL2 UL"},
+	{"UL2_CH2", "DL3_CH2 Switch", "Hostless_UL2 UL"},
+	{"UL2_CH1", "DL4_CH1 Switch", "Hostless_UL2 UL"},
+	{"UL2_CH2", "DL4_CH2 Switch", "Hostless_UL2 UL"},
+	{"UL2_CH1", "DL5_CH1 Switch", "Hostless_UL2 UL"},
+	{"UL2_CH2", "DL5_CH2 Switch", "Hostless_UL2 UL"},
+
+	{"Hostless_UL2 UL", NULL, "UL2_VIRTUAL_INPUT"},
+
+	{"UL2_CH1", "I2S0_CH1 Switch", "I2S0"},
+	{"UL2_CH2", "I2S0_CH2 Switch", "I2S0"},
+	{"UL2_CH1", "I2S2_CH1 Switch", "I2S2"},
+	{"UL2_CH2", "I2S2_CH2 Switch", "I2S2"},
+
+	{"UL2_CH1", "PCM_1_CAP_CH1 Switch", "PCM 1 Capture"},
+	{"UL2_CH2", "PCM_1_CAP_CH2 Switch", "PCM 1 Capture"},
+
+	{"UL2_CH1", "CONNSYS_I2S_CH1 Switch", "Connsys I2S"},
+	{"UL2_CH2", "CONNSYS_I2S_CH2 Switch", "Connsys I2S"},
+
+	{"UL2_CH1", "SRC_1_OUT_CH1 Switch", "HW_SRC_1_Out"},
+	{"UL2_CH2", "SRC_1_OUT_CH2 Switch", "HW_SRC_1_Out"},
+
+	{"UL3", NULL, "UL3_CH1"},
+	{"UL3", NULL, "UL3_CH2"},
+	{"UL3_CH1", "CONNSYS_I2S_CH1 Switch", "Connsys I2S"},
+	{"UL3_CH2", "CONNSYS_I2S_CH2 Switch", "Connsys I2S"},
+
+	{"UL4", NULL, "UL4_CH1"},
+	{"UL4", NULL, "UL4_CH2"},
+	{"UL4_CH1", "ADDA_UL_CH1 Switch", "ADDA_UL_Mux"},
+	{"UL4_CH2", "ADDA_UL_CH2 Switch", "ADDA_UL_Mux"},
+	{"UL4_CH1", "I2S0_CH1 Switch", "I2S0"},
+	{"UL4_CH2", "I2S0_CH2 Switch", "I2S0"},
+
+	{"UL5", NULL, "UL5_IN_MUX"},
+	{"UL5_IN_MUX", "UL5_IN_FROM_Normal", "UL5_2CH"},
+	{"UL5_IN_MUX", "UL5_IN_FROM_CM1", "HW_CM1"},
+	{"UL5_2CH", NULL, "UL5_CH1"},
+	{"UL5_2CH", NULL, "UL5_CH2"},
+	{"UL5_CH1", "ADDA_UL_CH1 Switch", "ADDA_UL_Mux"},
+	{"UL5_CH2", "ADDA_UL_CH2 Switch", "ADDA_UL_Mux"},
+	{"HW_CM1", NULL, "CM1_EN"},
+	{"HW_CM1", NULL, "HW_CM1_CH1"},
+	{"HW_CM1", NULL, "HW_CM1_CH2"},
+	{"HW_CM1", NULL, "HW_CM1_CH3"},
+	{"HW_CM1", NULL, "HW_CM1_CH4"},
+	{"HW_CM1", NULL, "HW_CM1_CH5"},
+	{"HW_CM1", NULL, "HW_CM1_CH6"},
+	{"HW_CM1", NULL, "HW_CM1_CH7"},
+	{"HW_CM1", NULL, "HW_CM1_CH8"},
+	{"HW_CM1", NULL, "HW_CM1_CH9"},
+	{"HW_CM1", NULL, "HW_CM1_CH10"},
+	{"HW_CM1", NULL, "HW_CM1_CH11"},
+	{"HW_CM1", NULL, "HW_CM1_CH12"},
+	{"HW_CM1_CH1", "TDM_IN_CH1 Switch", "TDM IN"},
+	{"HW_CM1_CH2", "TDM_IN_CH2 Switch", "TDM IN"},
+	{"HW_CM1_CH3", "TDM_IN_CH3 Switch", "TDM IN"},
+	{"HW_CM1_CH4", "TDM_IN_CH4 Switch", "TDM IN"},
+	{"HW_CM1_CH5", "TDM_IN_CH5 Switch", "TDM IN"},
+	{"HW_CM1_CH6", "TDM_IN_CH6 Switch", "TDM IN"},
+	{"HW_CM1_CH7", "TDM_IN_CH7 Switch", "TDM IN"},
+	{"HW_CM1_CH8", "TDM_IN_CH8 Switch", "TDM IN"},
+	{"HW_CM1_CH9", "DL1_CH1 Switch", "Hostless_UL5 UL"},
+	{"HW_CM1_CH10", "DL1_CH2 Switch", "Hostless_UL5 UL"},
+
+	{"HW_CM1_CH3", "DL1_CH1 Switch", "Hostless_UL5 UL"},
+	{"HW_CM1_CH4", "DL1_CH2 Switch", "Hostless_UL5 UL"},
+
+	{"HW_CM1_CH3", "DL3_CH1 Switch", "Hostless_UL5 UL"},
+	{"HW_CM1_CH4", "DL3_CH2 Switch", "Hostless_UL5 UL"},
+
+	{"HW_CM1_CH5", "HW_SRC1_OUT_CH1 Switch", "HW_SRC_1_Out"},
+	{"HW_CM1_CH6", "HW_SRC1_OUT_CH2 Switch", "HW_SRC_1_Out"},
+
+	{"HW_CM1_CH9", "DL12_CH1 Switch", "Hostless_UL5 UL"},
+	{"HW_CM1_CH10", "DL12_CH2 Switch", "Hostless_UL5 UL"},
+	{"HW_CM1_CH11", "DL12_CH3 Switch", "Hostless_UL5 UL"},
+	{"HW_CM1_CH12", "DL12_CH4 Switch", "Hostless_UL5 UL"},
+
+	{"Hostless_UL5 UL", NULL, "UL5_VIRTUAL_INPUT"},
+
+	{"UL6", NULL, "UL6_CH1"},
+	{"UL6", NULL, "UL6_CH2"},
+
+	{"UL6_CH1", "ADDA_UL_CH1 Switch", "ADDA_UL_Mux"},
+	{"UL6_CH2", "ADDA_UL_CH2 Switch", "ADDA_UL_Mux"},
+	{"UL6_CH1", "DL1_CH1 Switch", "Hostless_UL6 UL"},
+	{"UL6_CH2", "DL1_CH2 Switch", "Hostless_UL6 UL"},
+	{"UL6_CH1", "DL2_CH1 Switch", "Hostless_UL6 UL"},
+	{"UL6_CH2", "DL2_CH2 Switch", "Hostless_UL6 UL"},
+	{"UL6_CH1", "DL12_CH1 Switch", "Hostless_UL6 UL"},
+	{"UL6_CH2", "DL12_CH2 Switch", "Hostless_UL6 UL"},
+	{"UL6_CH1", "DL6_CH1 Switch", "Hostless_UL6 UL"},
+	{"UL6_CH2", "DL6_CH2 Switch", "Hostless_UL6 UL"},
+	{"UL6_CH1", "DL3_CH1 Switch", "Hostless_UL6 UL"},
+	{"UL6_CH2", "DL3_CH2 Switch", "Hostless_UL6 UL"},
+	{"UL6_CH1", "DL4_CH1 Switch", "Hostless_UL6 UL"},
+	{"UL6_CH2", "DL4_CH2 Switch", "Hostless_UL6 UL"},
+	{"Hostless_UL6 UL", NULL, "UL6_VIRTUAL_INPUT"},
+	{"UL6_CH1", "PCM_1_CAP_CH1 Switch", "PCM 1 Capture"},
+	{"UL6_CH2", "PCM_1_CAP_CH2 Switch", "PCM 1 Capture"},
+	{"UL6_CH1", "GAIN1_OUT_CH1 Switch", "HW Gain 1 Out"},
+	{"UL6_CH2", "GAIN1_OUT_CH2 Switch", "HW Gain 1 Out"},
+
+	{"UL7", NULL, "UL7_CH1"},
+	{"UL7", NULL, "UL7_CH2"},
+	{"UL7_CH1", "ADDA_UL_CH1 Switch", "ADDA_UL_Mux"},
+	{"UL7_CH2", "ADDA_UL_CH2 Switch", "ADDA_UL_Mux"},
+	{"UL7_CH1", "HW_GAIN2_OUT_CH1 Switch", "HW Gain 2 Out"},
+	{"UL7_CH2", "HW_GAIN2_OUT_CH2 Switch", "HW Gain 2 Out"},
+	{"UL7_CH1", "HW_SRC_2_OUT_CH1 Switch", "HW_SRC_2_Out"},
+	{"UL7_CH2", "HW_SRC_2_OUT_CH2 Switch", "HW_SRC_2_Out"},
+
+	{"UL8", NULL, "UL8_CH1"},
+	{"UL8", NULL, "UL8_CH2"},
+	{"UL8_CH1", "ADDA_UL_CH1 Switch", "ADDA_UL_Mux"},
+	{"UL8_CH2", "ADDA_UL_CH2 Switch", "ADDA_UL_Mux"},
+
+	{"HW_GAIN2_IN_CH1", "ADDA_UL_CH1 Switch", "ADDA_UL_Mux"},
+	{"HW_GAIN2_IN_CH2", "ADDA_UL_CH2 Switch", "ADDA_UL_Mux"},
+};
+
+static const struct mtk_base_memif_data memif_data[MT8186_MEMIF_NUM] = {
+	[MT8186_MEMIF_DL1] = {
+		.name = "DL1",
+		.id = MT8186_MEMIF_DL1,
+		.reg_ofs_base = AFE_DL1_BASE,
+		.reg_ofs_cur = AFE_DL1_CUR,
+		.reg_ofs_end = AFE_DL1_END,
+		.reg_ofs_base_msb = AFE_DL1_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL1_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL1_END_MSB,
+		.fs_reg = AFE_DL1_CON0,
+		.fs_shift = DL1_MODE_SFT,
+		.fs_maskbit = DL1_MODE_MASK,
+		.mono_reg = AFE_DL1_CON0,
+		.mono_shift = DL1_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DL1_ON_SFT,
+		.hd_reg = AFE_DL1_CON0,
+		.hd_shift = DL1_HD_MODE_SFT,
+		.hd_align_reg = AFE_DL1_CON0,
+		.hd_align_mshift = DL1_HALIGN_SFT,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = -1,
+		.msb_reg = -1,
+		.msb_shift = -1,
+		.pbuf_reg = AFE_DL1_CON0,
+		.pbuf_mask = DL1_PBUF_SIZE_MASK,
+		.pbuf_shift = DL1_PBUF_SIZE_SFT,
+		.minlen_reg = AFE_DL1_CON0,
+		.minlen_mask = DL1_MINLEN_MASK,
+		.minlen_shift = DL1_MINLEN_SFT,
+	},
+	[MT8186_MEMIF_DL12] = {
+		.name = "DL12",
+		.id = MT8186_MEMIF_DL12,
+		.reg_ofs_base = AFE_DL12_BASE,
+		.reg_ofs_cur = AFE_DL12_CUR,
+		.reg_ofs_end = AFE_DL12_END,
+		.reg_ofs_base_msb = AFE_DL12_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL12_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL12_END_MSB,
+		.fs_reg = AFE_DL12_CON0,
+		.fs_shift = DL12_MODE_SFT,
+		.fs_maskbit = DL12_MODE_MASK,
+		.mono_reg = AFE_DL12_CON0,
+		.mono_shift = DL12_MONO_SFT,
+		.quad_ch_reg = AFE_DL12_CON0,
+		.quad_ch_mask = DL12_4CH_EN_MASK,
+		.quad_ch_shift = DL12_4CH_EN_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DL12_ON_SFT,
+		.hd_reg = AFE_DL12_CON0,
+		.hd_shift = DL12_HD_MODE_SFT,
+		.hd_align_reg = AFE_DL12_CON0,
+		.hd_align_mshift = DL12_HALIGN_SFT,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = -1,
+		.msb_reg = -1,
+		.msb_shift = -1,
+		.pbuf_reg = AFE_DL12_CON0,
+		.pbuf_mask = DL12_PBUF_SIZE_MASK,
+		.pbuf_shift = DL12_PBUF_SIZE_SFT,
+		.minlen_reg = AFE_DL12_CON0,
+		.minlen_mask = DL12_MINLEN_MASK,
+		.minlen_shift = DL12_MINLEN_SFT,
+	},
+	[MT8186_MEMIF_DL2] = {
+		.name = "DL2",
+		.id = MT8186_MEMIF_DL2,
+		.reg_ofs_base = AFE_DL2_BASE,
+		.reg_ofs_cur = AFE_DL2_CUR,
+		.reg_ofs_end = AFE_DL2_END,
+		.reg_ofs_base_msb = AFE_DL2_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL2_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL2_END_MSB,
+		.fs_reg = AFE_DL2_CON0,
+		.fs_shift = DL2_MODE_SFT,
+		.fs_maskbit = DL2_MODE_MASK,
+		.mono_reg = AFE_DL2_CON0,
+		.mono_shift = DL2_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DL2_ON_SFT,
+		.hd_reg = AFE_DL2_CON0,
+		.hd_shift = DL2_HD_MODE_SFT,
+		.hd_align_reg = AFE_DL2_CON0,
+		.hd_align_mshift = DL2_HALIGN_SFT,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = -1,
+		.msb_reg = -1,
+		.msb_shift = -1,
+		.pbuf_reg = AFE_DL2_CON0,
+		.pbuf_mask = DL2_PBUF_SIZE_MASK,
+		.pbuf_shift = DL2_PBUF_SIZE_SFT,
+		.minlen_reg = AFE_DL2_CON0,
+		.minlen_mask = DL2_MINLEN_MASK,
+		.minlen_shift = DL2_MINLEN_SFT,
+	},
+	[MT8186_MEMIF_DL3] = {
+		.name = "DL3",
+		.id = MT8186_MEMIF_DL3,
+		.reg_ofs_base = AFE_DL3_BASE,
+		.reg_ofs_cur = AFE_DL3_CUR,
+		.reg_ofs_end = AFE_DL3_END,
+		.reg_ofs_base_msb = AFE_DL3_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL3_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL3_END_MSB,
+		.fs_reg = AFE_DL3_CON0,
+		.fs_shift = DL3_MODE_SFT,
+		.fs_maskbit = DL3_MODE_MASK,
+		.mono_reg = AFE_DL3_CON0,
+		.mono_shift = DL3_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DL3_ON_SFT,
+		.hd_reg = AFE_DL3_CON0,
+		.hd_shift = DL3_HD_MODE_SFT,
+		.hd_align_reg = AFE_DL3_CON0,
+		.hd_align_mshift = DL3_HALIGN_SFT,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = -1,
+		.msb_reg = -1,
+		.msb_shift = -1,
+		.pbuf_reg = AFE_DL3_CON0,
+		.pbuf_mask = DL3_PBUF_SIZE_MASK,
+		.pbuf_shift = DL3_PBUF_SIZE_SFT,
+		.minlen_reg = AFE_DL3_CON0,
+		.minlen_mask = DL3_MINLEN_MASK,
+		.minlen_shift = DL3_MINLEN_SFT,
+	},
+	[MT8186_MEMIF_DL4] = {
+		.name = "DL4",
+		.id = MT8186_MEMIF_DL4,
+		.reg_ofs_base = AFE_DL4_BASE,
+		.reg_ofs_cur = AFE_DL4_CUR,
+		.reg_ofs_end = AFE_DL4_END,
+		.reg_ofs_base_msb = AFE_DL4_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL4_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL4_END_MSB,
+		.fs_reg = AFE_DL4_CON0,
+		.fs_shift = DL4_MODE_SFT,
+		.fs_maskbit = DL4_MODE_MASK,
+		.mono_reg = AFE_DL4_CON0,
+		.mono_shift = DL4_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DL4_ON_SFT,
+		.hd_reg = AFE_DL4_CON0,
+		.hd_shift = DL4_HD_MODE_SFT,
+		.hd_align_reg = AFE_DL4_CON0,
+		.hd_align_mshift = DL4_HALIGN_SFT,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = -1,
+		.msb_reg = -1,
+		.msb_shift = -1,
+		.pbuf_reg = AFE_DL4_CON0,
+		.pbuf_mask = DL4_PBUF_SIZE_MASK,
+		.pbuf_shift = DL4_PBUF_SIZE_SFT,
+		.minlen_reg = AFE_DL4_CON0,
+		.minlen_mask = DL4_MINLEN_MASK,
+		.minlen_shift = DL4_MINLEN_SFT,
+	},
+	[MT8186_MEMIF_DL5] = {
+		.name = "DL5",
+		.id = MT8186_MEMIF_DL5,
+		.reg_ofs_base = AFE_DL5_BASE,
+		.reg_ofs_cur = AFE_DL5_CUR,
+		.reg_ofs_end = AFE_DL5_END,
+		.reg_ofs_base_msb = AFE_DL5_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL5_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL5_END_MSB,
+		.fs_reg = AFE_DL5_CON0,
+		.fs_shift = DL5_MODE_SFT,
+		.fs_maskbit = DL5_MODE_MASK,
+		.mono_reg = AFE_DL5_CON0,
+		.mono_shift = DL5_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DL5_ON_SFT,
+		.hd_reg = AFE_DL5_CON0,
+		.hd_shift = DL5_HD_MODE_SFT,
+		.hd_align_reg = AFE_DL5_CON0,
+		.hd_align_mshift = DL5_HALIGN_SFT,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = -1,
+		.msb_reg = -1,
+		.msb_shift = -1,
+		.pbuf_reg = AFE_DL5_CON0,
+		.pbuf_mask = DL5_PBUF_SIZE_MASK,
+		.pbuf_shift = DL5_PBUF_SIZE_SFT,
+		.minlen_reg = AFE_DL5_CON0,
+		.minlen_mask = DL5_MINLEN_MASK,
+		.minlen_shift = DL5_MINLEN_SFT,
+	},
+	[MT8186_MEMIF_DL6] = {
+		.name = "DL6",
+		.id = MT8186_MEMIF_DL6,
+		.reg_ofs_base = AFE_DL6_BASE,
+		.reg_ofs_cur = AFE_DL6_CUR,
+		.reg_ofs_end = AFE_DL6_END,
+		.reg_ofs_base_msb = AFE_DL6_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL6_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL6_END_MSB,
+		.fs_reg = AFE_DL6_CON0,
+		.fs_shift = DL6_MODE_SFT,
+		.fs_maskbit = DL6_MODE_MASK,
+		.mono_reg = AFE_DL6_CON0,
+		.mono_shift = DL6_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DL6_ON_SFT,
+		.hd_reg = AFE_DL6_CON0,
+		.hd_shift = DL6_HD_MODE_SFT,
+		.hd_align_reg = AFE_DL6_CON0,
+		.hd_align_mshift = DL6_HALIGN_SFT,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = -1,
+		.msb_reg = -1,
+		.msb_shift = -1,
+		.pbuf_reg = AFE_DL6_CON0,
+		.pbuf_mask = DL6_PBUF_SIZE_MASK,
+		.pbuf_shift = DL6_PBUF_SIZE_SFT,
+		.minlen_reg = AFE_DL6_CON0,
+		.minlen_mask = DL6_MINLEN_MASK,
+		.minlen_shift = DL6_MINLEN_SFT,
+	},
+	[MT8186_MEMIF_DL7] = {
+		.name = "DL7",
+		.id = MT8186_MEMIF_DL7,
+		.reg_ofs_base = AFE_DL7_BASE,
+		.reg_ofs_cur = AFE_DL7_CUR,
+		.reg_ofs_end = AFE_DL7_END,
+		.reg_ofs_base_msb = AFE_DL7_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL7_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL7_END_MSB,
+		.fs_reg = AFE_DL7_CON0,
+		.fs_shift = DL7_MODE_SFT,
+		.fs_maskbit = DL7_MODE_MASK,
+		.mono_reg = AFE_DL7_CON0,
+		.mono_shift = DL7_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DL7_ON_SFT,
+		.hd_reg = AFE_DL7_CON0,
+		.hd_shift = DL7_HD_MODE_SFT,
+		.hd_align_reg = AFE_DL7_CON0,
+		.hd_align_mshift = DL7_HALIGN_SFT,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = -1,
+		.msb_reg = -1,
+		.msb_shift = -1,
+		.pbuf_reg = AFE_DL7_CON0,
+		.pbuf_mask = DL7_PBUF_SIZE_MASK,
+		.pbuf_shift = DL7_PBUF_SIZE_SFT,
+		.minlen_reg = AFE_DL7_CON0,
+		.minlen_mask = DL7_MINLEN_MASK,
+		.minlen_shift = DL7_MINLEN_SFT,
+	},
+	[MT8186_MEMIF_DL8] = {
+		.name = "DL8",
+		.id = MT8186_MEMIF_DL8,
+		.reg_ofs_base = AFE_DL8_BASE,
+		.reg_ofs_cur = AFE_DL8_CUR,
+		.reg_ofs_end = AFE_DL8_END,
+		.reg_ofs_base_msb = AFE_DL8_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_DL8_CUR_MSB,
+		.reg_ofs_end_msb = AFE_DL8_END_MSB,
+		.fs_reg = AFE_DL8_CON0,
+		.fs_shift = DL8_MODE_SFT,
+		.fs_maskbit = DL8_MODE_MASK,
+		.mono_reg = AFE_DL8_CON0,
+		.mono_shift = DL8_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = DL8_ON_SFT,
+		.hd_reg = AFE_DL8_CON0,
+		.hd_shift = DL8_HD_MODE_SFT,
+		.hd_align_reg = AFE_DL8_CON0,
+		.hd_align_mshift = DL8_HALIGN_SFT,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = -1,
+		.msb_reg = -1,
+		.msb_shift = -1,
+		.pbuf_reg = AFE_DL8_CON0,
+		.pbuf_mask = DL8_PBUF_SIZE_MASK,
+		.pbuf_shift = DL8_PBUF_SIZE_SFT,
+		.minlen_reg = AFE_DL8_CON0,
+		.minlen_mask = DL8_MINLEN_MASK,
+		.minlen_shift = DL8_MINLEN_SFT,
+	},
+	[MT8186_MEMIF_VUL12] = {
+		.name = "VUL12",
+		.id = MT8186_MEMIF_VUL12,
+		.reg_ofs_base = AFE_VUL12_BASE,
+		.reg_ofs_cur = AFE_VUL12_CUR,
+		.reg_ofs_end = AFE_VUL12_END,
+		.reg_ofs_base_msb = AFE_VUL12_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_VUL12_CUR_MSB,
+		.reg_ofs_end_msb = AFE_VUL12_END_MSB,
+		.fs_reg = AFE_VUL12_CON0,
+		.fs_shift = VUL12_MODE_SFT,
+		.fs_maskbit = VUL12_MODE_MASK,
+		.mono_reg = AFE_VUL12_CON0,
+		.mono_shift = VUL12_MONO_SFT,
+		.quad_ch_reg = AFE_VUL12_CON0,
+		.quad_ch_mask = VUL12_4CH_EN_MASK,
+		.quad_ch_shift = VUL12_4CH_EN_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = VUL12_ON_SFT,
+		.hd_reg = AFE_VUL12_CON0,
+		.hd_shift = VUL12_HD_MODE_SFT,
+		.hd_align_reg = AFE_VUL12_CON0,
+		.hd_align_mshift = VUL12_HALIGN_SFT,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = -1,
+		.msb_reg = -1,
+		.msb_shift = -1,
+	},
+	[MT8186_MEMIF_VUL2] = {
+		.name = "VUL2",
+		.id = MT8186_MEMIF_VUL2,
+		.reg_ofs_base = AFE_VUL2_BASE,
+		.reg_ofs_cur = AFE_VUL2_CUR,
+		.reg_ofs_end = AFE_VUL2_END,
+		.reg_ofs_base_msb = AFE_VUL2_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_VUL2_CUR_MSB,
+		.reg_ofs_end_msb = AFE_VUL2_END_MSB,
+		.fs_reg = AFE_VUL2_CON0,
+		.fs_shift = VUL2_MODE_SFT,
+		.fs_maskbit = VUL2_MODE_MASK,
+		.mono_reg = AFE_VUL2_CON0,
+		.mono_shift = VUL2_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = VUL2_ON_SFT,
+		.hd_reg = AFE_VUL2_CON0,
+		.hd_shift = VUL2_HD_MODE_SFT,
+		.hd_align_reg = AFE_VUL2_CON0,
+		.hd_align_mshift = VUL2_HALIGN_SFT,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = -1,
+		.msb_reg = -1,
+		.msb_shift = -1,
+	},
+	[MT8186_MEMIF_AWB] = {
+		.name = "AWB",
+		.id = MT8186_MEMIF_AWB,
+		.reg_ofs_base = AFE_AWB_BASE,
+		.reg_ofs_cur = AFE_AWB_CUR,
+		.reg_ofs_end = AFE_AWB_END,
+		.reg_ofs_base_msb = AFE_AWB_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_AWB_CUR_MSB,
+		.reg_ofs_end_msb = AFE_AWB_END_MSB,
+		.fs_reg = AFE_AWB_CON0,
+		.fs_shift = AWB_MODE_SFT,
+		.fs_maskbit = AWB_MODE_MASK,
+		.mono_reg = AFE_AWB_CON0,
+		.mono_shift = AWB_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = AWB_ON_SFT,
+		.hd_reg = AFE_AWB_CON0,
+		.hd_shift = AWB_HD_MODE_SFT,
+		.hd_align_reg = AFE_AWB_CON0,
+		.hd_align_mshift = AWB_HALIGN_SFT,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = -1,
+		.msb_reg = -1,
+		.msb_shift = -1,
+	},
+	[MT8186_MEMIF_AWB2] = {
+		.name = "AWB2",
+		.id = MT8186_MEMIF_AWB2,
+		.reg_ofs_base = AFE_AWB2_BASE,
+		.reg_ofs_cur = AFE_AWB2_CUR,
+		.reg_ofs_end = AFE_AWB2_END,
+		.reg_ofs_base_msb = AFE_AWB2_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_AWB2_CUR_MSB,
+		.reg_ofs_end_msb = AFE_AWB2_END_MSB,
+		.fs_reg = AFE_AWB2_CON0,
+		.fs_shift = AWB2_MODE_SFT,
+		.fs_maskbit = AWB2_MODE_MASK,
+		.mono_reg = AFE_AWB2_CON0,
+		.mono_shift = AWB2_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = AWB2_ON_SFT,
+		.hd_reg = AFE_AWB2_CON0,
+		.hd_shift = AWB2_HD_MODE_SFT,
+		.hd_align_reg = AFE_AWB2_CON0,
+		.hd_align_mshift = AWB2_HALIGN_SFT,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = -1,
+		.msb_reg = -1,
+		.msb_shift = -1,
+	},
+	[MT8186_MEMIF_VUL3] = {
+		.name = "VUL3",
+		.id = MT8186_MEMIF_VUL3,
+		.reg_ofs_base = AFE_VUL3_BASE,
+		.reg_ofs_cur = AFE_VUL3_CUR,
+		.reg_ofs_end = AFE_VUL3_END,
+		.reg_ofs_base_msb = AFE_VUL3_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_VUL3_CUR_MSB,
+		.reg_ofs_end_msb = AFE_VUL3_END_MSB,
+		.fs_reg = AFE_VUL3_CON0,
+		.fs_shift = VUL3_MODE_SFT,
+		.fs_maskbit = VUL3_MODE_MASK,
+		.mono_reg = AFE_VUL3_CON0,
+		.mono_shift = VUL3_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = VUL3_ON_SFT,
+		.hd_reg = AFE_VUL3_CON0,
+		.hd_shift = VUL3_HD_MODE_SFT,
+		.hd_align_reg = AFE_VUL3_CON0,
+		.hd_align_mshift = VUL3_HALIGN_SFT,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = -1,
+		.msb_reg = -1,
+		.msb_shift = -1,
+	},
+	[MT8186_MEMIF_VUL4] = {
+		.name = "VUL4",
+		.id = MT8186_MEMIF_VUL4,
+		.reg_ofs_base = AFE_VUL4_BASE,
+		.reg_ofs_cur = AFE_VUL4_CUR,
+		.reg_ofs_end = AFE_VUL4_END,
+		.reg_ofs_base_msb = AFE_VUL4_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_VUL4_CUR_MSB,
+		.reg_ofs_end_msb = AFE_VUL4_END_MSB,
+		.fs_reg = AFE_VUL4_CON0,
+		.fs_shift = VUL4_MODE_SFT,
+		.fs_maskbit = VUL4_MODE_MASK,
+		.mono_reg = AFE_VUL4_CON0,
+		.mono_shift = VUL4_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = VUL4_ON_SFT,
+		.hd_reg = AFE_VUL4_CON0,
+		.hd_shift = VUL4_HD_MODE_SFT,
+		.hd_align_reg = AFE_VUL4_CON0,
+		.hd_align_mshift = VUL4_HALIGN_SFT,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = -1,
+		.msb_reg = -1,
+		.msb_shift = -1,
+	},
+	[MT8186_MEMIF_VUL5] = {
+		.name = "VUL5",
+		.id = MT8186_MEMIF_VUL5,
+		.reg_ofs_base = AFE_VUL5_BASE,
+		.reg_ofs_cur = AFE_VUL5_CUR,
+		.reg_ofs_end = AFE_VUL5_END,
+		.reg_ofs_base_msb = AFE_VUL5_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_VUL5_CUR_MSB,
+		.reg_ofs_end_msb = AFE_VUL5_END_MSB,
+		.fs_reg = AFE_VUL5_CON0,
+		.fs_shift = VUL5_MODE_SFT,
+		.fs_maskbit = VUL5_MODE_MASK,
+		.mono_reg = AFE_VUL5_CON0,
+		.mono_shift = VUL5_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = VUL5_ON_SFT,
+		.hd_reg = AFE_VUL5_CON0,
+		.hd_shift = VUL5_HD_MODE_SFT,
+		.hd_align_reg = AFE_VUL5_CON0,
+		.hd_align_mshift = VUL5_HALIGN_SFT,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = -1,
+		.msb_reg = -1,
+		.msb_shift = -1,
+	},
+	[MT8186_MEMIF_VUL6] = {
+		.name = "VUL6",
+		.id = MT8186_MEMIF_VUL6,
+		.reg_ofs_base = AFE_VUL6_BASE,
+		.reg_ofs_cur = AFE_VUL6_CUR,
+		.reg_ofs_end = AFE_VUL6_END,
+		.reg_ofs_base_msb = AFE_VUL6_BASE_MSB,
+		.reg_ofs_cur_msb = AFE_VUL6_CUR_MSB,
+		.reg_ofs_end_msb = AFE_VUL6_END_MSB,
+		.fs_reg = AFE_VUL6_CON0,
+		.fs_shift = VUL6_MODE_SFT,
+		.fs_maskbit = VUL6_MODE_MASK,
+		.mono_reg = AFE_VUL6_CON0,
+		.mono_shift = VUL6_MONO_SFT,
+		.enable_reg = AFE_DAC_CON0,
+		.enable_shift = VUL6_ON_SFT,
+		.hd_reg = AFE_VUL6_CON0,
+		.hd_shift = VUL6_HD_MODE_SFT,
+		.hd_align_reg = AFE_VUL6_CON0,
+		.hd_align_mshift = VUL6_HALIGN_SFT,
+		.agent_disable_reg = -1,
+		.agent_disable_shift = -1,
+		.msb_reg = -1,
+		.msb_shift = -1,
+	},
+};
+
+static const struct mtk_base_irq_data irq_data[MT8186_IRQ_NUM] = {
+	[MT8186_IRQ_0] = {
+		.id = MT8186_IRQ_0,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT0,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON1,
+		.irq_fs_shift = IRQ0_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ0_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ0_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ0_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_1] = {
+		.id = MT8186_IRQ_1,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT1,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON1,
+		.irq_fs_shift = IRQ1_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ1_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ1_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ1_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_2] = {
+		.id = MT8186_IRQ_2,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT2,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON1,
+		.irq_fs_shift = IRQ2_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ2_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ2_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ2_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_3] = {
+		.id = MT8186_IRQ_3,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT3,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON1,
+		.irq_fs_shift = IRQ3_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ3_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ3_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ3_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_4] = {
+		.id = MT8186_IRQ_4,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT4,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON1,
+		.irq_fs_shift = IRQ4_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ4_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ4_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ4_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_5] = {
+		.id = MT8186_IRQ_5,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT5,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON1,
+		.irq_fs_shift = IRQ5_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ5_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ5_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ5_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_6] = {
+		.id = MT8186_IRQ_6,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT6,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON1,
+		.irq_fs_shift = IRQ6_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ6_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ6_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ6_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_7] = {
+		.id = MT8186_IRQ_7,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT7,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON1,
+		.irq_fs_shift = IRQ7_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ7_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ7_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ7_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_8] = {
+		.id = MT8186_IRQ_8,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT8,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON2,
+		.irq_fs_shift = IRQ8_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ8_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ8_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ8_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_9] = {
+		.id = MT8186_IRQ_9,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT9,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON2,
+		.irq_fs_shift = IRQ9_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ9_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ9_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ9_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_10] = {
+		.id = MT8186_IRQ_10,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT10,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON2,
+		.irq_fs_shift = IRQ10_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ10_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ10_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ10_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_11] = {
+		.id = MT8186_IRQ_11,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT11,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON2,
+		.irq_fs_shift = IRQ11_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ11_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ11_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ11_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_12] = {
+		.id = MT8186_IRQ_12,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT12,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON2,
+		.irq_fs_shift = IRQ12_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ12_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ12_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ12_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_13] = {
+		.id = MT8186_IRQ_13,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT13,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON2,
+		.irq_fs_shift = IRQ13_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ13_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ13_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ13_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_14] = {
+		.id = MT8186_IRQ_14,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT14,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON2,
+		.irq_fs_shift = IRQ14_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ14_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ14_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ14_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_15] = {
+		.id = MT8186_IRQ_15,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT15,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON2,
+		.irq_fs_shift = IRQ15_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ15_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ15_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ15_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_16] = {
+		.id = MT8186_IRQ_16,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT16,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON3,
+		.irq_fs_shift = IRQ16_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ16_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ16_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ16_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_17] = {
+		.id = MT8186_IRQ_17,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT17,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON3,
+		.irq_fs_shift = IRQ17_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ17_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ17_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ17_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_18] = {
+		.id = MT8186_IRQ_18,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT18,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON3,
+		.irq_fs_shift = IRQ18_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ18_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ18_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ18_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_19] = {
+		.id = MT8186_IRQ_19,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT19,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON3,
+		.irq_fs_shift = IRQ19_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ19_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ19_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ19_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_20] = {
+		.id = MT8186_IRQ_20,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT20,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON3,
+		.irq_fs_shift = IRQ20_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ20_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ20_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ20_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_21] = {
+		.id = MT8186_IRQ_21,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT21,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON3,
+		.irq_fs_shift = IRQ21_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ21_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ21_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ21_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_22] = {
+		.id = MT8186_IRQ_22,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT22,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON3,
+		.irq_fs_shift = IRQ22_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ22_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ22_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ22_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_23] = {
+		.id = MT8186_IRQ_23,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT23,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON3,
+		.irq_fs_shift = IRQ23_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ23_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ23_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ23_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_24] = {
+		.id = MT8186_IRQ_24,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT24,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON4,
+		.irq_fs_shift = IRQ24_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ24_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ24_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ24_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_25] = {
+		.id = MT8186_IRQ_25,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT25,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON4,
+		.irq_fs_shift = IRQ25_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ25_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ25_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ25_MCU_CLR_SFT,
+	},
+	[MT8186_IRQ_26] = {
+		.id = MT8186_IRQ_26,
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT26,
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT,
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK,
+		.irq_fs_reg = AFE_IRQ_MCU_CON4,
+		.irq_fs_shift = IRQ26_MCU_MODE_SFT,
+		.irq_fs_maskbit = IRQ26_MCU_MODE_MASK,
+		.irq_en_reg = AFE_IRQ_MCU_CON0,
+		.irq_en_shift = IRQ26_MCU_ON_SFT,
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,
+		.irq_clr_shift = IRQ26_MCU_CLR_SFT,
+	},
+};
+
+static const int memif_irq_usage[MT8186_MEMIF_NUM] = {
+	/* TODO: verify each memif & irq */
+	[MT8186_MEMIF_DL1] = MT8186_IRQ_0,
+	[MT8186_MEMIF_DL2] = MT8186_IRQ_1,
+	[MT8186_MEMIF_DL3] = MT8186_IRQ_2,
+	[MT8186_MEMIF_DL4] = MT8186_IRQ_3,
+	[MT8186_MEMIF_DL5] = MT8186_IRQ_4,
+	[MT8186_MEMIF_DL6] = MT8186_IRQ_5,
+	[MT8186_MEMIF_DL7] = MT8186_IRQ_6,
+	[MT8186_MEMIF_DL8] = MT8186_IRQ_7,
+	[MT8186_MEMIF_DL12] = MT8186_IRQ_9,
+	[MT8186_MEMIF_VUL12] = MT8186_IRQ_10,
+	[MT8186_MEMIF_VUL2] = MT8186_IRQ_11,
+	[MT8186_MEMIF_AWB] = MT8186_IRQ_12,
+	[MT8186_MEMIF_AWB2] = MT8186_IRQ_13,
+	[MT8186_MEMIF_VUL3] = MT8186_IRQ_14,
+	[MT8186_MEMIF_VUL4] = MT8186_IRQ_15,
+	[MT8186_MEMIF_VUL5] = MT8186_IRQ_16,
+	[MT8186_MEMIF_VUL6] = MT8186_IRQ_17,
+};
+
+static bool mt8186_is_volatile_reg(struct device *dev, unsigned int reg)
+{
+	/* these auto-gen reg has read-only bit, so put it as volatile */
+	/* volatile reg cannot be cached, so cannot be set when power off */
+	switch (reg) {
+	case AUDIO_TOP_CON0:	/* reg bit controlled by CCF */
+	case AUDIO_TOP_CON1:	/* reg bit controlled by CCF */
+	case AUDIO_TOP_CON2:
+	case AUDIO_TOP_CON3:
+	case AFE_DL1_CUR_MSB:
+	case AFE_DL1_CUR:
+	case AFE_DL1_END:
+	case AFE_DL2_CUR_MSB:
+	case AFE_DL2_CUR:
+	case AFE_DL2_END:
+	case AFE_DL3_CUR_MSB:
+	case AFE_DL3_CUR:
+	case AFE_DL3_END:
+	case AFE_DL4_CUR_MSB:
+	case AFE_DL4_CUR:
+	case AFE_DL4_END:
+	case AFE_DL12_CUR_MSB:
+	case AFE_DL12_CUR:
+	case AFE_DL12_END:
+	case AFE_ADDA_SRC_DEBUG_MON0:
+	case AFE_ADDA_SRC_DEBUG_MON1:
+	case AFE_ADDA_UL_SRC_MON0:
+	case AFE_ADDA_UL_SRC_MON1:
+	case AFE_SECURE_CON0:
+	case AFE_SRAM_BOUND:
+	case AFE_SECURE_CON1:
+	case AFE_VUL_CUR_MSB:
+	case AFE_VUL_CUR:
+	case AFE_VUL_END:
+	case AFE_SIDETONE_MON:
+	case AFE_SIDETONE_CON0:
+	case AFE_SIDETONE_COEFF:
+	case AFE_VUL2_CUR_MSB:
+	case AFE_VUL2_CUR:
+	case AFE_VUL2_END:
+	case AFE_VUL3_CUR_MSB:
+	case AFE_VUL3_CUR:
+	case AFE_VUL3_END:
+	case AFE_I2S_MON:
+	case AFE_DAC_MON:
+	case AFE_IRQ0_MCU_CNT_MON:
+	case AFE_IRQ6_MCU_CNT_MON:
+	case AFE_VUL4_CUR_MSB:
+	case AFE_VUL4_CUR:
+	case AFE_VUL4_END:
+	case AFE_VUL12_CUR_MSB:
+	case AFE_VUL12_CUR:
+	case AFE_VUL12_END:
+	case AFE_IRQ3_MCU_CNT_MON:
+	case AFE_IRQ4_MCU_CNT_MON:
+	case AFE_IRQ_MCU_STATUS:
+	case AFE_IRQ_MCU_CLR:
+	case AFE_IRQ_MCU_MON2:
+	case AFE_IRQ1_MCU_CNT_MON:
+	case AFE_IRQ2_MCU_CNT_MON:
+	case AFE_IRQ5_MCU_CNT_MON:
+	case AFE_IRQ7_MCU_CNT_MON:
+	case AFE_IRQ_MCU_MISS_CLR:
+	case AFE_GAIN1_CUR:
+	case AFE_GAIN2_CUR:
+	case AFE_SRAM_DELSEL_CON1:
+	case PCM_INTF_CON2:
+	case FPGA_CFG0:
+	case FPGA_CFG1:
+	case FPGA_CFG2:
+	case FPGA_CFG3:
+	case AUDIO_TOP_DBG_MON0:
+	case AUDIO_TOP_DBG_MON1:
+	case AFE_IRQ8_MCU_CNT_MON:
+	case AFE_IRQ11_MCU_CNT_MON:
+	case AFE_IRQ12_MCU_CNT_MON:
+	case AFE_IRQ9_MCU_CNT_MON:
+	case AFE_IRQ10_MCU_CNT_MON:
+	case AFE_IRQ13_MCU_CNT_MON:
+	case AFE_IRQ14_MCU_CNT_MON:
+	case AFE_IRQ15_MCU_CNT_MON:
+	case AFE_IRQ16_MCU_CNT_MON:
+	case AFE_IRQ17_MCU_CNT_MON:
+	case AFE_IRQ18_MCU_CNT_MON:
+	case AFE_IRQ19_MCU_CNT_MON:
+	case AFE_IRQ20_MCU_CNT_MON:
+	case AFE_IRQ21_MCU_CNT_MON:
+	case AFE_IRQ22_MCU_CNT_MON:
+	case AFE_IRQ23_MCU_CNT_MON:
+	case AFE_IRQ24_MCU_CNT_MON:
+	case AFE_IRQ25_MCU_CNT_MON:
+	case AFE_IRQ26_MCU_CNT_MON:
+	case AFE_IRQ31_MCU_CNT_MON:
+	case AFE_CBIP_MON0:
+	case AFE_CBIP_SLV_MUX_MON0:
+	case AFE_CBIP_SLV_DECODER_MON0:
+	case AFE_ADDA6_MTKAIF_MON0:
+	case AFE_ADDA6_MTKAIF_MON1:
+	case AFE_AWB_CUR_MSB:
+	case AFE_AWB_CUR:
+	case AFE_AWB_END:
+	case AFE_AWB2_CUR_MSB:
+	case AFE_AWB2_CUR:
+	case AFE_AWB2_END:
+	case AFE_DAI_CUR_MSB:
+	case AFE_DAI_CUR:
+	case AFE_DAI_END:
+	case AFE_DAI2_CUR_MSB:
+	case AFE_DAI2_CUR:
+	case AFE_DAI2_END:
+	case AFE_ADDA6_SRC_DEBUG_MON0:
+	case AFE_ADD6A_UL_SRC_MON0:
+	case AFE_ADDA6_UL_SRC_MON1:
+	case AFE_MOD_DAI_CUR_MSB:
+	case AFE_MOD_DAI_CUR:
+	case AFE_MOD_DAI_END:
+	case AFE_AWB_RCH_MON:
+	case AFE_AWB_LCH_MON:
+	case AFE_VUL_RCH_MON:
+	case AFE_VUL_LCH_MON:
+	case AFE_VUL12_RCH_MON:
+	case AFE_VUL12_LCH_MON:
+	case AFE_VUL2_RCH_MON:
+	case AFE_VUL2_LCH_MON:
+	case AFE_DAI_DATA_MON:
+	case AFE_MOD_DAI_DATA_MON:
+	case AFE_DAI2_DATA_MON:
+	case AFE_AWB2_RCH_MON:
+	case AFE_AWB2_LCH_MON:
+	case AFE_VUL3_RCH_MON:
+	case AFE_VUL3_LCH_MON:
+	case AFE_VUL4_RCH_MON:
+	case AFE_VUL4_LCH_MON:
+	case AFE_VUL5_RCH_MON:
+	case AFE_VUL5_LCH_MON:
+	case AFE_VUL6_RCH_MON:
+	case AFE_VUL6_LCH_MON:
+	case AFE_DL1_RCH_MON:
+	case AFE_DL1_LCH_MON:
+	case AFE_DL2_RCH_MON:
+	case AFE_DL2_LCH_MON:
+	case AFE_DL12_RCH1_MON:
+	case AFE_DL12_LCH1_MON:
+	case AFE_DL12_RCH2_MON:
+	case AFE_DL12_LCH2_MON:
+	case AFE_DL3_RCH_MON:
+	case AFE_DL3_LCH_MON:
+	case AFE_DL4_RCH_MON:
+	case AFE_DL4_LCH_MON:
+	case AFE_DL5_RCH_MON:
+	case AFE_DL5_LCH_MON:
+	case AFE_DL6_RCH_MON:
+	case AFE_DL6_LCH_MON:
+	case AFE_DL7_RCH_MON:
+	case AFE_DL7_LCH_MON:
+	case AFE_DL8_RCH_MON:
+	case AFE_DL8_LCH_MON:
+	case AFE_VUL5_CUR_MSB:
+	case AFE_VUL5_CUR:
+	case AFE_VUL5_END:
+	case AFE_VUL6_CUR_MSB:
+	case AFE_VUL6_CUR:
+	case AFE_VUL6_END:
+	case AFE_ADDA_DL_SDM_FIFO_MON:
+	case AFE_ADDA_DL_SRC_LCH_MON:
+	case AFE_ADDA_DL_SRC_RCH_MON:
+	case AFE_ADDA_DL_SDM_OUT_MON:
+	case AFE_CONNSYS_I2S_MON:
+	case AFE_ASRC_2CH_CON0:
+	case AFE_ASRC_2CH_CON2:
+	case AFE_ASRC_2CH_CON3:
+	case AFE_ASRC_2CH_CON4:
+	case AFE_ASRC_2CH_CON5:
+	case AFE_ASRC_2CH_CON7:
+	case AFE_ASRC_2CH_CON8:
+	case AFE_ASRC_2CH_CON12:
+	case AFE_ASRC_2CH_CON13:
+	case AFE_ADDA_MTKAIF_MON0:
+	case AFE_ADDA_MTKAIF_MON1:
+	case AFE_AUD_PAD_TOP:
+	case AFE_DL_NLE_R_MON0:
+	case AFE_DL_NLE_R_MON1:
+	case AFE_DL_NLE_R_MON2:
+	case AFE_DL_NLE_L_MON0:
+	case AFE_DL_NLE_L_MON1:
+	case AFE_DL_NLE_L_MON2:
+	case AFE_GENERAL1_ASRC_2CH_CON0:
+	case AFE_GENERAL1_ASRC_2CH_CON2:
+	case AFE_GENERAL1_ASRC_2CH_CON3:
+	case AFE_GENERAL1_ASRC_2CH_CON4:
+	case AFE_GENERAL1_ASRC_2CH_CON5:
+	case AFE_GENERAL1_ASRC_2CH_CON7:
+	case AFE_GENERAL1_ASRC_2CH_CON8:
+	case AFE_GENERAL1_ASRC_2CH_CON12:
+	case AFE_GENERAL1_ASRC_2CH_CON13:
+	case AFE_GENERAL2_ASRC_2CH_CON0:
+	case AFE_GENERAL2_ASRC_2CH_CON2:
+	case AFE_GENERAL2_ASRC_2CH_CON3:
+	case AFE_GENERAL2_ASRC_2CH_CON4:
+	case AFE_GENERAL2_ASRC_2CH_CON5:
+	case AFE_GENERAL2_ASRC_2CH_CON7:
+	case AFE_GENERAL2_ASRC_2CH_CON8:
+	case AFE_GENERAL2_ASRC_2CH_CON12:
+	case AFE_GENERAL2_ASRC_2CH_CON13:
+	case AFE_DL5_CUR_MSB:
+	case AFE_DL5_CUR:
+	case AFE_DL5_END:
+	case AFE_DL6_CUR_MSB:
+	case AFE_DL6_CUR:
+	case AFE_DL6_END:
+	case AFE_DL7_CUR_MSB:
+	case AFE_DL7_CUR:
+	case AFE_DL7_END:
+	case AFE_DL8_CUR_MSB:
+	case AFE_DL8_CUR:
+	case AFE_DL8_END:
+	case AFE_PROT_SIDEBAND_MON:
+	case AFE_DOMAIN_SIDEBAND0_MON:
+	case AFE_DOMAIN_SIDEBAND1_MON:
+	case AFE_DOMAIN_SIDEBAND2_MON:
+	case AFE_DOMAIN_SIDEBAND3_MON:
+	case AFE_APLL1_TUNER_CFG:	/* [20:31] is monitor */
+	case AFE_APLL2_TUNER_CFG:	/* [20:31] is monitor */
+		return true;
+	default:
+		return false;
+	};
+}
+
+static const struct regmap_config mt8186_afe_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+
+	.volatile_reg = mt8186_is_volatile_reg,
+
+	.max_register = AFE_MAX_REGISTER,
+	.num_reg_defaults_raw = AFE_MAX_REGISTER,
+
+	.cache_type = REGCACHE_FLAT,
+};
+
+static irqreturn_t mt8186_afe_irq_handler(int irq_id, void *dev)
+{
+	struct mtk_base_afe *afe = dev;
+	struct mtk_base_afe_irq *irq;
+	unsigned int status;
+	unsigned int status_mcu;
+	unsigned int mcu_en;
+	int ret;
+	int i;
+
+	/* get irq that is sent to MCU */
+	ret = regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &mcu_en);
+	if (ret) {
+		dev_err(afe->dev, "%s, get irq direction fail, ret %d", __func__, ret);
+		return ret;
+	}
+
+	ret = regmap_read(afe->regmap, AFE_IRQ_MCU_STATUS, &status);
+	/* only care IRQ which is sent to MCU */
+	status_mcu = status & mcu_en & AFE_IRQ_STATUS_BITS;
+
+	if (ret || status_mcu == 0) {
+		dev_err(afe->dev, "%s(), irq status err, ret %d, status 0x%x, mcu_en 0x%x\n",
+			__func__, ret, status, mcu_en);
+
+		goto err_irq;
+	}
+
+	for (i = 0; i < MT8186_MEMIF_NUM; i++) {
+		struct mtk_base_afe_memif *memif = &afe->memif[i];
+
+		if (!memif->substream)
+			continue;
+
+		if (memif->irq_usage < 0)
+			continue;
+
+		irq = &afe->irqs[memif->irq_usage];
+
+		if (status_mcu & (1 << irq->irq_data->irq_en_shift))
+			snd_pcm_period_elapsed(memif->substream);
+	}
+
+err_irq:
+	/* clear irq */
+	regmap_write(afe->regmap, AFE_IRQ_MCU_CLR, status_mcu);
+
+	return IRQ_HANDLED;
+}
+
+static int mt8186_afe_runtime_suspend(struct device *dev)
+{
+	struct mtk_base_afe *afe = dev_get_drvdata(dev);
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	unsigned int value = 0;
+	int ret;
+
+	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
+		goto skip_regmap;
+
+	/* disable AFE */
+	regmap_update_bits(afe->regmap, AFE_DAC_CON0, 0x1, 0x0);
+
+	ret = regmap_read_poll_timeout(afe->regmap,
+				       AFE_DAC_MON,
+				       value,
+				       (value & AFE_ON_RETM_MASK_SFT) == 0,
+				       20,
+				       1 * 1000 * 1000);
+	if (ret) {
+		dev_err(afe->dev, "%s(), ret %d\n", __func__, ret);
+		return ret;
+	}
+
+	/* make sure all irq status are cleared */
+	regmap_write(afe->regmap, AFE_IRQ_MCU_CLR, 0xffffffff);
+	regmap_write(afe->regmap, AFE_IRQ_MCU_CLR, 0xffffffff);
+
+	/* reset sgen */
+	regmap_write(afe->regmap, AFE_SINEGEN_CON0, 0x0);
+	regmap_update_bits(afe->regmap, AFE_SINEGEN_CON2,
+			   INNER_LOOP_BACK_MODE_MASK_SFT,
+			   0x3f << INNER_LOOP_BACK_MODE_SFT);
+
+	/* cache only */
+	regcache_cache_only(afe->regmap, true);
+	regcache_mark_dirty(afe->regmap);
+
+skip_regmap:
+	mt8186_afe_disable_cgs(afe);
+	mt8186_afe_disable_clock(afe);
+
+	return 0;
+}
+
+static int mt8186_afe_runtime_resume(struct device *dev)
+{
+	struct mtk_base_afe *afe = dev_get_drvdata(dev);
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	int ret;
+
+	ret = mt8186_afe_enable_clock(afe);
+	if (ret)
+		return ret;
+
+	ret = mt8186_afe_enable_cgs(afe);
+	if (ret)
+		return ret;
+
+	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
+		goto skip_regmap;
+
+	regcache_cache_only(afe->regmap, false);
+	regcache_sync(afe->regmap);
+
+	/* enable audio sys DCM for power saving */
+	regmap_update_bits(afe_priv->infracfg, PERI_BUS_DCM_CTRL, BIT(29), BIT(29));
+	regmap_update_bits(afe->regmap, AUDIO_TOP_CON0, BIT(29), BIT(29));
+
+	/* force cpu use 8_24 format when writing 32bit data */
+	regmap_update_bits(afe->regmap, AFE_MEMIF_CON0, CPU_HD_ALIGN_MASK_SFT, 0);
+
+	/* set all output port to 24bit */
+	regmap_write(afe->regmap, AFE_CONN_24BIT, 0xffffffff);
+	regmap_write(afe->regmap, AFE_CONN_24BIT_1, 0xffffffff);
+
+	/* enable AFE */
+	regmap_update_bits(afe->regmap, AFE_DAC_CON0, AUDIO_AFE_ON_MASK_SFT, BIT(0));
+
+skip_regmap:
+	return 0;
+}
+
+static int mt8186_afe_component_probe(struct snd_soc_component *component)
+{
+	mtk_afe_add_sub_dai_control(component);
+	mt8186_add_misc_control(component);
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver mt8186_afe_component = {
+	.name = AFE_PCM_NAME,
+	.pcm_construct = mtk_afe_pcm_new,
+	.pointer = mtk_afe_pcm_pointer,
+	.probe = mt8186_afe_component_probe,
+};
+
+static int mt8186_dai_memif_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+
+	dai->dai_drivers = mt8186_memif_dai_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mt8186_memif_dai_driver);
+
+	dai->controls = mt8186_pcm_kcontrols;
+	dai->num_controls = ARRAY_SIZE(mt8186_pcm_kcontrols);
+	dai->dapm_widgets = mt8186_memif_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mt8186_memif_widgets);
+	dai->dapm_routes = mt8186_memif_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mt8186_memif_routes);
+	return 0;
+}
+
+typedef int (*dai_register_cb)(struct mtk_base_afe *);
+static const dai_register_cb dai_register_cbs[] = {
+	mt8186_dai_adda_register,
+	mt8186_dai_i2s_register,
+	mt8186_dai_tdm_register,
+	mt8186_dai_hw_gain_register,
+	mt8186_dai_src_register,
+	mt8186_dai_pcm_register,
+	mt8186_dai_hostless_register,
+	mt8186_dai_memif_register,
+};
+
+static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
+{
+	struct mtk_base_afe *afe;
+	struct mt8186_afe_private *afe_priv;
+	struct resource *res;
+	struct reset_control *rstc;
+	struct device *dev = &pdev->dev;
+	int i, ret, irq_id;
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34));
+	if (ret)
+		return ret;
+
+	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
+	if (!afe)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, afe);
+
+	afe->platform_priv = devm_kzalloc(dev, sizeof(*afe_priv), GFP_KERNEL);
+	if (!afe->platform_priv)
+		return -ENOMEM;
+
+	afe_priv = afe->platform_priv;
+	afe->dev = &pdev->dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	afe->base_addr = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(afe->base_addr))
+		return PTR_ERR(afe->base_addr);
+
+	/* init audio related clock */
+	ret = mt8186_init_clock(afe);
+	if (ret) {
+		dev_err(dev, "init clock error, ret %d\n", ret);
+		return ret;
+	}
+
+	/* init memif */
+	afe->memif_32bit_supported = 0;
+	afe->memif_size = MT8186_MEMIF_NUM;
+	afe->memif = devm_kcalloc(dev, afe->memif_size, sizeof(*afe->memif),
+				  GFP_KERNEL);
+
+	if (!afe->memif)
+		return -ENOMEM;
+
+	for (i = 0; i < afe->memif_size; i++) {
+		afe->memif[i].data = &memif_data[i];
+		afe->memif[i].irq_usage = memif_irq_usage[i];
+		afe->memif[i].const_irq = 1;
+	}
+
+	mutex_init(&afe->irq_alloc_lock);	/* needed when dynamic irq */
+
+	/* init irq */
+	afe->irqs_size = MT8186_IRQ_NUM;
+	afe->irqs = devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs),
+				 GFP_KERNEL);
+
+	if (!afe->irqs)
+		return -ENOMEM;
+
+	for (i = 0; i < afe->irqs_size; i++)
+		afe->irqs[i].irq_data = &irq_data[i];
+
+	/* request irq */
+	irq_id = platform_get_irq(pdev, 0);
+	if (irq_id <= 0)
+		return dev_err_probe(dev, irq_id < 0 ? irq_id : -ENXIO,
+				     "no irq found");
+
+	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", (void *)afe);
+	if (ret)
+		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+
+	ret = enable_irq_wake(irq_id);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "enable_irq_wake %d\n", irq_id);
+
+	/* init sub_dais */
+	INIT_LIST_HEAD(&afe->sub_dais);
+
+	for (i = 0; i < ARRAY_SIZE(dai_register_cbs); i++) {
+		ret = dai_register_cbs[i](afe);
+		if (ret)
+			return dev_err_probe(dev, ret, "dai register i %d fail\n", i);
+	}
+
+	/* init dai_driver and component_driver */
+	ret = mtk_afe_combine_sub_dai(afe);
+	if (ret)
+		return dev_err_probe(dev, ret, "mtk_afe_combine_sub_dai fail\n");
+
+	/* reset controller to reset audio regs before regmap cache */
+	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
+	if (IS_ERR(rstc))
+		return dev_err_probe(dev, PTR_ERR(rstc), "could not get audiosys reset\n");
+
+	ret = reset_control_reset(rstc);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to trigger audio reset\n");
+
+	/* enable clock for regcache get default value from hw */
+	afe_priv->pm_runtime_bypass_reg_ctl = true;
+	pm_runtime_enable(dev);
+	ret = pm_runtime_get_sync(dev);
+	if (ret) {
+		dev_err(dev, "failed to resume device: %d\n", ret);
+		goto err_pm_disable;
+	}
+
+	afe->regmap = devm_regmap_init_mmio(dev, afe->base_addr,
+					    &mt8186_afe_regmap_config);
+	if (IS_ERR(afe->regmap)) {
+		ret = PTR_ERR(afe->regmap);
+		goto err_pm_disable;
+	}
+
+	/* others */
+	afe->mtk_afe_hardware = &mt8186_afe_hardware;
+	afe->memif_fs = mt8186_memif_fs;
+	afe->irq_fs = mt8186_irq_fs;
+	afe->get_dai_fs = mt8186_get_dai_fs;
+	afe->get_memif_pbuf_size = mt8186_get_memif_pbuf_size;
+
+	afe->runtime_resume = mt8186_afe_runtime_resume;
+	afe->runtime_suspend = mt8186_afe_runtime_suspend;
+
+	/* register platform */
+	dev_info(dev, "%s(), devm_snd_soc_register_component\n", __func__);
+
+	ret = devm_snd_soc_register_component(dev,
+					      &mt8186_afe_component,
+					      afe->dai_drivers,
+					      afe->num_dai_drivers);
+	if (ret) {
+		dev_err(dev, "err_dai_component\n");
+		goto err_pm_disable;
+	}
+
+	ret = pm_runtime_put_sync(dev);
+	if (ret) {
+		pm_runtime_get_noresume(dev);
+		dev_err(dev, "failed to suspend device: %d\n", ret);
+		goto err_pm_disable;
+	}
+	afe_priv->pm_runtime_bypass_reg_ctl = false;
+
+	regcache_cache_only(afe->regmap, true);
+	regcache_mark_dirty(afe->regmap);
+
+	return 0;
+
+err_pm_disable:
+	pm_runtime_put_noidle(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_disable(dev);
+
+	return ret;
+}
+
+static int mt8186_afe_pcm_dev_remove(struct platform_device *pdev)
+{
+	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		mt8186_afe_runtime_suspend(&pdev->dev);
+
+	mt8186_deinit_clock(afe);
+
+	return 0;
+}
+
+static const struct of_device_id mt8186_afe_pcm_dt_match[] = {
+	{ .compatible = "mediatek,mt8186-sound", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mt8186_afe_pcm_dt_match);
+
+static const struct dev_pm_ops mt8186_afe_pm_ops = {
+	SET_RUNTIME_PM_OPS(mt8186_afe_runtime_suspend,
+			   mt8186_afe_runtime_resume, NULL)
+};
+
+static struct platform_driver mt8186_afe_pcm_driver = {
+	.driver = {
+		   .name = "mt8186-audio",
+		   .of_match_table = mt8186_afe_pcm_dt_match,
+		   .pm = &mt8186_afe_pm_ops,
+	},
+	.probe = mt8186_afe_pcm_dev_probe,
+	.remove = mt8186_afe_pcm_dev_remove,
+};
+
+module_platform_driver(mt8186_afe_pcm_driver);
+
+MODULE_DESCRIPTION("Mediatek ALSA SoC AFE platform driver for 8186");
+MODULE_AUTHOR("Jiaxin Yu <jiaxin.yu@mediatek.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.18.0

