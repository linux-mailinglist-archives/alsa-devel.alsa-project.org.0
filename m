Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7E84B8DD
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2019 14:41:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0E6116B4;
	Wed, 19 Jun 2019 14:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0E6116B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560948105;
	bh=7/x4F1JL4muWezCFmqfujn+16vpA5eL5/h1bK8KxZgc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qdMFiJVWfiMEqbfDxG6CxN5mAWapw2VisJAWJqDUa4canRLd7BctW0wzDUh2e2Sgz
	 gpMzUhKy+2kO8N0UsHqHyx6ZHhVMhxN0p62d43sfxs7KOE1qg68ck/cTW92o3FqZBz
	 uLGeATOgPS2yEj1wSQBcHTEErBo50phgqIJT+0FY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 101EFF8981D;
	Wed, 19 Jun 2019 14:13:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68FCDF8974C; Wed, 19 Jun 2019 14:12:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFB7CF8974D
 for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2019 14:12:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFB7CF8974D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="obPCZl0f"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=+G1A8+ZseOyuHZwEAzZFww8dXwQqN37Q/xZKM3innSM=; b=obPCZl0fo/bP
 phuHEENvRNif2Re+TpB7gZND3fkn9+e+SE+bQ1ngWWO9rbZxitSQ3fEYp27CDouLHRUXPieshxWLD
 TmgQF6ND1fwoyFP20McxssfIpp8qwFNFP3gN9SLs/a7xj/VPMIb1J0+nWMtljlqA5PA5aZFX596jm
 qTWBE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdZRc-0007Bq-6Y; Wed, 19 Jun 2019 12:12:04 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 9BB31440046; Wed, 19 Jun 2019 13:12:03 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wohiv0mg.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190619121203.9BB31440046@finisterre.sirena.org.uk>
Date: Wed, 19 Jun 2019 13:12:03 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: atmel: mikroe-proto: don't select
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

   ASoC: atmel: mikroe-proto: don't select unnecessary Platform

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

From 318ebbe8060d9664370c844029246f0588263fe4 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 19 Jun 2019 10:15:05 +0900
Subject: [PATCH] ASoC: atmel: mikroe-proto: don't select unnecessary Platform

ALSA SoC is now supporting "no Platform". Sound card doesn't need to
select "CPU component" as "Platform" anymore if it doesn't need
special Platform.
This patch removes such settings.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/mikroe-proto.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/atmel/mikroe-proto.c b/sound/soc/atmel/mikroe-proto.c
index 255168a9df5b..5335ca0ee086 100644
--- a/sound/soc/atmel/mikroe-proto.c
+++ b/sound/soc/atmel/mikroe-proto.c
@@ -88,8 +88,8 @@ static int snd_proto_probe(struct platform_device *pdev)
 	if (!dai)
 		return -ENOMEM;
 
-	/* for cpus/codecs/platforms */
-	comp = devm_kzalloc(&pdev->dev, 3 * sizeof(*comp), GFP_KERNEL);
+	/* for cpus/codecs */
+	comp = devm_kzalloc(&pdev->dev, 2 * sizeof(*comp), GFP_KERNEL);
 	if (!comp)
 		return -ENOMEM;
 
@@ -100,8 +100,6 @@ static int snd_proto_probe(struct platform_device *pdev)
 	dai->num_cpus = 1;
 	dai->codecs = &comp[1];
 	dai->num_codecs = 1;
-	dai->platforms = &comp[2];
-	dai->num_platforms = 1;
 
 	dai->name = "WM8731";
 	dai->stream_name = "WM8731 HiFi";
@@ -121,7 +119,6 @@ static int snd_proto_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 	dai->cpus->of_node = cpu_np;
-	dai->platforms->of_node = cpu_np;
 
 	dai_fmt = snd_soc_of_parse_daifmt(np, NULL,
 					  &bitclkmaster, &framemaster);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
