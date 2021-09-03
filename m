Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2433FFE80
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 12:54:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2261F180D;
	Fri,  3 Sep 2021 12:53:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2261F180D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630666472;
	bh=s/n32y+65l2o1fK+MoIOFUYc4M7xhDHjo/Vi3ep2eIE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JXsMbNpDqr2x4NQ9dmqv1/iV9XNGlCCDnSWcVsuMjErH27RvtGPSmg4yARieLz/Ux
	 ldXRCKu5h6jwfJFTFQidpQEDc/et8fQL1FCRpwCD2fKsZ6JuZUFu5/Mc8hTf9QIe3k
	 NMkjtWj/GALHiGedNPnfRghNK1BNVs/ErCaSCRrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB48EF804E3;
	Fri,  3 Sep 2021 12:52:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28D7FF80423; Fri,  3 Sep 2021 12:52:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2325F800B5
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 12:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2325F800B5
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 21C3F1A3028;
 Fri,  3 Sep 2021 12:52:45 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id DE2561A301F;
 Fri,  3 Sep 2021 12:52:44 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 79548183AC89;
 Fri,  3 Sep 2021 18:52:43 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH for-5.15 1/5] ASoC: fsl_sai: register platform component
 before registering cpu dai
Date: Fri,  3 Sep 2021 18:30:02 +0800
Message-Id: <1630665006-31437-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630665006-31437-1-git-send-email-shengjiu.wang@nxp.com>
References: <1630665006-31437-1-git-send-email-shengjiu.wang@nxp.com>
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

Fixes: 435508214942 ("ASoC: Add SAI SoC Digital Audio Interface driver")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 223fcd15bfcc..38f6362099d5 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1152,11 +1152,10 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_pm_get_sync;
 
-	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_component,
-					      &sai->cpu_dai_drv, 1);
-	if (ret)
-		goto err_pm_get_sync;
-
+	/*
+	 * Register platform component before registering cpu dai for there
+	 * is not defer probe for platform component in snd_soc_add_pcm_runtime().
+	 */
 	if (sai->soc_data->use_imx_pcm) {
 		ret = imx_pcm_dma_init(pdev, IMX_SAI_DMABUF_SIZE);
 		if (ret)
@@ -1167,6 +1166,11 @@ static int fsl_sai_probe(struct platform_device *pdev)
 			goto err_pm_get_sync;
 	}
 
+	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_component,
+					      &sai->cpu_dai_drv, 1);
+	if (ret)
+		goto err_pm_get_sync;
+
 	return ret;
 
 err_pm_get_sync:
-- 
2.17.1

