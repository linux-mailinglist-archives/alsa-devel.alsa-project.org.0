Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E5C86CDD1
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Feb 2024 16:57:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB1439F6;
	Thu, 29 Feb 2024 16:57:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB1439F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709222261;
	bh=iOmQTVDs9UpkKV8z9c2K0lKOA26i1Ri15LvtFNJTn8A=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=o9cbRieBtKOxPxjgxT8XuHVTuhvuiVTUSlx124EZ4ZSw8ImKNxifAr8ccTIP2raKV
	 HA6a1O1wd+SpZkmsXv6ZT5gEFQ2XpFsBWC3F52Y3LzGe/8q2XC77izcgH98xJqMTbn
	 tYAa0VSAiM7Avs9t8o2vdu044qfMNfgvpFvTPm7I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A748F8057F; Thu, 29 Feb 2024 16:57:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2BB8F805A0;
	Thu, 29 Feb 2024 16:57:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0282F801C0; Thu, 29 Feb 2024 16:56:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 41193F80088
	for <alsa-devel@alsa-project.org>; Thu, 29 Feb 2024 16:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41193F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=eb8czAnm
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41TFednF032401;
	Thu, 29 Feb 2024 09:56:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=i
	ZMbhk8sFajOWu5eQuTJqb2j6jAdfI9Sm0TUstq/FPc=; b=eb8czAnmLUIYEq3Mp
	itKwz2CGsCUniyiiZjmJr43zii6sIXHyx0pUN0Wd3WooIZySTNb3KtVSfixxW8GU
	8luTD+olhfECHYXyeot2ZoaQxsacq+2/jgKBQ09TnFrhRGdKhwU5ajsRPf2I2s4w
	oZc4wsFKLGLSJk4A8n8tmKpGBC2K4xTrC5cxYlYi2X+Lgeb3doExlS82RxOVAbI3
	193Pi8NW1A8PqWgLvpH6bffIMGtOOZMaDOVjtbeZgpEfcjSk5Es8tQ1U+ECySmW3
	8N+Ip0sPds4ff3Do0iWZk4vBOIn1/7mrer45GnvmYT5UXKKEKhOPd/x6v5ZEbaZT
	LF+/g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wfer2xgnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 09:56:31 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 29 Feb
 2024 15:56:29 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Thu, 29 Feb 2024 15:56:29 +0000
Received: from fedora.ad.cirrus.com (unknown [198.90.251.53])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id A6A8C820241;
	Thu, 29 Feb 2024 15:56:29 +0000 (UTC)
From: Maciej Strozek <mstrozek@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        Maciej Strozek
	<mstrozek@opensource.cirrus.com>
Subject: [PATCH] mfd: cs42l43: Fix wrong register defaults
Date: Thu, 29 Feb 2024 15:56:14 +0000
Message-ID: <20240229155616.118457-1-mstrozek@opensource.cirrus.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: CC-fgD8xa4r1UDu6RkNYlS7WZ_JrIDta
X-Proofpoint-ORIG-GUID: CC-fgD8xa4r1UDu6RkNYlS7WZ_JrIDta
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 5YCBSPG2GKJGHDYPX75Z3FYZDP5T3PAL
X-Message-ID-Hash: 5YCBSPG2GKJGHDYPX75Z3FYZDP5T3PAL
X-MailFrom: prvs=0789296700=mstrozek@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5YCBSPG2GKJGHDYPX75Z3FYZDP5T3PAL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A few regs have unnecessary values in defaults, change them to match the
datasheet

Fixes: ace6d1448138 ("mfd: cs42l43: Add support for cs42l43 core driver")

Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
---
 drivers/mfd/cs42l43.c | 68 +++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 7b6d07cbe6fc..73c88ee6a866 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -131,38 +131,38 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_ASP_TX_CH4_CTRL,			0x00170091 },
 	{ CS42L43_ASP_TX_CH5_CTRL,			0x001700C1 },
 	{ CS42L43_ASP_TX_CH6_CTRL,			0x001700F1 },
-	{ CS42L43_ASPTX1_INPUT,				0x00800000 },
-	{ CS42L43_ASPTX2_INPUT,				0x00800000 },
-	{ CS42L43_ASPTX3_INPUT,				0x00800000 },
-	{ CS42L43_ASPTX4_INPUT,				0x00800000 },
-	{ CS42L43_ASPTX5_INPUT,				0x00800000 },
-	{ CS42L43_ASPTX6_INPUT,				0x00800000 },
-	{ CS42L43_SWIRE_DP1_CH1_INPUT,			0x00800000 },
-	{ CS42L43_SWIRE_DP1_CH2_INPUT,			0x00800000 },
-	{ CS42L43_SWIRE_DP1_CH3_INPUT,			0x00800000 },
-	{ CS42L43_SWIRE_DP1_CH4_INPUT,			0x00800000 },
-	{ CS42L43_SWIRE_DP2_CH1_INPUT,			0x00800000 },
-	{ CS42L43_SWIRE_DP2_CH2_INPUT,			0x00800000 },
-	{ CS42L43_SWIRE_DP3_CH1_INPUT,			0x00800000 },
-	{ CS42L43_SWIRE_DP3_CH2_INPUT,			0x00800000 },
-	{ CS42L43_SWIRE_DP4_CH1_INPUT,			0x00800000 },
-	{ CS42L43_SWIRE_DP4_CH2_INPUT,			0x00800000 },
-	{ CS42L43_ASRC_INT1_INPUT1,			0x00800000 },
-	{ CS42L43_ASRC_INT2_INPUT1,			0x00800000 },
-	{ CS42L43_ASRC_INT3_INPUT1,			0x00800000 },
-	{ CS42L43_ASRC_INT4_INPUT1,			0x00800000 },
-	{ CS42L43_ASRC_DEC1_INPUT1,			0x00800000 },
-	{ CS42L43_ASRC_DEC2_INPUT1,			0x00800000 },
-	{ CS42L43_ASRC_DEC3_INPUT1,			0x00800000 },
-	{ CS42L43_ASRC_DEC4_INPUT1,			0x00800000 },
-	{ CS42L43_ISRC1INT1_INPUT1,			0x00800000 },
-	{ CS42L43_ISRC1INT2_INPUT1,			0x00800000 },
-	{ CS42L43_ISRC1DEC1_INPUT1,			0x00800000 },
-	{ CS42L43_ISRC1DEC2_INPUT1,			0x00800000 },
-	{ CS42L43_ISRC2INT1_INPUT1,			0x00800000 },
-	{ CS42L43_ISRC2INT2_INPUT1,			0x00800000 },
-	{ CS42L43_ISRC2DEC1_INPUT1,			0x00800000 },
-	{ CS42L43_ISRC2DEC2_INPUT1,			0x00800000 },
+	{ CS42L43_ASPTX1_INPUT,				0x00000000 },
+	{ CS42L43_ASPTX2_INPUT,				0x00000000 },
+	{ CS42L43_ASPTX3_INPUT,				0x00000000 },
+	{ CS42L43_ASPTX4_INPUT,				0x00000000 },
+	{ CS42L43_ASPTX5_INPUT,				0x00000000 },
+	{ CS42L43_ASPTX6_INPUT,				0x00000000 },
+	{ CS42L43_SWIRE_DP1_CH1_INPUT,			0x00000000 },
+	{ CS42L43_SWIRE_DP1_CH2_INPUT,			0x00000000 },
+	{ CS42L43_SWIRE_DP1_CH3_INPUT,			0x00000000 },
+	{ CS42L43_SWIRE_DP1_CH4_INPUT,			0x00000000 },
+	{ CS42L43_SWIRE_DP2_CH1_INPUT,			0x00000000 },
+	{ CS42L43_SWIRE_DP2_CH2_INPUT,			0x00000000 },
+	{ CS42L43_SWIRE_DP3_CH1_INPUT,			0x00000000 },
+	{ CS42L43_SWIRE_DP3_CH2_INPUT,			0x00000000 },
+	{ CS42L43_SWIRE_DP4_CH1_INPUT,			0x00000000 },
+	{ CS42L43_SWIRE_DP4_CH2_INPUT,			0x00000000 },
+	{ CS42L43_ASRC_INT1_INPUT1,			0x00000000 },
+	{ CS42L43_ASRC_INT2_INPUT1,			0x00000000 },
+	{ CS42L43_ASRC_INT3_INPUT1,			0x00000000 },
+	{ CS42L43_ASRC_INT4_INPUT1,			0x00000000 },
+	{ CS42L43_ASRC_DEC1_INPUT1,			0x00000000 },
+	{ CS42L43_ASRC_DEC2_INPUT1,			0x00000000 },
+	{ CS42L43_ASRC_DEC3_INPUT1,			0x00000000 },
+	{ CS42L43_ASRC_DEC4_INPUT1,			0x00000000 },
+	{ CS42L43_ISRC1INT1_INPUT1,			0x00000000 },
+	{ CS42L43_ISRC1INT2_INPUT1,			0x00000000 },
+	{ CS42L43_ISRC1DEC1_INPUT1,			0x00000000 },
+	{ CS42L43_ISRC1DEC2_INPUT1,			0x00000000 },
+	{ CS42L43_ISRC2INT1_INPUT1,			0x00000000 },
+	{ CS42L43_ISRC2INT2_INPUT1,			0x00000000 },
+	{ CS42L43_ISRC2DEC1_INPUT1,			0x00000000 },
+	{ CS42L43_ISRC2DEC2_INPUT1,			0x00000000 },
 	{ CS42L43_EQ1MIX_INPUT1,			0x00800000 },
 	{ CS42L43_EQ1MIX_INPUT2,			0x00800000 },
 	{ CS42L43_EQ1MIX_INPUT3,			0x00800000 },
@@ -171,8 +171,8 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_EQ2MIX_INPUT2,			0x00800000 },
 	{ CS42L43_EQ2MIX_INPUT3,			0x00800000 },
 	{ CS42L43_EQ2MIX_INPUT4,			0x00800000 },
-	{ CS42L43_SPDIF1_INPUT1,			0x00800000 },
-	{ CS42L43_SPDIF2_INPUT1,			0x00800000 },
+	{ CS42L43_SPDIF1_INPUT1,			0x00000000 },
+	{ CS42L43_SPDIF2_INPUT1,			0x00000000 },
 	{ CS42L43_AMP1MIX_INPUT1,			0x00800000 },
 	{ CS42L43_AMP1MIX_INPUT2,			0x00800000 },
 	{ CS42L43_AMP1MIX_INPUT3,			0x00800000 },
--
2.30.2

