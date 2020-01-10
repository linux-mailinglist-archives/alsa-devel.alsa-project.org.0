Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E077A136E42
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jan 2020 14:40:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C4ED171F;
	Fri, 10 Jan 2020 14:39:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C4ED171F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578663618;
	bh=sOHOOE49vzf2e93wRTj9QZgdTEb5tFcUyWEW4LN2u8c=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MhkZF/ezFBvvS6jtQDN/DhpZCD9wB0gbvOwCBXDKXmQdWQ7qnV4ECIeRS73e2OXY2
	 zclki5mYC/N+rNc+BRu9xSZMS2zgP0d+KHjO2zg32rIihqn8Ln8swGGFT3AwZaG3M7
	 WQVjDYtw+mieO3akVTxeElFBR45Cchvi8QVi+uu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86A52F801EB;
	Fri, 10 Jan 2020 14:37:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68BC0F80130; Fri, 10 Jan 2020 14:37:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 2EB93F800E4
 for <alsa-devel@alsa-project.org>; Fri, 10 Jan 2020 14:37:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EB93F800E4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99B65DA7;
 Fri, 10 Jan 2020 05:37:41 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 243583F534;
 Fri, 10 Jan 2020 05:37:41 -0800 (PST)
Date: Fri, 10 Jan 2020 13:37:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871rs8t4uw.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-871rs8t4uw.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-dapm: add
	snd_soc_dapm_stream_stop()" to the asoc tree
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

   ASoC: soc-dapm: add snd_soc_dapm_stream_stop()

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

From 3f4cf797939cb3ccdb6f989da53f1899d30432dc Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 10 Jan 2020 11:36:23 +0900
Subject: [PATCH] ASoC: soc-dapm: add snd_soc_dapm_stream_stop()

When we stop stream, if it was Playback, we might need to care
about power down time. In such case, we need to use delayed work.

We have same implementation for it at soc-pcm.c and soc-compress.c,
but we don't want to have duplicate code.
This patch adds snd_soc_dapm_stream_stop(), and share same code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-By: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/871rs8t4uw.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dapm.h |  1 +
 sound/soc/soc-compress.c | 18 +-----------------
 sound/soc/soc-dapm.c     | 23 +++++++++++++++++++++++
 sound/soc/soc-pcm.c      | 19 +------------------
 4 files changed, 26 insertions(+), 35 deletions(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index 6e8a31225383..1b6afbc1a4ed 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -434,6 +434,7 @@ void snd_soc_dapm_reset_cache(struct snd_soc_dapm_context *dapm);
 /* dapm events */
 void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream,
 	int event);
+void snd_soc_dapm_stream_stop(struct snd_soc_pcm_runtime *rtd, int stream);
 void snd_soc_dapm_shutdown(struct snd_soc_card *card);
 
 /* external DAPM widget events */
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 72494717dde3..392a1c5b15d3 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -259,23 +259,7 @@ static int soc_compr_free(struct snd_compr_stream *cstream)
 	if (cpu_dai->driver->cops && cpu_dai->driver->cops->shutdown)
 		cpu_dai->driver->cops->shutdown(cstream, cpu_dai);
 
-	if (cstream->direction == SND_COMPRESS_PLAYBACK) {
-		if (snd_soc_runtime_ignore_pmdown_time(rtd)) {
-			snd_soc_dapm_stream_event(rtd,
-						  SNDRV_PCM_STREAM_PLAYBACK,
-						  SND_SOC_DAPM_STREAM_STOP);
-		} else {
-			rtd->pop_wait = 1;
-			queue_delayed_work(system_power_efficient_wq,
-					   &rtd->delayed_work,
-					   msecs_to_jiffies(rtd->pmdown_time));
-		}
-	} else {
-		/* capture streams can be powered down now */
-		snd_soc_dapm_stream_event(rtd,
-					  SNDRV_PCM_STREAM_CAPTURE,
-					  SND_SOC_DAPM_STREAM_STOP);
-	}
+	snd_soc_dapm_stream_stop(rtd, stream);
 
 	mutex_unlock(&rtd->card->pcm_mutex);
 
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b6378f025836..442846f12cd4 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4447,6 +4447,29 @@ void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream,
 	mutex_unlock(&card->dapm_mutex);
 }
 
+void snd_soc_dapm_stream_stop(struct snd_soc_pcm_runtime *rtd, int stream)
+{
+	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_soc_runtime_ignore_pmdown_time(rtd)) {
+			/* powered down playback stream now */
+			snd_soc_dapm_stream_event(rtd,
+						  SNDRV_PCM_STREAM_PLAYBACK,
+						  SND_SOC_DAPM_STREAM_STOP);
+		} else {
+			/* start delayed pop wq here for playback streams */
+			rtd->pop_wait = 1;
+			queue_delayed_work(system_power_efficient_wq,
+					   &rtd->delayed_work,
+					   msecs_to_jiffies(rtd->pmdown_time));
+		}
+	} else {
+		/* capture streams can be powered down now */
+		snd_soc_dapm_stream_event(rtd, SNDRV_PCM_STREAM_CAPTURE,
+					  SND_SOC_DAPM_STREAM_STOP);
+	}
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_stream_stop);
+
 /**
  * snd_soc_dapm_enable_pin_unlocked - enable pin.
  * @dapm: DAPM context
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index ad908e008b2f..dfff2ddb469a 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -672,24 +672,7 @@ static int soc_pcm_close(struct snd_pcm_substream *substream)
 
 	soc_pcm_components_close(substream, NULL);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		if (snd_soc_runtime_ignore_pmdown_time(rtd)) {
-			/* powered down playback stream now */
-			snd_soc_dapm_stream_event(rtd,
-						  SNDRV_PCM_STREAM_PLAYBACK,
-						  SND_SOC_DAPM_STREAM_STOP);
-		} else {
-			/* start delayed pop wq here for playback streams */
-			rtd->pop_wait = 1;
-			queue_delayed_work(system_power_efficient_wq,
-					   &rtd->delayed_work,
-					   msecs_to_jiffies(rtd->pmdown_time));
-		}
-	} else {
-		/* capture streams can be powered down now */
-		snd_soc_dapm_stream_event(rtd, SNDRV_PCM_STREAM_CAPTURE,
-					  SND_SOC_DAPM_STREAM_STOP);
-	}
+	snd_soc_dapm_stream_stop(rtd, substream->stream);
 
 	mutex_unlock(&rtd->card->pcm_mutex);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
