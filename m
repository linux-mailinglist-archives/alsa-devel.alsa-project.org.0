Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C011117A
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:29:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1266175C;
	Thu,  2 May 2019 04:28:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1266175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556764161;
	bh=bUAtkfKeWx5WwyQ8nDSVwwVKAMzGEMVm1S4k6z8y9rU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fo7rrTXvzmMSS8N1HmBK3lqSCtFQ6jsc5tFP16CEA/Ist0V1E1FzfgUyb1fmAXdVc
	 ySCDLGDOmfByM6bqNgzRnwtn3fcwBMS37Ds0uGdUJ1/Ne8OiTNsdxwrAHDNdXcU2qe
	 7auF8sLoLtUsTD7LxUpqfjn+SUZYh5tibIlRQNOw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B28F3F89769;
	Thu,  2 May 2019 04:19:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59DE6F89749; Thu,  2 May 2019 04:18:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28F14F89727
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28F14F89727
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="c2k42bN3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=H0GWnsWEeo9xA3dxffCTPYwsc9LqHlPEHH/lHzw3kpg=; b=c2k42bN3l7r9
 02mVV/0aMF6lESDtfUQWgpmOs/AorVy26dgXoJb4YbBBm0VFomaxLejskv0FOvWFh0KTw8OCmRTz9
 kVRM2TNn2pzG9jOzVsN3C1sjrtaq8JVnsl4NKkoR/xNPqlVFofqpyq8pAsokH17R7Ov+7AiWqEeuQ
 IUlbU=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1Ij-0005rV-0u; Thu, 02 May 2019 02:18:21 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 16B99441D3B; Thu,  2 May 2019 03:18:18 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Viorel Suman <viorel.suman@nxp.com>
In-Reply-To: 
X-Patchwork-Hint: ignore
Message-Id: <20190502021818.16B99441D3B@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:18 +0100 (BST)
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, Julia Lawall <Julia.Lawall@lip6.fr>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: imx-audmix: fix object reference leaks
	in probe" to the asoc tree
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

   ASoC: imx-audmix: fix object reference leaks in probe

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

From 8bb678d75954e9e5b9ecabfe95b20f650fd91edb Mon Sep 17 00:00:00 2001
From: Viorel Suman <viorel.suman@nxp.com>
Date: Wed, 10 Apr 2019 11:06:38 +0000
Subject: [PATCH] ASoC: imx-audmix: fix object reference leaks in probe

Release the reference to the underlying device taken
by of_find_device_by_node() call.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Reported-by: Julia Lawall <Julia.Lawall@lip6.fr>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-audmix.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 7983bd339c01..9aaf3e5b45b9 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -171,6 +171,7 @@ static int imx_audmix_probe(struct platform_device *pdev)
 			np->full_name);
 		return -EINVAL;
 	}
+	put_device(&audmix_pdev->dev);
 
 	num_dai = of_count_phandle_with_args(audmix_np, "dais", NULL);
 	if (num_dai != FSL_AUDMIX_MAX_DAIS) {
@@ -216,6 +217,7 @@ static int imx_audmix_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "failed to find SAI platform device\n");
 			return -EINVAL;
 		}
+		put_device(&cpu_pdev->dev);
 
 		dai_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s%s",
 					  fe_name_pref, args.np->full_name + 1);
@@ -280,6 +282,8 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to find SAI platform device\n");
 		return -EINVAL;
 	}
+	put_device(&cpu_pdev->dev);
+
 	priv->cpu_mclk = devm_clk_get(&cpu_pdev->dev, "mclk1");
 	if (IS_ERR(priv->cpu_mclk)) {
 		ret = PTR_ERR(priv->cpu_mclk);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
