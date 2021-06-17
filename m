Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A213AAF5B
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 11:10:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 994BB16F0;
	Thu, 17 Jun 2021 11:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 994BB16F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623921022;
	bh=Dx34QzA3LBO0ICEq3o6nCqXBgZo/MIr3ImbTLl548r0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QpqDnmuJJox8HQToNPHQNgB0W1djXjQTg7aBaszXbRlIJPM9jJqYNzweMAUjj91UQ
	 hMVZ9JDsRmZon6zxiwlwJEOl4cYNwgaNvN2GxYuSHnRSRWgK03RLFj5xX3o7IIU/Xu
	 m0H3AigvqciYsPu9BzGmoimgqH3+t5iLeJkPkIEk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EF9DF804BC;
	Thu, 17 Jun 2021 11:08:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18289F8025A; Thu, 17 Jun 2021 11:08:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B99E1F80088
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 11:08:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B99E1F80088
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 15H98Qd14031294,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36502.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 15H98Qd14031294
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Jun 2021 17:08:26 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36502.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 17 Jun 2021 17:08:26 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 17 Jun 2021 17:08:25 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: rt711: add two jack detection modes
Date: Thu, 17 Jun 2021 17:08:22 +0800
Message-ID: <20210617090822.16960-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/17/2021 08:52:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzYvMTcgpFekyCAwNzo1MDowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36502.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 06/17/2021 08:50:20
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 164439 [Jun 17 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: shumingf@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 448 448 71fb1b37213ce9a885768d4012c46ac449c77b17
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: realtek.com:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 06/17/2021 08:52:00
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, Shuming Fan <shumingf@realtek.com>, jairaj.arava@intel.com,
 derek.fang@realtek.com, bard.liao@intel.com, sathya.prakash.m.r@intel.com,
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

From: Shuming Fan <shumingf@realtek.com>

Some boards use different circuits for jack detection.
This patch adds two modes as below
1. JD2/2 ports/external resister 100k
2. JD2/1 port/JD voltage 1.8V

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt711-sdw.h |  2 ++
 sound/soc/codecs/rt711.c     | 30 ++++++++++++++++++++++++++++++
 sound/soc/codecs/rt711.h     | 29 ++++++++++++++++++++++++++++-
 3 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt711-sdw.h b/sound/soc/codecs/rt711-sdw.h
index 43b2b984b29c..6acf9858330d 100644
--- a/sound/soc/codecs/rt711-sdw.h
+++ b/sound/soc/codecs/rt711-sdw.h
@@ -267,7 +267,9 @@ static const struct reg_default rt711_reg_defaults[] = {
 	{ 0x8393, 0x00 },
 	{ 0x7319, 0x00 },
 	{ 0x8399, 0x00 },
+	{ 0x752008, 0xa807 },
 	{ 0x752009, 0x1029 },
+	{ 0x75200b, 0x7770 },
 	{ 0x752011, 0x007a },
 	{ 0x75201a, 0x8003 },
 	{ 0x752045, 0x5289 },
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index c3a82b462a93..301c7ab27878 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -389,6 +389,36 @@ static void rt711_jack_init(struct rt711_priv *rt711)
 				RT711_HP_JD_FINAL_RESULT_CTL_JD12,
 				RT711_HP_JD_FINAL_RESULT_CTL_JD12);
 			break;
+		case RT711_JD2_100K:
+			rt711_index_update_bits(rt711->regmap, RT711_VENDOR_REG,
+				RT711_JD_CTL2, RT711_JD2_2PORT_100K_DECODE | RT711_JD2_1PORT_TYPE_DECODE |
+				RT711_HP_JD_SEL_JD2 | RT711_JD1_2PORT_TYPE_100K_DECODE,
+				RT711_JD2_2PORT_100K_DECODE_HP | RT711_JD2_1PORT_JD_HP |
+				RT711_HP_JD_SEL_JD2 | RT711_JD1_2PORT_JD_RESERVED);
+			rt711_index_update_bits(rt711->regmap, RT711_VENDOR_REG,
+				RT711_CC_DET1,
+				RT711_HP_JD_FINAL_RESULT_CTL_JD12,
+				RT711_HP_JD_FINAL_RESULT_CTL_JD12);
+			break;
+		case RT711_JD2_1P8V_1PORT:
+			rt711_index_update_bits(rt711->regmap, RT711_VENDOR_REG,
+				RT711_JD_CTL1, RT711_JD2_DIGITAL_JD_MODE_SEL,
+				RT711_JD2_1_JD_MODE);
+			rt711_index_update_bits(rt711->regmap, RT711_VENDOR_REG,
+				RT711_JD_CTL2, RT711_JD2_1PORT_TYPE_DECODE |
+				RT711_HP_JD_SEL_JD2,
+				RT711_JD2_1PORT_JD_HP |
+				RT711_HP_JD_SEL_JD2);
+			rt711_index_update_bits(rt711->regmap, RT711_VENDOR_REG,
+				RT711_JD_CTL4, RT711_JD2_PAD_PULL_UP_MASK |
+				RT711_JD2_MODE_SEL_MASK,
+				RT711_JD2_PAD_PULL_UP |
+				RT711_JD2_MODE2_1P8V_1PORT);
+			rt711_index_update_bits(rt711->regmap, RT711_VENDOR_REG,
+				RT711_CC_DET1,
+				RT711_HP_JD_FINAL_RESULT_CTL_JD12,
+				RT711_HP_JD_FINAL_RESULT_CTL_JD12);
+			break;
 		default:
 			dev_warn(rt711->component->dev, "Wrong JD source\n");
 			break;
diff --git a/sound/soc/codecs/rt711.h b/sound/soc/codecs/rt711.h
index ca0f581feec7..5f2ba1341085 100644
--- a/sound/soc/codecs/rt711.h
+++ b/sound/soc/codecs/rt711.h
@@ -52,7 +52,9 @@ struct sdw_stream_data {
 
 /* Index (NID:20h) */
 #define RT711_DAC_DC_CALI_CTL1				0x00
+#define RT711_JD_CTL1				0x08
 #define RT711_JD_CTL2				0x09
+#define RT711_JD_CTL4				0x0b
 #define RT711_CC_DET1				0x11
 #define RT711_PARA_VERB_CTL				0x1a
 #define RT711_COMBO_JACK_AUTO_CTL1				0x45
@@ -171,10 +173,33 @@ struct sdw_stream_data {
 /* DAC DC offset calibration control-1 (0x00)(NID:20h) */
 #define RT711_DAC_DC_CALI_TRIGGER (0x1 << 15)
 
+/* jack detect control 1 (0x08)(NID:20h) */
+#define RT711_JD2_DIGITAL_JD_MODE_SEL (0x1 << 1)
+#define RT711_JD2_1_JD_MODE (0x0 << 1)
+#define RT711_JD2_2_JD_MODE (0x1 << 1)
+
 /* jack detect control 2 (0x09)(NID:20h) */
 #define RT711_JD2_2PORT_200K_DECODE_HP (0x1 << 13)
+#define RT711_JD2_2PORT_100K_DECODE (0x1 << 12)
+#define RT711_JD2_2PORT_100K_DECODE_HP (0x0 << 12)
 #define RT711_HP_JD_SEL_JD1 (0x0 << 1)
 #define RT711_HP_JD_SEL_JD2 (0x1 << 1)
+#define RT711_JD2_1PORT_TYPE_DECODE (0x3 << 10)
+#define RT711_JD2_1PORT_JD_LINE2 (0x0 << 10)
+#define RT711_JD2_1PORT_JD_HP (0x1 << 10)
+#define RT711_JD2_1PORT_JD_LINE1 (0x2 << 10)
+#define RT711_JD1_2PORT_TYPE_100K_DECODE (0x1 << 0)
+#define RT711_JD1_2PORT_JD_RESERVED (0x0 << 0)
+#define RT711_JD1_2PORT_JD_LINE1 (0x1 << 0)
+
+/* jack detect control 4 (0x0b)(NID:20h) */
+#define RT711_JD2_PAD_PULL_UP_MASK (0x1 << 3)
+#define RT711_JD2_PAD_NOT_PULL_UP (0x0 << 3)
+#define RT711_JD2_PAD_PULL_UP (0x1 << 3)
+#define RT711_JD2_MODE_SEL_MASK (0x3 << 0)
+#define RT711_JD2_MODE0_2PORT (0x0 << 0)
+#define RT711_JD2_MODE1_3P3V_1PORT (0x1 << 0)
+#define RT711_JD2_MODE2_1P8V_1PORT (0x2 << 0)
 
 /* CC DET1 (0x11)(NID:20h) */
 #define RT711_HP_JD_FINAL_RESULT_CTL_JD12 (0x1 << 10)
@@ -215,7 +240,9 @@ enum {
 enum rt711_jd_src {
 	RT711_JD_NULL,
 	RT711_JD1,
-	RT711_JD2
+	RT711_JD2,
+	RT711_JD2_100K,
+	RT711_JD2_1P8V_1PORT
 };
 
 int rt711_io_init(struct device *dev, struct sdw_slave *slave);
-- 
2.31.1

