Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E3CAC0E6
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 21:51:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5646D1655;
	Fri,  6 Sep 2019 21:50:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5646D1655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567799480;
	bh=juvjR6YxbBb+UAYryAVEYCU2EpF9AZkRdO2cI9Cg0Rs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AiDstikOdEUtqTtCRmY7d2UxkRSRxvjWbEN5LUceITDq1XfFNbLCoum2EFqQvQ/Au
	 2571GQ3GUj7uiJwuK9e9dOfx2axDattaimX1hGwNrsE2lTVKNp7mCpxvCdhrDbZ9Or
	 Ec7XofdjaIh8DPtfSRIufhmSPDn7XW3mzVEGNiLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D49AF80633;
	Fri,  6 Sep 2019 21:47:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6DB5F80612; Fri,  6 Sep 2019 21:47:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8817F8060E
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 21:47:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8817F8060E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="gIfihF6/"
Received: by mail-pf1-x441.google.com with SMTP id r12so5238465pfh.1
 for <alsa-devel@alsa-project.org>; Fri, 06 Sep 2019 12:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=moKloexR9vorDQM4Iosj84blg7yZVcNp+szO8t+Ry2A=;
 b=gIfihF6/9VLzqid9Qar35yfcL/R2oiYK2NKvvKimBd2Ok976folsyXi5WqguJymasd
 8HOHFkSykA4yD62UjBPLWCmeW6mUKE7o108FA832XfErHH+e+BJ5mnqZCYvVButrTAVF
 Qy4eqt0huoPoNCwRybGIjxqEACBaJbLill4GU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=moKloexR9vorDQM4Iosj84blg7yZVcNp+szO8t+Ry2A=;
 b=jb/4pe3DjkHIbpvhURydct9bDMWXRYM7J2k6dG0Yu93+47gSmqmJgRXk0ZgGG71UsF
 8IVGFFvDNaB1XdlzDFffK9qg7/sq0jzmlv1uD5btNje6kckTFEm1UKLY6xHLZ+aWnbeU
 OrRO/teSQerx15s1YmzSp4gpuVp5fYtTCCU/tKoe95q9oGnaXCER6SAKqtNewyzs+Xyo
 DsrsvXnlqKD4IC965/E+7jxpCjM8t9a5ngfciahFbNAA58T7FPCLxsQ+9CHwWWrXsFhO
 rRXSodBe/Z8SRdYeC7LUhovycC3Ecpv1QWniZhj2Y7nwmYHf5c6BfOV8aAz2CXY2S9GX
 k49w==
X-Gm-Message-State: APjAAAX+1m7P56aJkwiPaZYOnlvaT35may6ejiB/r51adX4FAF0i35+N
 eaSSB9pbnySnLFHuF7rRzMuglhEluw==
X-Google-Smtp-Source: APXvYqy68yyUvEm5xGhBP7gNLofxqIloeHIHweP9SFnwv/iMIyxuymPge8ji73T/pUYbCKbFyuFvkw==
X-Received: by 2002:a62:ed04:: with SMTP id u4mr12635666pfh.220.1567799268622; 
 Fri, 06 Sep 2019 12:47:48 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id h70sm5482135pgc.36.2019.09.06.12.47.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2019 12:47:48 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri,  6 Sep 2019 12:46:25 -0700
Message-Id: <20190906194636.217881-4-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.187.g17f5b7556c-goog
In-Reply-To: <20190906194636.217881-1-cujomalainey@chromium.org>
References: <20190906194636.217881-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ben Zhang <benzh@chromium.org>,
 Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [RFC 03/15] ASoC: rt5677: Add a PCM device for
	streaming hotword via SPI
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ben Zhang <benzh@chromium.org>

This patch implements a PCM interface for streaming hotword
phrases over SPI. Userspace can open the PCM device at anytime.
The stream is blocked when no hotword is detected. The mic
audio buffer on the DSP is a ~128KByte ring buffer that holds
~4sec of audio samples recorded from the DMIC (S16_LE, mono,
16KHz). After a hotword is detected, previous 2 seconds of audio
(containing the detected hotword) is streamed first, then live
capture continues until userspace closes the PCM stream.

Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677-spi.c | 360 ++++++++++++++++++++++++++++++++++
 sound/soc/codecs/rt5677-spi.h |   1 +
 2 files changed, 361 insertions(+)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index d681488f5312..62621fe4747c 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -24,6 +24,8 @@
 #include <linux/firmware.h>
 #include <linux/acpi.h>
 
+#include <sound/soc.h>
+
 #include "rt5677-spi.h"
 
 #define DRV_NAME "rt5677spi"
@@ -45,9 +47,330 @@
 #define RT5677_SPI_WRITE_16	0x1
 #define RT5677_SPI_READ_16	0x0
 
+#define RT5677_BUF_BYTES_TOTAL		0x20000
+#define RT5677_MIC_BUF_ADDR		0x60030000
+#define RT5677_MODEL_ADDR		0x5FFC9800
+#define RT5677_MIC_BUF_BYTES		(RT5677_BUF_BYTES_TOTAL - sizeof(u32))
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
+static int rt5677_spi_pcm_open(struct snd_pcm_substream *substream)
+{
+	snd_soc_set_runtime_hwparams(substream, &rt5677_spi_pcm_hardware);
+	return 0;
+}
+
+static int rt5677_spi_pcm_close(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *component =
+			snd_soc_rtdcom_lookup(rtd, DRV_NAME);
+	struct rt5677_dsp *rt5677_dsp =
+			snd_soc_component_get_drvdata(component);
+
+	cancel_delayed_work_sync(&rt5677_dsp->copy_work);
+	return 0;
+}
+
+static int rt5677_spi_hw_params(struct snd_pcm_substream *substream,
+			       struct snd_pcm_hw_params *hw_params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *component =
+			snd_soc_rtdcom_lookup(rtd, DRV_NAME);
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
+static int rt5677_spi_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *component =
+			snd_soc_rtdcom_lookup(rtd, DRV_NAME);
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
+static int rt5677_spi_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *component =
+			snd_soc_rtdcom_lookup(rtd, DRV_NAME);
+	struct rt5677_dsp *rt5677_dsp =
+			snd_soc_component_get_drvdata(component);
+
+	rt5677_dsp->dma_offset = 0;
+	rt5677_dsp->avail_bytes = 0;
+	return 0;
+}
+
+static snd_pcm_uframes_t rt5677_spi_pcm_pointer(
+		struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_component *component =
+			snd_soc_rtdcom_lookup(rtd, DRV_NAME);
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
+ * Copy a block of audio samples from the DSP mic buffer to the dma_area of
+ * the pcm runtime. The receiving buffer may wrap around.
+ * @begin: start offset of the block to copy, in bytes.
+ * @end:   offset of the first byte after the block to copy, must be greater
+ *         than or equal to begin.
+ *
+ * Return: Zero if successful, or a negative error code on failure.
+ */
+static int rt5677_spi_append_data(struct rt5677_dsp *rt5677_dsp,
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
+ * A delayed work that streams audio samples from the DSP mic buffer to the
+ * dma_area of the pcm runtime via SPI.
+ */
+static void rt5677_spi_copy_work(struct work_struct *work)
+{
+	struct rt5677_dsp *rt5677_dsp =
+		container_of(work, struct rt5677_dsp, copy_work.work);
+	struct snd_pcm_runtime *runtime;
+	u32 mic_write_offset;
+	size_t bytes_copied, period_bytes;
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
+	/* Copy all new samples from DSP's mic buffer to dma_area */
+	bytes_copied = 0;
+	if (rt5677_dsp->mic_read_offset < mic_write_offset) {
+		/* One chunk in DSP's mic buffer */
+		ret |= rt5677_spi_append_data(rt5677_dsp,
+				rt5677_dsp->mic_read_offset, mic_write_offset);
+		bytes_copied = mic_write_offset - rt5677_dsp->mic_read_offset;
+	} else if (rt5677_dsp->mic_read_offset > mic_write_offset) {
+		/* Wrap around, two chunks in DSP's mic buffer */
+		ret |= rt5677_spi_append_data(rt5677_dsp,
+				rt5677_dsp->mic_read_offset,
+				RT5677_MIC_BUF_BYTES);
+		ret |= rt5677_spi_append_data(rt5677_dsp, 0, mic_write_offset);
+		bytes_copied = RT5677_MIC_BUF_BYTES -
+				rt5677_dsp->mic_read_offset + mic_write_offset;
+	}
+	if (ret) {
+		dev_err(rt5677_dsp->dev, "Copy failed %d\n", ret);
+		goto done;
+	}
+
+	rt5677_dsp->mic_read_offset = mic_write_offset;
+	rt5677_dsp->avail_bytes += bytes_copied;
+	period_bytes = snd_pcm_lib_period_bytes(rt5677_dsp->substream);
+
+	if (rt5677_dsp->avail_bytes >= period_bytes) {
+		snd_pcm_period_elapsed(rt5677_dsp->substream);
+		rt5677_dsp->avail_bytes = 0;
+	}
+	/* TODO benzh: use better delay time based on period_bytes */
+	schedule_delayed_work(&rt5677_dsp->copy_work, msecs_to_jiffies(5));
+done:
+	mutex_unlock(&rt5677_dsp->dma_lock);
+}
+
+struct page *rt5677_spi_pcm_page(struct snd_pcm_substream *substream,
+		unsigned long offset)
+{
+	return snd_pcm_lib_get_vmalloc_page(substream, offset);
+}
+
+static struct snd_pcm_ops rt5677_spi_pcm_ops = {
+	.open		= rt5677_spi_pcm_open,
+	.close		= rt5677_spi_pcm_close,
+	.hw_params	= rt5677_spi_hw_params,
+	.hw_free	= rt5677_spi_hw_free,
+	.prepare	= rt5677_spi_prepare,
+	.pointer	= rt5677_spi_pcm_pointer,
+	.page		= rt5677_spi_pcm_page,
+};
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
+	.ops		= &rt5677_spi_pcm_ops,
+};
+
 /* Select a suitable transfer command for the next transfer to ensure
  * the transfer address is always naturally aligned while minimizing
  * the total number of transfers required.
@@ -218,9 +541,45 @@ int rt5677_spi_write_firmware(u32 addr, const struct firmware *fw)
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
 
@@ -236,6 +595,7 @@ static struct spi_driver rt5677_spi_driver = {
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
2.23.0.187.g17f5b7556c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
