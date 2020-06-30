Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBC220F116
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 11:01:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0D2015E0;
	Tue, 30 Jun 2020 11:00:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0D2015E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593507696;
	bh=3szy5Es1Ch8wsJ2BA9DXsR0Dp5cDjCzJRCdZ7hRTcMg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O2npz3A7D+TssKFW2yup7xCWkp04qUETQy+O7js4lZzQrIjxM6ANqnVg499YsS1Y7
	 U6w4biQnlmezgZXNjUY5ioG9jFsdEGliDOkjg6n345h2ciHVemOUjrcQL59I2ebGFH
	 EwnAY6LDjUDoERReUDfLRv0twtPf6qpuHxp2dLE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11BADF8022D;
	Tue, 30 Jun 2020 10:59:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87E2CF801F2; Tue, 30 Jun 2020 10:59:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8404FF80135
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 10:59:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8404FF80135
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 73145201338;
 Tue, 30 Jun 2020 10:59:43 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BA2B8201345;
 Tue, 30 Jun 2020 10:59:38 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id D653040287;
 Tue, 30 Jun 2020 16:59:32 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2] ASoC: fsl_asrc: Add an option to select internal ratio mode
Date: Tue, 30 Jun 2020 16:47:56 +0800
Message-Id: <1593506876-14599-1-git-send-email-shengjiu.wang@nxp.com>
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

The ASRC not only supports ideal ratio mode, but also supports
internal ratio mode.

For internal rato mode, the rate of clock source should be divided
with no remainder by sample rate, otherwise there is sound
distortion.

Add function fsl_asrc_select_clk() to find proper clock source for
internal ratio mode, if the clock source is available then internal
ratio mode will be selected.

With change, the ideal ratio mode is not the only option for user.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2
- update according to Nicolin's comments

 sound/soc/fsl/fsl_asrc.c | 54 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 52 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 95f6a9617b0b..4105ef2c4f99 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -582,11 +582,55 @@ static int fsl_asrc_dai_startup(struct snd_pcm_substream *substream,
 			SNDRV_PCM_HW_PARAM_RATE, &fsl_asrc_rate_constraints);
 }
 
+/**
+ * Select proper clock source for internal ratio mode
+ */
+static int fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
+			       struct fsl_asrc_pair *pair,
+			       int in_rate,
+			       int out_rate)
+{
+	struct fsl_asrc_pair_priv *pair_priv = pair->private;
+	struct asrc_config *config = pair_priv->config;
+	int rate[2], select_clk[2]; /* Array size 2 means IN and OUT */
+	int clk_rate, clk_index;
+	int i = 0, j = 0;
+
+	rate[0] = in_rate;
+	rate[1] = out_rate;
+
+	/* Select proper clock source for internal ratio mode */
+	for (j = 0; j < 2; j++) {
+		for (i = 0; i < ASRC_CLK_MAP_LEN; i++) {
+			clk_index = asrc_priv->clk_map[j][i];
+			clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index]);
+			/* Only match a perfect clock source with no remainder */
+			if (clk_rate != 0 && (clk_rate / rate[j]) <= 1024 &&
+			    (clk_rate % rate[j]) == 0)
+				break;
+		}
+
+		select_clk[j] = i;
+	}
+
+	/* Switch to ideal ratio mode if there is no proper clock source */
+	if (select_clk[IN] == ASRC_CLK_MAP_LEN || select_clk[OUT] == ASRC_CLK_MAP_LEN) {
+		select_clk[IN] = INCLK_NONE;
+		select_clk[OUT] = OUTCLK_ASRCK1_CLK;
+	}
+
+	config->inclk = select_clk[IN];
+	config->outclk = select_clk[OUT];
+
+	return 0;
+}
+
 static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params,
 				  struct snd_soc_dai *dai)
 {
 	struct fsl_asrc *asrc = snd_soc_dai_get_drvdata(dai);
+	struct fsl_asrc_priv *asrc_priv = asrc->private;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
 	struct fsl_asrc_pair_priv *pair_priv = pair->private;
@@ -605,8 +649,6 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 
 	config.pair = pair->index;
 	config.channel_num = channels;
-	config.inclk = INCLK_NONE;
-	config.outclk = OUTCLK_ASRCK1_CLK;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		config.input_format   = params_format(params);
@@ -620,6 +662,14 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 		config.output_sample_rate = rate;
 	}
 
+	ret = fsl_asrc_select_clk(asrc_priv, pair,
+				  config.input_sample_rate,
+				  config.output_sample_rate);
+	if (ret) {
+		dev_err(dai->dev, "fail to select clock\n");
+		return ret;
+	}
+
 	ret = fsl_asrc_config_pair(pair, false);
 	if (ret) {
 		dev_err(dai->dev, "fail to config asrc pair\n");
-- 
2.21.0

