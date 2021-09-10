Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EE6406592
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Sep 2021 04:13:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8721316A8;
	Fri, 10 Sep 2021 04:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8721316A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631240036;
	bh=xPpW1clTMYZGQxG8LHeVaC0gc0uYKRBpHZbew/JseFw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bC+WSPgLedO2CEIJppiZCKM/DXx95LWSBEhheIKzKhsVSlbPcmP9xKF4yt7lkqpOB
	 4RXZ4FF4SXd2h+D89akQUcO9o4kr/7BGL4b5KMOz5OCWWmwPng9k8WfaiUIc1GLLmJ
	 tuZek5FSolfNdv81ogIL56mWQ0j04LSwXF2BYoXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C25E5F8049C;
	Fri, 10 Sep 2021 04:12:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0702F8026C; Fri, 10 Sep 2021 04:12:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97C68F80143
 for <alsa-devel@alsa-project.org>; Fri, 10 Sep 2021 04:12:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97C68F80143
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CA1BE1A5FED;
 Fri, 10 Sep 2021 04:12:28 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 92D251A0AD8;
 Fri, 10 Sep 2021 04:12:28 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 22F50183AD05;
 Fri, 10 Sep 2021 10:12:27 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_spdif: Add support for i.MX8ULP
Date: Fri, 10 Sep 2021 09:49:22 +0800
Message-Id: <1631238562-27081-1-git-send-email-shengjiu.wang@nxp.com>
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

On i.MX8ULP the spdif works with EDMA, so add compatible
string and soc specific data for i.MX8ULP.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_spdif.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 8ffb1a6048d6..61ba08322f23 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -186,6 +186,16 @@ static struct fsl_spdif_soc_data fsl_spdif_imx8mm = {
 	.tx_formats = FSL_SPDIF_FORMATS_PLAYBACK,
 };
 
+static struct fsl_spdif_soc_data fsl_spdif_imx8ulp = {
+	.imx = true,
+	.shared_root_clock = true,
+	.raw_capture_mode = false,
+	.interrupts = 1,
+	.tx_burst = 2,		/* Applied for EDMA */
+	.rx_burst = 2,		/* Applied for EDMA */
+	.tx_formats = SNDRV_PCM_FMTBIT_S24_LE,	/* Applied for EDMA */
+};
+
 /* Check if clk is a root clock that does not share clock source with others */
 static inline bool fsl_spdif_can_set_clk_rate(struct fsl_spdif_priv *spdif, int clk)
 {
@@ -1556,6 +1566,7 @@ static const struct of_device_id fsl_spdif_dt_ids[] = {
 	{ .compatible = "fsl,imx6sx-spdif", .data = &fsl_spdif_imx6sx, },
 	{ .compatible = "fsl,imx8qm-spdif", .data = &fsl_spdif_imx8qm, },
 	{ .compatible = "fsl,imx8mm-spdif", .data = &fsl_spdif_imx8mm, },
+	{ .compatible = "fsl,imx8ulp-spdif", .data = &fsl_spdif_imx8ulp, },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_spdif_dt_ids);
-- 
2.17.1

