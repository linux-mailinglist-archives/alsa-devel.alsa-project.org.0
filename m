Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E49648636B
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 12:04:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BE1918D3;
	Thu,  6 Jan 2022 12:04:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BE1918D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641467092;
	bh=15rp81zr93B0jcoNTHYJePjpzC69bKpCnj/Lsd+w4ZQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B7BO9beYX8viQmhRufBWU0gwufbFW1wFz6yNCEsNXMKCTSxNFdTTbyWFjbW4Sigjz
	 yOYZ9Xo0Iwrx1kU78/lQ0Dd5hsUQCeGTsId9Zw75tur1kaI5OiYOIMcz5VzSAfIt/F
	 y7BqrT6+13ked0dvUjb/NHns8IIkO9/fzyZsxauc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3A81F80525;
	Thu,  6 Jan 2022 12:01:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 430CAF80526; Thu,  6 Jan 2022 12:01:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EA13F8051B
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 12:01:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EA13F8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="UUu7EmV8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641466909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fu2IVANqwHpaTAOMejiMntenzsJGxnvmd3CBgQy2S00=;
 b=UUu7EmV82Pwxlgrije6IXdetvDoR24akFS7bQFn5eTW4vZGEAF2TFz24B5WnMDVoOMWD74
 +5HykNXEwjURff6umGrT/+3Vj8l9z8wyWSv6t0enKBfqCEycV8FhaDlkQxnYgUm3gCSbFZ
 lA520b+c1/fuNHRaBBApcKLMutZ14+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-uD2mdofZNaGJF3azM77fTw-1; Thu, 06 Jan 2022 06:01:46 -0500
X-MC-Unique: uD2mdofZNaGJF3azM77fTw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E184C8042FB;
 Thu,  6 Jan 2022 11:01:44 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DF9D7E12C;
 Thu,  6 Jan 2022 11:01:43 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 6/6] ASoC: Intel: bytcr_rt5640: Add support for external
 GPIO jack-detect
Date: Thu,  6 Jan 2022 12:01:28 +0100
Message-Id: <20220106110128.66049-7-hdegoede@redhat.com>
In-Reply-To: <20220106110128.66049-1-hdegoede@redhat.com>
References: <20220106110128.66049-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, Bard Liao <bard.liao@intel.com>
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

Some boards have the codec IRQ hooked-up as normally, so the driver can
still do things like headset vs headphones and button-press detection,
but instead of using one of the JD pins of the codec, an external GPIO
is used to report the jack-presence switch status of the jack.

Add support for boards which have this setup and which specify which
external GPIO to use in the special Android AMCR0F28 ACPI device.

And add a quirk for the Asus TF103C tablet which uses this setup.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 43 +++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index f37ab44ae957..2ace32c03ec9 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -40,6 +40,8 @@ enum {
 	BYT_RT5640_NO_INTERNAL_MIC_MAP,
 };
 
+#define RT5640_JD_SRC_EXT_GPIO			0x0f
+
 enum {
 	BYT_RT5640_JD_SRC_GPIO1		= (RT5640_JD_SRC_GPIO1 << 4),
 	BYT_RT5640_JD_SRC_JD1_IN4P	= (RT5640_JD_SRC_JD1_IN4P << 4),
@@ -47,6 +49,7 @@ enum {
 	BYT_RT5640_JD_SRC_GPIO2		= (RT5640_JD_SRC_GPIO2 << 4),
 	BYT_RT5640_JD_SRC_GPIO3		= (RT5640_JD_SRC_GPIO3 << 4),
 	BYT_RT5640_JD_SRC_GPIO4		= (RT5640_JD_SRC_GPIO4 << 4),
+	BYT_RT5640_JD_SRC_EXT_GPIO	= (RT5640_JD_SRC_EXT_GPIO << 4)
 };
 
 enum {
@@ -627,6 +630,19 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_SSP0_AIF2 |
 					BYT_RT5640_MCLK_EN),
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TF103C"),
+		},
+		.driver_data = (void *)(BYT_RT5640_IN1_MAP |
+					BYT_RT5640_JD_SRC_EXT_GPIO |
+					BYT_RT5640_OVCD_TH_2000UA |
+					BYT_RT5640_OVCD_SF_0P75 |
+					BYT_RT5640_SSP0_AIF1 |
+					BYT_RT5640_MCLK_EN |
+					BYT_RT5640_USE_AMCR0F28),
+	},
 	{	/* Chuwi Vi8 (CWI506) */
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Insyde"),
@@ -1083,9 +1099,11 @@ static int byt_rt5640_add_codec_device_props(struct device *i2c_dev,
 	}
 
 	if (BYT_RT5640_JDSRC(byt_rt5640_quirk)) {
-		props[cnt++] = PROPERTY_ENTRY_U32(
-				    "realtek,jack-detect-source",
-				    BYT_RT5640_JDSRC(byt_rt5640_quirk));
+		if (BYT_RT5640_JDSRC(byt_rt5640_quirk) != RT5640_JD_SRC_EXT_GPIO) {
+			props[cnt++] = PROPERTY_ENTRY_U32(
+					    "realtek,jack-detect-source",
+					    BYT_RT5640_JDSRC(byt_rt5640_quirk));
+		}
 
 		props[cnt++] = PROPERTY_ENTRY_U32(
 				    "realtek,over-current-threshold-microamp",
@@ -1113,6 +1131,13 @@ static int byt_rt5640_add_codec_device_props(struct device *i2c_dev,
 }
 
 /* Some Android devs specify IRQs/GPIOS in a special AMCR0F28 ACPI device */
+static const struct acpi_gpio_params amcr0f28_jd_gpio = { 1, 0, false };
+
+static const struct acpi_gpio_mapping amcr0f28_gpios[] = {
+	{ "rt5640-jd-gpios", &amcr0f28_jd_gpio, 1 },
+	{ }
+};
+
 static int byt_rt5640_get_amcr0f28_settings(struct snd_soc_card *card)
 {
 	struct byt_rt5640_private *priv = snd_soc_card_get_drvdata(card);
@@ -1133,6 +1158,18 @@ static int byt_rt5640_get_amcr0f28_settings(struct snd_soc_card *card)
 		goto put_adev;
 	}
 
+	if (BYT_RT5640_JDSRC(byt_rt5640_quirk) == RT5640_JD_SRC_EXT_GPIO) {
+		acpi_dev_add_driver_gpios(adev, amcr0f28_gpios);
+		data->jd_gpio = devm_fwnode_gpiod_get(card->dev, acpi_fwnode_handle(adev),
+						      "rt5640-jd", GPIOD_IN, "rt5640-jd");
+		acpi_dev_remove_driver_gpios(adev);
+
+		if (IS_ERR(data->jd_gpio)) {
+			ret = PTR_ERR(data->jd_gpio);
+			dev_err(card->dev, "error %d getting jd GPIO\n", ret);
+		}
+	}
+
 put_adev:
 	acpi_dev_put(adev);
 	return ret;
-- 
2.33.1

