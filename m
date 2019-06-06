Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DA7380B7
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 00:29:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7FC01701;
	Fri,  7 Jun 2019 00:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7FC01701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559860181;
	bh=rflJuzciTtpMQSINXdeTFUYjshyNZXYOnIHNO2Jc8ok=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=vBSdBbiXtrlmeu1RVxPxKvTc3M7Dpox3toz+NuRy+Nol7Ym2LQrZHBLW7hXfanGU3
	 zfO21J3GExzH6x687YAGCMvXD6Lmhbm8J25FJgU5TKSLqw04CTxmG8QTl8G7+RcyTX
	 VwBVjE5m/9MP/NjAfxeex6yUvyNvq+eJV6EIHUw0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE13DF89946;
	Thu,  6 Jun 2019 23:30:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA64EF897B9; Thu,  6 Jun 2019 23:28:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1E08F8974C
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1E08F8974C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="MNHLIkgM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=pVpZZg0mIAulLZGSLcslX67AD4/Pd16LHnZLcLzUGjY=; b=MNHLIkgMPr6L
 dt3G0J3XIdqTuC258KCk6PSCTCd/6Pb4b/+C2tmyKNpm19be8a4exeiPLCN9aQQw+nvjJnZCJjbOT
 CZbAoZ0J5OYQe9Zx7Zbi/cg85SBFfRYkzxFA5QNYpP5E0v1isiLPYJEdRpuLMpyYs+KLIG6JjnUpE
 Q32qw=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYzuI-0007Pc-Lk; Thu, 06 Jun 2019 21:26:46 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 376C4440049; Thu,  6 Jun 2019 22:26:46 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875zpjjrg8.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212646.376C4440049@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:46 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: ti: omap-abe-twl6040: use modern
	dai_link style" to the asoc tree
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

   ASoC: ti: omap-abe-twl6040: use modern dai_link style

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

From bc9dfc4cb1d817726774c1ab57c8f866a5e109db Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:13:06 +0900
Subject: [PATCH] ASoC: ti: omap-abe-twl6040: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/omap-abe-twl6040.c | 36 +++++++++++++++++++++++++--------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
index fed45b41f9d3..3522ea7aa8d9 100644
--- a/sound/soc/ti/omap-abe-twl6040.c
+++ b/sound/soc/ti/omap-abe-twl6040.c
@@ -35,6 +35,18 @@
 #include "omap-mcpdm.h"
 #include "../codecs/twl6040.h"
 
+SND_SOC_DAILINK_DEFS(link0,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC("twl6040-codec",
+				      "twl6040-legacy")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(link1,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec",
+				      "dmic-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 struct abe_twl6040 {
 	struct snd_soc_card card;
 	struct snd_soc_dai_link dai_links[2];
@@ -255,10 +267,14 @@ static int omap_abe_probe(struct platform_device *pdev)
 
 	priv->dai_links[0].name = "DMIC";
 	priv->dai_links[0].stream_name = "TWL6040";
-	priv->dai_links[0].cpu_of_node = dai_node;
-	priv->dai_links[0].platform_of_node = dai_node;
-	priv->dai_links[0].codec_dai_name = "twl6040-legacy";
-	priv->dai_links[0].codec_name = "twl6040-codec";
+	priv->dai_links[0].cpus = link0_cpus;
+	priv->dai_links[0].num_cpus = 1;
+	priv->dai_links[0].cpus->of_node = dai_node;
+	priv->dai_links[0].platforms = link0_platforms;
+	priv->dai_links[0].num_platforms = 1;
+	priv->dai_links[0].platforms->of_node = dai_node;
+	priv->dai_links[0].codecs = link0_codecs;
+	priv->dai_links[0].num_codecs = 1;
 	priv->dai_links[0].init = omap_abe_twl6040_init;
 	priv->dai_links[0].ops = &omap_abe_ops;
 
@@ -267,10 +283,14 @@ static int omap_abe_probe(struct platform_device *pdev)
 		num_links = 2;
 		priv->dai_links[1].name = "TWL6040";
 		priv->dai_links[1].stream_name = "DMIC Capture";
-		priv->dai_links[1].cpu_of_node = dai_node;
-		priv->dai_links[1].platform_of_node = dai_node;
-		priv->dai_links[1].codec_dai_name = "dmic-hifi";
-		priv->dai_links[1].codec_name = "dmic-codec";
+		priv->dai_links[1].cpus = link1_cpus;
+		priv->dai_links[1].num_cpus = 1;
+		priv->dai_links[1].cpus->of_node = dai_node;
+		priv->dai_links[1].platforms = link1_platforms;
+		priv->dai_links[1].num_platforms = 1;
+		priv->dai_links[1].platforms->of_node = dai_node;
+		priv->dai_links[1].codecs = link1_codecs;
+		priv->dai_links[1].num_codecs = 1;
 		priv->dai_links[1].init = omap_abe_dmic_init;
 		priv->dai_links[1].ops = &omap_abe_dmic_ops;
 	} else {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
