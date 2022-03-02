Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0EE4CA045
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 10:05:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C42AB27F2;
	Wed,  2 Mar 2022 10:05:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C42AB27F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646211953;
	bh=dnp/BB7YYzg9U2nptUa9uKvSwboYq30Fbt9HLKoYiPs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PJBVntZrjoExqxa59f6zRnzETHllOV1lyanGvfSmB5DN3elCJFAdkwAdk4INjC0Ds
	 hQzZk9MxcTyPWfWlSeqyWoCLW/3g/bpMK/ie/C3dd2ulQDrGDeFNPv0vKbOI0X+76y
	 BF6J66EcAz0W1g5FJ5Wwu1+TSXb4fNF1myfECmlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E23AEF896F9;
	Wed,  2 Mar 2022 09:35:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30EE6F896E9; Wed,  2 Mar 2022 09:34:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76ED9F89636
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 09:34:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76ED9F89636
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nPKRL-0005uV-9R; Wed, 02 Mar 2022 09:34:31 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nPKRK-00Fxna-Du; Wed, 02 Mar 2022 09:34:30 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/7] ASoC: fsl_sai: store full version instead of major/minor
Date: Wed,  2 Mar 2022 09:34:25 +0100
Message-Id: <20220302083428.3804687-5-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220302083428.3804687-1-s.hauer@pengutronix.de>
References: <20220302083428.3804687-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Nicolin Chen <nicoleotsuka@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 kernel@pengutronix.de, Xiubo Li <Xiubo.Lee@gmail.com>
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

The driver tests for the hardware revision being newer than 3.1
with (sai->verid.major >= 3 && sai->verid.minor >= 1). The result
is obviously wrong for hardware revision 4.0. Fix this by storing
the full version in a single variable and comparing to that one.
No practical change at the moment as there is no 4.0 ip version
currently.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/fsl/fsl_sai.c | 8 +++-----
 sound/soc/fsl/fsl_sai.h | 6 ++----
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 5f627ccd172b2..2544fd363e24d 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -958,10 +958,8 @@ static int fsl_sai_check_version(struct device *dev)
 
 	dev_dbg(dev, "VERID: 0x%016X\n", val);
 
-	sai->verid.major = (val & FSL_SAI_VERID_MAJOR_MASK) >>
-			   FSL_SAI_VERID_MAJOR_SHIFT;
-	sai->verid.minor = (val & FSL_SAI_VERID_MINOR_MASK) >>
-			   FSL_SAI_VERID_MINOR_SHIFT;
+	sai->verid.version = val &
+		(FSL_SAI_VERID_MAJOR_MASK | FSL_SAI_VERID_MINOR_MASK);
 	sai->verid.feature = val & FSL_SAI_VERID_FEATURE_MASK;
 
 	ret = regmap_read(sai->regmap, FSL_SAI_PARAM, &val);
@@ -1133,7 +1131,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	/* Select MCLK direction */
 	if (of_find_property(np, "fsl,sai-mclk-direction-output", NULL) &&
-	    sai->verid.major >= 3 && sai->verid.minor >= 1) {
+	    sai->verid.version >= 0x0301) {
 		regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
 				   FSL_SAI_MCTL_MCLK_EN, FSL_SAI_MCTL_MCLK_EN);
 	}
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 4e76ae43d1968..8c315bf61564d 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -226,15 +226,13 @@ struct fsl_sai_soc_data {
 
 /**
  * struct fsl_sai_verid - version id data
- * @major: major version number
- * @minor: minor version number
+ * @version: version number
  * @feature: feature specification number
  *           0000000000000000b - Standard feature set
  *           0000000000000000b - Standard feature set
  */
 struct fsl_sai_verid {
-	u32 major;
-	u32 minor;
+	u32 version;
 	u32 feature;
 };
 
-- 
2.30.2

