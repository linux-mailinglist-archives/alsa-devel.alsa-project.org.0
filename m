Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6303A3C12
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Jun 2021 08:38:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40130187A;
	Fri, 11 Jun 2021 08:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40130187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623393537;
	bh=UroxvAjc+NXxtTv3YkTx67R5pEqzHVBsZZVGIT2IyjY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OKF2bn7r1HdD0lDonL8Z8YpiLRMPEXvs+VbJAVIQnMkeTGxw16Yq8YzxJCwCqYIlO
	 WnAJ0c5dYGhdPpLSX75eQpiWzkR9+gRotUg77zb+Iyw7biHba+/vHJaRvGoGT3FLHH
	 7nKl9h7tRblzfzDMSB3CV2DSNeK+DpuZ2qPTe7sE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 522A6F80276;
	Fri, 11 Jun 2021 08:37:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 388D3F8026C; Fri, 11 Jun 2021 08:36:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D446AF800FB
 for <alsa-devel@alsa-project.org>; Fri, 11 Jun 2021 08:36:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D446AF800FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="dV2As57f"
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 40D111A08FB;
 Fri, 11 Jun 2021 08:36:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva020.eu-rdc02.nxp.com 40D111A08FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com;
 s=nselector3; t=1623393403;
 bh=x9r3mjo9myPoai+Ewzu7TLgGVipVL1jSKJszV5CRyXE=;
 h=From:To:Cc:Subject:Date:From;
 b=dV2As57fc9O82/cEtKmI6HJk0DPljB4jatogj/86XEAebYqRX/4RKpBOA9BePqIU5
 UIQgPE7SYQk9WQOueK2IzlTuiB7RxU0+8EEIRibVeDTKY3XU6MtbsBF04LVDA/otdn
 ihRvBSGAYbNbFYVGEfBtc6aFX5xeCLY/E3l5KyEaWFlq5ZOPJc+p+umtrWthrJK7Dv
 X4aKXtpPJNLGOrDWskniLL2Fp2Oxu4lpx1v69XtnAmLAihrFlHMNCgn+JIy3YOL3ik
 IZpRcSpHoaZiqjweEX1wi/MBJh//GC5T2rzSPlyotSY53hY+tdmuOX2VsjJ6awor90
 n/YZAd4UepYiQ==
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1DD841A0903;
 Fri, 11 Jun 2021 08:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 inva020.eu-rdc02.nxp.com 1DD841A0903
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 48C2740130;
 Fri, 11 Jun 2021 14:36:33 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_spdif: Fix error handler with pm_runtime_enable
Date: Fri, 11 Jun 2021 14:18:38 +0800
Message-Id: <1623392318-26304-1-git-send-email-shengjiu.wang@nxp.com>
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

There is error message when defer probe happens:

fsl-spdif-dai 2dab0000.spdif: Unbalanced pm_runtime_enable!

Fix the error handler with pm_runtime_enable and add
fsl_spdif_remove() for pm_runtime_disable.

Fixes: 9cb2b3796e08 ("ASoC: fsl_spdif: Add pm runtime function")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_spdif.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 2a76714eb8e6..76a7c9581333 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -1441,16 +1441,29 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 					      &spdif_priv->cpu_dai_drv, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register DAI: %d\n", ret);
-		return ret;
+		goto err_pm_disable;
 	}
 
 	ret = imx_pcm_dma_init(pdev, IMX_SPDIF_DMABUF_SIZE);
-	if (ret && ret != -EPROBE_DEFER)
-		dev_err(&pdev->dev, "imx_pcm_dma_init failed: %d\n", ret);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "imx_pcm_dma_init failed\n");
+		goto err_pm_disable;
+	}
+
+	return ret;
 
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
 	return ret;
 }
 
+static int fsl_spdif_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
 #ifdef CONFIG_PM
 static int fsl_spdif_runtime_suspend(struct device *dev)
 {
@@ -1554,6 +1567,7 @@ static struct platform_driver fsl_spdif_driver = {
 		.pm = &fsl_spdif_pm,
 	},
 	.probe = fsl_spdif_probe,
+	.remove = fsl_spdif_remove,
 };
 
 module_platform_driver(fsl_spdif_driver);
-- 
2.27.0

