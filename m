Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A36E9C339D
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 14:01:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 348B8166E;
	Tue,  1 Oct 2019 14:00:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 348B8166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569931265;
	bh=O4mvWNBGmsyPCVMo1UwP8KK9GC+5XBej/rUvWmv80hw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=s9NUcl2nIQ/poArWELuEXIk+zduxwR421u3A6voTezU5DPRUrmsWC58voDYhN72Lb
	 iX42FScDyZpb9LtaGHKlarTUeUnxbIDx7Ouyoqw73rrLHmVz/hi9K7aGCTS6ai5diy
	 E7+pPbEm0jCEI+pqhfpTtKSQLt4gbLe2QfmeJIaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD144F80637;
	Tue,  1 Oct 2019 13:41:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B66D8F8070B; Tue,  1 Oct 2019 13:41:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D27AF80636
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 13:40:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D27AF80636
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="KnH+yQn7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=YNsJV+ItOG8ETV3+VvS7k1U3tPURXjwDj/TDkFunmQw=; b=KnH+yQn7YDw6
 bzcw9jmdMxQbfVD0USWM9LZrhR+t7dVf8IaraVA1i5qQER8c5n559CIFq0awmSozQ9pct0LsNwo8/
 osgitovUdZxaFQbc1SbJH4RdQNsmrI3lXgaKqs3KWhBfB9FmqbkiONOxztgeiRIwU1COyvXS1s3t7
 aYccY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGWS-0004VE-4z; Tue, 01 Oct 2019 11:40:52 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 9B8C62742A30; Tue,  1 Oct 2019 12:40:51 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Markus Elfring <elfring@users.sourceforge.net>
In-Reply-To: <8f7cf483-6ab3-d00f-5606-863e9f5b31fc@web.de>
X-Patchwork-Hint: ignore
Message-Id: <20191001114051.9B8C62742A30@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 12:40:51 +0100 (BST)
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Maruthi Srinivas Bayyavarapu <maruthi.srinivas.bayyavarapu@xilinx.com>,
 Mark Brown <broonie@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: xlnx: Use
	devm_platform_ioremap_resource() in
	xlnx_formatter_pcm_probe()" to the asoc tree
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

   ASoC: xlnx: Use devm_platform_ioremap_resource() in xlnx_formatter_pcm_probe()

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

From 6cfb1cd60394c2d88c6868d147cf6882a9ca3b6c Mon Sep 17 00:00:00 2001
From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 19 Sep 2019 17:27:57 +0200
Subject: [PATCH] ASoC: xlnx: Use devm_platform_ioremap_resource() in
 xlnx_formatter_pcm_probe()

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Link: https://lore.kernel.org/r/8f7cf483-6ab3-d00f-5606-863e9f5b31fc@web.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 48970efe7838..fb652e73abeb 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -564,7 +564,6 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 	int ret;
 	u32 val;
 	struct xlnx_pcm_drv_data *aud_drv_data;
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 
 	aud_drv_data = devm_kzalloc(dev, sizeof(*aud_drv_data), GFP_KERNEL);
@@ -584,13 +583,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "audio formatter node:addr to resource failed\n");
-		ret = -ENXIO;
-		goto clk_err;
-	}
-	aud_drv_data->mmio = devm_ioremap_resource(dev, res);
+	aud_drv_data->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(aud_drv_data->mmio)) {
 		dev_err(dev, "audio formatter ioremap failed\n");
 		ret = PTR_ERR(aud_drv_data->mmio);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
