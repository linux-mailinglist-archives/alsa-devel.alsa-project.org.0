Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D72C4B81C
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 14:24:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB0B71688;
	Wed, 19 Jun 2019 14:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB0B71688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560947080;
	bh=U5uDXwaMcXEZBdDNwdHGNc2iXrpgplxazVV4LR9j45c=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cdmrrhsIuDGiV91WlrFL9JGOLlBq8PtF8f95q9sjF6Xb5gj6kz348F2NsX9yzJqoT
	 aDA4OSt7EZSrYMOa4UmJXtI818+I9M06qUPekgFKA/vYFc0RNzdcmRGlPdTP52aGEW
	 9YZ2zzYJ2WBKNj37HZnLzjEiQQyr4RHH2SETF3wo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A820F8978B;
	Wed, 19 Jun 2019 14:13:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3590BF89760; Wed, 19 Jun 2019 14:12:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 523D8F89717
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 14:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 523D8F89717
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sXYoIUK+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=3kX8TDDZ008ZiaMdli9H8XSCw3CPx/XvbuNi7x5jFOg=; b=sXYoIUK+2ogW
 5UObl97YoLPrXWJo8Sn7VmWuviIHFfyv4WlYRqk6NjKNa9izO0gd7xZoF6FA/HGCeguDlBBPMI36p
 vuZ1zbaovbuCGj+ycouMPU/Sls3P3RJeqqVCYb7MchTISxptv+UIr+2tvCYv17xZiT2R3wxrq11zb
 nJSHo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdZRY-00078h-9S; Wed, 19 Jun 2019 12:12:00 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id DB923440049; Wed, 19 Jun 2019 13:11:59 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87k1ditlv5.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190619121159.DB923440049@finisterre.sirena.org.uk>
Date: Wed, 19 Jun 2019 13:11:59 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: ti: omap-abe-twl6040: don't select
	unnecessary Platform" to the asoc tree
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

   ASoC: ti: omap-abe-twl6040: don't select unnecessary Platform

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

From 1306ab2eddd1ede09da7a849ef92c3c820d6850e Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 19 Jun 2019 10:19:11 +0900
Subject: [PATCH] ASoC: ti: omap-abe-twl6040: don't select unnecessary Platform

ALSA SoC is now supporting "no Platform". Sound card doesn't need to
select "CPU component" as "Platform" anymore if it doesn't need
special Platform.
This patch removes such settings.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/omap-abe-twl6040.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
index 3522ea7aa8d9..475a074600f6 100644
--- a/sound/soc/ti/omap-abe-twl6040.c
+++ b/sound/soc/ti/omap-abe-twl6040.c
@@ -35,17 +35,17 @@
 #include "omap-mcpdm.h"
 #include "../codecs/twl6040.h"
 
-SND_SOC_DAILINK_DEFS(link0,
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC("twl6040-codec",
-				      "twl6040-legacy")),
+SND_SOC_DAILINK_DEF(link0_cpus,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEF(link0_codecs,
+	DAILINK_COMP_ARRAY(COMP_CODEC("twl6040-codec",
+				      "twl6040-legacy")));
 
-SND_SOC_DAILINK_DEFS(link1,
-	DAILINK_COMP_ARRAY(COMP_EMPTY()),
-	DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec",
-				      "dmic-hifi")),
+SND_SOC_DAILINK_DEF(link1_cpus,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEF(link1_codecs,
+	DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec",
+				      "dmic-hifi")));
 
 struct abe_twl6040 {
 	struct snd_soc_card card;
@@ -270,9 +270,6 @@ static int omap_abe_probe(struct platform_device *pdev)
 	priv->dai_links[0].cpus = link0_cpus;
 	priv->dai_links[0].num_cpus = 1;
 	priv->dai_links[0].cpus->of_node = dai_node;
-	priv->dai_links[0].platforms = link0_platforms;
-	priv->dai_links[0].num_platforms = 1;
-	priv->dai_links[0].platforms->of_node = dai_node;
 	priv->dai_links[0].codecs = link0_codecs;
 	priv->dai_links[0].num_codecs = 1;
 	priv->dai_links[0].init = omap_abe_twl6040_init;
@@ -286,9 +283,6 @@ static int omap_abe_probe(struct platform_device *pdev)
 		priv->dai_links[1].cpus = link1_cpus;
 		priv->dai_links[1].num_cpus = 1;
 		priv->dai_links[1].cpus->of_node = dai_node;
-		priv->dai_links[1].platforms = link1_platforms;
-		priv->dai_links[1].num_platforms = 1;
-		priv->dai_links[1].platforms->of_node = dai_node;
 		priv->dai_links[1].codecs = link1_codecs;
 		priv->dai_links[1].num_codecs = 1;
 		priv->dai_links[1].init = omap_abe_dmic_init;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
