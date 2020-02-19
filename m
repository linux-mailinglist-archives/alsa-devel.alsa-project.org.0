Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 894D1163853
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 01:15:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 281CE169A;
	Wed, 19 Feb 2020 01:14:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 281CE169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582071301;
	bh=FACvHDZwGkpR5N9oOMq9bAnv4yd9CypmEfNVpgHuS2c=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MlyCGLJND/dcWIZuMh9W8mvQwX8k+MvEAvZYqBc69jY5uZGyFtcRbnpu/VRB7s8Ik
	 TBkCiXH/GbNq7G/FYTCCcOyQf6drSbBx8H8QkbC+w4llf1RP4c4UhD+j4iLXgDXQpw
	 /RrJMc0Kqk5Zm/UaI+RK9jSzm8WAlqMZJRIy0/oI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0F8AF802A2;
	Wed, 19 Feb 2020 01:09:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41993F802A0; Wed, 19 Feb 2020 01:09:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C1915F80292
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:09:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1915F80292
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8D581FB;
 Tue, 18 Feb 2020 16:09:36 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DF743F68F;
 Tue, 18 Feb 2020 16:09:36 -0800 (PST)
Date: Wed, 19 Feb 2020 00:09:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-core: use for_each_pcm_streams() macro" to the
 asoc tree
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

   ASoC: soc-core: use for_each_pcm_streams() macro

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

From d74c2a156b710e9ad81193a60e037430f8894c0c Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 17 Feb 2020 17:28:25 +0900
Subject: [PATCH] ASoC: soc-core: use for_each_pcm_streams() macro

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/8736b9botk.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f0ae1a7d7e09..30c17fde14ca 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -432,6 +432,7 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	struct snd_soc_component *component;
 	struct device *dev;
 	int ret;
+	int stream;
 
 	/*
 	 * for rtd->dev
@@ -466,10 +467,10 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 
 	rtd->dev = dev;
 	INIT_LIST_HEAD(&rtd->list);
-	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].be_clients);
-	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].be_clients);
-	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].fe_clients);
-	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].fe_clients);
+	for_each_pcm_streams(stream) {
+		INIT_LIST_HEAD(&rtd->dpcm[stream].be_clients);
+		INIT_LIST_HEAD(&rtd->dpcm[stream].fe_clients);
+	}
 	dev_set_drvdata(dev, rtd);
 	INIT_DELAYED_WORK(&rtd->delayed_work, close_delayed_work);
 
@@ -559,17 +560,14 @@ int snd_soc_suspend(struct device *dev)
 	snd_soc_flush_all_delayed_work(card);
 
 	for_each_card_rtds(card, rtd) {
+		int stream;
 
 		if (rtd->dai_link->ignore_suspend)
 			continue;
 
-		snd_soc_dapm_stream_event(rtd,
-					  SNDRV_PCM_STREAM_PLAYBACK,
-					  SND_SOC_DAPM_STREAM_SUSPEND);
-
-		snd_soc_dapm_stream_event(rtd,
-					  SNDRV_PCM_STREAM_CAPTURE,
-					  SND_SOC_DAPM_STREAM_SUSPEND);
+		for_each_pcm_streams(stream)
+			snd_soc_dapm_stream_event(rtd, stream,
+						  SND_SOC_DAPM_STREAM_SUSPEND);
 	}
 
 	/* Recheck all endpoints too, their state is affected by suspend */
@@ -665,17 +663,14 @@ static void soc_resume_deferred(struct work_struct *work)
 	}
 
 	for_each_card_rtds(card, rtd) {
+		int stream;
 
 		if (rtd->dai_link->ignore_suspend)
 			continue;
 
-		snd_soc_dapm_stream_event(rtd,
-					  SNDRV_PCM_STREAM_PLAYBACK,
-					  SND_SOC_DAPM_STREAM_RESUME);
-
-		snd_soc_dapm_stream_event(rtd,
-					  SNDRV_PCM_STREAM_CAPTURE,
-					  SND_SOC_DAPM_STREAM_RESUME);
+		for_each_pcm_streams(stream)
+			snd_soc_dapm_stream_event(rtd, stream,
+						  SND_SOC_DAPM_STREAM_RESUME);
 	}
 
 	/* unmute any active DACs */
-- 
2.20.1

