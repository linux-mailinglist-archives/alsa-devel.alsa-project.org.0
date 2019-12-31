Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ADE12D557
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Dec 2019 01:36:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D5031708;
	Tue, 31 Dec 2019 01:36:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D5031708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577752612;
	bh=99/4iAagb0FnbraKkg8K49WAvenS4nu+WVhknGYOCN8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=qcMqEUouH1r5UwrkFPsEx9QgCvUTrevjtFhAp8kWYWtVCnwOipeMfMZrgx8/6mudl
	 GzEeP3IrKgXYJZ+hnuddDPfpLbL4ktdgpdZqHOr8NS7jZP8PhKq25gwsI1ooxFVJ5q
	 0V/vKlM6TTdT0Egq0k7PFg6RorJ7uiWJos8/+OEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24477F802A2;
	Tue, 31 Dec 2019 01:30:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CDEDF80271; Tue, 31 Dec 2019 01:30:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 977E2F8011E
 for <alsa-devel@alsa-project.org>; Tue, 31 Dec 2019 01:30:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 977E2F8011E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="F9PQBBWV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=5gvngx0Dd/voyJ3W8E2xojWF5qgsqOrZXb+V3pKTq4E=; b=F9PQBBWViaCX
 lXm1OssidHLwewNXdSn6asJuRBBnA+y1vwDBkY4GFXJgBwxHN4XMrnKmO0fldskF8Jq50mivr78L8
 SjTS2pMcKdLzNa28jW3wZbHvMzrbk6j2pQyBabBbsf3/hXgLDYyPOVbAuI0po5ZYkxsCTNOSDguQI
 Ha8WQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1im5Qg-0002nf-JT; Tue, 31 Dec 2019 00:30:34 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 18B2BD01A4F; Tue, 31 Dec 2019 00:30:34 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20191230143517.21005-2-ckeepax@opensource.cirrus.com>
Message-Id: <applied-20191230143517.21005-2-ckeepax@opensource.cirrus.com>
X-Patchwork-Hint: ignore
Date: Tue, 31 Dec 2019 00:30:34 +0000 (GMT)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
Subject: [alsa-devel] Applied "ASoC: madera: Enable clocks for input pins
	when used for the FLL" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: madera: Enable clocks for input pins when used for the FLL

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 3863857dd5ca3e60685c6b49a7873fda727ff233 Mon Sep 17 00:00:00 2001
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Mon, 30 Dec 2019 14:35:17 +0000
Subject: [PATCH] ASoC: madera: Enable clocks for input pins when used for the
 FLL

When one of the MCLK pins is used to supply the FLL enable that clock
source.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20191230143517.21005-2-ckeepax@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/madera.c | 109 ++++++++++++++++++++++++++++++++++----
 1 file changed, 100 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 9b4b4c52b9e4..12dc468ae6bf 100644
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
