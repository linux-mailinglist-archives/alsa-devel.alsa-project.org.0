Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 109D114B44
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 15:53:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9535318C4;
	Mon,  6 May 2019 15:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9535318C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557150814;
	bh=lmulC1tne/fn0MaJqIKoBcBItYH+h2/fqV+iOKk3p+w=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=QNR3zWazpnngo8hF9k+hOqlmql1qmPOytDaGazN8WnZvjbenZDuQIIUIQ/N+og8M6
	 LniqrE/HUIpX9i4CWua8Z5r9Ay8PX+BsM6XjtD8DhfOYxqUXW4jpATmBcVqneZ/9RA
	 +AgNOAxrn0TaMVfZcLCyfVQ0JwSGxZSrjU+Liyfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21908F896FD;
	Mon,  6 May 2019 15:51:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 039C4F896F0; Mon,  6 May 2019 15:51:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82AB1F80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 15:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82AB1F80C07
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="AepfxQ0p"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=foLRJ95fVzlyBOYQo4XCM1XGFmZlXrGXPccu2GVICFA=; b=AepfxQ0pUAJC
 cMqeDbM5pyH2X53QKpSIIK1cr/ijcg7KRroVelwnQ6fWTwgtR9jL//dUICL5IY9CGnU1kpjAvNF97
 EPL2KkGdlbCxl85+m4ucbwJNhBv5q0Tm//KHBCsQUtyVd+X9bqgXj7ILQYlcG6eByO1IbSdTkj9X+
 Ytxvo=;
Received: from [2001:268:c0e6:658d:8f3d:d90b:c4e4:2fdf]
 (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hNe1u-0001jB-U5; Mon, 06 May 2019 13:51:43 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id E96D944000C; Mon,  6 May 2019 14:51:36 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Baolin Wang <baolin.wang@linaro.org>
In-Reply-To: <ee4a22c3491628abf94c8d356dccd67984604811.1555049554.git.baolin.wang@linaro.org>
X-Patchwork-Hint: ignore
Message-Id: <20190506135136.E96D944000C@finisterre.ee.mobilebroadband>
Date: Mon,  6 May 2019 14:51:36 +0100 (BST)
Cc: alsa-devel@alsa-project.org, baolin.wang@linaro.org, zhang.lyra@gmail.com,
 tiwai@suse.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, orsonzhai@gmail.com
Subject: [alsa-devel] Applied "ASoC: sprd: Add reserved DMA memory support"
	to the asoc tree
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

   ASoC: sprd: Add reserved DMA memory support

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

From 1587a061ef562de0d97c82a95863e191bcd69d63 Mon Sep 17 00:00:00 2001
From: Baolin Wang <baolin.wang@linaro.org>
Date: Fri, 12 Apr 2019 14:40:17 +0800
Subject: [PATCH] ASoC: sprd: Add reserved DMA memory support

For Spreadtrum audio platform driver, it need allocate a larger DMA buffer
dynamically to copy audio data between userspace and kernel space, but that
will increase the risk of memory allocation failure especially the system
is under heavy load situation.

To make sure the audio can work in this scenario, we usually reserve one
region of memory to be used as a shared pool of DMA buffers for the
platform component. So add of_reserved_mem_device_init_by_idx() function
to initialize the shared pool of DMA buffers to be used by the platform
component.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sprd/sprd-pcm-dma.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index 9be6d4b2bf74..d38ebbbbf169 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -6,6 +6,7 @@
 #include <linux/dma/sprd-dma.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -530,8 +531,14 @@ static const struct snd_soc_component_driver sprd_soc_component = {
 
 static int sprd_soc_platform_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
+	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	if (ret)
+		dev_warn(&pdev->dev,
+			 "no reserved DMA memory for audio platform device\n");
+
 	ret = devm_snd_soc_register_component(&pdev->dev, &sprd_soc_component,
 					      NULL, 0);
 	if (ret)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
