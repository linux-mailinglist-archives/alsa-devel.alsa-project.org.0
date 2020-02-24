Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 962E816B3DE
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Feb 2020 23:26:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A6971683;
	Mon, 24 Feb 2020 23:25:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A6971683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582583189;
	bh=Hxp8JywE/H6ph8jDRZiGvaZhai2DuQhtjZD3Py5MXwI=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=QjBDNXgZqTiCMOnZjR3PZ6noaLLmi8lKxUyjoZGRgwztzL3w8K/rhHp5YnfJldNcM
	 2715yucozRGmiDEfoxzuISg7giRz1Y4440YW5SQ2xZe9gDwgjyzEJH0OjFO7WZ9Qrl
	 5srSC4wxrK1Dnn5Uocy3J1dRlOEt6T+vvXX5kV2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33FDFF802BC;
	Mon, 24 Feb 2020 23:22:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 238CAF802A9; Mon, 24 Feb 2020 23:22:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 7014DF802A0
 for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2020 23:21:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7014DF802A0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F48831B;
 Mon, 24 Feb 2020 14:21:56 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 858E43F534;
 Mon, 24 Feb 2020 14:21:55 -0800 (PST)
Date: Mon, 24 Feb 2020 22:21:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-pcm: add snd_soc_dai_get_widget()" to the asoc tree
In-Reply-To: <87d0abjca1.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87d0abjca1.wl-kuninori.morimoto.gx@renesas.com>
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

   ASoC: soc-pcm: add snd_soc_dai_get_widget()

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

From 0c01f6ca8e4cc1e5505bf4657cf77fbfaa7b0bc2 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 19 Feb 2020 15:56:41 +0900
Subject: [PATCH] ASoC: soc-pcm: add snd_soc_dai_get_widget()

soc-pcm.c has dai_get_widget(), but it can be more generic.
This patch renames it to snd_soc_dai_get_widget(), and use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87d0abjca1.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dai.h           |  8 ++++++++
 sound/soc/intel/skylake/skl-pcm.c | 10 ++--------
 sound/soc/soc-dapm.c              | 10 ++--------
 sound/soc/soc-pcm.c               | 17 ++++-------------
 4 files changed, 16 insertions(+), 29 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index c1089194ddf1..92c382690930 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -359,6 +359,14 @@ snd_soc_dai_get_pcm_stream(const struct snd_soc_dai *dai, int stream)
 		&dai->driver->playback : &dai->driver->capture;
 }
 
+static inline
+struct snd_soc_dapm_widget *snd_soc_dai_get_widget(
+	struct snd_soc_dai *dai, int stream)
+{
+	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+		dai->playback_widget : dai->capture_widget;
+}
+
 static inline void *snd_soc_dai_get_dma_data(const struct snd_soc_dai *dai,
 					     const struct snd_pcm_substream *ss)
 {
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index b99509675d29..05a9677c5a53 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -112,10 +112,7 @@ static void skl_set_suspend_active(struct snd_pcm_substream *substream,
 	struct snd_soc_dapm_widget *w;
 	struct skl_dev *skl = bus_to_skl(bus);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		w = dai->playback_widget;
-	else
-		w = dai->capture_widget;
+	w = snd_soc_dai_get_widget(dai, substream->stream);
 
 	if (w->ignore_suspend && enable)
 		skl->supend_active++;
@@ -475,10 +472,7 @@ static int skl_pcm_trigger(struct snd_pcm_substream *substream, int cmd,
 	if (!mconfig)
 		return -EIO;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-		w = dai->playback_widget;
-	else
-		w = dai->capture_widget;
+	w = snd_soc_dai_get_widget(dai, substream->stream);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_RESUME:
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 69eff234b26f..f2e678865480 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2620,10 +2620,7 @@ static int dapm_update_dai_unlocked(struct snd_pcm_substream *substream,
 	struct snd_soc_dapm_widget *w;
 	int ret;
 
-	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
-		w = dai->playback_widget;
-	else
-		w = dai->capture_widget;
+	w = snd_soc_dai_get_widget(dai, dir);
 
 	if (!w)
 		return 0;
@@ -4389,10 +4386,7 @@ static void soc_dapm_dai_stream_event(struct snd_soc_dai *dai, int stream,
 	struct snd_soc_dapm_widget *w;
 	unsigned int ep;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-		w = dai->playback_widget;
-	else
-		w = dai->capture_widget;
+	w = snd_soc_dai_get_widget(dai, stream);
 
 	if (w) {
 		dapm_mark_dirty(w, "stream event");
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 6f56526bbb26..e183fabc5b6f 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -82,15 +82,6 @@ static int soc_rtd_trigger(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
-static inline
-struct snd_soc_dapm_widget *dai_get_widget(struct snd_soc_dai *dai, int stream)
-{
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-		return dai->playback_widget;
-	else
-		return dai->capture_widget;
-}
-
 static void snd_soc_runtime_action(struct snd_soc_pcm_runtime *rtd,
 				   int stream, int action)
 {
@@ -1242,7 +1233,7 @@ static struct snd_soc_pcm_runtime *dpcm_get_be(struct snd_soc_card *card,
 		if (!be->dai_link->no_pcm)
 			continue;
 
-		w = dai_get_widget(be->cpu_dai, stream);
+		w = snd_soc_dai_get_widget(be->cpu_dai, stream);
 
 		dev_dbg(card->dev, "ASoC: try BE : %s\n",
 			w ? w->name : "(not set)");
@@ -1251,7 +1242,7 @@ static struct snd_soc_pcm_runtime *dpcm_get_be(struct snd_soc_card *card,
 			return be;
 
 		for_each_rtd_codec_dai(be, i, dai) {
-			w = dai_get_widget(dai, stream);
+			w = snd_soc_dai_get_widget(dai, stream);
 
 			if (w == widget)
 				return be;
@@ -1326,7 +1317,7 @@ static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
 		unsigned int i;
 
 		/* is there a valid CPU DAI widget for this BE */
-		widget = dai_get_widget(dpcm->be->cpu_dai, stream);
+		widget = snd_soc_dai_get_widget(dpcm->be->cpu_dai, stream);
 
 		/* prune the BE if it's no longer in our active list */
 		if (widget && widget_in_list(list, widget))
@@ -1335,7 +1326,7 @@ static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
 		/* is there a valid CODEC DAI widget for this BE */
 		do_prune = 1;
 		for_each_rtd_codec_dai(dpcm->be, i, dai) {
-			widget = dai_get_widget(dai, stream);
+			widget = snd_soc_dai_get_widget(dai, stream);
 
 			/* prune the BE if it's no longer in our active list */
 			if (widget && widget_in_list(list, widget))
-- 
2.20.1

