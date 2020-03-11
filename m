Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E022318204D
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 19:02:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 794051677;
	Wed, 11 Mar 2020 19:01:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 794051677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583949757;
	bh=QIIdzvv5G0nZyJqIDBeskBVuWoux6GAZxC+2LnHNPqE=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mOMYGJHoJrkTgoSSh9W074jKZzDVQ9bfpOvGtpK9kj52QAS14um+/xn+vb1LB6psw
	 X4M2A9JJsE39+TyO0h8SlphZK7gfpsgnh1QOZlVGzAy6Q2FAGr+s25PgwlakMMtGEp
	 H4lGg9LRoef+iQUSs9C1r8KKuC0pb07Gq7LWrJlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E163F801A3;
	Wed, 11 Mar 2020 19:00:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A2B4F8021D; Wed, 11 Mar 2020 19:00:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D6515F800BE
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 19:00:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6515F800BE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7592F7FA;
 Wed, 11 Mar 2020 11:00:05 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE9D33F6CF;
 Wed, 11 Mar 2020 11:00:04 -0700 (PDT)
Date: Wed, 11 Mar 2020 18:00:03 +0000
From: Mark Brown <broonie@kernel.org>
To: tangbin <tangbin@cmss.chinamobile.com>
Subject: Applied "ASoC: zte: zx-tdm: remove redundant variables dev" to the
 asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: zte: zx-tdm: remove redundant variables dev

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 103ae95513803102d2a2c91458cfac5dfbaad124 Mon Sep 17 00:00:00 2001
From: tangbin <tangbin@cmss.chinamobile.com>
Date: Wed, 11 Mar 2020 22:46:46 +0800
Subject: [PATCH] ASoC: zte: zx-tdm: remove redundant variables dev

In this function, the variable 'dev' is assigned to '&pdev->dev',
but in the following code, all the assignments to 'struce device'
are used '&pdev->dev' instead of 'dev',except 'zx_tdm->dev'.
So,the variable 'dev' in this function is redundant and can be
replaced by '&pdev->dev' as elsewhere.

Signed-off-by: tangbin <tangbin@cmss.chinamobile.com>
Link: https://lore.kernel.org/r/20200311144646.11292-1-tangbin@cmss.chinamobile.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/zte/zx-tdm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/zte/zx-tdm.c b/sound/soc/zte/zx-tdm.c
index 0e5a05b25a77..4f787185d630 100644
--- a/sound/soc/zte/zx-tdm.c
+++ b/sound/soc/zte/zx-tdm.c
@@ -371,7 +371,6 @@ static struct snd_soc_dai_driver zx_tdm_dai = {
 
 static int zx_tdm_probe(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
 	struct of_phandle_args out_args;
 	unsigned int dma_reg_offset;
 	struct zx_tdm_info *zx_tdm;
@@ -384,7 +383,7 @@ static int zx_tdm_probe(struct platform_device *pdev)
 	if (!zx_tdm)
 		return -ENOMEM;
 
-	zx_tdm->dev = dev;
+	zx_tdm->dev = &pdev->dev;
 
 	zx_tdm->dai_wclk = devm_clk_get(&pdev->dev, "wclk");
 	if (IS_ERR(zx_tdm->dai_wclk)) {
-- 
2.20.1

