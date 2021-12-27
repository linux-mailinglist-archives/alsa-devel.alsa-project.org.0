Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CBB47FF20
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Dec 2021 16:35:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D00E170A;
	Mon, 27 Dec 2021 16:34:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D00E170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640619346;
	bh=d5UtZcYfGJtqY1wmk56VDgyNkMKU3OtYYtkQCa0Jgpc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IKNYYGIN1qCWgf/zj8pKVBBNXM/DFtZayjAuOdLmp16yu2Paq4bY7+gXwCFsIMg8W
	 zY0UZHpnAT+dEGY8uMEuBnw4KqvC5dBq0x8YWSdyQ+Y+ZNuXZ3Xf97BF/w6qBt39eC
	 6mUQyYyLKDfU5LenlhGmCIVMXkEFjtx3C0SL8s1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 644B8F804EB;
	Mon, 27 Dec 2021 16:34:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3353DF804EC; Mon, 27 Dec 2021 16:34:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F068FF800AB
 for <alsa-devel@alsa-project.org>; Mon, 27 Dec 2021 16:34:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F068FF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="PFJU2Ajp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640619239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cFMGGvwU8G5oqGC8R2q1WmsGkbLUlSu91X8rCa7SiSU=;
 b=PFJU2AjpVtOrSPSJeiklMS/wkPW/6fqcg3mnXgk2xTcyZmdno1MiuTp7o8gyEamJY4yurM
 nwfjUtdCjP0UjE61CuxPOLnHOnDcXFN31AsJt1Z7aYIBeolwp8x/Gr8du7Da8BerIyFjqt
 1IwAkskvW5jSGiJtN6KeuJk7XvgjruM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-ZU0XRHu4MImFPgzZBpS7Pg-1; Mon, 27 Dec 2021 10:33:56 -0500
X-MC-Unique: ZU0XRHu4MImFPgzZBpS7Pg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FD008042A8;
 Mon, 27 Dec 2021 15:33:55 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E88375744;
 Mon, 27 Dec 2021 15:33:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH 4/5] ASoC: Intel: bytcr_rt5640: Support retrieving the codec
 IRQ from the AMCR0F28 ACPI dev
Date: Mon, 27 Dec 2021 16:33:43 +0100
Message-Id: <20211227153344.155803-4-hdegoede@redhat.com>
In-Reply-To: <20211227153344.155803-1-hdegoede@redhat.com>
References: <20211227153344.155803-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

