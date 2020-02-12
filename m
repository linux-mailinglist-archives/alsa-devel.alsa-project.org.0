Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BF415B591
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 01:01:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4770F1661;
	Thu, 13 Feb 2020 01:00:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4770F1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581552089;
	bh=ec4ZjeqX05IzmtD0Xm13E7+AW4cyc26MefWzSoQcc/k=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=M25/T1usq/bCQD2phdIn/HBRx9DoNs1D+2y88Pec2HHILQ5Gz8vB+JOeX1rPZ0B8H
	 nB62hncmGO5Cxrd4qrTzAlobI2b6uhbkWEfwa6o6VohyVUYG7o25BUKxwMnWmtojAd
	 JRTkjt8nwOF4CgWSv0peYRIdgtbSG8NBtlh4blis=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5E67F80292;
	Thu, 13 Feb 2020 00:57:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C80E5F8028C; Thu, 13 Feb 2020 00:57:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 0784CF80228
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 00:57:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0784CF80228
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00D80113E;
 Wed, 12 Feb 2020 15:57:17 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76C613F68E;
 Wed, 12 Feb 2020 15:57:16 -0800 (PST)
Date: Wed, 12 Feb 2020 23:57:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871rr3cext.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-871rr3cext.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-pcm: tidyup soc_pcm_open() order"
	to the asoc tree
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

   ASoC: soc-pcm: tidyup soc_pcm_open() order

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

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

From 5d9fa03e6c3514266fa94851ab1b6dd6e0595a13 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 10 Feb 2020 12:14:45 +0900
Subject: [PATCH] ASoC: soc-pcm: tidyup soc_pcm_open() order

soc_pcm_open() operation order is not good.
At first, soc_pcm_open() operation order is

	1) CPU DAI startup
	2) Component open
	3) Codec DAI startup
	4) rtd startup

But here, 2) will call try_module_get() if component has
module_get_upon_open flags. This means 1) CPU DAI startup
will be operated *before* its module was loaded.
DAI should be called *after* Component.

Second, soc_pcm_close() operation order is
	1) CPU DAI shutdown
	2) Codec DAI shutdown
	3) rtd shutdown
	4) Component close

soc_pcm_open() and soc_pcm_close() are paired function,
but, its operation order is unbalance.
This patch tidyup soc_pcm_open() order to Component -> rtd -> DAI.
This is one of prepare for cleanup soc-pcm-open()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/871rr3cext.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 34 ++++++++++++++++------------------
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8aa775e0eb0d..6630fadd6e09 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -574,25 +574,32 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 
 	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card->pcm_subclass);
 
+	ret = soc_pcm_components_open(substream);
+	if (ret < 0)
+		goto component_err;
+
+	ret = soc_rtd_startup(rtd, substream);
+	if (ret < 0) {
+		pr_err("ASoC: %s startup failed: %d\n",
+		       rtd->dai_link->name, ret);
+		goto component_err;
+	}
+
 	/* startup the audio subsystem */
 	ret = snd_soc_dai_startup(cpu_dai, substream);
 	if (ret < 0) {
 		dev_err(cpu_dai->dev, "ASoC: can't open interface %s: %d\n",
 			cpu_dai->name, ret);
-		goto out;
+		goto cpu_dai_err;
 	}
 
-	ret = soc_pcm_components_open(substream);
-	if (ret < 0)
-		goto component_err;
-
 	for_each_rtd_codec_dai(rtd, i, codec_dai) {
 		ret = snd_soc_dai_startup(codec_dai, substream);
 		if (ret < 0) {
 			dev_err(codec_dai->dev,
 				"ASoC: can't open codec %s: %d\n",
 				codec_dai->name, ret);
-			goto codec_dai_err;
+			goto config_err;
 		}
 
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -601,13 +608,6 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 			codec_dai->rx_mask = 0;
 	}
 
-	ret = soc_rtd_startup(rtd, substream);
-	if (ret < 0) {
-		pr_err("ASoC: %s startup failed: %d\n",
-		       rtd->dai_link->name, ret);
-		goto codec_dai_err;
-	}
-
 	/* Dynamic PCM DAI links compat checks use dynamic capabilities */
 	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm)
 		goto dynamic;
@@ -672,17 +672,15 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	return 0;
 
 config_err:
-	soc_rtd_shutdown(rtd, substream);
-
-codec_dai_err:
 	for_each_rtd_codec_dai(rtd, i, codec_dai)
 		snd_soc_dai_shutdown(codec_dai, substream);
+cpu_dai_err:
+	snd_soc_dai_shutdown(cpu_dai, substream);
 
+	soc_rtd_shutdown(rtd, substream);
 component_err:
 	soc_pcm_components_close(substream);
 
-	snd_soc_dai_shutdown(cpu_dai, substream);
-out:
 	mutex_unlock(&rtd->card->pcm_mutex);
 
 	for_each_rtd_components(rtd, i, component) {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
