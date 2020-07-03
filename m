Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 432B921386F
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 12:11:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFE5016DD;
	Fri,  3 Jul 2020 12:10:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFE5016DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593771082;
	bh=Yww9f60lF1iMb9e4eztlMrm6b9LLeEQ84/w77YGmRns=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qYhjkzsJ0cKuavC3TARRZ+9b/LJycbpHjjyNbg+Hj9VCr6ygdFRR6DEUVIPGWaws2
	 r9SLWlRx8SL4mSsGkiJOareDOO/kd9LtATfGEezFJulNc8OX8yXWJK1nLf4V4QB/i7
	 j12L0N+6UyvHUGpZ6tW4ULaobGH2AgoYiaoJN45I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DE58F802BC;
	Fri,  3 Jul 2020 12:08:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12190F80269; Fri,  3 Jul 2020 12:08:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 180B0F80229
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 12:08:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 180B0F80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="WsLo1yrN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593770914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ATtwAF3rUpK6oBeQ4Qt0NuC/Mjni6TC4aWilweXNpx4=;
 b=WsLo1yrNXmpy2MGq08sYvdEJBBH8nBFgm7LG9DxALnhzxrzhXO4f9uDWvP5VMXmDyClsEQ
 00ofaH3AiZaVnSEyxFbxZxRAsNRybFknRUdITeiPMyISixnT1ek8qLeBFz4yg0G8ZImb0j
 v/hnMPDfRA/5hquqNv7teTok8yZPKcY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-hOlX4WSdO9OTQHFUHA1SGQ-1; Fri, 03 Jul 2020 06:08:30 -0400
X-MC-Unique: hOlX4WSdO9OTQHFUHA1SGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E3BF8015FA;
 Fri,  3 Jul 2020 10:08:29 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-45.ams2.redhat.com [10.36.114.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FDA36111F;
 Fri,  3 Jul 2020 10:08:27 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v2 1/2] ASoC: rt5670: Remove struct rt5670_platform_data
Date: Fri,  3 Jul 2020 12:08:22 +0200
Message-Id: <20200703100823.258033-2-hdegoede@redhat.com>
In-Reply-To: <20200703100823.258033-1-hdegoede@redhat.com>
References: <20200703100823.258033-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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

platform_data is an obsolete concept, instead device_properties,
set through e.g. device-tree, should be used.

struct rt5670_platform_data is only used internally by the rt5670 codec
driver, so lets remove it before someone starts relying on it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 include/sound/rt5670.h    | 26 ------------------
 sound/soc/codecs/rt5670.c | 55 ++++++++++++++++++---------------------
 sound/soc/codecs/rt5670.h | 16 +++++++++---
 3 files changed, 38 insertions(+), 59 deletions(-)
 delete mode 100644 include/sound/rt5670.h

diff --git a/include/sound/rt5670.h b/include/sound/rt5670.h
deleted file mode 100644
index 02e1d7778354..000000000000
--- a/include/sound/rt5670.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * linux/sound/rt5670.h -- Platform data for RT5670
- *
- * Copyright 2014 Realtek Microelectronics
- */
-
-#ifndef __LINUX_SND_RT5670_H
-#define __LINUX_SND_RT5670_H
-
-struct rt5670_platform_data {
-	int jd_mode;
-	bool in2_diff;
-	bool dev_gpio;
-	bool gpio1_is_ext_spk_en;
-
-	bool dmic_en;
-	unsigned int dmic1_data_pin;
-	/* 0 = GPIO6; 1 = IN2P; 3 = GPIO7*/
-	unsigned int dmic2_data_pin;
-	/* 0 = GPIO8; 1 = IN3N; */
-	unsigned int dmic3_data_pin;
-	/* 0 = GPIO9; 1 = GPIO10; 2 = GPIO5*/
-};
-
-#endif
diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index 91c68c8965d1..3ccaeb985176 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -25,7 +25,6 @@
 #include <sound/soc-dapm.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
-#include <sound/rt5670.h>
 
 #include "rl6231.h"
 #include "rt5670.h"
@@ -518,7 +517,7 @@ static int rt5670_irq_detection(void *data)
 	struct snd_soc_jack *jack = rt5670->jack;
 	int val, btn_type, report = jack->status;
 
-	if (rt5670->pdata.jd_mode == 1) /* 2 port */
+	if (rt5670->jd_mode == 1) /* 2 port */
 		val = snd_soc_component_read(rt5670->component, RT5670_A_JD_CTRL1) & 0x0070;
 	else
 		val = snd_soc_component_read(rt5670->component, RT5670_A_JD_CTRL1) & 0x0020;
@@ -1454,7 +1453,7 @@ static int rt5670_spk_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct rt5670_priv *rt5670 = snd_soc_component_get_drvdata(component);
 
-	if (!rt5670->pdata.gpio1_is_ext_spk_en)
+	if (!rt5670->gpio1_is_ext_spk_en)
 		return 0;
 
 	switch (event) {
@@ -2624,7 +2623,7 @@ static int rt5670_set_bias_level(struct snd_soc_component *component,
 				RT5670_LDO_SEL_MASK, 0x3);
 		break;
 	case SND_SOC_BIAS_OFF:
-		if (rt5670->pdata.jd_mode)
+		if (rt5670->jd_mode)
 			snd_soc_component_update_bits(component, RT5670_PWR_ANLG1,
 				RT5670_PWR_VREF1 | RT5670_PWR_MB |
 				RT5670_PWR_BG | RT5670_PWR_VREF2 |
@@ -2927,7 +2926,6 @@ static const struct dmi_system_id dmi_platform_intel_quirks[] = {
 static int rt5670_i2c_probe(struct i2c_client *i2c,
 		    const struct i2c_device_id *id)
 {
-	struct rt5670_platform_data *pdata = dev_get_platdata(&i2c->dev);
 	struct rt5670_priv *rt5670;
 	int ret;
 	unsigned int val;
@@ -2940,9 +2938,6 @@ static int rt5670_i2c_probe(struct i2c_client *i2c,
 
 	i2c_set_clientdata(i2c, rt5670);
 
-	if (pdata)
-		rt5670->pdata = *pdata;
-
 	dmi_check_system(dmi_platform_intel_quirks);
 	if (quirk_override) {
 		dev_info(&i2c->dev, "Overriding quirk 0x%x => 0x%x\n",
@@ -2951,56 +2946,56 @@ static int rt5670_i2c_probe(struct i2c_client *i2c,
 	}
 
 	if (rt5670_quirk & RT5670_DEV_GPIO) {
-		rt5670->pdata.dev_gpio = true;
+		rt5670->dev_gpio = true;
 		dev_info(&i2c->dev, "quirk dev_gpio\n");
 	}
 	if (rt5670_quirk & RT5670_GPIO1_IS_EXT_SPK_EN) {
-		rt5670->pdata.gpio1_is_ext_spk_en = true;
+		rt5670->gpio1_is_ext_spk_en = true;
 		dev_info(&i2c->dev, "quirk GPIO1 is external speaker enable\n");
 	}
 	if (rt5670_quirk & RT5670_IN2_DIFF) {
-		rt5670->pdata.in2_diff = true;
+		rt5670->in2_diff = true;
 		dev_info(&i2c->dev, "quirk IN2_DIFF\n");
 	}
 	if (rt5670_quirk & RT5670_DMIC_EN) {
-		rt5670->pdata.dmic_en = true;
+		rt5670->dmic_en = true;
 		dev_info(&i2c->dev, "quirk DMIC enabled\n");
 	}
 	if (rt5670_quirk & RT5670_DMIC1_IN2P) {
-		rt5670->pdata.dmic1_data_pin = RT5670_DMIC_DATA_IN2P;
+		rt5670->dmic1_data_pin = RT5670_DMIC_DATA_IN2P;
 		dev_info(&i2c->dev, "quirk DMIC1 on IN2P pin\n");
 	}
 	if (rt5670_quirk & RT5670_DMIC1_GPIO6) {
-		rt5670->pdata.dmic1_data_pin = RT5670_DMIC_DATA_GPIO6;
+		rt5670->dmic1_data_pin = RT5670_DMIC_DATA_GPIO6;
 		dev_info(&i2c->dev, "quirk DMIC1 on GPIO6 pin\n");
 	}
 	if (rt5670_quirk & RT5670_DMIC1_GPIO7) {
-		rt5670->pdata.dmic1_data_pin = RT5670_DMIC_DATA_GPIO7;
+		rt5670->dmic1_data_pin = RT5670_DMIC_DATA_GPIO7;
 		dev_info(&i2c->dev, "quirk DMIC1 on GPIO7 pin\n");
 	}
 	if (rt5670_quirk & RT5670_DMIC2_INR) {
-		rt5670->pdata.dmic2_data_pin = RT5670_DMIC_DATA_IN3N;
+		rt5670->dmic2_data_pin = RT5670_DMIC_DATA_IN3N;
 		dev_info(&i2c->dev, "quirk DMIC2 on INR pin\n");
 	}
 	if (rt5670_quirk & RT5670_DMIC2_GPIO8) {
-		rt5670->pdata.dmic2_data_pin = RT5670_DMIC_DATA_GPIO8;
+		rt5670->dmic2_data_pin = RT5670_DMIC_DATA_GPIO8;
 		dev_info(&i2c->dev, "quirk DMIC2 on GPIO8 pin\n");
 	}
 	if (rt5670_quirk & RT5670_DMIC3_GPIO5) {
-		rt5670->pdata.dmic3_data_pin = RT5670_DMIC_DATA_GPIO5;
+		rt5670->dmic3_data_pin = RT5670_DMIC_DATA_GPIO5;
 		dev_info(&i2c->dev, "quirk DMIC3 on GPIO5 pin\n");
 	}
 
 	if (rt5670_quirk & RT5670_JD_MODE1) {
-		rt5670->pdata.jd_mode = 1;
+		rt5670->jd_mode = 1;
 		dev_info(&i2c->dev, "quirk JD mode 1\n");
 	}
 	if (rt5670_quirk & RT5670_JD_MODE2) {
-		rt5670->pdata.jd_mode = 2;
+		rt5670->jd_mode = 2;
 		dev_info(&i2c->dev, "quirk JD mode 2\n");
 	}
 	if (rt5670_quirk & RT5670_JD_MODE3) {
-		rt5670->pdata.jd_mode = 3;
+		rt5670->jd_mode = 3;
 		dev_info(&i2c->dev, "quirk JD mode 3\n");
 	}
 
@@ -3041,11 +3036,11 @@ static int rt5670_i2c_probe(struct i2c_client *i2c,
 	regmap_update_bits(rt5670->regmap, RT5670_DIG_MISC,
 				 RT5670_MCLK_DET, RT5670_MCLK_DET);
 
-	if (rt5670->pdata.in2_diff)
+	if (rt5670->in2_diff)
 		regmap_update_bits(rt5670->regmap, RT5670_IN2,
 					RT5670_IN_DF2, RT5670_IN_DF2);
 
-	if (rt5670->pdata.dev_gpio) {
+	if (rt5670->dev_gpio) {
 		/* for push button */
 		regmap_write(rt5670->regmap, RT5670_IL_CMD, 0x0000);
 		regmap_write(rt5670->regmap, RT5670_IL_CMD2, 0x0010);
@@ -3057,14 +3052,14 @@ static int rt5670_i2c_probe(struct i2c_client *i2c,
 				   RT5670_GP1_PF_MASK, RT5670_GP1_PF_OUT);
 	}
 
-	if (rt5670->pdata.gpio1_is_ext_spk_en) {
+	if (rt5670->gpio1_is_ext_spk_en) {
 		regmap_update_bits(rt5670->regmap, RT5670_GPIO_CTRL1,
 				   RT5670_GP1_PIN_MASK, RT5670_GP1_PIN_GPIO1);
 		regmap_update_bits(rt5670->regmap, RT5670_GPIO_CTRL2,
 				   RT5670_GP1_PF_MASK, RT5670_GP1_PF_OUT);
 	}
 
-	if (rt5670->pdata.jd_mode) {
+	if (rt5670->jd_mode) {
 		regmap_update_bits(rt5670->regmap, RT5670_GLB_CLK,
 				   RT5670_SCLK_SRC_MASK, RT5670_SCLK_SRC_RCCLK);
 		rt5670->sysclk = 0;
@@ -3079,7 +3074,7 @@ static int rt5670_i2c_probe(struct i2c_client *i2c,
 				   RT5670_JD_TRI_CBJ_SEL_MASK |
 				   RT5670_JD_TRI_HPO_SEL_MASK,
 				   RT5670_JD_CBJ_JD1_1 | RT5670_JD_HPO_JD1_1);
-		switch (rt5670->pdata.jd_mode) {
+		switch (rt5670->jd_mode) {
 		case 1:
 			regmap_update_bits(rt5670->regmap, RT5670_A_JD_CTRL1,
 					   RT5670_JD1_MODE_MASK,
@@ -3100,12 +3095,12 @@ static int rt5670_i2c_probe(struct i2c_client *i2c,
 		}
 	}
 
-	if (rt5670->pdata.dmic_en) {
+	if (rt5670->dmic_en) {
 		regmap_update_bits(rt5670->regmap, RT5670_GPIO_CTRL1,
 				   RT5670_GP2_PIN_MASK,
 				   RT5670_GP2_PIN_DMIC1_SCL);
 
-		switch (rt5670->pdata.dmic1_data_pin) {
+		switch (rt5670->dmic1_data_pin) {
 		case RT5670_DMIC_DATA_IN2P:
 			regmap_update_bits(rt5670->regmap, RT5670_DMIC_CTRL1,
 					   RT5670_DMIC_1_DP_MASK,
@@ -3134,7 +3129,7 @@ static int rt5670_i2c_probe(struct i2c_client *i2c,
 			break;
 		}
 
-		switch (rt5670->pdata.dmic2_data_pin) {
+		switch (rt5670->dmic2_data_pin) {
 		case RT5670_DMIC_DATA_IN3N:
 			regmap_update_bits(rt5670->regmap, RT5670_DMIC_CTRL1,
 					   RT5670_DMIC_2_DP_MASK,
@@ -3154,7 +3149,7 @@ static int rt5670_i2c_probe(struct i2c_client *i2c,
 			break;
 		}
 
-		switch (rt5670->pdata.dmic3_data_pin) {
+		switch (rt5670->dmic3_data_pin) {
 		case RT5670_DMIC_DATA_GPIO5:
 			regmap_update_bits(rt5670->regmap, RT5670_DMIC_CTRL2,
 					   RT5670_DMIC_3_DP_MASK,
diff --git a/sound/soc/codecs/rt5670.h b/sound/soc/codecs/rt5670.h
index de0203369b7c..657420805918 100644
--- a/sound/soc/codecs/rt5670.h
+++ b/sound/soc/codecs/rt5670.h
@@ -9,8 +9,6 @@
 #ifndef __RT5670_H__
 #define __RT5670_H__
 
-#include <sound/rt5670.h>
-
 /* Info */
 #define RT5670_RESET				0x00
 #define RT5670_VENDOR_ID			0xfd
@@ -1988,11 +1986,23 @@ int rt5670_sel_asrc_clk_src(struct snd_soc_component *component,
 
 struct rt5670_priv {
 	struct snd_soc_component *component;
-	struct rt5670_platform_data pdata;
 	struct regmap *regmap;
 	struct snd_soc_jack *jack;
 	struct snd_soc_jack_gpio hp_gpio;
 
+	int jd_mode;
+	bool in2_diff;
+	bool dev_gpio;
+	bool gpio1_is_ext_spk_en;
+
+	bool dmic_en;
+	unsigned int dmic1_data_pin;
+	/* 0 = GPIO6; 1 = IN2P; 3 = GPIO7*/
+	unsigned int dmic2_data_pin;
+	/* 0 = GPIO8; 1 = IN3N; */
+	unsigned int dmic3_data_pin;
+	/* 0 = GPIO9; 1 = GPIO10; 2 = GPIO5*/
+
 	int sysclk;
 	int sysclk_src;
 	int lrck[RT5670_AIFS];
-- 
2.26.2

