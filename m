Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E9B26BEB9
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Sep 2020 10:02:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20D821695;
	Wed, 16 Sep 2020 10:01:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20D821695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600243320;
	bh=il1BO/OW92d+UIlLvR2VHFyoW92uVMFe6CilAPT/iP0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YANIA8wPcVcRZbY+LzbvwrugMWTOMKNPaOrbwRmz4QVN1M3wyaEQZ2Wwas0Wih2dV
	 1xsoyodoSOrl0vojNZm5ZCBKghAy+RkfH5RJ8RCrLfUW+VMV88M6CAXcs0KjyTHxJ6
	 T9S+47WGvQ8Fccc4Iv2I2HPCdZPjqgVy7aXFdSnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8430AF8015D;
	Wed, 16 Sep 2020 10:00:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AA17F801F7; Wed, 16 Sep 2020 10:00:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72617F8015C
 for <alsa-devel@alsa-project.org>; Wed, 16 Sep 2020 09:59:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72617F8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="QZ3djbF8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=2719; q=dns/txt; s=axis-central1;
 t=1600243198; x=1631779198;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+Bee2oDYV5ypb/Wdn/uiK1X779bbbI4wm+9E+eFG2P4=;
 b=QZ3djbF8HcTwJCbd28qydNJLQqe+Zpld5bqkQk4Sr91B2KASk280hthm
 1IMEpN/RV3fnRYy+GzEvnt8T5bA6XzCPzbGtOnAbxeNRg7jzq7ZEFDLeX
 cGjZUmzPIuQE9N47y62PoaM0O1v7Nj2/SHjvRDg937IxGrvctvR8VcUdY
 +QQrRqZYliVUp395J45k8UmY6Z0vqUV6hah4IQ4szqkkZ9rFttCvxstjh
 XbZMQWAYiP4e7kkn5dcvzg9JUNXn+ggrsDwj+AJNIfe9QyPEyOGGCTLi6
 1U1fmhBj2xBoxRK2Qw2mFZkU9JrPmubgJrESbXf++sEcU7J5t1hMIPqdp g==;
IronPort-SDR: G4MZK7x65pmT/cNZCF+JKxe8wY0W522UpF9odulQr4TM0Y70oo98Jc/eVjPJS9NiG0buT9juFx
 kkYGXIvYdGmxyPdw9G7dHxCVA97/PQTZzvzDnzSeofNxNmz8BWDHdNyIVSJVuKkHiNlaTBvFuY
 wbamjoRakn2lJuIE1vutaI3DBdtChFLIEqhtR9FeqF73F7nuiSPycrrwHCLGOsGOlZvhLw9Dih
 grVSYZBTqn62PuplOE/E+jiJqdPx3p7DJ6UXXnb4MLJjHkRyRz6Mct6Ncp6GPKMNJUvYSoBgFj
 Vg4=
X-IronPort-AV: E=Sophos;i="5.76,432,1592863200"; d="scan'208";a="12999945"
From: Camel Guo <camel.guo@axis.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <tiwai@suse.com>,
 <dmurphy@ti.com>, <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v3 2/2] ASoC: tlv320adcx140: Add support for configuring GPIO
 pin
Date: Wed, 16 Sep 2020 09:59:49 +0200
Message-ID: <20200916075949.28479-2-camel.guo@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200916075949.28479-1-camel.guo@axis.com>
References: <20200916075949.28479-1-camel.guo@axis.com>
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
 v3:
  - Add ADCX140_NUM_GPIO_CFGS avoiding using magic number
  - Remove unneeded check on ret in adcx140_configure_gpio

 sound/soc/codecs/tlv320adcx140.c | 40 ++++++++++++++++++++++++++++++++
 sound/soc/codecs/tlv320adcx140.h |  5 ++++
 2 files changed, 45 insertions(+)

diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index f33ee604ee78..fe6fc6df66cc 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -837,6 +837,42 @@ static int adcx140_configure_gpo(struct adcx140_priv *adcx140)
 
 }
 
+static int adcx140_configure_gpio(struct adcx140_priv *adcx140)
+{
+	int gpio_count = 0;
+	u32 gpio_outputs[ADCX140_NUM_GPIO_CFGS];
+	u32 gpio_output_val = 0;
+	int ret;
+
+	gpio_count = device_property_count_u32(adcx140->dev,
+			"ti,gpio-config");
+	if (gpio_count == 0)
+		return 0;
+
+	if (gpio_count != ADCX140_NUM_GPIO_CFGS)
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
+	return regmap_write(adcx140->regmap, ADCX140_GPIO_CFG0, gpio_output_val);
+}
+
 static int adcx140_codec_probe(struct snd_soc_component *component)
 {
 	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
@@ -934,6 +970,10 @@ static int adcx140_codec_probe(struct snd_soc_component *component)
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
index eedbc1d7221f..9d04dec374d1 100644
--- a/sound/soc/codecs/tlv320adcx140.h
+++ b/sound/soc/codecs/tlv320adcx140.h
@@ -145,4 +145,9 @@
 #define ADCX140_GPO_CFG_MAX		4
 #define ADCX140_GPO_DRV_MAX		5
 
+#define ADCX140_NUM_GPIO_CFGS		2
+#define ADCX140_GPIO_SHIFT		4
+#define ADCX140_GPIO_CFG_MAX		15
+#define ADCX140_GPIO_DRV_MAX		5
+
 #endif /* _TLV320ADCX140_ */
-- 
2.20.1

