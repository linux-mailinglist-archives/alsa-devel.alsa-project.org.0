Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6286D423D25
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 13:47:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F21B71695;
	Wed,  6 Oct 2021 13:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F21B71695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633520824;
	bh=QlIJ8GQDf4DRzUcBfKhCNsxDTMvE6MPJMQeV/azIwkQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cyC6X5d5fDugG2b0CxxXIWP/wbHV7gyxfNVsV5tvGJd4C4D00/QZFz6RPrTWpUmTT
	 7vkJFdPCOeA6C0ETCp/qCqEecTVEUMwutoY//RV6iKtENq2tBxC5TX4e2jSbf7Sqo9
	 ZHHonUrG7zxcIHT3z7rOa2YkifIOU/6sCALlcaiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C722F80587;
	Wed,  6 Oct 2021 13:40:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1542CF804FF; Wed,  6 Oct 2021 13:40:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D86EF8032D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 13:40:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D86EF8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="GpIXxmo5"
Received: by mail-wr1-x434.google.com with SMTP id r7so7856115wrc.10
 for <alsa-devel@alsa-project.org>; Wed, 06 Oct 2021 04:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WS+ifHp9YieYhhFn7sdNabOmVQ8eABncZ4BoQKf0O6E=;
 b=GpIXxmo5E0TkMvTo1IrhzG3ZmuyxSin8CzdzBA93F9/3wRAld44MXNveAxelPo6DMO
 eXfVJcfFa1Zb+wCi1NklusfS41D1n0WpsaM/qLGZfsrM8q0jrpOeyCWOXmED4XCpKl4v
 K9UlRXrsF24M3geEq28QcrtQnQwPb5/QLl2fqcWo1vgS8aRZRcy/Tl92LKUFFyWFfZsO
 HVU6XYnPdpFNvrcR5aBhofWitaN+yY8+UhK/NfuHnqMNivUiakhmUvdTIEe4wufVTPkV
 Gnep3CfPje3SRhsJ0j6PQi7JflncZbRgiBByj1ghUjKIN4VY2ciGOwne2v1k0kGSS9h/
 tGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WS+ifHp9YieYhhFn7sdNabOmVQ8eABncZ4BoQKf0O6E=;
 b=dtpcXGwGcdtmHw6K7tBZRaoJ/UjbvAEQi3dpaLsy8jozj81j0PS4q3xOqlHuSf16K6
 GYYgfQ1tSEEb6fYF1WWqKW4LXLAMXnsIUD1yXbu43fBCFPa9OVSBJ8HuulxqCmIwGQQY
 a2ZChXXDhAUGn33cjiFWJuwbx4FpcTCrbZhQExBLiqWaaMf0BxSvB5fEoY87XViWJZA2
 Rl7L5BM8qtro/pDnkRFkwY+iBQHSfotazZKcwCnHzpEcy+/tur9m4PG9YzzK3Dt0tGQD
 EmTm3q1s+8JmbCPsXGVZip4Pu7CxnebcnlTwzfXaPGQZwA/YwlL/aH8kMDSX68IizVpC
 hX5A==
X-Gm-Message-State: AOAM533PiEQG+wwU4W/BS+TNW6F2yM5f4dbAr8bFAZGGNK6eXGJkHvXR
 Kil+XCBkj4hjc9JU8MtkgzbGRrb52BCDDA==
X-Google-Smtp-Source: ABdhPJwGmGWmAI7A88zpurNZXacp8bb3ugkyY8AXjazWxqPreabvBqnVmnL7qKiapo2Y3aEz0i9qfQ==
X-Received: by 2002:a05:600c:35d2:: with SMTP id
 r18mr9223045wmq.97.1633520423392; 
 Wed, 06 Oct 2021 04:40:23 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id n11sm5540110wmq.19.2021.10.06.04.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 04:40:22 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [PATCH v9 14/17] ASoC: qdsp6: audioreach: add q6apm-dai support
Date: Wed,  6 Oct 2021 12:39:47 +0100
Message-Id: <20211006113950.10782-15-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211006113950.10782-1-srinivas.kandagatla@linaro.org>
References: <20211006113950.10782-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com
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

Add support to pcm dais in Audio Process Manager.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/qcom/Kconfig           |   5 +
 sound/soc/qcom/qdsp6/Makefile    |   1 +
 sound/soc/qcom/qdsp6/q6apm-dai.c | 416 +++++++++++++++++++++++++++++++
 3 files changed, 422 insertions(+)
 create mode 100644 sound/soc/qcom/qdsp6/q6apm-dai.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 66d8436ab0a8..2e5625b93b38 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -84,8 +84,13 @@ config SND_SOC_QDSP6_ASM_DAI
 	select SND_SOC_COMPRESS
 	tristate
 
+config SND_SOC_QDSP6_APM_DAI
+	tristate
+	select SND_SOC_COMPRESS
+
 config SND_SOC_QDSP6_APM
 	tristate
+	select SND_SOC_QDSP6_APM_DAI
 
 config SND_SOC_QDSP6
 	tristate "SoC ALSA audio driver for QDSP6"
diff --git a/sound/soc/qcom/qdsp6/Makefile b/sound/soc/qcom/qdsp6/Makefile
index 766b824f6597..a4ec7c4d0e48 100644
--- a/sound/soc/qcom/qdsp6/Makefile
+++ b/sound/soc/qcom/qdsp6/Makefile
@@ -13,3 +13,4 @@ obj-$(CONFIG_SND_SOC_QDSP6_ASM) += q6asm.o
 obj-$(CONFIG_SND_SOC_QDSP6_ASM_DAI) += q6asm-dai.o
 
 obj-$(CONFIG_SND_SOC_QDSP6_APM) += snd-q6apm.o
+obj-$(CONFIG_SND_SOC_QDSP6_APM_DAI) += q6apm-dai.o
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
new file mode 100644
index 000000000000..eb1c3aec479b
--- /dev/null
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -0,0 +1,416 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2021, Linaro Limited
+
+#include <linux/init.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/pcm.h>
+#include <asm/dma.h>
+#include <linux/dma-mapping.h>
+#include <linux/of_device.h>
+#include <sound/pcm_params.h>
+#include "q6apm.h"
+
+#define DRV_NAME "q6apm-dai"
+
+#define PLAYBACK_MIN_NUM_PERIODS	2
+#define PLAYBACK_MAX_NUM_PERIODS	8
+#define PLAYBACK_MAX_PERIOD_SIZE	65536
+#define PLAYBACK_MIN_PERIOD_SIZE	128
+#define CAPTURE_MIN_NUM_PERIODS		2
+#define CAPTURE_MAX_NUM_PERIODS		8
+#define CAPTURE_MAX_PERIOD_SIZE		4096
+#define CAPTURE_MIN_PERIOD_SIZE		320
+#define BUFFER_BYTES_MAX (PLAYBACK_MAX_NUM_PERIODS * PLAYBACK_MAX_PERIOD_SIZE)
+#define BUFFER_BYTES_MIN (PLAYBACK_MIN_NUM_PERIODS * PLAYBACK_MIN_PERIOD_SIZE)
+#define SID_MASK_DEFAULT	0xF
+
+enum stream_state {
+	Q6APM_STREAM_IDLE = 0,
+	Q6APM_STREAM_STOPPED,
+	Q6APM_STREAM_RUNNING,
+};
+
+struct q6apm_dai_rtd {
+	struct snd_pcm_substream *substream;
+	struct snd_compr_stream *cstream;
+	struct snd_compr_params codec_param;
+	struct snd_dma_buffer dma_buffer;
+	phys_addr_t phys;
+	unsigned int pcm_size;
+	unsigned int pcm_count;
+	unsigned int pos;       /* Buffer position */
+	unsigned int periods;
+	unsigned int bytes_sent;
+	unsigned int bytes_received;
+	unsigned int copied_total;
+	uint16_t bits_per_sample;
+	uint16_t source; /* Encoding source bit mask */
+	uint16_t session_id;
+	enum stream_state state;
+	struct q6apm_graph *graph;
+};
+
+struct q6apm_dai_data {
+	long long sid;
+};
+
+static struct snd_pcm_hardware q6apm_dai_hardware_capture = {
+	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
+				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
+				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME),
+	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
+	.rates =                SNDRV_PCM_RATE_8000_48000,
+	.rate_min =             8000,
+	.rate_max =             48000,
+	.channels_min =         2,
+	.channels_max =         4,
+	.buffer_bytes_max =     CAPTURE_MAX_NUM_PERIODS * CAPTURE_MAX_PERIOD_SIZE,
+	.period_bytes_min =	CAPTURE_MIN_PERIOD_SIZE,
+	.period_bytes_max =     CAPTURE_MAX_PERIOD_SIZE,
+	.periods_min =          CAPTURE_MIN_NUM_PERIODS,
+	.periods_max =          CAPTURE_MAX_NUM_PERIODS,
+	.fifo_size =            0,
+};
+
+static struct snd_pcm_hardware q6apm_dai_hardware_playback = {
+	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
+				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
+				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME),
+	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
+	.rates =                SNDRV_PCM_RATE_8000_192000,
+	.rate_min =             8000,
+	.rate_max =             192000,
+	.channels_min =         2,
+	.channels_max =         8,
+	.buffer_bytes_max =     (PLAYBACK_MAX_NUM_PERIODS * PLAYBACK_MAX_PERIOD_SIZE),
+	.period_bytes_min =	PLAYBACK_MIN_PERIOD_SIZE,
+	.period_bytes_max =     PLAYBACK_MAX_PERIOD_SIZE,
+	.periods_min =          PLAYBACK_MIN_NUM_PERIODS,
+	.periods_max =          PLAYBACK_MAX_NUM_PERIODS,
+	.fifo_size =            0,
+};
+
+static void event_handler(uint32_t opcode, uint32_t token, uint32_t *payload, void *priv)
+{
+	struct q6apm_dai_rtd *prtd = priv;
+	struct snd_pcm_substream *substream = prtd->substream;
+
+	switch (opcode) {
+	case APM_CLIENT_EVENT_CMD_EOS_DONE:
+		prtd->state = Q6APM_STREAM_STOPPED;
+		break;
+	case APM_CLIENT_EVENT_DATA_WRITE_DONE:
+		prtd->pos += prtd->pcm_count;
+		snd_pcm_period_elapsed(substream);
+		if (prtd->state == Q6APM_STREAM_RUNNING)
+			q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
+
+		break;
+	case APM_CLIENT_EVENT_DATA_READ_DONE:
+		prtd->pos += prtd->pcm_count;
+		snd_pcm_period_elapsed(substream);
+		if (prtd->state == Q6APM_STREAM_RUNNING)
+			q6apm_read(prtd->graph);
+
+		break;
+	default:
+		break;
+	}
+}
+
+static int q6apm_dai_prepare(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct q6apm_dai_rtd *prtd = runtime->private_data;
+	struct audioreach_module_config cfg;
+	struct device *dev = component->dev;
+	struct q6apm_dai_data *pdata;
+	int ret;
+
+	pdata = snd_soc_component_get_drvdata(component);
+	if (!pdata)
+		return -EINVAL;
+
+	if (!prtd || !prtd->graph) {
+		dev_err(dev, "%s: private data null or audio client freed\n", __func__);
+		return -EINVAL;
+	}
+
+	cfg.direction = substream->stream;
+	cfg.sample_rate = runtime->rate;
+	cfg.num_channels = runtime->channels;
+	cfg.bit_width = prtd->bits_per_sample;
+
+	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
+	prtd->pos = 0;
+	/* rate and channels are sent to audio driver */
+	ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
+	if (ret < 0) {
+		dev_err(dev, "%s: q6apm_open_write failed\n", __func__);
+		return ret;
+	}
+
+	ret = q6apm_graph_media_format_pcm(prtd->graph, &cfg);
+	if (ret < 0)
+		dev_err(dev, "%s: CMD Format block failed\n", __func__);
+
+	ret = q6apm_map_memory_regions(prtd->graph, substream->stream, prtd->phys,
+				       (prtd->pcm_size / prtd->periods), prtd->periods);
+
+	if (ret < 0) {
+		dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
+		return -ENOMEM;
+	}
+
+	ret = q6apm_graph_prepare(prtd->graph);
+	if (ret) {
+		dev_err(dev, "Failed to prepare Graph %d\n", ret);
+		return ret;
+	}
+
+	ret = q6apm_graph_start(prtd->graph);
+	if (ret) {
+		dev_err(dev, "Failed to Start Graph %d\n", ret);
+		return ret;
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+		int i;
+		/* Queue the buffers for Capture ONLY after graph is started */
+		for (i = 0; i < runtime->periods; i++)
+			q6apm_read(prtd->graph);
+
+	}
+
+	/* Now that graph as been prepared and started update the internal state accordingly */
+	prtd->state = Q6APM_STREAM_RUNNING;
+
+	return 0;
+}
+
+static int q6apm_dai_trigger(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream, int cmd)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct q6apm_dai_rtd *prtd = runtime->private_data;
+	int ret = 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		 /* start writing buffers for playback only as we already queued capture buffers */
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+		/* TODO support be handled via SoftPause Module */
+		prtd->state = Q6APM_STREAM_STOPPED;
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int q6apm_dai_open(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *soc_prtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_prtd, 0);
+	struct device *dev = component->dev;
+	struct q6apm_dai_data *pdata;
+	struct q6apm_dai_rtd *prtd;
+	int graph_id, ret;
+
+	graph_id = cpu_dai->driver->id;
+
+	pdata = snd_soc_component_get_drvdata(component);
+	if (!pdata) {
+		dev_err(dev, "Drv data not found ..\n");
+		return -EINVAL;
+	}
+
+	prtd = kzalloc(sizeof(*prtd), GFP_KERNEL);
+	if (prtd == NULL)
+		return -ENOMEM;
+
+	prtd->substream = substream;
+	prtd->graph = q6apm_graph_open(dev, (q6apm_cb)event_handler, prtd, graph_id);
+	if (IS_ERR(prtd->graph)) {
+		dev_err(dev, "%s: Could not allocate memory\n", __func__);
+		ret = PTR_ERR(prtd->graph);
+		goto err;
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		runtime->hw = q6apm_dai_hardware_playback;
+	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		runtime->hw = q6apm_dai_hardware_capture;
+
+	/* Ensure that buffer size is a multiple of period size */
+	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0) {
+		dev_err(dev, "snd_pcm_hw_constraint_integer failed\n");
+		goto err;
+	}
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
+						   BUFFER_BYTES_MIN, BUFFER_BYTES_MAX);
+		if (ret < 0) {
+			dev_err(dev, "constraint for buffer bytes min max ret = %d\n", ret);
+			goto err;
+		}
+	}
+
+	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
+	if (ret < 0) {
+		dev_err(dev, "constraint for period bytes step ret = %d\n", ret);
+		goto err;
+	}
+
+	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 32);
+	if (ret < 0) {
+		dev_err(dev, "constraint for buffer bytes step ret = %d\n", ret);
+		goto err;
+	}
+
+	runtime->private_data = prtd;
+	runtime->dma_bytes = BUFFER_BYTES_MAX;
+	if (pdata->sid < 0)
+		prtd->phys = substream->dma_buffer.addr;
+	else
+		prtd->phys = substream->dma_buffer.addr | (pdata->sid << 32);
+
+	return 0;
+err:
+	kfree(prtd);
+
+	return ret;
+}
+
+static int q6apm_dai_close(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct q6apm_dai_rtd *prtd = runtime->private_data;
+
+	q6apm_graph_stop(prtd->graph);
+	q6apm_unmap_memory_regions(prtd->graph, substream->stream);
+	q6apm_graph_close(prtd->graph);
+	prtd->graph = NULL;
+	kfree(prtd);
+	runtime->private_data = NULL;
+
+	return 0;
+}
+
+static snd_pcm_uframes_t q6apm_dai_pointer(struct snd_soc_component *component,
+					   struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct q6apm_dai_rtd *prtd = runtime->private_data;
+
+	if (prtd->pos == prtd->pcm_size)
+		prtd->pos = 0;
+
+	return bytes_to_frames(runtime, prtd->pos);
+}
+
+static int q6apm_dai_hw_params(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream,
+			       struct snd_pcm_hw_params *params)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct q6apm_dai_rtd *prtd = runtime->private_data;
+
+	prtd->pcm_size = params_buffer_bytes(params);
+	prtd->periods = params_periods(params);
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		prtd->bits_per_sample = 16;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		prtd->bits_per_sample = 24;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc_pcm_runtime *rtd)
+{
+	int size = BUFFER_BYTES_MAX;
+
+	return snd_pcm_set_fixed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
+}
+
+static const struct snd_soc_component_driver q6apm_fe_dai_component = {
+	.name		= DRV_NAME,
+	.open		= q6apm_dai_open,
+	.close		= q6apm_dai_close,
+	.prepare	= q6apm_dai_prepare,
+	.pcm_construct	= q6apm_dai_pcm_new,
+	.hw_params	= q6apm_dai_hw_params,
+	.pointer	= q6apm_dai_pointer,
+	.trigger	= q6apm_dai_trigger,
+};
+
+static int q6apm_dai_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->of_node;
+	struct q6apm_dai_data *pdata;
+	struct of_phandle_args args;
+	int rc;
+
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	rc = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
+	if (rc < 0)
+		pdata->sid = -1;
+	else
+		pdata->sid = args.args[0] & SID_MASK_DEFAULT;
+
+	dev_set_drvdata(dev, pdata);
+
+	return devm_snd_soc_register_component(dev, &q6apm_fe_dai_component, NULL, 0);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id q6apm_dai_device_id[] = {
+	{ .compatible = "qcom,q6apm-dais" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, q6apm_dai_device_id);
+#endif
+
+static struct platform_driver q6apm_dai_platform_driver = {
+	.driver = {
+		.name = "q6apm-dai",
+		.of_match_table = of_match_ptr(q6apm_dai_device_id),
+	},
+	.probe = q6apm_dai_probe,
+};
+module_platform_driver(q6apm_dai_platform_driver);
+
+MODULE_DESCRIPTION("Q6APM dai driver");
+MODULE_LICENSE("GPL");
-- 
2.21.0

