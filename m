Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BF996F100
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2024 12:07:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02323E72;
	Fri,  6 Sep 2024 12:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02323E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725617239;
	bh=pYt1K79P/H3c2K7SbqLwuJcsvsa2d1GvT+MnnuEMYrI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Kk32XajlsD+qf96xfhyLg3rSC5h2W2ZdmX7yK9Y9nus0cFZ2yJcCMpeJuQ4KYIGNt
	 COXvl+ax7IHCufs0951M9EkX2PFH1qWQA1zFecLspzacMVyMR4etYnNwBzHmRGAx/a
	 pL8lad42QGWOS4E1DTJ6z45NjjITmU4MbCYkCKLE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C214AF80199; Fri,  6 Sep 2024 12:05:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8CA9F80634;
	Fri,  6 Sep 2024 12:05:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FBB2F80634; Fri,  6 Sep 2024 12:05:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49249F80614
	for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2024 12:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49249F80614
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A2B2C1A0AB1;
	Fri,  6 Sep 2024 12:05:50 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3C5B21A1059;
	Fri,  6 Sep 2024 12:05:50 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 845F11834898;
	Fri,  6 Sep 2024 18:05:45 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v3 4/6] ASoC: fsl_asrc_m2m: Add memory to memory function
Date: Fri,  6 Sep 2024 17:43:55 +0800
Message-Id: <1725615837-24872-5-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1725615837-24872-1-git-send-email-shengjiu.wang@nxp.com>
References: <1725615837-24872-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: D2JPD6PQWO5U6J6AVUZ7HCCR3U77GYWQ
X-Message-ID-Hash: D2JPD6PQWO5U6J6AVUZ7HCCR3U77GYWQ
X-MailFrom: shengjiu.wang@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D2JPD6PQWO5U6J6AVUZ7HCCR3U77GYWQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Implement the ASRC memory to memory function using
the compress framework, user can use this function with
compress ioctl interface.

This feature can be shared by ASRC and EASRC drivers

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/Kconfig           |   1 +
 sound/soc/fsl/Makefile          |   2 +-
 sound/soc/fsl/fsl_asrc_common.h |   9 +
 sound/soc/fsl/fsl_asrc_m2m.c    | 727 ++++++++++++++++++++++++++++++++
 4 files changed, 738 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/fsl/fsl_asrc_m2m.c

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index e283751abfef..bff9c6bda344 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -8,6 +8,7 @@ config SND_SOC_FSL_ASRC
 	depends on HAS_DMA
 	select REGMAP_MMIO
 	select SND_SOC_GENERIC_DMAENGINE_PCM
+	select SND_COMPRESS_ACCEL
 	help
 	  Say Y if you want to add Asynchronous Sample Rate Converter (ASRC)
 	  support for the Freescale CPUs.
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index ad97244b5cc3..d656a9ab54e3 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -10,7 +10,7 @@ obj-$(CONFIG_SND_SOC_P1022_RDK) += snd-soc-p1022-rdk.o
 # Freescale SSI/DMA/SAI/SPDIF Support
 snd-soc-fsl-audmix-y := fsl_audmix.o
 snd-soc-fsl-asoc-card-y := fsl-asoc-card.o
-snd-soc-fsl-asrc-y := fsl_asrc.o fsl_asrc_dma.o
+snd-soc-fsl-asrc-y := fsl_asrc.o fsl_asrc_dma.o fsl_asrc_m2m.o
 snd-soc-fsl-lpc3xxx-y := lpc3xxx-pcm.o lpc3xxx-i2s.o
 snd-soc-fsl-sai-y := fsl_sai.o
 snd-soc-fsl-ssi-y := fsl_ssi.o
diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
index 3bdd6ea07c09..0cd595b0f629 100644
--- a/sound/soc/fsl/fsl_asrc_common.h
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -60,6 +60,7 @@ struct fsl_asrc_m2m_cap {
  * @buf_len: buffer length of m2m
  * @dma_buffer: buffer pointers
  * @first_convert: start of conversion
+ * @ratio_mod_flag: flag for new ratio modifier
  * @ratio_mod: ratio modification
  */
 struct fsl_asrc_pair {
@@ -84,6 +85,7 @@ struct fsl_asrc_pair {
 	unsigned int buf_len[2];
 	struct snd_dma_buffer dma_buffer[2];
 	unsigned int first_convert;
+	bool ratio_mod_flag;
 	unsigned int ratio_mod;
 };
 
@@ -98,6 +100,7 @@ struct fsl_asrc_pair {
  * @mem_clk: clock source to access register
  * @ipg_clk: clock source to drive peripheral
  * @spba_clk: SPBA clock (optional, depending on SoC design)
+ * @card: compress sound card
  * @lock: spin lock for resource protection
  * @pair: pair pointers
  * @channel_avail: non-occupied channel numbers
@@ -131,6 +134,7 @@ struct fsl_asrc {
 	struct clk *mem_clk;
 	struct clk *ipg_clk;
 	struct clk *spba_clk;
+	struct snd_card *card;
 	spinlock_t lock;      /* spin lock for resource protection */
 
 	struct fsl_asrc_pair *pair[PAIR_CTX_NUM];
@@ -166,4 +170,9 @@ struct fsl_asrc {
 #define DRV_NAME "fsl-asrc-dai"
 extern struct snd_soc_component_driver fsl_asrc_component;
 
+int fsl_asrc_m2m_init(struct fsl_asrc *asrc);
+void fsl_asrc_m2m_exit(struct fsl_asrc *asrc);
+int fsl_asrc_m2m_resume(struct fsl_asrc *asrc);
+int fsl_asrc_m2m_suspend(struct fsl_asrc *asrc);
+
 #endif /* _FSL_ASRC_COMMON_H */
diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
new file mode 100644
index 000000000000..693ec0a477a4
--- /dev/null
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -0,0 +1,727 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (C) 2014-2016 Freescale Semiconductor, Inc.
+// Copyright (C) 2019-2024 NXP
+//
+// Freescale ASRC Memory to Memory (M2M) driver
+
+#include <linux/dma/imx-dma.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-mapping.h>
+#include <linux/pm_runtime.h>
+#include <sound/asound.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/initval.h>
+
+#include "fsl_asrc_common.h"
+
+#define DIR_STR(dir) (dir) == IN ? "in" : "out"
+
+#define ASRC_xPUT_DMA_CALLBACK(dir) \
+	(((dir) == IN) ? asrc_input_dma_callback \
+	: asrc_output_dma_callback)
+
+/* Maximum output and capture buffer size */
+#define ASRC_M2M_BUFFER_SIZE (512 * 1024)
+
+/* Maximum output and capture period size */
+#define ASRC_M2M_PERIOD_SIZE (48 * 1024)
+
+/* dma complete callback */
+static void asrc_input_dma_callback(void *data)
+{
+	struct fsl_asrc_pair *pair = (struct fsl_asrc_pair *)data;
+
+	complete(&pair->complete[IN]);
+}
+
+/* dma complete callback */
+static void asrc_output_dma_callback(void *data)
+{
+	struct fsl_asrc_pair *pair = (struct fsl_asrc_pair *)data;
+
+	complete(&pair->complete[OUT]);
+}
+
+/**
+ *asrc_read_last_fifo: read all the remaining data from FIFO
+ *@pair: Structure pointer of fsl_asrc_pair
+ *@dma_vaddr: virtual address of capture buffer
+ *@length: payload length of capture buffer
+ */
+static void asrc_read_last_fifo(struct fsl_asrc_pair *pair, void *dma_vaddr, u32 *length)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	enum asrc_pair_index index = pair->index;
+	u32 i, reg, size, t_size = 0, width;
+	u32 *reg32 = NULL;
+	u16 *reg16 = NULL;
+	u8  *reg24 = NULL;
+
+	width = snd_pcm_format_physical_width(pair->sample_format[OUT]);
+	if (width == 32)
+		reg32 = dma_vaddr + *length;
+	else if (width == 16)
+		reg16 = dma_vaddr + *length;
+	else
+		reg24 = dma_vaddr + *length;
+retry:
+	size = asrc->get_output_fifo_size(pair);
+	if (size + *length > ASRC_M2M_BUFFER_SIZE)
+		goto end;
+
+	for (i = 0; i < size * pair->channels; i++) {
+		regmap_read(asrc->regmap, asrc->get_fifo_addr(OUT, index), &reg);
+		if (reg32) {
+			*reg32++ = reg;
+		} else if (reg16) {
+			*reg16++ = (u16)reg;
+		} else {
+			*reg24++ = (u8)reg;
+			*reg24++ = (u8)(reg >> 8);
+			*reg24++ = (u8)(reg >> 16);
+		}
+	}
+	t_size += size;
+
+	/* In case there is data left in FIFO */
+	if (size)
+		goto retry;
+end:
+	/* Update payload length */
+	if (reg32)
+		*length += t_size * pair->channels * 4;
+	else if (reg16)
+		*length += t_size * pair->channels * 2;
+	else
+		*length += t_size * pair->channels * 3;
+}
+
+/* config dma channel */
+static int asrc_dmaconfig(struct fsl_asrc_pair *pair,
+			  struct dma_chan *chan,
+			  u32 dma_addr, dma_addr_t buf_addr, u32 buf_len,
+			  int dir, int width)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &asrc->pdev->dev;
+	struct dma_slave_config slave_config;
+	enum dma_slave_buswidth buswidth;
+	unsigned int sg_len, max_period_size;
+	struct scatterlist *sg;
+	int ret, i;
+
+	switch (width) {
+	case 8:
+		buswidth = DMA_SLAVE_BUSWIDTH_1_BYTE;
+		break;
+	case 16:
+		buswidth = DMA_SLAVE_BUSWIDTH_2_BYTES;
+		break;
+	case 24:
+		buswidth = DMA_SLAVE_BUSWIDTH_3_BYTES;
+		break;
+	case 32:
+		buswidth = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		break;
+	default:
+		dev_err(dev, "invalid word width\n");
+		return -EINVAL;
+	}
+
+	memset(&slave_config, 0, sizeof(slave_config));
+	if (dir == IN) {
+		slave_config.direction = DMA_MEM_TO_DEV;
+		slave_config.dst_addr = dma_addr;
+		slave_config.dst_addr_width = buswidth;
+		slave_config.dst_maxburst = asrc->m2m_get_maxburst(IN, pair);
+	} else {
+		slave_config.direction = DMA_DEV_TO_MEM;
+		slave_config.src_addr = dma_addr;
+		slave_config.src_addr_width = buswidth;
+		slave_config.src_maxburst = asrc->m2m_get_maxburst(OUT, pair);
+	}
+
+	ret = dmaengine_slave_config(chan, &slave_config);
+	if (ret) {
+		dev_err(dev, "failed to config dmaengine for %s task: %d\n",
+			DIR_STR(dir), ret);
+		return -EINVAL;
+	}
+
+	max_period_size = rounddown(ASRC_M2M_PERIOD_SIZE, width * pair->channels / 8);
+	/* scatter gather mode */
+	sg_len = buf_len / max_period_size;
+	if (buf_len % max_period_size)
+		sg_len += 1;
+
+	sg = kmalloc_array(sg_len, sizeof(*sg), GFP_KERNEL);
+	if (!sg)
+		return -ENOMEM;
+
+	sg_init_table(sg, sg_len);
+	for (i = 0; i < (sg_len - 1); i++) {
+		sg_dma_address(&sg[i]) = buf_addr + i * max_period_size;
+		sg_dma_len(&sg[i]) = max_period_size;
+	}
+	sg_dma_address(&sg[i]) = buf_addr + i * max_period_size;
+	sg_dma_len(&sg[i]) = buf_len - i * max_period_size;
+
+	pair->desc[dir] = dmaengine_prep_slave_sg(chan, sg, sg_len,
+						  slave_config.direction,
+						  DMA_PREP_INTERRUPT);
+	kfree(sg);
+	if (!pair->desc[dir]) {
+		dev_err(dev, "failed to prepare dmaengine for %s task\n", DIR_STR(dir));
+		return -EINVAL;
+	}
+
+	pair->desc[dir]->callback = ASRC_xPUT_DMA_CALLBACK(dir);
+	pair->desc[dir]->callback_param = pair;
+
+	return 0;
+}
+
+/* main function of converter */
+static void asrc_m2m_device_run(struct fsl_asrc_pair *pair, struct snd_compr_task_runtime *task)
+{
+	struct fsl_asrc *asrc = pair->asrc;
+	struct device *dev = &asrc->pdev->dev;
+	enum asrc_pair_index index = pair->index;
+	struct snd_dma_buffer *src_buf, *dst_buf;
+	unsigned int in_buf_len;
+	unsigned int out_dma_len;
+	unsigned int width;
+	u32 fifo_addr;
+	int ret;
+
+	/* set ratio mod */
+	if (asrc->m2m_set_ratio_mod) {
+		if (pair->ratio_mod_flag) {
+			asrc->m2m_set_ratio_mod(pair, pair->ratio_mod);
+			pair->ratio_mod_flag = false;
+		}
+	}
+
+	src_buf = &pair->dma_buffer[IN];
+	dst_buf = &pair->dma_buffer[OUT];
+
+	width = snd_pcm_format_physical_width(pair->sample_format[IN]);
+	fifo_addr = asrc->paddr + asrc->get_fifo_addr(IN, index);
+
+	in_buf_len = task->input_size;
+
+	if (in_buf_len < width * pair->channels / 8 ||
+	    in_buf_len > ASRC_M2M_BUFFER_SIZE ||
+	    in_buf_len % (width * pair->channels / 8)) {
+		dev_err(dev, "out buffer size is error: [%d]\n", in_buf_len);
+		goto end;
+	}
+
+	/* dma config for output dma channel */
+	ret = asrc_dmaconfig(pair,
+			     pair->dma_chan[IN],
+			     fifo_addr,
+			     src_buf->addr,
+			     in_buf_len, IN, width);
+	if (ret) {
+		dev_err(dev, "out dma config error\n");
+		goto end;
+	}
+
+	width = snd_pcm_format_physical_width(pair->sample_format[OUT]);
+	fifo_addr = asrc->paddr + asrc->get_fifo_addr(OUT, index);
+	out_dma_len = asrc->m2m_calc_out_len(pair, in_buf_len);
+	if (out_dma_len > 0 && out_dma_len <= ASRC_M2M_BUFFER_SIZE) {
+		/* dma config for capture dma channel */
+		ret = asrc_dmaconfig(pair,
+				     pair->dma_chan[OUT],
+				     fifo_addr,
+				     dst_buf->addr,
+				     out_dma_len, OUT, width);
+		if (ret) {
+			dev_err(dev, "cap dma config error\n");
+			goto end;
+		}
+	} else if (out_dma_len > ASRC_M2M_BUFFER_SIZE) {
+		dev_err(dev, "cap buffer size error\n");
+		goto end;
+	}
+
+	reinit_completion(&pair->complete[IN]);
+	reinit_completion(&pair->complete[OUT]);
+
+	/* Submit DMA request */
+	dmaengine_submit(pair->desc[IN]);
+	dma_async_issue_pending(pair->desc[IN]->chan);
+	if (out_dma_len > 0) {
+		dmaengine_submit(pair->desc[OUT]);
+		dma_async_issue_pending(pair->desc[OUT]->chan);
+	}
+
+	asrc->m2m_start(pair);
+
+	if (!wait_for_completion_interruptible_timeout(&pair->complete[IN], 10 * HZ)) {
+		dev_err(dev, "out DMA task timeout\n");
+		goto end;
+	}
+
+	if (out_dma_len > 0) {
+		if (!wait_for_completion_interruptible_timeout(&pair->complete[OUT], 10 * HZ)) {
+			dev_err(dev, "cap DMA task timeout\n");
+			goto end;
+		}
+	}
+
+	/* read the last words from FIFO */
+	asrc_read_last_fifo(pair, dst_buf->area, &out_dma_len);
+	/* update payload length for capture */
+	task->output_size = out_dma_len;
+end:
+	return;
+}
+
+static int fsl_asrc_m2m_comp_open(struct snd_compr_stream *stream)
+{
+	struct fsl_asrc *asrc = stream->private_data;
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct device *dev = &asrc->pdev->dev;
+	struct fsl_asrc_pair *pair;
+	int size, ret;
+
+	pair = kzalloc(sizeof(*pair) + asrc->pair_priv_size, GFP_KERNEL);
+	if (!pair)
+		return -ENOMEM;
+
+	pair->private = (void *)pair + sizeof(struct fsl_asrc_pair);
+	pair->asrc = asrc;
+
+	init_completion(&pair->complete[IN]);
+	init_completion(&pair->complete[OUT]);
+
+	runtime->private_data = pair;
+
+	size = ASRC_M2M_BUFFER_SIZE;
+	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, dev, size, &pair->dma_buffer[IN]);
+	if (ret)
+		goto error_alloc_in_buf;
+
+	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, dev, size, &pair->dma_buffer[OUT]);
+	if (ret)
+		goto error_alloc_out_buf;
+
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		dev_err(dev, "Failed to power up asrc\n");
+		goto err_pm_runtime;
+	}
+
+	return 0;
+
+err_pm_runtime:
+	snd_dma_free_pages(&pair->dma_buffer[OUT]);
+error_alloc_out_buf:
+	snd_dma_free_pages(&pair->dma_buffer[IN]);
+error_alloc_in_buf:
+	kfree(pair);
+	return ret;
+}
+
+static int fsl_asrc_m2m_comp_release(struct snd_compr_stream *stream)
+{
+	struct fsl_asrc *asrc = stream->private_data;
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct fsl_asrc_pair *pair = runtime->private_data;
+	struct device *dev = &asrc->pdev->dev;
+
+	pm_runtime_put_sync(dev);
+
+	snd_dma_free_pages(&pair->dma_buffer[IN]);
+	snd_dma_free_pages(&pair->dma_buffer[OUT]);
+
+	kfree(runtime->private_data);
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_comp_set_params(struct snd_compr_stream *stream,
+					struct snd_compr_params *params)
+{
+	struct fsl_asrc *asrc = stream->private_data;
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct fsl_asrc_pair *pair = runtime->private_data;
+	struct fsl_asrc_m2m_cap cap;
+	int ret, i;
+
+	ret = asrc->m2m_get_cap(&cap);
+	if (ret)
+		return -EINVAL;
+
+	if (pcm_format_to_bits(params->codec.format) & cap.fmt_in)
+		pair->sample_format[IN] = params->codec.format;
+	else
+		return -EINVAL;
+
+	if (pcm_format_to_bits(params->codec.pcm_format) & cap.fmt_out)
+		pair->sample_format[OUT] = params->codec.pcm_format;
+	else
+		return -EINVAL;
+
+	/* check input rate is in scope */
+	for (i = 0; i < cap.rate_in_count; i++)
+		if (params->codec.sample_rate == cap.rate_in[i]) {
+			pair->rate[IN] = params->codec.sample_rate;
+			break;
+		}
+	if (i == cap.rate_in_count)
+		return -EINVAL;
+
+	/* check output rate is in scope */
+	for (i = 0; i < cap.rate_out_count; i++)
+		if (params->codec.options.src_d.out_sample_rate == cap.rate_out[i]) {
+			pair->rate[OUT] = params->codec.options.src_d.out_sample_rate;
+			break;
+		}
+	if (i == cap.rate_out_count)
+		return -EINVAL;
+
+	if (params->codec.ch_in != params->codec.ch_out ||
+	    params->codec.ch_in < cap.chan_min ||
+	    params->codec.ch_in > cap.chan_max)
+		return -EINVAL;
+
+	pair->channels = params->codec.ch_in;
+	pair->buf_len[IN] = params->buffer.fragment_size;
+	pair->buf_len[OUT] = params->buffer.fragment_size;
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
+{
+	struct snd_dma_buffer *dmab = dmabuf->priv;
+
+	return snd_dma_buffer_mmap(dmab, vma);
+}
+
+static struct sg_table *fsl_asrc_m2m_map_dma_buf(struct dma_buf_attachment *attachment,
+						 enum dma_data_direction direction)
+{
+	struct snd_dma_buffer *dmab = attachment->dmabuf->priv;
+	struct sg_table *sgt;
+
+	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
+	if (!sgt)
+		return NULL;
+
+	if (dma_get_sgtable(attachment->dev, sgt, dmab->area, dmab->addr, dmab->bytes) < 0)
+		goto free;
+
+	if (dma_map_sgtable(attachment->dev, sgt, direction, 0))
+		goto free;
+
+	return sgt;
+
+free:
+	sg_free_table(sgt);
+	kfree(sgt);
+	return NULL;
+}
+
+static void fsl_asrc_m2m_unmap_dma_buf(struct dma_buf_attachment *attachment,
+				       struct sg_table *table,
+				       enum dma_data_direction direction)
+{
+	dma_unmap_sgtable(attachment->dev, table, direction, 0);
+}
+
+static void fsl_asrc_m2m_release(struct dma_buf *dmabuf)
+{
+	/* buffer is released by fsl_asrc_m2m_comp_release() */
+}
+
+static const struct dma_buf_ops fsl_asrc_m2m_dma_buf_ops = {
+	.mmap = fsl_asrc_m2m_mmap,
+	.map_dma_buf = fsl_asrc_m2m_map_dma_buf,
+	.unmap_dma_buf = fsl_asrc_m2m_unmap_dma_buf,
+	.release = fsl_asrc_m2m_release,
+};
+
+static int fsl_asrc_m2m_comp_task_create(struct snd_compr_stream *stream,
+					 struct snd_compr_task_runtime *task)
+{
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info_in);
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info_out);
+	struct fsl_asrc *asrc = stream->private_data;
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct fsl_asrc_pair *pair = runtime->private_data;
+	struct device *dev = &asrc->pdev->dev;
+	int ret;
+
+	exp_info_in.ops = &fsl_asrc_m2m_dma_buf_ops;
+	exp_info_in.size = ASRC_M2M_BUFFER_SIZE;
+	exp_info_in.flags = O_RDWR;
+	exp_info_in.priv = &pair->dma_buffer[IN];
+	task->input = dma_buf_export(&exp_info_in);
+	if (IS_ERR(task->input)) {
+		ret = PTR_ERR(task->input);
+		return ret;
+	}
+
+	exp_info_out.ops = &fsl_asrc_m2m_dma_buf_ops;
+	exp_info_out.size = ASRC_M2M_BUFFER_SIZE;
+	exp_info_out.flags = O_RDWR;
+	exp_info_out.priv = &pair->dma_buffer[OUT];
+	task->output = dma_buf_export(&exp_info_out);
+	if (IS_ERR(task->output)) {
+		ret = PTR_ERR(task->output);
+		return ret;
+	}
+
+	/* Request asrc pair/context */
+	ret = asrc->request_pair(pair->channels, pair);
+	if (ret) {
+		dev_err(dev, "failed to request pair: %d\n", ret);
+		goto err_request_pair;
+	}
+
+	ret = asrc->m2m_prepare(pair);
+	if (ret) {
+		dev_err(dev, "failed to start pair part one: %d\n", ret);
+		goto err_start_part_one;
+	}
+
+	/* Request dma channels */
+	pair->dma_chan[IN] = asrc->get_dma_channel(pair, IN);
+	if (!pair->dma_chan[IN]) {
+		dev_err(dev, "[ctx%d] failed to get input DMA channel\n", pair->index);
+		ret = -EBUSY;
+		goto err_dma_channel_in;
+	}
+
+	pair->dma_chan[OUT] = asrc->get_dma_channel(pair, OUT);
+	if (!pair->dma_chan[OUT]) {
+		dev_err(dev, "[ctx%d] failed to get output DMA channel\n", pair->index);
+		ret = -EBUSY;
+		goto err_dma_channel_out;
+	}
+
+	return 0;
+
+err_dma_channel_out:
+	dma_release_channel(pair->dma_chan[IN]);
+err_dma_channel_in:
+	if (asrc->m2m_unprepare)
+		asrc->m2m_unprepare(pair);
+err_start_part_one:
+	asrc->release_pair(pair);
+err_request_pair:
+	return ret;
+}
+
+static int fsl_asrc_m2m_comp_task_start(struct snd_compr_stream *stream,
+					struct snd_compr_task_runtime *task)
+{
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct fsl_asrc_pair *pair = runtime->private_data;
+
+	asrc_m2m_device_run(pair, task);
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_comp_task_stop(struct snd_compr_stream *stream,
+				       struct snd_compr_task_runtime *task)
+{
+	return 0;
+}
+
+static int fsl_asrc_m2m_comp_task_free(struct snd_compr_stream *stream,
+				       struct snd_compr_task_runtime *task)
+{
+	struct fsl_asrc *asrc = stream->private_data;
+	struct snd_compr_runtime *runtime = stream->runtime;
+	struct fsl_asrc_pair *pair = runtime->private_data;
+
+	/* Stop & release pair/context */
+	if (asrc->m2m_stop)
+		asrc->m2m_stop(pair);
+
+	if (asrc->m2m_unprepare)
+		asrc->m2m_unprepare(pair);
+	asrc->release_pair(pair);
+
+	/* Release dma channel */
+	if (pair->dma_chan[IN])
+		dma_release_channel(pair->dma_chan[IN]);
+	if (pair->dma_chan[OUT])
+		dma_release_channel(pair->dma_chan[OUT]);
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_get_caps(struct snd_compr_stream *cstream,
+				 struct snd_compr_caps *caps)
+{
+	caps->num_codecs = 1;
+	caps->min_fragment_size = 4096;
+	caps->max_fragment_size = 4096;
+	caps->min_fragments = 1;
+	caps->max_fragments = 1;
+	caps->codecs[0] = SND_AUDIOCODEC_PCM;
+
+	return 0;
+}
+
+static int fsl_asrc_m2m_fill_codec_caps(struct fsl_asrc *asrc,
+					struct snd_compr_codec_caps *codec)
+{
+	struct fsl_asrc_m2m_cap cap;
+	snd_pcm_format_t k;
+	int j = 0;
+	int ret;
+
+	ret = asrc->m2m_get_cap(&cap);
+	if (ret)
+		return -EINVAL;
+
+	pcm_for_each_format(k) {
+		if (pcm_format_to_bits(k) & cap.fmt_in) {
+			codec->descriptor[j].max_ch = cap.chan_max;
+			memcpy(codec->descriptor[j].sample_rates,
+			       cap.rate_in,
+			       cap.rate_in_count * sizeof(__u32));
+			codec->descriptor[j].num_sample_rates = cap.rate_in_count;
+			codec->descriptor[j].formats = k;
+			codec->descriptor[j].pcm_formats = cap.fmt_out;
+			codec->descriptor[j].src.out_sample_rate_min = cap.rate_out[0];
+			codec->descriptor[j].src.out_sample_rate_max =
+				cap.rate_out[cap.rate_out_count - 1];
+			j++;
+		}
+	}
+
+	codec->codec = SND_AUDIOCODEC_PCM;
+	codec->num_descriptors = j;
+	return 0;
+}
+
+static int fsl_asrc_m2m_get_codec_caps(struct snd_compr_stream *stream,
+				       struct snd_compr_codec_caps *codec)
+{
+	struct fsl_asrc *asrc = stream->private_data;
+
+	return fsl_asrc_m2m_fill_codec_caps(asrc, codec);
+}
+
+static struct snd_compr_ops fsl_asrc_m2m_compr_ops = {
+	.open = fsl_asrc_m2m_comp_open,
+	.free = fsl_asrc_m2m_comp_release,
+	.set_params = fsl_asrc_m2m_comp_set_params,
+	.get_caps = fsl_asrc_m2m_get_caps,
+	.get_codec_caps = fsl_asrc_m2m_get_codec_caps,
+	.task_create = fsl_asrc_m2m_comp_task_create,
+	.task_start = fsl_asrc_m2m_comp_task_start,
+	.task_stop = fsl_asrc_m2m_comp_task_stop,
+	.task_free = fsl_asrc_m2m_comp_task_free,
+};
+
+int fsl_asrc_m2m_suspend(struct fsl_asrc *asrc)
+{
+	struct fsl_asrc_pair *pair;
+	int i;
+
+	for (i = 0; i < PAIR_CTX_NUM; i++) {
+		pair = asrc->pair[i];
+		if (!pair)
+			continue;
+		if (!completion_done(&pair->complete[IN])) {
+			if (pair->dma_chan[IN])
+				dmaengine_terminate_all(pair->dma_chan[IN]);
+			asrc_input_dma_callback((void *)pair);
+		}
+		if (!completion_done(&pair->complete[OUT])) {
+			if (pair->dma_chan[OUT])
+				dmaengine_terminate_all(pair->dma_chan[OUT]);
+			asrc_output_dma_callback((void *)pair);
+		}
+
+		if (asrc->m2m_pair_suspend)
+			asrc->m2m_pair_suspend(pair);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fsl_asrc_m2m_suspend);
+
+int fsl_asrc_m2m_resume(struct fsl_asrc *asrc)
+{
+	struct fsl_asrc_pair *pair;
+	int i;
+
+	for (i = 0; i < PAIR_CTX_NUM; i++) {
+		pair = asrc->pair[i];
+		if (!pair)
+			continue;
+		if (asrc->m2m_pair_resume)
+			asrc->m2m_pair_resume(pair);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fsl_asrc_m2m_resume);
+
+int fsl_asrc_m2m_init(struct fsl_asrc *asrc)
+{
+	struct device *dev = &asrc->pdev->dev;
+	struct snd_card *card;
+	struct snd_compr *compr;
+	int ret;
+
+	ret = snd_card_new(dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
+			   THIS_MODULE, 0, &card);
+	if (ret < 0)
+		return ret;
+
+	strscpy(card->driver, "fsl-asrc-m2m", sizeof(card->driver));
+	strscpy(card->shortname, "ASRC-M2M", sizeof(card->shortname));
+	strscpy(card->longname, "ASRC-M2M", sizeof(card->shortname));
+
+	asrc->card = card;
+
+	compr = devm_kzalloc(dev, sizeof(*compr), GFP_KERNEL);
+	if (!compr) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	compr->ops = &fsl_asrc_m2m_compr_ops;
+	compr->private_data = asrc;
+
+	ret = snd_compress_new(card, 0, SND_COMPRESS_ACCEL, "ASRC M2M", compr);
+	if (ret < 0)
+		goto err;
+
+	ret = snd_card_register(card);
+	if (ret < 0)
+		goto err;
+
+	return 0;
+err:
+	snd_card_free(card);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(fsl_asrc_m2m_init);
+
+void fsl_asrc_m2m_exit(struct fsl_asrc *asrc)
+{
+	struct snd_card *card = asrc->card;
+
+	snd_card_free(card);
+}
+EXPORT_SYMBOL_GPL(fsl_asrc_m2m_exit);
+
+MODULE_IMPORT_NS(DMA_BUF);
+MODULE_AUTHOR("Shengjiu Wang <Shengjiu.Wang@nxp.com>");
+MODULE_DESCRIPTION("Freescale ASRC M2M driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1

