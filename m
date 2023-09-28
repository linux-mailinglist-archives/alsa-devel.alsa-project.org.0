Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BCF7B3F18
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:14:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C044EFF3;
	Sat, 30 Sep 2023 10:14:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C044EFF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061691;
	bh=YFz06tyz8dox0aTM8iOPD4rsxYYRBNTMX2fJD4ZB+4U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=drklX23TI+GFvxjsA684Yq019g8k1M7Z27Y/lK8bWfnWcalv0Z1dUtLRBzVMu/Kq9
	 Zb9JmrmOWsuRX08dIJfXgq7TAwQIryzIwKY7NkKDYpqOe1NWW6IHG6z4Et0kqBnPdM
	 couS517V/A8ZbPDpn5R234S6YbUPtYDDaKyKLV9Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0797CF805D2; Sat, 30 Sep 2023 10:12:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAE7DF805AC;
	Sat, 30 Sep 2023 10:12:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0F6BF80290; Thu, 28 Sep 2023 05:42:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	by alsa1.perex.cz (Postfix) with ESMTP id 13828F801D5
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 05:41:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13828F801D5
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTPS Server V6.0(1978095:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256);
 Thu, 28 Sep 2023 11:41:10 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Thu, 28 Sep
 2023 11:41:10 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Thu, 28 Sep 2023 11:41:10 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, ChiYuan Huang <cy_huang@richtek.com>, Allen Lin
	<allen_lin@richtek.com>, <devicetree@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ASoC: codecs: rtq9128: Add TDM input source select
Date: Thu, 28 Sep 2023 11:41:08 +0800
Message-ID: <1695872468-24433-3-git-send-email-cy_huang@richtek.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1695872468-24433-1-git-send-email-cy_huang@richtek.com>
References: <1695872468-24433-1-git-send-email-cy_huang@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: prvs=1631658C43=cy_huang@richtek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2WEDS6IOWUA6F5EHRRXGEOMYGSN45OS4
X-Message-ID-Hash: 2WEDS6IOWUA6F5EHRRXGEOMYGSN45OS4
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:11:56 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2WEDS6IOWUA6F5EHRRXGEOMYGSN45OS4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Pase the property to decide the TDM input source comes from 'DATA1' or
'DATA2 pin.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 sound/soc/codecs/rtq9128.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rtq9128.c b/sound/soc/codecs/rtq9128.c
index 926b79ed8078..371d622c6214 100644
--- a/sound/soc/codecs/rtq9128.c
+++ b/sound/soc/codecs/rtq9128.c
@@ -14,6 +14,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -41,6 +42,7 @@
 
 #define RTQ9128_CHSTAT_VAL_MASK	GENMASK(1, 0)
 #define RTQ9128_DOLEN_MASK	GENMASK(7, 6)
+#define RTQ9128_TDMSRCIN_MASK	GENMASK(5, 4)
 #define RTQ9128_AUDBIT_MASK	GENMASK(5, 4)
 #define RTQ9128_AUDFMT_MASK	GENMASK(3, 0)
 #define RTQ9128_MSMUTE_MASK	BIT(0)
@@ -59,6 +61,7 @@ struct rtq9128_data {
 	struct gpio_desc *enable;
 	int tdm_slots;
 	int tdm_slot_width;
+	bool tdm_input_data2_select;
 };
 
 struct rtq9128_init_reg {
@@ -484,7 +487,7 @@ static int rtq9128_dai_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mas
 	struct rtq9128_data *data = snd_soc_dai_get_drvdata(dai);
 	struct snd_soc_component *comp = dai->component;
 	struct device *dev = dai->dev;
-	unsigned int mask, start_loc;
+	unsigned int mask, start_loc, srcin_select;
 	int i, frame_length, ret;
 
 	dev_dbg(dev, "%s: slot %d slot_width %d, tx/rx mask 0x%x 0x%x\n", __func__, slots,
@@ -530,6 +533,14 @@ static int rtq9128_dai_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mas
 		}
 	}
 
+	srcin_select = data->tdm_input_data2_select ? RTQ9128_TDMSRCIN_MASK : 0;
+	ret = snd_soc_component_update_bits(comp, RTQ9128_REG_SDO_SEL, RTQ9128_TDMSRCIN_MASK,
+					    srcin_select);
+	if (ret < 0) {
+		dev_err(dev, "Failed to configure TDM source input select\n");
+		return ret;
+	}
+
 	data->tdm_slots = slots;
 	data->tdm_slot_width = slot_width;
 
@@ -672,6 +683,9 @@ static int rtq9128_probe(struct i2c_client *i2c)
 	else if (data->enable)
 		usleep_range(10000, 11000);
 
+	data->tdm_input_data2_select = device_property_read_bool(dev,
+								 "richtek,tdm-input-data2-select");
+
 	i2c_set_clientdata(i2c, data);
 
 	/*
-- 
2.34.1

