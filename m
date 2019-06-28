Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C0F5A21F
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 19:18:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F58516F4;
	Fri, 28 Jun 2019 19:18:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F58516F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561742332;
	bh=l/SFeu/Z9ByAmBxvT8ZeSMClX7dg6GpTQfY2HDZX2WY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ECssZ9AU8ufUX+EjwpRzEb943YBWCD/KJdag3pQgvzv6k4YHLLy1VpdegLBCndYPi
	 AyNkl/D2O6KuOXsNBNRlt7+m1TVxwU7y7XWc+4mgendCDsS5hQNgLeTWRh2626kVeD
	 fAtHX3FZpazxGizjxZ7ozYWTmWeWZ/58nPLIZKOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 547BDF897D3;
	Fri, 28 Jun 2019 18:57:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61AD4F8973E; Fri, 28 Jun 2019 18:57:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B23CFF89744
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 18:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B23CFF89744
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jRODLo+k"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=HjMWVgL4CzidW4WshPlVDwLoXYxWikZZUN7SxpAbzOs=; b=jRODLo+kgUzC
 ZaGp6ch6ge4AmyUF5r2mhN3MGVX21DT7B7Sf5OgL870IhqgCHOqzfS6XvoqhMi9rcARcz8ii4XqYy
 bePJ6GqdKgZ9yxPdX2g/nkfdwztDT3zrVL4uG5txW3KBTw5ho2nwfDGtS/Xjnwne1zvRjFCFv++rs
 FFuh8=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hguAk-00079r-SZ; Fri, 28 Jun 2019 16:56:26 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 445B444004F; Fri, 28 Jun 2019 17:56:26 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o92iv5y0.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190628165626.445B444004F@finisterre.sirena.org.uk>
Date: Fri, 28 Jun 2019 17:56:26 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: kirkwood: armada-370-db: consider
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

   ASoC: kirkwood: armada-370-db: consider CPU-Platform possibility

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

From bb6630d153a16e0cde1e849fcf298d8fec0e77bb Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 28 Jun 2019 10:47:38 +0900
Subject: [PATCH] ASoC: kirkwood: armada-370-db: consider CPU-Platform
 possibility

commit 717f16331712 ("ASoC: kirkwood: armada-370-db: don't select
unnecessary Platform")

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

Fixes: commit 717f16331712 ("ASoC: kirkwood: armada-370-db: don't select unnecessary Platform")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/kirkwood/armada-370-db.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/kirkwood/armada-370-db.c b/sound/soc/kirkwood/armada-370-db.c
index fcf84a54ad16..8c3c808bda9a 100644
--- a/sound/soc/kirkwood/armada-370-db.c
+++ b/sound/soc/kirkwood/armada-370-db.c
@@ -56,15 +56,18 @@ static const struct snd_soc_dapm_route a370db_route[] = {
 
 SND_SOC_DAILINK_DEFS(analog,
 	DAILINK_COMP_ARRAY(COMP_CPU("i2s")),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "cs42l51-hifi")));
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "cs42l51-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(spdif_out,
 	DAILINK_COMP_ARRAY(COMP_CPU("spdif")),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "dit-hifi")));
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "dit-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(spdif_in,
 	DAILINK_COMP_ARRAY(COMP_CPU("spdif")),
-	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "dir-hifi")));
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "dir-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 static struct snd_soc_dai_link a370db_dai[] = {
 {
@@ -108,18 +111,21 @@ static int a370db_probe(struct platform_device *pdev)
 	a370db_dai[0].cpus->of_node =
 		of_parse_phandle(pdev->dev.of_node,
 				 "marvell,audio-controller", 0);
+	a370db_dai[0].platforms->of_node = a370db_dai[0].cpus->of_node;
 
 	a370db_dai[0].codecs->of_node =
 		of_parse_phandle(pdev->dev.of_node,
 				 "marvell,audio-codec", 0);
 
 	a370db_dai[1].cpus->of_node = a370db_dai[0].cpus->of_node;
+	a370db_dai[1].platforms->of_node = a370db_dai[0].cpus->of_node;
 
 	a370db_dai[1].codecs->of_node =
 		of_parse_phandle(pdev->dev.of_node,
 				 "marvell,audio-codec", 1);
 
 	a370db_dai[2].cpus->of_node = a370db_dai[0].cpus->of_node;
+	a370db_dai[2].platforms->of_node = a370db_dai[0].cpus->of_node;
 
 	a370db_dai[2].codecs->of_node =
 		of_parse_phandle(pdev->dev.of_node,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
