Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 961CD5B1F50
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 15:35:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E6C71723;
	Thu,  8 Sep 2022 15:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E6C71723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662644104;
	bh=dRJ4FADsmm3Kk1TLg4yzIIRKN8a9pJaXXtmByiUNpCE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cSJSATb5mFBzER8Cdxk+brgY4a4eE+z2ba3mHGRUcmSvZd+Z6uKfVhmX1khbCwR5E
	 S9iOzoaqmsvb4m2GOmjEyi1s4CN6BDcCundm9AaSVH/HcLoVOk7/wHmpHUT3zuwqnG
	 xlIU0/t0gpeqp7NCSv77jE7udu/1uDM4CmaQPKtg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 397CBF80535;
	Thu,  8 Sep 2022 15:33:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66F6FF80533; Thu,  8 Sep 2022 15:33:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3E50F80528
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 15:33:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3E50F80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="h0NfNX49"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1662644032;
 x=1694180032;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SLeMQGHozrhxgC+OQ4foA2uIq7OBJIq9YH/gm12LWQQ=;
 b=h0NfNX49oUmRyVee7xE8wYY3uTqQE7I2QUnGIVALEAJCTZncMikTkraX
 CK/yLC5GpTl9/+R042ari142dZI3S3qk3t+LMaIt83UnKDAhcfxf8b7Gd
 6dxOWIr4f68QVVdwIL9rd3MCPvUqn/pGc2vQXQTjIvOEl/DniWPdSScMP
 Jg8jAjl3+3EvbEoFetJRZD1ApvnFOoUl4K5heDV0iuiKq+XEH6nDLbrUS
 MJREiWPJLc82JQ/f2JyCZ18PvEFEqOW/K+hwwJTanbI9ydrFwPsNug9pg
 3K/cbU0QScyniY9PutrNJJaCbLwuqbx8j//YJ6fjwR9Ga91E91diyxV+A g==;
From: <robert.rosengren@axis.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: fsl_spdif: add ALSA event on dpll locked
Date: Thu, 8 Sep 2022 15:33:19 +0200
Message-ID: <20220908133319.2149486-1-robert.rosengren@axis.com>
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

From: Robert Rosengren <robert.rosengren@axis.com>

Add an ALSA event on the RX Sample Rate controller upon the dpll locked
interrupt, making it possible for audio applications to monitor changes
in the hardware.

Signed-off-by: Robert Rosengren <robert.rosengren@axis.com>
---
 sound/soc/fsl/fsl_spdif.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 7fc1c96929bb..1679a21ffdca 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -44,6 +44,8 @@ static u8 srpc_dpll_locked[] = { 0x0, 0x1, 0x2, 0x3, 0x4, 0xa, 0xb };
 
 #define DEFAULT_RXCLK_SRC	1
 
+#define RX_SAMPLE_RATE_KCONTROL "RX Sample Rate"
+
 /**
  * struct fsl_spdif_soc_data: soc specific data
  *
@@ -122,6 +124,7 @@ struct fsl_spdif_priv {
 	const struct fsl_spdif_soc_data *soc;
 	struct spdif_mixer_control fsl_spdif_control;
 	struct snd_soc_dai_driver cpu_dai_drv;
+	struct snd_soc_dai *dai;
 	struct platform_device *pdev;
 	struct regmap *regmap;
 	bool dpll_locked;
@@ -223,9 +226,19 @@ static void spdif_irq_dpll_lock(struct fsl_spdif_priv *spdif_priv)
 	locked &= SRPC_DPLL_LOCKED;
 
 	dev_dbg(&pdev->dev, "isr: Rx dpll %s \n",
-			locked ? "locked" : "loss lock");
+		locked ? "locked" : "loss lock");
 
 	spdif_priv->dpll_locked = locked ? true : false;
+
+	if (spdif_priv->dai) {
+		struct snd_soc_component *component = spdif_priv->dai->component;
+		struct snd_kcontrol *kctl = snd_soc_card_get_kcontrol(component->card,
+						RX_SAMPLE_RATE_KCONTROL);
+
+		if (kctl)
+			snd_ctl_notify(component->card->snd_card,
+				SNDRV_CTL_EVENT_MASK_VALUE, &kctl->id);
+	}
 }
 
 /* Receiver found illegal symbol interrupt handler */
@@ -1197,7 +1210,7 @@ static struct snd_kcontrol_new fsl_spdif_ctrls[] = {
 	/* DPLL lock info get controller */
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_PCM,
-		.name = "RX Sample Rate",
+		.name = RX_SAMPLE_RATE_KCONTROL,
 		.access = SNDRV_CTL_ELEM_ACCESS_READ |
 			SNDRV_CTL_ELEM_ACCESS_VOLATILE,
 		.info = fsl_spdif_rxrate_info,
@@ -1241,6 +1254,7 @@ static struct snd_kcontrol_new fsl_spdif_ctrls_rcm[] = {
 static int fsl_spdif_dai_probe(struct snd_soc_dai *dai)
 {
 	struct fsl_spdif_priv *spdif_private = snd_soc_dai_get_drvdata(dai);
+	spdif_private->dai = dai;
 
 	snd_soc_dai_init_dma_data(dai, &spdif_private->dma_params_tx,
 				  &spdif_private->dma_params_rx);
-- 
2.30.2

