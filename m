Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0A54F2654
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 10:03:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E1431755;
	Tue,  5 Apr 2022 10:03:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E1431755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649145836;
	bh=vrkklU6eXc9jY4MlKXrGEaOA+Us/ldK8COVDSd8rih4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NpOXdNRNSkdRvUvnPywvh7kUhVmg2MrrlyqZLC0aiHvIXPiZ8CfpvQ7VBKubdaSI5
	 2qysopl8Eis1CpgEN9SxKcacDvQuQ5jrINeg5pjsRsRey5oa0iFdoAdmZKrDeHA4U2
	 TBpBE2/qf6H4j9riHiGFfj9muE81uVxo+TWEaosU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B6AFF8051E;
	Tue,  5 Apr 2022 10:00:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E79CFF8053D; Tue,  5 Apr 2022 10:00:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEC9CF80519
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 10:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEC9CF80519
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nbe6g-0003eU-CD; Tue, 05 Apr 2022 10:00:06 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nbe6g-001BHW-K2; Tue, 05 Apr 2022 10:00:05 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nbe6a-00BXZu-VO; Tue, 05 Apr 2022 10:00:00 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 06/20] ASoC: fsl_micfil: use clear/set bits
Date: Tue,  5 Apr 2022 09:59:45 +0200
Message-Id: <20220405075959.2744803-7-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220405075959.2744803-1-s.hauer@pengutronix.de>
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 dmaengine@vger.kernel.org, Shengjiu Wang <shengjiu.wang@gmail.com>
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

Instead regmap_update_bits() use the simpler variants
regmap_[set|clear]_bits() where appropriate.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/fsl/fsl_micfil.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index cfa8af668d921..70185f75d8a04 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -168,19 +168,15 @@ static int fsl_micfil_reset(struct device *dev)
 	struct fsl_micfil *micfil = dev_get_drvdata(dev);
 	int ret;
 
-	ret = regmap_update_bits(micfil->regmap,
-				 REG_MICFIL_CTRL1,
-				 MICFIL_CTRL1_MDIS,
-				 0);
+	ret = regmap_clear_bits(micfil->regmap, REG_MICFIL_CTRL1,
+				MICFIL_CTRL1_MDIS);
 	if (ret) {
 		dev_err(dev, "failed to clear MDIS bit %d\n", ret);
 		return ret;
 	}
 
-	ret = regmap_update_bits(micfil->regmap,
-				 REG_MICFIL_CTRL1,
-				 MICFIL_CTRL1_SRES,
-				 MICFIL_CTRL1_SRES);
+	ret = regmap_set_bits(micfil->regmap, REG_MICFIL_CTRL1,
+			      MICFIL_CTRL1_SRES);
 	if (ret) {
 		dev_err(dev, "failed to reset MICFIL: %d\n", ret);
 		return ret;
@@ -252,9 +248,8 @@ static int fsl_micfil_trigger(struct snd_pcm_substream *substream, int cmd,
 		}
 
 		/* Enable the module */
-		ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
-					 MICFIL_CTRL1_PDMIEN,
-					 MICFIL_CTRL1_PDMIEN);
+		ret = regmap_set_bits(micfil->regmap, REG_MICFIL_CTRL1,
+				      MICFIL_CTRL1_PDMIEN);
 		if (ret) {
 			dev_err(dev, "failed to enable the module\n");
 			return ret;
@@ -265,9 +260,8 @@ static int fsl_micfil_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		/* Disable the module */
-		ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
-					 MICFIL_CTRL1_PDMIEN,
-					 0);
+		ret = regmap_clear_bits(micfil->regmap, REG_MICFIL_CTRL1,
+					MICFIL_CTRL1_PDMIEN);
 		if (ret) {
 			dev_err(dev, "failed to enable the module\n");
 			return ret;
@@ -332,8 +326,8 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 	int ret;
 
 	/* 1. Disable the module */
-	ret = regmap_update_bits(micfil->regmap, REG_MICFIL_CTRL1,
-				 MICFIL_CTRL1_PDMIEN, 0);
+	ret = regmap_clear_bits(micfil->regmap, REG_MICFIL_CTRL1,
+				 MICFIL_CTRL1_PDMIEN);
 	if (ret) {
 		dev_err(dev, "failed to disable the module\n");
 		return ret;
-- 
2.30.2

