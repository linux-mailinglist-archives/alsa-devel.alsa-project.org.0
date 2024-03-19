Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE25D87F92F
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Mar 2024 09:14:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1940D2BB7;
	Tue, 19 Mar 2024 09:14:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1940D2BB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710836068;
	bh=CNk2VPYgaHZVUWLkXbMZyzxsjX0YYQCq1bBFNAfMI2M=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=bfmA1WfC11zpwqeEg+OlEqjokx23rQxB4QyOTwkyxLbljmgKsILfkFq9tGXxRdW/I
	 uIHBSDFTzrYrt4ttknHYK9GZ/x8PfckwXiWgPjJNURFnHtQkArN1q7eoduaZQsfeMP
	 TZSFsLUJtUn7K1iS4kEGT7rtUYGewfV7vwBiu09k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ECFAF805F5; Tue, 19 Mar 2024 09:13:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EEF61F805F5;
	Tue, 19 Mar 2024 09:13:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C69BF8057F; Tue, 19 Mar 2024 09:08:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFD21F802DB
	for <alsa-devel@alsa-project.org>; Tue, 19 Mar 2024 09:07:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFD21F802DB
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5D955201E50;
	Tue, 19 Mar 2024 09:07:58 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 24E7B201364;
	Tue, 19 Mar 2024 09:07:58 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 10AD61820F76;
	Tue, 19 Mar 2024 16:07:55 +0800 (+08)
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
Subject: [PATCH v15 06/16] ASoC: fsl_easrc: register m2m platform device
Date: Tue, 19 Mar 2024 15:51:04 +0800
Message-Id: <1710834674-3285-7-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: YQZPVFYC47RNZBY2LGUIJ2JW7NS76PMB
X-Message-ID-Hash: YQZPVFYC47RNZBY2LGUIJ2JW7NS76PMB
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
Archived-At: <>
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

