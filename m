Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9349E173F8D
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Feb 2020 19:26:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AE7C16D4;
	Fri, 28 Feb 2020 19:25:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AE7C16D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582914397;
	bh=YCag6MHmRKX52/oyPfKabaR0BmIOgGqMvqGKHpOGJyY=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mRr7C9a2dv4T2tO8bk5dqyqdISik7EoBycK/2mudodE1Quhxc9q9hY50Lm1plWXh0
	 2LtBbAKdaH03vLG8po3fqp+3vHJO7At8lZlcOGOQDDvkHbCIsc/UK5HC6l4yePzYQr
	 OkQjg+5rGpPkBxjJC2tT6rmTtEVTogblgnPr+jhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6915F8014E;
	Fri, 28 Feb 2020 19:24:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B4D7F8014E; Fri, 28 Feb 2020 19:24:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C9B30F80113
 for <alsa-devel@alsa-project.org>; Fri, 28 Feb 2020 19:24:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9B30F80113
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A897D31B;
 Fri, 28 Feb 2020 10:24:46 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2ABE33F7B4;
 Fri, 28 Feb 2020 10:24:46 -0800 (PST)
Date: Fri, 28 Feb 2020 18:24:44 +0000
From: Mark Brown <broonie@kernel.org>
To: tangbin <tangbin@cmss.chinamobile.com>
Subject: Applied "ASoC: zte: zx-spdif: remove redundant dev_err message" to
 the asoc tree
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

   ASoC: zte: zx-spdif: remove redundant dev_err message

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

From a57ec83a7104eab6f08215702067fbcbef90c0a0 Mon Sep 17 00:00:00 2001
From: tangbin <tangbin@cmss.chinamobile.com>
Date: Thu, 27 Feb 2020 23:07:01 +0800
Subject: [PATCH] ASoC: zte: zx-spdif: remove redundant dev_err message

devm_ioremap_resource has already contains error message, so remove
the redundant dev_err message

Signed-off-by: tangbin <tangbin@cmss.chinamobile.com>
Link: https://lore.kernel.org/r/20200227150701.15652-1-tangbin@cmss.chinamobile.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/zte/zx-spdif.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/zte/zx-spdif.c b/sound/soc/zte/zx-spdif.c
index 60382ec23832..a3a07c0730e6 100644
--- a/sound/soc/zte/zx-spdif.c
+++ b/sound/soc/zte/zx-spdif.c
@@ -322,7 +322,6 @@ static int zx_spdif_probe(struct platform_device *pdev)
 	zx_spdif->mapbase = res->start;
 	zx_spdif->reg_base = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(zx_spdif->reg_base)) {
-		dev_err(&pdev->dev, "ioremap failed!\n");
 		return PTR_ERR(zx_spdif->reg_base);
 	}
 
-- 
2.20.1

