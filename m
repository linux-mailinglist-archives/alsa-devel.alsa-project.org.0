Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6F9B426
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 19:59:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 749C31603;
	Sat, 27 Apr 2019 19:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 749C31603
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556387948;
	bh=DLKByajAtGYZzUXJT9cOUktV4+oPLikhXRcvME43wmI=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=AGP03wnAVmP+0iqD9Dxo5za5Is2MfDUKCR29k9QsbRqFgTPFiSWk08qbJbgnZqNT4
	 txp9N82qPaP9Zp5PHSzx32vU+rWk4Hph6lgpGWcSVOqnGixNJi02Krp/lpM+KeI+lE
	 BUwsKAEKEDB2VE05LLMrjq9UYewmVASymhfFiNFY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1070F8975E;
	Sat, 27 Apr 2019 19:53:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3298F89737; Sat, 27 Apr 2019 19:53:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_65,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF26BF896DE;
 Sat, 27 Apr 2019 19:52:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF26BF896DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="bLQ5mome"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=43twq/qQ84M1ZI0m59h1MtQ0eyUI9bQ6/Dup/VfmEcs=; b=bLQ5mome2eQ2
 7VwLCBKMvbDoCD+tJqrPneO95nIJ6j/oxv2fS2Qa4SdCcnkCRhy5PzXX+I3j/ty9G74yc9g4dYwr7
 VW9DYFZBp3f8pzwZzwfBq0X0PBiYWV6mJVNCpagTXcVeWLU7Ei69AcMpK7BvF7Srx8NTHWjgnnTJK
 5g0pY=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVG-0004o1-62; Sat, 27 Apr 2019 17:52:46 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id BE6E7441D41; Sat, 27 Apr 2019 18:52:41 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Keyon Jie <yang.jie@linux.intel.com>
In-Reply-To: <20190412160904.30418-15-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175241.BE6E7441D41@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:52:41 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: add SKL+ platform DAIs" to
	the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: Intel: add SKL+ platform DAIs

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From fdd961e37e47f2d450638f3a653cdb96911969ea Mon Sep 17 00:00:00 2001
From: Keyon Jie <yang.jie@linux.intel.com>
Date: Fri, 12 Apr 2019 11:08:57 -0500
Subject: [PATCH] ASoC: SOF: Intel: add SKL+ platform DAIs

Add declarations for DAIs and utilities for link DMA management

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-dai.c | 351 ++++++++++++++++++++++++++++++++++
 1 file changed, 351 insertions(+)
 create mode 100644 sound/soc/sof/intel/hda-dai.c

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
new file mode 100644
index 000000000000..830328af19c5
--- /dev/null
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -0,0 +1,351 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018 Intel Corporation. All rights reserved.
+//
+// Authors: Keyon Jie <yang.jie@linux.intel.com>
+//
+
+#include <sound/pcm_params.h>
+#include <sound/hdaudio_ext.h>
+#include "../sof-priv.h"
+#include "hda.h"
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+
+struct hda_pipe_params {
+	u8 host_dma_id;
+	u8 link_dma_id;
+	u32 ch;
+	u32 s_freq;
+	u32 s_fmt;
+	u8 linktype;
+	snd_pcm_format_t format;
+	int link_index;
+	int stream;
+	unsigned int host_bps;
+	unsigned int link_bps;
+};
+
+/*
+ * Unlike GP dma, there is a set of stream registers in hda controller
+ * to control the link dma channels. Each register controls one link
+ * dma channel and the relation is fixed. To make sure FW uses correct
+ * link dma channels, host allocates stream registers and sends the
+ * corresponding link dma channels to FW to allocate link dma channel
+ *
+ * FIXME: this API is abused in the sense that tx_num and rx_num are
+ * passed as arguments, not returned. We need to find a better way to
+ * retrieve the stream tag allocated for the link DMA
+ */
+static int hda_link_dma_get_channels(struct snd_soc_dai *dai,
+				     unsigned int *tx_num,
+				     unsigned int *tx_slot,
+				     unsigned int *rx_num,
+				     unsigned int *rx_slot)
+{
+	struct hdac_bus *bus;
+	struct hdac_ext_stream *stream;
+	struct snd_pcm_substream substream;
+	struct snd_sof_dev *sdev =
+		snd_soc_component_get_drvdata(dai->component);
+
+	bus = sof_to_bus(sdev);
+
+	memset(&substream, 0, sizeof(substream));
+	if (*tx_num == 1) {
+		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
+		stream = snd_hdac_ext_stream_assign(bus, &substream,
+						    HDAC_EXT_STREAM_TYPE_LINK);
+		if (!stream) {
+			dev_err(bus->dev, "error: failed to find a free hda ext stream for playback");
+			return -EBUSY;
+		}
+
+		snd_soc_dai_set_dma_data(dai, &substream, stream);
+		*tx_slot = hdac_stream(stream)->stream_tag - 1;
+
+		dev_dbg(bus->dev, "link dma channel %d for playback", *tx_slot);
+	}
+
+	if (*rx_num == 1) {
+		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
+		stream = snd_hdac_ext_stream_assign(bus, &substream,
+						    HDAC_EXT_STREAM_TYPE_LINK);
+		if (!stream) {
+			dev_err(bus->dev, "error: failed to find a free hda ext stream for capture");
+			return -EBUSY;
+		}
+
+		snd_soc_dai_set_dma_data(dai, &substream, stream);
+		*rx_slot = hdac_stream(stream)->stream_tag - 1;
+
+		dev_dbg(bus->dev, "link dma channel %d for capture", *rx_slot);
+	}
+
+	return 0;
+}
+
+static int hda_link_dma_params(struct hdac_ext_stream *stream,
+			       struct hda_pipe_params *params)
+{
+	struct hdac_stream *hstream = &stream->hstream;
+	unsigned char stream_tag = hstream->stream_tag;
+	struct hdac_bus *bus = hstream->bus;
+	struct hdac_ext_link *link;
+	unsigned int format_val;
+
+	snd_hdac_ext_stream_decouple(bus, stream, true);
+	snd_hdac_ext_link_stream_reset(stream);
+
+	format_val = snd_hdac_calc_stream_format(params->s_freq, params->ch,
+						 params->format,
+						 params->link_bps, 0);
+
+	dev_dbg(bus->dev, "format_val=%d, rate=%d, ch=%d, format=%d\n",
+		format_val, params->s_freq, params->ch, params->format);
+
+	snd_hdac_ext_link_stream_setup(stream, format_val);
+
+	if (stream->hstream.direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		list_for_each_entry(link, &bus->hlink_list, list) {
+			if (link->index == params->link_index)
+				snd_hdac_ext_link_set_stream_id(link,
+								stream_tag);
+		}
+	}
+
+	stream->link_prepared = 1;
+
+	return 0;
+}
+
+static int hda_link_hw_params(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params,
+			      struct snd_soc_dai *dai)
+{
+	struct hdac_stream *hstream = substream->runtime->private_data;
+	struct hdac_bus *bus = hstream->bus;
+	struct hdac_ext_stream *link_dev;
+	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	struct hda_pipe_params p_params = {0};
+	struct hdac_ext_link *link;
+	int stream_tag;
+
+	link_dev = snd_soc_dai_get_dma_data(dai, substream);
+
+	link = snd_hdac_ext_bus_get_link(bus, codec_dai->component->name);
+	if (!link)
+		return -EINVAL;
+
+	stream_tag = hdac_stream(link_dev)->stream_tag;
+
+	/* set the stream tag in the codec dai dma params  */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		snd_soc_dai_set_tdm_slot(codec_dai, stream_tag, 0, 0, 0);
+	else
+		snd_soc_dai_set_tdm_slot(codec_dai, 0, stream_tag, 0, 0);
+
+	p_params.s_fmt = snd_pcm_format_width(params_format(params));
+	p_params.ch = params_channels(params);
+	p_params.s_freq = params_rate(params);
+	p_params.stream = substream->stream;
+	p_params.link_dma_id = stream_tag - 1;
+	p_params.link_index = link->index;
+	p_params.format = params_format(params);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		p_params.link_bps = codec_dai->driver->playback.sig_bits;
+	else
+		p_params.link_bps = codec_dai->driver->capture.sig_bits;
+
+	return hda_link_dma_params(link_dev, &p_params);
+}
+
+static int hda_link_pcm_prepare(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_sof_dev *sdev =
+		snd_soc_component_get_drvdata(dai->component);
+	struct snd_sof_pcm *spcm;
+	int stream = substream->stream;
+
+	spcm = snd_sof_find_spcm_dai(sdev, rtd);
+	if (!spcm)
+		return -EINVAL;
+
+	/* setup hw_params again only if resuming from system suspend */
+	if (!spcm->hw_params_upon_resume[stream])
+		return 0;
+
+	dev_dbg(sdev->dev, "hda: prepare stream %d dir %d\n",
+		spcm->pcm.pcm_id, substream->stream);
+
+	return hda_link_hw_params(substream, &rtd->dpcm[stream].hw_params,
+				  dai);
+}
+
+static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
+				int cmd, struct snd_soc_dai *dai)
+{
+	struct hdac_ext_stream *link_dev =
+				snd_soc_dai_get_dma_data(dai, substream);
+	int ret;
+
+	dev_dbg(dai->dev, "In %s cmd=%d\n", __func__, cmd);
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_RESUME:
+		/* set up hw_params */
+		ret = hda_link_pcm_prepare(substream, dai);
+		if (ret < 0) {
+			dev_err(dai->dev,
+				"error: setting up hw_params during resume\n");
+			return ret;
+		}
+
+		/* fallthrough */
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		snd_hdac_ext_link_stream_start(link_dev);
+		break;
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+		snd_hdac_ext_link_stream_clear(link_dev);
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+/*
+ * FIXME: This API is also abused since it's used for two purposes.
+ * when the substream argument is NULL this function is used for cleanups
+ * that aren't necessarily required, and called explicitly by handling
+ * ASoC core structures, which is not recommended.
+ * This part will be reworked in follow-up patches.
+ */
+static int hda_link_hw_free(struct snd_pcm_substream *substream,
+			    struct snd_soc_dai *dai)
+{
+	const char *name;
+	unsigned int stream_tag;
+	struct hdac_bus *bus;
+	struct hdac_ext_link *link;
+	struct hdac_stream *hstream;
+	struct hdac_ext_stream *stream;
+	struct snd_soc_pcm_runtime *rtd;
+	struct hdac_ext_stream *link_dev;
+	struct snd_pcm_substream pcm_substream;
+
+	memset(&pcm_substream, 0, sizeof(pcm_substream));
+	if (substream) {
+		hstream = substream->runtime->private_data;
+		bus = hstream->bus;
+		rtd = snd_pcm_substream_chip(substream);
+		link_dev = snd_soc_dai_get_dma_data(dai, substream);
+		snd_hdac_ext_stream_decouple(bus, link_dev, false);
+		name = rtd->codec_dai->component->name;
+		link = snd_hdac_ext_bus_get_link(bus, name);
+		if (!link)
+			return -EINVAL;
+
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			stream_tag = hdac_stream(link_dev)->stream_tag;
+			snd_hdac_ext_link_clear_stream_id(link, stream_tag);
+		}
+
+		link_dev->link_prepared = 0;
+	} else {
+		/* release all hda streams when dai link is unloaded */
+		pcm_substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
+		stream = snd_soc_dai_get_dma_data(dai, &pcm_substream);
+		if (stream) {
+			snd_soc_dai_set_dma_data(dai, &pcm_substream, NULL);
+			snd_hdac_ext_stream_release(stream,
+						    HDAC_EXT_STREAM_TYPE_LINK);
+		}
+
+		pcm_substream.stream = SNDRV_PCM_STREAM_CAPTURE;
+		stream = snd_soc_dai_get_dma_data(dai, &pcm_substream);
+		if (stream) {
+			snd_soc_dai_set_dma_data(dai, &pcm_substream, NULL);
+			snd_hdac_ext_stream_release(stream,
+						    HDAC_EXT_STREAM_TYPE_LINK);
+		}
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops hda_link_dai_ops = {
+	.hw_params = hda_link_hw_params,
+	.hw_free = hda_link_hw_free,
+	.trigger = hda_link_pcm_trigger,
+	.prepare = hda_link_pcm_prepare,
+	.get_channel_map = hda_link_dma_get_channels,
+};
+#endif
+
+/*
+ * common dai driver for skl+ platforms.
+ * some products who use this DAI array only physically have a subset of
+ * the DAIs, but no harm is done here by adding the whole set.
+ */
+struct snd_soc_dai_driver skl_dai[] = {
+{
+	.name = "SSP0 Pin",
+},
+{
+	.name = "SSP1 Pin",
+},
+{
+	.name = "SSP2 Pin",
+},
+{
+	.name = "SSP3 Pin",
+},
+{
+	.name = "SSP4 Pin",
+},
+{
+	.name = "SSP5 Pin",
+},
+{
+	.name = "DMIC01 Pin",
+},
+{
+	.name = "DMIC16k Pin",
+},
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+{
+	.name = "iDisp1 Pin",
+	.ops = &hda_link_dai_ops,
+},
+{
+	.name = "iDisp2 Pin",
+	.ops = &hda_link_dai_ops,
+},
+{
+	.name = "iDisp3 Pin",
+	.ops = &hda_link_dai_ops,
+},
+{
+	.name = "Analog CPU DAI",
+	.ops = &hda_link_dai_ops,
+},
+{
+	.name = "Digital CPU DAI",
+	.ops = &hda_link_dai_ops,
+},
+{
+	.name = "Alt Analog CPU DAI",
+	.ops = &hda_link_dai_ops,
+},
+#endif
+};
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
