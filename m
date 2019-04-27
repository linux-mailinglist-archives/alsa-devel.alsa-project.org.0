Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59692B429
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:01:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4C591621;
	Sat, 27 Apr 2019 20:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4C591621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556388079;
	bh=ItBYO77d0uYzWT1B2asIobEpJnQcilnzw/05KcbO1ws=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SBhCmKn3KKmq7irAVQpJap9Lej+1LVO8GNHYxULhi72AySyGIEGN1P3vt4ZXujQlV
	 ri+MjJEblDvbE0CHcM4LDAqwQeOZ7D3W5oRkLJBUxJCXqcJniGHvX+2IDEMspR/hhH
	 +POf7ka7uaDwp/prfl7OB+ZFviCiKKoQIF6kxVDQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0F17F8976A;
	Sat, 27 Apr 2019 19:54:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC27AF89747; Sat, 27 Apr 2019 19:53:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5533EF89720;
 Sat, 27 Apr 2019 19:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5533EF89720
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ttnu4NpK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=tC9WjSgiBL0TtcYgU30Oeg0IBhhWQJ/irMf/y5nJGn0=; b=ttnu4NpKmdYT
 egVXHM9tHQ0IX6Vl9wfsrepC/LRVaDUaq32Ke0G3zKUerkUYAxem74Tv994+y1FJnXvGpJbB5UYWe
 I3hJQhV6BuZddyhJfyrp8ZcjlXKvEsm6g8jF7ashBXAYScfjar4R5Tp+3W2X+p2u5Srv+XdwefSod
 RnhMA=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVH-0004oA-PO; Sat, 27 Apr 2019 17:52:48 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 9EA77441D3D; Sat, 27 Apr 2019 18:52:44 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190412160904.30418-10-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175244.9EA77441D3D@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:52:44 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, Keyon Jie <yang.jie@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: Add Intel specific HDA PCM
	operations" to the asoc tree
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

   ASoC: SOF: Intel: Add Intel specific HDA PCM operations

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

From c6be710f5e2a92204f92d872a0c0b4fe29666492 Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 12 Apr 2019 11:08:52 -0500
Subject: [PATCH] ASoC: SOF: Intel: Add Intel specific HDA PCM operations

Add PCM operations for Intel HDA based DSPs.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-pcm.c | 240 ++++++++++++++++++++++++++++++++++
 1 file changed, 240 insertions(+)
 create mode 100644 sound/soc/sof/intel/hda-pcm.c

diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
new file mode 100644
index 000000000000..5714a79fbe1a
--- /dev/null
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018 Intel Corporation. All rights reserved.
+//
+// Authors: Liam Girdwood <liam.r.girdwood@linux.intel.com>
+//	    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
+//	    Rander Wang <rander.wang@intel.com>
+//          Keyon Jie <yang.jie@linux.intel.com>
+//
+
+/*
+ * Hardware interface for generic Intel audio DSP HDA IP
+ */
+
+#include <sound/hdaudio_ext.h>
+#include <sound/hda_register.h>
+#include <sound/pcm_params.h>
+#include "../ops.h"
+#include "hda.h"
+
+#define SDnFMT_BASE(x)	((x) << 14)
+#define SDnFMT_MULT(x)	(((x) - 1) << 11)
+#define SDnFMT_DIV(x)	(((x) - 1) << 8)
+#define SDnFMT_BITS(x)	((x) << 4)
+#define SDnFMT_CHAN(x)	((x) << 0)
+
+static inline u32 get_mult_div(struct snd_sof_dev *sdev, int rate)
+{
+	switch (rate) {
+	case 8000:
+		return SDnFMT_DIV(6);
+	case 9600:
+		return SDnFMT_DIV(5);
+	case 11025:
+		return SDnFMT_BASE(1) | SDnFMT_DIV(4);
+	case 16000:
+		return SDnFMT_DIV(3);
+	case 22050:
+		return SDnFMT_BASE(1) | SDnFMT_DIV(2);
+	case 32000:
+		return SDnFMT_DIV(3) | SDnFMT_MULT(2);
+	case 44100:
+		return SDnFMT_BASE(1);
+	case 48000:
+		return 0;
+	case 88200:
+		return SDnFMT_BASE(1) | SDnFMT_MULT(2);
+	case 96000:
+		return SDnFMT_MULT(2);
+	case 176400:
+		return SDnFMT_BASE(1) | SDnFMT_MULT(4);
+	case 192000:
+		return SDnFMT_MULT(4);
+	default:
+		dev_warn(sdev->dev, "can't find div rate %d using 48kHz\n",
+			 rate);
+		return 0; /* use 48KHz if not found */
+	}
+};
+
+static inline u32 get_bits(struct snd_sof_dev *sdev, int sample_bits)
+{
+	switch (sample_bits) {
+	case 8:
+		return SDnFMT_BITS(0);
+	case 16:
+		return SDnFMT_BITS(1);
+	case 20:
+		return SDnFMT_BITS(2);
+	case 24:
+		return SDnFMT_BITS(3);
+	case 32:
+		return SDnFMT_BITS(4);
+	default:
+		dev_warn(sdev->dev, "can't find %d bits using 16bit\n",
+			 sample_bits);
+		return SDnFMT_BITS(1); /* use 16bits format if not found */
+	}
+};
+
+int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
+			  struct snd_pcm_substream *substream,
+			  struct snd_pcm_hw_params *params,
+			  struct sof_ipc_stream_params *ipc_params)
+{
+	struct hdac_stream *hstream = substream->runtime->private_data;
+	struct hdac_ext_stream *stream = stream_to_hdac_ext_stream(hstream);
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	struct snd_dma_buffer *dmab;
+	int ret;
+	u32 size, rate, bits;
+
+	size = params_buffer_bytes(params);
+	rate = get_mult_div(sdev, params_rate(params));
+	bits = get_bits(sdev, params_width(params));
+
+	hstream->substream = substream;
+
+	dmab = substream->runtime->dma_buffer_p;
+
+	hstream->format_val = rate | bits | (params_channels(params) - 1);
+	hstream->bufsize = size;
+	hstream->period_bytes = params_period_bytes(params);
+	hstream->no_period_wakeup  =
+			(params->info & SNDRV_PCM_INFO_NO_PERIOD_WAKEUP) &&
+			(params->flags & SNDRV_PCM_HW_PARAMS_NO_PERIOD_WAKEUP);
+
+	ret = hda_dsp_stream_hw_params(sdev, stream, dmab, params);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: hdac prepare failed: %x\n", ret);
+		return ret;
+	}
+
+	/* disable SPIB, to enable buffer wrap for stream */
+	hda_dsp_stream_spib_config(sdev, stream, HDA_DSP_SPIB_DISABLE, 0);
+
+	/* set host_period_bytes to 0 if no IPC position */
+	if (hda && hda->no_ipc_position)
+		ipc_params->host_period_bytes = 0;
+
+	ipc_params->stream_tag = hstream->stream_tag;
+
+	return 0;
+}
+
+int hda_dsp_pcm_trigger(struct snd_sof_dev *sdev,
+			struct snd_pcm_substream *substream, int cmd)
+{
+	struct hdac_stream *hstream = substream->runtime->private_data;
+	struct hdac_ext_stream *stream = stream_to_hdac_ext_stream(hstream);
+
+	return hda_dsp_stream_trigger(sdev, stream, cmd);
+}
+
+snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
+				      struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct hdac_stream *hstream = substream->runtime->private_data;
+	struct sof_intel_hda_dev *hda = sdev->pdata->hw_pdata;
+	struct snd_sof_pcm *spcm;
+	snd_pcm_uframes_t pos;
+
+	spcm = snd_sof_find_spcm_dai(sdev, rtd);
+	if (!spcm) {
+		dev_warn_ratelimited(sdev->dev, "warn: can't find PCM with DAI ID %d\n",
+				     rtd->dai_link->id);
+		return 0;
+	}
+
+	if (hda && !hda->no_ipc_position) {
+		/* read position from IPC position */
+		pos = spcm->stream[substream->stream].posn.host_posn;
+		goto found;
+	}
+
+	/*
+	 * DPIB/posbuf position mode:
+	 * For Playback, Use DPIB register from HDA space which
+	 * reflects the actual data transferred.
+	 * For Capture, Use the position buffer for pointer, as DPIB
+	 * is not accurate enough, its update may be completed
+	 * earlier than the data written to DDR.
+	 */
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		pos = snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
+				       AZX_REG_VS_SDXDPIB_XBASE +
+				       (AZX_REG_VS_SDXDPIB_XINTERVAL *
+					hstream->index));
+	} else {
+		/*
+		 * For capture stream, we need more workaround to fix the
+		 * position incorrect issue:
+		 *
+		 * 1. Wait at least 20us before reading position buffer after
+		 * the interrupt generated(IOC), to make sure position update
+		 * happens on frame boundary i.e. 20.833uSec for 48KHz.
+		 * 2. Perform a dummy Read to DPIB register to flush DMA
+		 * position value.
+		 * 3. Read the DMA Position from posbuf. Now the readback
+		 * value should be >= period boundary.
+		 */
+		usleep_range(20, 21);
+		snd_sof_dsp_read(sdev, HDA_DSP_HDA_BAR,
+				 AZX_REG_VS_SDXDPIB_XBASE +
+				 (AZX_REG_VS_SDXDPIB_XINTERVAL *
+				  hstream->index));
+		pos = snd_hdac_stream_get_pos_posbuf(hstream);
+	}
+
+	if (pos >= hstream->bufsize)
+		pos = 0;
+
+found:
+	pos = bytes_to_frames(substream->runtime, pos);
+
+	dev_vdbg(sdev->dev, "PCM: stream %d dir %d position %lu\n",
+		 hstream->index, substream->stream, pos);
+	return pos;
+}
+
+int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
+		     struct snd_pcm_substream *substream)
+{
+	struct hdac_ext_stream *dsp_stream;
+	int direction = substream->stream;
+
+	dsp_stream = hda_dsp_stream_get(sdev, direction);
+
+	if (!dsp_stream) {
+		dev_err(sdev->dev, "error: no stream available\n");
+		return -ENODEV;
+	}
+
+	/* binding pcm substream to hda stream */
+	substream->runtime->private_data = &dsp_stream->hstream;
+	return 0;
+}
+
+int hda_dsp_pcm_close(struct snd_sof_dev *sdev,
+		      struct snd_pcm_substream *substream)
+{
+	struct hdac_stream *hstream = substream->runtime->private_data;
+	int direction = substream->stream;
+	int ret;
+
+	ret = hda_dsp_stream_put(sdev, direction, hstream->stream_tag);
+
+	if (ret) {
+		dev_dbg(sdev->dev, "stream %s not opened!\n", substream->name);
+		return -ENODEV;
+	}
+
+	/* unbinding pcm substream to hda stream */
+	substream->runtime->private_data = NULL;
+	return 0;
+}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
