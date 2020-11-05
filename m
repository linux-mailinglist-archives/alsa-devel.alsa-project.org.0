Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 391CA2A75EE
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Nov 2020 04:10:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AB661671;
	Thu,  5 Nov 2020 04:09:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AB661671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604545800;
	bh=p+l99zVyUt+mQV1hYKTea38EWXK4ZYCLeqMYjPcl8bs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qyTxIv+xC+R3HCxeVEAFvQMeZ6Afw1N2MHRV10jZCJjsdBPF6wECWSrmhtSVUHBgM
	 B7oPrl2licpIjIKiTuYFrD1+DafmKXNofKlWg9nFtEDW5B1ZzW7PrhIdaB7YjTryI+
	 khuAmmXKwq7fddz8rUsGkoq72ueLWymF2XotrBx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E193F800BA;
	Thu,  5 Nov 2020 04:08:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ED36F80171; Thu,  5 Nov 2020 04:08:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B4D7F80150
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 04:08:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B4D7F80150
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0A538BSr8026428,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb04.realtek.com.tw[172.21.6.97])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0A538BSr8026428
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 5 Nov 2020 11:08:11 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXMB04.realtek.com.tw (172.21.6.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Thu, 5 Nov 2020 11:08:11 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 5 Nov 2020 11:08:10 +0800
From: <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH v3] ASoC: rt1015: add delay to fix pop noise from speaker
Date: Thu, 5 Nov 2020 11:08:04 +0800
Message-ID: <20201105030804.31115-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMB01.realtek.com.tw (172.21.6.94) To
 RTEXMBS01.realtek.com.tw (172.21.6.36)
Cc: oder_chiou@realtek.com, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, lars@metafoo.de, kent_chen@realtek.com,
 kenny_chen@realtek.com, tzungbi@google.com, derek.fang@realtek.com,
 shumingf@realtek.com, flove@realtek.com
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

From: Jack Yu <jack.yu@realtek.com>

Add delay to fix pop noise from speaker.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 .../devicetree/bindings/sound/rt1015.txt      |  6 ++++++
 include/sound/rt1015.h                        | 15 ++++++++++++++
 sound/soc/codecs/rt1015.c                     | 20 +++++++++++++++++++
 sound/soc/codecs/rt1015.h                     |  2 ++
 4 files changed, 43 insertions(+)
 create mode 100644 include/sound/rt1015.h

diff --git a/Documentation/devicetree/bindings/sound/rt1015.txt b/Documentation/devicetree/bindings/sound/rt1015.txt
index fcfd02d8d32f..e498966d436f 100644
--- a/Documentation/devicetree/bindings/sound/rt1015.txt
+++ b/Documentation/devicetree/bindings/sound/rt1015.txt
@@ -8,10 +8,16 @@ Required properties:
 
 - reg : The I2C address of the device.
 
+Optional properties:
+
+- realtek,power-up-delay-ms
+  Set a delay time for flush work to be completed,
+  this value is adjustable depending on platform.
 
 Example:
 
 rt1015: codec@28 {
 	compatible = "realtek,rt1015";
 	reg = <0x28>;
+	realtek,power-up-delay-ms = <50>;
 };
diff --git a/include/sound/rt1015.h b/include/sound/rt1015.h
new file mode 100644
index 000000000000..70a7538d4c89
--- /dev/null
+++ b/include/sound/rt1015.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * linux/sound/rt1015.h -- Platform data for RT1015
+ *
+ * Copyright 2020 Realtek Microelectronics
+ */
+
+#ifndef __LINUX_SND_RT1015_H
+#define __LINUX_SND_RT1015_H
+
+struct rt1015_platform_data {
+	unsigned int power_up_delay_ms;
+};
+
+#endif
diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 25fe2ddedd54..967193518349 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -27,10 +27,15 @@
 #include <sound/soc-dapm.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
+#include <sound/rt1015.h>
 
 #include "rl6231.h"
 #include "rt1015.h"
 
+static const struct rt1015_platform_data i2s_default_platform_data = {
+	.power_up_delay_ms = 50,
+};
+
 static const struct reg_default rt1015_reg[] = {
 	{ 0x0000, 0x0000 },
 	{ 0x0004, 0xa000 },
@@ -650,6 +655,7 @@ static int rt1015_amp_drv_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMU:
 		if (rt1015->hw_config == RT1015_HW_28)
 			schedule_delayed_work(&rt1015->flush_work, msecs_to_jiffies(10));
+		msleep(rt1015->pdata.power_up_delay_ms);
 		break;
 	default:
 		break;
@@ -1067,9 +1073,16 @@ static struct acpi_device_id rt1015_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, rt1015_acpi_match);
 #endif
 
+static void rt1015_parse_dt(struct rt1015_priv *rt1015, struct device *dev)
+{
+	device_property_read_u32(dev, "realtek,power-up-delay-ms",
+		&rt1015->pdata.power_up_delay_ms);
+}
+
 static int rt1015_i2c_probe(struct i2c_client *i2c,
 	const struct i2c_device_id *id)
 {
+	struct rt1015_platform_data *pdata = dev_get_platdata(&i2c->dev);
 	struct rt1015_priv *rt1015;
 	int ret;
 	unsigned int val;
@@ -1081,6 +1094,13 @@ static int rt1015_i2c_probe(struct i2c_client *i2c,
 
 	i2c_set_clientdata(i2c, rt1015);
 
+	rt1015->pdata = i2s_default_platform_data;
+
+	if (pdata)
+		rt1015->pdata = *pdata;
+	else
+		rt1015_parse_dt(rt1015, &i2c->dev);
+
 	rt1015->regmap = devm_regmap_init_i2c(i2c, &rt1015_regmap);
 	if (IS_ERR(rt1015->regmap)) {
 		ret = PTR_ERR(rt1015->regmap);
diff --git a/sound/soc/codecs/rt1015.h b/sound/soc/codecs/rt1015.h
index d3fdd30aca6d..15cadb361ec3 100644
--- a/sound/soc/codecs/rt1015.h
+++ b/sound/soc/codecs/rt1015.h
@@ -12,6 +12,7 @@
 
 #ifndef __RT1015_H__
 #define __RT1015_H__
+#include <sound/rt1015.h>
 
 #define RT1015_DEVICE_ID_VAL			0x1011
 #define RT1015_DEVICE_ID_VAL2			0x1015
@@ -380,6 +381,7 @@ enum {
 
 struct rt1015_priv {
 	struct snd_soc_component *component;
+	struct rt1015_platform_data pdata;
 	struct regmap *regmap;
 	int sysclk;
 	int sysclk_src;
-- 
2.28.0

