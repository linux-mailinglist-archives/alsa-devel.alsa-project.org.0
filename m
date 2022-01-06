Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EC4486369
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 12:04:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8E3B18BC;
	Thu,  6 Jan 2022 12:03:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8E3B18BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641467074;
	bh=d5UtZcYfGJtqY1wmk56VDgyNkMKU3OtYYtkQCa0Jgpc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=THPtTaE39UOz3JdCo8d4gC6szsVKJlTTdgjs2UPSiYRULoIZelcw5aNK7jOWU/9oG
	 C2DX3bdPxTjwiQ93IWUzOAV+qh0Cc81nSLWVGUJy2q3u0W6/ROkOXOWrd+HJ1fSe4w
	 d/ctgcqOZqSe6zqufLW9jQtUzKebeTKR0rVDs/Mo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 531ABF80161;
	Thu,  6 Jan 2022 12:01:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39985F80524; Thu,  6 Jan 2022 12:01:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 456B6F80161
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 12:01:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 456B6F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="IN/Q/LIx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641466905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cFMGGvwU8G5oqGC8R2q1WmsGkbLUlSu91X8rCa7SiSU=;
 b=IN/Q/LIxM0PP6mKsAVisihYBYaog91UM5vMN+8iE8BindDNIllxhk53kYOzQn1zW3UOfiV
 zPvUfOla7XU6viMvIrHlpMhOsE20YCbMTUjHfKKDb9XJRFR1jeeKR/O9YURJesRlgS+uk3
 D5R3+YrTFLsFeQTiqI+4KvAYVoSSmRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-P2ryA34dPIOTZbx--ozZIw-1; Thu, 06 Jan 2022 06:01:44 -0500
X-MC-Unique: P2ryA34dPIOTZbx--ozZIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9B07760CD;
 Thu,  6 Jan 2022 11:01:42 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 293347E12C;
 Thu,  6 Jan 2022 11:01:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 5/6] ASoC: Intel: bytcr_rt5640: Support retrieving the
 codec IRQ from the AMCR0F28 ACPI dev
Date: Thu,  6 Jan 2022 12:01:27 +0100
Message-Id: <20220106110128.66049-6-hdegoede@redhat.com>
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

Some X86 tablets, which ship with Android as factory installed OS,
specify codec IRQs/GPIOS in a special Android AMCR0F28 ACPI device.

Add support for retrieving the codec IRQ from this ACPI device instead
of from the 10EC5640 device describing the codec itself and enable this
on Asus MemoPad 7 ME176C tablets.

This fixes jack-detect not working on these tablets.

Cc: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 43 +++++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index a0c5f0e9c22a..f37ab44ae957 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -79,6 +79,7 @@ enum {
 #define BYT_RT5640_LINEOUT_AS_HP2	BIT(26)
 #define BYT_RT5640_HSMIC2_ON_IN1	BIT(27)
 #define BYT_RT5640_JD_HP_ELITEP_1000G2	BIT(28)
+#define BYT_RT5640_USE_AMCR0F28		BIT(29)
 
 #define BYTCR_INPUT_DEFAULTS				\
 	(BYT_RT5640_IN3_MAP |				\
@@ -93,6 +94,7 @@ enum {
 struct byt_rt5640_private {
 	struct snd_soc_jack jack;
 	struct snd_soc_jack jack2;
+	struct rt5640_set_jack_data jack_data;
 	struct gpio_desc *hsmic_detect;
 	struct clk *mclk;
 	struct device *codec_dev;
@@ -597,7 +599,8 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
 					BYT_RT5640_OVCD_TH_2000UA |
 					BYT_RT5640_OVCD_SF_0P75 |
 					BYT_RT5640_SSP0_AIF1 |
-					BYT_RT5640_MCLK_EN),
+					BYT_RT5640_MCLK_EN |
+					BYT_RT5640_USE_AMCR0F28),
 	},
 	{
 		.matches = {
@@ -1109,6 +1112,32 @@ static int byt_rt5640_add_codec_device_props(struct device *i2c_dev,
 	return ret;
 }
 
+/* Some Android devs specify IRQs/GPIOS in a special AMCR0F28 ACPI device */
+static int byt_rt5640_get_amcr0f28_settings(struct snd_soc_card *card)
+{
+	struct byt_rt5640_private *priv = snd_soc_card_get_drvdata(card);
+	struct rt5640_set_jack_data *data = &priv->jack_data;
+	struct acpi_device *adev;
+	int ret = 0;
+
+	adev = acpi_dev_get_first_match_dev("AMCR0F28", "1", -1);
+	if (!adev) {
+		dev_err(card->dev, "error cannot find AMCR0F28 adev\n");
+		return -ENOENT;
+	}
+
+	data->codec_irq_override = acpi_dev_gpio_irq_get(adev, 0);
+	if (data->codec_irq_override < 0) {
+		ret = data->codec_irq_override;
+		dev_err(card->dev, "error %d getting codec IRQ\n", ret);
+		goto put_adev;
+	}
+
+put_adev:
+	acpi_dev_put(adev);
+	return ret;
+}
+
 static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 {
 	struct snd_soc_card *card = runtime->card;
@@ -1244,7 +1273,14 @@ static int byt_rt5640_init(struct snd_soc_pcm_runtime *runtime)
 		}
 		snd_jack_set_key(priv->jack.jack, SND_JACK_BTN_0,
 				 KEY_PLAYPAUSE);
-		snd_soc_component_set_jack(component, &priv->jack, NULL);
+
+		if (byt_rt5640_quirk & BYT_RT5640_USE_AMCR0F28) {
+			ret = byt_rt5640_get_amcr0f28_settings(card);
+			if (ret)
+				return ret;
+		}
+
+		snd_soc_component_set_jack(component, &priv->jack, &priv->jack_data);
 	}
 
 	if (byt_rt5640_quirk & BYT_RT5640_JD_HP_ELITEP_1000G2) {
@@ -1448,7 +1484,8 @@ static int byt_rt5640_resume(struct snd_soc_card *card)
 	for_each_card_components(card, component) {
 		if (!strcmp(component->name, byt_rt5640_codec_name)) {
 			dev_dbg(component->dev, "re-enabling jack detect after resume\n");
-			snd_soc_component_set_jack(component, &priv->jack, NULL);
+			snd_soc_component_set_jack(component, &priv->jack,
+						   &priv->jack_data);
 			break;
 		}
 	}
-- 
2.33.1

