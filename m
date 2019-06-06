Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5E13800B
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 23:55:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93E4C1691;
	Thu,  6 Jun 2019 23:55:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93E4C1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559858153;
	bh=u43PRZAOA7B20PVtHEUT2zBP3UewiHi8kkzwqEDkfGE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=G4expJDb5F+YDrB9pacz860AUWGEBhX3QhrANz5BFapQpg7Z2DbQDCuiXPXwCcmZL
	 hOknP2SQydFyE2ETuDTgQqMFO2XA47eme5E1tRaD8POOv9Yf33qe8ng+7puqjLwgK1
	 ePSOWV+dLNJwc8+QjQM5gpY/BxvMeDzs8Jd9+BUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7608F8985B;
	Thu,  6 Jun 2019 23:28:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F4BCF89806; Thu,  6 Jun 2019 23:27:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 500B6F8976D
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 23:26:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 500B6F8976D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FhYce7wP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=rdoo2g+fE51zGO+YzJ4y0nhMA+KY7VdxNBdsDwDvb+M=; b=FhYce7wPCkYk
 FEhsy54E/xCe8tPBSmafaYxRuwvlpI0D5190Dh32ia0z8D88R2CDYtzwXew7ZaMFEMZUZUbGHDv2w
 zoOJqqR6HbUVhyEE1l+tgUFpTUY2vdIUQOQdxP43dck7Vl1onAH9yMrt9jjJtYnup/RFO2ywWCxSM
 eQU6Q=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hYztu-0007LI-0d; Thu, 06 Jun 2019 21:26:22 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 78319440046; Thu,  6 Jun 2019 22:26:21 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87d0jrgy2s.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190606212621.78319440046@finisterre.sirena.org.uk>
Date: Thu,  6 Jun 2019 22:26:21 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: ux500: mop500: use modern dai_link
	style" to the asoc tree
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

   ASoC: ux500: mop500: use modern dai_link style

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

From 8ad8d81a0ff66f48a28a6fc795524085ce999111 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 6 Jun 2019 13:18:14 +0900
Subject: [PATCH] ASoC: ux500: mop500: use modern dai_link style

ASoC is now supporting modern style dai_link
(= snd_soc_dai_link_component) for CPU/Codec/Platform.
This patch switches to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ux500/mop500.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/sound/soc/ux500/mop500.c b/sound/soc/ux500/mop500.c
index c60a57797640..20552e9d9217 100644
--- a/sound/soc/ux500/mop500.c
+++ b/sound/soc/ux500/mop500.c
@@ -27,26 +27,30 @@
 #include "mop500_ab8500.h"
 
 /* Define the whole MOP500 soundcard, linking platform to the codec-drivers  */
+SND_SOC_DAILINK_DEFS(link1,
+	DAILINK_COMP_ARRAY(COMP_CPU("ux500-msp-i2s.1")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("ab8500-codec.0", "ab8500-codec-dai.0")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("ux500-msp-i2s.1")));
+
+SND_SOC_DAILINK_DEFS(link2,
+	DAILINK_COMP_ARRAY(COMP_CPU("ux500-msp-i2s.3")),
+	DAILINK_COMP_ARRAY(COMP_CODEC("ab8500-codec.0", "ab8500-codec-dai.1")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("ux500-msp-i2s.3")));
+
 static struct snd_soc_dai_link mop500_dai_links[] = {
 	{
 		.name = "ab8500_0",
 		.stream_name = "ab8500_0",
-		.cpu_dai_name = "ux500-msp-i2s.1",
-		.codec_dai_name = "ab8500-codec-dai.0",
-		.platform_name = "ux500-msp-i2s.1",
-		.codec_name = "ab8500-codec.0",
 		.init = mop500_ab8500_machine_init,
 		.ops = mop500_ab8500_ops,
+		SND_SOC_DAILINK_REG(link1),
 	},
 	{
 		.name = "ab8500_1",
 		.stream_name = "ab8500_1",
-		.cpu_dai_name = "ux500-msp-i2s.3",
-		.codec_dai_name = "ab8500-codec-dai.1",
-		.platform_name = "ux500-msp-i2s.3",
-		.codec_name = "ab8500-codec.0",
 		.init = NULL,
 		.ops = mop500_ab8500_ops,
+		SND_SOC_DAILINK_REG(link2),
 	},
 };
 
@@ -63,8 +67,8 @@ static void mop500_of_node_put(void)
 	int i;
 
 	for (i = 0; i < 2; i++) {
-		of_node_put(mop500_dai_links[i].cpu_of_node);
-		of_node_put(mop500_dai_links[i].codec_of_node);
+		of_node_put(mop500_dai_links[i].cpus->of_node);
+		of_node_put(mop500_dai_links[i].codecs->of_node);
 	}
 }
 
@@ -85,12 +89,12 @@ static int mop500_of_probe(struct platform_device *pdev,
 	}
 
 	for (i = 0; i < 2; i++) {
-		mop500_dai_links[i].cpu_of_node = msp_np[i];
-		mop500_dai_links[i].cpu_dai_name = NULL;
-		mop500_dai_links[i].platform_of_node = msp_np[i];
-		mop500_dai_links[i].platform_name = NULL;
-		mop500_dai_links[i].codec_of_node = codec_np;
-		mop500_dai_links[i].codec_name = NULL;
+		mop500_dai_links[i].cpus->of_node = msp_np[i];
+		mop500_dai_links[i].cpus->dai_name = NULL;
+		mop500_dai_links[i].platforms->of_node = msp_np[i];
+		mop500_dai_links[i].platforms->name = NULL;
+		mop500_dai_links[i].codecs->of_node = codec_np;
+		mop500_dai_links[i].codecs->name = NULL;
 	}
 
 	snd_soc_of_parse_card_name(&mop500_card, "stericsson,card-name");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
