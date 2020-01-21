Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F198214434D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 18:33:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 936461668;
	Tue, 21 Jan 2020 18:32:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 936461668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579627981;
	bh=PbFIdhiNHsUB1UV6w0mP1Nm6HUSoJPMcw+x3yIUb0CA=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=lZYZaSKhRrwDAnhe03srJcBeN+i1opMq6Ud8kKnzgXansJumRqymYcQ9cQHG0eXkX
	 xI9ltVtXZApCdFaq9IPeJ26/wanKxMR1gZzn7UmOTLzwfSUUDGLk/SnMcmCJEtH9lN
	 wiCoEH+vJy0/4+O41SQBRLqa2TOZzW+vCzOe/Ngs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE609F802A0;
	Tue, 21 Jan 2020 18:28:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55FF9F802A2; Tue, 21 Jan 2020 18:28:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 52FB4F8028B
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 18:28:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52FB4F8028B
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BC2930E;
 Tue, 21 Jan 2020 09:28:19 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FA133F6C4;
 Tue, 21 Jan 2020 09:28:18 -0800 (PST)
Date: Tue, 21 Jan 2020 17:28:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r1zvx7i8.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-87r1zvx7i8.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: remove DAI suspend/resume" to
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

   ASoC: soc-core: remove DAI suspend/resume

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

From 450312b640f9c6caeeaf4bd8d4130f86ea27f456 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 20 Jan 2020 10:05:03 +0900
Subject: [PATCH] ASoC: soc-core: remove DAI suspend/resume

Historically, CPU and Codec were implemented different, but now it is
merged as Component.
ALSA SoC is supporting suspend/resume at DAI and Component level.
The method is like below.

	1) Suspend/Resume all CPU DAI if bus-control was 0
	2) Suspend/Resume all Component
	3) Suspend/Resume all CPU DAI if bus-control was 1

Historically 2) was Codec special operation.
Because CPU and Codec were merged into Component,
CPU   suspend/resume has 3 chance to suspend(= 1/2/3), but
Codec suspend/resume has 1 chance (= 2).

Here, DAI side suspend/resume is caring bus-control, but no driver
which is supporting suspend/resume is setting bus-control.
This means 3) was never used.

Here, used parameter for suspend/resume component->dev and dai->dev are
same pointer.
For that reason, we can merge DAI and Component suspend/resume.
One note is that we should use 2), because it is caring BIAS level.

This patch removes 1) and 3).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87r1zvx7i8.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dai.h |  2 --
 sound/soc/soc-core.c    | 41 -----------------------------------------
 sound/soc/soc-dai.c     | 12 ------------
 3 files changed, 55 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 939c73db6a03..2ccecf3e03d5 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -286,8 +286,6 @@ struct snd_soc_dai_driver {
 	/* DAI driver callbacks */
 	int (*probe)(struct snd_soc_dai *dai);
 	int (*remove)(struct snd_soc_dai *dai);
-	int (*suspend)(struct snd_soc_dai *dai);
-	int (*resume)(struct snd_soc_dai *dai);
 	/* compress dai */
 	int (*compress_new)(struct snd_soc_pcm_runtime *rtd, int num);
 	/* Optional Callback used at pcm creation*/
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index acf6f141fd2d..b0ec3233125a 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -558,16 +558,6 @@ int snd_soc_suspend(struct device *dev)
 	if (card->suspend_pre)
 		card->suspend_pre(card);
 
-	for_each_card_rtds(card, rtd) {
-		struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-
-		if (rtd->dai_link->ignore_suspend)
-			continue;
-
-		if (!cpu_dai->driver->bus_control)
-			snd_soc_dai_suspend(cpu_dai);
-	}
-
 	/* close any waiting streams */
 	snd_soc_flush_all_delayed_work(card);
 
@@ -639,16 +629,6 @@ int snd_soc_suspend(struct device *dev)
 		}
 	}
 
-	for_each_card_rtds(card, rtd) {
-		struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-
-		if (rtd->dai_link->ignore_suspend)
-			continue;
-
-		if (cpu_dai->driver->bus_control)
-			snd_soc_dai_suspend(cpu_dai);
-	}
-
 	if (card->suspend_post)
 		card->suspend_post(card);
 
@@ -682,17 +662,6 @@ static void soc_resume_deferred(struct work_struct *work)
 	if (card->resume_pre)
 		card->resume_pre(card);
 
-	/* resume control bus DAIs */
-	for_each_card_rtds(card, rtd) {
-		struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-
-		if (rtd->dai_link->ignore_suspend)
-			continue;
-
-		if (cpu_dai->driver->bus_control)
-			snd_soc_dai_resume(cpu_dai);
-	}
-
 	for_each_card_components(card, component) {
 		if (snd_soc_component_is_suspended(component))
 			snd_soc_component_resume(component);
@@ -726,16 +695,6 @@ static void soc_resume_deferred(struct work_struct *work)
 		}
 	}
 
-	for_each_card_rtds(card, rtd) {
-		struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
-
-		if (rtd->dai_link->ignore_suspend)
-			continue;
-
-		if (!cpu_dai->driver->bus_control)
-			snd_soc_dai_resume(cpu_dai);
-	}
-
 	if (card->resume_post)
 		card->resume_post(card);
 
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 1c7f63871c1d..51031e330179 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -354,18 +354,6 @@ snd_pcm_sframes_t snd_soc_dai_delay(struct snd_soc_dai *dai,
 	return delay;
 }
 
-void snd_soc_dai_suspend(struct snd_soc_dai *dai)
-{
-	if (dai->driver->suspend)
-		dai->driver->suspend(dai);
-}
-
-void snd_soc_dai_resume(struct snd_soc_dai *dai)
-{
-	if (dai->driver->resume)
-		dai->driver->resume(dai);
-}
-
 int snd_soc_dai_probe(struct snd_soc_dai *dai)
 {
 	if (dai->driver->probe)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
