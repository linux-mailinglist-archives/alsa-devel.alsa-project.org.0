Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB518988044
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2024 10:24:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79EE784A;
	Fri, 27 Sep 2024 10:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79EE784A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727425481;
	bh=uAZu7jgOYOp5A+s3eueNH7j+KtpbzDNYf4Ayr4G5EaY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=YaBI2g4lDXj+wjWo1pHE3vf2+E4q+e6jzAOGSGB9uQMx1OH+wNDuA7GZfCDuhuQo0
	 PiZOPeNF0ydG8EOF1nPOtnHN2BfsWZ124e8VLORXxfhJPNGbXctVB0eoYYKzNgOqBw
	 ThXCdg9r5nWYrIifpn63b83+o0VQmgz+uSXbI+S0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69E42F80621; Fri, 27 Sep 2024 10:23:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2FD2F8060B;
	Fri, 27 Sep 2024 10:23:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5282CF802DB; Fri, 27 Sep 2024 10:23:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4661DF80107
	for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2024 10:23:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4661DF80107
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EC9A2201A2A;
	Fri, 27 Sep 2024 10:23:15 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B0453201A52;
	Fri, 27 Sep 2024 10:23:15 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 18AAD183DC03;
	Fri, 27 Sep 2024 16:23:14 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ASoC: fsl_micfil: Enable micfil error interrupt
Date: Fri, 27 Sep 2024 16:00:31 +0800
Message-Id: <1727424031-19551-4-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1727424031-19551-1-git-send-email-shengjiu.wang@nxp.com>
References: <1727424031-19551-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: HGGJXL5JWAE3BSPVWQDBPNDDWCDGCEVQ
X-Message-ID-Hash: HGGJXL5JWAE3BSPVWQDBPNDDWCDGCEVQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HGGJXL5JWAE3BSPVWQDBPNDDWCDGCEVQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Enable micfil error interrupt, in the error handler,
FIFO state and OUT state need to be cleared.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 6ecf46e9ac4c..0930d8c9b8d7 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -651,7 +651,7 @@ static int fsl_micfil_trigger(struct snd_pcm_substream *substream, int cmd,
 
 		/* Enable the module */
 		ret = regmap_set_bits(micfil->regmap, REG_MICFIL_CTRL1,
-				      MICFIL_CTRL1_PDMIEN);
+				      MICFIL_CTRL1_PDMIEN | MICFIL_CTRL1_ERREN);
 		if (ret)
 			return ret;
 
@@ -667,7 +667,7 @@ static int fsl_micfil_trigger(struct snd_pcm_substream *substream, int cmd,
 
 		/* Disable the module */
 		ret = regmap_clear_bits(micfil->regmap, REG_MICFIL_CTRL1,
-					MICFIL_CTRL1_PDMIEN);
+					MICFIL_CTRL1_PDMIEN | MICFIL_CTRL1_ERREN);
 		if (ret)
 			return ret;
 
@@ -940,6 +940,7 @@ static bool fsl_micfil_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case REG_MICFIL_STAT:
+	case REG_MICFIL_FIFO_STAT:
 	case REG_MICFIL_DATACH0:
 	case REG_MICFIL_DATACH1:
 	case REG_MICFIL_DATACH2:
@@ -948,6 +949,7 @@ static bool fsl_micfil_volatile_reg(struct device *dev, unsigned int reg)
 	case REG_MICFIL_DATACH5:
 	case REG_MICFIL_DATACH6:
 	case REG_MICFIL_DATACH7:
+	case REG_MICFIL_OUT_STAT:
 	case REG_MICFIL_VERID:
 	case REG_MICFIL_PARAM:
 	case REG_MICFIL_VAD0_STAT:
@@ -1024,6 +1026,8 @@ static irqreturn_t micfil_err_isr(int irq, void *devid)
 {
 	struct fsl_micfil *micfil = (struct fsl_micfil *)devid;
 	struct platform_device *pdev = micfil->pdev;
+	u32 fifo_stat_reg;
+	u32 out_stat_reg;
 	u32 stat_reg;
 
 	regmap_read(micfil->regmap, REG_MICFIL_STAT, &stat_reg);
@@ -1040,6 +1044,14 @@ static irqreturn_t micfil_err_isr(int irq, void *devid)
 				  MICFIL_STAT_LOWFREQF, MICFIL_STAT_LOWFREQF);
 	}
 
+	regmap_read(micfil->regmap, REG_MICFIL_FIFO_STAT, &fifo_stat_reg);
+	regmap_write_bits(micfil->regmap, REG_MICFIL_FIFO_STAT,
+			  fifo_stat_reg, fifo_stat_reg);
+
+	regmap_read(micfil->regmap, REG_MICFIL_OUT_STAT, &out_stat_reg);
+	regmap_write_bits(micfil->regmap, REG_MICFIL_OUT_STAT,
+			  out_stat_reg, out_stat_reg);
+
 	return IRQ_HANDLED;
 }
 
-- 
2.34.1

