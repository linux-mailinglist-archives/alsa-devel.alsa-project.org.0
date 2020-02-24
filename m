Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CC816B3E6
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 23:27:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A5B316A2;
	Mon, 24 Feb 2020 23:26:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A5B316A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582583248;
	bh=ZhKukPInoy7+KUiQikAGKC9zuCC62IR+/ZbZ6eZwrgw=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=U1PvquJoyjHBxKgVlpsq8E0TstagGFChSCEqBRF9Kj/WEu6PNlG2fe+E31GAZ4lJs
	 3LVwYbJ9qtbEiSX2k56xsbtX/1okgp5N0W0k0pLGhx4Ij1nx0qUgXhQN3PtEaD2bji
	 UWMz2BdwcQwdMouoIT4Ji2ZG9ayVIof0TJ5CzDbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08EECF802DC;
	Mon, 24 Feb 2020 23:22:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 214ABF802DB; Mon, 24 Feb 2020 23:22:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 348C8F802C3
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 23:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 348C8F802C3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CC3330E;
 Mon, 24 Feb 2020 14:22:05 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE0273F534;
 Mon, 24 Feb 2020 14:22:04 -0800 (PST)
Date: Mon, 24 Feb 2020 22:22:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-pcm: add snd_soc_dai_get_pcm_stream()" to the asoc
 tree
In-Reply-To: <87ftf7jcab.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87ftf7jcab.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

The patch

   ASoC: soc-pcm: add snd_soc_dai_get_pcm_stream()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From acf253c11329caa6be6d2abc14dfc8c0ec83718a Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 19 Feb 2020 15:56:30 +0900
Subject: [PATCH] ASoC: soc-pcm: add snd_soc_dai_get_pcm_stream()

DAI driver has playback/capture stream.
OTOH, we have SNDRV_PCM_STREAM_PLAYBACK/CAPTURE.
Because of this kind of implementation,
ALSA SoC needs to have many verbose code.

To solve this issue, this patch adds snd_soc_dai_get_pcm_stream() macro
to get playback/capture stream pointer from stream.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87ftf7jcab.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dai.h |  7 ++++++
 sound/soc/soc-dai.c     |  7 +-----
 sound/soc/soc-pcm.c     | 49 ++++++++---------------------------------
 3 files changed, 17 insertions(+), 46 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 7481e468be39..c1089194ddf1 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -352,6 +352,13 @@ struct snd_soc_dai {
 	unsigned int started:1;
 };
 
+static inline struct snd_soc_pcm_stream *
+snd_soc_dai_get_pcm_stream(const struct snd_soc_dai *dai, int stream)
+{
+	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+		&dai->driver->playback : &dai->driver->capture;
+}
+
 static inline void *snd_soc_dai_get_dma_data(const struct snd_soc_dai *dai,
 					     const struct snd_pcm_substream *ss)
 {
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 73a829393652..19142f6e533c 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -390,12 +390,7 @@ int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
  */
 bool snd_soc_dai_stream_valid(struct snd_soc_dai *dai, int dir)
 {
-	struct snd_soc_pcm_stream *stream;
-
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
-		stream = &dai->driver->playback;
-	else
-		stream = &dai->driver->capture;
+	struct snd_soc_pcm_stream *stream = snd_soc_dai_get_pcm_stream(dai, dir);
 
 	/* If the codec specifies any channels at all, it supports the stream */
 	return stream->channels_min;
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index aff27c8599ef..7cb445bb1b54 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -396,20 +396,16 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 	struct snd_pcm_hardware *hw = &runtime->hw;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai_driver *cpu_dai_drv = rtd->cpu_dai->driver;
-	struct snd_soc_dai_driver *codec_dai_drv;
 	struct snd_soc_pcm_stream *codec_stream;
 	struct snd_soc_pcm_stream *cpu_stream;
 	unsigned int chan_min = 0, chan_max = UINT_MAX;
 	unsigned int rate_min = 0, rate_max = UINT_MAX;
 	unsigned int rates = UINT_MAX;
 	u64 formats = ULLONG_MAX;
+	int stream = substream->stream;
 	int i;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		cpu_stream = &cpu_dai_drv->playback;
-	else
-		cpu_stream = &cpu_dai_drv->capture;
+	cpu_stream = snd_soc_dai_get_pcm_stream(rtd->cpu_dai, stream);
 
 	/* first calculate min/max only for CODECs in the DAI link */
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
@@ -427,11 +423,8 @@ static void soc_pcm_init_runtime_hw(struct snd_pcm_substream *substream)
 					      substream->stream))
 			continue;
 
-		codec_dai_drv = codec_dai->driver;
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			codec_stream = &codec_dai_drv->playback;
-		else
-			codec_stream = &codec_dai_drv->capture;
+		codec_stream = snd_soc_dai_get_pcm_stream(codec_dai, stream);
+
 		chan_min = max(chan_min, codec_stream->channels_min);
 		chan_max = min(chan_max, codec_stream->channels_max);
 		rate_min = max(rate_min, codec_stream->rate_min);
@@ -1600,7 +1593,6 @@ static void dpcm_runtime_merge_format(struct snd_pcm_substream *substream,
 
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
-		struct snd_soc_dai_driver *codec_dai_drv;
 		struct snd_soc_pcm_stream *codec_stream;
 		int i;
 
@@ -1612,11 +1604,7 @@ static void dpcm_runtime_merge_format(struct snd_pcm_substream *substream,
 			if (!snd_soc_dai_stream_valid(dai, stream))
 				continue;
 
-			codec_dai_drv = dai->driver;
-			if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-				codec_stream = &codec_dai_drv->playback;
-			else
-				codec_stream = &codec_dai_drv->capture;
+			codec_stream = snd_soc_dai_get_pcm_stream(dai, stream);
 
 			*formats &= codec_stream->formats;
 		}
@@ -1641,15 +1629,10 @@ static void dpcm_runtime_merge_chan(struct snd_pcm_substream *substream,
 
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
-		struct snd_soc_dai_driver *cpu_dai_drv =  be->cpu_dai->driver;
-		struct snd_soc_dai_driver *codec_dai_drv;
 		struct snd_soc_pcm_stream *codec_stream;
 		struct snd_soc_pcm_stream *cpu_stream;
 
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-			cpu_stream = &cpu_dai_drv->playback;
-		else
-			cpu_stream = &cpu_dai_drv->capture;
+		cpu_stream = snd_soc_dai_get_pcm_stream(be->cpu_dai, stream);
 
 		*channels_min = max(*channels_min, cpu_stream->channels_min);
 		*channels_max = min(*channels_max, cpu_stream->channels_max);
@@ -1659,12 +1642,7 @@ static void dpcm_runtime_merge_chan(struct snd_pcm_substream *substream,
 		 * DAIs connected to a single CPU DAI, use CPU DAI's directly
 		 */
 		if (be->num_codecs == 1) {
-			codec_dai_drv = be->codec_dais[0]->driver;
-
-			if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-				codec_stream = &codec_dai_drv->playback;
-			else
-				codec_stream = &codec_dai_drv->capture;
+			codec_stream = snd_soc_dai_get_pcm_stream(be->codec_dais[0], stream);
 
 			*channels_min = max(*channels_min,
 					    codec_stream->channels_min);
@@ -1693,17 +1671,12 @@ static void dpcm_runtime_merge_rate(struct snd_pcm_substream *substream,
 
 	for_each_dpcm_be(fe, stream, dpcm) {
 		struct snd_soc_pcm_runtime *be = dpcm->be;
-		struct snd_soc_dai_driver *cpu_dai_drv =  be->cpu_dai->driver;
-		struct snd_soc_dai_driver *codec_dai_drv;
 		struct snd_soc_pcm_stream *codec_stream;
 		struct snd_soc_pcm_stream *cpu_stream;
 		struct snd_soc_dai *dai;
 		int i;
 
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-			cpu_stream = &cpu_dai_drv->playback;
-		else
-			cpu_stream = &cpu_dai_drv->capture;
+		cpu_stream = snd_soc_dai_get_pcm_stream(be->cpu_dai, stream);
 
 		*rate_min = max(*rate_min, cpu_stream->rate_min);
 		*rate_max = min_not_zero(*rate_max, cpu_stream->rate_max);
@@ -1717,11 +1690,7 @@ static void dpcm_runtime_merge_rate(struct snd_pcm_substream *substream,
 			if (!snd_soc_dai_stream_valid(dai, stream))
 				continue;
 
-			codec_dai_drv = dai->driver;
-			if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-				codec_stream = &codec_dai_drv->playback;
-			else
-				codec_stream = &codec_dai_drv->capture;
+			codec_stream = snd_soc_dai_get_pcm_stream(dai, stream);
 
 			*rate_min = max(*rate_min, codec_stream->rate_min);
 			*rate_max = min_not_zero(*rate_max,
-- 
2.20.1

