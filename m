Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A726C5B2D3B
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 06:04:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 390811666;
	Fri,  9 Sep 2022 06:03:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 390811666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662696268;
	bh=kGFxh60G/Z/gm8NiWntYKLyPddxmxtTrkicqFob/uAw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vI7xTwqkinfAdBc2cXsTt/An5qYAm957UB4P2BUUSzp7CID8E1rhhQPkInuZ20j6T
	 rciDkjYs5MOeWgcRpNOUu7tFxZXVD+AcUj/4eJtQvuD/O/F8JzRBQEeoL5uRtZku+j
	 Pj9mO+kmJIO5dKQNlimsIN5e+2mBvnRpauS5pxLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A26FBF8016C;
	Fri,  9 Sep 2022 06:03:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02A3DF8023A; Fri,  9 Sep 2022 06:03:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA465F8016C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 06:03:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA465F8016C
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1B81A203AC1;
 Fri,  9 Sep 2022 06:03:18 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C51E4203AD3;
 Fri,  9 Sep 2022 06:03:17 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 17D9D1820F59;
 Fri,  9 Sep 2022 12:03:16 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH v3] ASoC: fsl_asrc: Add initialization finishing check in
 runtime resume
Date: Fri,  9 Sep 2022 11:44:58 +0800
Message-Id: <1662695098-24602-1-git-send-email-shengjiu.wang@nxp.com>
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

If the initialization is not finished, then filling input data to
the FIFO may fail. So it is better to add initialization finishing
check in the runtime resume for suspend & resume case.

And consider the case of three instances working in parallel,
increase the retry times to 50 for more initialization time.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Nicolin Chen <nicolinc@gmail.com>
---
changes in v3:
- update warning message.

changes in v2:
- update comments.

 sound/soc/fsl/fsl_asrc.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index aa5edf32d988..936aef5d2767 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -20,6 +20,7 @@
 
 #define IDEAL_RATIO_DECIMAL_DEPTH 26
 #define DIVIDER_NUM  64
+#define INIT_RETRY_NUM 50
 
 #define pair_err(fmt, ...) \
 	dev_err(&asrc->pdev->dev, "Pair %c: " fmt, 'A' + index, ##__VA_ARGS__)
@@ -27,6 +28,9 @@
 #define pair_dbg(fmt, ...) \
 	dev_dbg(&asrc->pdev->dev, "Pair %c: " fmt, 'A' + index, ##__VA_ARGS__)
 
+#define pair_warn(fmt, ...) \
+	dev_warn(&asrc->pdev->dev, "Pair %c: " fmt, 'A' + index, ##__VA_ARGS__)
+
 /* Corresponding to process_option */
 static unsigned int supported_asrc_rate[] = {
 	5512, 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000,
@@ -579,7 +583,7 @@ static void fsl_asrc_start_pair(struct fsl_asrc_pair *pair)
 {
 	struct fsl_asrc *asrc = pair->asrc;
 	enum asrc_pair_index index = pair->index;
-	int reg, retry = 10, i;
+	int reg, retry = INIT_RETRY_NUM, i;
 
 	/* Enable the current pair */
 	regmap_update_bits(asrc->regmap, REG_ASRCTR,
@@ -592,6 +596,10 @@ static void fsl_asrc_start_pair(struct fsl_asrc_pair *pair)
 		reg &= ASRCFG_INIRQi_MASK(index);
 	} while (!reg && --retry);
 
+	/* NOTE: Doesn't treat initialization timeout as an error */
+	if (!retry)
+		pair_warn("initialization isn't finished\n");
+
 	/* Make the input fifo to ASRC STALL level */
 	regmap_read(asrc->regmap, REG_ASRCNCR, &reg);
 	for (i = 0; i < pair->channels * 4; i++)
@@ -1257,6 +1265,7 @@ static int fsl_asrc_runtime_resume(struct device *dev)
 {
 	struct fsl_asrc *asrc = dev_get_drvdata(dev);
 	struct fsl_asrc_priv *asrc_priv = asrc->private;
+	int reg, retry = INIT_RETRY_NUM;
 	int i, ret;
 	u32 asrctr;
 
@@ -1295,6 +1304,24 @@ static int fsl_asrc_runtime_resume(struct device *dev)
 	regmap_update_bits(asrc->regmap, REG_ASRCTR,
 			   ASRCTR_ASRCEi_ALL_MASK, asrctr);
 
+	/* Wait for status of initialization for all enabled pairs */
+	do {
+		udelay(5);
+		regmap_read(asrc->regmap, REG_ASRCFG, &reg);
+		reg = (reg >> ASRCFG_INIRQi_SHIFT(0)) & 0x7;
+	} while ((reg != ((asrctr >> ASRCTR_ASRCEi_SHIFT(0)) & 0x7)) && --retry);
+
+	/*
+	 * NOTE: Doesn't treat initialization timeout as an error
+	 * Some of the pairs may success, then still can continue.
+	 */
+	if (!retry) {
+		for (i = ASRC_PAIR_A; i < ASRC_PAIR_MAX_NUM; i++) {
+			if ((asrctr & ASRCTR_ASRCEi_MASK(i)) && !(reg & (1 << i)))
+				dev_warn(dev, "Pair %c initialization isn't finished\n", 'A' + i);
+		}
+	}
+
 	return 0;
 
 disable_asrck_clk:
-- 
2.34.1

