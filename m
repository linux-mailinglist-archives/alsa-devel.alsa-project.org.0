Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71714DA593
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 08:25:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E47069F6;
	Thu, 17 Oct 2019 08:24:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E47069F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571293548;
	bh=LKe8X/zWLVaAjgeAbFLnz2OihApA2LaVjBV9B4owZQ4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AtbQOmgyRNfLEmJyA6rtrihLo8832OxqGYzZXRmMuVy4/1SQ865Ws8nZaSd2M8qjz
	 goXx5FXwRM0+u2BKGVYfAURZOqNqG4NDXzSsAQFVYUvJ4npNcKqPd5+LNULyuIWurd
	 o/1kW5N0gm7L757WgBstKseURqkW2tlET2EHZY7c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17D1DF80528;
	Thu, 17 Oct 2019 08:24:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60381F804AA; Thu, 17 Oct 2019 08:24:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50909F802A0
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 08:23:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50909F802A0
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CF242200031;
 Thu, 17 Oct 2019 08:23:54 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8322220004C;
 Thu, 17 Oct 2019 08:23:49 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 11186402B4;
 Thu, 17 Oct 2019 14:23:42 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Date: Thu, 17 Oct 2019 14:21:08 +0800
Message-Id: <1571293268-5146-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: fsl_asrc: refine the setting of internal
	clock divider
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

For P2P output, the output divider should align with the output sample
rate, if use ideal sample rate, there will be a lot of overload, which
would cause underrun.

The maximum divider of asrc clock is 1024, but there is no judgement
for this limitaion in driver, which may cause the divider setting not
correct.

For non-ideal ratio mode, the clock rate should divide the sample rate
with no remainder, and the quotient should be less than 1024.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c | 40 +++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 0bf91a6f54b9..44d05ec28bd3 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -260,7 +260,7 @@ static int fsl_asrc_set_ideal_ratio(struct fsl_asrc_pair *pair,
  * of struct asrc_config which includes in/output sample rate, width, channel
  * and clock settings.
  */
-static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
+static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair, bool p2p)
 {
 	struct asrc_config *config = pair->config;
 	struct fsl_asrc *asrc_priv = pair->asrc_priv;
@@ -268,7 +268,8 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 	enum asrc_word_width input_word_width;
 	enum asrc_word_width output_word_width;
 	u32 inrate, outrate, indiv, outdiv;
-	u32 clk_index[2], div[2];
+	u32 clk_index[2], div[2], rem[2];
+	u64 clk_rate;
 	int in, out, channels;
 	int pre_proc, post_proc;
 	struct clk *clk;
@@ -351,7 +352,9 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 	/* We only have output clock for ideal ratio mode */
 	clk = asrc_priv->asrck_clk[clk_index[ideal ? OUT : IN]];
 
-	div[IN] = clk_get_rate(clk) / inrate;
+	clk_rate = clk_get_rate(clk);
+	rem[IN] = do_div(clk_rate, inrate);
+	div[IN] = (u32)clk_rate;
 	if (div[IN] == 0) {
 		pair_err("failed to support input sample rate %dHz by asrck_%x\n",
 				inrate, clk_index[ideal ? OUT : IN]);
@@ -360,11 +363,20 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 
 	clk = asrc_priv->asrck_clk[clk_index[OUT]];
 
-	/* Use fixed output rate for Ideal Ratio mode (INCLK_NONE) */
-	if (ideal)
-		div[OUT] = clk_get_rate(clk) / IDEAL_RATIO_RATE;
-	else
-		div[OUT] = clk_get_rate(clk) / outrate;
+	/*
+	 * When P2P mode, output rate should align with the out samplerate.
+	 * if set too high output rate, there will be lots of Overload.
+	 * When M2M mode, output rate should also need to align with the out
+	 * samplerate, but M2M must use less time to achieve good performance.
+	 */
+	clk_rate = clk_get_rate(clk);
+	if (p2p || !ideal) {
+		rem[OUT] = do_div(clk_rate, outrate);
+		div[OUT] = clk_rate;
+	} else {
+		rem[OUT] = do_div(clk_rate, IDEAL_RATIO_RATE);
+		div[OUT] = clk_rate;
+	}
 
 	if (div[OUT] == 0) {
 		pair_err("failed to support output sample rate %dHz by asrck_%x\n",
@@ -372,6 +384,16 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
 		return -EINVAL;
 	}
 
+	if (!ideal && (div[IN] > 1024 || div[OUT] > 1024 ||
+		       rem[IN] != 0 || rem[OUT] != 0)) {
+		pair_err("The divider can't be used for non ideal mode\n");
+		return -EINVAL;
+	}
+
+	/* Divider range is [1, 1024] */
+	div[IN] = min_t(u32, 1024, div[IN]);
+	div[OUT] = min_t(u32, 1024, div[OUT]);
+
 	/* Set the channel number */
 	channels = config->channel_num;
 
@@ -560,7 +582,7 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 		config.output_sample_rate = rate;
 	}
 
-	ret = fsl_asrc_config_pair(pair);
+	ret = fsl_asrc_config_pair(pair, true);
 	if (ret) {
 		dev_err(dai->dev, "fail to config asrc pair\n");
 		return ret;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
