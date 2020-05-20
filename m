Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE691DADAB
	for <lists+alsa-devel@lfdr.de>; Wed, 20 May 2020 10:37:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DA0417C8;
	Wed, 20 May 2020 10:36:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DA0417C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589963833;
	bh=Whu6GD/mpG0mnI9Z9VloU659PAhB6g5knuD1/B/m8Rg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oVMBO1Q14kPslNmUIiCB6sT+P9/uB4GRl+Honm15AecBta12LeCVjdjXLOz3anQ72
	 fwvhtogxW1FSaxVVUAJO8BvIn2K9y/ZbLmYap5ogPeIldYi7L9/dRa1hX9jrupxsHI
	 pbYOS69m/Uilcpzm56W9DxCyj44FUfowj7DYjNpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 522A0F80132;
	Wed, 20 May 2020 10:35:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9262F801F9; Wed, 20 May 2020 10:35:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_PASS, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from v6.sk (v6.sk [167.172.42.174])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43B1BF80132
 for <alsa-devel@alsa-project.org>; Wed, 20 May 2020 10:35:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43B1BF80132
Received: from localhost (v6.sk [IPv6:::1])
 by v6.sk (Postfix) with ESMTP id 4F4C661300;
 Wed, 20 May 2020 08:35:20 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: mmp-sspa: Fix the error handling in probe()
Date: Wed, 20 May 2020 10:35:16 +0200
Message-Id: <20200520083516.2120802-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Lubomir Rintel <lkundrak@v3.sk>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org
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

If we fail after pm_runtime_enable(), we fail to undo it. Same with
clk_prepare_enable(). Let's order them after all things that can fail.

Fixes: 7d98cc648253 ("ASoC: mmp-sspa: Add support for the runtime power management")
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 sound/soc/pxa/mmp-sspa.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 60bf6fe05315..77a6d2998570 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -467,6 +467,7 @@ static const struct snd_soc_component_driver mmp_sspa_component = {
 static int asoc_mmp_sspa_probe(struct platform_device *pdev)
 {
 	struct sspa_priv *sspa;
+	int ret;
 
 	sspa = devm_kzalloc(&pdev->dev,
 				sizeof(struct sspa_priv), GFP_KERNEL);
@@ -518,8 +519,6 @@ static int asoc_mmp_sspa_probe(struct platform_device *pdev)
 			return PTR_ERR(sspa->sysclk);
 		}
 	}
-	pm_runtime_enable(&pdev->dev);
-	clk_prepare_enable(sspa->audio_clk);
 	platform_set_drvdata(pdev, sspa);
 
 	sspa->playback_dma_data.maxburst = 4;
@@ -529,16 +528,21 @@ static int asoc_mmp_sspa_probe(struct platform_device *pdev)
 	sspa->playback_dma_data.addr = 0x80 + SSPA_D;
 
 	if (pdev->dev.of_node) {
-		int ret;
-
 		ret = devm_snd_dmaengine_pcm_register(&pdev->dev,
 						      &mmp_pcm_config, 0);
 		if (ret)
 			return ret;
 	}
 
-	return devm_snd_soc_register_component(&pdev->dev, &mmp_sspa_component,
-					       &mmp_sspa_dai, 1);
+	ret = devm_snd_soc_register_component(&pdev->dev, &mmp_sspa_component,
+					      &mmp_sspa_dai, 1);
+	if (ret)
+		return ret;
+
+	pm_runtime_enable(&pdev->dev);
+	clk_prepare_enable(sspa->audio_clk);
+
+	return 0;
 }
 
 static int asoc_mmp_sspa_remove(struct platform_device *pdev)
-- 
2.26.2

