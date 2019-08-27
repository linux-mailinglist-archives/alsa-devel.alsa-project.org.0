Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7DDA1E91
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 17:12:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 764C3170A;
	Thu, 29 Aug 2019 17:12:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 764C3170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567091579;
	bh=/sel/zLs0DOd0Tavkz+jHr4dE2XYztVJkJJUHZOK5RE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=o3NQcWhL9i5xRYD+503JsSBe4LKAQj3jP59muzr1oN9l413LQtW8+p5BCJYK3Pahg
	 ma/IRmm/zqW9kHwe40vkpGaZ+wASaoWcK39VlPNJPDnw8MiOh1phQYZuDUPe43C3lK
	 oUCpPCcEYhonyrj1qcEP8zrbQgfMnvHHPjsN8SJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6614F80720;
	Tue, 27 Aug 2019 21:58:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BF50F8070E; Tue, 27 Aug 2019 21:58:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45966F8067C
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 21:58:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45966F8067C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Gi5oISGC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=/qq4Y8bgfDjBd2xqdj5sv4QiznVJqZN+/Lozc9RwR5E=; b=Gi5oISGCh/oI
 GprUbjlaXZCFLLFg3JuKxdywxtf2lz0E+PAPGdj5+XYYsGcpby6yklfPwo+7FTKup4v5Frq+F3amv
 NvaHu33EeoBiAqGJ8GJabWTQ9GReaFRnEArhUucuNK687AWeHqjjAjwbzOmWMex6I2nOgoLYDxOHn
 QJnoY=;
Received: from 188.28.18.107.threembb.co.uk ([188.28.18.107]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i2hbY-0001CW-U0; Tue, 27 Aug 2019 19:58:13 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 6AED8D02CEA; Tue, 27 Aug 2019 20:58:10 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Wei Yongjun <weiyongjun1@huawei.com>
In-Reply-To: <20190826120003.183279-1-weiyongjun1@huawei.com>
X-Patchwork-Hint: ignore
Message-Id: <20190827195810.6AED8D02CEA@fitzroy.sirena.org.uk>
Date: Tue, 27 Aug 2019 20:58:10 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Pengutronix@sirena.org.uk,
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: SOF: imx8: Fix return value check in
	imx8_probe()" to the asoc tree
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

   ASoC: SOF: imx8: Fix return value check in imx8_probe()

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

From 393151c211006cc5ac6af26ecd9982dd916a8104 Mon Sep 17 00:00:00 2001
From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 26 Aug 2019 12:00:03 +0000
Subject: [PATCH] ASoC: SOF: imx8: Fix return value check in imx8_probe()

In case of error, the function devm_ioremap_wc() returns NULL pointer
not ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: 202acc565a1f ("ASoC: SOF: imx: Add i.MX8 HW support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Link: https://lore.kernel.org/r/20190826120003.183279-1-weiyongjun1@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/imx/imx8.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 640472491037..c9d849ced54a 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -296,10 +296,10 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(sdev->dev, res.start,
 							  res.end - res.start +
 							  1);
-	if (IS_ERR(sdev->bar[SOF_FW_BLK_TYPE_SRAM])) {
+	if (!sdev->bar[SOF_FW_BLK_TYPE_SRAM]) {
 		dev_err(sdev->dev, "failed to ioremap mem 0x%x size 0x%x\n",
 			base, size);
-		ret = PTR_ERR(sdev->bar[SOF_FW_BLK_TYPE_SRAM]);
+		ret = -ENOMEM;
 		goto exit_pdev_unregister;
 	}
 	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
