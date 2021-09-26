Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D74418811
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Sep 2021 12:15:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECD1B165D;
	Sun, 26 Sep 2021 12:14:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECD1B165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632651302;
	bh=qXwiB7pmPM0NtJZeekWihdpUidV/wTmpP13ep4DdAok=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TFjXVJg9HgoVG2SZ3hj61VJqpTctFO25q5LWRqRqB0y0Qn21bJjYlgEy5pdfvPvj2
	 uMOudhgQFCnJ02MGFoxYis7K+tO1gEFqIVDBy2FZU5+FwqLMzHSCkidaGJMTKnDOCA
	 3pdZCQsaGsH/55Yco6N8anCj4gw8hyuiLpNCUJ40=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52919F80161;
	Sun, 26 Sep 2021 12:13:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6564AF804AD; Sun, 26 Sep 2021 12:13:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A129F80161
 for <alsa-devel@alsa-project.org>; Sun, 26 Sep 2021 12:13:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A129F80161
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E1D58200FF0;
 Sun, 26 Sep 2021 12:13:30 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 7E670200FCD;
 Sun, 26 Sep 2021 12:13:30 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 1B877183AD07;
 Sun, 26 Sep 2021 18:13:29 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_spdif: implement bypass mode from in to out
Date: Sun, 26 Sep 2021 17:49:20 +0800
Message-Id: <1632649760-1651-1-git-send-email-shengjiu.wang@nxp.com>
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

From: Viorel Suman <viorel.suman@nxp.com>

Implement SPDIF bypass mode. It implies internal SoC
routing of SPDIF input signal to SPDIF output signal. The
test bed requires two boards: B1 configured in bypass mode,
and B2 to feed B1 SPDIF RX port and read B1 SPDIF TX port:
   B2 TX -> B1 RX,
   B2 RX <- B1 TX.
The test procedure:
 a) Boot both boards
 b) B2: start "arecord <spdifcard> -r 48kHz | aplay <local DAC>"
 c) B2: start "aplay <spdifcard> -r 48kHz <2ch 48kHz audio file>"
 d) B1: enable bypass mode:
	amixer -cimxspdif cset numid=8,iface=PCM,name='Bypass Mode' on
 e) B2: check DAC audio, make sure the same sample rate is used at
	steps b) and c), in example above the rate is 48kHz.
 f) B1: try to run "aplay" or "arecord" on imxspdif card while in
	bypass mode - both must fail until bypass mode is disabled
 g) B1: disable bypass mode:
	amixer -cimxspdif cset numid=8,iface=PCM,name='Bypass Mode' off
 h) B1: check the usual playback and capture on imxspdif card.
	During this test try to set bypass mode - must not be allowed
	while playback or capture is running.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_spdif.c | 74 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 928b59069283..d178b479c8bd 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -111,6 +111,7 @@ struct spdif_mixer_control {
  * @dma_params_tx: DMA parameters for transmit channel
  * @dma_params_rx: DMA parameters for receive channel
  * @regcache_srpc: regcache for SRPC
+ * @bypass: status of bypass input to output
  */
 struct fsl_spdif_priv {
 	const struct fsl_spdif_soc_data *soc;
@@ -133,6 +134,7 @@ struct fsl_spdif_priv {
 	struct snd_dmaengine_dai_dma_data dma_params_rx;
 	/* regcache for SRPC */
 	u32 regcache_srpc;
+	bool bypass;
 };
 
 static struct fsl_spdif_soc_data fsl_spdif_vf610 = {
@@ -905,6 +907,69 @@ static int fsl_spdif_rx_rcm_put(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static int fsl_spdif_bypass_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_spdif_priv *priv = snd_soc_dai_get_drvdata(dai);
+
+	ucontrol->value.integer.value[0] = priv->bypass ? 1 : 0;
+
+	return 0;
+}
+
+static int fsl_spdif_bypass_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dai *dai = snd_kcontrol_chip(kcontrol);
+	struct fsl_spdif_priv *priv = snd_soc_dai_get_drvdata(dai);
+	struct snd_soc_card *card = dai->component->card;
+	bool set = (ucontrol->value.integer.value[0] != 0);
+	struct regmap *regmap = priv->regmap;
+	struct snd_soc_pcm_runtime *rtd;
+	u32 scr, mask;
+	int stream;
+
+	rtd = snd_soc_get_pcm_runtime(card, card->dai_link);
+
+	if (priv->bypass == set)
+		return 0; /* nothing to do */
+
+	if (snd_soc_dai_active(dai)) {
+		dev_err(dai->dev, "Cannot change BYPASS mode while stream is running.\n");
+		return -EBUSY;
+	}
+
+	pm_runtime_get_sync(dai->dev);
+
+	if (set) {
+		/* Disable interrupts */
+		regmap_update_bits(regmap, REG_SPDIF_SIE, 0xffffff, 0);
+
+		/* Configure BYPASS mode */
+		scr = SCR_TXSEL_RX | SCR_RXFIFO_OFF;
+		mask = SCR_RXFIFO_FSEL_MASK | SCR_RXFIFO_AUTOSYNC_MASK |
+			SCR_RXFIFO_CTL_MASK | SCR_RXFIFO_OFF_MASK | SCR_TXSEL_MASK;
+		/* Power up SPDIF module */
+		mask |= SCR_LOW_POWER;
+	} else {
+		/* Power down SPDIF module, disable TX */
+		scr = SCR_LOW_POWER | SCR_TXSEL_OFF;
+		mask = SCR_LOW_POWER | SCR_TXSEL_MASK;
+	}
+
+	regmap_update_bits(regmap, REG_SPDIF_SCR, mask, scr);
+
+	/* Disable playback & capture if BYPASS mode is enabled, enable otherwise */
+	for_each_pcm_streams(stream)
+		rtd->pcm->streams[stream].substream_count = (set ? 0 : 1);
+
+	priv->bypass = set;
+	pm_runtime_put_sync(dai->dev);
+
+	return 0;
+}
+
 /* DPLL lock information */
 static int fsl_spdif_rxrate_info(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_info *uinfo)
@@ -1075,6 +1140,15 @@ static struct snd_kcontrol_new fsl_spdif_ctrls[] = {
 		.info = fsl_spdif_rxrate_info,
 		.get = fsl_spdif_rxrate_get,
 	},
+	/* RX bypass controller */
+	{
+		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
+		.name = "Bypass Mode",
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+		.info = snd_ctl_boolean_mono_info,
+		.get = fsl_spdif_bypass_get,
+		.put = fsl_spdif_bypass_put,
+	},
 	/* User bit sync mode set/get controller */
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
-- 
2.17.1

