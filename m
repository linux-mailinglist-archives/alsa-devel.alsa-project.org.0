Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A48512D0D4
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Dec 2019 15:37:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28C3716EE;
	Mon, 30 Dec 2019 15:36:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28C3716EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577716632;
	bh=5UyuUvGCsarnhXeW3Rp8w0X9K7TRXXF7LYt1S7wrRyw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ou/mYne2IIR28FuavEzPydm20zDTOWLacjuj3DX55MNwNbm+e3RbPjg6ApsCPZf3p
	 QtpRzZiA+dRiJvA5AOqnrwdBMzFqGBo/yVu6zHlKD3h+Wo5dN05IO4S6RXETRO4OX2
	 ZqlIDBbuSkPHrB66ruwcJWHwO7EmKy9CeE4w19+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 674FAF8015D;
	Mon, 30 Dec 2019 15:35:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18050F8015E; Mon, 30 Dec 2019 15:35:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AACBAF8015C
 for <alsa-devel@alsa-project.org>; Mon, 30 Dec 2019 15:35:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AACBAF8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="hGALrNiS"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBUESoK5030698; Mon, 30 Dec 2019 08:35:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=C9auV7lF9z+A09p31OQoT87YkCqW/0Fsir4cvIMQPGk=;
 b=hGALrNiSqnZfDboWAOkpqEZQAReiRlQRg2SdJ3FxsIXg3/vFwKhNDO4m54yU69+DDHlE
 jn1HD6tZNEao5BhuYcy2VGLIYUMtiKVdfyHZ0/tKUyTvgJF3HZYHqhxJSBbAEvjA8OG9
 QaFEniQsv5HmbKtBEDB02TGYTgzRG98tLfhsB3797uMLI2cM6BEZXDv4ZjzYGN7IqhyF
 2ITN2iZGHAg0+nFaVOFK1ijji8NApRk3l+o53JZ5OMe+Sk+D7zYOSacs9U0dEbqoztnb
 eazpq5YwHP00B391iPDjpNuYiq/N61A10nmj3cZ45mtmjuO1Fe5xV0GUGcisCsiFahF1 6w== 
Authentication-Results: ppops.net;
 spf=fail smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from ediex02.ad.cirrus.com ([5.172.152.52])
 by mx0a-001ae601.pphosted.com with ESMTP id 2x65b7adt3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 30 Dec 2019 08:35:19 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 30 Dec
 2019 14:35:18 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1591.10 via
 Frontend Transport; Mon, 30 Dec 2019 14:35:17 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DE5A02C8;
 Mon, 30 Dec 2019 14:35:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Date: Mon, 30 Dec 2019 14:35:17 +0000
Message-ID: <20191230143517.21005-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191230143517.21005-1-ckeepax@opensource.cirrus.com>
References: <20191230143517.21005-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
X-Proofpoint-SPF-Result: fail
X-Proofpoint-SPF-Record: v=spf1 include:spf-001ae601.pphosted.com
 include:spf.protection.outlook.com -all
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=1
 bulkscore=0 mlxlogscore=994 spamscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912300133
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
Subject: [alsa-devel] [PATCH 2/2] ASoC: madera: Enable clocks for input pins
	when used for the FLL
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When one of the MCLK pins is used to supply the FLL enable that clock
source.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/madera.c | 109 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 100 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 9b4b4c52b9e4b..12dc468ae6bf0 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -3858,11 +3858,75 @@ static bool madera_set_fll_phase_integrator(struct madera_fll *fll,
 	return reg_change;
 }
 
+static int madera_set_fll_clks_reg(struct madera_fll *fll, bool ena,
+				   unsigned int reg, unsigned int mask,
+				   unsigned int shift)
+{
+	struct madera *madera = fll->madera;
+	unsigned int src;
+	struct clk *clk;
+	int ret;
+
+	ret = regmap_read(madera->regmap, reg, &src);
+	if (ret != 0) {
+		madera_fll_err(fll, "Failed to read current source: %d\n",
+			       ret);
+		return ret;
+	}
+
+	src = (src & mask) >> shift;
+
+	switch (src) {
+	case MADERA_FLL_SRC_MCLK1:
+		clk = madera->mclk[MADERA_MCLK1].clk;
+		break;
+	case MADERA_FLL_SRC_MCLK2:
+		clk = madera->mclk[MADERA_MCLK2].clk;
+		break;
+	case MADERA_FLL_SRC_MCLK3:
+		clk = madera->mclk[MADERA_MCLK3].clk;
+		break;
+	default:
+		return 0;
+	}
+
+	if (ena) {
+		return clk_prepare_enable(clk);
+	} else {
+		clk_disable_unprepare(clk);
+		return 0;
+	}
+}
+
+static inline int madera_set_fll_clks(struct madera_fll *fll, int base, bool ena)
+{
+	return madera_set_fll_clks_reg(fll, ena,
+				       base + MADERA_FLL_CONTROL_6_OFFS,
+				       MADERA_FLL1_REFCLK_SRC_MASK,
+				       MADERA_FLL1_REFCLK_DIV_SHIFT);
+}
+
+static inline int madera_set_fllao_clks(struct madera_fll *fll, int base, bool ena)
+{
+	return madera_set_fll_clks_reg(fll, ena,
+				       base + MADERA_FLLAO_CONTROL_6_OFFS,
+				       MADERA_FLL_AO_REFCLK_SRC_MASK,
+				       MADERA_FLL_AO_REFCLK_SRC_SHIFT);
+}
+
+static inline int madera_set_fllhj_clks(struct madera_fll *fll, int base, bool ena)
+{
+	return madera_set_fll_clks_reg(fll, ena,
+				       base + MADERA_FLL_CONTROL_1_OFFS,
+				       CS47L92_FLL1_REFCLK_SRC_MASK,
+				       CS47L92_FLL1_REFCLK_SRC_SHIFT);
+}
+
 static void madera_disable_fll(struct madera_fll *fll)
 {
 	struct madera *madera = fll->madera;
 	unsigned int sync_base;
-	bool change;
+	bool ref_change, sync_change;
 
 	switch (madera->type) {
 	case CS47L35:
@@ -3880,18 +3944,23 @@ static void madera_disable_fll(struct madera_fll *fll)
 			   MADERA_FLL1_FREERUN, MADERA_FLL1_FREERUN);
 	regmap_update_bits_check(madera->regmap,
 				 fll->base + MADERA_FLL_CONTROL_1_OFFS,
-				 MADERA_FLL1_ENA, 0, &change);
-	regmap_update_bits(madera->regmap,
-			   sync_base + MADERA_FLL_SYNCHRONISER_1_OFFS,
-			   MADERA_FLL1_SYNC_ENA, 0);
+				 MADERA_FLL1_ENA, 0, &ref_change);
+	regmap_update_bits_check(madera->regmap,
+				 sync_base + MADERA_FLL_SYNCHRONISER_1_OFFS,
+				 MADERA_FLL1_SYNC_ENA, 0, &sync_change);
 	regmap_update_bits(madera->regmap,
 			   fll->base + MADERA_FLL_CONTROL_1_OFFS,
 			   MADERA_FLL1_FREERUN, 0);
 
 	madera_wait_for_fll(fll, false);
 
-	if (change)
+	if (sync_change)
+		madera_set_fll_clks(fll, sync_base, false);
+
+	if (ref_change) {
+		madera_set_fll_clks(fll, fll->base, false);
 		pm_runtime_put_autosuspend(madera->dev);
+	}
 }
 
 static int madera_enable_fll(struct madera_fll *fll)
@@ -3947,6 +4016,10 @@ static int madera_enable_fll(struct madera_fll *fll)
 		regmap_update_bits(fll->madera->regmap,
 				   fll->base + MADERA_FLL_CONTROL_7_OFFS,
 				   MADERA_FLL1_GAIN_MASK, 0);
+
+		if (sync_enabled > 0)
+			madera_set_fll_clks(fll, sync_base, false);
+		madera_set_fll_clks(fll, fll->base, false);
 	}
 
 	/* Apply SYNCCLK setting */
@@ -4025,11 +4098,15 @@ static int madera_enable_fll(struct madera_fll *fll)
 	if (!already_enabled)
 		pm_runtime_get_sync(madera->dev);
 
-	if (have_sync)
+	if (have_sync) {
+		madera_set_fll_clks(fll, sync_base, true);
 		regmap_update_bits(madera->regmap,
 				   sync_base + MADERA_FLL_SYNCHRONISER_1_OFFS,
 				   MADERA_FLL1_SYNC_ENA,
 				   MADERA_FLL1_SYNC_ENA);
+	}
+
+	madera_set_fll_clks(fll, fll->base, true);
 	regmap_update_bits(madera->regmap,
 			   fll->base + MADERA_FLL_CONTROL_1_OFFS,
 			   MADERA_FLL1_ENA, MADERA_FLL1_ENA);
@@ -4201,6 +4278,9 @@ static int madera_enable_fll_ao(struct madera_fll *fll,
 			   fll->base + MADERA_FLLAO_CONTROL_1_OFFS,
 			   MADERA_FLL_AO_HOLD, MADERA_FLL_AO_HOLD);
 
+	if (already_enabled)
+		madera_set_fllao_clks(fll, fll->base, false);
+
 	for (i = 0; i < patch_size; i++) {
 		val = patch[i].def;
 
@@ -4214,6 +4294,8 @@ static int madera_enable_fll_ao(struct madera_fll *fll,
 		regmap_write(madera->regmap, patch[i].reg, val);
 	}
 
+	madera_set_fllao_clks(fll, fll->base, true);
+
 	regmap_update_bits(madera->regmap,
 			   fll->base + MADERA_FLLAO_CONTROL_1_OFFS,
 			   MADERA_FLL_AO_ENA, MADERA_FLL_AO_ENA);
@@ -4257,8 +4339,10 @@ static int madera_disable_fll_ao(struct madera_fll *fll)
 			   fll->base + MADERA_FLLAO_CONTROL_2_OFFS,
 			   MADERA_FLL_AO_CTRL_UPD_MASK, 0);
 
-	if (change)
+	if (change) {
+		madera_set_fllao_clks(fll, fll->base, false);
 		pm_runtime_put_autosuspend(madera->dev);
+	}
 
 	return 0;
 }
@@ -4344,8 +4428,10 @@ static int madera_fllhj_disable(struct madera_fll *fll)
 			   fll->base + MADERA_FLL_CONTROL_2_OFFS,
 			   MADERA_FLL1_CTRL_UPD_MASK, 0);
 
-	if (change)
+	if (change) {
+		madera_set_fllhj_clks(fll, fll->base, false);
 		pm_runtime_put_autosuspend(madera->dev);
+	}
 
 	return 0;
 }
@@ -4517,6 +4603,9 @@ static int madera_fllhj_enable(struct madera_fll *fll)
 			   MADERA_FLL1_HOLD_MASK,
 			   MADERA_FLL1_HOLD_MASK);
 
+	if (already_enabled)
+		madera_set_fllhj_clks(fll, fll->base, false);
+
 	/* Apply refclk */
 	ret = madera_fllhj_apply(fll, fll->ref_freq);
 	if (ret) {
@@ -4528,6 +4617,8 @@ static int madera_fllhj_enable(struct madera_fll *fll)
 			   CS47L92_FLL1_REFCLK_SRC_MASK,
 			   fll->ref_src << CS47L92_FLL1_REFCLK_SRC_SHIFT);
 
+	madera_set_fllhj_clks(fll, fll->base, true);
+
 	regmap_update_bits(madera->regmap,
 			   fll->base + MADERA_FLL_CONTROL_1_OFFS,
 			   MADERA_FLL1_ENA_MASK,
-- 
2.11.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
