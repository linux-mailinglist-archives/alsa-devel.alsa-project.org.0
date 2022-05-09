Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A09351F819
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 11:27:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11F1318D5;
	Mon,  9 May 2022 11:26:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11F1318D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652088455;
	bh=Djit+szieYXzesayKvV08N4xNcvrrv37P+cgiXUG57I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ckQAO5IWwB7reOht4KMdmCbHjUx7bODzfm1hOy/suGLzW1DQU7iMGbh0hs23eAkJu
	 yVevGkGZd2wYh5/FENCNSiexkLhZbyDGSofpRBV553LyvN2xgVhj3WHdEbz3Q1bu3t
	 99lL0E/juK8JZlNTtbD4badnNmkxE6IcrHfcezHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A754F80269;
	Mon,  9 May 2022 11:26:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A458F80269; Mon,  9 May 2022 11:26:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01A22F8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 11:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01A22F8014C
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3248F200E75;
 Mon,  9 May 2022 11:26:27 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id F09C3200E74;
 Mon,  9 May 2022 11:26:26 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 510B9180031C;
 Mon,  9 May 2022 17:26:25 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: fsl_micfil: Add support for i.MX8MPlus
Date: Mon,  9 May 2022 17:14:22 +0800
Message-Id: <1652087663-1908-1-git-send-email-shengjiu.wang@nxp.com>
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

On i.MX8Plus there are two updates for micfil module.

One is that the output format is S32_LE, only the 24 more
significative bits have information, the other bits are always
zero. Add 'formats' variable in soc data to distinguish the
format on different platform.
Another is that the fifo depth is 32 entries.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index e4d1da55293e..25c647ae080a 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -55,6 +55,7 @@ struct fsl_micfil_soc_data {
 	unsigned int fifo_depth;
 	unsigned int dataline;
 	bool imx;
+	u64  formats;
 };
 
 static struct fsl_micfil_soc_data fsl_micfil_imx8mm = {
@@ -62,10 +63,20 @@ static struct fsl_micfil_soc_data fsl_micfil_imx8mm = {
 	.fifos = 8,
 	.fifo_depth = 8,
 	.dataline =  0xf,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE,
+};
+
+static struct fsl_micfil_soc_data fsl_micfil_imx8mp = {
+	.imx = true,
+	.fifos = 8,
+	.fifo_depth = 32,
+	.dataline =  0xf,
+	.formats = SNDRV_PCM_FMTBIT_S32_LE,
 };
 
 static const struct of_device_id fsl_micfil_dt_ids[] = {
 	{ .compatible = "fsl,imx8mm-micfil", .data = &fsl_micfil_imx8mm },
+	{ .compatible = "fsl,imx8mp-micfil", .data = &fsl_micfil_imx8mp },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_micfil_dt_ids);
@@ -659,6 +670,8 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	fsl_micfil_dai.capture.formats = micfil->soc->formats;
+
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_micfil_component,
 					      &fsl_micfil_dai, 1);
 	if (ret) {
-- 
2.17.1

