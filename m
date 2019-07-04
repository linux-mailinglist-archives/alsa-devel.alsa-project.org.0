Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCE25F813
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 14:26:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A9CE16AB;
	Thu,  4 Jul 2019 14:25:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A9CE16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562243206;
	bh=Kd+i+Uea9S5UkWzsd/43LG/GnK6v4IRE9zafe+4bQdY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=QHmh7qVTc4pFRqCi/ohGLyMv+P6MBXZkstGoMjN2Cku4xFH52K6RV7Byx8QzHxdtn
	 9tteDuEoNAMNSxptiTNQzqCfohlIef/GZP0PyIzZDIDlpGJrJb/rdQMSHFgNgZC/a7
	 9pJuVvdJvgGqYLMDxtLMBxxMDqxyTwRHd8sl/a10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E246F80112;
	Thu,  4 Jul 2019 14:25:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E77DF80113; Thu,  4 Jul 2019 14:24:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A1EDF800E7
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 14:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A1EDF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="mME/WHLe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=TaEdpu8fLPkKL0kZ+JnMI3jHrHog2Qggja65RVLMLJo=; b=mME/WHLerG1M
 D9+VLGGwbIYYR56mqA0lokhym8J3jbdvsRs8UD7bZ6QCsrhMyDcd6luF/6/8YwswcQ4Q5OkrzE712
 p2ebh5DiTIaKsqyux82vDKvxTLJW4nfNUtvbJSZPv0EHQ8kGD7YOJvoZvWjfg10hrGpBPnS+d4YQo
 H2x6k=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hj0nG-0000ib-P5; Thu, 04 Jul 2019 12:24:54 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 3E05A274388A; Thu,  4 Jul 2019 13:24:54 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20190703123002.12427-1-srinivas.kandagatla@linaro.org>
X-Patchwork-Hint: ignore
Message-Id: <20190704122454.3E05A274388A@ypsilon.sirena.org.uk>
Date: Thu,  4 Jul 2019 13:24:54 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com
Subject: [alsa-devel] Applied "ASoC: core: Return -ENOTSUPP from
	set_channel_map() if no operation provided" to the asoc tree
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

   ASoC: core: Return -ENOTSUPP from set_channel_map() if no operation provided

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 74b35a74f80e02bdd69db9cf96d3f4fe78b67064 Mon Sep 17 00:00:00 2001
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 3 Jul 2019 13:30:02 +0100
Subject: [PATCH] ASoC: core: Return -ENOTSUPP from set_channel_map() if no
 operation provided

It makes it easier for common code to work with snd_soc_dai_set_channel_map()
by distinguishing between operation not being supported and an error.
This is done inline with others snd_soc_dai.* apis.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Link: https://lore.kernel.org/r/20190703123002.12427-1-srinivas.kandagatla@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b9061cd8d787..c0a774d0a5ff 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2614,7 +2614,7 @@ int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
 		return dai->driver->ops->set_channel_map(dai, tx_num, tx_slot,
 			rx_num, rx_slot);
 	else
-		return -EINVAL;
+		return -ENOTSUPP;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_channel_map);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
