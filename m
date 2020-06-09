Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9DE1F3407
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 08:22:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D8631682;
	Tue,  9 Jun 2020 08:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D8631682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591683736;
	bh=1t/9aREcsSmpZ2+lg8lKwx+gAGHwlQauu3uKyPnyz8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XfB7BrvYqGUTwur2UX1HndJc2oLR0nPSU1S0eMm+1Iq+KAvier0dqaQWe7riDfra4
	 fXzVZ+6RFnf8tfqYqXordjhMijTFOPtuQktXrRkyY5ky8w8Ba7ypoP3WmGP0XjRvPY
	 QazdwcjDytT26M43IJ0NCHs8130UA8ErLw+pgJ1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05860F802A0;
	Tue,  9 Jun 2020 08:19:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDBD9F80278; Tue,  9 Jun 2020 08:19:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 872D9F80278
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 08:19:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 872D9F80278
IronPort-SDR: 21OKM+Yg20P75nTFlGkEvAju9ct/bPLtrQZu7KnWQD1JYTy1BcofVJIrzeyS7+xqsHI+71HGMU
 JAzNC6+VoHkQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 23:19:41 -0700
IronPort-SDR: LyEfn4HP9KvRnA0Nbr+FgqPG8WZ7eq/BYb914dEnC9KXnEadXAHZIi7txa+ktx/O1iSBv4NZNX
 QH9oTj/d+yog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,490,1583222400"; d="scan'208";a="288728672"
Received: from unknown (HELO jsia-HP-Z620-Workstation.png.intel.com)
 ([10.221.118.135])
 by orsmga002.jf.intel.com with ESMTP; 08 Jun 2020 23:19:39 -0700
From: Sia Jee Heng <jee.heng.sia@intel.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH v5 1/3] ASoC: Intel: Add KeemBay platform driver
Date: Tue,  9 Jun 2020 14:06:21 +0800
Message-Id: <1591682783-1923-2-git-send-email-jee.heng.sia@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1591682783-1923-1-git-send-email-jee.heng.sia@intel.com>
References: <1591682783-1923-1-git-send-email-jee.heng.sia@intel.com>
Cc: cezary.rojewski@intel.com, andriy.shevchenko@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org
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

Add KeemBay ASoC platform driver which initialize the i2s controller
and uses i2s to capture and transmit pcm data to external codec.
The i2s is running in polling mode.

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Signed-off-by: Sia Jee Heng <jee.heng.sia@intel.com>
---
 sound/soc/intel/keembay/Makefile       |   4 +
 sound/soc/intel/keembay/kmb_platform.c | 654 +++++++++++++++++++++++++++++++++
 sound/soc/intel/keembay/kmb_platform.h | 145 ++++++++
 3 files changed, 803 insertions(+)
 create mode 100644 sound/soc/intel/keembay/Makefile
 create mode 100644 sound/soc/intel/keembay/kmb_platform.c
 create mode 100644 sound/soc/intel/keembay/kmb_platform.h

diff --git a/sound/soc/intel/keembay/Makefile b/sound/soc/intel/keembay/Makefile
new file mode 100644
index 0000000..9084e8c
--- /dev/null
+++ b/sound/soc/intel/keembay/Makefile
@@ -0,0 +1,4 @@
+snd-soc-kmb_platform-objs := \
+	        kmb_platform.o
+
+obj-$(CONFIG_SND_SOC_INTEL_KEEMBAY) += snd-soc-kmb_platform.o
diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
new file mode 100644
index 0000000..2ce2133
--- /dev/null
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -0,0 +1,654 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (C) 2020 Intel Corporation.
+//
+// Intel KeemBay Platform driver.
+//
+
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include "kmb_platform.h"
+
+#define PERIODS_MIN		2
+#define PERIODS_MAX		48
+#define PERIOD_BYTES_MIN	4096
+#define BUFFER_BYTES_MAX	(PERIODS_MAX * PERIOD_BYTES_MIN)
+#define TDM_OPERATION		1
+#define I2S_OPERATION		0
+#define DATA_WIDTH_CONFIG_BIT	6
+#define TDM_CHANNEL_CONFIG_BIT	3
+
+static const struct snd_pcm_hardware kmb_pcm_hardware = {
+	.info = SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_BATCH |
+		SNDRV_PCM_INFO_BLOCK_TRANSFER,
+	.rates = SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_48000,
+	.rate_min = 16000,
+	.rate_max = 48000,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE |
+		   SNDRV_PCM_FMTBIT_S24_LE |
+		   SNDRV_PCM_FMTBIT_S32_LE,
+	.channels_min = 2,
+	.channels_max = 2,
+	.buffer_bytes_max = BUFFER_BYTES_MAX,
+	.period_bytes_min = PERIOD_BYTES_MIN,
+	.period_bytes_max = BUFFER_BYTES_MAX / PERIODS_MIN,
+	.periods_min = PERIODS_MIN,
+	.periods_max = PERIODS_MAX,
+	.fifo_size = 16,
+};
+
+static unsigned int kmb_pcm_tx_fn(struct kmb_i2s_info *kmb_i2s,
+				  struct snd_pcm_runtime *runtime,
+				  unsigned int tx_ptr, bool *period_elapsed)
+{
+	unsigned int period_pos = tx_ptr % runtime->period_size;
+	void __iomem *i2s_base = kmb_i2s->i2s_base;
+	void *buf = runtime->dma_area;
+	int i;
+
+	/* KMB i2s uses two separate L/R FIFO */
+	for (i = 0; i < kmb_i2s->fifo_th; i++) {
+		if (kmb_i2s->config.data_width == 16) {
+			writel(((u16(*)[2])buf)[tx_ptr][0], i2s_base + LRBR_LTHR(0));
+			writel(((u16(*)[2])buf)[tx_ptr][1], i2s_base + RRBR_RTHR(0));
+		} else {
+			writel(((u32(*)[2])buf)[tx_ptr][0], i2s_base + LRBR_LTHR(0));
+			writel(((u32(*)[2])buf)[tx_ptr][1], i2s_base + RRBR_RTHR(0));
+		}
+
+		period_pos++;
+
+		if (++tx_ptr >= runtime->buffer_size)
+			tx_ptr = 0;
+	}
+
+	*period_elapsed = period_pos >= runtime->period_size;
+
+	return tx_ptr;
+}
+
+static unsigned int kmb_pcm_rx_fn(struct kmb_i2s_info *kmb_i2s,
+				  struct snd_pcm_runtime *runtime,
+				  unsigned int rx_ptr, bool *period_elapsed)
+{
+	unsigned int period_pos = rx_ptr % runtime->period_size;
+	void __iomem *i2s_base = kmb_i2s->i2s_base;
+	void *buf = runtime->dma_area;
+	int i;
+
+	/* KMB i2s uses two separate L/R FIFO */
+	for (i = 0; i < kmb_i2s->fifo_th; i++) {
+		if (kmb_i2s->config.data_width == 16) {
+			((u16(*)[2])buf)[rx_ptr][0] = readl(i2s_base + LRBR_LTHR(0));
+			((u16(*)[2])buf)[rx_ptr][1] = readl(i2s_base + RRBR_RTHR(0));
+		} else {
+			((u32(*)[2])buf)[rx_ptr][0] = readl(i2s_base + LRBR_LTHR(0));
+			((u32(*)[2])buf)[rx_ptr][1] = readl(i2s_base + RRBR_RTHR(0));
+		}
+
+		period_pos++;
+
+		if (++rx_ptr >= runtime->buffer_size)
+			rx_ptr = 0;
+	}
+
+	*period_elapsed = period_pos >= runtime->period_size;
+
+	return rx_ptr;
+}
+
+static inline void kmb_i2s_disable_channels(struct kmb_i2s_info *kmb_i2s,
+					    u32 stream)
+{
+	struct i2s_clk_config_data *config = &kmb_i2s->config;
+	u32 i;
+
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		for (i = 0; i < config->chan_nr / 2; i++)
+			writel(0, kmb_i2s->i2s_base + TER(i));
+	} else {
+		for (i = 0; i < config->chan_nr / 2; i++)
+			writel(0, kmb_i2s->i2s_base + RER(i));
+	}
+}
+
+static inline void kmb_i2s_clear_irqs(struct kmb_i2s_info *kmb_i2s, u32 stream)
+{
+	struct i2s_clk_config_data *config = &kmb_i2s->config;
+	u32 i;
+
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		for (i = 0; i < config->chan_nr / 2; i++)
+			readl(kmb_i2s->i2s_base + TOR(i));
+	} else {
+		for (i = 0; i < config->chan_nr / 2; i++)
+			readl(kmb_i2s->i2s_base + ROR(i));
+	}
+}
+
+static inline void kmb_i2s_irq_trigger(struct kmb_i2s_info *kmb_i2s,
+				       u32 stream, int chan_nr, bool trigger)
+{
+	u32 i, irq;
+	u32 flag;
+
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+		flag = TX_INT_FLAG;
+	else
+		flag = RX_INT_FLAG;
+
+	for (i = 0; i < chan_nr / 2; i++) {
+		irq = readl(kmb_i2s->i2s_base + IMR(i));
+
+		if (trigger)
+			irq = irq & ~flag;
+		else
+			irq = irq | flag;
+
+		writel(irq, kmb_i2s->i2s_base + IMR(i));
+	}
+}
+
+static void kmb_pcm_operation(struct kmb_i2s_info *kmb_i2s, bool playback)
+{
+	struct snd_pcm_substream *substream;
+	bool period_elapsed;
+	unsigned int new_ptr;
+	unsigned int ptr;
+
+	if (playback)
+		substream = kmb_i2s->tx_substream;
+	else
+		substream = kmb_i2s->rx_substream;
+
+	if (!substream || !snd_pcm_running(substream))
+		return;
+
+	if (playback) {
+		ptr = kmb_i2s->tx_ptr;
+		new_ptr = kmb_pcm_tx_fn(kmb_i2s, substream->runtime,
+					ptr, &period_elapsed);
+		cmpxchg(&kmb_i2s->tx_ptr, ptr, new_ptr);
+	} else {
+		ptr = kmb_i2s->rx_ptr;
+		new_ptr = kmb_pcm_rx_fn(kmb_i2s, substream->runtime,
+					ptr, &period_elapsed);
+		cmpxchg(&kmb_i2s->rx_ptr, ptr, new_ptr);
+	}
+
+	if (period_elapsed)
+		snd_pcm_period_elapsed(substream);
+}
+
+static int kmb_pcm_open(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct kmb_i2s_info *kmb_i2s;
+
+	kmb_i2s = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	snd_soc_set_runtime_hwparams(substream, &kmb_pcm_hardware);
+	snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	runtime->private_data = kmb_i2s;
+
+	return 0;
+}
+
+static int kmb_pcm_trigger(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream, int cmd)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct kmb_i2s_info *kmb_i2s = runtime->private_data;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			kmb_i2s->tx_ptr = 0;
+			kmb_i2s->tx_substream = substream;
+		} else {
+			kmb_i2s->rx_ptr = 0;
+			kmb_i2s->rx_substream = substream;
+		}
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			kmb_i2s->tx_substream = NULL;
+		else
+			kmb_i2s->rx_substream = NULL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static irqreturn_t kmb_i2s_irq_handler(int irq, void *dev_id)
+{
+	struct kmb_i2s_info *kmb_i2s = dev_id;
+	struct i2s_clk_config_data *config = &kmb_i2s->config;
+	irqreturn_t ret = IRQ_NONE;
+	u32 isr[4];
+	int i;
+
+	for (i = 0; i < config->chan_nr / 2; i++)
+		isr[i] = readl(kmb_i2s->i2s_base + ISR(i));
+
+	kmb_i2s_clear_irqs(kmb_i2s, SNDRV_PCM_STREAM_PLAYBACK);
+	kmb_i2s_clear_irqs(kmb_i2s, SNDRV_PCM_STREAM_CAPTURE);
+
+	for (i = 0; i < config->chan_nr / 2; i++) {
+		/*
+		 * Check if TX fifo is empty. If empty fill FIFO with samples
+		 */
+		if ((isr[i] & ISR_TXFE)) {
+			kmb_pcm_operation(kmb_i2s, true);
+			ret = IRQ_HANDLED;
+		}
+		/*
+		 * Data available. Retrieve samples from FIFO
+		 */
+		if ((isr[i] & ISR_RXDA)) {
+			kmb_pcm_operation(kmb_i2s, false);
+			ret = IRQ_HANDLED;
+		}
+		/* Error Handling: TX */
+		if (isr[i] & ISR_TXFO) {
+			dev_dbg(kmb_i2s->dev, "TX overrun (ch_id=%d)\n", i);
+			ret = IRQ_HANDLED;
+		}
+		/* Error Handling: RX */
+		if (isr[i] & ISR_RXFO) {
+			dev_dbg(kmb_i2s->dev, "RX overrun (ch_id=%d)\n", i);
+			ret = IRQ_HANDLED;
+		}
+	}
+
+	return ret;
+}
+
+static int kmb_platform_pcm_new(struct snd_soc_component *component,
+				struct snd_soc_pcm_runtime *soc_runtime)
+{
+	size_t size = kmb_pcm_hardware.buffer_bytes_max;
+	/* Use SNDRV_DMA_TYPE_CONTINUOUS as KMB doesn't use PCI sg buffer */
+	snd_pcm_set_managed_buffer_all(soc_runtime->pcm,
+				       SNDRV_DMA_TYPE_CONTINUOUS,
+				       NULL, size, size);
+	return 0;
+}
+
+static snd_pcm_uframes_t kmb_pcm_pointer(struct snd_soc_component *component,
+					 struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct kmb_i2s_info *kmb_i2s = runtime->private_data;
+	snd_pcm_uframes_t pos;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		pos = kmb_i2s->tx_ptr;
+	else
+		pos = kmb_i2s->rx_ptr;
+
+	return pos < runtime->buffer_size ? pos : 0;
+}
+
+static const struct snd_soc_component_driver kmb_component = {
+	.name		= "kmb",
+	.pcm_construct	= kmb_platform_pcm_new,
+	.open		= kmb_pcm_open,
+	.trigger	= kmb_pcm_trigger,
+	.pointer	= kmb_pcm_pointer,
+};
+
+static void kmb_i2s_start(struct kmb_i2s_info *kmb_i2s,
+			  struct snd_pcm_substream *substream)
+{
+	struct i2s_clk_config_data *config = &kmb_i2s->config;
+
+	/* I2S Programming sequence in Keem_Bay_VPU_DB_v1.1 */
+	writel(1, kmb_i2s->i2s_base + IER);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		writel(1, kmb_i2s->i2s_base + ITER);
+	else
+		writel(1, kmb_i2s->i2s_base + IRER);
+
+	kmb_i2s_irq_trigger(kmb_i2s, substream->stream, config->chan_nr, true);
+
+	if (kmb_i2s->master)
+		writel(1, kmb_i2s->i2s_base + CER);
+	else
+		writel(0, kmb_i2s->i2s_base + CER);
+}
+
+static void kmb_i2s_stop(struct kmb_i2s_info *kmb_i2s,
+			 struct snd_pcm_substream *substream)
+{
+	/* I2S Programming sequence in Keem_Bay_VPU_DB_v1.1 */
+	kmb_i2s_clear_irqs(kmb_i2s, substream->stream);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		writel(0, kmb_i2s->i2s_base + ITER);
+	else
+		writel(0, kmb_i2s->i2s_base + IRER);
+
+	kmb_i2s_irq_trigger(kmb_i2s, substream->stream, 8, false);
+
+	if (!kmb_i2s->active) {
+		writel(0, kmb_i2s->i2s_base + CER);
+		writel(0, kmb_i2s->i2s_base + IER);
+	}
+}
+
+static void kmb_disable_clk(void *clk)
+{
+	clk_disable_unprepare(clk);
+}
+
+static int kmb_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
+{
+	struct kmb_i2s_info *kmb_i2s = snd_soc_dai_get_drvdata(cpu_dai);
+	int ret;
+
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBM_CFM:
+		kmb_i2s->master = false;
+		ret = 0;
+		break;
+	case SND_SOC_DAIFMT_CBS_CFS:
+		writel(MASTER_MODE, kmb_i2s->pss_base + I2S_GEN_CFG_0);
+
+		ret = clk_prepare_enable(kmb_i2s->clk_i2s);
+		if (ret < 0)
+			return ret;
+
+		ret = devm_add_action_or_reset(kmb_i2s->dev, kmb_disable_clk,
+					       kmb_i2s->clk_i2s);
+		if (ret)
+			return ret;
+
+		kmb_i2s->master = true;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static int kmb_dai_trigger(struct snd_pcm_substream *substream,
+			   int cmd, struct snd_soc_dai *cpu_dai)
+{
+	struct kmb_i2s_info *kmb_i2s  = snd_soc_dai_get_drvdata(cpu_dai);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		/* Keep track of i2s activity before turn off
+		 * the i2s interface
+		 */
+		kmb_i2s->active++;
+		kmb_i2s_start(kmb_i2s, substream);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+		kmb_i2s->active--;
+		kmb_i2s_stop(kmb_i2s, substream);
+		break;
+	default:
+		return  -EINVAL;
+	}
+
+	return 0;
+}
+
+static void kmb_i2s_config(struct kmb_i2s_info *kmb_i2s, int stream)
+{
+	struct i2s_clk_config_data *config = &kmb_i2s->config;
+	u32 ch_reg;
+
+	kmb_i2s_disable_channels(kmb_i2s, stream);
+
+	for (ch_reg = 0; ch_reg < config->chan_nr / 2; ch_reg++) {
+		if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			writel(kmb_i2s->xfer_resolution,
+			       kmb_i2s->i2s_base + TCR(ch_reg));
+
+			writel(kmb_i2s->fifo_th - 1,
+			       kmb_i2s->i2s_base + TFCR(ch_reg));
+
+			writel(1, kmb_i2s->i2s_base + TER(ch_reg));
+		} else {
+			writel(kmb_i2s->xfer_resolution,
+			       kmb_i2s->i2s_base + RCR(ch_reg));
+
+			writel(kmb_i2s->fifo_th - 1,
+			       kmb_i2s->i2s_base + RFCR(ch_reg));
+
+			writel(1, kmb_i2s->i2s_base + RER(ch_reg));
+		}
+	}
+}
+
+static int kmb_dai_hw_params(struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *hw_params,
+			     struct snd_soc_dai *cpu_dai)
+{
+	struct kmb_i2s_info *kmb_i2s = snd_soc_dai_get_drvdata(cpu_dai);
+	struct i2s_clk_config_data *config = &kmb_i2s->config;
+	u32 register_val, write_val;
+	int ret;
+
+	switch (params_format(hw_params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		config->data_width = 16;
+		kmb_i2s->ccr = 0x00;
+		kmb_i2s->xfer_resolution = 0x02;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		config->data_width = 24;
+		kmb_i2s->ccr = 0x08;
+		kmb_i2s->xfer_resolution = 0x04;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		config->data_width = 32;
+		kmb_i2s->ccr = 0x10;
+		kmb_i2s->xfer_resolution = 0x05;
+		break;
+	default:
+		dev_err(kmb_i2s->dev, "kmb: unsupported PCM fmt");
+		return -EINVAL;
+	}
+
+	config->chan_nr = params_channels(hw_params);
+
+	switch (config->chan_nr) {
+	/* TODO: This switch case will handle up to TDM8 in the near future */
+	case TWO_CHANNEL_SUPPORT:
+		write_val = ((config->chan_nr / 2) << TDM_CHANNEL_CONFIG_BIT) |
+				(config->data_width << DATA_WIDTH_CONFIG_BIT) |
+				MASTER_MODE | I2S_OPERATION;
+
+		writel(write_val, kmb_i2s->pss_base + I2S_GEN_CFG_0);
+
+		register_val = readl(kmb_i2s->pss_base + I2S_GEN_CFG_0);
+		dev_dbg(kmb_i2s->dev, "pss register = 0x%X", register_val);
+		break;
+	default:
+		dev_dbg(kmb_i2s->dev, "channel not supported\n");
+		return -EINVAL;
+	}
+
+	kmb_i2s_config(kmb_i2s, substream->stream);
+
+	writel(kmb_i2s->ccr, kmb_i2s->i2s_base + CCR);
+
+	config->sample_rate = params_rate(hw_params);
+
+	if (kmb_i2s->master) {
+		/* Only 2 ch supported in Master mode */
+		u32 bitclk = config->sample_rate * config->data_width * 2;
+
+		ret = clk_set_rate(kmb_i2s->clk_i2s, bitclk);
+		if (ret) {
+			dev_err(kmb_i2s->dev,
+				"Can't set I2S clock rate: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int kmb_dai_prepare(struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *cpu_dai)
+{
+	struct kmb_i2s_info *kmb_i2s = snd_soc_dai_get_drvdata(cpu_dai);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		writel(1, kmb_i2s->i2s_base + TXFFR);
+	else
+		writel(1, kmb_i2s->i2s_base + RXFFR);
+
+	return 0;
+}
+
+static struct snd_soc_dai_ops kmb_dai_ops = {
+	.trigger	= kmb_dai_trigger,
+	.hw_params	= kmb_dai_hw_params,
+	.prepare	= kmb_dai_prepare,
+	.set_fmt	= kmb_set_dai_fmt,
+};
+
+static struct snd_soc_dai_driver intel_kmb_platform_dai[] = {
+	{
+		.name = "kmb-plat-dai",
+		.playback = {
+			.channels_min = 2,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_48000,
+			.rate_min = 16000,
+			.rate_max = 48000,
+			.formats = (SNDRV_PCM_FMTBIT_S32_LE |
+				    SNDRV_PCM_FMTBIT_S24_LE |
+				    SNDRV_PCM_FMTBIT_S16_LE),
+		},
+		.capture = {
+			.channels_min = 2,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_48000,
+			.rate_min = 16000,
+			.rate_max = 48000,
+			.formats = (SNDRV_PCM_FMTBIT_S32_LE |
+				    SNDRV_PCM_FMTBIT_S24_LE |
+				    SNDRV_PCM_FMTBIT_S16_LE),
+		},
+		.ops = &kmb_dai_ops,
+	},
+};
+
+static int kmb_plat_dai_probe(struct platform_device *pdev)
+{
+	struct snd_soc_dai_driver *kmb_i2s_dai;
+	struct device *dev = &pdev->dev;
+	struct kmb_i2s_info *kmb_i2s;
+	int ret, irq;
+	u32 comp1_reg;
+
+	kmb_i2s = devm_kzalloc(dev, sizeof(*kmb_i2s), GFP_KERNEL);
+	if (!kmb_i2s)
+		return -ENOMEM;
+
+	kmb_i2s_dai = devm_kzalloc(dev, sizeof(*kmb_i2s_dai), GFP_KERNEL);
+	if (!kmb_i2s_dai)
+		return -ENOMEM;
+
+	kmb_i2s_dai->ops = &kmb_dai_ops;
+
+	/* Prepare the related clocks */
+	kmb_i2s->clk_apb = devm_clk_get(dev, "apb_clk");
+	if (IS_ERR(kmb_i2s->clk_apb)) {
+		dev_err(dev, "Failed to get apb clock\n");
+		return PTR_ERR(kmb_i2s->clk_apb);
+	}
+
+	ret = clk_prepare_enable(kmb_i2s->clk_apb);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, kmb_disable_clk, kmb_i2s->clk_apb);
+	if (ret) {
+		dev_err(dev, "Failed to add clk_apb reset action\n");
+		return ret;
+	}
+
+	kmb_i2s->clk_i2s = devm_clk_get(dev, "osc");
+	if (IS_ERR(kmb_i2s->clk_i2s)) {
+		dev_err(dev, "Failed to get osc clock\n");
+		return PTR_ERR(kmb_i2s->clk_i2s);
+	}
+
+	kmb_i2s->i2s_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(kmb_i2s->i2s_base))
+		return PTR_ERR(kmb_i2s->i2s_base);
+
+	kmb_i2s->pss_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(kmb_i2s->pss_base))
+		return PTR_ERR(kmb_i2s->pss_base);
+
+	kmb_i2s->dev = &pdev->dev;
+
+	irq = platform_get_irq_optional(pdev, 0);
+	if (irq > 0) {
+		ret = devm_request_irq(dev, irq, kmb_i2s_irq_handler, 0,
+				       pdev->name, kmb_i2s);
+		if (ret < 0) {
+			dev_err(dev, "failed to request irq\n");
+			return ret;
+		}
+	}
+
+	comp1_reg = readl(kmb_i2s->i2s_base + I2S_COMP_PARAM_1);
+
+	kmb_i2s->fifo_th = (1 << COMP1_FIFO_DEPTH(comp1_reg)) / 2;
+
+	ret = devm_snd_soc_register_component(dev, &kmb_component,
+					      intel_kmb_platform_dai,
+				ARRAY_SIZE(intel_kmb_platform_dai));
+	if (ret) {
+		dev_err(dev, "not able to register dai\n");
+		return ret;
+	}
+
+	dev_set_drvdata(dev, kmb_i2s);
+
+	return ret;
+}
+
+static const struct of_device_id kmb_plat_of_match[] = {
+	{ .compatible = "intel,keembay-i2s", },
+	{}
+};
+
+static struct platform_driver kmb_plat_dai_driver = {
+	.driver		= {
+		.name		= "kmb-plat-dai",
+		.of_match_table = kmb_plat_of_match,
+	},
+	.probe		= kmb_plat_dai_probe,
+};
+
+module_platform_driver(kmb_plat_dai_driver);
+
+MODULE_DESCRIPTION("ASoC Intel KeemBay Platform driver");
+MODULE_AUTHOR("Sia Jee Heng <jee.heng.sia@intel.com>");
+MODULE_AUTHOR("Sit, Michael Wei Hong <michael.wei.hong.sit@intel.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:kmb_platform");
diff --git a/sound/soc/intel/keembay/kmb_platform.h b/sound/soc/intel/keembay/kmb_platform.h
new file mode 100644
index 0000000..2960065
--- /dev/null
+++ b/sound/soc/intel/keembay/kmb_platform.h
@@ -0,0 +1,145 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ *  Intel KeemBay Platform driver
+ *
+ *  Copyright (C) 2020 Intel Corporation.
+ *
+ */
+
+#ifndef KMB_PLATFORM_H_
+#define KMB_PLATFORMP_H_
+
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/types.h>
+
+/* Register values with reference to KMB databook v1.1 */
+/* common register for all channel */
+#define IER		0x000
+#define IRER		0x004
+#define ITER		0x008
+#define CER		0x00C
+#define CCR		0x010
+#define RXFFR		0x014
+#define TXFFR		0x018
+
+/* Interrupt status register fields */
+#define ISR_TXFO	BIT(5)
+#define ISR_TXFE	BIT(4)
+#define ISR_RXFO	BIT(1)
+#define ISR_RXDA	BIT(0)
+
+/* I2S Tx Rx Registers for all channels */
+#define LRBR_LTHR(x)	(0x40 * (x) + 0x020)
+#define RRBR_RTHR(x)	(0x40 * (x) + 0x024)
+#define RER(x)		(0x40 * (x) + 0x028)
+#define TER(x)		(0x40 * (x) + 0x02C)
+#define RCR(x)		(0x40 * (x) + 0x030)
+#define TCR(x)		(0x40 * (x) + 0x034)
+#define ISR(x)		(0x40 * (x) + 0x038)
+#define IMR(x)		(0x40 * (x) + 0x03C)
+#define ROR(x)		(0x40 * (x) + 0x040)
+#define TOR(x)		(0x40 * (x) + 0x044)
+#define RFCR(x)		(0x40 * (x) + 0x048)
+#define TFCR(x)		(0x40 * (x) + 0x04C)
+#define RFF(x)		(0x40 * (x) + 0x050)
+#define TFF(x)		(0x40 * (x) + 0x054)
+
+/* I2S COMP Registers */
+#define I2S_COMP_PARAM_2	0x01F0
+#define I2S_COMP_PARAM_1	0x01F4
+#define I2S_COMP_VERSION	0x01F8
+#define I2S_COMP_TYPE		0x01FC
+
+/* PSS_GEN_CTRL_I2S_GEN_CFG_0 Registers */
+#define I2S_GEN_CFG_0		0x000
+#define PSS_CPR_RST_EN		0x010
+#define PSS_CPR_RST_SET		0x014
+#define PSS_CPR_CLK_CLR		0x000
+#define PSS_CPR_AUX_RST_EN	0x070
+
+#define MASTER_MODE		BIT(13)
+
+/* Interrupt Flag */
+#define TX_INT_FLAG		GENMASK(5, 4)
+#define RX_INT_FLAG		GENMASK(1, 0)
+/*
+ * Component parameter register fields - define the I2S block's
+ * configuration.
+ */
+#define	COMP1_TX_WORDSIZE_3(r)		FIELD_GET(GENMASK(27, 25), (r))
+#define	COMP1_TX_WORDSIZE_2(r)		FIELD_GET(GENMASK(24, 22), (r))
+#define	COMP1_TX_WORDSIZE_1(r)		FIELD_GET(GENMASK(21, 19), (r))
+#define	COMP1_TX_WORDSIZE_0(r)		FIELD_GET(GENMASK(18, 16), (r))
+#define	COMP1_RX_ENABLED(r)		FIELD_GET(BIT(6), (r))
+#define	COMP1_TX_ENABLED(r)		FIELD_GET(BIT(5), (r))
+#define	COMP1_MODE_EN(r)		FIELD_GET(BIT(4), (r))
+#define	COMP1_APB_DATA_WIDTH(r)		FIELD_GET(GENMASK(1, 0), (r))
+#define	COMP2_RX_WORDSIZE_3(r)		FIELD_GET(GENMASK(12, 10), (r))
+#define	COMP2_RX_WORDSIZE_2(r)		FIELD_GET(GENMASK(9, 7), (r))
+#define	COMP2_RX_WORDSIZE_1(r)		FIELD_GET(GENMASK(5, 3), (r))
+#define	COMP2_RX_WORDSIZE_0(r)		FIELD_GET(GENMASK(2, 0), (r))
+
+/* Add 1 to the below registers to indicate the actual size */
+#define	COMP1_TX_CHANNELS(r)	(FIELD_GET(GENMASK(10, 9), (r)) + 1)
+#define	COMP1_RX_CHANNELS(r)	(FIELD_GET(GENMASK(8, 7), (r)) + 1)
+#define	COMP1_FIFO_DEPTH(r)	(FIELD_GET(GENMASK(3, 2), (r)) + 1)
+
+/* Number of entries in WORDSIZE and DATA_WIDTH parameter registers */
+#define	COMP_MAX_WORDSIZE	8	/* 3 bits register width */
+
+#define MAX_CHANNEL_NUM		8
+#define MIN_CHANNEL_NUM		2
+
+#define TWO_CHANNEL_SUPPORT	2	/* up to 2.0 */
+#define FOUR_CHANNEL_SUPPORT	4	/* up to 3.1 */
+#define SIX_CHANNEL_SUPPORT	6	/* up to 5.1 */
+#define EIGHT_CHANNEL_SUPPORT	8	/* up to 7.1 */
+
+#define DWC_I2S_PLAY	BIT(0)
+#define DWC_I2S_RECORD	BIT(1)
+#define DW_I2S_SLAVE	BIT(2)
+#define DW_I2S_MASTER	BIT(3)
+
+#define I2S_RXDMA	0x01C0
+#define I2S_TXDMA	0x01C8
+
+/*
+ * struct i2s_clk_config_data - represent i2s clk configuration data
+ * @chan_nr: number of channel
+ * @data_width: number of bits per sample (8/16/24/32 bit)
+ * @sample_rate: sampling frequency (8Khz, 16Khz, 48Khz)
+ */
+struct i2s_clk_config_data {
+	int chan_nr;
+	u32 data_width;
+	u32 sample_rate;
+};
+
+struct kmb_i2s_info {
+	void __iomem *i2s_base;
+	void __iomem *pss_base;
+	struct clk *clk_i2s;
+	struct clk *clk_apb;
+	int active;
+	unsigned int capability;
+	unsigned int i2s_reg_comp1;
+	unsigned int i2s_reg_comp2;
+	struct device *dev;
+	u32 ccr;
+	u32 xfer_resolution;
+	u32 fifo_th;
+	bool master;
+
+	struct i2s_clk_config_data config;
+	int (*i2s_clk_cfg)(struct i2s_clk_config_data *config);
+
+	/* data related to PIO transfers */
+	bool use_pio;
+	struct snd_pcm_substream *tx_substream;
+	struct snd_pcm_substream *rx_substream;
+	unsigned int tx_ptr;
+	unsigned int rx_ptr;
+};
+
+#endif /* KMB_PLATFORM_H_ */
-- 
1.9.1

