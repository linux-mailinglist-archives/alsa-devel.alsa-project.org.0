Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2242CFB0C8
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 13:49:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACA7D166D;
	Wed, 13 Nov 2019 13:48:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACA7D166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573649389;
	bh=LF0uZTWMACIjNrbSLFImDUKP33ZHYvY3HFu9lWFTWTM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TgkuviODVIfNuJrAO0BT+2KF2CVvGUm3wwUj5XHHKOVvVI4S94bfL8PXOeZFGLEwM
	 zkU2+yPpwk2kJF2UMytbOaATZp+nLU43y9f8a0YI0HVK1xKzPJktczgRX9Hl7P4x3J
	 D58SzrUCOY6yJT4reY/BQxQIpN/IPW5YhSXJmCRA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C537F80095;
	Wed, 13 Nov 2019 13:46:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86800F80084; Wed, 13 Nov 2019 13:46:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8FF5F8007F
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 13:46:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8FF5F8007F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MT7FUd3+"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xADCkQLH013616;
 Wed, 13 Nov 2019 06:46:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1573649186;
 bh=KcStxR+XaqqutrtFiRj7KO9BKQOGxi+kB1kiTLkhTJs=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=MT7FUd3+UFVzd4m9y37DYwp2DyEjjT/C3LjwIsTbh0KEWs9MHo6hzGBrOFtUBwIhg
 R6OnecrLkcAtMoT5bvb35d5Iztd9sg7B5YtFKnRE6kvmTiBurqK8v65CaZX/18CY8w
 bAOeNwoCEWldGyzca/00wQstFSfEbgfdfnSvrFHc=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xADCkQvw081427
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 13 Nov 2019 06:46:26 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 13
 Nov 2019 06:46:08 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 13 Nov 2019 06:46:25 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xADCkIGG127078;
 Wed, 13 Nov 2019 06:46:23 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Wed, 13 Nov 2019 14:47:34 +0200
Message-ID: <20191113124734.27984-3-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113124734.27984-1-peter.ujfalusi@ti.com>
References: <20191113124734.27984-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: [alsa-devel] [PATCH 2/2] ASoC: pcm3168a: Add support for optional
	RST gpio handling
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In case the RST line is connected to a GPIO line it needs to be pulled high
when the driver probes to be able to use the codec.

Add support also for cases when more than one codec is is controlled by the
same GPIO line by requesting the gpio with GPIOD_FLAGS_BIT_NONEXCLUSIVE.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>

--- asoc: pcm3168a rst
---
 sound/soc/codecs/pcm3168a.c | 38 +++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 313500ab36df..f3475134b519 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -9,7 +9,9 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
+#include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
@@ -59,6 +61,7 @@ struct pcm3168a_priv {
 	struct regulator_bulk_data supplies[PCM3168A_NUM_SUPPLIES];
 	struct regmap *regmap;
 	struct clk *scki;
+	struct gpio_desc *gpio_rst;
 	unsigned long sysclk;
 
 	struct pcm3168a_io_params io_params[2];
@@ -643,6 +646,7 @@ static bool pcm3168a_readable_register(struct device *dev, unsigned int reg)
 static bool pcm3168a_volatile_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
+	case PCM3168A_RST_SMODE:
 	case PCM3168A_DAC_ZERO:
 	case PCM3168A_ADC_OV:
 		return true;
@@ -702,6 +706,21 @@ int pcm3168a_probe(struct device *dev, struct regmap *regmap)
 
 	dev_set_drvdata(dev, pcm3168a);
 
+	/*
+	 * Request the RST gpio line as non exclusive as the same reset line
+	 * might be connected to multiple pcm3168a codec
+	 */
+	pcm3168a->gpio_rst = devm_gpiod_get_optional(dev, "rst",
+						GPIOD_OUT_HIGH |
+						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	if (IS_ERR(pcm3168a->gpio_rst)) {
+		ret = PTR_ERR(pcm3168a->gpio_rst);
+		if (ret != -EPROBE_DEFER )
+			dev_err(dev, "failed to acquire RST gpio: %d\n", ret);
+
+		return ret;
+	}
+
 	pcm3168a->scki = devm_clk_get(dev, "scki");
 	if (IS_ERR(pcm3168a->scki)) {
 		ret = PTR_ERR(pcm3168a->scki);
@@ -743,10 +762,18 @@ int pcm3168a_probe(struct device *dev, struct regmap *regmap)
 		goto err_regulator;
 	}
 
-	ret = pcm3168a_reset(pcm3168a);
-	if (ret) {
-		dev_err(dev, "Failed to reset device: %d\n", ret);
-		goto err_regulator;
+	if (pcm3168a->gpio_rst) {
+		/*
+		 * The device is taken out from reset via GPIO line, wait for
+		 * 3846 SCKI clock cycles for the internal reset de-assertion
+		 */
+		msleep(DIV_ROUND_UP(3846 * 1000, pcm3168a->sysclk));
+	} else {
+		ret = pcm3168a_reset(pcm3168a);
+		if (ret) {
+			dev_err(dev, "Failed to reset device: %d\n", ret);
+			goto err_regulator;
+		}
 	}
 
 	pm_runtime_set_active(dev);
@@ -785,6 +812,9 @@ static void pcm3168a_disable(struct device *dev)
 
 void pcm3168a_remove(struct device *dev)
 {
+	struct pcm3168a_priv *pcm3168a = dev_get_drvdata(dev);
+
+	gpiod_set_value_cansleep(pcm3168a->gpio_rst, 0);
 	pm_runtime_disable(dev);
 #ifndef CONFIG_PM
 	pcm3168a_disable(dev);
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
