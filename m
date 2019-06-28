Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 827A55A1F4
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 19:10:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 077001673;
	Fri, 28 Jun 2019 19:09:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 077001673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561741813;
	bh=9bIGHs1pVEP3izkldVmQVQ+rQw1OVnKYx2+mMmVFPIU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qK4MUzQXpeyaQ1SKfOHvmZyzWAhvLdUbWp3gKYnXSSpvouyPbdgf4uARtrV50ED0I
	 rLaZWl3nTud9asr4X8B//1PUbXWN+xxOst7i/zrgPsTLSea4ukPij7XIZzH/94A1yX
	 5+xpMbqwSY/io5EFY7uGmkyug86DLDzzm/jH7dXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DBAEF8978C;
	Fri, 28 Jun 2019 18:57:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61328F89763; Fri, 28 Jun 2019 18:56:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A674F8973A
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 18:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A674F8973A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="wVmUAhkh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=XRjHUcosa4tWtki6Dp9J8zI4moR+BNix1/cdvw1ctsA=; b=wVmUAhkhZkLa
 JYccyplLICK7/s+rsNtNQaDs4IioEMtNNxAkzQ8J8xHL/qynk3XA6cb/alu66f5bxY47aojE6Q/EX
 s3pIbamIQL9HdQQCc6YGp4P9jF+vnkpU3p/IRxOggmW4iHiqN09zqyYw2Gc3J1g7ggeLfZbrtVvd3
 VNbD4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hguAj-00078x-Qv; Fri, 28 Jun 2019 16:56:25 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 56FFE440049; Fri, 28 Jun 2019 17:56:25 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87blyiv5wr.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190628165625.56FFE440049@finisterre.sirena.org.uk>
Date: Fri, 28 Jun 2019 17:56:25 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: samsung: snow: consider CPU-Platform
	possibility" to the asoc tree
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

   ASoC: samsung: snow: consider CPU-Platform possibility

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

From 3dfc3e9c24b742067bbcbf849caba294bdb938f6 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 28 Jun 2019 10:48:23 +0900
Subject: [PATCH] ASoC: samsung: snow: consider CPU-Platform possibility

commit a555b6a959e6 ("ASoC: samsung: snow: don't select unnecessary
Platform")

Current ALSA SoC avoid to add duplicate component to rtd,
and this driver was selecting CPU component as Platform component.
Thus, above patch removed Platform settings from this driver,
because it assumed these are same component.

But, some CPU driver is using generic DMAEngine, in such case, both
CPU component and Platform component will have same of_node/name.
In other words, there are some components which are different but
have same of_node/name.

In such case, Card driver definitely need to select Platform even
though it is same as CPU.
It is depends on CPU driver, but is difficult to know it from Card driver.
This patch reverts above patch.

Fixes: commit a555b6a959e6 ("ASoC: samsung: snow: don't select unnecessary Platform")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/snow.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index 7d669c42cdad..8ea7799df028 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -14,9 +14,9 @@
 
 #define FIN_PLL_RATE		24000000
 
-SND_SOC_DAILINK_DEF(links_cpus,
-	DAILINK_COMP_ARRAY(COMP_EMPTY()));
-SND_SOC_DAILINK_DEF(links_codecs,
+SND_SOC_DAILINK_DEFS(links,
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 struct snow_priv {
@@ -150,6 +150,8 @@ static int snow_probe(struct platform_device *pdev)
 	link->num_cpus = ARRAY_SIZE(links_cpus);
 	link->codecs = links_codecs;
 	link->num_codecs = ARRAY_SIZE(links_codecs);
+	link->platforms = links_platforms;
+	link->num_platforms = ARRAY_SIZE(links_platforms);
 
 	card->dai_link = link;
 	card->num_links = 1;
@@ -205,6 +207,8 @@ static int snow_probe(struct platform_device *pdev)
 		}
 	}
 
+	link->platforms->of_node = link->cpus->of_node;
+
 	/* Update card-name if provided through DT, else use default name */
 	snd_soc_of_parse_card_name(card, "samsung,model");
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
