Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B645D79FC1E
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 08:36:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88C86886;
	Thu, 14 Sep 2023 08:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88C86886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694673406;
	bh=Yq8tbYJbj5vr6WYa2kG18GPou1E4SbTBPHG8I5fbJyE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=pnzbxP07LOLI86TZ04of1Eij7NkF8pwnERWahNA/STByCH+oEPkwp17pgjsbDP3Zc
	 ozxpN6z+fIADGKCzT2kuKRzxsetGcX4SrI3rrlOGNE/zee197FDDvhMLPqnBuWa0SH
	 01Ts6ahGDUSuz4/ldVD6t2rc9xY/hn0X2NCcSym8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E878F805D6; Thu, 14 Sep 2023 08:33:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3E8EF805C4;
	Thu, 14 Sep 2023 08:33:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F404CF80246; Thu, 14 Sep 2023 08:32:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D7BAF80537
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 08:30:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D7BAF80537
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 99C2F1A0640;
	Thu, 14 Sep 2023 08:30:46 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 622241A0641;
	Thu, 14 Sep 2023 08:30:46 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 742091834869;
	Thu, 14 Sep 2023 14:30:44 +0800 (+08)
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
Subject: [RFC PATCH v3 5/9] ASoC: fsl_easrc: register m2m platform device
Date: Thu, 14 Sep 2023 13:54:01 +0800
Message-Id: <1694670845-17070-6-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1694670845-17070-1-git-send-email-shengjiu.wang@nxp.com>
References: <1694670845-17070-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: GRS4HTKD55KUSYNHHDDKLXXBHBITJWCX
X-Message-ID-Hash: GRS4HTKD55KUSYNHHDDKLXXBHBITJWCX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GRS4HTKD55KUSYNHHDDKLXXBHBITJWCX/>
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
---
 sound/soc/fsl/fsl_easrc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index f517b407672d..b719d517f9b4 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -2084,6 +2084,7 @@ MODULE_DEVICE_TABLE(of, fsl_easrc_dt_ids);
 static int fsl_easrc_probe(struct platform_device *pdev)
 {
 	struct fsl_easrc_priv *easrc_priv;
+	struct fsl_asrc_m2m_pdata m2m_pdata;
 	struct device *dev = &pdev->dev;
 	struct fsl_asrc *easrc;
 	struct resource *res;
@@ -2202,11 +2203,23 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	m2m_pdata.asrc = easrc;
+	easrc->m2m_pdev = platform_device_register_data(&pdev->dev,
+							M2M_DRV_NAME,
+							PLATFORM_DEVID_AUTO,
+							&m2m_pdata,
+							sizeof(m2m_pdata));
+
 	return 0;
 }
 
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

