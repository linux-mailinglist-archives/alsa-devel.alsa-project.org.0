Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E39B54851D0
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 12:31:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 563BC17EA;
	Wed,  5 Jan 2022 12:30:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 563BC17EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641382308;
	bh=F2XGUgXDtlwbaxJjCBlfvi82N0loPpbi0kAvGjXb4ig=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WzGP50Nt5O41p6c0wOputHmhseq9QsrnzQ4g4qmMjV1BaEyB5p7b7ttfTlNZZ1iY2
	 bwVvhL8TidSSkpuPQAToHdApTwgfPG8r/OwKB8zNhFJArkoPRuvp6D1KVhbwg7OYfr
	 8L0vHhiNPjJ5sVVfmqkDoDtAATTufRXsXEX6u5qU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3D6DF800BB;
	Wed,  5 Jan 2022 12:30:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26C7FF804FE; Wed,  5 Jan 2022 12:30:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61B0CF80089
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 12:30:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61B0CF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="FFgjjcN2"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2058aLPA003317;
 Wed, 5 Jan 2022 05:30:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PODMain02222019;
 bh=g6PUI0hKULEKd2EzZfdU9rQjyWt0tIH0KBnRlzSnyj8=;
 b=FFgjjcN2rvHk10sASljdbbxx4DexX6vMpnjyWLonqYy5hUs2cvn6B7zzRFDnkUZh3x/B
 Cwy2CQko1uP17JT4d7uS50pFiQHKQ5sMvcYhgs4Bdst92bFnglz22yv58P79NvTeXJtP
 uQc2ReclbEppGp5a1mfoH6wWubYjjwvkQgyofzP5tnsgBpK+z5kmJ3LmcE9AbBjQWM4O
 LEmSOsTJnO1nHyJXU0q8cQ57/qqYNRtmrTsfogIXcZX8uf3inVH7hBkj05SADttImNvm
 skL2eM+/cFTbJGGx+9tazpvKDIgcbm9Num877J6kObjDXfQemOudekAkfaEqYwkNw5zV FA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dd7y3g4bt-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 05 Jan 2022 05:30:29 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 5 Jan
 2022 11:30:27 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Wed, 5 Jan 2022 11:30:27 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 19FB211D9;
 Wed,  5 Jan 2022 11:30:27 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 4/8] ASoC: cs35l41: Correct handling of some registers in the
 cache
Date: Wed, 5 Jan 2022 11:30:22 +0000
Message-ID: <20220105113026.18955-5-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
References: <20220105113026.18955-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: jAkrPbUqxyLPI2PJBEYDb3eLFiAYCaWl
X-Proofpoint-ORIG-GUID: jAkrPbUqxyLPI2PJBEYDb3eLFiAYCaWl
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 david.rhodes@cirrus.com, lgirdwood@gmail.com, tiwai@suse.com
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

It makes no sense to cache the test/user key registers, since they
require values written at specific times, mark them volatile. It is
probably best if they can't be accessed from user-space either, so
mark them precious as well.

The interrupt force, edge, polarity and debounce are all settings
applied to the IRQ rather than status bits and as such should not be
volatile.

The OTP trim values will require re-application in the event of a
cache sync and as such should not be volatile. The OTPID however
should be volatile.

The DSP scratch registers are used to read back an error/debug code
from the DSP on shutdown, as such these should be marked volatile.

Finally, add some missing defaults, add TST_FS_MON0, and allow the
DSP core control register to be cached.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41-lib.c | 81 ++++++++++++------------------------------
 1 file changed, 22 insertions(+), 59 deletions(-)

diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index d026c5e3a378b..639dcd25b17e9 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -20,6 +20,11 @@ static const struct reg_default cs35l41_reg[] = {
 	{ CS35L41_PWR_CTRL2,			0x00000000 },
 	{ CS35L41_PWR_CTRL3,			0x01000010 },
 	{ CS35L41_GPIO_PAD_CONTROL,		0x00000000 },
+	{ CS35L41_GLOBAL_CLK_CTRL,		0x00000003 },
+	{ CS35L41_TST_FS_MON0,			0x00020016 },
+	{ CS35L41_BSTCVRT_COEFF,		0x00002424 },
+	{ CS35L41_BSTCVRT_SLOPE_LBST,		0x00007500 },
+	{ CS35L41_BSTCVRT_PEAK_CUR,		0x0000004A },
 	{ CS35L41_SP_ENABLES,			0x00000000 },
 	{ CS35L41_SP_RATE_CTRL,			0x00000028 },
 	{ CS35L41_SP_FORMAT,			0x18180200 },
@@ -48,11 +53,16 @@ static const struct reg_default cs35l41_reg[] = {
 	{ CS35L41_WKFET_CFG,			0x00000111 },
 	{ CS35L41_NG_CFG,			0x00000033 },
 	{ CS35L41_AMP_GAIN_CTRL,		0x00000000 },
+	{ CS35L41_IRQ1_MASK1,			0xFFFFFFFF },
+	{ CS35L41_IRQ1_MASK2,			0xFFFFFFFF },
+	{ CS35L41_IRQ1_MASK3,			0xFFFF87FF },
+	{ CS35L41_IRQ1_MASK4,			0xFEFFFFFF },
 	{ CS35L41_GPIO1_CTRL1,			0xE1000001 },
 	{ CS35L41_GPIO2_CTRL1,			0xE1000001 },
 	{ CS35L41_MIXER_NGATE_CFG,		0x00000000 },
 	{ CS35L41_MIXER_NGATE_CH1_CFG,		0x00000303 },
 	{ CS35L41_MIXER_NGATE_CH2_CFG,		0x00000303 },
+	{ CS35L41_DSP1_CCM_CORE_CTRL,		0x00000101 },
 };
 
 static bool cs35l41_readable_reg(struct device *dev, unsigned int reg)
@@ -84,6 +94,7 @@ static bool cs35l41_readable_reg(struct device *dev, unsigned int reg)
 	case CS35L41_DSP_CLK_CTRL:
 	case CS35L41_GLOBAL_CLK_CTRL:
 	case CS35L41_DATA_FS_SEL:
+	case CS35L41_TST_FS_MON0:
 	case CS35L41_MDSYNC_EN:
 	case CS35L41_MDSYNC_TX_ID:
 	case CS35L41_MDSYNC_PWR_CTRL:
@@ -342,7 +353,10 @@ static bool cs35l41_readable_reg(struct device *dev, unsigned int reg)
 static bool cs35l41_precious_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
+	case CS35L41_TEST_KEY_CTL:
+	case CS35L41_USER_KEY_CTL:
 	case CS35L41_OTP_MEM0 ... CS35L41_OTP_MEM31:
+	case CS35L41_TST_FS_MON0:
 	case CS35L41_DSP1_XMEM_PACK_0 ... CS35L41_DSP1_XMEM_PACK_3068:
 	case CS35L41_DSP1_YMEM_PACK_0 ... CS35L41_DSP1_YMEM_PACK_1532:
 	case CS35L41_DSP1_PMEM_0 ... CS35L41_DSP1_PMEM_5114:
@@ -359,6 +373,9 @@ static bool cs35l41_volatile_reg(struct device *dev, unsigned int reg)
 	case CS35L41_SFT_RESET:
 	case CS35L41_FABID:
 	case CS35L41_REVID:
+	case CS35L41_OTPID:
+	case CS35L41_TEST_KEY_CTL:
+	case CS35L41_USER_KEY_CTL:
 	case CS35L41_DTEMP_EN:
 	case CS35L41_IRQ1_STATUS:
 	case CS35L41_IRQ1_STATUS1:
@@ -369,17 +386,6 @@ static bool cs35l41_volatile_reg(struct device *dev, unsigned int reg)
 	case CS35L41_IRQ1_RAW_STATUS2:
 	case CS35L41_IRQ1_RAW_STATUS3:
 	case CS35L41_IRQ1_RAW_STATUS4:
-	case CS35L41_IRQ1_FRC1:
-	case CS35L41_IRQ1_FRC2:
-	case CS35L41_IRQ1_FRC3:
-	case CS35L41_IRQ1_FRC4:
-	case CS35L41_IRQ1_EDGE1:
-	case CS35L41_IRQ1_EDGE4:
-	case CS35L41_IRQ1_POL1:
-	case CS35L41_IRQ1_POL2:
-	case CS35L41_IRQ1_POL3:
-	case CS35L41_IRQ1_POL4:
-	case CS35L41_IRQ1_DB3:
 	case CS35L41_IRQ2_STATUS:
 	case CS35L41_IRQ2_STATUS1:
 	case CS35L41_IRQ2_STATUS2:
@@ -389,54 +395,7 @@ static bool cs35l41_volatile_reg(struct device *dev, unsigned int reg)
 	case CS35L41_IRQ2_RAW_STATUS2:
 	case CS35L41_IRQ2_RAW_STATUS3:
 	case CS35L41_IRQ2_RAW_STATUS4:
-	case CS35L41_IRQ2_FRC1:
-	case CS35L41_IRQ2_FRC2:
-	case CS35L41_IRQ2_FRC3:
-	case CS35L41_IRQ2_FRC4:
-	case CS35L41_IRQ2_EDGE1:
-	case CS35L41_IRQ2_EDGE4:
-	case CS35L41_IRQ2_POL1:
-	case CS35L41_IRQ2_POL2:
-	case CS35L41_IRQ2_POL3:
-	case CS35L41_IRQ2_POL4:
-	case CS35L41_IRQ2_DB3:
 	case CS35L41_GPIO_STATUS1:
-	case CS35L41_OTP_TRIM_1:
-	case CS35L41_OTP_TRIM_2:
-	case CS35L41_OTP_TRIM_3:
-	case CS35L41_OTP_TRIM_4:
-	case CS35L41_OTP_TRIM_5:
-	case CS35L41_OTP_TRIM_6:
-	case CS35L41_OTP_TRIM_7:
-	case CS35L41_OTP_TRIM_8:
-	case CS35L41_OTP_TRIM_9:
-	case CS35L41_OTP_TRIM_10:
-	case CS35L41_OTP_TRIM_11:
-	case CS35L41_OTP_TRIM_12:
-	case CS35L41_OTP_TRIM_13:
-	case CS35L41_OTP_TRIM_14:
-	case CS35L41_OTP_TRIM_15:
-	case CS35L41_OTP_TRIM_16:
-	case CS35L41_OTP_TRIM_17:
-	case CS35L41_OTP_TRIM_18:
-	case CS35L41_OTP_TRIM_19:
-	case CS35L41_OTP_TRIM_20:
-	case CS35L41_OTP_TRIM_21:
-	case CS35L41_OTP_TRIM_22:
-	case CS35L41_OTP_TRIM_23:
-	case CS35L41_OTP_TRIM_24:
-	case CS35L41_OTP_TRIM_25:
-	case CS35L41_OTP_TRIM_26:
-	case CS35L41_OTP_TRIM_27:
-	case CS35L41_OTP_TRIM_28:
-	case CS35L41_OTP_TRIM_29:
-	case CS35L41_OTP_TRIM_30:
-	case CS35L41_OTP_TRIM_31:
-	case CS35L41_OTP_TRIM_32:
-	case CS35L41_OTP_TRIM_33:
-	case CS35L41_OTP_TRIM_34:
-	case CS35L41_OTP_TRIM_35:
-	case CS35L41_OTP_TRIM_36:
 	case CS35L41_DSP_MBOX_1 ... CS35L41_DSP_VIRT2_MBOX_8:
 	case CS35L41_DSP1_XMEM_PACK_0 ... CS35L41_DSP1_XMEM_PACK_3068:
 	case CS35L41_DSP1_XMEM_UNPACK32_0 ... CS35L41_DSP1_XMEM_UNPACK32_2046:
@@ -445,7 +404,11 @@ static bool cs35l41_volatile_reg(struct device *dev, unsigned int reg)
 	case CS35L41_DSP1_YMEM_UNPACK32_0 ... CS35L41_DSP1_YMEM_UNPACK32_1022:
 	case CS35L41_DSP1_YMEM_UNPACK24_0 ... CS35L41_DSP1_YMEM_UNPACK24_2045:
 	case CS35L41_DSP1_PMEM_0 ... CS35L41_DSP1_PMEM_5114:
-	case CS35L41_DSP1_CCM_CORE_CTRL ... CS35L41_DSP1_WDT_STATUS:
+	case CS35L41_DSP1_SCRATCH1:
+	case CS35L41_DSP1_SCRATCH2:
+	case CS35L41_DSP1_SCRATCH3:
+	case CS35L41_DSP1_SCRATCH4:
+	case CS35L41_DSP1_CCM_CLK_OVERRIDE ... CS35L41_DSP1_WDT_STATUS:
 	case CS35L41_OTP_MEM0 ... CS35L41_OTP_MEM31:
 		return true;
 	default:
-- 
2.11.0

