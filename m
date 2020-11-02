Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4559D2A2453
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 06:30:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C059516DB;
	Mon,  2 Nov 2020 06:30:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C059516DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604295052;
	bh=Sf2/rAhtvOFtI+OdUJhpRAN21FJHYkjWliRgyxgxBGk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FhAmRRlRLbr2tjiDD2Dkj6qqf5qVYjS4bgV0/tA3/R5d7oX/8hWDdVjYzU/B2UYG4
	 UAxax5u/RjSOpQiBmauQq/znnPnI5DaI54V4eOzO1i35YG2yAnPNWv46vW56opRstq
	 hx7cCT/y0zKRDb6O/2uWNttnunlz71p5+nCNRmXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2167F80234;
	Mon,  2 Nov 2020 06:29:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C60AF80232; Mon,  2 Nov 2020 06:29:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99529F80083
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 06:28:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99529F80083
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0A25Sn6U2026716,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0A25Sn6U2026716
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 2 Nov 2020 13:28:49 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.36) by
 RTEXMB01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Mon, 2 Nov 2020 13:28:49 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.36) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 2 Nov 2020 13:28:48 +0800
From: <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt1015: add delay to fix pop noise from speaker
Date: Mon, 2 Nov 2020 13:28:40 +0800
Message-ID: <20201102052840.21590-1-jack.yu@realtek.com>
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
 include/sound/rt1015.h    | 15 +++++++++++++++
 sound/soc/codecs/rt1015.c | 20 ++++++++++++++++++++
 sound/soc/codecs/rt1015.h |  2 ++
 3 files changed, 37 insertions(+)
 create mode 100644 include/sound/rt1015.h

diff --git a/include/sound/rt1015.h b/include/sound/rt1015.h
new file mode 100644
index 000000000000..bc83ac22a6bf
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
+	unsigned int power_up_delay;
+};
+
+#endif
diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 25fe2ddedd54..4f9d453f1603 100644
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
+	.power_up_delay = 50,
+};
+
 static const struct reg_default rt1015_reg[] = {
 	{ 0x0000, 0x0000 },
 	{ 0x0004, 0xa000 },
@@ -650,6 +655,7 @@ static int rt1015_amp_drv_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMU:
 		if (rt1015->hw_config == RT1015_HW_28)
 			schedule_delayed_work(&rt1015->flush_work, msecs_to_jiffies(10));
+		msleep(rt1015->pdata.power_up_delay);
 		break;
 	default:
 		break;
@@ -1067,9 +1073,16 @@ static struct acpi_device_id rt1015_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, rt1015_acpi_match);
 #endif
 
+static void rt1015_parse_dt(struct rt1015_priv *rt1015, struct device *dev)
+{
+	device_property_read_u32(dev, "realtek,power-up-delay",
+		&rt1015->pdata.power_up_delay);
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

