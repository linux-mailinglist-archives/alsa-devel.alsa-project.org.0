Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9775726D388
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 08:20:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F89582E;
	Thu, 17 Sep 2020 08:19:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F89582E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600323645;
	bh=pllwI9HDnEIZsO1u0gjbqZqNRGtgSaKPgeHgnqiuRvM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TFfqCY0XH9XspZGuRw9rX+jZWgs6nJBMfKZ+2y8i3s6o1j2+NrfS/7WQjm9w8jrvN
	 QR0cYdse78/uiDhI6W3+/z/LE8uECLu2TMjTmBg9/+sjaLtD8FW51CVODGo10oseXy
	 SDoAI9GoF/ty0tIArJOmE/wHjBm6FZy5rzCKDq70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C48AFF802BD;
	Thu, 17 Sep 2020 08:18:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F04DF801EC; Thu, 17 Sep 2020 08:18:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E1D1F801EC
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 08:18:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E1D1F801EC
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 9EF45201507;
 Thu, 17 Sep 2020 08:18:13 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2BB9D2000B5;
 Thu, 17 Sep 2020 08:18:09 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 8CAE5402AE;
 Thu, 17 Sep 2020 08:18:03 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com
Subject: [PATCH v2 3/3] ASoC: fsl_sai: Set MCLK input or output direction
Date: Thu, 17 Sep 2020 14:11:19 +0800
Message-Id: <1600323079-5317-4-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600323079-5317-1-git-send-email-shengjiu.wang@nxp.com>
References: <1600323079-5317-1-git-send-email-shengjiu.wang@nxp.com>
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

SAI support select MCLK direction with version.major > 3
and version.minor > 1, the default direction is input,
set it to be output according to DT property.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 738b4dda7847..5117c1cd5682 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1117,6 +1117,13 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (ret < 0)
 		dev_warn(&pdev->dev, "Error reading SAI version: %d\n", ret);
 
+	/* Select MCLK direction */
+	if (of_find_property(np, "fsl,sai-mclk-direction-output", NULL) &&
+	    sai->verid.major >= 3 && sai->verid.minor >= 1) {
+		regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
+				   FSL_SAI_MCTL_MCLK_EN, FSL_SAI_MCTL_MCLK_EN);
+	}
+
 	pm_runtime_enable(&pdev->dev);
 	regcache_cache_only(sai->regmap, true);
 
-- 
2.27.0

