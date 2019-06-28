Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B094F5A23C
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 19:26:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3675F1697;
	Fri, 28 Jun 2019 19:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3675F1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561742761;
	bh=adRiZCF8ZHJhMfwhp1x50nTEJQeRmLP7HpUpCVcKGqU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dBJQX6wTpccuE4DdTvsfkrX+j+fanwcpPpl8s+pW1T9+CX2N249z7RXjbHD7wYITP
	 6zey38QyvyUdjBj7QhNtku4ZYg4Gpa6ipfn2qMz5HuvTLH/KYJFA3Wy0XNAN+wQco/
	 o/ZAxnkP4hEd/jAr3yjXwKUm5ugCODNfDZxU0gg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1711CF89805;
	Fri, 28 Jun 2019 18:58:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9A59F8977E; Fri, 28 Jun 2019 18:57:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4F9EF89750
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 18:56:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4F9EF89750
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="cRq+4CF8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=mWkrS8MudsqEJLPaq7kMg9q3a8q9DBw/PnzaA6M7f9c=; b=cRq+4CF8/ojS
 TjEB3BZbcVqikLH/7WG0yFRdS6UmG4Pyxh/1g1jrInjDYn7FYgcARXsdNFV1AfyDS3z5Xx/dAAr8J
 1Z/RvCbxy9hhVpdq9Pj0xo1pWqLaS0xDFWj1OSDKCL+RkB11oVrnVitOOJfgsrBm9PDJuyM+dI5OG
 Zx3Go=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hguAm-0007Aw-3x; Fri, 28 Jun 2019 16:56:28 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 7F00E44004C; Fri, 28 Jun 2019 17:56:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <875zoqwkki.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190628165627.7F00E44004C@finisterre.sirena.org.uk>
Date: Fri, 28 Jun 2019 17:56:27 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: atmel: atmel-pdmic: consider
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

   ASoC: atmel: atmel-pdmic: consider CPU-Platform possibility

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

From ea2d1868c4841423e0eb658f3f5747c7513c9187 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 28 Jun 2019 10:46:24 +0900
Subject: [PATCH] ASoC: atmel: atmel-pdmic: consider CPU-Platform possibility

commit 7baf32e164da5d4 ("ASoC: atmel: atmel-pdmic: don't select unnecessary
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

Fixes: commit 7baf32e164da5d4 ("ASoC: atmel: atmel-pdmic: don't select unnecessary Platform")
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/atmel-pdmic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/atmel/atmel-pdmic.c b/sound/soc/atmel/atmel-pdmic.c
index d46741003fa8..e09c28349e0d 100644
--- a/sound/soc/atmel/atmel-pdmic.c
+++ b/sound/soc/atmel/atmel-pdmic.c
@@ -514,21 +514,24 @@ static int atmel_pdmic_asoc_card_init(struct device *dev,
 	if (!dai_link)
 		return -ENOMEM;
 
-	comp = devm_kzalloc(dev, 2 * sizeof(*comp), GFP_KERNEL);
+	comp = devm_kzalloc(dev, 3 * sizeof(*comp), GFP_KERNEL);
 	if (!comp)
 		return -ENOMEM;
 
 	dai_link->cpus		= &comp[0];
 	dai_link->codecs	= &comp[1];
+	dai_link->platforms	= &comp[2];
 
 	dai_link->num_cpus	= 1;
 	dai_link->num_codecs	= 1;
+	dai_link->num_platforms	= 1;
 
 	dai_link->name			= "PDMIC";
 	dai_link->stream_name		= "PDMIC PCM";
 	dai_link->codecs->dai_name	= ATMEL_PDMIC_CODEC_DAI_NAME;
 	dai_link->cpus->dai_name	= dev_name(dev);
 	dai_link->codecs->name		= dev_name(dev);
+	dai_link->platforms->name	= dev_name(dev);
 
 	card->dai_link	= dai_link;
 	card->num_links	= 1;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
