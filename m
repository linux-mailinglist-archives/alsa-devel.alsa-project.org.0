Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C03413CB0
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 23:40:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AE75169D;
	Tue, 21 Sep 2021 23:39:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AE75169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632260415;
	bh=G7kWIcw4ckECqndMsfL0TFZeJcsVijEwbp3xeXyzy6s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AChYnLfqML22DfNSqb6QCdk6UleQ8I4nzpjK+7G5DMyxmIs5GLB3S4jOF6+gyjtog
	 4smK69+IK/9Cb0VZBx5xNL7c8N/+2paY0e0I4EIFi0uN7e5o6c2Aj3lFf+AvAZBGTZ
	 jpOeFfjkMYqthluiz3jzYGx2Uj4nu2Ald+PYBlWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FF25F80511;
	Tue, 21 Sep 2021 23:37:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66A1FF80511; Tue, 21 Sep 2021 23:37:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB48CF80508
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 23:37:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB48CF80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jPvOfkC9"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4563261019;
 Tue, 21 Sep 2021 21:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632260221;
 bh=G7kWIcw4ckECqndMsfL0TFZeJcsVijEwbp3xeXyzy6s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jPvOfkC95HGyn8KibMlCXjpanucalXwrjPFvpm3YaIhZZraGeYxydLukOaVah10qA
 EFg80auHm8KNvGb3RxCgM7fta9fT5iC6mgPZuApjOY/SXGr9VDov/fhO3+ioB6eBbm
 UzLQ9gkn4i4PaeEHFetcsBPxmJsXbH8Az0WwKrNjbwIoauDreYSNNLl5sKByKmEaSa
 CNtrjBNJt/gelDc5kFoPhLwTx8QTtrHmS0yM8kE8AfbjV3cnwx15xB4K/b1evhyC0A
 16X9icPl0oJBoY97tYx9ihiTDn9ZXC6OyVs+sLNF+vNTNBi0RMgbUz58/yG7Rq3Qxm
 B7Mhvt31ZLYmQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 07/16] ASoC: fsl_ssi: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:35:33 +0100
Message-Id: <20210921213542.31688-7-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921213542.31688-1-broonie@kernel.org>
References: <20210921213542.31688-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4340; h=from:subject;
 bh=G7kWIcw4ckECqndMsfL0TFZeJcsVijEwbp3xeXyzy6s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSk8YHTyBkFIgFWPSSM7RcGqhjDLLq/Qb3JfQlk8H
 8gmQD6yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpPGAAKCRAk1otyXVSH0CCZB/
 0RCqCGoZy2uQipO9OTLyfb5kosGNW8wq2v+XhQhjlJ9bXpfLJuHYAdUe3c7ezc24yA3Qj2wWlydFUr
 Cx24LgeYc19drt309/LNlx0RG+MpL2Xj5bOuUXU/cVMppVBt6y7bpXNsqHNfBbOtfwxMbhNumqcC5c
 LxqBsWDFuyjeUFUW+qm3O0MdR3ADugM9MLLfuu4PcVVFGROIwj0dh6tO0CFK+MFtWvXKrsOVo+kLGO
 JQuSGAdlkK/SsnrDsL5rJWGONQTCapjuStkcLlm70b0bVR1nQrPFdHD6Bm5TEZGLbpXo5yicbwuNg4
 Jsick0pSFIxVAhHOYSpSO6q5cizQOH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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

As part of moving to remove the old style defines for the bus clocks update
the fsl_ssi driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_ssi.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index ecbc1c365d5b..1169d1104b9e 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -350,16 +350,16 @@ static bool fsl_ssi_is_ac97(struct fsl_ssi *ssi)
 		SND_SOC_DAIFMT_AC97;
 }
 
-static bool fsl_ssi_is_i2s_master(struct fsl_ssi *ssi)
+static bool fsl_ssi_is_i2s_clock_provider(struct fsl_ssi *ssi)
 {
-	return (ssi->dai_fmt & SND_SOC_DAIFMT_MASTER_MASK) ==
-		SND_SOC_DAIFMT_CBS_CFS;
+	return (ssi->dai_fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) ==
+		SND_SOC_DAIFMT_CBC_CFC;
 }
 
-static bool fsl_ssi_is_i2s_cbm_cfs(struct fsl_ssi *ssi)
+static bool fsl_ssi_is_i2s_cbp_cfc(struct fsl_ssi *ssi)
 {
-	return (ssi->dai_fmt & SND_SOC_DAIFMT_MASTER_MASK) ==
-		SND_SOC_DAIFMT_CBM_CFS;
+	return (ssi->dai_fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) ==
+		SND_SOC_DAIFMT_CBP_CFC;
 }
 
 /**
@@ -808,7 +808,7 @@ static int fsl_ssi_hw_params(struct snd_pcm_substream *substream,
 	u32 wl = SSI_SxCCR_WL(sample_size);
 	int ret;
 
-	if (fsl_ssi_is_i2s_master(ssi)) {
+	if (fsl_ssi_is_i2s_clock_provider(ssi)) {
 		ret = fsl_ssi_set_bclk(substream, dai, hw_params);
 		if (ret)
 			return ret;
@@ -841,7 +841,7 @@ static int fsl_ssi_hw_params(struct snd_pcm_substream *substream,
 		u8 i2s_net = ssi->i2s_net;
 
 		/* Normal + Network mode to send 16-bit data in 32-bit frames */
-		if (fsl_ssi_is_i2s_cbm_cfs(ssi) && sample_size == 16)
+		if (fsl_ssi_is_i2s_cbp_cfc(ssi) && sample_size == 16)
 			i2s_net = SSI_SCR_I2S_MODE_NORMAL | SSI_SCR_NET;
 
 		/* Use Normal mode to send mono data at 1st slot of 2 slots */
@@ -865,7 +865,7 @@ static int fsl_ssi_hw_free(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 
-	if (fsl_ssi_is_i2s_master(ssi) &&
+	if (fsl_ssi_is_i2s_clock_provider(ssi) &&
 	    ssi->baudclk_streams & BIT(substream->stream)) {
 		clk_disable_unprepare(ssi->baudclk);
 		ssi->baudclk_streams &= ~BIT(substream->stream);
@@ -891,18 +891,18 @@ static int _fsl_ssi_set_dai_fmt(struct fsl_ssi *ssi, unsigned int fmt)
 	ssi->i2s_net = SSI_SCR_NET;
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
-		switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-		case SND_SOC_DAIFMT_CBS_CFS:
+		switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+		case SND_SOC_DAIFMT_CBC_CFC:
 			if (IS_ERR(ssi->baudclk)) {
 				dev_err(ssi->dev,
 					"missing baudclk for master mode\n");
 				return -EINVAL;
 			}
 			fallthrough;
-		case SND_SOC_DAIFMT_CBM_CFS:
+		case SND_SOC_DAIFMT_CBP_CFC:
 			ssi->i2s_net |= SSI_SCR_I2S_MODE_MASTER;
 			break;
-		case SND_SOC_DAIFMT_CBM_CFM:
+		case SND_SOC_DAIFMT_CBP_CFP:
 			ssi->i2s_net |= SSI_SCR_I2S_MODE_SLAVE;
 			break;
 		default:
@@ -962,17 +962,17 @@ static int _fsl_ssi_set_dai_fmt(struct fsl_ssi *ssi, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	/* DAI clock master masks */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	/* DAI clock provider masks */
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		/* Output bit and frame sync clocks */
 		strcr |= SSI_STCR_TFDIR | SSI_STCR_TXDIR;
 		scr |= SSI_SCR_SYS_CLK_EN;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		/* Input bit or frame sync clocks */
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		/* Input bit clock but output frame sync clock */
 		strcr |= SSI_STCR_TFDIR;
 		break;
@@ -1341,7 +1341,7 @@ static int fsl_ssi_imx_probe(struct platform_device *pdev,
 		}
 	}
 
-	/* Do not error out for slave cases that live without a baud clock */
+	/* Do not error out for consumer cases that live without a baud clock */
 	ssi->baudclk = devm_clk_get(dev, "baud");
 	if (IS_ERR(ssi->baudclk))
 		dev_dbg(dev, "failed to get baud clock: %ld\n",
-- 
2.20.1

