Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC2989FA5
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 15:28:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78BCA168B;
	Mon, 12 Aug 2019 15:27:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78BCA168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565616481;
	bh=/j74pKVSB765I098Bnkmb0sBC4uo4SANB5P61n9QoVU=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=vlBEnhQ51aEOkENFbzz4TvphErls8QwFZuIjy0j7RxqG6hiKvFW802SmJI+cRe9M9
	 ji0jwvHJVSy6dSsQ/d434Tx6vNS53HH0HSc5BKrmOJwrdpMhGYKR5xCGEwSvhV8J5M
	 c3A6aB0Xm9RMKeeFE7dVvL2LvdiHa9MgCNxA/e8s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D74B1F8060F;
	Mon, 12 Aug 2019 15:22:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC4E2F805F7; Mon, 12 Aug 2019 15:10:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22FFAF800F6
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 15:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22FFAF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KdB9P4pB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=G+NhmvpynvEkdk6GHQHvKh69Oy4SC2WPQyF4nmoq5Wc=; b=KdB9P4pBQa3j
 VwGjSS0Bhi6Xs/J3wrSyEU5sbYJ7siMRamPSMiflutt0FLjkua/MF9eFOuyHy+uY8sy2OCMD6nebx
 aS38FVV9sUi7yi9FWXRZ0Ltk33x3pjrCIcDOUgMCmcD9wlV/EjDjMsVJwEQF7u06xApWjSNbuvSoe
 XxhDk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hxA59-0001MA-LS; Mon, 12 Aug 2019 13:09:51 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2CA162740CBD; Mon, 12 Aug 2019 14:09:51 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1565346467-5769-1-git-send-email-shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190812130951.2CA162740CBD@ypsilon.sirena.org.uk>
Date: Mon, 12 Aug 2019 14:09:51 +0100 (BST)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, festevam@gmail.com
Subject: [alsa-devel] Applied "ASoC: fsl_esai: Add compatible string for
	imx6ull" to the asoc tree
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

   ASoC: fsl_esai: Add compatible string for imx6ull

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

From 9c2806c4941641a6c75736f8c4303c89d2013cc4 Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Fri, 9 Aug 2019 18:27:46 +0800
Subject: [PATCH] ASoC: fsl_esai: Add compatible string for imx6ull

Add compatible string for imx6ull, from imx6ull platform,
the issue of channel swap after xrun is fixed in hardware.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Link: https://lore.kernel.org/r/1565346467-5769-1-git-send-email-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_esai.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 5832144beb9f..a78e4ab478df 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -1049,6 +1049,7 @@ static int fsl_esai_remove(struct platform_device *pdev)
 static const struct of_device_id fsl_esai_dt_ids[] = {
 	{ .compatible = "fsl,imx35-esai", },
 	{ .compatible = "fsl,vf610-esai", },
+	{ .compatible = "fsl,imx6ull-esai", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_esai_dt_ids);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
