Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF424851F1
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 12:38:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E3BE1898;
	Wed,  5 Jan 2022 12:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E3BE1898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641382737;
	bh=Omzoaby344e3CyTiNEoT1kYVmdGEOukRKKxxPAWe3u8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mpAp3cTqj0xML99KG8CzbWC7ail3Z5VOd+HXfr4ecOIWAKyP0h/jKO+4joxXAyC7K
	 +oT6Qc/zXtK9BO+lhZPgClGAIdFe+Qw1WqdrjnUITA4BZa7BQKJmdja5XHvNJIywis
	 u8JaqeEPP66aJHasF606vd4Uh9dZAUXDO41WrVGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA4ABF8020C;
	Wed,  5 Jan 2022 12:37:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06C8DF800BB; Wed,  5 Jan 2022 12:37:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10999F800BB
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 12:37:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10999F800BB
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E21BF200635;
 Wed,  5 Jan 2022 12:37:41 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7D9392011D1;
 Wed,  5 Jan 2022 12:37:41 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 51607183F0C0;
 Wed,  5 Jan 2022 19:37:39 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: fsl_asrc: refine the check of available clock divider
Date: Wed,  5 Jan 2022 19:08:03 +0800
Message-Id: <1641380883-20709-1-git-send-email-shengjiu.wang@nxp.com>
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

According to RM, the clock divider range is from 1 to 8, clock
prescaling ratio may be any power of 2 from 1 to 128.
So the supported divider is not all the value between
1 and 1024, just limited value in that range.

Create table for the supported divder and add function to
check the clock divider is available by comparing with
the table.

Fixes: d0250cf4f2ab ("ASoC: fsl_asrc: Add an option to select internal ratio mode")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c | 69 +++++++++++++++++++++++++++++++++-------
 1 file changed, 58 insertions(+), 11 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 24b41881a68f..d7d1536a4f37 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -19,6 +19,7 @@
 #include "fsl_asrc.h"
 
 #define IDEAL_RATIO_DECIMAL_DEPTH 26
+#define DIVIDER_NUM  64
 
 #define pair_err(fmt, ...) \
 	dev_err(&asrc->pdev->dev, "Pair %c: " fmt, 'A' + index, ##__VA_ARGS__)
@@ -101,6 +102,55 @@ static unsigned char clk_map_imx8qxp[2][ASRC_CLK_MAP_LEN] = {
 	},
 };
 
+/*
+ * According to RM, the divider range is 1 ~ 8,
+ * prescaler is power of 2 from 1 ~ 128.
+ */
+static int asrc_clk_divider[DIVIDER_NUM] = {
+	1,  2,  4,  8,  16,  32,  64,  128,  /* divider = 1 */
+	2,  4,  8, 16,  32,  64, 128,  256,  /* divider = 2 */
+	3,  6, 12, 24,  48,  96, 192,  384,  /* divider = 3 */
+	4,  8, 16, 32,  64, 128, 256,  512,  /* divider = 4 */
+	5, 10, 20, 40,  80, 160, 320,  640,  /* divider = 5 */
+	6, 12, 24, 48,  96, 192, 384,  768,  /* divider = 6 */
+	7, 14, 28, 56, 112, 224, 448,  896,  /* divider = 7 */
+	8, 16, 32, 64, 128, 256, 512, 1024,  /* divider = 8 */
+};
+
+/*
+ * Check if the divider is available for internal ratio mode
+ */
+static bool fsl_asrc_divider_avail(int clk_rate, int rate, int *div)
+{
+	u32 rem, i;
+	u64 n;
+
+	if (div)
+		*div = 0;
+
+	if (clk_rate == 0 || rate == 0)
+		return false;
+
+	n = clk_rate;
+	rem = do_div(n, rate);
+
+	if (div)
+		*div = n;
+
+	if (rem != 0)
+		return false;
+
+	for (i = 0; i < DIVIDER_NUM; i++) {
+		if (n == asrc_clk_divider[i])
+			break;
+	}
+
+	if (i == DIVIDER_NUM)
+		return false;
+
+	return true;
+}
+
 /**
  * fsl_asrc_sel_proc - Select the pre-processing and post-processing options
  * @inrate: input sample rate
@@ -330,12 +380,12 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 	enum asrc_word_width input_word_width;
 	enum asrc_word_width output_word_width;
 	u32 inrate, outrate, indiv, outdiv;
-	u32 clk_index[2], div[2], rem[2];
+	u32 clk_index[2], div[2];
 	u64 clk_rate;
 	int in, out, channels;
 	int pre_proc, post_proc;
 	struct clk *clk;
-	bool ideal;
+	bool ideal, div_avail;
 
 	if (!config) {
 		pair_err("invalid pair config\n");
@@ -415,8 +465,7 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 	clk = asrc_priv->asrck_clk[clk_index[ideal ? OUT : IN]];
 
 	clk_rate = clk_get_rate(clk);
-	rem[IN] = do_div(clk_rate, inrate);
-	div[IN] = (u32)clk_rate;
+	div_avail = fsl_asrc_divider_avail(clk_rate, inrate, &div[IN]);
 
 	/*
 	 * The divider range is [1, 1024], defined by the hardware. For non-
@@ -425,7 +474,7 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 	 * only result in different converting speeds. So remainder does not
 	 * matter, as long as we keep the divider within its valid range.
 	 */
-	if (div[IN] == 0 || (!ideal && (div[IN] > 1024 || rem[IN] != 0))) {
+	if (div[IN] == 0 || (!ideal && !div_avail)) {
 		pair_err("failed to support input sample rate %dHz by asrck_%x\n",
 				inrate, clk_index[ideal ? OUT : IN]);
 		return -EINVAL;
@@ -436,13 +485,12 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool use_ideal_rate)
 	clk = asrc_priv->asrck_clk[clk_index[OUT]];
 	clk_rate = clk_get_rate(clk);
 	if (ideal && use_ideal_rate)
-		rem[OUT] = do_div(clk_rate, IDEAL_RATIO_RATE);
+		div_avail = fsl_asrc_divider_avail(clk_rate, IDEAL_RATIO_RATE, &div[OUT]);
 	else
-		rem[OUT] = do_div(clk_rate, outrate);
-	div[OUT] = clk_rate;
+		div_avail = fsl_asrc_divider_avail(clk_rate, outrate, &div[OUT]);
 
 	/* Output divider has the same limitation as the input one */
-	if (div[OUT] == 0 || (!ideal && (div[OUT] > 1024 || rem[OUT] != 0))) {
+	if (div[OUT] == 0 || (!ideal && !div_avail)) {
 		pair_err("failed to support output sample rate %dHz by asrck_%x\n",
 				outrate, clk_index[OUT]);
 		return -EINVAL;
@@ -621,8 +669,7 @@ static void fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
 			clk_index = asrc_priv->clk_map[j][i];
 			clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index]);
 			/* Only match a perfect clock source with no remainder */
-			if (clk_rate != 0 && (clk_rate / rate[j]) <= 1024 &&
-			    (clk_rate % rate[j]) == 0)
+			if (fsl_asrc_divider_avail(clk_rate, rate[j], NULL))
 				break;
 		}
 
-- 
2.17.1

