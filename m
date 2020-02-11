Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0EA1593D2
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 16:51:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A233166F;
	Tue, 11 Feb 2020 16:51:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A233166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581436315;
	bh=7wbZzPXXduNsqLNMcbaP+1/XzpurbIbwRH8V3A0PlMY=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=XnSoqB2PkCm/HutrUCu0ZtiJqCZxNi+F4CHTcHIb8lCZO+VkRUSgFXgIDpWHpZkBF
	 7dFvogb39PE8/brpddz//eIn3sRbmKD92UHtqHDSaTC+pAE5XeBhAwFK2ZorOSkNcw
	 /1QxHkocDvI/sXxDfkHgZpdvut2IuTk2zHSNcA34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9557F8028C;
	Tue, 11 Feb 2020 16:48:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F829F80276; Tue, 11 Feb 2020 16:48:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 692A0F8013D
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 16:48:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 692A0F8013D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C33E431B;
 Tue, 11 Feb 2020 07:48:23 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 486833F68E;
 Tue, 11 Feb 2020 07:48:23 -0800 (PST)
Date: Tue, 11 Feb 2020 15:48:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875zgfcey5.wl-kuninori.morimoto.gx@renesas.com>
Message-Id: <applied-875zgfcey5.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-pcm: call
	snd_soc_dai_startup()/shutdown() once" to the asoc tree
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

   ASoC: soc-pcm: call snd_soc_dai_startup()/shutdown() once

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

From b56be800f1292c9b79c4f66571c701551bdf9e12 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Mon, 10 Feb 2020 12:14:33 +0900
Subject: [PATCH] ASoC: soc-pcm: call snd_soc_dai_startup()/shutdown() once

Current soc_pcm_open() calls snd_soc_dai_startup() under loop.
Thus, it needs to care about started/not-yet-started codec DAI.

But, if soc-dai.c is handling it, soc-pcm.c don't need to care
about it.
This patch adds started flag to soc-dai.h, and simplify soc-pcm.c.
This is one of prepare for cleanup soc-pcm-open()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/875zgfcey5.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-dai.h |  5 ++++-
 sound/soc/soc-dai.c     | 11 +++++++++--
 sound/soc/soc-pcm.c     |  7 ++-----
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index eaaeb00e9e84..04c23ac0dfff 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -324,7 +324,6 @@ struct snd_soc_dai {
 	/* DAI runtime info */
 	unsigned int capture_active;		/* stream usage count */
 	unsigned int playback_active;		/* stream usage count */
-	unsigned int probed:1;
 
 	unsigned int active;
 
@@ -348,6 +347,10 @@ struct snd_soc_dai {
 	unsigned int rx_mask;
 
 	struct list_head list;
+
+	/* bit field */
+	unsigned int probed:1;
+	unsigned int started:1;
 };
 
 static inline void *snd_soc_dai_get_dma_data(const struct snd_soc_dai *dai,
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 51031e330179..73a829393652 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -295,17 +295,24 @@ int snd_soc_dai_startup(struct snd_soc_dai *dai,
 {
 	int ret = 0;
 
-	if (dai->driver->ops->startup)
+	if (!dai->started &&
+	    dai->driver->ops->startup)
 		ret = dai->driver->ops->startup(substream, dai);
 
+	if (ret == 0)
+		dai->started = 1;
+
 	return ret;
 }
 
 void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
 			 struct snd_pcm_substream *substream)
 {
-	if (dai->driver->ops->shutdown)
+	if (dai->started &&
+	    dai->driver->ops->shutdown)
 		dai->driver->ops->shutdown(substream, dai);
+
+	dai->started = 0;
 }
 
 int snd_soc_dai_prepare(struct snd_soc_dai *dai,
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8d8ed4774e9c..d53afb96b05b 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -568,7 +568,7 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 	if (ret < 0) {
 		pr_err("ASoC: %s startup failed: %d\n",
 		       rtd->dai_link->name, ret);
-		goto machine_err;
+		goto codec_dai_err;
 	}
 
 	/* Dynamic PCM DAI links compat checks use dynamic capabilities */
@@ -637,11 +637,8 @@ static int soc_pcm_open(struct snd_pcm_substream *substream)
 config_err:
 	soc_rtd_shutdown(rtd, substream);
 
-machine_err:
-	i = rtd->num_codecs;
-
 codec_dai_err:
-	for_each_rtd_codec_dai_rollback(rtd, i, codec_dai)
+	for_each_rtd_codec_dai(rtd, i, codec_dai)
 		snd_soc_dai_shutdown(codec_dai, substream);
 
 component_err:
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
