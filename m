Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 617F3163852
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 01:14:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09A0F16A4;
	Wed, 19 Feb 2020 01:13:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09A0F16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582071258;
	bh=G2HAbi5umGSupa1sdFld8vsJPe0HrE9pJ/tJvumD8hE=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=F3luHf+5hz7pxIgSacJxA28DexvqIbM+rZA8AAdj5UruAutUooov92wwQQEngVSEP
	 uEf7JDWDlG8M40knTmwJ/9Ev66fnHfXx84qnm9+kcd0cteCWce5TZ4A9tt2qO7gbN0
	 TMuV261ypLnfIKSNm/HtShepofpd/zB1WDN5ijSs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DF11F80299;
	Wed, 19 Feb 2020 01:09:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE52DF80292; Wed, 19 Feb 2020 01:09:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8D6ACF8028F
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:09:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D6ACF8028F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CBB71FB;
 Tue, 18 Feb 2020 16:09:32 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2DC53F68F;
 Tue, 18 Feb 2020 16:09:31 -0800 (PST)
Date: Wed, 19 Feb 2020 00:09:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-pcm: use for_each_pcm_streams() macro" to the asoc
 tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

   ASoC: soc-pcm: use for_each_pcm_streams() macro

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

From 7083f877ea66e106f90e9a1a0dabb19ebbacc4e6 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 17 Feb 2020 17:28:28 +0900
Subject: [PATCH] ASoC: soc-pcm: use for_each_pcm_streams() macro

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/871rqtboth.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 97 ++++++++++++++++-----------------------------
 1 file changed, 35 insertions(+), 62 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 6fd69574ca31..63f67eb7c077 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2612,6 +2612,7 @@ static int dpcm_run_old_update(struct snd_soc_pcm_runtime *fe, int stream)
 static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 {
 	struct snd_soc_dapm_widget_list *list;
+	int stream;
 	int count, paths;
 
 	if (!fe->dai_link->dynamic)
@@ -2625,69 +2626,42 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 	dev_dbg(fe->dev, "ASoC: DPCM %s runtime update for FE %s\n",
 		new ? "new" : "old", fe->dai_link->name);
 
-	/* skip if FE doesn't have playback capability */
-	if (!snd_soc_dai_stream_valid(fe->cpu_dai,   SNDRV_PCM_STREAM_PLAYBACK) ||
-	    !snd_soc_dai_stream_valid(fe->codec_dai, SNDRV_PCM_STREAM_PLAYBACK))
-		goto capture;
-
-	/* skip if FE isn't currently playing */
-	if (!fe->cpu_dai->stream_active[SNDRV_PCM_STREAM_PLAYBACK] ||
-	    !fe->codec_dai->stream_active[SNDRV_PCM_STREAM_PLAYBACK])
-		goto capture;
-
-	paths = dpcm_path_get(fe, SNDRV_PCM_STREAM_PLAYBACK, &list);
-	if (paths < 0) {
-		dev_warn(fe->dev, "ASoC: %s no valid %s path\n",
-			 fe->dai_link->name,  "playback");
-		return paths;
-	}
-
-	/* update any playback paths */
-	count = dpcm_process_paths(fe, SNDRV_PCM_STREAM_PLAYBACK, &list, new);
-	if (count) {
-		if (new)
-			dpcm_run_new_update(fe, SNDRV_PCM_STREAM_PLAYBACK);
-		else
-			dpcm_run_old_update(fe, SNDRV_PCM_STREAM_PLAYBACK);
+	for_each_pcm_streams(stream) {
 
-		dpcm_clear_pending_state(fe, SNDRV_PCM_STREAM_PLAYBACK);
-		dpcm_be_disconnect(fe, SNDRV_PCM_STREAM_PLAYBACK);
-	}
-
-	dpcm_path_put(&list);
+		/* skip if FE doesn't have playback/capture capability */
+		if (!snd_soc_dai_stream_valid(fe->cpu_dai,   stream) ||
+		    !snd_soc_dai_stream_valid(fe->codec_dai, stream))
+			continue;
 
-capture:
-	/* skip if FE doesn't have capture capability */
-	if (!snd_soc_dai_stream_valid(fe->cpu_dai,   SNDRV_PCM_STREAM_CAPTURE) ||
-	    !snd_soc_dai_stream_valid(fe->codec_dai, SNDRV_PCM_STREAM_CAPTURE))
-		return 0;
+		/* skip if FE isn't currently playing/capturing */
+		if (!fe->cpu_dai->stream_active[stream] ||
+		    !fe->codec_dai->stream_active[stream])
+			continue;
 
-	/* skip if FE isn't currently capturing */
-	if (!fe->cpu_dai->stream_active[SNDRV_PCM_STREAM_CAPTURE] ||
-	    !fe->codec_dai->stream_active[SNDRV_PCM_STREAM_CAPTURE])
-		return 0;
+		paths = dpcm_path_get(fe, stream, &list);
+		if (paths < 0) {
+			dev_warn(fe->dev, "ASoC: %s no valid %s path\n",
+				 fe->dai_link->name,
+				 stream == SNDRV_PCM_STREAM_PLAYBACK ?
+				 "playback" : "capture");
+			return paths;
+		}
 
-	paths = dpcm_path_get(fe, SNDRV_PCM_STREAM_CAPTURE, &list);
-	if (paths < 0) {
-		dev_warn(fe->dev, "ASoC: %s no valid %s path\n",
-			 fe->dai_link->name,  "capture");
-		return paths;
-	}
+		/* update any playback/capture paths */
+		count = dpcm_process_paths(fe, stream, &list, new);
+		if (count) {
+			if (new)
+				dpcm_run_new_update(fe, stream);
+			else
+				dpcm_run_old_update(fe, stream);
 
-	/* update any old capture paths */
-	count = dpcm_process_paths(fe, SNDRV_PCM_STREAM_CAPTURE, &list, new);
-	if (count) {
-		if (new)
-			dpcm_run_new_update(fe, SNDRV_PCM_STREAM_CAPTURE);
-		else
-			dpcm_run_old_update(fe, SNDRV_PCM_STREAM_CAPTURE);
+			dpcm_clear_pending_state(fe, stream);
+			dpcm_be_disconnect(fe, stream);
+		}
 
-		dpcm_clear_pending_state(fe, SNDRV_PCM_STREAM_CAPTURE);
-		dpcm_be_disconnect(fe, SNDRV_PCM_STREAM_CAPTURE);
+		dpcm_path_put(&list);
 	}
 
-	dpcm_path_put(&list);
-
 	return 0;
 }
 
@@ -3114,19 +3088,18 @@ static ssize_t dpcm_state_read_file(struct file *file, char __user *user_buf,
 {
 	struct snd_soc_pcm_runtime *fe = file->private_data;
 	ssize_t out_count = PAGE_SIZE, offset = 0, ret = 0;
+	int stream;
 	char *buf;
 
 	buf = kmalloc(out_count, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
-	if (snd_soc_dai_stream_valid(fe->cpu_dai, SNDRV_PCM_STREAM_PLAYBACK))
-		offset += dpcm_show_state(fe, SNDRV_PCM_STREAM_PLAYBACK,
-					buf + offset, out_count - offset);
-
-	if (snd_soc_dai_stream_valid(fe->cpu_dai, SNDRV_PCM_STREAM_CAPTURE))
-		offset += dpcm_show_state(fe, SNDRV_PCM_STREAM_CAPTURE,
-					buf + offset, out_count - offset);
+	for_each_pcm_streams(stream)
+		if (snd_soc_dai_stream_valid(fe->cpu_dai, stream))
+			offset += dpcm_show_state(fe, stream,
+						  buf + offset,
+						  out_count - offset);
 
 	ret = simple_read_from_buffer(user_buf, count, ppos, buf, offset);
 
-- 
2.20.1

