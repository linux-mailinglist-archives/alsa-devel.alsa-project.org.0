Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC87D265B33
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Sep 2020 10:10:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EED21672;
	Fri, 11 Sep 2020 10:09:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EED21672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599811838;
	bh=T9Qjmi/ypZqJU9IPkTR/CUaWWvilplcYtqLbTSyD+XU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pm63dQHRwzQlWipjkj3Mlgxf+QXOz48WsVMztMsXC/7L0tIcHKDpt30kEqZfBaZCt
	 hVHv3lNMfeELblwW6mVWv7XA+w2T4ifpGxAl25iMR8fZgetELIx+3NvtkGOKuLbkTO
	 Vd+1H/haYMUFvkO8pcMapFSWmP1Tfdfg8DJ45i3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 272DDF80274;
	Fri, 11 Sep 2020 10:08:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88D8EF8021C; Fri, 11 Sep 2020 10:08:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72D79F8021C
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 10:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72D79F8021C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="n4BdKmCW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=2561; q=dns/txt; s=axis-central1;
 t=1599811689; x=1631347689;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GWBdvjMgI+JP9kgF51iEb5ue97etB2/mb8U6CHpN/hI=;
 b=n4BdKmCWWk1jk/sNZk3r+1at4o7MseCCN0RK9IHaN9I7qPlshDzf5+jy
 /FaQmd9hLO33CKKzfzZE8OxJfYOxS/j/S3fWSPxgVTXVWdegINvfxH8cA
 ALMYJB000J3C6Wr0/eqSnf/0+2iVTLUEueps5wsnyoGbMkrEeiEdzXWSl
 hxf4ecO9nYugjqRSybBYkbJyux1p12t4CWW7wno+974kDFcz64RiQoi3w
 MOiOnKLTuKAC5NFmopJaS9WJ5s4FN9JivGcqPWTFEoFbhtD/0WJYs70LW
 Wd+1uz1KIRk99jQ6Q0EpHO2O0DLfLiV9GixfuCOOH7LR9fhe8KeO+HllS w==;
IronPort-SDR: BnKEjPvVZxmSMPmALemYWoYMsfP1TELibKrRlQoks6qxAV//kiy6uMQ0GTli5SCk6uimuC/xtS
 qCm3LqGWCS1mvMbzSh1Y2aT28dhxqmxZGc/bL6ZJ5bk+4HgXB9NX+1x4vcP7nPcWSrrkFOYJT3
 /LlKjgAsNG39TEEP4d6JfvZx7/4t/9DvpYzMD0kikQIoB+6Dh9CkWj0dppvsTbdJvvq5t8k7Eo
 xJueWhdyMF06BPehVvBON+jekPq6UdtqWOUFDBJXXzR9dh/5X0eOfslW827MoML4YkPbgSIufg
 bsk=
X-IronPort-AV: E=Sophos;i="5.76,414,1592863200"; d="scan'208";a="12818398"
From: Camel Guo <camel.guo@axis.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <dmurphy@ti.com>
Subject: [PATCH v2 2/3] ASoC: tlv320adcx140: Add support for configuring GPIO
 pin
Date: Fri, 11 Sep 2020 10:07:52 +0200
Message-ID: <20200911080753.30342-2-camel.guo@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911080753.30342-1-camel.guo@axis.com>
References: <20200911080753.30342-1-camel.guo@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Camel Guo <camelg@axis.com>
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

From: Camel Guo <camelg@axis.com>

Add support to configure the GPIO pin to the specific configuration.
The GPIO pin can be configured as GPO, IRQ, SDOUT2, PDMCLK, MICBASE_EN,
GPI, MCLK, SDIN, PDMDIN1, PDMDIN2, PDMDIN3 or PDMDIN4 and the output
drive can be configured with various configuration.

Signed-off-by: Camel Guo <camelg@axis.com>
---
 sound/soc/codecs/tlv320adcx140.c | 44 ++++++++++++++++++++++++++++++++
 sound/soc/codecs/tlv320adcx140.h |  4 +++
 2 files changed, 48 insertions(+)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index f33ee604ee78..97f16fbba441 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -837,6 +837,46 @@ static int adcx140_configure_gpo(struct adcx140_priv *adcx140)
 
 }
 
+static int adcx140_configure_gpio(struct adcx140_priv *adcx140)
+{
+	int gpio_count = 0;
+	u32 gpio_outputs[2];
+	u32 gpio_output_val = 0;
+	int ret;
+
+	gpio_count = device_property_count_u32(adcx140->dev,
+			"ti,gpio-config");
+	if (gpio_count == 0)
+		return 0;
+
+	if (gpio_count != 2)
+		return -EINVAL;
+
+	ret = device_property_read_u32_array(adcx140->dev, "ti,gpio-config",
+			gpio_outputs, gpio_count);
+	if (ret)
+		return ret;
+
+	if (gpio_outputs[0] > ADCX140_GPIO_CFG_MAX) {
+		dev_err(adcx140->dev, "GPIO config out of range\n");
+		return -EINVAL;
+	}
+
+	if (gpio_outputs[1] > ADCX140_GPIO_DRV_MAX) {
+		dev_err(adcx140->dev, "GPIO drive out of range\n");
+		return -EINVAL;
+	}
+
+	gpio_output_val = gpio_outputs[0] << ADCX140_GPIO_SHIFT
+		| gpio_outputs[1];
+
+	ret = regmap_write(adcx140->regmap, ADCX140_GPIO_CFG0, gpio_output_val);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int adcx140_codec_probe(struct snd_soc_component *component)
 {
 	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
@@ -934,6 +974,10 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
 			return ret;
 	}
 
+	ret = adcx140_configure_gpio(adcx140);
+	if (ret)
+		return ret;
+
 	ret = adcx140_configure_gpo(adcx140);
 	if (ret)
 		goto out;
diff --git a/sound/soc/codecs/tlv320adcx140.h b/sound/soc/codecs/tlv320adcx140.h
index eedbc1d7221f..96f067e65e2a 100644
--- a/sound/soc/codecs/tlv320adcx140.h
+++ b/sound/soc/codecs/tlv320adcx140.h
@@ -145,4 +145,8 @@
 #define ADCX140_GPO_CFG_MAX		4
 #define ADCX140_GPO_DRV_MAX		5
 
+#define ADCX140_GPIO_SHIFT		4
+#define ADCX140_GPIO_CFG_MAX		15
+#define ADCX140_GPIO_DRV_MAX		5
+
 #endif /* _TLV320ADCX140_ */
-- 
2.20.1

