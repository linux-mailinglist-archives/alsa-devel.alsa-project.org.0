Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 966895A203
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 19:13:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D2C516D0;
	Fri, 28 Jun 2019 19:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D2C516D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561742008;
	bh=SoL0vzPdW78AY5Xth4PyG6wzNp+w/7winuY5AoxS2H4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Fnq01feiq6QOWs5GKekiuzeZOKguECbhw/R9oscEy0zH+oxpULWzAVTgtkrAcWUIj
	 t/8AIRkD8Nv2BFvfZHn4iwpsY47gq1zB0aZWTKHDx8PIRJep3DDMAY+WLQDjSV7pte
	 nsPVHe6XAkeCqu25xyriI50Eqm4IbveSzP6YJbt8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6487F897A5;
	Fri, 28 Jun 2019 18:57:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A68FF89770; Fri, 28 Jun 2019 18:56:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE8F6F8973B
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 18:56:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE8F6F8973B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="J6Yasb5h"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=2Xwp1I18SjDQ7SM8eHaJZ0yNnhKgxNVYjzr4lEak2R0=; b=J6Yasb5hTUqn
 4zvchDP8zpZufnmXPT03FpwkcDLtRyBGZQ+BpfForOQ+C/boB5qVDLomwwYRRDDF93Vh4hHUfTXl9
 HkjzsdhUlNHL5D4/yisisb5S+fpTJK7nipt77W7E158gsrC+c2dXiZ3mRTQJd2kmwCBwG3DrBtL48
 Cm/Wo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hguAj-000797-S7; Fri, 28 Jun 2019 16:56:25 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 6FEC5440046; Fri, 28 Jun 2019 17:56:25 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87d0iyv5wv.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190628165625.6FEC5440046@finisterre.sirena.org.uk>
Date: Fri, 28 Jun 2019 17:56:25 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: samsung: smdk_wm8994: consider
	CPU-Platform possibility" to the asoc tree
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

   ASoC: samsung: smdk_wm8994: consider CPU-Platform possibility

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

From 806bfc27ea84e7d934f513b6f4948138c782fb4a Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 28 Jun 2019 10:48:19 +0900
Subject: [PATCH] ASoC: samsung: smdk_wm8994: consider CPU-Platform possibility

commit d815e0f08fdd ("ASoC: samsung: smdk_wm8994: don't select unnecessary
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

Fixes: commit d815e0f08fdd ("ASoC: samsung: smdk_wm8994: don't select unnecessary Platform")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/samsung/smdk_wm8994.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index 99aa1620a17d..28f8be000aa1 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -102,11 +102,13 @@ static int smdk_wm8994_init_paiftx(struct snd_soc_pcm_runtime *rtd)
 
 SND_SOC_DAILINK_DEFS(aif1,
 	DAILINK_COMP_ARRAY(COMP_CPU("samsung-i2s.0")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("wm8994-codec", "wm8994-aif1")));
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm8994-codec", "wm8994-aif1")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("samsung-i2s.0")));
 
 SND_SOC_DAILINK_DEFS(fifo_tx,
 	DAILINK_COMP_ARRAY(COMP_CPU("samsung-i2s-sec")),
-	DAILINK_COMP_ARRAY(COMP_CODEC("wm8994-codec", "wm8994-aif1")));
+	DAILINK_COMP_ARRAY(COMP_CODEC("wm8994-codec", "wm8994-aif1")),
+	DAILINK_COMP_ARRAY(COMP_PLATFORM("samsung-i2s-sec")));
 
 static struct snd_soc_dai_link smdk_dai[] = {
 	{ /* Primary DAI i/f */
@@ -163,6 +165,9 @@ static int smdk_audio_probe(struct platform_device *pdev)
 			   "Property 'samsung,i2s-controller' missing or invalid\n");
 			ret = -EINVAL;
 		}
+
+		smdk_dai[0].platforms->name = NULL;
+		smdk_dai[0].platforms->of_node = smdk_dai[0].cpus->of_node;
 	}
 
 	id = of_match_device(of_match_ptr(samsung_wm8994_of_match), &pdev->dev);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
