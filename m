Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA39AA8720
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 19:56:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F276C168E;
	Wed,  4 Sep 2019 19:55:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F276C168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567619765;
	bh=H0aLZAXUn6i6ejJB6EBXvZy85/sK2truMnyGCENKtUU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=AECOoMR7g6x7vijrmqQJl4BSuKtE6FERdcm/fJtgATRGU9sPAdt8sF4bvaVnqMwbq
	 QjdAra2s5iQNxqLs76iO+Ex6Om1yTqDIbihiwKQidL0kQNVtAacK+NU1i6cRJKhNYo
	 N4/P0P6hIC1BFKCvcI/50we4CBe0+VLcxMSVKg+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 385E8F80447;
	Wed,  4 Sep 2019 19:53:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F852F803D7; Wed,  4 Sep 2019 19:53:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4FABF80394
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 19:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4FABF80394
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="S5N2XJlZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Vad4mT+RpRm83DagHXSdfbCu0yANmHakAwjZP/ttn9s=; b=S5N2XJlZgWqd
 NMmxs5uW8p3g9iQT+u0fSfVvptiA+UkrkE/kPIGEHVhuffWZCUU3AYBR/8W95mAbZ0yp2yQi/qeaV
 L5zI1C6XMlR8o05irg8wmYODkvUPO+esvjN0YMS4i3GJQounsP5HvrdHcZxoLP1NJqnfzXZh1fRN8
 3lF+E=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5ZTC-0006h8-IU; Wed, 04 Sep 2019 17:53:26 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id ED4822742D17; Wed,  4 Sep 2019 18:53:25 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
In-Reply-To: <20190904082507.24300-1-yuehaibing@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190904175325.ED4822742D17@ypsilon.sirena.org.uk>
Date: Wed,  4 Sep 2019 18:53:25 +0100 (BST)
Cc: alsa-devel@alsa-project.org, arnd@arndb.de, Hulk Robot <hulkci@huawei.com>,
 info@metux.net, tiwai@suse.com, yuehaibing@huawei.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, hsweeten@visionengravers.com,
 Mark Brown <broonie@kernel.org>, olof@lixom.net, tglx@linutronix.de,
 alexander.sverdlin@gmail.com
Subject: [alsa-devel] Applied "ASoC: ep93xx: use
	devm_platform_ioremap_resource() to simplify code" to the asoc tree
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

   ASoC: ep93xx: use devm_platform_ioremap_resource() to simplify code

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From f295495ec657c5fb2cff355456c2a20c4c945d93 Mon Sep 17 00:00:00 2001
From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 4 Sep 2019 16:25:07 +0800
Subject: [PATCH] ASoC: ep93xx: use devm_platform_ioremap_resource() to
 simplify code

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Link: https://lore.kernel.org/r/20190904082507.24300-1-yuehaibing@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/cirrus/ep93xx-ac97.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/cirrus/ep93xx-ac97.c b/sound/soc/cirrus/ep93xx-ac97.c
index 84c967fcab6b..e21eaa1893d1 100644
--- a/sound/soc/cirrus/ep93xx-ac97.c
+++ b/sound/soc/cirrus/ep93xx-ac97.c
@@ -362,7 +362,6 @@ static const struct snd_soc_component_driver ep93xx_ac97_component = {
 static int ep93xx_ac97_probe(struct platform_device *pdev)
 {
 	struct ep93xx_ac97_info *info;
-	struct resource *res;
 	int irq;
 	int ret;
 
@@ -370,8 +369,7 @@ static int ep93xx_ac97_probe(struct platform_device *pdev)
 	if (!info)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	info->regs = devm_ioremap_resource(&pdev->dev, res);
+	info->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(info->regs))
 		return PTR_ERR(info->regs);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
