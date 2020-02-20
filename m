Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C825166A47
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 23:21:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCFB116AC;
	Thu, 20 Feb 2020 23:20:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCFB116AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582237288;
	bh=65pe97zysSsFa4bOAOqI5q4+FonP19X0C/zqJrwQ8I8=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=E4YmZ4pl/co0P+SoyM1/ime0M80gCQ5CZYsIYboc4J6Vt+6CEALJnLkkQnihmL/+o
	 CmDzajNbOeDlhFd+/6gE//um/yPnJpXVO60KCuzktu8VkYTCAG87vL4VFTmBJeDCQN
	 zU6o6CNoalE+JedQZd3Y+nPPmWKr6Pgu3RpBLjNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C278F8028D;
	Thu, 20 Feb 2020 23:18:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AE11F80101; Thu, 20 Feb 2020 23:18:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 2E6DEF8027D
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 23:18:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E6DEF8027D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97E63328;
 Thu, 20 Feb 2020 14:18:41 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FD5E3F6CF;
 Thu, 20 Feb 2020 14:18:40 -0800 (PST)
Date: Thu, 20 Feb 2020 22:18:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Matthias Reichl <hias@horus.com>
Subject: Applied "ASoC: pcm512x: Fix unbalanced regulator enable call in probe
 error path" to the asoc tree
In-Reply-To: <20200220202956.29233-1-hias@horus.com>
Message-Id: <applied-20200220202956.29233-1-hias@horus.com>
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

   ASoC: pcm512x: Fix unbalanced regulator enable call in probe error path

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

From ac0a68997935c4acb92eaae5ad8982e0bb432d56 Mon Sep 17 00:00:00 2001
From: Matthias Reichl <hias@horus.com>
Date: Thu, 20 Feb 2020 21:29:56 +0100
Subject: [PATCH] ASoC: pcm512x: Fix unbalanced regulator enable call in probe
 error path

When we get a clock error during probe we have to call
regulator_bulk_disable before bailing out, otherwise we trigger
a warning in regulator_put.

Fix this by using "goto err" like in the error cases above.

Fixes: 5a3af1293194d ("ASoC: pcm512x: Add PCM512x driver")
Signed-off-by: Matthias Reichl <hias@horus.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200220202956.29233-1-hias@horus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/pcm512x.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index 861210f6bf4f..4cbef9affffd 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -1564,13 +1564,15 @@ int pcm512x_probe(struct device *dev, struct regmap *regmap)
 	}
 
 	pcm512x->sclk = devm_clk_get(dev, NULL);
-	if (PTR_ERR(pcm512x->sclk) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	if (PTR_ERR(pcm512x->sclk) == -EPROBE_DEFER) {
+		ret = -EPROBE_DEFER;
+		goto err;
+	}
 	if (!IS_ERR(pcm512x->sclk)) {
 		ret = clk_prepare_enable(pcm512x->sclk);
 		if (ret != 0) {
 			dev_err(dev, "Failed to enable SCLK: %d\n", ret);
-			return ret;
+			goto err;
 		}
 	}
 
-- 
2.20.1

