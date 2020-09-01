Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94340258D2E
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 13:09:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D79771731;
	Tue,  1 Sep 2020 13:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D79771731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598958541;
	bh=P7k+rcBxqQGNmNIJu1orEyN8ZTq5PwWIvbnFd5w3l18=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qc62xsyFHsuUg7S7Qt67b0Vs2mMWH0jLB362ReebvoPGIIxBsBZo7ylP0zyu1jMHV
	 VxYnaepMogVhEJ8jjVEX0BvJXIbodISfhZav780uZ0BhemRUho8bK7UGduJtd8JOkb
	 21x2Yfj7tAUHozCQJfFpCwT+EBbE2Sz7qCTvO2tY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EDD1F80278;
	Tue,  1 Sep 2020 13:07:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D56F8F80278; Tue,  1 Sep 2020 13:07:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45D84F8021D
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 13:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45D84F8021D
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6EEEF1A006E;
 Tue,  1 Sep 2020 13:07:11 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BF7B11A004F;
 Tue,  1 Sep 2020 13:07:06 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id F32454024E;
 Tue,  1 Sep 2020 13:07:00 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com
Subject: [PATCH] ASoC: fsl_sai: Support multiple data channel enable bits
Date: Tue,  1 Sep 2020 19:01:08 +0800
Message-Id: <1598958068-10552-1-git-send-email-shengjiu.wang@nxp.com>
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

One data channel is one data line. From imx7ulp, the SAI IP is
enhanced to support multiple data channels.

If there is only two channels input and slots is 2, then enable one
data channel is enough for data transfer. So enable the TCE/RCE and
transmit/receive mask register according to the input channels and
slots configuration.

Move the data channel enablement from startup() to hw_params().

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 30 ++++++++++++------------------
 sound/soc/fsl/fsl_sai.h |  2 +-
 2 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 62c5fdb678fc..38c7bcbb361d 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -443,6 +443,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	u32 slots = (channels == 1) ? 2 : channels;
 	u32 slot_width = word_width;
 	int adir = tx ? RX : TX;
+	u32 pins;
 	int ret;
 
 	if (sai->slots)
@@ -451,6 +452,8 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	if (sai->slot_width)
 		slot_width = sai->slot_width;
 
+	pins = DIV_ROUND_UP(channels, slots);
+
 	if (!sai->is_slave_mode) {
 		if (sai->bclk_ratio)
 			ret = fsl_sai_set_bclk(cpu_dai, tx,
@@ -501,13 +504,17 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 				   FSL_SAI_CR5_FBT_MASK, val_cr5);
 	}
 
+	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx, ofs),
+			   FSL_SAI_CR3_TRCE_MASK,
+			   FSL_SAI_CR3_TRCE((1 << pins) - 1));
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
 			   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK,
 			   val_cr4);
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR5(tx, ofs),
 			   FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
 			   FSL_SAI_CR5_FBT_MASK, val_cr5);
-	regmap_write(sai->regmap, FSL_SAI_xMR(tx), ~0UL - ((1 << channels) - 1));
+	regmap_write(sai->regmap, FSL_SAI_xMR(tx),
+		     ~0UL - ((1 << min(channels, slots)) - 1));
 
 	return 0;
 }
@@ -517,6 +524,10 @@ static int fsl_sai_hw_free(struct snd_pcm_substream *substream,
 {
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	unsigned int ofs = sai->soc_data->reg_offset;
+
+	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx, ofs),
+			   FSL_SAI_CR3_TRCE_MASK, 0);
 
 	if (!sai->is_slave_mode &&
 			sai->mclk_streams & BIT(substream->stream)) {
@@ -651,14 +662,9 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned int ofs = sai->soc_data->reg_offset;
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	int ret;
 
-	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx, ofs),
-			   FSL_SAI_CR3_TRCE_MASK,
-			   FSL_SAI_CR3_TRCE);
-
 	/*
 	 * EDMA controller needs period size to be a multiple of
 	 * tx/rx maxburst
@@ -675,17 +681,6 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static void fsl_sai_shutdown(struct snd_pcm_substream *substream,
-		struct snd_soc_dai *cpu_dai)
-{
-	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
-	unsigned int ofs = sai->soc_data->reg_offset;
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
-
-	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx, ofs),
-			   FSL_SAI_CR3_TRCE_MASK, 0);
-}
-
 static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
 	.set_bclk_ratio	= fsl_sai_set_dai_bclk_ratio,
 	.set_sysclk	= fsl_sai_set_dai_sysclk,
@@ -695,7 +690,6 @@ static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
 	.hw_free	= fsl_sai_hw_free,
 	.trigger	= fsl_sai_trigger,
 	.startup	= fsl_sai_startup,
-	.shutdown	= fsl_sai_shutdown,
 };
 
 static int fsl_sai_dai_probe(struct snd_soc_dai *cpu_dai)
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 6aba7d28f5f3..5f630be74853 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -109,7 +109,7 @@
 #define FSL_SAI_CR2_DIV_MASK	0xff
 
 /* SAI Transmit and Receive Configuration 3 Register */
-#define FSL_SAI_CR3_TRCE	BIT(16)
+#define FSL_SAI_CR3_TRCE(x)     ((x) << 16)
 #define FSL_SAI_CR3_TRCE_MASK	GENMASK(23, 16)
 #define FSL_SAI_CR3_WDFL(x)	(x)
 #define FSL_SAI_CR3_WDFL_MASK	0x1f
-- 
2.27.0

