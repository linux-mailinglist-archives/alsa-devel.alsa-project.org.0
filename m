Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A685B58CF
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 12:55:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CD9316CD;
	Mon, 12 Sep 2022 12:54:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CD9316CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662980135;
	bh=7g1RtnWABQR8awdbSFeX3J+l0L9Keivonbc15GoOU2s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RK8PJvb+p0HTHLZ1Ed/JoBKTO3hOYfYFRyM0jRzUJR3bY2okqeBJhy2IWITdtcmUz
	 hdaQCKqlIAo2rM/Y8ULEiKMGZsPPV7om9x4qCEyCAnP4QsbpkH0DT0a6LUXS5TuduB
	 vb116KiWPST1woHGZx7F9BixtRR6qsgT/lEoYJXw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E14AF80095;
	Mon, 12 Sep 2022 12:54:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0A44F8027B; Mon, 12 Sep 2022 12:54:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAAE1F80095
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 12:54:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAAE1F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="DQPrtibz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1662980069;
 x=1694516069;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zcCPdyVFjoLSrALVKxpoZHGptNVeUKmuKNlSNE721J4=;
 b=DQPrtibzm+yuCY9yc0Yk2v6Yb2d1CwDHw3ZYVZiDORH4bXTPgVxsUX+Y
 l967mUV62wXeKdqXtFMYoYa2OkT8upRGuu0bsCnXYJtAohMLKY02Ru7Ri
 mgwUPXETcIcy+LDFQQfVaoNLp4H8s/DQCZZz6vxpMShxJHgByP0rtutPd
 /6G4PJ5ohHmUUyh9PPDHu8v8iC4gQQ12JAV1h55rkGLXwhRH+n6oLcWk0
 +B3tdYHy6iaZxNqg1J/H4Q+sIaiG/jkuFYqOdlpZ1xoeiwzrnevacqrB0
 xm1J/CcRfzl2RL3I+T1JCpHr18iQzt4j+k8w1t+3cx66kRTaL8Tk6GXsO w==;
From: Robert Rosengren <robert.rosengren@axis.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2] ASoC: fsl_spdif: add ALSA event on dpll locked
Date: Mon, 12 Sep 2022 12:54:07 +0200
Message-ID: <20220912105407.3157868-1-robert.rosengren@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, kernel@axis.com,
 alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>
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

Add an ALSA event on the RX Sample Rate controller upon the dpll locked
interrupt, making it possible for audio applications to monitor changes
in the hardware.

Signed-off-by: Robert Rosengren <robert.rosengren@axis.com>
---

Notes:
    v2: Cache RX Sample Rate kcontrol to avoid lookup in interrupt.
    Properly add description to fsl_spdif_priv.
    Fix indentation.

 sound/soc/fsl/fsl_spdif.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 7fc1c96929bb..275aba8e0c46 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -44,6 +44,8 @@ static u8 srpc_dpll_locked[] = { 0x0, 0x1, 0x2, 0x3, 0x4, 0xa, 0xb };
 
 #define DEFAULT_RXCLK_SRC	1
 
+#define RX_SAMPLE_RATE_KCONTROL "RX Sample Rate"
+
 /**
  * struct fsl_spdif_soc_data: soc specific data
  *
@@ -98,6 +100,8 @@ struct spdif_mixer_control {
  * @soc: SPDIF soc data
  * @fsl_spdif_control: SPDIF control data
  * @cpu_dai_drv: cpu dai driver
+ * @snd_card: sound card pointer
+ * @rxrate_kcontrol: kcontrol for RX Sample Rate
  * @pdev: platform device pointer
  * @regmap: regmap handler
  * @dpll_locked: dpll lock flag
@@ -122,6 +126,8 @@ struct fsl_spdif_priv {
 	const struct fsl_spdif_soc_data *soc;
 	struct spdif_mixer_control fsl_spdif_control;
 	struct snd_soc_dai_driver cpu_dai_drv;
+	struct snd_card *snd_card;
+	struct snd_kcontrol *rxrate_kcontrol;
 	struct platform_device *pdev;
 	struct regmap *regmap;
 	bool dpll_locked;
@@ -226,6 +232,12 @@ static void spdif_irq_dpll_lock(struct fsl_spdif_priv *spdif_priv)
 			locked ? "locked" : "loss lock");
 
 	spdif_priv->dpll_locked = locked ? true : false;
+
+	if (spdif_priv->snd_card && spdif_priv->rxrate_kcontrol) {
+		snd_ctl_notify(spdif_priv->snd_card,
+			       SNDRV_CTL_EVENT_MASK_VALUE,
+			       &spdif_priv->rxrate_kcontrol->id);
+	}
 }
 
 /* Receiver found illegal symbol interrupt handler */
@@ -1197,7 +1209,7 @@ static struct snd_kcontrol_new fsl_spdif_ctrls[] = {
 	/* DPLL lock info get controller */
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
-		.name = "RX Sample Rate",
+		.name = RX_SAMPLE_RATE_KCONTROL,
 		.access = SNDRV_CTL_ELEM_ACCESS_READ |
 			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
 		.info = fsl_spdif_rxrate_info,
@@ -1251,6 +1263,13 @@ static int fsl_spdif_dai_probe(struct snd_soc_dai *dai)
 		snd_soc_add_dai_controls(dai, fsl_spdif_ctrls_rcm,
 					 ARRAY_SIZE(fsl_spdif_ctrls_rcm));
 
+	spdif_private->snd_card = dai->component->card->snd_card;
+	spdif_private->rxrate_kcontrol = snd_soc_card_get_kcontrol(dai->component->card,
+								   RX_SAMPLE_RATE_KCONTROL);
+	if (!spdif_private->rxrate_kcontrol)
+		dev_err(&spdif_private->pdev->dev, "failed to get %s kcontrol\n",
+			RX_SAMPLE_RATE_KCONTROL);
+
 	/*Clear the val bit for Tx*/
 	regmap_update_bits(spdif_private->regmap, REG_SPDIF_SCR,
 			   SCR_VAL_MASK, SCR_VAL_CLEAR);
-- 
2.30.2

