Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 926DF37F88
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 23:27:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2089C1616;
	Thu,  6 Jun 2019 23:27:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2089C1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559856470;
	bh=EVOJwoLBmiolFsj//WcjJ9RkF8BbRRBknI0nrqSQy/A=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UciJa++pM7xcOmBr6QICtd0ImAy1HM85MgIYdY0s0fg3fDKiShL/EcTnBMrD45i0G
	 q89LJT+xo/G4ag0xXHTHNQzP/OzMwl3y02a7rw8CgAG47xJuYtBfvTy0nKMZW6gRTy
	 a5+D2z1HQK3IDgCfMOh+3db1ZRymJ+/aSOhyHSNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 039B5F89736;
	Thu,  6 Jun 2019 23:26:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51AD0F8972F; Thu,  6 Jun 2019 23:26:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 851DEF896EF
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:25:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 851DEF896EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="JaVoWt3Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=7fBkNzyXHSNQAZ9FKeBDsY15GQV2aIxBplaPTbK3a+c=; b=JaVoWt3Qv9Ud
 pfOzscXFgtdvU3TF+lMgwoXGIfhLanzeqjssKSfGLPGLJUwOtsMfr453zXb/kos4MRcHaOk1aOg6Y
 cRbho89tARnOVYNnXjnnj+1VaUCLc2iprmwg9o22X/HF3PMUFpsYMLCtlrvmFnD0KkUZdeEfpaJez
 zz/2A=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYztU-0007Gt-TA; Thu, 06 Jun 2019 21:25:56 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 19376440046; Thu,  6 Jun 2019 22:25:56 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfyfe4r3.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212556.19376440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:25:56 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: remove legacy style dai_link"
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

   ASoC: soc-core: remove legacy style dai_link

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

From adb76b5b9c4740a11f6ad6c68764515961ae8ade Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:22:19 +0900
Subject: [PATCH] ASoC: soc-core: remove legacy style dai_link

All drivers switched to modern style dai_link
(= struct snd_soc_dai_link_component).
Let's remove legacy style dai_link.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc.h  |  65 ++---------------
 sound/soc/soc-core.c | 165 ++-----------------------------------------
 2 files changed, 12 insertions(+), 218 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 0fa79b8330d7..055e6d035e04 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -900,17 +900,6 @@ struct snd_soc_dai_link {
 	const char *name;			/* Codec name */
 	const char *stream_name;		/* Stream name */
 
-	/*
-	 *	cpu_name
-	 *	cpu_of_node
-	 *	cpu_dai_name
-	 *
-	 * These are legacy style, and will be replaced to
-	 * modern style (= snd_soc_dai_link_component) in the future,
-	 * but, not yet supported so far.
-	 * If modern style was supported for CPU, all driver will switch
-	 * to use it, and, legacy style code will be removed from ALSA SoC.
-	 */
 	/*
 	 * You MAY specify the link's CPU-side device, either by device name,
 	 * or by DT/OF node, but not both. If this information is omitted,
@@ -918,60 +907,27 @@ struct snd_soc_dai_link {
 	 * must be globally unique. These fields are currently typically used
 	 * only for codec to codec links, or systems using device tree.
 	 */
-	const char *cpu_name;
-	struct device_node *cpu_of_node;
 	/*
 	 * You MAY specify the DAI name of the CPU DAI. If this information is
 	 * omitted, the CPU-side DAI is matched using .cpu_name/.cpu_of_node
 	 * only, which only works well when that device exposes a single DAI.
 	 */
-	const char *cpu_dai_name;
-
 	struct snd_soc_dai_link_component *cpus;
 	unsigned int num_cpus;
 
-	/*
-	 *	codec_name
-	 *	codec_of_node
-	 *	codec_dai_name
-	 *
-	 * These are legacy style, it will be converted to modern style
-	 * (= snd_soc_dai_link_component) automatically in soc-core
-	 * if driver is using legacy style.
-	 * Driver shouldn't use both legacy and modern style in the same time.
-	 * If modern style was supported for CPU, all driver will switch
-	 * to use it, and, legacy style code will be removed from ALSA SoC.
-	 */
 	/*
 	 * You MUST specify the link's codec, either by device name, or by
 	 * DT/OF node, but not both.
 	 */
-	const char *codec_name;
-	struct device_node *codec_of_node;
 	/* You MUST specify the DAI name within the codec */
-	const char *codec_dai_name;
-
 	struct snd_soc_dai_link_component *codecs;
 	unsigned int num_codecs;
 
-	/*
-	 *	platform_name
-	 *	platform_of_node
-	 *
-	 * These are legacy style, it will be converted to modern style
-	 * (= snd_soc_dai_link_component) automatically in soc-core
-	 * if driver is using legacy style.
-	 * Driver shouldn't use both legacy and modern style in the same time.
-	 * If modern style was supported for CPU, all driver will switch
-	 * to use it, and, legacy style code will be removed from ALSA SoC.
-	 */
 	/*
 	 * You MAY specify the link's platform/PCM/DMA driver, either by
 	 * device name, or by DT/OF node, but not both. Some forms of link
 	 * do not need a platform.
 	 */
-	const char *platform_name;
-	struct device_node *platform_of_node;
 	struct snd_soc_dai_link_component *platforms;
 	unsigned int num_platforms;
 
@@ -1033,13 +989,6 @@ struct snd_soc_dai_link {
 	/* Do not create a PCM for this DAI link (Backend link) */
 	unsigned int ignore:1;
 
-	/*
-	 * This driver uses legacy platform naming. Set by the core, machine
-	 * drivers should not modify this value.
-	 */
-	unsigned int legacy_platform:1;
-	unsigned int legacy_cpu:1;
-
 	struct list_head list; /* DAI link list of the soc card */
 	struct snd_soc_dobj dobj; /* For topology */
 };
@@ -1699,15 +1648,11 @@ int snd_soc_fixup_dai_links_platform_name(struct snd_soc_card *card,
 		if (!name)
 			return -ENOMEM;
 
-		if (dai_link->platforms)
-			/* only single platform is supported for now */
-			dai_link->platforms->name = name;
-		else
-			/*
-			 * legacy mode, this case will be removed when all
-			 * derivers are switched to modern style dai_link.
-			 */
-			dai_link->platform_name = name;
+		if (!dai_link->platforms)
+			return -EINVAL;
+
+		/* only single platform is supported for now */
+		dai_link->platforms->name = name;
 	}
 
 	return 0;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 9bd6b08d79b5..f8426c8120b2 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1053,167 +1053,18 @@ static void soc_remove_dai_links(struct snd_soc_card *card)
 	}
 }
 
-static int snd_soc_init_cpu(struct snd_soc_card *card,
-			    struct snd_soc_dai_link *dai_link)
-{
-	struct snd_soc_dai_link_component *cpu = dai_link->cpus;
-
-	/*
-	 * REMOVE ME
-	 *
-	 * This is glue code for Legacy vs Modern dai_link.
-	 * This function will be removed if all derivers are switched to
-	 * modern style dai_link.
-	 * Driver shouldn't use both legacy and modern style in the same time.
-	 * see
-	 *	soc.h :: struct snd_soc_dai_link
-	 */
-	/* convert Legacy platform link */
-	if (!cpu) {
-		cpu = devm_kzalloc(card->dev,
-				   sizeof(struct snd_soc_dai_link_component),
-				   GFP_KERNEL);
-		if (!cpu)
-			return -ENOMEM;
-
-		dai_link->cpus		= cpu;
-		dai_link->num_cpus	= 1;
-		dai_link->legacy_cpu	= 1;
-
-		cpu->name	= dai_link->cpu_name;
-		cpu->of_node	= dai_link->cpu_of_node;
-		cpu->dai_name	= dai_link->cpu_dai_name;
-	}
-
-	if (!dai_link->cpus) {
-		dev_err(card->dev, "ASoC: DAI link has no CPUs\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int snd_soc_init_platform(struct snd_soc_card *card,
-				 struct snd_soc_dai_link *dai_link)
-{
-	struct snd_soc_dai_link_component *platform = dai_link->platforms;
-
-	/*
-	 * REMOVE ME
-	 *
-	 * This is glue code for Legacy vs Modern dai_link.
-	 * This function will be removed if all derivers are switched to
-	 * modern style dai_link.
-	 * Driver shouldn't use both legacy and modern style in the same time.
-	 * see
-	 *	soc.h :: struct snd_soc_dai_link
-	 */
-	/* convert Legacy platform link */
-	if (!platform) {
-		platform = devm_kzalloc(card->dev,
-				sizeof(struct snd_soc_dai_link_component),
-				GFP_KERNEL);
-		if (!platform)
-			return -ENOMEM;
-
-		dai_link->platforms	  = platform;
-		dai_link->num_platforms	  = 1;
-		dai_link->legacy_platform = 1;
-		platform->name		  = dai_link->platform_name;
-		platform->of_node	  = dai_link->platform_of_node;
-		platform->dai_name	  = NULL;
-	}
-
-	/* if there's no platform we match on the empty platform */
-	if (!platform->name &&
-	    !platform->of_node)
-		platform->name = "snd-soc-dummy";
-
-	return 0;
-}
-
-static void soc_cleanup_legacy(struct snd_soc_card *card)
-{
-	struct snd_soc_dai_link *link;
-	int i;
-	/*
-	 * FIXME
-	 *
-	 * this function should be removed with snd_soc_init_platform
-	 */
-
-	for_each_card_prelinks(card, i, link) {
-		if (link->legacy_platform) {
-			link->legacy_platform = 0;
-			link->platforms       = NULL;
-		}
-		if (link->legacy_cpu) {
-			link->legacy_cpu = 0;
-			link->cpus = NULL;
-		}
-	}
-}
-
-static int snd_soc_init_multicodec(struct snd_soc_card *card,
-				   struct snd_soc_dai_link *dai_link)
-{
-	/*
-	 * REMOVE ME
-	 *
-	 * This is glue code for Legacy vs Modern dai_link.
-	 * This function will be removed if all derivers are switched to
-	 * modern style dai_link.
-	 * Driver shouldn't use both legacy and modern style in the same time.
-	 * see
-	 *	soc.h :: struct snd_soc_dai_link
-	 */
-
-	/* Legacy codec/codec_dai link is a single entry in multicodec */
-	if (dai_link->codec_name || dai_link->codec_of_node ||
-	    dai_link->codec_dai_name) {
-		dai_link->num_codecs = 1;
-
-		dai_link->codecs = devm_kzalloc(card->dev,
-				sizeof(struct snd_soc_dai_link_component),
-				GFP_KERNEL);
-		if (!dai_link->codecs)
-			return -ENOMEM;
-
-		dai_link->codecs[0].name = dai_link->codec_name;
-		dai_link->codecs[0].of_node = dai_link->codec_of_node;
-		dai_link->codecs[0].dai_name = dai_link->codec_dai_name;
-	}
-
-	if (!dai_link->codecs) {
-		dev_err(card->dev, "ASoC: DAI link has no CODECs\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
+static struct snd_soc_dai_link_component dummy_link = COMP_DUMMY();
 
 static int soc_init_dai_link(struct snd_soc_card *card,
 			     struct snd_soc_dai_link *link)
 {
-	int i, ret;
+	int i;
 	struct snd_soc_dai_link_component *codec;
 
-	ret = snd_soc_init_cpu(card, link);
-	if (ret) {
-		dev_err(card->dev, "ASoC: failed to init cpu\n");
-		return ret;
-	}
-
-	ret = snd_soc_init_platform(card, link);
-	if (ret) {
-		dev_err(card->dev, "ASoC: failed to init multiplatform\n");
-		return ret;
-	}
-
-	ret = snd_soc_init_multicodec(card, link);
-	if (ret) {
-		dev_err(card->dev, "ASoC: failed to init multicodec\n");
-		return ret;
+	/* default Platform */
+	if (!link->platforms || !link->num_platforms) {
+		link->platforms = &dummy_link;
+		link->num_platforms = 1;
 	}
 
 	for_each_link_codecs(link, i, codec) {
@@ -2060,7 +1911,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 				 card->dai_link[i].name);
 
 			/* override platform component */
-			if (snd_soc_init_platform(card, dai_link) < 0) {
+			if (!dai_link->platforms) {
 				dev_err(card->dev, "init platform error");
 				continue;
 			}
@@ -2111,7 +1962,6 @@ static int soc_cleanup_card_resources(struct snd_soc_card *card)
 	/* remove and free each DAI */
 	soc_remove_dai_links(card);
 	soc_remove_pcm_runtimes(card);
-	soc_cleanup_legacy(card);
 
 	/* remove auxiliary devices */
 	soc_remove_aux_devices(card);
@@ -2868,7 +2718,6 @@ int snd_soc_register_card(struct snd_soc_card *card)
 
 		ret = soc_init_dai_link(card, link);
 		if (ret) {
-			soc_cleanup_legacy(card);
 			dev_err(card->dev, "ASoC: failed to init link %s\n",
 				link->name);
 			mutex_unlock(&client_mutex);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
