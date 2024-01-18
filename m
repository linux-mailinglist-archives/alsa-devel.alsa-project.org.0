Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 185FE831A4C
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 14:16:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6882BE64;
	Thu, 18 Jan 2024 14:16:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6882BE64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705583814;
	bh=CNk2VPYgaHZVUWLkXbMZyzxsjX0YYQCq1bBFNAfMI2M=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=KF81HRPNeB1H1jnXhwRZ8YPqw2qDNU+tuzB1t96/TjNlwXn0Sq4sUUuMK5GKe9pNW
	 +8ENL17jKWIzxLP4kNi11IQlPEiL7ZxOCpGsaf7ryRsnus9QFF4AEmzCsl6M9+zxUU
	 PsQwM1+8AzR9eLNqHFayxAvJAgXnv3z0jWIRu+4A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E07D5F80641; Thu, 18 Jan 2024 14:15:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0259CF80639;
	Thu, 18 Jan 2024 14:15:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5667F805F0; Thu, 18 Jan 2024 14:15:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99A18F8028D
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 14:14:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99A18F8028D
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 49CF01A17C4;
	Thu, 18 Jan 2024 14:14:57 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 129271A0762;
	Thu, 18 Jan 2024 14:14:57 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 0DDCE18002A2;
	Thu, 18 Jan 2024 21:14:54 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: hverkuil@xs4all.nl,
	sakari.ailus@iki.fi,
	tfiga@chromium.org,
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
Subject: [PATCH v12 05/15] ASoC: fsl_easrc: register m2m platform device
Date: Thu, 18 Jan 2024 20:31:58 +0800
Message-Id: <1705581128-4604-6-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
References: <1705581128-4604-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: IQ3JHMUBTHBKIMWJUVT5DFCKK54FB25L
X-Message-ID-Hash: IQ3JHMUBTHBKIMWJUVT5DFCKK54FB25L
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IQ3JHMUBTHBKIMWJUVT5DFCKK54FB25L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Register m2m platform device,that user can
use M2M feature.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_easrc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index cf7ad30a323b..ccbf45c7abf4 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -2075,6 +2075,7 @@ MODULE_DEVICE_TABLE(of, fsl_easrc_dt_ids);
 static int fsl_easrc_probe(struct platform_device *pdev)
 {
 	struct fsl_easrc_priv *easrc_priv;
+	struct fsl_asrc_m2m_pdata m2m_pdata;
 	struct device *dev = &pdev->dev;
 	struct fsl_asrc *easrc;
 	struct resource *res;
@@ -2190,6 +2191,19 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 		goto err_pm_disable;
 	}
 
+	m2m_pdata.asrc = easrc;
+	m2m_pdata.fmt_in = FSL_EASRC_FORMATS;
+	m2m_pdata.fmt_out = FSL_EASRC_FORMATS | SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE;
+	m2m_pdata.rate_min = 8000;
+	m2m_pdata.rate_max = 768000;
+	m2m_pdata.chan_min = 1;
+	m2m_pdata.chan_max = 32;
+	easrc->m2m_pdev = platform_device_register_data(&pdev->dev,
+							M2M_DRV_NAME,
+							PLATFORM_DEVID_AUTO,
+							&m2m_pdata,
+							sizeof(m2m_pdata));
+
 	return 0;
 
 err_pm_disable:
@@ -2199,6 +2213,11 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 
 static void fsl_easrc_remove(struct platform_device *pdev)
 {
+	struct fsl_asrc *easrc = dev_get_drvdata(&pdev->dev);
+
+	if (easrc->m2m_pdev && !IS_ERR(easrc->m2m_pdev))
+		platform_device_unregister(easrc->m2m_pdev);
+
 	pm_runtime_disable(&pdev->dev);
 }
 
-- 
2.34.1

