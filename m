Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CF4654C59
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Dec 2022 07:00:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 974BF6697;
	Fri, 23 Dec 2022 06:59:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 974BF6697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671775219;
	bh=4eOfrrODIfs/VLFKHcrtlzDupYr9ug3BSA1bLlCo//Y=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=oqeDsiw5jHpUHao9mgHFHcv1qLGIXOQoxkHmyOH0fAk4rUEc7Ht+iR2lz/pSnxOIh
	 +fFmLxwDBvaN4UKShCIMF1gbhUUC2vTcJKs2hWYgzgQXc5QgPWKfDPTOSP6WGI7lw7
	 RxCLZ4rxmQlUHGcGAmG1xfugJrSFPTnwNimwERhg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33BADF803DC;
	Fri, 23 Dec 2022 06:59:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8243CF8047B; Fri, 23 Dec 2022 06:59:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 by alsa1.perex.cz (Postfix) with ESMTP id BD3CAF8024E
 for <alsa-devel@alsa-project.org>; Fri, 23 Dec 2022 06:59:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD3CAF8024E
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 2BN5w0ryD014825,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 2BN5w0ryD014825
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Fri, 23 Dec 2022 13:58:00 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 23 Dec 2022 13:58:52 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 23 Dec 2022 13:58:52 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt711-sdca: add jack detection mode for JD2 100K
Date: Fri, 23 Dec 2022 13:58:46 +0800
Message-ID: <20221223055846.3285-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 12/23/2022 05:27:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzEyLzIzIKRXpMggMDE6NTQ6MDA=?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, Shuming Fan <shumingf@realtek.com>,
 flove@realtek.com, pierre-louis.bossart@intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

This patch adds another jack detection mode for JD2 with an external resistor of 100k.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt711-sdca.c | 15 +++++++++++++++
 sound/soc/codecs/rt711-sdca.h |  8 +++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index b78dd5994edb..7cdf184d380b 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -463,6 +463,21 @@ static void rt711_sdca_jack_init(struct rt711_sdca_priv *rt711)
 				RT711_HP_JD_FINAL_RESULT_CTL_JD12,
 				RT711_HP_JD_FINAL_RESULT_CTL_JD12);
 			break;
+		case RT711_JD2_100K:
+			rt711_sdca_index_write(rt711, RT711_VENDOR_REG,
+				RT711_COMBO_JACK_AUTO_CTL3, 0xa47e);
+			rt711_sdca_index_update_bits(rt711, RT711_VENDOR_REG,
+				RT711_JD_CTL1, RT711_JD2_DIGITAL_MODE_SEL,
+				RT711_JD2_DIGITAL_MODE_SEL);
+			rt711_sdca_index_update_bits(rt711, RT711_VENDOR_REG,
+				RT711_JD_CTL2, RT711_JD2_2PORT_200K_DECODE_HP |
+				RT711_JD2_2PORT_100K_DECODE_MASK | RT711_HP_JD_SEL_JD2,
+				RT711_JD2_2PORT_100K_DECODE_HP | RT711_HP_JD_SEL_JD2);
+			rt711_sdca_index_update_bits(rt711, RT711_VENDOR_REG,
+				RT711_CC_DET1,
+				RT711_HP_JD_FINAL_RESULT_CTL_JD12 | RT711_POW_CC1_AGPI,
+				RT711_HP_JD_FINAL_RESULT_CTL_JD12 | RT711_POW_CC1_AGPI_OFF);
+			break;
 		default:
 			dev_warn(rt711->component->dev, "Wrong JD source\n");
 			break;
diff --git a/sound/soc/codecs/rt711-sdca.h b/sound/soc/codecs/rt711-sdca.h
index 498ca687c47b..10e3c801b813 100644
--- a/sound/soc/codecs/rt711-sdca.h
+++ b/sound/soc/codecs/rt711-sdca.h
@@ -127,12 +127,17 @@ struct sdw_stream_data {
 
 /* jack detect control 2 (0x09)(NID:20h) */
 #define RT711_JD2_2PORT_200K_DECODE_HP (0x1 << 13)
+#define RT711_JD2_2PORT_100K_DECODE_MASK (0x1 << 12)
+#define RT711_JD2_2PORT_100K_DECODE_HP (0x0 << 12)
 #define RT711_HP_JD_SEL_JD1 (0x0 << 1)
 #define RT711_HP_JD_SEL_JD2 (0x1 << 1)
 
 /* CC DET1 (0x11)(NID:20h) */
 #define RT711_HP_JD_FINAL_RESULT_CTL_JD12 (0x1 << 10)
 #define RT711_HP_JD_FINAL_RESULT_CTL_CCDET (0x0 << 10)
+#define RT711_POW_CC1_AGPI (0x1 << 5)
+#define RT711_POW_CC1_AGPI_ON (0x1 << 5)
+#define RT711_POW_CC1_AGPI_OFF (0x0 << 5)
 
 /* Parameter & Verb control (0x1a)(NID:20h) */
 #define RT711_HIDDEN_REG_SW_RESET (0x1 << 14)
@@ -226,7 +231,8 @@ enum {
 enum rt711_sdca_jd_src {
 	RT711_JD_NULL,
 	RT711_JD1,
-	RT711_JD2
+	RT711_JD2,
+	RT711_JD2_100K
 };
 
 enum rt711_sdca_ver {
-- 
2.38.1

