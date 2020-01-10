Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FE6136E54
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 14:41:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 980C61704;
	Fri, 10 Jan 2020 14:40:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 980C61704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578663690;
	bh=7u0IyDZLeaKgO+YzeXoLjdMCz3Bak5GaIq0xZL/HKN0=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Zh5YBCD+pLFxd/KEn7BzOK/atZsqLmFO9JwyDEBMM6/fdQ91PaC+kPp0Jskp2W21q
	 te1QjB077kSYY8OESDKEzwq8pkG/AEU7UJqbM7Li0q9p/ci3iiRg5ZHoZPYGthaWFn
	 rPUEVC/8yh/CnI88UTMhbXpW/bavnLxTo86yb0Zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0954FF8011C;
	Fri, 10 Jan 2020 14:37:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8DC0F80130; Fri, 10 Jan 2020 14:37:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 1856CF80116
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 14:37:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1856CF80116
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E01D81FB;
 Fri, 10 Jan 2020 05:37:43 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 682FA3F534;
 Fri, 10 Jan 2020 05:37:43 -0800 (PST)
Date: Fri, 10 Jan 2020 13:37:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8736cot4v2.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-8736cot4v2.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: add
	snd_soc_close_delayed_work()" to the asoc tree
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

   ASoC: soc-core: add snd_soc_close_delayed_work()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 83f94a2e293d617a98e077680ea00b2830a9ca22 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 10 Jan 2020 11:36:17 +0900
Subject: [PATCH] ASoC: soc-core: add snd_soc_close_delayed_work()

We need to setup rtd->close_delayed_work_func.
It will be set at snd_soc_dai_compress_new() or soc_new_pcm().
But these setups close_delayed_work() which is same name /
same implemantaion, but different local code.
To reduce duplicate code, this patch moves it as
snd_soc_close_delayed_work() and share same code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-By: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/8736cot4v2.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h      |  1 +
 sound/soc/soc-compress.c | 29 +----------------------------
 sound/soc/soc-core.c     | 28 ++++++++++++++++++++++++++++
 sound/soc/soc-pcm.c      | 28 +---------------------------
 4 files changed, 31 insertions(+), 55 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 0513f30a0209..f0e4f36f83bf 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1159,6 +1159,7 @@ struct snd_soc_pcm_runtime {
 #define for_each_rtd_codec_dai_rollback(rtd, i, dai)		\
 	for (; ((--i) >= 0) && ((dai) = rtd->codec_dais[i]);)
 
+void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd);
 
 /* mixer control */
 struct soc_mixer_control {
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 16fe08690cf5..72494717dde3 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -226,33 +226,6 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 	return ret;
 }
 
-/*
- * Power down the audio subsystem pmdown_time msecs after close is called.
- * This is to ensure there are no pops or clicks in between any music tracks
- * due to DAPM power cycling.
- */
-static void close_delayed_work(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_dai *codec_dai = rtd->codec_dai;
-
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
-
-	dev_dbg(rtd->dev,
-		"Compress ASoC: pop wq checking: %s status: %s waiting: %s\n",
-		codec_dai->driver->playback.stream_name,
-		codec_dai->playback_active ? "active" : "inactive",
-		rtd->pop_wait ? "yes" : "no");
-
-	/* are we waiting on this codec DAI stream */
-	if (rtd->pop_wait == 1) {
-		rtd->pop_wait = 0;
-		snd_soc_dapm_stream_event(rtd, SNDRV_PCM_STREAM_PLAYBACK,
-					  SND_SOC_DAPM_STREAM_STOP);
-	}
-
-	mutex_unlock(&rtd->card->pcm_mutex);
-}
-
 static int soc_compr_free(struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
@@ -941,7 +914,7 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 	}
 
 	/* DAPM dai link stream work */
-	rtd->close_delayed_work_func = close_delayed_work;
+	rtd->close_delayed_work_func = snd_soc_close_delayed_work;
 
 	rtd->compr = compr;
 	compr->private_data = rtd;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 3c729eaf0bbf..acf6f141fd2d 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -359,6 +359,34 @@ struct snd_soc_pcm_runtime
 }
 EXPORT_SYMBOL_GPL(snd_soc_get_pcm_runtime);
 
+/*
+ * Power down the audio subsystem pmdown_time msecs after close is called.
+ * This is to ensure there are no pops or clicks in between any music tracks
+ * due to DAPM power cycling.
+ */
+void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+
+	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
+
+	dev_dbg(rtd->dev,
+		"ASoC: pop wq checking: %s status: %s waiting: %s\n",
+		codec_dai->driver->playback.stream_name,
+		codec_dai->playback_active ? "active" : "inactive",
+		rtd->pop_wait ? "yes" : "no");
+
+	/* are we waiting on this codec DAI stream */
+	if (rtd->pop_wait == 1) {
+		rtd->pop_wait = 0;
+		snd_soc_dapm_stream_event(rtd, SNDRV_PCM_STREAM_PLAYBACK,
+					  SND_SOC_DAPM_STREAM_STOP);
+	}
+
+	mutex_unlock(&rtd->card->pcm_mutex);
+}
+EXPORT_SYMBOL_GPL(snd_soc_close_delayed_work);
+
 static void soc_release_rtd_dev(struct device *dev)
 {
 	/* "dev" means "rtd->dev" */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 68f72051f8e3..ad908e008b2f 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -624,32 +624,6 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	return ret;
 }
 
-/*
- * Power down the audio subsystem pmdown_time msecs after close is called.
- * This is to ensure there are no pops or clicks in between any music tracks
- * due to DAPM power cycling.
- */
-static void close_delayed_work(struct snd_soc_pcm_runtime *rtd)
-{
-	struct snd_soc_dai *codec_dai = rtd->codec_dais[0];
-
-	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
-
-	dev_dbg(rtd->dev, "ASoC: pop wq checking: %s status: %s waiting: %s\n",
-		 codec_dai->driver->playback.stream_name,
-		 codec_dai->playback_active ? "active" : "inactive",
-		 rtd->pop_wait ? "yes" : "no");
-
-	/* are we waiting on this codec DAI stream */
-	if (rtd->pop_wait == 1) {
-		rtd->pop_wait = 0;
-		snd_soc_dapm_stream_event(rtd, SNDRV_PCM_STREAM_PLAYBACK,
-					  SND_SOC_DAPM_STREAM_STOP);
-	}
-
-	mutex_unlock(&rtd->card->pcm_mutex);
-}
-
 static void codec2codec_close_delayed_work(struct snd_soc_pcm_runtime *rtd)
 {
 	/*
@@ -2956,7 +2930,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	if (rtd->dai_link->params)
 		rtd->close_delayed_work_func = codec2codec_close_delayed_work;
 	else
-		rtd->close_delayed_work_func = close_delayed_work;
+		rtd->close_delayed_work_func = snd_soc_close_delayed_work;
 
 	pcm->nonatomic = rtd->dai_link->nonatomic;
 	rtd->pcm = pcm;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
