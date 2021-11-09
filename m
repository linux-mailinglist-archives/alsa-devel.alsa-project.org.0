Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB2244A6D1
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 07:25:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5B2E1662;
	Tue,  9 Nov 2021 07:24:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5B2E1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636439149;
	bh=aGxYC2K+zJAm+iH/6W2TjmpmsHaIvqXzHofR04sbPFE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lCddZUpngMtuC/VZuOaiqrRNfvlQ9Fcxiq09T06nX4DzWsPQTRLgM+iuFohd8cwyy
	 GCeuhWgOX7bHo9nvBiyKDR2Yb7MVziDcInQu/5KPY7bG/Uv2kcWV5gY1UN9bToZN7n
	 NQm8z9wSWH2QUka+C9QVfMEolTj+y7yh3hGFXKUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6621F80224;
	Tue,  9 Nov 2021 07:24:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2C2BF802D2; Tue,  9 Nov 2021 07:24:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4BD1F802D2
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 07:24:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4BD1F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oCzarSAY"
Received: by mail-pl1-x635.google.com with SMTP id b13so19110441plg.2
 for <alsa-devel@alsa-project.org>; Mon, 08 Nov 2021 22:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iGYGbg+9l8ssVOmfcebv8ju3BSiG3enW9yQKoptJRsQ=;
 b=oCzarSAYqvAhQ2Wyka7w85rnjr4nvbv552bjvAGXOP48ZZ1HWJr68dR0FbRYt5u8ZI
 uUZs0GQLU6gV7o0PgTpZ6UQGGohZeZVhuM4NU49YovfY2w/dwxYegguIM02e1HYwUeAN
 Hk15z8DXZJ/l79n+sjzu4ZzyWx0pb5hjNzBhVM40Tc4Fzjoh9FWmytXCdQnveKUCIIfM
 fFbBfAxjLqM3qrK/yKhHAQ7YMC8YMlh6F3bRp0taRO5ZtWA5kCUDPa69cnRkTiMC/Mwl
 2FVNld/5FyVL7sfN1AB8gM4YDxQ6p0ze/7aZMevZ3Qs2UHdrRKLur5hFutDNmOtcoq2x
 kMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iGYGbg+9l8ssVOmfcebv8ju3BSiG3enW9yQKoptJRsQ=;
 b=6i5Q0tWZfYZo2IYbG2GNRXybLnM1ygVeqP8jLhdu60yLM7uVmzCkuIVpnpGh+EwClP
 a/Lo9zEX9z2UNxIG5j78/OivhZe2mal2W0v93RftFk63bz+gTBvzakqopiVLc92qeDdi
 S71esrTV7Sym6pfrRm/+P/jPobQQ0UahRMf4kIirX5QLRCSqh3V+xdGzyCfudj6scUR5
 mmNFkHmnolKSftYp8YxTzZxEiAhrv7crzP+dvp6HVv3Rlts6PPQ/koCiTxJAghQkwnJQ
 3mBNHVEu/duqvTlLucjuroJNmuWKK5FuT4q8bgMfhDssTu0ahwnBxkwJeBAEYsNJ3sGa
 x1mw==
X-Gm-Message-State: AOAM531lfi0rz/Mkj6mROBhdwba9/aXiMP7KUqwTgQye3EeXdjbNCPjy
 4PXv+xa+RFzJB2Nv9dhiyTo=
X-Google-Smtp-Source: ABdhPJxL7Knq0JkBX4KTpSPx9/BalN7ds4cqaw1TYpytKxqBeTgd09WzvXYXtGRATb14xXc5Tw0hAg==
X-Received: by 2002:a17:90a:690d:: with SMTP id
 r13mr4670069pjj.40.1636439040238; 
 Mon, 08 Nov 2021 22:24:00 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:578:468f:d592:ff78:ffa9:3df7])
 by smtp.gmail.com with ESMTPSA id x33sm6856718pfh.133.2021.11.08.22.23.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Nov 2021 22:23:59 -0800 (PST)
From: cy_huang <u0084500@gmail.com>
To: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH 2/2] ASoC: rt9120: Add the compatibility with rt9120s
Date: Tue,  9 Nov 2021 14:23:44 +0800
Message-Id: <1636439024-15877-3-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636439024-15877-1-git-send-email-u0084500@gmail.com>
References: <1636439024-15877-1-git-send-email-u0084500@gmail.com>
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, allen_lin@richtek.com
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

From: ChiYuan Huang <cy_huang@richtek.com>

Use device id reg to be compatible with rt9120 and rt9120s.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 sound/soc/codecs/rt9120.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt9120.c b/sound/soc/codecs/rt9120.c
index d007d00..6974705 100644
--- a/sound/soc/codecs/rt9120.c
+++ b/sound/soc/codecs/rt9120.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/bits.h>
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -23,6 +24,7 @@
 #define RT9120_REG_ERRRPT	0x10
 #define RT9120_REG_MSVOL	0x20
 #define RT9120_REG_SWRESET	0x40
+#define RT9120_REG_INTERCFG	0x63
 #define RT9120_REG_INTERNAL0	0x65
 #define RT9120_REG_INTERNAL1	0x69
 #define RT9120_REG_UVPOPT	0x6C
@@ -49,7 +51,8 @@
 #define RT9120_DVDD_UVSEL_MASK	GENMASK(5, 4)
 #define RT9120_AUTOSYNC_MASK	BIT(6)
 
-#define RT9120_VENDOR_ID	0x4200
+#define RT9120_VENDOR_ID	0x42
+#define RT9120S_VENDOR_ID	0x43
 #define RT9120_RESET_WAITMS	20
 #define RT9120_CHIPON_WAITMS	20
 #define RT9120_AMPON_WAITMS	50
@@ -63,9 +66,16 @@
 				 SNDRV_PCM_FMTBIT_S24_LE |\
 				 SNDRV_PCM_FMTBIT_S32_LE)
 
+enum {
+	CHIP_IDX_RT9120 = 0,
+	CHIP_IDX_RT9120S,
+	CHIP_IDX_MAX
+};
+
 struct rt9120_data {
 	struct device *dev;
 	struct regmap *regmap;
+	int chip_idx;
 };
 
 /* 11bit [min,max,step] = [-103.9375dB, 24dB, 0.0625dB] */
@@ -151,7 +161,12 @@ static int rt9120_codec_probe(struct snd_soc_component *comp)
 	snd_soc_component_init_regmap(comp, data->regmap);
 
 	/* Internal setting */
-	snd_soc_component_write(comp, RT9120_REG_INTERNAL0, 0x04);
+	if (data->chip_idx == CHIP_IDX_RT9120S) {
+		snd_soc_component_write(comp, RT9120_REG_INTERCFG, 0xde);
+		snd_soc_component_write(comp, RT9120_REG_INTERNAL0, 0x66);
+	} else
+		snd_soc_component_write(comp, RT9120_REG_INTERNAL0, 0x04);
+
 	return 0;
 }
 
@@ -291,6 +306,7 @@ static const struct regmap_range rt9120_rd_yes_ranges[] = {
 	regmap_reg_range(0x20, 0x27),
 	regmap_reg_range(0x30, 0x38),
 	regmap_reg_range(0x3A, 0x40),
+	regmap_reg_range(0x63, 0x63),
 	regmap_reg_range(0x65, 0x65),
 	regmap_reg_range(0x69, 0x69),
 	regmap_reg_range(0x6C, 0x6C),
@@ -310,6 +326,7 @@ static const struct regmap_range rt9120_wr_yes_ranges[] = {
 	regmap_reg_range(0x30, 0x38),
 	regmap_reg_range(0x3A, 0x3D),
 	regmap_reg_range(0x40, 0x40),
+	regmap_reg_range(0x63, 0x63),
 	regmap_reg_range(0x65, 0x65),
 	regmap_reg_range(0x69, 0x69),
 	regmap_reg_range(0x6C, 0x6C),
@@ -402,8 +419,16 @@ static int rt9120_check_vendor_info(struct rt9120_data *data)
 	if (ret)
 		return ret;
 
-	if ((devid & RT9120_VID_MASK) != RT9120_VENDOR_ID) {
-		dev_err(data->dev, "DEVID not correct [0x%04x]\n", devid);
+	devid = FIELD_GET(RT9120_VID_MASK, devid);
+	switch (devid) {
+	case RT9120_VENDOR_ID:
+		data->chip_idx = CHIP_IDX_RT9120;
+		break;
+	case RT9120S_VENDOR_ID:
+		data->chip_idx = CHIP_IDX_RT9120S;
+		break;
+	default:
+		dev_err(data->dev, "DEVID not correct [0x%0x]\n", devid);
 		return -ENODEV;
 	}
 
-- 
2.7.4

