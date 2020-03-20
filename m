Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA90C18D9B4
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 21:50:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87D0683B;
	Fri, 20 Mar 2020 21:49:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87D0683B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584737402;
	bh=ikSeV2xvfyVmKvdPWJQ233qgO+7pliO/Nkz8CyGRAuQ=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=jOWPa9WCPasZpIYQrKRuOUqmqkMBcAXZdWCUxQKyvK6NioV8XrgnfIHyq9ybGHBq5
	 t75/chu3GOGNr5UsjxKzKGT0oyBT+JHTmMe5rSo4DrdAQZCpOA1XCaySiGcqDZDPgt
	 fPAV9wDfzyLpX5N0Q8U45JtgwpbKPjvhqJLMy1aQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A68EFF802C2;
	Fri, 20 Mar 2020 21:46:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70F0EF802A8; Fri, 20 Mar 2020 21:46:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id ACA4EF80292
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 21:46:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACA4EF80292
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 123F731B;
 Fri, 20 Mar 2020 13:46:01 -0700 (PDT)
Received: from localhost (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEA583F792;
 Fri, 20 Mar 2020 13:46:00 -0700 (PDT)
Date: Fri, 20 Mar 2020 20:45:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Applied "ASoC: soc-core: Merge CPU/Codec DAIs" to the asoc tree
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

   ASoC: soc-core: Merge CPU/Codec DAIs

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

From 22a2fc81658b3eebcfcc110de97bcbd32f5ee301 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 16 Mar 2020 15:36:58 +0900
Subject: [PATCH] ASoC: soc-core: Merge CPU/Codec DAIs

ALSA SoC is currently categorizing CPU/Codec DAIs,
and it works well.

But modern devices require more complex connections,
for example Codec to Codec, etc, and future devices will
enable to more complex connections.
Because of these background, CPU/Codec DAIs categorizing is
no longer good much to modern device.

Currently, rtd has both CPU/Codec DAIs pointer.

	rtd->cpu_dais   = [][][][][][][][][]
	rtd->codec_dais = [][][][][][][][][]

This patch merges these into DAIs pointer.

	rtd->dais = [][][][][][][][][][][][][][][][][][]
	            ^cpu_dais         ^codec_dais
	            |--- num_cpus ---|--- num_codecs --|

Then, we can merge for_each_rtd_cpu/codec_dais() from this patch.

-	for_each_rtd_cpu_dais() {
-		...
-	}
-	for_each_rtd_codec_dais() {
-		...
-	}
+	for_each_rtd_dais() {
+		...
+	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/87wo7kolfa.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h  |  7 ++++++-
 sound/soc/soc-core.c | 18 +++++++++---------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index d97c4aa779a2..539211bd0f94 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1145,6 +1145,7 @@ struct snd_soc_pcm_runtime {
 	struct snd_compr *compr;
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai **dais;
 
 	struct snd_soc_dai **codec_dais;
 	unsigned int num_codecs;
@@ -1184,7 +1185,11 @@ struct snd_soc_pcm_runtime {
 	     (i)++)
 #define for_each_rtd_codec_dais_rollback(rtd, i, dai)		\
 	for (; (--(i) >= 0) && ((dai) = rtd->codec_dais[i]);)
-
+#define for_each_rtd_dais(rtd, i, dai)					\
+	for ((i) = 0;							\
+	     ((i) < (rtd)->num_cpus + (rtd)->num_codecs) &&		\
+		     ((dai) = (rtd)->dais[i]);				\
+	     (i)++)
 
 void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd);
 
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e7e70b47590a..0fd582c19c03 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -475,22 +475,22 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	INIT_DELAYED_WORK(&rtd->delayed_work, close_delayed_work);
 
 	/*
-	 * for rtd->codec_dais
+	 * for rtd->dais
 	 */
-	rtd->codec_dais = devm_kcalloc(dev, dai_link->num_codecs,
+	rtd->dais = devm_kcalloc(dev, dai_link->num_cpus + dai_link->num_codecs,
 					sizeof(struct snd_soc_dai *),
 					GFP_KERNEL);
-	if (!rtd->codec_dais)
+	if (!rtd->dais)
 		goto free_rtd;
 
 	/*
-	 * for rtd->cpu_dais
+	 * dais = [][][][][][][][][][][][][][][][][][]
+	 *	  ^cpu_dais         ^codec_dais
+	 *	  |--- num_cpus ---|--- num_codecs --|
 	 */
-	rtd->cpu_dais = devm_kcalloc(dev, dai_link->num_cpus,
-				     sizeof(struct snd_soc_dai *),
-				     GFP_KERNEL);
-	if (!rtd->cpu_dais)
-		goto free_rtd;
+	rtd->cpu_dais	= &rtd->dais[0];
+	rtd->codec_dais	= &rtd->dais[dai_link->num_cpus];
+
 	/*
 	 * rtd remaining settings
 	 */
-- 
2.20.1

