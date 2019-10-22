Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 881FBE0B58
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 20:19:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16BFC1660;
	Tue, 22 Oct 2019 20:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16BFC1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571768353;
	bh=LNxtzYKkZn5NPYdq1nDUGH2JlfwTVSeJb6yOD953+Gg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=q/rSR0LgP80+wzUHxceamAKO1gF8T41/DCG/9m6vtkrsPSg41abGX9TrJGtkLxQeu
	 SxoJUElBd8BgHXyYozcubaw4BZvSC8v/LQpmuWieoY2+buzZ7pl2pFoF+8id75CrEx
	 U5GoLtcEGwWHGmNuUYVZkBexesWC2lgScIVlgaoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3757F805FF;
	Tue, 22 Oct 2019 20:16:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DF7CF80390; Tue, 22 Oct 2019 20:15:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D1D1F8031A
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 20:15:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D1D1F8031A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="EZraOE+1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=FnJV+MVCpF7roc5vTt8esxiJwX1Vxw4WYXY996vIw2g=; b=EZraOE+1VWOR
 tvZNFv3id9uPFDSaUiNkcQlo9X0VcbFAJKL18zDrJXGQOYGTjwT9l7Ua3R/albccQHopk560q9KyM
 kq378zQJW7INyOghGwv2R1cJIKpI7jc2Ow37hdchh6PRdcIqNs+GiFSIarjd+ZsDRQqLvfB6gYtab
 CmKMw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iMyhA-0007CK-NA; Tue, 22 Oct 2019 18:15:48 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 27535274326E; Tue, 22 Oct 2019 19:15:48 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Ben Zhang <benzh@chromium.org>
In-Reply-To: <20191018200449.141123-2-cujomalainey@chromium.org>
X-Patchwork-Hint: ignore
Message-Id: <20191022181548.27535274326E@ypsilon.sirena.org.uk>
Date: Tue, 22 Oct 2019 19:15:48 +0100 (BST)
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] Applied "ASoC: rt5677: Add a PCM device for streaming
	hotword via SPI" to the asoc tree
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

   ASoC: rt5677: Add a PCM device for streaming hotword via SPI

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From a0e0d135427cf699fe2dee77da0924e0b47f3170 Mon Sep 17 00:00:00 2001
From: Ben Zhang <benzh@chromium.org>
Date: Fri, 18 Oct 2019 13:04:38 -0700
Subject: [PATCH] ASoC: rt5677: Add a PCM device for streaming hotword via SPI

This patch implements a PCM interface for streaming hotword
phrases over SPI. Userspace can open the PCM device at anytime.
The stream is blocked when no hotword is detected. The mic
audio buffer on the DSP is a ~128KByte ring buffer that holds
~4sec of audio samples recorded from the DMIC (S16_LE, mono,
16KHz). After a hotword is detected, previous 2 seconds of audio
(containing the detected hotword) is streamed first, then live
capture continues until userspace closes the PCM stream.

When transferring, copy one period at a time then call
snd_pcm_period_elapsed(). This reduces the latency of transferring
the initial ~2sec of audio after hotword detect since audio samples
are available for userspace earlier.

Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Link: https://lore.kernel.org/r/20191018200449.141123-2-cujomalainey@chromium.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5677-spi.c | 385 ++++++++++++++++++++++++++++++++++
 sound/soc/codecs/rt5677-spi.h |   1 +
 2 files changed, 386 insertions(+)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index d681488f5312..36c02d200cfc 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -24,6 +24,8 @@
 #include <linux/firmware.h>
 #include <linux/acpi.h>
 
+#include <sound/soc.h>
+
 #include "rt5677-spi.h"
 
 #define DRV_NAME "rt5677spi"
@@ -45,9 +47,355 @@
 #define RT5677_SPI_WRITE_16	0x1
 #define RT5677_SPI_READ_16	0x0
 
+#define RT5677_BUF_BYTES_TOTAL		0x20000
+#define RT5677_MIC_BUF_ADDR		0x60030000
+#define RT5677_MODEL_ADDR		0x5FFC9800
+#define RT5677_MIC_BUF_BYTES		((u32)(RT5677_BUF_BYTES_TOTAL - \
+					sizeof(u32)))
+#define RT5677_MIC_BUF_FIRST_READ_SIZE	0x10000
+
 static struct spi_device *g_spi;
 static DEFINE_MUTEX(spi_mutex);
 
+struct rt5677_dsp {
+	struct device *dev;
+	struct delayed_work copy_work;
+	struct mutex dma_lock;
+	struct snd_pcm_substream *substream;
+	size_t dma_offset;	/* zero-based offset into runtime->dma_area */
+	size_t avail_bytes;	/* number of new bytes since last period */
+	u32 mic_read_offset;	/* zero-based offset into DSP's mic buffer */
+	bool new_hotword;	/* a new hotword is fired */
+};
+
+static const struct snd_pcm_hardware rt5677_spi_pcm_hardware = {
+	.info			= SNDRV_PCM_INFO_MMAP |
+				  SNDRV_PCM_INFO_MMAP_VALID |
+				  SNDRV_PCM_INFO_INTERLEAVED,
+	.formats		= SNDRV_PCM_FMTBIT_S16_LE,
+	.period_bytes_min	= PAGE_SIZE,
+	.period_bytes_max	= RT5677_BUF_BYTES_TOTAL / 8,
+	.periods_min		= 8,
+	.periods_max		= 8,
+	.channels_min		= 1,
+	.channels_max		= 1,
+	.buffer_bytes_max	= RT5677_BUF_BYTES_TOTAL,
+};
+
+static struct snd_soc_dai_driver rt5677_spi_dai = {
+	/* The DAI name "rt5677-dsp-cpu-dai" is not used. The actual DAI name
+	 * registered with ASoC is the name of the device "spi-RT5677AA:00",
+	 * because we only have one DAI. See snd_soc_register_dais().
+	 */
+	.name = "rt5677-dsp-cpu-dai",
+	.id = 0,
+	.capture = {
+		.stream_name = "DSP Capture",
+		.channels_min = 1,
+		.channels_max = 1,
+		.rates = SNDRV_PCM_RATE_16000,
+		.formats = SNDRV_PCM_FMTBIT_S16_LE,
+	},
+};
+
+/* PCM for streaming audio from the DSP buffer */
+static int rt5677_spi_pcm_open(
+		struct snd_soc_component *component,
+		struct snd_pcm_substream *substream)
+{
+	snd_soc_set_runtime_hwparams(substream, &rt5677_spi_pcm_hardware);
+	return 0;
+}
+
+static int rt5677_spi_pcm_close(
+		struct snd_soc_component *component,
+		struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct rt5677_dsp *rt5677_dsp =
+			snd_soc_component_get_drvdata(component);
+
+	cancel_delayed_work_sync(&rt5677_dsp->copy_work);
+	return 0;
+}
+
+static int rt5677_spi_hw_params(
+		struct snd_soc_component *component,
+		struct snd_pcm_substream *substream,
+		struct snd_pcm_hw_params *hw_params)
+{
+	struct rt5677_dsp *rt5677_dsp =
+			snd_soc_component_get_drvdata(component);
+	int ret;
+
+	mutex_lock(&rt5677_dsp->dma_lock);
+	ret = snd_pcm_lib_alloc_vmalloc_buffer(substream,
+			params_buffer_bytes(hw_params));
+	rt5677_dsp->substream = substream;
+	mutex_unlock(&rt5677_dsp->dma_lock);
+
+	return ret;
+}
+
+static int rt5677_spi_hw_free(
+		struct snd_soc_component *component,
+		struct snd_pcm_substream *substream)
+{
+	struct rt5677_dsp *rt5677_dsp =
+			snd_soc_component_get_drvdata(component);
+
+	mutex_lock(&rt5677_dsp->dma_lock);
+	rt5677_dsp->substream = 0;
+	mutex_unlock(&rt5677_dsp->dma_lock);
+
+	return snd_pcm_lib_free_vmalloc_buffer(substream);
+}
+
+static int rt5677_spi_prepare(
+		struct snd_soc_component *component,
+		struct snd_pcm_substream *substream)
+{
+	struct rt5677_dsp *rt5677_dsp =
+			snd_soc_component_get_drvdata(component);
+
+	rt5677_dsp->dma_offset = 0;
+	rt5677_dsp->avail_bytes = 0;
+	return 0;
+}
+
+static snd_pcm_uframes_t rt5677_spi_pcm_pointer(
+		struct snd_soc_component *component,
+		struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct rt5677_dsp *rt5677_dsp =
+			snd_soc_component_get_drvdata(component);
+
+	return bytes_to_frames(runtime, rt5677_dsp->dma_offset);
+}
+
+static int rt5677_spi_mic_write_offset(u32 *mic_write_offset)
+{
+	int ret;
+	/* Grab the first 4 bytes that hold the write pointer on the
+	 * dsp, and check to make sure that it points somewhere inside the
+	 * buffer.
+	 */
+	ret = rt5677_spi_read(RT5677_MIC_BUF_ADDR, mic_write_offset,
+			sizeof(u32));
+	if (ret)
+		return ret;
+	/* Adjust the offset so that it's zero-based */
+	*mic_write_offset = *mic_write_offset - sizeof(u32);
+	return *mic_write_offset < RT5677_MIC_BUF_BYTES ? 0 : -EFAULT;
+}
+
+/*
+ * Copy one contiguous block of audio samples from the DSP mic buffer to the
+ * dma_area of the pcm runtime. The receiving buffer may wrap around.
+ * @begin: start offset of the block to copy, in bytes.
+ * @end:   offset of the first byte after the block to copy, must be greater
+ *         than or equal to begin.
+ *
+ * Return: Zero if successful, or a negative error code on failure.
+ */
+static int rt5677_spi_copy_block(struct rt5677_dsp *rt5677_dsp,
+		u32 begin, u32 end)
+{
+	struct snd_pcm_runtime *runtime = rt5677_dsp->substream->runtime;
+	size_t bytes_per_frame = frames_to_bytes(runtime, 1);
+	size_t first_chunk_len, second_chunk_len;
+	int ret;
+
+	if (begin > end || runtime->dma_bytes < 2 * bytes_per_frame) {
+		dev_err(rt5677_dsp->dev,
+			"Invalid copy from (%u, %u), dma_area size %zu\n",
+			begin, end, runtime->dma_bytes);
+		return -EINVAL;
+	}
+
+	/* The block to copy is empty */
+	if (begin == end)
+		return 0;
+
+	/* If the incoming chunk is too big for the receiving buffer, only the
+	 * last "receiving buffer size - one frame" bytes are copied.
+	 */
+	if (end - begin > runtime->dma_bytes - bytes_per_frame)
+		begin = end - (runtime->dma_bytes - bytes_per_frame);
+
+	/* May need to split to two chunks, calculate the size of each */
+	first_chunk_len = end - begin;
+	second_chunk_len = 0;
+	if (rt5677_dsp->dma_offset + first_chunk_len > runtime->dma_bytes) {
+		/* Receiving buffer wrapped around */
+		second_chunk_len = first_chunk_len;
+		first_chunk_len = runtime->dma_bytes - rt5677_dsp->dma_offset;
+		second_chunk_len -= first_chunk_len;
+	}
+
+	/* Copy first chunk */
+	ret = rt5677_spi_read(RT5677_MIC_BUF_ADDR + sizeof(u32) + begin,
+			runtime->dma_area + rt5677_dsp->dma_offset,
+			first_chunk_len);
+	if (ret)
+		return ret;
+	rt5677_dsp->dma_offset += first_chunk_len;
+	if (rt5677_dsp->dma_offset == runtime->dma_bytes)
+		rt5677_dsp->dma_offset = 0;
+
+	/* Copy second chunk */
+	if (second_chunk_len) {
+		ret = rt5677_spi_read(RT5677_MIC_BUF_ADDR + sizeof(u32) +
+				begin + first_chunk_len, runtime->dma_area,
+				second_chunk_len);
+		if (!ret)
+			rt5677_dsp->dma_offset = second_chunk_len;
+	}
+	return ret;
+}
+
+/*
+ * Copy a given amount of audio samples from the DSP mic buffer starting at
+ * mic_read_offset, to the dma_area of the pcm runtime. The source buffer may
+ * wrap around. mic_read_offset is updated after successful copy.
+ * @amount: amount of samples to copy, in bytes.
+ *
+ * Return: Zero if successful, or a negative error code on failure.
+ */
+static int rt5677_spi_copy(struct rt5677_dsp *rt5677_dsp, u32 amount)
+{
+	int ret = 0;
+	u32 target;
+
+	if (amount == 0)
+		return ret;
+
+	target = rt5677_dsp->mic_read_offset + amount;
+	/* Copy the first chunk in DSP's mic buffer */
+	ret |= rt5677_spi_copy_block(rt5677_dsp, rt5677_dsp->mic_read_offset,
+			min(target, RT5677_MIC_BUF_BYTES));
+
+	if (target >= RT5677_MIC_BUF_BYTES) {
+		/* Wrap around, copy the second chunk */
+		target -= RT5677_MIC_BUF_BYTES;
+		ret |= rt5677_spi_copy_block(rt5677_dsp, 0, target);
+	}
+
+	if (!ret)
+		rt5677_dsp->mic_read_offset = target;
+	return ret;
+}
+
+/*
+ * A delayed work that streams audio samples from the DSP mic buffer to the
+ * dma_area of the pcm runtime via SPI.
+ */
+static void rt5677_spi_copy_work(struct work_struct *work)
+{
+	struct rt5677_dsp *rt5677_dsp =
+		container_of(work, struct rt5677_dsp, copy_work.work);
+	struct snd_pcm_runtime *runtime;
+	u32 mic_write_offset;
+	size_t new_bytes, copy_bytes, period_bytes;
+	unsigned int delay;
+	int ret = 0;
+
+	/* Ensure runtime->dma_area buffer does not go away while copying. */
+	mutex_lock(&rt5677_dsp->dma_lock);
+	if (!rt5677_dsp->substream) {
+		dev_err(rt5677_dsp->dev, "No pcm substream\n");
+		goto done;
+	}
+
+	runtime = rt5677_dsp->substream->runtime;
+
+	if (rt5677_spi_mic_write_offset(&mic_write_offset)) {
+		dev_err(rt5677_dsp->dev, "No mic_write_offset\n");
+		goto done;
+	}
+
+	/* If this is the first time that we've asked for streaming data after
+	 * a hotword is fired, we should start reading from the previous 2
+	 * seconds of audio from wherever the mic_write_offset is currently.
+	 */
+	if (rt5677_dsp->new_hotword) {
+		rt5677_dsp->new_hotword = false;
+		/* See if buffer wraparound happens */
+		if (mic_write_offset < RT5677_MIC_BUF_FIRST_READ_SIZE)
+			rt5677_dsp->mic_read_offset = RT5677_MIC_BUF_BYTES -
+					(RT5677_MIC_BUF_FIRST_READ_SIZE -
+					mic_write_offset);
+		else
+			rt5677_dsp->mic_read_offset = mic_write_offset -
+					RT5677_MIC_BUF_FIRST_READ_SIZE;
+	}
+
+	/* Calculate the amount of new samples in bytes */
+	if (rt5677_dsp->mic_read_offset <= mic_write_offset)
+		new_bytes = mic_write_offset - rt5677_dsp->mic_read_offset;
+	else
+		new_bytes = RT5677_MIC_BUF_BYTES + mic_write_offset
+				- rt5677_dsp->mic_read_offset;
+
+	/* Copy all new samples from DSP mic buffer, one period at a time */
+	period_bytes = snd_pcm_lib_period_bytes(rt5677_dsp->substream);
+	while (new_bytes) {
+		copy_bytes = min(new_bytes, period_bytes
+				- rt5677_dsp->avail_bytes);
+		ret = rt5677_spi_copy(rt5677_dsp, copy_bytes);
+		if (ret) {
+			dev_err(rt5677_dsp->dev, "Copy failed %d\n", ret);
+			goto done;
+		}
+		rt5677_dsp->avail_bytes += copy_bytes;
+		if (rt5677_dsp->avail_bytes >= period_bytes) {
+			snd_pcm_period_elapsed(rt5677_dsp->substream);
+			rt5677_dsp->avail_bytes = 0;
+		}
+		new_bytes -= copy_bytes;
+	}
+
+	delay = bytes_to_frames(runtime, period_bytes) / (runtime->rate / 1000);
+	schedule_delayed_work(&rt5677_dsp->copy_work, msecs_to_jiffies(delay));
+done:
+	mutex_unlock(&rt5677_dsp->dma_lock);
+}
+
+struct page *rt5677_spi_pcm_page(
+		struct snd_soc_component *component,
+		struct snd_pcm_substream *substream,
+		unsigned long offset)
+{
+	return snd_pcm_lib_get_vmalloc_page(substream, offset);
+}
+
+static int rt5677_spi_pcm_probe(struct snd_soc_component *component)
+{
+	struct rt5677_dsp *rt5677_dsp;
+
+	rt5677_dsp = devm_kzalloc(component->dev, sizeof(*rt5677_dsp),
+			GFP_KERNEL);
+	rt5677_dsp->dev = &g_spi->dev;
+	mutex_init(&rt5677_dsp->dma_lock);
+	INIT_DELAYED_WORK(&rt5677_dsp->copy_work, rt5677_spi_copy_work);
+
+	snd_soc_component_set_drvdata(component, rt5677_dsp);
+	return 0;
+}
+
+static const struct snd_soc_component_driver rt5677_spi_dai_component = {
+	.name		= DRV_NAME,
+	.probe		= rt5677_spi_pcm_probe,
+	.open		= rt5677_spi_pcm_open,
+	.close		= rt5677_spi_pcm_close,
+	.hw_params	= rt5677_spi_hw_params,
+	.hw_free	= rt5677_spi_hw_free,
+	.prepare	= rt5677_spi_prepare,
+	.pointer	= rt5677_spi_pcm_pointer,
+	.page		= rt5677_spi_pcm_page,
+};
+
 /* Select a suitable transfer command for the next transfer to ensure
  * the transfer address is always naturally aligned while minimizing
  * the total number of transfers required.
@@ -218,9 +566,45 @@ int rt5677_spi_write_firmware(u32 addr, const struct firmware *fw)
 }
 EXPORT_SYMBOL_GPL(rt5677_spi_write_firmware);
 
+void rt5677_spi_hotword_detected(void)
+{
+	struct rt5677_dsp *rt5677_dsp;
+
+	if (!g_spi)
+		return;
+
+	rt5677_dsp = dev_get_drvdata(&g_spi->dev);
+	if (!rt5677_dsp) {
+		dev_err(&g_spi->dev, "Can't get rt5677_dsp\n");
+		return;
+	}
+
+	mutex_lock(&rt5677_dsp->dma_lock);
+	dev_info(rt5677_dsp->dev, "Hotword detected\n");
+	rt5677_dsp->new_hotword = true;
+	mutex_unlock(&rt5677_dsp->dma_lock);
+
+	schedule_delayed_work(&rt5677_dsp->copy_work, 0);
+}
+EXPORT_SYMBOL_GPL(rt5677_spi_hotword_detected);
+
 static int rt5677_spi_probe(struct spi_device *spi)
 {
+	int ret;
+
 	g_spi = spi;
+
+	ret = snd_soc_register_component(&spi->dev, &rt5677_spi_dai_component,
+					 &rt5677_spi_dai, 1);
+	if (ret < 0)
+		dev_err(&spi->dev, "Failed to register component.\n");
+
+	return ret;
+}
+
+static int rt5677_spi_remove(struct spi_device *spi)
+{
+	snd_soc_unregister_component(&spi->dev);
 	return 0;
 }
 
@@ -236,6 +620,7 @@ static struct spi_driver rt5677_spi_driver = {
 		.acpi_match_table = ACPI_PTR(rt5677_spi_acpi_id),
 	},
 	.probe = rt5677_spi_probe,
+	.remove = rt5677_spi_remove,
 };
 module_spi_driver(rt5677_spi_driver);
 
diff --git a/sound/soc/codecs/rt5677-spi.h b/sound/soc/codecs/rt5677-spi.h
index 6ba3369dc235..3af36ec928e9 100644
--- a/sound/soc/codecs/rt5677-spi.h
+++ b/sound/soc/codecs/rt5677-spi.h
@@ -12,5 +12,6 @@
 int rt5677_spi_read(u32 addr, void *rxbuf, size_t len);
 int rt5677_spi_write(u32 addr, const void *txbuf, size_t len);
 int rt5677_spi_write_firmware(u32 addr, const struct firmware *fw);
+void rt5677_spi_hotword_detected(void);
 
 #endif /* __RT5677_SPI_H__ */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
