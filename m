Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C091C7F5EE
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 13:23:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A8ED1728;
	Fri,  2 Aug 2019 13:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A8ED1728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564745032;
	bh=HCDyAlzd7dnpuL8hSbwn8DMWrF/rXUoZTUd2hVvvXtA=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=CmOFea0/fb2hjaeZnI78IMu/Vu47Crb7+j7CxQEc7EcSbFz9ivSIlBSNUqst307VE
	 PdsO09SKSpUblJuKqhBV5hb1cnibwFdqIrAGK7zYYH5LiW0pTZSi0UzyTb0EgAx4O4
	 wteJ0B0vNnHvF9S6wXJQLpyC4ZgV1uiQW+y3n1M8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BB2AF8048E;
	Fri,  2 Aug 2019 13:22:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 948DDF8048F; Fri,  2 Aug 2019 13:22:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3072DF80114
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 13:22:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3072DF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Ldbk+/si"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=bhPZc34HeQ535rT0iZLm+ZZanJiRU64L3b7GFJx9TQ8=; b=Ldbk+/sifXQ0
 DTkWxBtCuxsK3buwCK//Urr0K8Hc3TeaBJPtiv/s5O/cYo4YF/dd8ZBgdGmgI+aJvZcrrPsN3YJWj
 HmeJEW7W2XCpoJRgll1NNtJM9KYP/0+/RxWRBq9ou/bRKSI+EbnrlOaAOe73zTVo0k1/sZXdOqnPm
 g5m7Y=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1htVdH-0007Rl-HY; Fri, 02 Aug 2019 11:21:59 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D11942742DA7; Fri,  2 Aug 2019 12:21:58 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <20190730181557.90391-50-swboyd@chromium.org>
X-Patchwork-Hint: ignore
Message-Id: <20190802112158.D11942742DA7@ypsilon.sirena.org.uk>
Date: Fri,  2 Aug 2019 12:21:58 +0100 (BST)
Cc: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: Remove dev_err() usage after
	platform_get_irq()" to the asoc tree
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

The patch

   ASoC: Remove dev_err() usage after platform_get_irq()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From cf9441adb1a35506d7606866c382b9d8614169b5 Mon Sep 17 00:00:00 2001
From: Stephen Boyd <swboyd@chromium.org>
Date: Tue, 30 Jul 2019 11:15:49 -0700
Subject: [PATCH] ASoC: Remove dev_err() usage after platform_get_irq()

We don't need dev_err() messages when platform_get_irq() fails now that
platform_get_irq() prints an error message itself when something goes
wrong. Let's remove these prints with a simple semantic patch.

// <smpl>
@@
expression ret;
struct platform_device *E;
@@

ret =
(
platform_get_irq(E, ...)
|
platform_get_irq_byname(E, ...)
);

if ( \( ret < 0 \| ret <= 0 \) )
{
(
-if (ret != -EPROBE_DEFER)
-{ ...
-dev_err(...);
-... }
|
...
-dev_err(...);
)
...
}
// </smpl>

While we're here, remove braces on if statements that only have one
statement (manually).

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Link: https://lore.kernel.org/r/20190730181557.90391-50-swboyd@chromium.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/atmel-classd.c             |  7 ++-----
 sound/soc/atmel/atmel-pdmic.c              |  7 ++-----
 sound/soc/bcm/cygnus-ssp.c                 |  7 ++-----
 sound/soc/codecs/msm8916-wcd-analog.c      | 12 +++---------
 sound/soc/codecs/twl6040.c                 |  4 +---
 sound/soc/fsl/fsl_asrc.c                   |  4 +---
 sound/soc/fsl/fsl_esai.c                   |  4 +---
 sound/soc/fsl/fsl_sai.c                    |  4 +---
 sound/soc/fsl/fsl_spdif.c                  |  4 +---
 sound/soc/fsl/fsl_ssi.c                    |  4 +---
 sound/soc/fsl/imx-ssi.c                    |  4 +---
 sound/soc/kirkwood/kirkwood-i2s.c          |  4 +---
 sound/soc/mediatek/common/mtk-btcvsd.c     |  4 +---
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c |  4 +---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c |  4 +---
 sound/soc/mxs/mxs-saif.c                   |  8 ++------
 sound/soc/qcom/lpass-platform.c            |  5 +----
 sound/soc/sof/intel/bdw.c                  |  5 +----
 sound/soc/sof/intel/byt.c                  |  5 +----
 sound/soc/sprd/sprd-mcdt.c                 |  4 +---
 sound/soc/sti/sti_uniperif.c               |  4 +---
 sound/soc/stm/stm32_i2s.c                  |  5 +----
 sound/soc/stm/stm32_sai.c                  |  4 +---
 sound/soc/stm/stm32_spdifrx.c              |  4 +---
 sound/soc/sunxi/sun4i-i2s.c                |  4 +---
 sound/soc/uniphier/aio-dma.c               |  4 +---
 sound/soc/xilinx/xlnx_formatter_pcm.c      |  2 --
 sound/soc/xtensa/xtfpga-i2s.c              |  1 -
 28 files changed, 32 insertions(+), 100 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 0f2c574f27f1..e98601eccfa3 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -571,11 +571,8 @@ static int atmel_classd_probe(struct platform_device *pdev)
 	dd->pdata = pdata;
 
 	dd->irq = platform_get_irq(pdev, 0);
-	if (dd->irq < 0) {
-		ret = dd->irq;
-		dev_err(dev, "failed to could not get irq: %d\n", ret);
-		return ret;
-	}
+	if (dd->irq < 0)
+		return dd->irq;
 
 	dd->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(dd->pclk)) {
diff --git a/sound/soc/atmel/atmel-pdmic.c b/sound/soc/atmel/atmel-pdmic.c
index e09c28349e0d..04ec6f0af179 100644
--- a/sound/soc/atmel/atmel-pdmic.c
+++ b/sound/soc/atmel/atmel-pdmic.c
@@ -612,11 +612,8 @@ static int atmel_pdmic_probe(struct platform_device *pdev)
 	dd->dev = dev;
 
 	dd->irq = platform_get_irq(pdev, 0);
-	if (dd->irq < 0) {
-		ret = dd->irq;
-		dev_err(dev, "failed to get irq: %d\n", ret);
-		return ret;
-	}
+	if (dd->irq < 0)
+		return dd->irq;
 
 	dd->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(dd->pclk)) {
diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index b7c358b48d8d..2f9357d7da96 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -1342,11 +1342,8 @@ static int cygnus_ssp_probe(struct platform_device *pdev)
 	}
 
 	cygaud->irq_num = platform_get_irq(pdev, 0);
-	if (cygaud->irq_num <= 0) {
-		dev_err(dev, "platform_get_irq failed\n");
-		err = cygaud->irq_num;
-		return err;
-	}
+	if (cygaud->irq_num <= 0)
+		return cygaud->irq_num;
 
 	err = audio_clk_init(pdev, cygaud);
 	if (err) {
diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 368b6c09474b..667e9f73aba3 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -1185,10 +1185,8 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq_byname(pdev, "mbhc_switch_int");
-	if (irq < 0) {
-		dev_err(dev, "failed to get mbhc switch irq\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = devm_request_threaded_irq(dev, irq, NULL,
 			       pm8916_mbhc_switch_irq_handler,
@@ -1200,10 +1198,8 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 
 	if (priv->mbhc_btn_enabled) {
 		irq = platform_get_irq_byname(pdev, "mbhc_but_press_det");
-		if (irq < 0) {
-			dev_err(dev, "failed to get button press irq\n");
+		if (irq < 0)
 			return irq;
-		}
 
 		ret = devm_request_threaded_irq(dev, irq, NULL,
 				       mbhc_btn_press_irq_handler,
@@ -1214,10 +1210,8 @@ static int pm8916_wcd_analog_spmi_probe(struct platform_device *pdev)
 			dev_err(dev, "cannot request mbhc button press irq\n");
 
 		irq = platform_get_irq_byname(pdev, "mbhc_but_rel_det");
-		if (irq < 0) {
-			dev_err(dev, "failed to get button release irq\n");
+		if (irq < 0)
 			return irq;
-		}
 
 		ret = devm_request_threaded_irq(dev, irq, NULL,
 				       mbhc_btn_release_irq_handler,
diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index 472c2fff34a8..f34637afee51 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -1108,10 +1108,8 @@ static int twl6040_probe(struct snd_soc_component *component)
 	priv->component = component;
 
 	priv->plug_irq = platform_get_irq(pdev, 0);
-	if (priv->plug_irq < 0) {
-		dev_err(component->dev, "invalid irq: %d\n", priv->plug_irq);
+	if (priv->plug_irq < 0)
 		return priv->plug_irq;
-	}
 
 	INIT_DELAYED_WORK(&priv->hs_jack.work, twl6040_accessory_work);
 
diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index cbbf6257f08a..cfa40ef6b1ca 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -885,10 +885,8 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "no irq for node %s\n", pdev->name);
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = devm_request_irq(&pdev->dev, irq, fsl_asrc_isr, 0,
 			       dev_name(&pdev->dev), asrc_priv);
diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 4ce8ac769244..5832144beb9f 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -962,10 +962,8 @@ static int fsl_esai_probe(struct platform_device *pdev)
 				PTR_ERR(esai_priv->spbaclk));
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "no irq for node %s\n", pdev->name);
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = devm_request_irq(&pdev->dev, irq, esai_isr, 0,
 			       esai_priv->name, esai_priv);
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 6d3c6c8d50ce..8f4d9fa95599 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -831,10 +831,8 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "no irq for node %s\n", pdev->name);
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = devm_request_irq(&pdev->dev, irq, fsl_sai_isr, 0, np->name, sai);
 	if (ret) {
diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 4842e6df9a2d..7858a5499ac5 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -1248,10 +1248,8 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 	}
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "no irq for node %s\n", pdev->name);
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = devm_request_irq(&pdev->dev, irq, spdif_isr, 0,
 			       dev_name(&pdev->dev), spdif_priv);
diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index fa862af25c1a..b0a6fead1a6a 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1510,10 +1510,8 @@ static int fsl_ssi_probe(struct platform_device *pdev)
 	}
 
 	ssi->irq = platform_get_irq(pdev, 0);
-	if (ssi->irq < 0) {
-		dev_err(dev, "no irq for node %s\n", pdev->name);
+	if (ssi->irq < 0)
 		return ssi->irq;
-	}
 
 	/* Set software limitations for synchronous mode except AC97 */
 	if (ssi->synchronous && !fsl_ssi_is_ac97(ssi)) {
diff --git a/sound/soc/fsl/imx-ssi.c b/sound/soc/fsl/imx-ssi.c
index 9038b61317be..42031ba7da31 100644
--- a/sound/soc/fsl/imx-ssi.c
+++ b/sound/soc/fsl/imx-ssi.c
@@ -520,10 +520,8 @@ static int imx_ssi_probe(struct platform_device *pdev)
 	}
 
 	ssi->irq = platform_get_irq(pdev, 0);
-	if (ssi->irq < 0) {
-		dev_err(&pdev->dev, "Failed to get IRQ: %d\n", ssi->irq);
+	if (ssi->irq < 0)
 		return ssi->irq;
-	}
 
 	ssi->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(ssi->clk)) {
diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index 5076ec4cc7a6..61226fefe1c4 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -537,10 +537,8 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->io);
 
 	priv->irq = platform_get_irq(pdev, 0);
-	if (priv->irq < 0) {
-		dev_err(&pdev->dev, "platform_get_irq failed: %d\n", priv->irq);
+	if (priv->irq < 0)
 		return priv->irq;
-	}
 
 	if (np) {
 		priv->burst = 128;		/* might be 32 or 128 */
diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index c7a81c4be068..d00608c73c6e 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -1335,10 +1335,8 @@ static int mtk_btcvsd_snd_probe(struct platform_device *pdev)
 
 	/* irq */
 	irq_id = platform_get_irq(pdev, 0);
-	if (irq_id <= 0) {
-		dev_err(dev, "%pOFn no irq found\n", dev->of_node);
+	if (irq_id <= 0)
 		return irq_id < 0 ? irq_id : -ENXIO;
-	}
 
 	ret = devm_request_irq(dev, irq_id, mtk_btcvsd_snd_irq_handler,
 			       IRQF_TRIGGER_LOW, "BTCVSD_ISR_Handle",
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index 7064a9fd6f74..9af76ae315a5 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -1342,10 +1342,8 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	irq_id = platform_get_irq_byname(pdev, "asys");
-	if (irq_id < 0) {
-		dev_err(dev, "unable to get ASYS IRQ\n");
+	if (irq_id < 0)
 		return irq_id;
-	}
 
 	ret = devm_request_irq(dev, irq_id, mt2701_asys_isr,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 90bd2c92cae7..0ee29255e731 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1074,10 +1074,8 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->dev = &pdev->dev;
 
 	irq_id = platform_get_irq(pdev, 0);
-	if (irq_id <= 0) {
-		dev_err(afe->dev, "np %pOFn no irq\n", afe->dev->of_node);
+	if (irq_id <= 0)
 		return irq_id < 0 ? irq_id : -ENXIO;
-	}
 	ret = devm_request_irq(afe->dev, irq_id, mt8173_afe_irq_handler,
 			       0, "Afe_ISR_Handle", (void *)afe);
 	if (ret) {
diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index a2c79426513b..1e38ce858326 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -790,12 +790,8 @@ static int mxs_saif_probe(struct platform_device *pdev)
 		return PTR_ERR(saif->base);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		ret = irq;
-		dev_err(&pdev->dev, "failed to get irq resource: %d\n",
-			ret);
-		return ret;
-	}
+	if (irq < 0)
+		return irq;
 
 	saif->dev = &pdev->dev;
 	ret = devm_request_irq(&pdev->dev, irq, mxs_saif_irq, 0,
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index cf7a299f4547..4c745baa39f7 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -564,11 +564,8 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 	int ret;
 
 	drvdata->lpaif_irq = platform_get_irq_byname(pdev, "lpass-irq-lpaif");
-	if (drvdata->lpaif_irq < 0) {
-		dev_err(&pdev->dev, "error getting irq handle: %d\n",
-			drvdata->lpaif_irq);
+	if (drvdata->lpaif_irq < 0)
 		return -ENODEV;
-	}
 
 	/* ensure audio hardware is disabled */
 	ret = regmap_write(drvdata->lpaif_map,
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 70d524ef9bc0..4bb9636da990 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -613,11 +613,8 @@ static int bdw_probe(struct snd_sof_dev *sdev)
 
 	/* register our IRQ */
 	sdev->ipc_irq = platform_get_irq(pdev, desc->irqindex_host_ipc);
-	if (sdev->ipc_irq < 0) {
-		dev_err(sdev->dev, "error: failed to get IRQ at index %d\n",
-			desc->irqindex_host_ipc);
+	if (sdev->ipc_irq < 0)
 		return sdev->ipc_irq;
-	}
 
 	dev_dbg(sdev->dev, "using IRQ %d\n", sdev->ipc_irq);
 	ret = devm_request_threaded_irq(sdev->dev, sdev->ipc_irq,
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 107d711efc3f..000d576f6a8d 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -728,11 +728,8 @@ static int byt_acpi_probe(struct snd_sof_dev *sdev)
 irq:
 	/* register our IRQ */
 	sdev->ipc_irq = platform_get_irq(pdev, desc->irqindex_host_ipc);
-	if (sdev->ipc_irq < 0) {
-		dev_err(sdev->dev, "error: failed to get IRQ at index %d\n",
-			desc->irqindex_host_ipc);
+	if (sdev->ipc_irq < 0)
 		return sdev->ipc_irq;
-	}
 
 	dev_dbg(sdev->dev, "using IRQ %d\n", sdev->ipc_irq);
 	ret = devm_request_threaded_irq(sdev->dev, sdev->ipc_irq,
diff --git a/sound/soc/sprd/sprd-mcdt.c b/sound/soc/sprd/sprd-mcdt.c
index 7448015a4935..f439e5503a3c 100644
--- a/sound/soc/sprd/sprd-mcdt.c
+++ b/sound/soc/sprd/sprd-mcdt.c
@@ -959,10 +959,8 @@ static int sprd_mcdt_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, mcdt);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "Failed to get MCDT interrupt\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = devm_request_irq(&pdev->dev, irq, sprd_mcdt_irq_handler,
 			       0, "sprd-mcdt", mcdt);
diff --git a/sound/soc/sti/sti_uniperif.c b/sound/soc/sti/sti_uniperif.c
index 645bcbe91601..ee4a0151e63e 100644
--- a/sound/soc/sti/sti_uniperif.c
+++ b/sound/soc/sti/sti_uniperif.c
@@ -426,10 +426,8 @@ static int sti_uniperiph_cpu_dai_of(struct device_node *node,
 				     UNIPERIF_FIFO_DATA_OFFSET(uni);
 
 	uni->irq = platform_get_irq(priv->pdev, 0);
-	if (uni->irq < 0) {
-		dev_err(dev, "Failed to get IRQ resource\n");
+	if (uni->irq < 0)
 		return -ENXIO;
-	}
 
 	uni->type = dev_data->type;
 
diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index ba6452dab69b..3e7226a53e53 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -855,11 +855,8 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 
 	/* Get irqs */
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		if (irq != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "no irq for node %s\n", pdev->name);
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = devm_request_irq(&pdev->dev, irq, stm32_i2s_isr, IRQF_ONESHOT,
 			       dev_name(&pdev->dev), i2s);
diff --git a/sound/soc/stm/stm32_sai.c b/sound/soc/stm/stm32_sai.c
index 1ac5103cea78..ef4273361d0d 100644
--- a/sound/soc/stm/stm32_sai.c
+++ b/sound/soc/stm/stm32_sai.c
@@ -193,10 +193,8 @@ static int stm32_sai_probe(struct platform_device *pdev)
 
 	/* init irqs */
 	sai->irq = platform_get_irq(pdev, 0);
-	if (sai->irq < 0) {
-		dev_err(&pdev->dev, "no irq for node %s\n", pdev->name);
+	if (sai->irq < 0)
 		return sai->irq;
-	}
 
 	/* reset */
 	rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);
diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index ee71b898897b..cd4b235fce57 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -909,10 +909,8 @@ static int stm32_spdifrx_parse_of(struct platform_device *pdev,
 	}
 
 	spdifrx->irq = platform_get_irq(pdev, 0);
-	if (spdifrx->irq < 0) {
-		dev_err(&pdev->dev, "No irq for node %s\n", pdev->name);
+	if (spdifrx->irq < 0)
 		return spdifrx->irq;
-	}
 
 	return 0;
 }
diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 9b2232908b65..d97d694c48df 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1087,10 +1087,8 @@ static int sun4i_i2s_probe(struct platform_device *pdev)
 		return PTR_ERR(regs);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "Can't retrieve our interrupt\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	i2s->variant = of_device_get_match_data(&pdev->dev);
 	if (!i2s->variant) {
diff --git a/sound/soc/uniphier/aio-dma.c b/sound/soc/uniphier/aio-dma.c
index 862346d66774..e8446cc4e8f8 100644
--- a/sound/soc/uniphier/aio-dma.c
+++ b/sound/soc/uniphier/aio-dma.c
@@ -289,10 +289,8 @@ int uniphier_aiodma_soc_register_platform(struct platform_device *pdev)
 		return PTR_ERR(chip->regmap);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(dev, "Could not get irq.\n");
+	if (irq < 0)
 		return irq;
-	}
 
 	ret = devm_request_irq(dev, irq, aiodma_irq,
 			       IRQF_SHARED, dev_name(dev), pdev);
diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index dc8721f4f56b..48970efe7838 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -613,7 +613,6 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 		aud_drv_data->mm2s_irq = platform_get_irq_byname(pdev,
 								 "irq_mm2s");
 		if (aud_drv_data->mm2s_irq < 0) {
-			dev_err(dev, "xlnx audio mm2s irq resource failed\n");
 			ret = aud_drv_data->mm2s_irq;
 			goto clk_err;
 		}
@@ -640,7 +639,6 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
 		aud_drv_data->s2mm_irq = platform_get_irq_byname(pdev,
 								 "irq_s2mm");
 		if (aud_drv_data->s2mm_irq < 0) {
-			dev_err(dev, "xlnx audio s2mm irq resource failed\n");
 			ret = aud_drv_data->s2mm_irq;
 			goto clk_err;
 		}
diff --git a/sound/soc/xtensa/xtfpga-i2s.c b/sound/soc/xtensa/xtfpga-i2s.c
index 9da395d14a8d..efd374f114a0 100644
--- a/sound/soc/xtensa/xtfpga-i2s.c
+++ b/sound/soc/xtensa/xtfpga-i2s.c
@@ -570,7 +570,6 @@ static int xtfpga_i2s_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
-		dev_err(&pdev->dev, "No IRQ resource\n");
 		err = irq;
 		goto err;
 	}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
