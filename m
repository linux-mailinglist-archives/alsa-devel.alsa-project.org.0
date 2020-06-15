Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 321E01F8C73
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 05:26:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 583111670;
	Mon, 15 Jun 2020 05:26:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 583111670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592191610;
	bh=WQqzeeHvDTmX68s0/YOY122eBSvEpUIZbtqQ+yz5rMY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fkg5CWF09RUQDeGsB1zCgBX2x22pSog+gHovBIVb4HHzZpRlj14H7dYcwlTuHFd/N
	 8NfWv3yyelWP0EmC2ge5ThOmXpDn7D0aYcSjyUTcUF7hhs5VxHJSa3UaNOY4G5N18P
	 61dTG85WOw/UcNSyK+NN9dL+o5Z/Z6TFkmSW6dZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63430F8013E;
	Mon, 15 Jun 2020 05:25:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2AB5F8013E; Mon, 15 Jun 2020 05:25:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1438F800EF
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 05:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1438F800EF
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 05F3OfTM2008046,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 05F3OfTM2008046
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 15 Jun 2020 11:24:41 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 15 Jun 2020 11:24:41 +0800
Received: from localhost.localdomain (172.22.102.1) by RTEXMB01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Mon, 15 Jun
 2020 11:24:41 +0800
From: <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 1/2] ASoC: rt1015: Update rt1015 default register value
 according to spec modification.
Date: Mon, 15 Jun 2020 11:24:32 +0800
Message-ID: <20200615032433.31061-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMB05.realtek.com.tw (172.21.6.98) To
 RTEXMB01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, lars@metafoo.de, kent_chen@realtek.com,
 kenny_chen@realtek.com, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

Update rt1015 default register value according to spec modification.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 sound/soc/codecs/rt1015.c | 124 +++++++++++++++++++++++---------------
 sound/soc/codecs/rt1015.h |  15 ++++-
 2 files changed, 89 insertions(+), 50 deletions(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 67e2e944d21b..2cccb310fa96 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -34,30 +34,32 @@ static const struct reg_default rt1015_reg[] = {
 	{ 0x0000, 0x0000 },
 	{ 0x0004, 0xa000 },
 	{ 0x0006, 0x0003 },
-	{ 0x000a, 0x0802 },
-	{ 0x000c, 0x0020 },
+	{ 0x000a, 0x081e },
+	{ 0x000c, 0x0006 },
 	{ 0x000e, 0x0000 },
 	{ 0x0010, 0x0000 },
 	{ 0x0012, 0x0000 },
+	{ 0x0014, 0x0000 },
+	{ 0x0016, 0x0000 },
+	{ 0x0018, 0x0000 },
 	{ 0x0020, 0x8000 },
-	{ 0x0022, 0x471b },
-	{ 0x006a, 0x0000 },
-	{ 0x006c, 0x4020 },
+	{ 0x0022, 0x8043 },
 	{ 0x0076, 0x0000 },
 	{ 0x0078, 0x0000 },
-	{ 0x007a, 0x0000 },
+	{ 0x007a, 0x0002 },
 	{ 0x007c, 0x10ec },
 	{ 0x007d, 0x1015 },
 	{ 0x00f0, 0x5000 },
-	{ 0x00f2, 0x0774 },
-	{ 0x00f3, 0x8400 },
+	{ 0x00f2, 0x004c },
+	{ 0x00f3, 0xecfe },
 	{ 0x00f4, 0x0000 },
+	{ 0x00f6, 0x0400 },
 	{ 0x0100, 0x0028 },
 	{ 0x0102, 0xff02 },
-	{ 0x0104, 0x8232 },
+	{ 0x0104, 0xa213 },
 	{ 0x0106, 0x200c },
-	{ 0x010c, 0x002f },
-	{ 0x010e, 0xc000 },
+	{ 0x010c, 0x0000 },
+	{ 0x010e, 0x0058 },
 	{ 0x0111, 0x0200 },
 	{ 0x0112, 0x0400 },
 	{ 0x0114, 0x0022 },
@@ -65,38 +67,46 @@ static const struct reg_default rt1015_reg[] = {
 	{ 0x0118, 0x0000 },
 	{ 0x011a, 0x0123 },
 	{ 0x011c, 0x4567 },
-	{ 0x0300, 0xdddd },
-	{ 0x0302, 0x0000 },
-	{ 0x0311, 0x9330 },
-	{ 0x0313, 0x0000 },
-	{ 0x0314, 0x0000 },
+	{ 0x0300, 0x203d },
+	{ 0x0302, 0x001e },
+	{ 0x0311, 0x0000 },
+	{ 0x0313, 0x6014 },
+	{ 0x0314, 0x00a2 },
 	{ 0x031a, 0x00a0 },
 	{ 0x031c, 0x001f },
 	{ 0x031d, 0xffff },
 	{ 0x031e, 0x0000 },
 	{ 0x031f, 0x0000 },
+	{ 0x0320, 0x0000 },
 	{ 0x0321, 0x0000 },
-	{ 0x0322, 0x0000 },
-	{ 0x0328, 0x0000 },
-	{ 0x0329, 0x0000 },
-	{ 0x032a, 0x0000 },
-	{ 0x032b, 0x0000 },
-	{ 0x032c, 0x0000 },
-	{ 0x032d, 0x0000 },
-	{ 0x032e, 0x030e },
-	{ 0x0330, 0x0080 },
+	{ 0x0322, 0xd7df },
+	{ 0x0328, 0x10b2 },
+	{ 0x0329, 0x0175 },
+	{ 0x032a, 0x36ad },
+	{ 0x032b, 0x7e55 },
+	{ 0x032c, 0x0520 },
+	{ 0x032d, 0xaa00 },
+	{ 0x032e, 0x570e },
+	{ 0x0330, 0xe180 },
 	{ 0x0332, 0x0034 },
-	{ 0x0334, 0x0000 },
-	{ 0x0336, 0x0000 },
+	{ 0x0334, 0x0001 },
+	{ 0x0336, 0x0010 },
+	{ 0x0338, 0x0000 },
+	{ 0x04fa, 0x0030 },
+	{ 0x04fc, 0x35c8 },
+	{ 0x04fe, 0x0800 },
+	{ 0x0500, 0x0400 },
+	{ 0x0502, 0x1000 },
+	{ 0x0504, 0x0000 },
 	{ 0x0506, 0x04ff },
-	{ 0x0508, 0x0030 },
-	{ 0x050a, 0x0018 },
-	{ 0x0519, 0x307f },
-	{ 0x051a, 0xffff },
-	{ 0x051b, 0x4000 },
+	{ 0x0508, 0x0010 },
+	{ 0x050a, 0x001a },
+	{ 0x0519, 0x1c68 },
+	{ 0x051a, 0x0ccc },
+	{ 0x051b, 0x0666 },
 	{ 0x051d, 0x0000 },
 	{ 0x051f, 0x0000 },
-	{ 0x0536, 0x1000 },
+	{ 0x0536, 0x061c },
 	{ 0x0538, 0x0000 },
 	{ 0x053a, 0x0000 },
 	{ 0x053c, 0x0000 },
@@ -110,19 +120,18 @@ static const struct reg_default rt1015_reg[] = {
 	{ 0x0544, 0x0000 },
 	{ 0x0568, 0x0000 },
 	{ 0x056a, 0x0000 },
-	{ 0x1000, 0x0000 },
-	{ 0x1002, 0x6505 },
+	{ 0x1000, 0x0040 },
+	{ 0x1002, 0x5405 },
 	{ 0x1006, 0x5515 },
-	{ 0x1007, 0x003f },
-	{ 0x1009, 0x770f },
-	{ 0x100a, 0x01ff },
-	{ 0x100c, 0x0000 },
+	{ 0x1007, 0x05f7 },
+	{ 0x1009, 0x0b0a },
+	{ 0x100a, 0x00ef },
 	{ 0x100d, 0x0003 },
 	{ 0x1010, 0xa433 },
 	{ 0x1020, 0x0000 },
-	{ 0x1200, 0x3d02 },
-	{ 0x1202, 0x0813 },
-	{ 0x1204, 0x0211 },
+	{ 0x1200, 0x5a01 },
+	{ 0x1202, 0x6524 },
+	{ 0x1204, 0x1f00 },
 	{ 0x1206, 0x0000 },
 	{ 0x1208, 0x0000 },
 	{ 0x120a, 0x0000 },
@@ -130,16 +139,16 @@ static const struct reg_default rt1015_reg[] = {
 	{ 0x120e, 0x0000 },
 	{ 0x1210, 0x0000 },
 	{ 0x1212, 0x0000 },
-	{ 0x1300, 0x0701 },
-	{ 0x1302, 0x12f9 },
-	{ 0x1304, 0x3405 },
+	{ 0x1300, 0x10a1 },
+	{ 0x1302, 0x12ff },
+	{ 0x1304, 0x0400 },
 	{ 0x1305, 0x0844 },
-	{ 0x1306, 0x1611 },
+	{ 0x1306, 0x4611 },
 	{ 0x1308, 0x555e },
 	{ 0x130a, 0x0000 },
-	{ 0x130c, 0x2400},
-	{ 0x130e, 0x7700 },
-	{ 0x130f, 0x0000 },
+	{ 0x130c, 0x2000 },
+	{ 0x130e, 0x0100 },
+	{ 0x130f, 0x0001 },
 	{ 0x1310, 0x0000 },
 	{ 0x1312, 0x0000 },
 	{ 0x1314, 0x0000 },
@@ -209,6 +218,9 @@ static bool rt1015_volatile_register(struct device *dev, unsigned int reg)
 	case RT1015_DC_CALIB_CLSD7:
 	case RT1015_DC_CALIB_CLSD8:
 	case RT1015_S_BST_TIMING_INTER1:
+	case RT1015_OSCK_STA:
+	case RT1015_MONO_DYNA_CTRL1:
+	case RT1015_MONO_DYNA_CTRL5:
 		return true;
 
 	default:
@@ -224,6 +236,12 @@ static bool rt1015_readable_register(struct device *dev, unsigned int reg)
 	case RT1015_CLK3:
 	case RT1015_PLL1:
 	case RT1015_PLL2:
+	case RT1015_DUM_RW1:
+	case RT1015_DUM_RW2:
+	case RT1015_DUM_RW3:
+	case RT1015_DUM_RW4:
+	case RT1015_DUM_RW5:
+	case RT1015_DUM_RW6:
 	case RT1015_CLK_DET:
 	case RT1015_SIL_DET:
 	case RT1015_CUSTOMER_ID:
@@ -235,6 +253,7 @@ static bool rt1015_readable_register(struct device *dev, unsigned int reg)
 	case RT1015_PAD_DRV2:
 	case RT1015_GAT_BOOST:
 	case RT1015_PRO_ALT:
+	case RT1015_OSCK_STA:
 	case RT1015_MAN_I2C:
 	case RT1015_DAC1:
 	case RT1015_DAC2:
@@ -272,6 +291,13 @@ static bool rt1015_readable_register(struct device *dev, unsigned int reg)
 	case RT1015_SMART_BST_CTRL2:
 	case RT1015_ANA_CTRL1:
 	case RT1015_ANA_CTRL2:
+	case RT1015_PWR_STATE_CTRL:
+	case RT1015_MONO_DYNA_CTRL:
+	case RT1015_MONO_DYNA_CTRL1:
+	case RT1015_MONO_DYNA_CTRL2:
+	case RT1015_MONO_DYNA_CTRL3:
+	case RT1015_MONO_DYNA_CTRL4:
+	case RT1015_MONO_DYNA_CTRL5:
 	case RT1015_SPK_VOL:
 	case RT1015_SHORT_DETTOP1:
 	case RT1015_SHORT_DETTOP2:
diff --git a/sound/soc/codecs/rt1015.h b/sound/soc/codecs/rt1015.h
index 6fbe802082c4..8169962935a5 100644
--- a/sound/soc/codecs/rt1015.h
+++ b/sound/soc/codecs/rt1015.h
@@ -21,6 +21,12 @@
 #define RT1015_CLK3				0x0006
 #define RT1015_PLL1				0x000a
 #define RT1015_PLL2				0x000c
+#define RT1015_DUM_RW1				0x000e
+#define RT1015_DUM_RW2				0x0010
+#define RT1015_DUM_RW3				0x0012
+#define RT1015_DUM_RW4				0x0014
+#define RT1015_DUM_RW5				0x0016
+#define RT1015_DUM_RW6				0x0018
 #define RT1015_CLK_DET				0x0020
 #define RT1015_SIL_DET				0x0022
 #define RT1015_CUSTOMER_ID			0x0076
@@ -32,6 +38,7 @@
 #define RT1015_PAD_DRV2				0x00f2
 #define RT1015_GAT_BOOST			0x00f3
 #define RT1015_PRO_ALT				0x00f4
+#define RT1015_OSCK_STA				0x00f6
 #define RT1015_MAN_I2C				0x0100
 #define RT1015_DAC1				0x0102
 #define RT1015_DAC2				0x0104
@@ -70,7 +77,13 @@
 #define RT1015_ANA_CTRL1			0x0334
 #define RT1015_ANA_CTRL2			0x0336
 #define RT1015_PWR_STATE_CTRL			0x0338
-#define RT1015_SPK_VOL				0x0506
+#define RT1015_MONO_DYNA_CTRL			0x04fa
+#define RT1015_MONO_DYNA_CTRL1			0x04fc
+#define RT1015_MONO_DYNA_CTRL2			0x04fe
+#define RT1015_MONO_DYNA_CTRL3			0x0500
+#define RT1015_MONO_DYNA_CTRL4			0x0502
+#define RT1015_MONO_DYNA_CTRL5			0x0504
+#define RT1015_SPK_VOL					0x0506
 #define RT1015_SHORT_DETTOP1			0x0508
 #define RT1015_SHORT_DETTOP2			0x050a
 #define RT1015_SPK_DC_DETECT1			0x0519
-- 
2.25.1

