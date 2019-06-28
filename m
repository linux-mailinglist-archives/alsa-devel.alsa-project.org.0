Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B24BD5A270
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 19:31:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AA0B174B;
	Fri, 28 Jun 2019 19:31:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AA0B174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561743112;
	bh=A8icDG9Oawt7pUXRVsiI5Evnnv89SXI5j6q02Xc+V8I=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bvUZTDFSt7AEUCfdrxulvu9B9tqHwYVxy7DNAOUqyDmF2g9/2uXkY3zsCmr8qDMR1
	 qX0jtHy4AQhBm7hNpwa8TrO9nqMfsGGJl4PRJ5a1H7JogQHdec+NNu1gkQ4SHRbPON
	 9hegcHBxEe2Zvxy+cdK/4xF9DIxv5AfP19KQBCEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20D0FF89832;
	Fri, 28 Jun 2019 18:58:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB50BF80768; Fri, 28 Jun 2019 18:57:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C433F89758
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 18:56:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C433F89758
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ick8YSwu"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=9kUAjdy2iW6Uc+2HQD3Freg59GbE2w/VGxT6YCQv6To=; b=ick8YSwuhryY
 5UBEv9SG1hZuPf6yMSWnq94/a1Wi1LmaElRJNXqPrvTro+V9oaaky59JgmSTAk6XjFjsYK4DEKvDM
 mI+cAGLv8FVuhHmh/KdEa2lk8upP6cxQ4G0wsP2wgqB/P5Yikb7RUJ7/fQ5SavHin8uS+Dl29aVzb
 cyoK8=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hguAm-0007BX-NQ; Fri, 28 Jun 2019 16:56:28 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 26843440046; Fri, 28 Jun 2019 17:56:28 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20190627121350.21027-3-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190628165628.26843440046@finisterre.sirena.org.uk>
Date: Fri, 28 Jun 2019 17:56:28 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: soc-core: support dai_link with
	platforms_num != 1" to the asoc tree
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

   ASoC: soc-core: support dai_link with platforms_num != 1

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 34614739988ad60c3493da66dd856002ee93edf9 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 27 Jun 2019 14:13:50 +0200
Subject: [PATCH] ASoC: soc-core: support dai_link with platforms_num != 1

Add support platforms_num != 1 in dai_link. Initially, the main purpose of
this change was to make the platform optional in the dai_link, instead of
inserting the dummy platform driver.

This particular case had just been solved by Kuninori Morimoto with
commit 1d7689892878 ("ASoC: soc-core: allow no Platform on dai_link").

However, this change may still be useful for those who need multiple
platform components on a single dai_link (it solves one of the FIXME
note in soc-core)

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h  |  6 +++++
 sound/soc/soc-core.c | 59 ++++++++++++++++++--------------------------
 2 files changed, 30 insertions(+), 35 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 64405cdab8bb..4e8071269639 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -997,6 +997,12 @@ struct snd_soc_dai_link {
 	     ((i) < link->num_codecs) && ((codec) = &link->codecs[i]);	\
 	     (i)++)
 
+#define for_each_link_platforms(link, i, platform)			\
+	for ((i) = 0;							\
+	     ((i) < link->num_platforms) &&				\
+	     ((platform) = &link->platforms[i]);			\
+	     (i)++)
+
 /*
  * Sample 1 : Single CPU/Codec/Platform
  *
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b5f3c09311c3..b9061cd8d787 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -896,7 +896,7 @@ static int soc_bind_dai_link(struct snd_soc_card *card,
 	struct snd_soc_dai_link *dai_link)
 {
 	struct snd_soc_pcm_runtime *rtd;
-	struct snd_soc_dai_link_component *codecs;
+	struct snd_soc_dai_link_component *codec, *platform;
 	struct snd_soc_component *component;
 	int i;
 
@@ -926,13 +926,14 @@ static int soc_bind_dai_link(struct snd_soc_card *card,
 
 	/* Find CODEC from registered CODECs */
 	rtd->num_codecs = dai_link->num_codecs;
-	for_each_link_codecs(dai_link, i, codecs) {
-		rtd->codec_dais[i] = snd_soc_find_dai(codecs);
+	for_each_link_codecs(dai_link, i, codec) {
+		rtd->codec_dais[i] = snd_soc_find_dai(codec);
 		if (!rtd->codec_dais[i]) {
 			dev_info(card->dev, "ASoC: CODEC DAI %s not registered\n",
-				 codecs->dai_name);
+				 codec->dai_name);
 			goto _err_defer;
 		}
+
 		snd_soc_rtdcom_add(rtd, rtd->codec_dais[i]->component);
 	}
 
@@ -940,12 +941,13 @@ static int soc_bind_dai_link(struct snd_soc_card *card,
 	rtd->codec_dai = rtd->codec_dais[0];
 
 	/* Find PLATFORM from registered PLATFORMs */
-	for_each_component(component) {
-		if (!snd_soc_is_matching_component(dai_link->platforms,
-						   component))
-			continue;
+	for_each_link_platforms(dai_link, i, platform) {
+		for_each_component(component) {
+			if (!snd_soc_is_matching_component(platform, component))
+				continue;
 
-		snd_soc_rtdcom_add(rtd, component);
+			snd_soc_rtdcom_add(rtd, component);
+		}
 	}
 
 	soc_add_pcm_runtime(card, rtd);
@@ -1058,15 +1060,14 @@ static int soc_init_dai_link(struct snd_soc_card *card,
 			     struct snd_soc_dai_link *link)
 {
 	int i;
-	struct snd_soc_dai_link_component *codec;
+	struct snd_soc_dai_link_component *codec, *platform;
 
 	for_each_link_codecs(link, i, codec) {
 		/*
 		 * Codec must be specified by 1 of name or OF node,
 		 * not both or neither.
 		 */
-		if (!!codec->name ==
-		    !!codec->of_node) {
+		if (!!codec->name == !!codec->of_node) {
 			dev_err(card->dev, "ASoC: Neither/both codec name/of_node are set for %s\n",
 				link->name);
 			return -EINVAL;
@@ -1087,36 +1088,24 @@ static int soc_init_dai_link(struct snd_soc_card *card,
 			return -EPROBE_DEFER;
 	}
 
-	/*
-	 * Platform may be specified by either name or OF node,
-	 * or no Platform.
-	 *
-	 * FIXME
-	 *
-	 * We need multi-platform support
-	 */
-	if (link->num_platforms > 0) {
-
-		if (link->num_platforms > 1) {
-			dev_err(card->dev,
-				"ASoC: multi platform is not yet supported %s\n",
-				link->name);
-			return -EINVAL;
-		}
-
-		if (link->platforms->name && link->platforms->of_node) {
+	for_each_link_platforms(link, i, platform) {
+		/*
+		 * Platform may be specified by either name or OF node, but it
+		 * can be left unspecified, then no components will be inserted
+		 * in the rtdcom list
+		 */
+		if (!!platform->name == !!platform->of_node) {
 			dev_err(card->dev,
-				"ASoC: Both platform name/of_node are set for %s\n",
+				"ASoC: Neither/both platform name/of_node are set for %s\n",
 				link->name);
 			return -EINVAL;
 		}
 
 		/*
-		 * Defer card registartion if platform dai component is not
-		 * added to component list.
+		 * Defer card registration if platform component is not added to
+		 * component list.
 		 */
-		if ((link->platforms->of_node || link->platforms->name) &&
-		    !soc_find_component(link->platforms))
+		if (!soc_find_component(platform))
 			return -EPROBE_DEFER;
 	}
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
