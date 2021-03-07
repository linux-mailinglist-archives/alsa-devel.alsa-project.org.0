Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B68203302A5
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Mar 2021 16:23:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABA221F80;
	Sun,  7 Mar 2021 16:22:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABA221F80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615130612;
	bh=WrEnMnfrg4WQvhCfsR3KHDcP/+GG1ag79yAWOSeWeXY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cK5egKkro8PJCK2WCruFJkrk1CULpg2u7rFc32Dy/pP9Y6/LdYABvQuWN5DEvzukA
	 VXsRNvol5smY/YYHrCJUWjUbo02HC5uidmnGDyNYByHsV9+CmPYnxJr5fVopLg9wMo
	 eAkWvIW9ikVlGY4VW0PdHLibLeqrduC8sgbjv6vc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BBC1F804FD;
	Sun,  7 Mar 2021 16:18:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5263F804EC; Sun,  7 Mar 2021 16:18:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CCC6F804CF
 for <alsa-devel@alsa-project.org>; Sun,  7 Mar 2021 16:18:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CCC6F804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="FneBrqXn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615130325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gNbgYuE5FygJLfMZg7v7oCfN6FUWff2DRIoVwn1soO0=;
 b=FneBrqXn8yRH71mg33fUn+gk9mzJERNtZKI4T7jyutdV2Q2AxJhMFMz7DZ5b/RvLPLX4mp
 tftvkvO5DdXQ6oWvXRidgIN3d5Ea7TvBfw1I53Yxee6/7zATTWOQKFCATQeN97UcQJ/2Mp
 z1ILLx0+PRCjBEWyLzbhKi3C2z3yXdk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-tkodkXEqP7OAe3hubeqMow-1; Sun, 07 Mar 2021 10:18:43 -0500
X-MC-Unique: tkodkXEqP7OAe3hubeqMow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3EDA107465C;
 Sun,  7 Mar 2021 15:18:41 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F0D060BF1;
 Sun,  7 Mar 2021 15:18:39 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Lee Jones <lee.jones@linaro.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 resend 09/13] ASoC: arizona-jack: convert into a helper
 library for codec drivers
Date: Sun,  7 Mar 2021 16:18:03 +0100
Message-Id: <20210307151807.35201-10-hdegoede@redhat.com>
In-Reply-To: <20210307151807.35201-1-hdegoede@redhat.com>
References: <20210307151807.35201-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
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

Convert the arizona extcon driver into a helper library for direct use
from the arizona codec-drivers, rather then being bound to a separate
MFD cell.

Note the probe (and remove) sequence is split into 2 parts:

1. The arizona_jack_codec_dev_probe() function inits a bunch of
jack-detect specific variables in struct arizona_priv and tries to get
a number of resources where getting them may fail with -EPROBE_DEFER.

2. Then once the machine driver has create a snd_sock_jack through
snd_soc_card_jack_new() it calls snd_soc_component_set_jack() on
the codec component, which will call the new arizona_jack_set_jack(),
which sets up jack-detection and requests the IRQs.

This split is necessary, because the IRQ handlers need access to the
arizona->dapm pointer and the snd_sock_jack which are not available
when the codec-driver's probe function runs.

Note this requires that machine-drivers for codecs which are converted
to use the new helper functions from arizona-jack.c are modified to
create a snd_soc_jack through snd_soc_card_jack_new() and register
this jack with the codec through snd_soc_component_set_jack().

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Pass dev (the codec-device) to devm_regulator_get instead of
  passing arizona->dev. This is necessary so that the regulator gets
  properly released when the coded driver unbinds.
---
 sound/soc/codecs/Makefile       |   2 +-
 sound/soc/codecs/arizona-jack.c | 125 +++++++++++++++-----------------
 sound/soc/codecs/arizona.h      |   6 ++
 3 files changed, 65 insertions(+), 68 deletions(-)

diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 81357dc62ea0..bc7a96c3097a 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -43,7 +43,7 @@ snd-soc-ak4642-objs := ak4642.o
 snd-soc-ak4671-objs := ak4671.o
 snd-soc-ak5386-objs := ak5386.o
 snd-soc-ak5558-objs := ak5558.o
-snd-soc-arizona-objs := arizona.o
+snd-soc-arizona-objs := arizona.o arizona-jack.o
 snd-soc-bd28623-objs := bd28623.o
 snd-soc-bt-sco-objs := bt-sco.o
 snd-soc-cpcap-objs := cpcap.o
diff --git a/sound/soc/codecs/arizona-jack.c b/sound/soc/codecs/arizona-jack.c
index a6e8071f84ab..e121490eb379 100644
--- a/sound/soc/codecs/arizona-jack.c
+++ b/sound/soc/codecs/arizona-jack.c
@@ -7,14 +7,12 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/i2c.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/input.h>
-#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
@@ -1337,27 +1335,16 @@ static int arizona_extcon_device_get_pdata(struct device *dev,
 	return 0;
 }
 
-static int arizona_extcon_probe(struct platform_device *pdev)
+int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev)
 {
-	struct arizona *arizona = dev_get_drvdata(pdev->dev.parent);
+	struct arizona *arizona = info->arizona;
 	struct arizona_pdata *pdata = &arizona->pdata;
-	struct arizona_priv *info;
-	unsigned int val;
-	unsigned int clamp_mode;
-	int jack_irq_fall, jack_irq_rise;
-	int ret, mode, i, j;
-
-	if (!arizona->dapm || !arizona->dapm->card)
-		return -EPROBE_DEFER;
-
-	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
-	if (!info)
-		return -ENOMEM;
+	int ret, mode;
 
 	if (!dev_get_platdata(arizona->dev))
-		arizona_extcon_device_get_pdata(&pdev->dev, arizona);
+		arizona_extcon_device_get_pdata(dev, arizona);
 
-	info->micvdd = devm_regulator_get(&pdev->dev, "MICVDD");
+	info->micvdd = devm_regulator_get(dev, "MICVDD");
 	if (IS_ERR(info->micvdd)) {
 		ret = PTR_ERR(info->micvdd);
 		dev_err(arizona->dev, "Failed to get MICVDD: %d\n", ret);
@@ -1365,12 +1352,10 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 	}
 
 	mutex_init(&info->lock);
-	info->arizona = arizona;
 	info->last_jackdet = ~(ARIZONA_MICD_CLAMP_STS | ARIZONA_JD1_STS);
 	INIT_DELAYED_WORK(&info->hpdet_work, arizona_hpdet_work);
 	INIT_DELAYED_WORK(&info->micd_detect_work, arizona_micd_detect);
 	INIT_DELAYED_WORK(&info->micd_timeout_work, arizona_micd_timeout_work);
-	platform_set_drvdata(pdev, info);
 
 	switch (arizona->type) {
 	case WM5102:
@@ -1404,20 +1389,20 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 		break;
 	}
 
-	info->edev = devm_extcon_dev_allocate(&pdev->dev, arizona_cable);
+	info->edev = devm_extcon_dev_allocate(dev, arizona_cable);
 	if (IS_ERR(info->edev)) {
-		dev_err(&pdev->dev, "failed to allocate extcon device\n");
+		dev_err(arizona->dev, "failed to allocate extcon device\n");
 		return -ENOMEM;
 	}
 
-	ret = devm_extcon_dev_register(&pdev->dev, info->edev);
+	ret = devm_extcon_dev_register(dev, info->edev);
 	if (ret < 0) {
 		dev_err(arizona->dev, "extcon_dev_register() failed: %d\n",
 			ret);
 		return ret;
 	}
 
-	info->input = devm_input_allocate_device(&pdev->dev);
+	info->input = devm_input_allocate_device(dev);
 	if (!info->input) {
 		dev_err(arizona->dev, "Can't allocate input dev\n");
 		ret = -ENOMEM;
@@ -1448,7 +1433,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 		else
 			mode = GPIOF_OUT_INIT_LOW;
 
-		ret = devm_gpio_request_one(&pdev->dev, pdata->micd_pol_gpio,
+		ret = devm_gpio_request_one(dev, pdata->micd_pol_gpio,
 					    mode, "MICD polarity");
 		if (ret != 0) {
 			dev_err(arizona->dev, "Failed to request GPIO%d: %d\n",
@@ -1481,17 +1466,38 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 	}
 
 	if (arizona->pdata.hpdet_id_gpio > 0) {
-		ret = devm_gpio_request_one(&pdev->dev,
-					    arizona->pdata.hpdet_id_gpio,
+		ret = devm_gpio_request_one(dev, arizona->pdata.hpdet_id_gpio,
 					    GPIOF_OUT_INIT_LOW,
 					    "HPDET");
 		if (ret != 0) {
 			dev_err(arizona->dev, "Failed to request GPIO%d: %d\n",
 				arizona->pdata.hpdet_id_gpio, ret);
-			goto err_gpio;
+			gpiod_put(info->micd_pol_gpio);
+			return ret;
 		}
 	}
 
+	return 0;
+}
+EXPORT_SYMBOL_GPL(arizona_jack_codec_dev_probe);
+
+int arizona_jack_codec_dev_remove(struct arizona_priv *info)
+{
+	gpiod_put(info->micd_pol_gpio);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(arizona_jack_codec_dev_remove);
+
+static int arizona_jack_enable_jack_detect(struct arizona_priv *info,
+					   struct snd_soc_jack *jack)
+{
+	struct arizona *arizona = info->arizona;
+	struct arizona_pdata *pdata = &arizona->pdata;
+	unsigned int val;
+	unsigned int clamp_mode;
+	int jack_irq_fall, jack_irq_rise;
+	int ret, i, j;
+
 	if (arizona->pdata.micd_bias_start_time)
 		regmap_update_bits(arizona->regmap, ARIZONA_MIC_DETECT_1,
 				   ARIZONA_MICD_BIAS_STARTTIME_MASK,
@@ -1532,16 +1538,15 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 	if (arizona->pdata.num_micd_ranges > ARIZONA_MAX_MICD_RANGE) {
 		dev_err(arizona->dev, "Too many MICD ranges: %d\n",
 			arizona->pdata.num_micd_ranges);
+		return -EINVAL;
 	}
 
 	if (info->num_micd_ranges > 1) {
 		for (i = 1; i < info->num_micd_ranges; i++) {
 			if (info->micd_ranges[i - 1].max >
 			    info->micd_ranges[i].max) {
-				dev_err(arizona->dev,
-					"MICD ranges must be sorted\n");
-				ret = -EINVAL;
-				goto err_gpio;
+				dev_err(arizona->dev, "MICD ranges must be sorted\n");
+				return -EINVAL;
 			}
 		}
 	}
@@ -1559,8 +1564,7 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 		if (j == ARIZONA_NUM_MICD_BUTTON_LEVELS) {
 			dev_err(arizona->dev, "Unsupported MICD level %d\n",
 				info->micd_ranges[i].max);
-			ret = -EINVAL;
-			goto err_gpio;
+			return -EINVAL;
 		}
 
 		dev_dbg(arizona->dev, "%d ohms for MICD threshold %d\n",
@@ -1629,43 +1633,40 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 	ret = arizona_request_irq(arizona, jack_irq_rise,
 				  "JACKDET rise", arizona_jackdet, info);
 	if (ret != 0) {
-		dev_err(&pdev->dev, "Failed to get JACKDET rise IRQ: %d\n",
-			ret);
+		dev_err(arizona->dev, "Failed to get JACKDET rise IRQ: %d\n", ret);
 		goto err_pm;
 	}
 
 	ret = arizona_set_irq_wake(arizona, jack_irq_rise, 1);
 	if (ret != 0) {
-		dev_err(&pdev->dev, "Failed to set JD rise IRQ wake: %d\n",
-			ret);
+		dev_err(arizona->dev, "Failed to set JD rise IRQ wake: %d\n", ret);
 		goto err_rise;
 	}
 
 	ret = arizona_request_irq(arizona, jack_irq_fall,
 				  "JACKDET fall", arizona_jackdet, info);
 	if (ret != 0) {
-		dev_err(&pdev->dev, "Failed to get JD fall IRQ: %d\n", ret);
+		dev_err(arizona->dev, "Failed to get JD fall IRQ: %d\n", ret);
 		goto err_rise_wake;
 	}
 
 	ret = arizona_set_irq_wake(arizona, jack_irq_fall, 1);
 	if (ret != 0) {
-		dev_err(&pdev->dev, "Failed to set JD fall IRQ wake: %d\n",
-			ret);
+		dev_err(arizona->dev, "Failed to set JD fall IRQ wake: %d\n", ret);
 		goto err_fall;
 	}
 
 	ret = arizona_request_irq(arizona, ARIZONA_IRQ_MICDET,
 				  "MICDET", arizona_micdet, info);
 	if (ret != 0) {
-		dev_err(&pdev->dev, "Failed to get MICDET IRQ: %d\n", ret);
+		dev_err(arizona->dev, "Failed to get MICDET IRQ: %d\n", ret);
 		goto err_fall_wake;
 	}
 
 	ret = arizona_request_irq(arizona, ARIZONA_IRQ_HPDET,
 				  "HPDET", arizona_hpdet_irq, info);
 	if (ret != 0) {
-		dev_err(&pdev->dev, "Failed to get HPDET IRQ: %d\n", ret);
+		dev_err(arizona->dev, "Failed to get HPDET IRQ: %d\n", ret);
 		goto err_micdet;
 	}
 
@@ -1677,12 +1678,11 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 
 	ret = regulator_allow_bypass(info->micvdd, true);
 	if (ret != 0)
-		dev_warn(arizona->dev, "Failed to set MICVDD to bypass: %d\n",
-			 ret);
+		dev_warn(arizona->dev, "Failed to set MICVDD to bypass: %d\n", ret);
 
 	ret = input_register_device(info->input);
 	if (ret) {
-		dev_err(&pdev->dev, "Can't register input device: %d\n", ret);
+		dev_err(arizona->dev, "Can't register input device: %d\n", ret);
 		goto err_hpdet;
 	}
 
@@ -1704,14 +1704,11 @@ static int arizona_extcon_probe(struct platform_device *pdev)
 	arizona_free_irq(arizona, jack_irq_rise, info);
 err_pm:
 	pm_runtime_put(arizona->dev);
-err_gpio:
-	gpiod_put(info->micd_pol_gpio);
 	return ret;
 }
 
-static int arizona_extcon_remove(struct platform_device *pdev)
+static int arizona_jack_disable_jack_detect(struct arizona_priv *info)
 {
-	struct arizona_priv *info = platform_get_drvdata(pdev);
 	struct arizona *arizona = info->arizona;
 	int jack_irq_rise, jack_irq_fall;
 	bool change;
@@ -1739,8 +1736,7 @@ static int arizona_extcon_remove(struct platform_device *pdev)
 				       ARIZONA_MICD_ENA, 0,
 				       &change);
 	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to disable micd on remove: %d\n",
-			ret);
+		dev_err(arizona->dev, "Failed to disable micd on remove: %d\n", ret);
 	} else if (change) {
 		regulator_disable(info->micvdd);
 		pm_runtime_put(arizona->dev);
@@ -1753,22 +1749,17 @@ static int arizona_extcon_remove(struct platform_device *pdev)
 			   ARIZONA_JD1_ENA, 0);
 	arizona_clk32k_disable(arizona);
 
-	gpiod_put(info->micd_pol_gpio);
-
 	return 0;
 }
 
-static struct platform_driver arizona_extcon_driver = {
-	.driver		= {
-		.name	= "arizona-extcon",
-	},
-	.probe		= arizona_extcon_probe,
-	.remove		= arizona_extcon_remove,
-};
-
-module_platform_driver(arizona_extcon_driver);
+int arizona_jack_set_jack(struct snd_soc_component *component,
+			  struct snd_soc_jack *jack, void *data)
+{
+	struct arizona_priv *info = snd_soc_component_get_drvdata(component);
 
-MODULE_DESCRIPTION("Arizona Extcon driver");
-MODULE_AUTHOR("Mark Brown <broonie@opensource.wolfsonmicro.com>");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:extcon-arizona");
+	if (jack)
+		return arizona_jack_enable_jack_detect(info, jack);
+	else
+		return arizona_jack_disable_jack_detect(info);
+}
+EXPORT_SYMBOL_GPL(arizona_jack_set_jack);
diff --git a/sound/soc/codecs/arizona.h b/sound/soc/codecs/arizona.h
index 7132dbc3c840..fc515845a3e6 100644
--- a/sound/soc/codecs/arizona.h
+++ b/sound/soc/codecs/arizona.h
@@ -386,4 +386,10 @@ static inline int arizona_unregister_notifier(struct snd_soc_component *componen
 
 int arizona_of_get_audio_pdata(struct arizona *arizona);
 
+int arizona_jack_codec_dev_probe(struct arizona_priv *info, struct device *dev);
+int arizona_jack_codec_dev_remove(struct arizona_priv *info);
+
+int arizona_jack_set_jack(struct snd_soc_component *component,
+			  struct snd_soc_jack *jack, void *data);
+
 #endif
-- 
2.30.1

