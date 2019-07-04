Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AE15F81D
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 14:30:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 406991699;
	Thu,  4 Jul 2019 14:29:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 406991699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562243402;
	bh=qzufTYa+nt5Trntrkeb/g5vlxcqpkPD8MNauPMHKHqc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=TcY479SS7iKfnbFO+Dg4f3Q4EEmvfpxvtjN/eOAY/v6wcKofo0JzSs9VvadwgU1/Z
	 EdPmA9uYoEluglun3kk8snyoRED9xbtNIzirrabbN8NGsGNN6YogyYqndAQ2AE+7Bb
	 OFJDEYkPUmwG/MNiLjGf/uVq6kChRQjmvrTfpsTs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A508F80149;
	Thu,  4 Jul 2019 14:25:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCC10F8011C; Thu,  4 Jul 2019 14:25:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 828A6F800E7
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 14:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 828A6F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="sTx+osOV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=C/SWYCqotltYKEsedLeUxy0qeatwlk0NNa0qAynzqlI=; b=sTx+osOVwzlT
 o4ZiIkblXE2F2cu+WvuznYjDLM/Bj3AzkpwUHmL2tniFoxLE+ABagommDgNRN8SluSIH5aDQd2ZiE
 TcOEpAii1MXJVOma8mvPLAcBnd9VtNMv+LGkimBissRxkg3wuhIpxY7XDdsIJrih04qnmnaAa099v
 AFsxs=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hj0nH-0000io-EZ; Thu, 04 Jul 2019 12:24:55 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id CB0912742B5A; Thu,  4 Jul 2019 13:24:54 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Mac Chiang <mac.chiang@intel.com>
In-Reply-To: <1560939513-20601-1-git-send-email-mac.chiang@intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190704122454.CB0912742B5A@ypsilon.sirena.org.uk>
Date: Thu,  4 Jul 2019 13:24:54 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 mac.chiang@intel.com, lgirdwood@gmail.com, liam.r.girdwood@intel.com
Subject: [alsa-devel] Applied "ASoC: max98357a: avoid speaker pop when
	playback startup" to the asoc tree
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

   ASoC: max98357a: avoid speaker pop when playback startup

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From cec5b01f8f1c6064037f3181e7690e3765ed995b Mon Sep 17 00:00:00 2001
From: Mac Chiang <mac.chiang@intel.com>
Date: Wed, 19 Jun 2019 18:18:33 +0800
Subject: [PATCH] ASoC: max98357a: avoid speaker pop when playback startup

Loud speaker pop happens during playback even when in slience
playback. Specify Max98357a amp delay times to make sure
clocks are always earlier than sdmode on.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../devicetree/bindings/sound/max98357a.txt   |  4 ++
 sound/soc/codecs/max98357a.c                  | 55 ++++++++++++++++---
 2 files changed, 50 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/max98357a.txt b/Documentation/devicetree/bindings/sound/max98357a.txt
index 28645a2ff885..4bce14ce806f 100644
--- a/Documentation/devicetree/bindings/sound/max98357a.txt
+++ b/Documentation/devicetree/bindings/sound/max98357a.txt
@@ -9,6 +9,10 @@ Optional properties:
 - sdmode-gpios : GPIO specifier for the chip's SD_MODE pin.
         If this option is not specified then driver does not manage
         the pin state (e.g. chip is always on).
+- sdmode-delay : specify delay time for SD_MODE pin.
+        If this option is specified, which means it's required i2s clocks
+        ready before SD_MODE is unmuted in order to avoid the speaker pop noise.
+        It's observed that 5ms is sufficient.
 
 Example:
 
diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index 6f724c9a3867..6f0e28f903bf 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -19,24 +19,42 @@
 #include <sound/soc-dai.h>
 #include <sound/soc-dapm.h>
 
+struct max98357a_priv {
+	struct delayed_work enable_sdmode_work;
+	struct gpio_desc *sdmode;
+	unsigned int sdmode_delay;
+};
+
+static void max98357a_enable_sdmode_work(struct work_struct *work)
+{
+	struct max98357a_priv *max98357a =
+	container_of(work, struct max98357a_priv,
+			enable_sdmode_work.work);
+
+	gpiod_set_value(max98357a->sdmode, 1);
+}
+
 static int max98357a_daiops_trigger(struct snd_pcm_substream *substream,
 		int cmd, struct snd_soc_dai *dai)
 {
-	struct gpio_desc *sdmode = snd_soc_dai_get_drvdata(dai);
+	struct max98357a_priv *max98357a = snd_soc_dai_get_drvdata(dai);
 
-	if (!sdmode)
+	if (!max98357a->sdmode)
 		return 0;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		gpiod_set_value(sdmode, 1);
+		queue_delayed_work(system_power_efficient_wq,
+				&max98357a->enable_sdmode_work,
+				msecs_to_jiffies(max98357a->sdmode_delay));
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		gpiod_set_value(sdmode, 0);
+		cancel_delayed_work_sync(&max98357a->enable_sdmode_work);
+		gpiod_set_value(max98357a->sdmode, 0);
 		break;
 	}
 
@@ -90,14 +108,33 @@ static struct snd_soc_dai_driver max98357a_dai_driver = {
 
 static int max98357a_platform_probe(struct platform_device *pdev)
 {
-	struct gpio_desc *sdmode;
+	struct max98357a_priv *max98357a;
+	int ret;
 
-	sdmode = devm_gpiod_get_optional(&pdev->dev,
+	max98357a = devm_kzalloc(&pdev->dev, sizeof(*max98357a), GFP_KERNEL);
+
+	if (!max98357a)
+		return -ENOMEM;
+
+	max98357a->sdmode = devm_gpiod_get_optional(&pdev->dev,
 				"sdmode", GPIOD_OUT_LOW);
-	if (IS_ERR(sdmode))
-		return PTR_ERR(sdmode);
 
-	dev_set_drvdata(&pdev->dev, sdmode);
+	if (IS_ERR(max98357a->sdmode))
+		return PTR_ERR(max98357a->sdmode);
+
+	ret = device_property_read_u32(&pdev->dev, "sdmode-delay",
+					&max98357a->sdmode_delay);
+
+	if (ret) {
+		max98357a->sdmode_delay = 0;
+		dev_dbg(&pdev->dev,
+			"no optional property 'sdmode-delay' found, default: no delay\n");
+	}
+
+	dev_set_drvdata(&pdev->dev, max98357a);
+
+	INIT_DELAYED_WORK(&max98357a->enable_sdmode_work,
+				max98357a_enable_sdmode_work);
 
 	return devm_snd_soc_register_component(&pdev->dev,
 			&max98357a_component_driver,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
