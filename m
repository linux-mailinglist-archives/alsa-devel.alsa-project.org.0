Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B83F0ADB
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 01:05:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5A061718;
	Wed,  6 Nov 2019 01:04:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5A061718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572998719;
	bh=PI+2ZJBQ4u5AHvREU8ZUUZNA+QZ7uNvLoxgwFeLMSYg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ciGMp+/cvaZ4pmKVX0B/TAxzZ0Kdrz1zMaSC6xEAJQZNqFapc2tGkSQovf3YMCMy2
	 AtAc1Fisr/IN6yZUaUk39ThcCnJnq6B7KF+XvWwh23tvuNd5wyHjnhdPepdZTlNN8B
	 O8mdjnrNYwZ+j+jzmOxsAH0xzB9cOFc5CBGqLDG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE4FFF80771;
	Wed,  6 Nov 2019 00:51:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB1F4F8065C; Wed,  6 Nov 2019 00:51:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1290EF800F3
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 00:51:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1290EF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="gk2yCF/X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=o+v8fmTjaOhfADf73zQKqNqvkvxk7KIezHQjnkd5Slc=; b=gk2yCF/XrbNc
 NWyQ8QHx7XwvCJf1FcFfMY4UILjs+ur9BjvcgerkBZAWytQ5iLEjCINUhy0pjNezNeHdB+uKGOoWn
 B5bWo/kqqhde73M2hn6kNZ/Tl2QNAqJN4+5zSoaNgD2UR+AzIi/nJprLoY+oAC1YNPA4eHPObsZ+n
 TvBWM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iS8bc-00082U-M4; Tue, 05 Nov 2019 23:51:24 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2C63C274301E; Tue,  5 Nov 2019 23:51:24 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eeym3joq.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191105235124.2C63C274301E@ypsilon.sirena.org.uk>
Date: Tue,  5 Nov 2019 23:51:24 +0000 (GMT)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: soc-core: move soc_init_dai_link()" to
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

   ASoC: soc-core: move soc_init_dai_link()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 36794902de1fe6f46f8aa5e0d6a8d9884eecae1d Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Tue, 5 Nov 2019 15:45:41 +0900
Subject: [PATCH] ASoC: soc-core: move soc_init_dai_link()

This patch moves soc_init_dai_link() next to soc_bind_dai_link().
This is prepare for soc_bind_dai_link() cleanup.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/87eeym3joq.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 192 +++++++++++++++++++++----------------------
 1 file changed, 96 insertions(+), 96 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b07ecfac39d7..a141828f8638 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -941,6 +941,102 @@ static bool soc_is_dai_link_bound(struct snd_soc_card *card,
 	return false;
 }
 
+static int soc_init_dai_link(struct snd_soc_card *card,
+			     struct snd_soc_dai_link *link)
+{
+	int i;
+	struct snd_soc_dai_link_component *codec, *platform;
+
+	for_each_link_codecs(link, i, codec) {
+		/*
+		 * Codec must be specified by 1 of name or OF node,
+		 * not both or neither.
+		 */
+		if (!!codec->name == !!codec->of_node) {
+			dev_err(card->dev, "ASoC: Neither/both codec name/of_node are set for %s\n",
+				link->name);
+			return -EINVAL;
+		}
+
+		/* Codec DAI name must be specified */
+		if (!codec->dai_name) {
+			dev_err(card->dev, "ASoC: codec_dai_name not set for %s\n",
+				link->name);
+			return -EINVAL;
+		}
+
+		/*
+		 * Defer card registration if codec component is not added to
+		 * component list.
+		 */
+		if (!soc_find_component(codec))
+			return -EPROBE_DEFER;
+	}
+
+	for_each_link_platforms(link, i, platform) {
+		/*
+		 * Platform may be specified by either name or OF node, but it
+		 * can be left unspecified, then no components will be inserted
+		 * in the rtdcom list
+		 */
+		if (!!platform->name == !!platform->of_node) {
+			dev_err(card->dev,
+				"ASoC: Neither/both platform name/of_node are set for %s\n",
+				link->name);
+			return -EINVAL;
+		}
+
+		/*
+		 * Defer card registration if platform component is not added to
+		 * component list.
+		 */
+		if (!soc_find_component(platform))
+			return -EPROBE_DEFER;
+	}
+
+	/* FIXME */
+	if (link->num_cpus > 1) {
+		dev_err(card->dev,
+			"ASoC: multi cpu is not yet supported %s\n",
+			link->name);
+		return -EINVAL;
+	}
+
+	/*
+	 * CPU device may be specified by either name or OF node, but
+	 * can be left unspecified, and will be matched based on DAI
+	 * name alone..
+	 */
+	if (link->cpus->name && link->cpus->of_node) {
+		dev_err(card->dev,
+			"ASoC: Neither/both cpu name/of_node are set for %s\n",
+			link->name);
+		return -EINVAL;
+	}
+
+	/*
+	 * Defer card registartion if cpu dai component is not added to
+	 * component list.
+	 */
+	if ((link->cpus->of_node || link->cpus->name) &&
+	    !soc_find_component(link->cpus))
+		return -EPROBE_DEFER;
+
+	/*
+	 * At least one of CPU DAI name or CPU device name/node must be
+	 * specified
+	 */
+	if (!link->cpus->dai_name &&
+	    !(link->cpus->name || link->cpus->of_node)) {
+		dev_err(card->dev,
+			"ASoC: Neither cpu_dai_name nor cpu_name/of_node are set for %s\n",
+			link->name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int soc_bind_dai_link(struct snd_soc_card *card,
 	struct snd_soc_dai_link *dai_link)
 {
@@ -1283,102 +1379,6 @@ static int soc_probe_link_components(struct snd_soc_card *card)
 	return 0;
 }
 
-static int soc_init_dai_link(struct snd_soc_card *card,
-			     struct snd_soc_dai_link *link)
-{
-	int i;
-	struct snd_soc_dai_link_component *codec, *platform;
-
-	for_each_link_codecs(link, i, codec) {
-		/*
-		 * Codec must be specified by 1 of name or OF node,
-		 * not both or neither.
-		 */
-		if (!!codec->name == !!codec->of_node) {
-			dev_err(card->dev, "ASoC: Neither/both codec name/of_node are set for %s\n",
-				link->name);
-			return -EINVAL;
-		}
-
-		/* Codec DAI name must be specified */
-		if (!codec->dai_name) {
-			dev_err(card->dev, "ASoC: codec_dai_name not set for %s\n",
-				link->name);
-			return -EINVAL;
-		}
-
-		/*
-		 * Defer card registration if codec component is not added to
-		 * component list.
-		 */
-		if (!soc_find_component(codec))
-			return -EPROBE_DEFER;
-	}
-
-	for_each_link_platforms(link, i, platform) {
-		/*
-		 * Platform may be specified by either name or OF node, but it
-		 * can be left unspecified, then no components will be inserted
-		 * in the rtdcom list
-		 */
-		if (!!platform->name == !!platform->of_node) {
-			dev_err(card->dev,
-				"ASoC: Neither/both platform name/of_node are set for %s\n",
-				link->name);
-			return -EINVAL;
-		}
-
-		/*
-		 * Defer card registration if platform component is not added to
-		 * component list.
-		 */
-		if (!soc_find_component(platform))
-			return -EPROBE_DEFER;
-	}
-
-	/* FIXME */
-	if (link->num_cpus > 1) {
-		dev_err(card->dev,
-			"ASoC: multi cpu is not yet supported %s\n",
-			link->name);
-		return -EINVAL;
-	}
-
-	/*
-	 * CPU device may be specified by either name or OF node, but
-	 * can be left unspecified, and will be matched based on DAI
-	 * name alone..
-	 */
-	if (link->cpus->name && link->cpus->of_node) {
-		dev_err(card->dev,
-			"ASoC: Neither/both cpu name/of_node are set for %s\n",
-			link->name);
-		return -EINVAL;
-	}
-
-	/*
-	 * Defer card registartion if cpu dai component is not added to
-	 * component list.
-	 */
-	if ((link->cpus->of_node || link->cpus->name) &&
-	    !soc_find_component(link->cpus))
-		return -EPROBE_DEFER;
-
-	/*
-	 * At least one of CPU DAI name or CPU device name/node must be
-	 * specified
-	 */
-	if (!link->cpus->dai_name &&
-	    !(link->cpus->name || link->cpus->of_node)) {
-		dev_err(card->dev,
-			"ASoC: Neither cpu_dai_name nor cpu_name/of_node are set for %s\n",
-			link->name);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 void snd_soc_disconnect_sync(struct device *dev)
 {
 	struct snd_soc_component *component =
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
