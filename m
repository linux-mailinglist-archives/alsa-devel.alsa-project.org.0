Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3751820C8D8
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jun 2020 17:56:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F25D168C;
	Sun, 28 Jun 2020 17:55:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F25D168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593359770;
	bh=z8H1WiamAY1m8W1ApdntKAbvZzzQ17sKBqtFpvRFp/c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ufX8zANM/ucKX4vcOh35uC0SQc+QOK0MXD/fsxVBgfLw1Na32ll4Xa4wZwlFDFQR7
	 R66Uq901cSatyXFLEsMJe0JdJAAEAwSJC6m2IrRLkYHHk+8e4ZIj10XGj2Yt6tOyMb
	 1KtaH3Iods/gnnbTA1dF+wK8J5zpqQc3pC5E+7Y0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FCF2F802DC;
	Sun, 28 Jun 2020 17:52:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EC99F80253; Sun, 28 Jun 2020 17:52:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 742CFF8022D
 for <alsa-devel@alsa-project.org>; Sun, 28 Jun 2020 17:52:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 742CFF8022D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="YA8gNsBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593359565;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kx1rbNC+jkDviCDsQAFQ0zoaGnIGUqHFRUytt8SeJ7g=;
 b=YA8gNsBKXLf+n0GRGk/wzeSv7Lo71KKbV+gx2aE0k/64dh4Wd5n1BMdidD44obbOZzQArs
 kEIwmYySlMSwm+EI8/lHnUZQh91JLCnPj4sKXp9iu3d2Iqz/aEf9xx5nSwuG9j1nh/SksI
 2VFUPprkU6yQJdPFy+tH+Uq5cRr1hT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-z19FA6nhODGwRIbL6i3IUA-1; Sun, 28 Jun 2020 11:52:41 -0400
X-MC-Unique: z19FA6nhODGwRIbL6i3IUA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27B50800C60;
 Sun, 28 Jun 2020 15:52:40 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-41.ams2.redhat.com [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A06269CFD1;
 Sun, 28 Jun 2020 15:52:38 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH 3/6] ASoC: rt5670: Add new gpio1_is_ext_spk_en quirk and
 enable it on the Lenovo Miix 2 10
Date: Sun, 28 Jun 2020 17:52:28 +0200
Message-Id: <20200628155231.71089-4-hdegoede@redhat.com>
In-Reply-To: <20200628155231.71089-1-hdegoede@redhat.com>
References: <20200628155231.71089-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

The Lenovo Miix 2 10 has a keyboard dock with extra speakers in the dock.
Rather then the ACL5672's GPIO1 pin being used as IRQ to the CPU, it is
actually used to enable the amplifier for these speakers
(the IRQ to the CPU comes directly from the jack-detect switch).

Add a quirk for having an ext speaker-amplifier enable pin on GPIO1
and replace the Lenovo Miix 2 10's dmi_system_id table entry's wrong
GPIO_DEV quirk (which needs to be renamed to GPIO1_IS_IRQ) with the
new RT5670_GPIO1_IS_EXT_SPK_EN quirk, so that we enable the external
speaker-amplifier as necessary.

Also update the ident field for the dmi_system_id table entry, the
Miix models are not Thinkpads.

Fixes: 67e03ff3f32f ("ASoC: codecs: rt5670: add Thinkpad Tablet 10 quirk")
BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786723
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 include/sound/rt5670.h    |  1 +
 sound/soc/codecs/rt5670.c | 71 ++++++++++++++++++++++++++++++---------
 2 files changed, 57 insertions(+), 15 deletions(-)

diff --git a/include/sound/rt5670.h b/include/sound/rt5670.h
index f9024c7a1600..02e1d7778354 100644
--- a/include/sound/rt5670.h
+++ b/include/sound/rt5670.h
@@ -12,6 +12,7 @@ struct rt5670_platform_data {
 	int jd_mode;
 	bool in2_diff;
 	bool dev_gpio;
+	bool gpio1_is_ext_spk_en;
 
 	bool dmic_en;
 	unsigned int dmic1_data_pin;
diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index 70fee6849ab0..f21181734170 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -31,18 +31,19 @@
 #include "rt5670.h"
 #include "rt5670-dsp.h"
 
-#define RT5670_DEV_GPIO     BIT(0)
-#define RT5670_IN2_DIFF     BIT(1)
-#define RT5670_DMIC_EN      BIT(2)
-#define RT5670_DMIC1_IN2P   BIT(3)
-#define RT5670_DMIC1_GPIO6  BIT(4)
-#define RT5670_DMIC1_GPIO7  BIT(5)
-#define RT5670_DMIC2_INR    BIT(6)
-#define RT5670_DMIC2_GPIO8  BIT(7)
-#define RT5670_DMIC3_GPIO5  BIT(8)
-#define RT5670_JD_MODE1     BIT(9)
-#define RT5670_JD_MODE2     BIT(10)
-#define RT5670_JD_MODE3     BIT(11)
+#define RT5670_DEV_GPIO			BIT(0)
+#define RT5670_IN2_DIFF			BIT(1)
+#define RT5670_DMIC_EN			BIT(2)
+#define RT5670_DMIC1_IN2P		BIT(3)
+#define RT5670_DMIC1_GPIO6		BIT(4)
+#define RT5670_DMIC1_GPIO7		BIT(5)
+#define RT5670_DMIC2_INR		BIT(6)
+#define RT5670_DMIC2_GPIO8		BIT(7)
+#define RT5670_DMIC3_GPIO5		BIT(8)
+#define RT5670_JD_MODE1			BIT(9)
+#define RT5670_JD_MODE2			BIT(10)
+#define RT5670_JD_MODE3			BIT(11)
+#define RT5670_GPIO1_IS_EXT_SPK_EN	BIT(12)
 
 static unsigned long rt5670_quirk;
 static unsigned int quirk_override;
@@ -1447,6 +1448,33 @@ static int rt5670_hp_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static int rt5670_spk_event(struct snd_soc_dapm_widget *w,
+	struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct rt5670_priv *rt5670 = snd_soc_component_get_drvdata(component);
+
+	if (!rt5670->pdata.gpio1_is_ext_spk_en)
+		return 0;
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		regmap_update_bits(rt5670->regmap, RT5670_GPIO_CTRL2,
+				   RT5670_GP1_OUT_MASK, RT5670_GP1_OUT_HI);
+		break;
+
+	case SND_SOC_DAPM_PRE_PMD:
+		regmap_update_bits(rt5670->regmap, RT5670_GPIO_CTRL2,
+				   RT5670_GP1_OUT_MASK, RT5670_GP1_OUT_LO);
+		break;
+
+	default:
+		return 0;
+	}
+
+	return 0;
+}
+
 static int rt5670_bst1_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *kcontrol, int event)
 {
@@ -1860,7 +1888,9 @@ static const struct snd_soc_dapm_widget rt5670_specific_dapm_widgets[] = {
 };
 
 static const struct snd_soc_dapm_widget rt5672_specific_dapm_widgets[] = {
-	SND_SOC_DAPM_PGA("SPO Amp", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_PGA_E("SPO Amp", SND_SOC_NOPM, 0, 0, NULL, 0,
+			   rt5670_spk_event, SND_SOC_DAPM_PRE_PMD |
+			   SND_SOC_DAPM_POST_PMU),
 	SND_SOC_DAPM_OUTPUT("SPOLP"),
 	SND_SOC_DAPM_OUTPUT("SPOLN"),
 	SND_SOC_DAPM_OUTPUT("SPORP"),
@@ -2857,14 +2887,14 @@ static const struct dmi_system_id dmi_platform_intel_quirks[] = {
 	},
 	{
 		.callback = rt5670_quirk_cb,
-		.ident = "Lenovo Thinkpad Tablet 10",
+		.ident = "Lenovo Miix 2 10",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Miix 2 10"),
 		},
 		.driver_data = (unsigned long *)(RT5670_DMIC_EN |
 						 RT5670_DMIC1_IN2P |
-						 RT5670_DEV_GPIO |
+						 RT5670_GPIO1_IS_EXT_SPK_EN |
 						 RT5670_JD_MODE2),
 	},
 	{
@@ -2924,6 +2954,10 @@ static int rt5670_i2c_probe(struct i2c_client *i2c,
 		rt5670->pdata.dev_gpio = true;
 		dev_info(&i2c->dev, "quirk dev_gpio\n");
 	}
+	if (rt5670_quirk & RT5670_GPIO1_IS_EXT_SPK_EN) {
+		rt5670->pdata.gpio1_is_ext_spk_en = true;
+		dev_info(&i2c->dev, "quirk GPIO1 is external speaker enable\n");
+	}
 	if (rt5670_quirk & RT5670_IN2_DIFF) {
 		rt5670->pdata.in2_diff = true;
 		dev_info(&i2c->dev, "quirk IN2_DIFF\n");
@@ -3023,6 +3057,13 @@ static int rt5670_i2c_probe(struct i2c_client *i2c,
 				   RT5670_GP1_PF_MASK, RT5670_GP1_PF_OUT);
 	}
 
+	if (rt5670->pdata.gpio1_is_ext_spk_en) {
+		regmap_update_bits(rt5670->regmap, RT5670_GPIO_CTRL1,
+				   RT5670_GP1_PIN_MASK, RT5670_GP1_PIN_GPIO1);
+		regmap_update_bits(rt5670->regmap, RT5670_GPIO_CTRL2,
+				   RT5670_GP1_PF_MASK, RT5670_GP1_PF_OUT);
+	}
+
 	if (rt5670->pdata.jd_mode) {
 		regmap_update_bits(rt5670->regmap, RT5670_GLB_CLK,
 				   RT5670_SCLK_SRC_MASK, RT5670_SCLK_SRC_RCCLK);
-- 
2.26.2

