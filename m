Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8835B83B6
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 11:02:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA59E182F;
	Wed, 14 Sep 2022 11:02:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA59E182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663146177;
	bh=SZXFFr6fQE4QYpoEaaMaZI/GyemsfR2Ojv/xm40sKWw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IdXG2BUdE/jc5BkmCCJP3simwqeF1KmxGJyJODtaPa5/Vd4D1aRX1WUBmv0xRkIY6
	 uC2QMFD0da1GZaJsiBr53D35FMDZtohSGCE3vJ/pzxhiPyL12EwzrsthruKmZbcKmA
	 Dbq5HhN/TzkBLs5vXokMtDZHelJw3JT97Lg2Ob1o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC32FF800FE;
	Wed, 14 Sep 2022 11:01:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E9F3F80507; Wed, 14 Sep 2022 11:01:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC63EF800FE
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 11:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC63EF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SBeoQ035"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E6DB561999;
 Wed, 14 Sep 2022 09:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4E2C433B5;
 Wed, 14 Sep 2022 09:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663146083;
 bh=SZXFFr6fQE4QYpoEaaMaZI/GyemsfR2Ojv/xm40sKWw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SBeoQ0352di0SC94Yge257rfx+gw9hYXb9XSgAdJkagbrVq9iC98hX26J7x9PdPNn
 6MhCoMrICFvWBaG92Ul53ie1+rK5RC8JC4hEfN9CPFo4kiDPPg8UW9qg1+VEEWAPBo
 K4MhRod+xfO5SYjeH6qsXkypLp9RhZpPWlvO0uUuKmdbjLDmqi0BvvOt2Ct/fnNzPP
 SxXvxvRxM1HPP8AERqRrFzXgPefW0bj2NoifP51A2FktKNdzXEQMifMhMnJifIYhAf
 19y2p6jMUxPrElIeKnkCJ0mt1pOOa6qnRb9iz2B+t29AG/SuvVQAfMzkwESKdxosoj
 YqAMIyg/2OF5w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 05/22] ASoC: fsl_aud2htx: register platform
 component before registering cpu dai
Date: Wed, 14 Sep 2022 05:00:46 -0400
Message-Id: <20220914090103.470630-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220914090103.470630-1-sashal@kernel.org>
References: <20220914090103.470630-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, shengjiu.wang@gmail.com
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

From: Shengjiu Wang <shengjiu.wang@nxp.com>

[ Upstream commit ea532c29972df96fda20393d9bf057e898f5e965 ]

There is no defer probe when adding platform component to
snd_soc_pcm_runtime(rtd), the code is in snd_soc_add_pcm_runtime()

snd_soc_register_card()
  -> snd_soc_bind_card()
    -> snd_soc_add_pcm_runtime()
      -> adding cpu dai
      -> adding codec dai
      -> adding platform component.

So if the platform component is not ready at that time, then the
sound card still registered successfully, but platform component
is empty, the sound card can't be used.

As there is defer probe checking for cpu dai component, then register
platform component before cpu dai to avoid such issue.

And the behavior of imx_pcm_dma_init() is same as common
devm_snd_dmaengine_pcm_register(), so use
devm_snd_dmaengine_pcm_register() instead

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Link: https://lore.kernel.org/r/1661430460-5234-1-git-send-email-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl_aud2htx.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
index 422922146f2a5..e09015e7e3c7c 100644
--- a/sound/soc/fsl/fsl_aud2htx.c
+++ b/sound/soc/fsl/fsl_aud2htx.c
@@ -233,6 +233,16 @@ static int fsl_aud2htx_probe(struct platform_device *pdev)
 
 	regcache_cache_only(aud2htx->regmap, true);
 
+	/*
+	 * Register platform component before registering cpu dai for there
+	 * is not defer probe for platform component in snd_soc_add_pcm_runtime().
+	 */
+	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to pcm register\n");
+		return ret;
+	}
+
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &fsl_aud2htx_component,
 					      &fsl_aud2htx_dai, 1);
@@ -241,10 +251,6 @@ static int fsl_aud2htx_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = imx_pcm_dma_init(pdev);
-	if (ret)
-		dev_err(&pdev->dev, "failed to init imx pcm dma: %d\n", ret);
-
 	return ret;
 }
 
-- 
2.35.1

