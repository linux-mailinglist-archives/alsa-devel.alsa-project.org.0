Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C73861AA0FF
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 14:37:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2918F165D;
	Wed, 15 Apr 2020 14:37:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2918F165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586954270;
	bh=U2YmseTlANKK+dbiJT/Rk72V3K1e4CYlnbGh0jjwpqM=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=g4FIpY0i77jhzqV0G8JcUtO1ckQmPvn7Ze3+o68fb28KHaF1tD9YFW9Ss+DfXBoCU
	 BMRawveiAUXBYnIPqa8Ng+fHPV2bJakqJYZ3MBOYkPyQF2Kdp0q9sc4zs4md7Hh/TJ
	 4o6IHgwIOjDverW2ktFPNU1IHPi990hysCwlpiDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23AEEF8025F;
	Wed, 15 Apr 2020 14:36:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0E7DF80264; Wed, 15 Apr 2020 14:35:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 677EAF80124
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 14:34:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 677EAF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LK+ZCXJJ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0056E206D5;
 Wed, 15 Apr 2020 12:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586954084;
 bh=U2YmseTlANKK+dbiJT/Rk72V3K1e4CYlnbGh0jjwpqM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=LK+ZCXJJXUKNwPGZh9RVn7FZyGdobbDn8uw2ITPIBJPuUrffuMUixz+GSojt3JRAh
 4zwqnxIH++WDh3kU1JI4/A5sIAHBWBAp3LPdJrNWxcSeXmvHSWQaL7StRXV6vLlIzB
 vFM9KjvI+wl5SQSeyiY9VB+PYStOYzVB5rfsRqBU=
Date: Wed, 15 Apr 2020 13:34:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Tang Bin <tangbin@cmss.chinamobile.com>
Subject: Applied "ASoC: fsl_micfil: Omit superfluous error message in
 fsl_micfil_probe()" to the asoc tree
In-Reply-To: <20200415044513.17492-1-tangbin@cmss.chinamobile.com>
Message-Id: <applied-20200415044513.17492-1-tangbin@cmss.chinamobile.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Shengju Zhang <zhangshengju@cmss.chinamobile.com>
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

   ASoC: fsl_micfil: Omit superfluous error message in fsl_micfil_probe()

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

From 83b35f4586e235bfb785a7947b555ad8f3d96887 Mon Sep 17 00:00:00 2001
From: Tang Bin <tangbin@cmss.chinamobile.com>
Date: Wed, 15 Apr 2020 12:45:13 +0800
Subject: [PATCH] ASoC: fsl_micfil: Omit superfluous error message in
 fsl_micfil_probe()

In the function fsl_micfil_probe(), when get irq failed, the function
platform_get_irq() logs an error message, so remove redundant message here.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>
Link: https://lore.kernel.org/r/20200415044513.17492-1-tangbin@cmss.chinamobile.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_micfil.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index f7f2d29f1bfe..e73bd6570a08 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -702,10 +702,8 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 	for (i = 0; i < MICFIL_IRQ_LINES; i++) {
 		micfil->irq[i] = platform_get_irq(pdev, i);
 		dev_err(&pdev->dev, "GET IRQ: %d\n", micfil->irq[i]);
-		if (micfil->irq[i] < 0) {
-			dev_err(&pdev->dev, "no irq for node %s\n", pdev->name);
+		if (micfil->irq[i] < 0)
 			return micfil->irq[i];
-		}
 	}
 
 	if (of_property_read_bool(np, "fsl,shared-interrupt"))
-- 
2.20.1

