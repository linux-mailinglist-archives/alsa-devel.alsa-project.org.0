Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CAE741E04
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 04:12:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A597B84A;
	Thu, 29 Jun 2023 04:11:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A597B84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688004751;
	bh=3sGFug+NvgAFN3k5HnauHm2aPnOTjtfZadwZ5UtUyQ4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NYgEXkNjz6Av/sUuXk1AEQ4Lr3pdd/KyRnHYttP3x8DMTMj14Fer5f2n4RjoYQI9m
	 q/ebxbqBGP07XeAtRBSLToWwn6m/LaQj339pdo7o7GzDSrTtYvH15aMfNFihj4VO5N
	 pl99a3frn9pzZQaFwSNyiixfTB1pksgO043PRoTM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8087BF8057B; Thu, 29 Jun 2023 04:11:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D49C0F80564;
	Thu, 29 Jun 2023 04:11:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD5E0F80551; Thu, 29 Jun 2023 04:11:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 756A2F8051E
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 04:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 756A2F8051E
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 222B4200D56;
	Thu, 29 Jun 2023 04:10:40 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DF4AA200D42;
	Thu, 29 Jun 2023 04:10:39 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 2919D181D0E5;
	Thu, 29 Jun 2023 10:10:38 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/6] ASoC: fsl_easrc: enable memory to memory function
Date: Thu, 29 Jun 2023 09:37:53 +0800
Message-Id: <1688002673-28493-7-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: U24XMVUIIDNDHVG2UZ36F3QN7ZEULPDI
X-Message-ID-Hash: U24XMVUIIDNDHVG2UZ36F3QN7ZEULPDI
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U24XMVUIIDNDHVG2UZ36F3QN7ZEULPDI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Intergrate memory to memory feature to EASRC driver.
call m2m probe(), remove(), suspend() and resume()
in different callback.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_easrc.c | 41 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index b735b24badc2..bc5404627032 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -29,6 +29,7 @@
 #include <sound/core.h>
 
 #include "fsl_easrc.h"
+#include "fsl_asrc_m2m.h"
 #include "imx-pcm.h"
 
 #define FSL_EASRC_FORMATS       (SNDRV_PCM_FMTBIT_S16_LE | \
@@ -2190,11 +2191,21 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* probe the m2m feature */
+	ret = fsl_asrc_m2m_probe(easrc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to init m2m device %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
 static void fsl_easrc_remove(struct platform_device *pdev)
 {
+	/* remove the m2m feature */
+	fsl_asrc_m2m_remove(pdev);
+
 	pm_runtime_disable(&pdev->dev);
 }
 
@@ -2295,12 +2306,38 @@ static __maybe_unused int fsl_easrc_runtime_resume(struct device *dev)
 	return ret;
 }
 
+static int __maybe_unused fsl_easrc_suspend(struct device *dev)
+{
+	struct fsl_asrc *easrc = dev_get_drvdata(dev);
+	int ret;
+
+	/* suspend m2m function first */
+	fsl_asrc_m2m_suspend(easrc);
+
+	ret = pm_runtime_force_suspend(dev);
+
+	return ret;
+}
+
+static int __maybe_unused fsl_easrc_resume(struct device *dev)
+{
+	struct fsl_asrc *easrc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+
+	/* resume m2m function */
+	fsl_asrc_m2m_resume(easrc);
+
+	return ret;
+}
+
 static const struct dev_pm_ops fsl_easrc_pm_ops = {
 	SET_RUNTIME_PM_OPS(fsl_easrc_runtime_suspend,
 			   fsl_easrc_runtime_resume,
 			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(fsl_easrc_suspend,
+				fsl_easrc_resume)
 };
 
 static struct platform_driver fsl_easrc_driver = {
-- 
2.34.1

