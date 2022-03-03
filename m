Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 957D84CB7F3
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Mar 2022 08:33:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38FCF1AD0;
	Thu,  3 Mar 2022 08:33:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38FCF1AD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646292836;
	bh=tZcFN+U1aEsOFCHiYypk3EadAd+qdc3u0qZvVBP0AnI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IJBVtGhB0ZXWXp4hGCoRk0DRKj0mWASiWqYVBaPwOVO7BGYsmwpmkpKjSWxV3Upvh
	 EJlDuZ8SRfJbhImjJUC8HiMLFP5frRHzURk1kOT0nHbsM6qukzUT4rc1Vn+iDFj6BP
	 TVXzJu3qBXaTmPQJ3dAInOLsAWuZI9lndZQ/yhT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA202F80538;
	Thu,  3 Mar 2022 08:30:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 468D3F8051E; Thu,  3 Mar 2022 08:30:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30E25F8051E
 for <alsa-devel@alsa-project.org>; Thu,  3 Mar 2022 08:30:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30E25F8051E
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nPfux-0006PN-En; Thu, 03 Mar 2022 08:30:31 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1nPfuw-002UmW-0g; Thu, 03 Mar 2022 08:30:30 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/7] ASoC: fsl_sai: Drop unnecessary defines
Date: Thu,  3 Mar 2022 08:30:22 +0100
Message-Id: <20220303073028.594183-2-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303073028.594183-1-s.hauer@pengutronix.de>
References: <20220303073028.594183-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, Shengjiu Wang <shengjiu.wang@gmail.com>
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

The fsl_sai driver has FSL_FMT_TRANSMITTER and FSL_FMT_RECEIVER defines
which are used in a single function only then are then only translated
into a bool 'tx' variable. Drop the defines and pass the boolean value
directly to fsl_sai_set_dai_sysclk_tr(). No functional change.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 sound/soc/fsl/fsl_sai.c | 16 ++++++----------
 sound/soc/fsl/fsl_sai.h |  3 ---
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 10544fa27dc0b..d79cb7eb3b262 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -167,11 +167,10 @@ static int fsl_sai_set_dai_bclk_ratio(struct snd_soc_dai *dai,
 }
 
 static int fsl_sai_set_dai_sysclk_tr(struct snd_soc_dai *cpu_dai,
-		int clk_id, unsigned int freq, int fsl_dir)
+		int clk_id, unsigned int freq, bool tx)
 {
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	unsigned int ofs = sai->soc_data->reg_offset;
-	bool tx = fsl_dir == FSL_FMT_TRANSMITTER;
 	u32 val_cr2 = 0;
 
 	switch (clk_id) {
@@ -205,15 +204,13 @@ static int fsl_sai_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 	if (dir == SND_SOC_CLOCK_IN)
 		return 0;
 
-	ret = fsl_sai_set_dai_sysclk_tr(cpu_dai, clk_id, freq,
-					FSL_FMT_TRANSMITTER);
+	ret = fsl_sai_set_dai_sysclk_tr(cpu_dai, clk_id, freq, true);
 	if (ret) {
 		dev_err(cpu_dai->dev, "Cannot set tx sysclk: %d\n", ret);
 		return ret;
 	}
 
-	ret = fsl_sai_set_dai_sysclk_tr(cpu_dai, clk_id, freq,
-					FSL_FMT_RECEIVER);
+	ret = fsl_sai_set_dai_sysclk_tr(cpu_dai, clk_id, freq, false);
 	if (ret)
 		dev_err(cpu_dai->dev, "Cannot set rx sysclk: %d\n", ret);
 
@@ -221,11 +218,10 @@ static int fsl_sai_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 }
 
 static int fsl_sai_set_dai_fmt_tr(struct snd_soc_dai *cpu_dai,
-				unsigned int fmt, int fsl_dir)
+				unsigned int fmt, bool tx)
 {
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	unsigned int ofs = sai->soc_data->reg_offset;
-	bool tx = fsl_dir == FSL_FMT_TRANSMITTER;
 	u32 val_cr2 = 0, val_cr4 = 0;
 
 	if (!sai->is_lsb_first)
@@ -332,13 +328,13 @@ static int fsl_sai_set_dai_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
 {
 	int ret;
 
-	ret = fsl_sai_set_dai_fmt_tr(cpu_dai, fmt, FSL_FMT_TRANSMITTER);
+	ret = fsl_sai_set_dai_fmt_tr(cpu_dai, fmt, true);
 	if (ret) {
 		dev_err(cpu_dai->dev, "Cannot set tx format: %d\n", ret);
 		return ret;
 	}
 
-	ret = fsl_sai_set_dai_fmt_tr(cpu_dai, fmt, FSL_FMT_RECEIVER);
+	ret = fsl_sai_set_dai_fmt_tr(cpu_dai, fmt, false);
 	if (ret)
 		dev_err(cpu_dai->dev, "Cannot set rx format: %d\n", ret);
 
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 9aaf231bc0244..4e76ae43d1968 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -201,9 +201,6 @@
 #define FSL_SAI_REC_SYN		BIT(4)
 #define FSL_SAI_USE_I2S_SLAVE	BIT(5)
 
-#define FSL_FMT_TRANSMITTER	0
-#define FSL_FMT_RECEIVER	1
-
 /* SAI clock sources */
 #define FSL_SAI_CLK_BUS		0
 #define FSL_SAI_CLK_MAST1	1
-- 
2.30.2

