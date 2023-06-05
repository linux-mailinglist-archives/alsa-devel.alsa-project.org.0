Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 573E4722800
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 15:57:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A9BEA4E;
	Mon,  5 Jun 2023 15:56:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A9BEA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685973444;
	bh=P/QcgomrEFCK9fQPuUQLRZeGp2QhONYHaUs6hegCjwM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uHhG2Yxusuz5fHD5Y709QsAbEx72bSseWFGGO2CVMD313Q0j4bwYOekB48Ggz3IZk
	 GgfylR2hHpK0bcxFDv7YqAm2IQApPZJK1bbmhpMBAN+le/8Gsq4KDyH5/FErwmudXR
	 h7aVTWEVqmLhQLHfDfOgA1H5ji32vwIejiVSAuJU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E16CEF805D7; Mon,  5 Jun 2023 15:55:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 804EFF805C7;
	Mon,  5 Jun 2023 15:55:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23EA7F80254; Mon,  5 Jun 2023 14:10:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by alsa1.perex.cz (Postfix) with ESMTP id 97FC3F800ED
	for <alsa-devel@alsa-project.org>; Mon,  5 Jun 2023 14:09:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97FC3F800ED
Received: from loongson.cn (unknown [10.180.13.124])
	by gateway (Coremail) with SMTP id _____8BxWPGC0H1k7hMAAA--.433S3;
	Mon, 05 Jun 2023 20:09:39 +0800 (CST)
Received: from localhost.localdomain (unknown [10.180.13.124])
	by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxauWC0H1k_3AAAA--.2032S4;
	Mon, 05 Jun 2023 20:09:38 +0800 (CST)
From: YingKun Meng <mengyingkun@loongson.cn>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	Yingkun Meng <mengyingkun@loongson.cn>
Subject: [PATCH 1/3] ASoC: Add support for Loongson I2S controller
Date: Mon,  5 Jun 2023 20:09:32 +0800
Message-Id: <20230605120934.2306548-1-mengyingkun@loongson.cn>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8AxauWC0H1k_3AAAA--.2032S4
X-CM-SenderInfo: 5phqw55lqjy33q6o00pqjv00gofq/1tbiAQANDGR8fwASxAAOs-
X-Coremail-Antispam: 1Uk129KBj9fXoWfWF1xuryUWr4kGr1UGF4DAwc_yoW5Gr18Ao
	WI9F93W3yrZr1UZFyYqr1rWF1UXF15Wa1avws7Ar98C3WFyFyDGa47Gw17GF1fua1rtr48
	Ar95trs3Ww42vr47l-sFpf9Il3svdjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUYD7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8JVW8Jr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
	vjDU0xZFpf9x07jjWlkUUUUU=
X-MailFrom: mengyingkun@loongson.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2ANFQLMHIB4TWNTJBEV6NBNWFFKFYNRA
X-Message-ID-Hash: 2ANFQLMHIB4TWNTJBEV6NBNWFFKFYNRA
X-Mailman-Approved-At: Mon, 05 Jun 2023 13:55:12 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ANFQLMHIB4TWNTJBEV6NBNWFFKFYNRA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Yingkun Meng <mengyingkun@loongson.cn>

Loongson I2S controller is found on 7axxx/2kxxx chips from loongson,
it is a PCI device with two private DMA controllers, one for playback,
the other for capture.

The driver supports the use of DTS or ACPI to describe device resources.

Signed-off-by: Yingkun Meng <mengyingkun@loongson.cn>
---
 sound/soc/Kconfig                     |   1 +
 sound/soc/Makefile                    |   1 +
 sound/soc/loongson/Kconfig            |  15 +
 sound/soc/loongson/Makefile           |   4 +
 sound/soc/loongson/loongson_i2s.c     | 209 +++++++++++
 sound/soc/loongson/loongson_i2s.h     |  70 ++++
 sound/soc/loongson/loongson_i2s_pci.c | 478 ++++++++++++++++++++++++++
 7 files changed, 778 insertions(+)
 create mode 100644 sound/soc/loongson/Kconfig
 create mode 100644 sound/soc/loongson/Makefile
 create mode 100644 sound/soc/loongson/loongson_i2s.c
 create mode 100644 sound/soc/loongson/loongson_i2s.h
 create mode 100644 sound/soc/loongson/loongson_i2s_pci.c

diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
index 4b6e5a802880..bfa9622e1ab1 100644
--- a/sound/soc/Kconfig
+++ b/sound/soc/Kconfig
@@ -79,6 +79,7 @@ source "sound/soc/google/Kconfig"
 source "sound/soc/hisilicon/Kconfig"
 source "sound/soc/jz4740/Kconfig"
 source "sound/soc/kirkwood/Kconfig"
+source "sound/soc/loongson/Kconfig"
 source "sound/soc/img/Kconfig"
 source "sound/soc/intel/Kconfig"
 source "sound/soc/mediatek/Kconfig"
diff --git a/sound/soc/Makefile b/sound/soc/Makefile
index 9d9b228e4508..8376fdb217ed 100644
--- a/sound/soc/Makefile
+++ b/sound/soc/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_SND_SOC)	+= fsl/
 obj-$(CONFIG_SND_SOC)	+= google/
 obj-$(CONFIG_SND_SOC)	+= hisilicon/
 obj-$(CONFIG_SND_SOC)	+= jz4740/
+obj-$(CONFIG_SND_SOC)	+= loongson/
 obj-$(CONFIG_SND_SOC)	+= img/
 obj-$(CONFIG_SND_SOC)	+= intel/
 obj-$(CONFIG_SND_SOC)	+= mediatek/
diff --git a/sound/soc/loongson/Kconfig b/sound/soc/loongson/Kconfig
new file mode 100644
index 000000000000..fd477e7da6e0
--- /dev/null
+++ b/sound/soc/loongson/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+menu "SoC Audio for Loongson CPUs"
+	depends on LOONGARCH || COMPILE_TEST
+
+config SND_SOC_LOONGSON_I2S_PCI
+	tristate "Loongson I2S-PCI Device Driver"
+	select REGMAP_MMIO
+	help
+	  Say Y or M if you want to add support for I2S driver for
+	  Loongson I2S controller.
+
+	  The controller is found in loongson bridge chips or SoCs,
+	  and work as a PCI device.
+
+endmenu
diff --git a/sound/soc/loongson/Makefile b/sound/soc/loongson/Makefile
new file mode 100644
index 000000000000..cfd0de1b1b22
--- /dev/null
+++ b/sound/soc/loongson/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+#Platform Support
+snd-soc-loongson-i2s-pci-objs := loongson_i2s_pci.o loongson_i2s.o
+obj-$(CONFIG_SND_SOC_LOONGSON_I2S_PCI) += snd-soc-loongson-i2s-pci.o
diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
new file mode 100644
index 000000000000..00793964237f
--- /dev/null
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Loongson-2K I2S master mode driver
+ *
+ * Copyright (C) 2022 Loongson Technology Corporation Limited
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/delay.h>
+#include <linux/pm_runtime.h>
+#include <linux/dma-mapping.h>
+#include <sound/soc.h>
+#include <linux/regmap.h>
+#include <sound/pcm_params.h>
+#include "loongson_i2s.h"
+
+#define LOONGSON_I2S_FORMATS (SNDRV_PCM_FMTBIT_S8 | \
+			SNDRV_PCM_FMTBIT_S16_LE | \
+			SNDRV_PCM_FMTBIT_S20_3LE | \
+			SNDRV_PCM_FMTBIT_S24_LE)
+
+static int loongson_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
+				struct snd_soc_dai *dai)
+{
+	struct loongson_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	u32 val;
+	int ret = 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		/* Enable MCLK */
+		if (i2s->rev_id == 1) {
+			regmap_update_bits(i2s->regmap, LS_I2S_CTRL,
+					   I2S_CTRL_MCLK_EN,
+					   I2S_CTRL_MCLK_EN);
+			regmap_read_poll_timeout_atomic(i2s->regmap,
+						LS_I2S_CTRL, val,
+						!(val & I2S_CTRL_MCLK_READY),
+						10, 2000);
+		}
+
+		/* Enable master mode */
+		regmap_update_bits(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_MASTER,
+				   I2S_CTRL_MASTER);
+		if (i2s->rev_id == 1) {
+			regmap_read_poll_timeout_atomic(i2s->regmap,
+						LS_I2S_CTRL, val,
+						!(val & I2S_CTRL_CLK_READY),
+						10, 2000);
+		}
+		fallthrough;
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			regmap_update_bits(i2s->regmap, LS_I2S_CTRL,
+					   I2S_CTRL_TX_EN | I2S_CTRL_TX_DMA_EN,
+					   I2S_CTRL_TX_EN | I2S_CTRL_TX_DMA_EN);
+		else
+			regmap_update_bits(i2s->regmap, LS_I2S_CTRL,
+					   I2S_CTRL_RX_EN | I2S_CTRL_RX_DMA_EN,
+					   I2S_CTRL_RX_EN | I2S_CTRL_RX_DMA_EN);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			regmap_update_bits(i2s->regmap, LS_I2S_CTRL,
+					I2S_CTRL_TX_EN | I2S_CTRL_TX_DMA_EN, 0);
+		else
+			regmap_update_bits(i2s->regmap, LS_I2S_CTRL,
+					I2S_CTRL_RX_EN | I2S_CTRL_RX_DMA_EN, 0);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int loongson_i2s_hw_params(struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params,
+				  struct snd_soc_dai *dai)
+{
+	struct loongson_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+	u32 clk_rate = i2s->clk_rate;
+	u32 sysclk = i2s->sysclk;
+	u32 bits = params_width(params);
+	u32 chans = params_channels(params);
+	u32 fs = params_rate(params);
+	u32 bclk_ratio, mclk_ratio;
+	u32 mclk_ratio_frac;
+	u32 val = 0;
+
+	if (i2s->rev_id == 0) {
+		bclk_ratio = DIV_ROUND_CLOSEST(clk_rate,
+					       (bits * chans * fs * 2)) - 1;
+		mclk_ratio = DIV_ROUND_CLOSEST(clk_rate, (sysclk * 2)) - 1;
+
+		/* According to 2k1000LA user manual, set bits == depth */
+		val |= (bits << 24);
+		val |= (bits << 16);
+		val |= (bclk_ratio << 8);
+		val |= mclk_ratio;
+		regmap_write(i2s->regmap, LS_I2S_CFG, val);
+	} else if (i2s->rev_id == 1) {
+		bclk_ratio = DIV_ROUND_CLOSEST(sysclk,
+					       (bits * chans * fs * 2)) - 1;
+		mclk_ratio = clk_rate / sysclk;
+		mclk_ratio_frac = DIV_ROUND_CLOSEST(((u64)clk_rate << 16),
+						    sysclk) - (mclk_ratio << 16);
+
+		regmap_read(i2s->regmap, LS_I2S_CFG, &val);
+		val |= (bits << 24);
+		val |= (bclk_ratio << 8);
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			val |= (bits << 16);
+		else
+			val |= bits;
+		regmap_write(i2s->regmap, LS_I2S_CFG, val);
+
+		val = (mclk_ratio_frac << 16) | mclk_ratio;
+		regmap_write(i2s->regmap, LS_I2S_CFG1, val);
+	} else
+		dev_err(i2s->dev, "I2S revision invalid\n");
+
+	return 0;
+}
+
+static int loongson_i2s_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
+				       unsigned int freq, int dir)
+{
+	struct loongson_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+
+	i2s->sysclk = freq;
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops loongson_i2s_dai_ops = {
+	.trigger	= loongson_i2s_trigger,
+	.hw_params	= loongson_i2s_hw_params,
+	.set_sysclk	= loongson_i2s_set_dai_sysclk,
+};
+
+static int loongson_i2s_dai_probe(struct snd_soc_dai *cpu_dai)
+{
+	struct loongson_i2s *i2s = dev_get_drvdata(cpu_dai->dev);
+
+	snd_soc_dai_init_dma_data(cpu_dai, &i2s->playback_dma_data,
+				  &i2s->capture_dma_data);
+	snd_soc_dai_set_drvdata(cpu_dai, i2s);
+
+	return 0;
+}
+
+struct snd_soc_dai_driver loongson_i2s_dai = {
+	.name = "loongson-i2s",
+	.probe = loongson_i2s_dai_probe,
+	.playback = {
+		.stream_name = "CPU-Playback",
+		.channels_min = 1,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_8000_96000,
+		.formats = LOONGSON_I2S_FORMATS,
+	},
+	.capture = {
+		.stream_name = "CPU-Capture",
+		.channels_min = 1,
+		.channels_max = 2,
+		.rates = SNDRV_PCM_RATE_8000_96000,
+		.formats = LOONGSON_I2S_FORMATS,
+	},
+	.ops = &loongson_i2s_dai_ops,
+	.symmetric_rate = 1,
+};
+
+static int i2s_suspend(struct device *dev)
+{
+	struct loongson_i2s *i2s = dev_get_drvdata(dev);
+
+	regcache_cache_only(i2s->regmap, true);
+
+	return 0;
+}
+
+static int i2s_resume(struct device *dev)
+{
+	struct loongson_i2s *i2s = dev_get_drvdata(dev);
+	int ret;
+
+	regcache_cache_only(i2s->regmap, false);
+	regcache_mark_dirty(i2s->regmap);
+	ret = regcache_sync(i2s->regmap);
+
+	return ret;
+}
+
+const struct dev_pm_ops loongson_i2s_pm = {
+	SET_SYSTEM_SLEEP_PM_OPS(i2s_suspend, i2s_resume)
+};
+
+void loongson_i2s_init(struct loongson_i2s *i2s)
+{
+	if (i2s->rev_id == 1) {
+		regmap_write(i2s->regmap, LS_I2S_CTRL, I2S_CTRL_RESET);
+		udelay(200);
+	}
+}
diff --git a/sound/soc/loongson/loongson_i2s.h b/sound/soc/loongson/loongson_i2s.h
new file mode 100644
index 000000000000..a743c34b8968
--- /dev/null
+++ b/sound/soc/loongson/loongson_i2s.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * ALSA I2S interface for the Loongson chip
+ *
+ */
+#ifndef _LOONGSON_I2S_H
+#define _LOONGSON_I2S_H
+
+#include <linux/regmap.h>
+#include <sound/dmaengine_pcm.h>
+
+/* I2S Common Registers */
+#define LS_I2S_VER	0x00 /* I2S Version */
+#define LS_I2S_CFG	0x04 /* I2S Config */
+#define LS_I2S_CTRL	0x08 /* I2S Control */
+#define LS_I2S_RX_DATA	0x0C /* I2S DMA RX Address */
+#define LS_I2S_TX_DATA	0x10 /* I2S DMA TX Address */
+
+/* 2K2000 I2S Specify Registers */
+#define LS_I2S_CFG1	0x14 /* I2S Config1 */
+
+/* 7A2000 I2S Specify Registers */
+#define LS_I2S_TX_ORDER	0x100 /* TX DMA Order */
+#define LS_I2S_RX_ORDER 0x110 /* RX DMA Order */
+
+/* Loongson I2S Control Register */
+#define I2S_CTRL_MCLK_READY	(1 << 16) /* MCLK ready */
+#define I2S_CTRL_MASTER		(1 << 15) /* Master mode */
+#define I2S_CTRL_MSB		(1 << 14) /* MSB bit order */
+#define I2S_CTRL_RX_EN		(1 << 13) /* RX enable */
+#define I2S_CTRL_TX_EN		(1 << 12) /* TX enable */
+#define I2S_CTRL_RX_DMA_EN	(1 << 11) /* DMA RX enable */
+#define I2S_CTRL_CLK_READY	(1 << 8)  /* BCLK ready */
+#define I2S_CTRL_TX_DMA_EN	(1 << 7)  /* DMA TX enable */
+#define I2S_CTRL_RESET		(1 << 4)  /* Controller soft reset */
+#define I2S_CTRL_MCLK_EN	(1 << 3)  /* Enable MCLK */
+#define I2S_CTRL_RX_INT_EN	(1 << 1)  /* RX interrupt enable */
+#define I2S_CTRL_TX_INT_EN	(1 << 0)  /* TX interrupt enable */
+
+#define LS_I2S_DRVNAME		"loongson-i2s"
+
+struct loongson_dma_data {
+	u64 dev_addr;			/* device physical address for DMA */
+	void __iomem *order_addr;	/* DMA order register */
+	u32 irq;			/* DMA irq */
+};
+
+struct loongson_i2s {
+	struct device *dev;
+	union {
+		struct snd_dmaengine_dai_dma_data playback_dma_data;
+		struct loongson_dma_data tx_dma_data;
+	};
+	union {
+		struct snd_dmaengine_dai_dma_data capture_dma_data;
+		struct loongson_dma_data rx_dma_data;
+	};
+	struct regmap *regmap;
+	void __iomem *reg_base;
+	u32 rev_id;
+	u32 clk_rate;
+	u32 sysclk;
+};
+
+extern const struct dev_pm_ops loongson_i2s_pm;
+extern struct snd_soc_dai_driver loongson_i2s_dai;
+
+void loongson_i2s_init(struct loongson_i2s *i2s);
+
+#endif
diff --git a/sound/soc/loongson/loongson_i2s_pci.c b/sound/soc/loongson/loongson_i2s_pci.c
new file mode 100644
index 000000000000..e4b8c654b12c
--- /dev/null
+++ b/sound/soc/loongson/loongson_i2s_pci.c
@@ -0,0 +1,478 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Loongson-2K I2S master mode driver
+ *
+ * Copyright (C) 2022 Loongson Technology Corporation Limited
+ */
+
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/pm_runtime.h>
+#include <linux/dma-mapping.h>
+#include <linux/acpi.h>
+#include <linux/pci.h>
+#include <sound/soc.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include "loongson_i2s.h"
+
+/* DMA dma_order Register */
+#define DMA_ORDER_STOP          (1 << 4) /* DMA stop */
+#define DMA_ORDER_START         (1 << 3) /* DMA start */
+#define DMA_ORDER_ASK_VALID     (1 << 2) /* DMA ask valid flag */
+#define DMA_ORDER_AXI_UNCO      (1 << 1) /* Uncache access */
+#define DMA_ORDER_ADDR_64       (1 << 0) /* 64bits address support */
+
+#define DMA_ORDER_ASK_MASK      (~0x1fUL) /* Ask addr mask */
+#define DMA_ORDER_CTRL_MASK     (0x0fUL)  /* Control mask  */
+
+#define BAR_NUM 0
+
+/*
+ * DMA registers descriptor.
+ */
+struct loongson_dma_desc {
+	u32 order;		/* Next descriptor address register */
+	u32 saddr;		/* Source address register */
+	u32 daddr;		/* Device address register */
+	u32 length;		/* Total length register */
+	u32 step_length;	/* Memory stride register */
+	u32 step_times;		/* Repeat time register */
+	u32 cmd;		/* Command register */
+	u32 stats;		/* Status register */
+	u32 order_hi;		/* Next descriptor high address register */
+	u32 saddr_hi;		/* High source address register */
+	u32 res[6];		/* Reserved */
+};
+
+struct loongson_runtime_data {
+	struct loongson_dma_data *dma_data;
+
+	struct loongson_dma_desc *dma_desc_arr;
+	dma_addr_t dma_desc_arr_phy;
+
+	struct loongson_dma_desc *dma_pos_desc;
+	dma_addr_t dma_pos_desc_phy;
+};
+
+static const struct snd_pcm_hardware ls_pcm_hardware = {
+	.info = SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_RESUME |
+		SNDRV_PCM_INFO_PAUSE,
+	.formats = (SNDRV_PCM_FMTBIT_S8 |
+		SNDRV_PCM_FMTBIT_S16_LE |
+		SNDRV_PCM_FMTBIT_S20_3LE |
+		SNDRV_PCM_FMTBIT_S24_LE),
+	.period_bytes_min = 128,
+	.period_bytes_max = 128 * 1024,
+	.periods_min = 1,
+	.periods_max = PAGE_SIZE / sizeof(struct loongson_dma_desc),
+	.buffer_bytes_max = 1024 * 1024,
+};
+
+static struct
+loongson_dma_desc *dma_desc_save(struct loongson_runtime_data *prtd)
+{
+	void __iomem *order_reg = prtd->dma_data->order_addr;
+	u64 val;
+
+	val = (u64)prtd->dma_pos_desc_phy & DMA_ORDER_ASK_MASK;
+	val |= (readq(order_reg) & DMA_ORDER_CTRL_MASK);
+	val |= DMA_ORDER_ASK_VALID;
+	writeq(val, order_reg);
+
+	while (readl(order_reg) & DMA_ORDER_ASK_VALID)
+		udelay(2);
+
+	return prtd->dma_pos_desc;
+}
+
+static int loongson_pcm_trigger(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream, int cmd)
+{
+	struct loongson_runtime_data *prtd = substream->runtime->private_data;
+	struct device *dev = substream->pcm->card->dev;
+	void __iomem *order_reg = prtd->dma_data->order_addr;
+	u64 val;
+	int ret = 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		val = prtd->dma_pos_desc_phy & DMA_ORDER_ASK_MASK;
+		if (dev->coherent_dma_mask == DMA_BIT_MASK(64))
+			val |= DMA_ORDER_ADDR_64;
+		else
+			val &= ~DMA_ORDER_ADDR_64;
+		val |= (readq(order_reg) & DMA_ORDER_CTRL_MASK);
+		val |= DMA_ORDER_START;
+		writeq(val, order_reg);
+
+		while ((readl(order_reg) & DMA_ORDER_START))
+			udelay(2);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		dma_desc_save(prtd);
+
+		/* dma stop */
+		val = readq(order_reg) | DMA_ORDER_STOP;
+		writeq(val, order_reg);
+		udelay(1000);
+
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static int loongson_pcm_hw_params(struct snd_soc_component *component,
+				  struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct loongson_runtime_data *prtd = runtime->private_data;
+	size_t buf_len = params_buffer_bytes(params);
+	size_t period_len = params_period_bytes(params);
+	dma_addr_t order_addr, mem_addr;
+	struct loongson_dma_desc *desc;
+	u32 num_periods;
+	int i;
+
+	if (buf_len % period_len) {
+		pr_err("buf len not multiply of period len\n");
+		return -EINVAL;
+	}
+
+	num_periods = buf_len / period_len;
+	if (!num_periods) {
+		pr_err("dma data too small\n");
+		return -EINVAL;
+	}
+
+	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
+	runtime->dma_bytes = buf_len;
+
+	/* initialize dma descriptor array */
+	mem_addr = runtime->dma_addr;
+	order_addr = prtd->dma_desc_arr_phy;
+	for (i = 0; i < num_periods; i++) {
+		desc = &prtd->dma_desc_arr[i];
+
+		/* next descriptor physical address */
+		order_addr += sizeof(*desc);
+		desc->order = order_addr | BIT(0);
+		desc->order_hi = order_addr >> 32;
+
+		desc->saddr = mem_addr;
+		desc->saddr_hi = mem_addr >> 32;
+		desc->daddr = prtd->dma_data->dev_addr;
+
+		desc->cmd = BIT(0);
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			desc->cmd |= BIT(12);
+
+		desc->length = period_len >> 2;
+		desc->step_length = 0;
+		desc->step_times = 1;
+
+		mem_addr += period_len;
+	}
+	if (num_periods > 0) {
+		desc = &prtd->dma_desc_arr[num_periods - 1];
+		desc->order = prtd->dma_desc_arr_phy | BIT(0);
+		desc->order_hi = prtd->dma_desc_arr_phy >> 32;
+	}
+
+	/* init position descriptor */
+	*prtd->dma_pos_desc = *prtd->dma_desc_arr;
+
+	return 0;
+}
+
+static snd_pcm_uframes_t
+loongson_pcm_pointer(struct snd_soc_component *component,
+		     struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct loongson_runtime_data *prtd = runtime->private_data;
+	struct loongson_dma_desc *desc;
+	snd_pcm_uframes_t x;
+	u64 addr;
+
+	desc = dma_desc_save(prtd);
+	addr = ((u64)desc->saddr_hi << 32) | desc->saddr;
+
+	x = bytes_to_frames(runtime, addr - runtime->dma_addr);
+	if (x == runtime->buffer_size)
+		x = 0;
+	return x;
+}
+
+static irqreturn_t loongson_pcm_dma_irq(int irq, void *devid)
+{
+	struct snd_pcm_substream *substream = devid;
+
+	snd_pcm_period_elapsed(substream);
+	return IRQ_HANDLED;
+}
+
+static int loongson_pcm_open(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_card *card = substream->pcm->card;
+	struct loongson_runtime_data *prtd;
+	struct loongson_dma_data *dma_data;
+	int ret;
+
+	/*
+	 * For mysterious reasons (and despite what the manual says)
+	 * playback samples are lost if the DMA count is not a multiple
+	 * of the DMA burst size.  Let's add a rule to enforce that.
+	 */
+	snd_pcm_hw_constraint_step(runtime, 0,
+				   SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 128);
+	snd_pcm_hw_constraint_step(runtime, 0,
+				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 128);
+	snd_pcm_hw_constraint_integer(substream->runtime,
+				      SNDRV_PCM_HW_PARAM_PERIODS);
+	snd_soc_set_runtime_hwparams(substream, &ls_pcm_hardware);
+
+	prtd = kzalloc(sizeof(*prtd), GFP_KERNEL);
+	if (!prtd)
+		return -ENOMEM;
+
+	prtd->dma_desc_arr = dma_alloc_coherent(card->dev, PAGE_SIZE,
+						&prtd->dma_desc_arr_phy,
+						GFP_KERNEL);
+	if (!prtd->dma_desc_arr) {
+		ret = -ENOMEM;
+		goto desc_err;
+	}
+
+	prtd->dma_pos_desc = dma_alloc_coherent(card->dev,
+						sizeof(*prtd->dma_pos_desc),
+						&prtd->dma_pos_desc_phy,
+						GFP_KERNEL);
+	if (!prtd->dma_pos_desc) {
+		ret = -ENOMEM;
+		goto pos_err;
+	}
+
+	dma_data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	ret = request_irq(dma_data->irq, loongson_pcm_dma_irq,
+			  IRQF_TRIGGER_RISING, LS_I2S_DRVNAME, substream);
+	if (ret < 0)
+		goto irq_err;
+
+	prtd->dma_data = dma_data;
+	substream->runtime->private_data = prtd;
+
+	return 0;
+irq_err:
+	dma_free_coherent(card->dev, sizeof(*prtd->dma_pos_desc),
+			  prtd->dma_pos_desc, prtd->dma_pos_desc_phy);
+pos_err:
+	dma_free_coherent(card->dev, PAGE_SIZE, prtd->dma_desc_arr,
+			  prtd->dma_desc_arr_phy);
+desc_err:
+	kfree(prtd);
+
+	return ret;
+}
+
+static int loongson_pcm_close(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_card *card = substream->pcm->card;
+	struct loongson_runtime_data *prtd = substream->runtime->private_data;
+	struct loongson_dma_data *dma_data;
+
+	dma_free_coherent(card->dev, PAGE_SIZE, prtd->dma_desc_arr,
+			  prtd->dma_desc_arr_phy);
+
+	dma_free_coherent(card->dev, sizeof(*prtd->dma_pos_desc),
+			  prtd->dma_pos_desc, prtd->dma_pos_desc_phy);
+
+	dma_data = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	free_irq(dma_data->irq, substream);
+
+	kfree(prtd);
+	return 0;
+}
+
+static int loongson_pcm_mmap(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream,
+			     struct vm_area_struct *vma)
+{
+	return remap_pfn_range(vma, vma->vm_start,
+			substream->dma_buffer.addr >> PAGE_SHIFT,
+			vma->vm_end - vma->vm_start, vma->vm_page_prot);
+}
+
+static int loongson_pcm_new(struct snd_soc_component *component,
+			    struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_pcm *pcm = rtd->pcm;
+
+	return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+					    pcm->card->dev,
+					    ls_pcm_hardware.buffer_bytes_max);
+}
+
+static const struct snd_soc_component_driver loongson_i2s_component = {
+	.name		= LS_I2S_DRVNAME,
+	.open		= loongson_pcm_open,
+	.close		= loongson_pcm_close,
+	.hw_params	= loongson_pcm_hw_params,
+	.trigger	= loongson_pcm_trigger,
+	.pointer	= loongson_pcm_pointer,
+	.mmap		= loongson_pcm_mmap,
+	.pcm_construct	= loongson_pcm_new,
+};
+
+static const struct regmap_config loongson_i2s_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x110,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static int loongson_i2s_pci_probe(struct pci_dev *pdev,
+				  const struct pci_device_id *pid)
+{
+	const struct fwnode_handle *fwnode = pdev->dev.fwnode;
+	struct loongson_dma_data *tx_data, *rx_data;
+	struct loongson_i2s *i2s;
+	int ret;
+
+	if (pci_enable_device(pdev)) {
+		dev_err(&pdev->dev, "pci_enable_device failed\n");
+		return -ENODEV;
+	}
+
+	ret = pci_request_region(pdev, BAR_NUM, LS_I2S_DRVNAME);
+	if (ret) {
+		dev_err(&pdev->dev, "request regions failed %d\n", ret);
+		goto err_disable;
+	}
+
+	i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
+	if (!i2s) {
+		ret = -ENOMEM;
+		goto err_release;
+	}
+	i2s->rev_id = pdev->revision;
+	i2s->dev = &pdev->dev;
+	pci_set_drvdata(pdev, i2s);
+
+	i2s->reg_base = pci_iomap(pdev, BAR_NUM, 0);
+	if (!i2s->reg_base) {
+		dev_err(&pdev->dev, "pci_iomap_error\n");
+		ret = -EIO;
+		goto err_release;
+	}
+
+	i2s->regmap = devm_regmap_init_mmio(&pdev->dev, i2s->reg_base,
+					    &loongson_i2s_regmap_config);
+	if (IS_ERR(i2s->regmap)) {
+		dev_err(&pdev->dev, "Failed to initialize register map");
+		ret = PTR_ERR(i2s->regmap);
+		goto err_unmap;
+	}
+
+	tx_data = &i2s->tx_dma_data;
+	rx_data = &i2s->rx_dma_data;
+
+	tx_data->dev_addr = (u64)i2s->reg_base + LS_I2S_TX_DATA;
+	tx_data->order_addr = i2s->reg_base + LS_I2S_TX_ORDER;
+
+	rx_data->dev_addr = (u64)i2s->reg_base + LS_I2S_RX_DATA;
+	rx_data->order_addr = i2s->reg_base + LS_I2S_RX_ORDER;
+
+	tx_data->irq = fwnode_irq_get_byname(fwnode, "tx");
+	if (tx_data->irq < 0) {
+		dev_err(&pdev->dev, "dma tx irq invalid\n");
+		ret = tx_data->irq;
+		goto err_unmap;
+	}
+
+	rx_data->irq = fwnode_irq_get_byname(fwnode, "rx");
+	if (rx_data->irq < 0) {
+		dev_err(&pdev->dev, "dma rx irq invalid\n");
+		ret = rx_data->irq;
+		goto err_unmap;
+	}
+
+	device_property_read_u32(&pdev->dev, "clock-frequency", &i2s->clk_rate);
+	if (!i2s->clk_rate) {
+		dev_err(&pdev->dev, "clock-frequency property invalid\n");
+		ret = -EINVAL;
+		goto err_unmap;
+	}
+
+	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+
+	dev_set_name(&pdev->dev, "%s", loongson_i2s_dai.name);
+
+	loongson_i2s_init(i2s);
+
+	ret = devm_snd_soc_register_component(&pdev->dev,
+					      &loongson_i2s_component,
+					      &loongson_i2s_dai, 1);
+	if (ret) {
+		dev_err(&pdev->dev, "register DAI failed %d\n", ret);
+		goto err_unmap;
+	}
+
+	return 0;
+
+err_unmap:
+	pci_iounmap(pdev, i2s->reg_base);
+err_release:
+	pci_release_region(pdev, BAR_NUM);
+err_disable:
+	pci_disable_device(pdev);
+	return ret;
+}
+
+static void loongson_i2s_pci_remove(struct pci_dev *pdev)
+{
+	struct loongson_i2s *i2s = dev_get_drvdata(&pdev->dev);
+
+	pci_iounmap(pdev, i2s->reg_base);
+	pci_release_region(pdev, BAR_NUM);
+	pci_disable_device(pdev);
+}
+
+static const struct pci_device_id loongson_i2s_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_LOONGSON, 0x7a27) },
+	{ },
+};
+MODULE_DEVICE_TABLE(pci, loongson_i2s_ids);
+
+static struct pci_driver loongson_i2s_driver = {
+	.name = "loongson-i2s-pci",
+	.id_table = loongson_i2s_ids,
+	.probe = loongson_i2s_pci_probe,
+	.remove = loongson_i2s_pci_remove,
+	.driver = {
+		.owner = THIS_MODULE,
+		.pm = pm_sleep_ptr(&loongson_i2s_pm),
+	},
+};
+module_pci_driver(loongson_i2s_driver);
+
+MODULE_DESCRIPTION("Loongson I2S Master Mode ASoC Driver");
+MODULE_AUTHOR("Loongson Technology Corporation Limited");
+MODULE_LICENSE("GPL");

base-commit: 1fbcc5ab1c7a172ef1159b154c296fe1e9ce209b
-- 
2.33.0

