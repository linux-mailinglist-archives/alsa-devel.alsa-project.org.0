Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAB1E74D0
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Oct 2019 16:17:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A6892053;
	Mon, 28 Oct 2019 16:17:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A6892053
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572275871;
	bh=gRltGptYGbkn5LWORseaHRq8N3h3TrOu4Djvsctd5gM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Ct0wNkkTVGftFtz2u0AUSIvFcYRPgBbD+k5R31KznGDL6SDITkceLmQA+383VYNpF
	 CHRQUFT6ZfQK2716AQDz10EG1m3bh14MDrkfnriWXQuzbSTU22VRqMweaSqFb5X1Hg
	 8zloH6cU0ivtf7aKxca7VDuexlgZkOWGBPrEGtWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E439F80C20;
	Mon, 28 Oct 2019 15:57:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F76CF80715; Mon, 28 Oct 2019 15:57:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 616FAF8063D
 for <alsa-devel@alsa-project.org>; Mon, 28 Oct 2019 15:56:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 616FAF8063D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="J/eopTmx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=ayhWuIRk5G3JoYC0+eItJEUm0KsYBGtWrfEHFIWOfGI=; b=J/eopTmx08dP
 Gn2R0iyfVwHXLAPcXiu8TJGiAc03+2NbUjFDRL/AeJpTXQevErvZ5eNpX0H5DEcC3W20NqShBUcJM
 SnU5jTQ6t8+sFN2XY1toDYKNn48nNmKI1qzGH13XCVCpdRDWUDvQxxmpEqhPHf21OPsxfr4eE/YZl
 M9/Ao=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iP6Rj-0008Rn-Bv; Mon, 28 Oct 2019 14:56:39 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 8735D2741458; Mon, 28 Oct 2019 14:56:37 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20191025051353.2878-1-mpe@ellerman.id.au>
X-Patchwork-Hint: ignore
Message-Id: <20191028145637.8735D2741458@ypsilon.sirena.org.uk>
Date: Mon, 28 Oct 2019 14:56:37 +0000 (GMT)
Cc: linuxppc-dev@ozlabs.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, kuninori.morimoto.gx@renesas.com
Subject: [alsa-devel] Applied "ASoC: fsl: fsl_dma: fix build failure" to the
	asoc tree
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
Content-Type: multipart/mixed; boundary="===============5361402142792451956=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

--===============5361402142792451956==
Content-Type: text/plain

The patch

   ASoC: fsl: fsl_dma: fix build failure

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From d3de1eb461e5bac0b07f5c785e6e0d959915df96 Mon Sep 17 00:00:00 2001
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 25 Oct 2019 16:13:53 +1100
Subject: [PATCH] ASoC: fsl: fsl_dma: fix build failure
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 4ac85de9977e ("ASoC: fsl: fsl_dma: remove snd_pcm_ops") removed
fsl_dma_ops but left a usage, leading to a build error for some
configs, eg. mpc85xx_defconfig:

  sound/soc/fsl/fsl_dma.c: In function ‘fsl_soc_dma_probe’:
  sound/soc/fsl/fsl_dma.c:905:18: error: ‘fsl_dma_ops’ undeclared (first use in this function)
    dma->dai.ops = &fsl_dma_ops;
                    ^~~~~~~~~~~

Remove the usage to fix the build.

Fixes: 4ac85de9977e ("ASoC: fsl: fsl_dma: remove snd_pcm_ops")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20191025051353.2878-1-mpe@ellerman.id.au
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_dma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_dma.c b/sound/soc/fsl/fsl_dma.c
index a092726510d4..2868c4f97cb2 100644
--- a/sound/soc/fsl/fsl_dma.c
+++ b/sound/soc/fsl/fsl_dma.c
@@ -901,7 +901,6 @@ static int fsl_soc_dma_probe(struct platform_device *pdev)
 	}
 
 	dma->dai.name = DRV_NAME;
-	dma->dai.ops = &fsl_dma_ops;
 	dma->dai.open = fsl_dma_open;
 	dma->dai.close = fsl_dma_close;
 	dma->dai.ioctl = snd_soc_pcm_lib_ioctl;
-- 
2.20.1


--===============5361402142792451956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5361402142792451956==--
