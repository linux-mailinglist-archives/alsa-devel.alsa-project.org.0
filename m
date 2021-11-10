Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDBB44BAAE
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Nov 2021 04:48:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8027820;
	Wed, 10 Nov 2021 04:47:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8027820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636516091;
	bh=zGRJx+8TuHiQPBgA2dSYVhNQAWTUoSb74aQyb2sUVNE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vr73466YhVTf25H+RjbQXtykynuTfT85J/cQ5XwPFtVnYlPw18bqd7yS9Bb7oNMxt
	 KHEFVignfXJ8CsvyfXBhiAp9zMxKSudvRVP/AgkoDFx4XZdLGBZIbDM0Hum4zARsP2
	 ZFeUWwPbirhU7eOYEcPTk1OUAG3O4oM5npZAbhEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75869F804F2;
	Wed, 10 Nov 2021 04:45:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 365B4F80227; Wed, 10 Nov 2021 04:45:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5D9CF8049E
 for <alsa-devel@alsa-project.org>; Wed, 10 Nov 2021 04:45:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5D9CF8049E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="d2Lnis2l"
Received: by mail-pl1-x635.google.com with SMTP id p18so1809060plf.13
 for <alsa-devel@alsa-project.org>; Tue, 09 Nov 2021 19:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Fe2DNRNkXeR676K2UnXemGHLWR3/blj3DgcVGP77Sl4=;
 b=d2Lnis2lVAn3Shp2hgnHRRuzKn0sQXgQ2yZevjqWlfL5Vp8YIVg1w2yam0cfj92wqZ
 pav63t4EAazrt4Dzy697fEkJUeQBD/BdAhCFpgl8uFYW8mkAJ0rPqVcGN6KGOEMbfjjx
 KGWf7GOkaO8phjeWoa312aVqbiWgoBQ9KgoOuhhz+XLYVZrVBDURS28h1Ur81IjSlHv+
 VdaLD6mNtX2iC/hoOARpqrFrAvHLQzvpSwkK74FbSGlRfwSDs4iDCq7yTd824kjcNYmB
 TFsUfc81pj/5he7S/Bs6Z7yI+hlwRu4C29vbu04Jf4d4wbVcoJPIqBodPqnMbd3YVEYr
 Kbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Fe2DNRNkXeR676K2UnXemGHLWR3/blj3DgcVGP77Sl4=;
 b=dO2W3+lx91d8qQ5Fy9FBEvwJe+DT94d6jUah9WoC8OcdyJtgljBV+ETxXiJeUSD/Yp
 sg+5A7NMKtQ40nPKLPSxGCMRxh39n4TdPAn6fraqN/qXKcz1gwIzCp1Wbz0o7Vd4eI+j
 JnzlvgFnn0jYO2BphjB6oRXqlr1CZX86BGPIlYNt97ruZZp/69KkDEFnBkBT1qbJtW79
 3zhQbilzEoIaJh/95jBzEpkv4VybXoy9hfyI+f/r5dIjUAWAIlPICtVvWq02y5/F/Hy1
 XCw5UAYivWgckcKLcM7ekj7AnUBXLhOwJ2HtE4iFofNf1kd88dY2CBEg0Vrv13DUr7gi
 T/UQ==
X-Gm-Message-State: AOAM530gsM2GPvu39HpSxbJc7pYZgnFmctPD89Ks8ivvYvEOIKq+ZCyx
 RwwI9otG/K7mULPwbCq/8O4=
X-Google-Smtp-Source: ABdhPJw3CwBfo/2T2/e7B8O1i1tAIhXztFwJ3KhMS69aDE3ak9G4yX1W8/VfM4Te+LqpSvQdNv9M+Q==
X-Received: by 2002:a17:90a:6782:: with SMTP id
 o2mr13385208pjj.165.1636515938601; 
 Tue, 09 Nov 2021 19:45:38 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:46a:f117:d5ee:c3e5:104f:c135])
 by smtp.gmail.com with ESMTPSA id q6sm5995293pgn.42.2021.11.09.19.45.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Nov 2021 19:45:38 -0800 (PST)
From: cy_huang <u0084500@gmail.com>
To: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH v2 3/3] ASoC: rt9120: Add the compatibility with rt9120s
Date: Wed, 10 Nov 2021 11:45:21 +0800
Message-Id: <1636515921-31694-4-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636515921-31694-1-git-send-email-u0084500@gmail.com>
References: <1636515921-31694-1-git-send-email-u0084500@gmail.com>
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
index 981aead..7aa1772 100644
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
 
@@ -290,6 +305,7 @@ static const struct regmap_range rt9120_rd_yes_ranges[] = {
 	regmap_reg_range(0x20, 0x27),
 	regmap_reg_range(0x30, 0x38),
 	regmap_reg_range(0x3A, 0x40),
+	regmap_reg_range(0x63, 0x63),
 	regmap_reg_range(0x65, 0x65),
 	regmap_reg_range(0x69, 0x69),
 	regmap_reg_range(0x6C, 0x6C),
@@ -309,6 +325,7 @@ static const struct regmap_range rt9120_wr_yes_ranges[] = {
 	regmap_reg_range(0x30, 0x38),
 	regmap_reg_range(0x3A, 0x3D),
 	regmap_reg_range(0x40, 0x40),
+	regmap_reg_range(0x63, 0x63),
 	regmap_reg_range(0x65, 0x65),
 	regmap_reg_range(0x69, 0x69),
 	regmap_reg_range(0x6C, 0x6C),
@@ -401,8 +418,16 @@ static int rt9120_check_vendor_info(struct rt9120_data *data)
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

