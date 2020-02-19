Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3B7163FF2
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 10:06:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8AB016F7;
	Wed, 19 Feb 2020 10:05:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8AB016F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582103182;
	bh=+exoR8hN/jbYrgmUonDjFGVLOeRr7vjHVOWX06RqyM8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RdgdPj5uuNejyrNxkRvNiTjDrU9TLlOYPKRZKrjh+ywuzo2ExERjnLQYSDJiVKlWB
	 HnUEm1hPxEe9mbmG0o84ouzI9ZRr5Q8lHSBWYV99qrQIHDRdcgKJgAnMmSKhJSEOBF
	 Vum1lMSw+eZGlXxCtZ3ypxpbDPTdi3QGKurQSFJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0774F8015E;
	Wed, 19 Feb 2020 10:04:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1BE1F80172; Wed, 19 Feb 2020 10:04:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8B48F80142
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 10:04:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8B48F80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eNHopnRD"
Received: by mail-pg1-x541.google.com with SMTP id w21so12381817pgl.9
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 01:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=zzjNsVT7oFssvopVPRdGW/YTCcDi0QZYWBWNA17kwhg=;
 b=eNHopnRDIVVrepw5vDCEHq2Oka1gXLsWwAXhAKzSHRO7h69Y9ZTIgAIKTw5sIE1zcr
 dDFIvcL0ReVbdcKCQOIsJTxWs7E9rSs/Ehg6Sjqt7C804okv8FBBfTp8WyrqoQ7qfyZ1
 um28qJXOkM72Gb0thvNp8UdV8ZDW5FB9sfqtK1Khzx5Lcw2l8j/DRfX3m6U/VHT3G7aO
 VA5Ql/nTRfhqLJGefDkORrM6q+9nmHHIeRph1hJVh9wwvnEzIF6Qp868Orz+oAtG3xow
 Cu4+wEg4IgD3AOV2KvTcJfY0sSWMMaac/CGvNqWXa9+rlA0eo1htT3NY7k7dZp/z5DPB
 bobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zzjNsVT7oFssvopVPRdGW/YTCcDi0QZYWBWNA17kwhg=;
 b=oMhoFUjMh/QPOD+UbPYLOcZbyyT+GbDHojNY2BK8xgzod0ZwsSaU6rA30tXFXAuBBK
 zCekeMAYHfJGCxBU8iXgYWGRnd4zR0osxM0ZZNV2XGBBUTB8/UCw3mVUj6znO8J59X4n
 NbHG/EsjTxXdlEG2jBi/NNodc5M454f9rEaQFpTKTMGRFq4cvGHdbyPnMPxNw6cfJfZQ
 HwDFyD9JJsIoqS2eq0r0p27Gw/FNex6l2WcqV1WAYqAPbxEobczug/qFgOC+kg64H1KX
 oByNB59sXlLctDfKlm5fXIm2Q+J6IYUyetXjm1CKUHQHTa1d/s+cu6qqYKTWsOqvURfX
 JM7Q==
X-Gm-Message-State: APjAAAVb4cJ0u4bOH2U49o4cfJDpm+3LjYLy59iUd4PckZ4PQ9wkCf3h
 bmn2R/JdiUyuY48HvEttiFU=
X-Google-Smtp-Source: APXvYqyUx/ed9xaA7LIfb73jmGtEiSRQm+UAORQvBANl91x/+R19025joyq1EtFB4+oxNnDeYjNruQ==
X-Received: by 2002:a63:2a02:: with SMTP id q2mr26247331pgq.198.1582103073166; 
 Wed, 19 Feb 2020 01:04:33 -0800 (PST)
Received: from localhost.localdomain ([101.13.197.106])
 by smtp.gmail.com with ESMTPSA id b25sm1849858pfo.38.2020.02.19.01.04.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 19 Feb 2020 01:04:32 -0800 (PST)
From: Jeff Chang <richtek.jeff.chang@gmail.com>
To: lgirdwood@gmail.com
Subject: [PATCH v2] ASoC: MT6660 update to 1.0.8_G
Date: Wed, 19 Feb 2020 17:04:24 +0800
Message-Id: <1582103064-25088-1-git-send-email-richtek.jeff.chang@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: alsa-devel@alsa-project.org, richtek.jeff.chang@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, jeff_chang@richtek.com,
 broonie@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

From: Jeff Chang <jeff_chang@richtek.com>

1. add mt6660_component_settign for Component INIT Setting

Signed-off-by: Jeff Chang <jeff_chang@richtek.com>
---
 sound/soc/codecs/mt6660.c | 78 +++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 75 insertions(+), 3 deletions(-)


changelogs between v2 & v1
        - remove parse DT and apply function about Chip INIT SETTING.
        - use hard coding for MT6660 Component INIT SETTING.


diff --git a/sound/soc/codecs/mt6660.c b/sound/soc/codecs/mt6660.c
index a36c416..88cf228 100644
--- a/sound/soc/codecs/mt6660.c
+++ b/sound/soc/codecs/mt6660.c
@@ -9,7 +9,6 @@
 #include <linux/i2c.h>
 #include <linux/pm_runtime.h>
 #include <linux/delay.h>
-#include <linux/debugfs.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
 #include <sound/pcm_params.h>
@@ -225,14 +224,87 @@ static int _mt6660_chip_power_on(struct mt6660_chip *chip, int on_off)
 				 0x01, on_off ? 0x00 : 0x01);
 }
 
+struct reg_table {
+	uint32_t addr;
+	uint32_t mask;
+	uint32_t val;
+};
+
+static const struct reg_table mt6660_setting_table[] = {
+	{ 0x20, 0x80, 0x00 },
+	{ 0x30, 0x01, 0x00 },
+	{ 0x50, 0x1c, 0x04 },
+	{ 0xB1, 0x0c, 0x00 },
+	{ 0xD3, 0x03, 0x03 },
+	{ 0xE0, 0x01, 0x00 },
+	{ 0x98, 0x44, 0x04 },
+	{ 0xB9, 0xff, 0x82 },
+	{ 0xB7, 0x7777, 0x7273 },
+	{ 0xB6, 0x07, 0x03 },
+	{ 0x6B, 0xe0, 0x20 },
+	{ 0x07, 0xff, 0x70 },
+	{ 0xBB, 0xff, 0x20 },
+	{ 0x69, 0xff, 0x40 },
+	{ 0xBD, 0xffff, 0x17f8 },
+	{ 0x70, 0xff, 0x15 },
+	{ 0x7C, 0xff, 0x00 },
+	{ 0x46, 0xff, 0x1d },
+	{ 0x1A, 0xffffffff, 0x7fdb7ffe },
+	{ 0x1B, 0xffffffff, 0x7fdb7ffe },
+	{ 0x51, 0xff, 0x58 },
+	{ 0xA2, 0xff, 0xce },
+	{ 0x33, 0xffff, 0x7fff },
+	{ 0x4C, 0xffff, 0x0116 },
+	{ 0x16, 0x1800, 0x0800 },
+	{ 0x68, 0x1f, 0x07 },
+};
+
+static int mt6660_component_setting(struct snd_soc_component *component)
+{
+	struct mt6660_chip *chip = snd_soc_component_get_drvdata(component);
+	int ret = 0;
+	size_t i = 0;
+
+	ret = _mt6660_chip_power_on(chip, 1);
+	if (ret < 0) {
+		dev_err(component->dev, "%s chip power on failed\n", __func__);
+		return ret;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(mt6660_setting_table); i++) {
+		ret = snd_soc_component_update_bits(component,
+				mt6660_setting_table[i].addr,
+				mt6660_setting_table[i].mask,
+				mt6660_setting_table[i].val);
+		if (ret < 0) {
+			dev_err(component->dev, "%s update 0x%02x failed\n",
+				__func__, mt6660_setting_table[i].addr);
+			return ret;
+		}
+	}
+
+	ret = _mt6660_chip_power_on(chip, 0);
+	if (ret < 0) {
+		dev_err(component->dev, "%s chip power off failed\n", __func__);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int mt6660_component_probe(struct snd_soc_component *component)
 {
 	struct mt6660_chip *chip = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	dev_dbg(component->dev, "%s\n", __func__);
 	snd_soc_component_init_regmap(component, chip->regmap);
 
-	return 0;
+	ret = mt6660_component_setting(component);
+	if (ret < 0)
+		dev_err(chip->dev, "mt6660 component setting failed\n");
+
+	return ret;
 }
 
 static void mt6660_component_remove(struct snd_soc_component *component)
@@ -506,4 +578,4 @@ module_i2c_driver(mt6660_i2c_driver);
 MODULE_AUTHOR("Jeff Chang <jeff_chang@richtek.com>");
 MODULE_DESCRIPTION("MT6660 SPKAMP Driver");
 MODULE_LICENSE("GPL");
-MODULE_VERSION("1.0.7_G");
+MODULE_VERSION("1.0.8_G");
-- 
2.7.4

