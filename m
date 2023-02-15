Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAD7697A5A
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 12:00:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94FE3857;
	Wed, 15 Feb 2023 11:59:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94FE3857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676458808;
	bh=LxePWxalybK1Ew2ZuQrTO0PSe9N0nyG2y1EUfX2dkPA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tLbgFjl+3/dGUxLqxQ/b8VEwp9jieglOnKjmL7znIZHjghnm5X4ttaDryAcUbmdFQ
	 FAEODVD5/pk5/ZuI7v7vrPY5aP8dKbnvtfPF0suhivhrG6KAuOg0Xg822x66w3apCR
	 AZqa7HCoI/f4p/KWVlkzQ22FfJOKADSEt+ushnfE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94D89F804B2;
	Wed, 15 Feb 2023 11:58:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9AF0F8047C; Wed, 15 Feb 2023 11:58:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BFD4EF80083
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 11:58:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFD4EF80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=DFg+Ydf4
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31F5IwDJ010319;
	Wed, 15 Feb 2023 04:58:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=VBvQDeOV5YaSl7jvF5C3bzhYnNbHoE0OvozmqhW3pKA=;
 b=DFg+Ydf4hXRmyF4WCPn3cjY3NRkhF4d0d0vHNvNR7hS1fyKozwP8YsaPqjiki43+T8Lu
 qk8ctTerDD9F7LVoETfY8bU6FM2JXKAew5mRT7dKDD5JinbVfrBCGthoNEcHLFB9e2gn
 Gr4OfxmNYkk3TD3kuF3j2dQyeeOjSSU+8lyJchxoZrip8f+JPsSGjfURf5v0xP95XeoJ
 ZBXtn2QqCxaL/2TptvzPDwCuG/HSwlY8uoQz/EP4Sy2vjo4msPuPtGqqcdEg46PDF3rG
 gt43IT4St9vD9PEd8V//xGn/J7ul5NLJPendVtIje0qI4R/zDHsNwcT1mxzO0Q095cjw KQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3nrm8wgkmm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 04:58:20 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Wed, 15 Feb
 2023 04:58:18 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.21 via Frontend Transport; Wed, 15 Feb 2023 04:58:18 -0600
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E51A011A8;
	Wed, 15 Feb 2023 10:58:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: cs35l45: Remove separate namespace for tables
Date: Wed, 15 Feb 2023 10:58:18 +0000
Message-ID: <20230215105818.3315925-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230215105818.3315925-1-ckeepax@opensource.cirrus.com>
References: <20230215105818.3315925-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Eyh-4LVRfZWAn6TMMzV3XEZEjAYZ_9eN
X-Proofpoint-ORIG-GUID: Eyh-4LVRfZWAn6TMMzV3XEZEjAYZ_9eN
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3VUPC55CBVSVJQKCV22P7BKFB3SFODAL
X-Message-ID-Hash: 3VUPC55CBVSVJQKCV22P7BKFB3SFODAL
X-MailFrom: prvs=74104ead9d=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3VUPC55CBVSVJQKCV22P7BKFB3SFODAL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now tables isn't a separate module, definitely no need to have a
separate namespace for it.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45-i2c.c    | 1 -
 sound/soc/codecs/cs35l45-spi.c    | 1 -
 sound/soc/codecs/cs35l45-tables.c | 8 ++++----
 sound/soc/codecs/cs35l45.c        | 1 -
 4 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs35l45-i2c.c b/sound/soc/codecs/cs35l45-i2c.c
index 39d28641429e4..1117df4b2f118 100644
--- a/sound/soc/codecs/cs35l45-i2c.c
+++ b/sound/soc/codecs/cs35l45-i2c.c
@@ -71,4 +71,3 @@ MODULE_DESCRIPTION("I2C CS35L45 driver");
 MODULE_AUTHOR("James Schulman, Cirrus Logic Inc, <james.schulman@cirrus.com>");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_IMPORT_NS(SND_SOC_CS35L45);
-MODULE_IMPORT_NS(SND_SOC_CS35L45_TABLES);
diff --git a/sound/soc/codecs/cs35l45-spi.c b/sound/soc/codecs/cs35l45-spi.c
index baaf6e0f4fb9d..ffaca07fb2679 100644
--- a/sound/soc/codecs/cs35l45-spi.c
+++ b/sound/soc/codecs/cs35l45-spi.c
@@ -71,4 +71,3 @@ MODULE_DESCRIPTION("SPI CS35L45 driver");
 MODULE_AUTHOR("James Schulman, Cirrus Logic Inc, <james.schulman@cirrus.com>");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_IMPORT_NS(SND_SOC_CS35L45);
-MODULE_IMPORT_NS(SND_SOC_CS35L45_TABLES);
diff --git a/sound/soc/codecs/cs35l45-tables.c b/sound/soc/codecs/cs35l45-tables.c
index 5a2f47ca57716..4b1320a2e6e97 100644
--- a/sound/soc/codecs/cs35l45-tables.c
+++ b/sound/soc/codecs/cs35l45-tables.c
@@ -38,7 +38,7 @@ int cs35l45_apply_patch(struct cs35l45_private *cs35l45)
 	return regmap_register_patch(cs35l45->regmap, cs35l45_patch,
 				     ARRAY_SIZE(cs35l45_patch));
 }
-EXPORT_SYMBOL_NS_GPL(cs35l45_apply_patch, SND_SOC_CS35L45_TABLES);
+EXPORT_SYMBOL_NS_GPL(cs35l45_apply_patch, SND_SOC_CS35L45);
 
 static const struct reg_default cs35l45_defaults[] = {
 	{ CS35L45_BLOCK_ENABLES,		0x00003323 },
@@ -126,7 +126,7 @@ const struct regmap_config cs35l45_i2c_regmap = {
 	.readable_reg = cs35l45_readable_reg,
 	.cache_type = REGCACHE_RBTREE,
 };
-EXPORT_SYMBOL_NS_GPL(cs35l45_i2c_regmap, SND_SOC_CS35L45_TABLES);
+EXPORT_SYMBOL_NS_GPL(cs35l45_i2c_regmap, SND_SOC_CS35L45);
 
 const struct regmap_config cs35l45_spi_regmap = {
 	.reg_bits = 32,
@@ -142,7 +142,7 @@ const struct regmap_config cs35l45_spi_regmap = {
 	.readable_reg = cs35l45_readable_reg,
 	.cache_type = REGCACHE_RBTREE,
 };
-EXPORT_SYMBOL_NS_GPL(cs35l45_spi_regmap, SND_SOC_CS35L45_TABLES);
+EXPORT_SYMBOL_NS_GPL(cs35l45_spi_regmap, SND_SOC_CS35L45);
 
 static const struct {
 	u8 cfg_id;
@@ -195,4 +195,4 @@ unsigned int cs35l45_get_clk_freq_id(unsigned int freq)
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l45_get_clk_freq_id, SND_SOC_CS35L45_TABLES);
+EXPORT_SYMBOL_NS_GPL(cs35l45_get_clk_freq_id, SND_SOC_CS35L45);
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index d15b3b77c7eb0..855d9f13e6ff1 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -687,4 +687,3 @@ MODULE_DESCRIPTION("ASoC CS35L45 driver");
 MODULE_AUTHOR("James Schulman, Cirrus Logic Inc, <james.schulman@cirrus.com>");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_LICENSE("Dual BSD/GPL");
-MODULE_IMPORT_NS(SND_SOC_CS35L45_TABLES);
-- 
2.30.2

