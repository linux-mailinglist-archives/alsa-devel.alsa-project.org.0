Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 256C320CCDE
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 08:56:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87E391662;
	Mon, 29 Jun 2020 08:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87E391662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593413773;
	bh=/jsw4frLLxguJRbnHJ1q9sMgcDfhIw9OcZ/5kL+i20M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OBjo0NQ6R7yud7H0ADmlewi0/mP82j2JOYd15z1TazM09rUEHq3TDmpyeKSyKFuOf
	 h+Lcyv9E7eCCWe87xQDS9+Ls5CgDmZCX+VPqd12VIwRaekbkRzsOuibYCcCw0BlIFd
	 lJ0To7cXAjAhXzuoEqjFRXyrSStBlLzIvzjj2yas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B75D0F800EA;
	Mon, 29 Jun 2020 08:54:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 031D6F8020C; Mon, 29 Jun 2020 08:54:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A0DCF800EA
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 08:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A0DCF800EA
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B9ADB1A10E4;
 Mon, 29 Jun 2020 08:54:20 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6F80E1A01C6;
 Mon, 29 Jun 2020 08:54:15 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 179B8402F7;
 Mon, 29 Jun 2020 14:54:09 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_sai: Refine regcache usage with pm runtime
Date: Mon, 29 Jun 2020 14:42:33 +0800
Message-Id: <1593412953-10897-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

When there is dedicated power domain bound with device, after probing
the power will be disabled, then registers are not accessible in
fsl_sai_dai_probe(), so regcache only need to be enabled in end of
probe() and regcache_mark_dirty should be moved to pm runtime resume
callback function.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 9d436b0c5718..a22562f2df47 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1016,6 +1016,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, sai);
 
 	pm_runtime_enable(&pdev->dev);
+	regcache_cache_only(sai->regmap, true);
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_component,
 			&fsl_sai_dai, 1);
@@ -1107,7 +1108,6 @@ static int fsl_sai_runtime_suspend(struct device *dev)
 	clk_disable_unprepare(sai->bus_clk);
 
 	regcache_cache_only(sai->regmap, true);
-	regcache_mark_dirty(sai->regmap);
 
 	return 0;
 }
@@ -1137,6 +1137,7 @@ static int fsl_sai_runtime_resume(struct device *dev)
 	}
 
 	regcache_cache_only(sai->regmap, false);
+	regcache_mark_dirty(sai->regmap);
 	regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), FSL_SAI_CSR_SR);
 	regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), FSL_SAI_CSR_SR);
 	usleep_range(1000, 2000);
-- 
2.21.0

