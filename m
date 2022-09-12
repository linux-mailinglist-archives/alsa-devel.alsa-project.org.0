Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 855B85B5567
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Sep 2022 09:35:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6472916EE;
	Mon, 12 Sep 2022 09:34:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6472916EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662968130;
	bh=BP+dJiuzrh7y+nuJhDQyqAfOsMVgQZRxfX8wPcgYDME=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I9c78KjImU4iczkf2NFAs6bPfuOh3SEvyweoT+vyCfnkvps0h+rbINCor7tzzchkb
	 7GUu25hC6XEwnbhdST/T3eYhp9KKPRk4A4LxiTebuV1rFC+KhheaKeVhXIjo2vjMLf
	 vXo29y7IHebglcNB8AOiI2seGxszawE03GPV34FY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3AF1F800FE;
	Mon, 12 Sep 2022 09:34:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92E68F80095; Mon, 12 Sep 2022 09:34:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 by alsa1.perex.cz (Postfix) with ESMTP id 5B1F8F80095
 for <alsa-devel@alsa-project.org>; Mon, 12 Sep 2022 09:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B1F8F80095
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 28C7Y1OQ0015265,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36504.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 28C7Y1OQ0015265
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Mon, 12 Sep 2022 15:34:01 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36504.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 12 Sep 2022 15:34:21 +0800
Received: from oder-virtual-machine.realtek.com.tw (172.22.102.107) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 12 Sep 2022 15:34:21 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt5640: Fix the issue of the abnormal JD2 status
Date: Mon, 12 Sep 2022 15:29:31 +0800
Message-ID: <20220912072931.1856-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.107]
X-ClientProxiedBy: RTEXH36504.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/12/2022 07:11:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzkvMTIgpFekyCAwMjozNzowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36504.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Cc: Oder Chiou <oder_chiou@realtek.com>, jack.yu@realtek.com,
 alsa-devel@alsa-project.org, jacal_tseng@realtek.com,
 Sameer Pujar <spujar@nvidia.com>, albertchen@realtek.com,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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

The patch fixes the issue of the abnormal JD2 status.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
Reported-by: Sameer Pujar <spujar@nvidia.com>
---
 sound/soc/codecs/rt5640.c | 64 +++++++++++++++++++++++++++------------
 sound/soc/codecs/rt5640.h | 14 +++++++++
 2 files changed, 59 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 5a844329800..0f8e6dd214b 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2494,7 +2494,7 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 
 	/* Select JD-source */
 	snd_soc_component_update_bits(component, RT5640_JD_CTRL,
-		RT5640_JD_MASK, rt5640->jd_src);
+		RT5640_JD_MASK, rt5640->jd_src << RT5640_JD_SFT);
 
 	/* Selecting GPIO01 as an interrupt */
 	snd_soc_component_update_bits(component, RT5640_GPIO_CTRL1,
@@ -2504,12 +2504,8 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 	snd_soc_component_update_bits(component, RT5640_GPIO_CTRL3,
 		RT5640_GP1_PF_MASK, RT5640_GP1_PF_OUT);
 
-	/* Enabling jd2 in general control 1 */
 	snd_soc_component_write(component, RT5640_DUMMY1, 0x3f41);
 
-	/* Enabling jd2 in general control 2 */
-	snd_soc_component_write(component, RT5640_DUMMY2, 0x4001);
-
 	rt5640_set_ovcd_params(component);
 
 	/*
@@ -2518,12 +2514,25 @@ static void rt5640_enable_jack_detect(struct snd_soc_component *component,
 	 * pin 0/1 instead of it being stuck to 1. So we invert the JD polarity
 	 * on systems where the hardware does not already do this.
 	 */
-	if (rt5640->jd_inverted)
-		snd_soc_component_write(component, RT5640_IRQ_CTRL1,
-					RT5640_IRQ_JD_NOR);
-	else
-		snd_soc_component_write(component, RT5640_IRQ_CTRL1,
-					RT5640_IRQ_JD_NOR | RT5640_JD_P_INV);
+	if (rt5640->jd_inverted) {
+		if (rt5640->jd_src == RT5640_JD_SRC_JD1_IN4P)
+			snd_soc_component_write(component, RT5640_IRQ_CTRL1,
+				RT5640_IRQ_JD_NOR);
+		else if (rt5640->jd_src == RT5640_JD_SRC_JD2_IN4N)
+			snd_soc_component_update_bits(component, RT5640_DUMMY2,
+				RT5640_IRQ_JD2_MASK | RT5640_JD2_MASK,
+				RT5640_IRQ_JD2_NOR | RT5640_JD2_EN);
+	} else {
+		if (rt5640->jd_src == RT5640_JD_SRC_JD1_IN4P)
+			snd_soc_component_write(component, RT5640_IRQ_CTRL1,
+				RT5640_IRQ_JD_NOR | RT5640_JD_P_INV);
+		else if (rt5640->jd_src == RT5640_JD_SRC_JD2_IN4N)
+			snd_soc_component_update_bits(component, RT5640_DUMMY2,
+				RT5640_IRQ_JD2_MASK | RT5640_JD2_P_MASK |
+				RT5640_JD2_MASK,
+				RT5640_IRQ_JD2_NOR | RT5640_JD2_P_INV |
+				RT5640_JD2_EN);
+	}
 
 	rt5640->jack = jack;
 	if (rt5640->jack->status & SND_JACK_MICROPHONE) {
@@ -2725,10 +2734,8 @@ static int rt5640_probe(struct snd_soc_component *component)
 
 	if (device_property_read_u32(component->dev,
 				     "realtek,jack-detect-source", &val) == 0) {
-		if (val <= RT5640_JD_SRC_GPIO4)
-			rt5640->jd_src = val << RT5640_JD_SFT;
-		else if (val == RT5640_JD_SRC_HDA_HEADER)
-			rt5640->jd_src = RT5640_JD_SRC_HDA_HEADER;
+		if (val <= RT5640_JD_SRC_HDA_HEADER)
+			rt5640->jd_src = val;
 		else
 			dev_warn(component->dev, "Warning: Invalid jack-detect-source value: %d, leaving jack-detect disabled\n",
 				 val);
@@ -2809,12 +2816,31 @@ static int rt5640_resume(struct snd_soc_component *component)
 	regcache_sync(rt5640->regmap);
 
 	if (rt5640->jack) {
-		if (rt5640->jd_src == RT5640_JD_SRC_HDA_HEADER)
+		if (rt5640->jd_src == RT5640_JD_SRC_HDA_HEADER) {
 			snd_soc_component_update_bits(component,
 				RT5640_DUMMY2, 0x1100, 0x1100);
-		else
-			snd_soc_component_write(component, RT5640_DUMMY2,
-				0x4001);
+		} else {
+			if (rt5640->jd_inverted) {
+				if (rt5640->jd_src == RT5640_JD_SRC_JD2_IN4N)
+					snd_soc_component_update_bits(
+						component, RT5640_DUMMY2,
+						RT5640_IRQ_JD2_MASK |
+						RT5640_JD2_MASK,
+						RT5640_IRQ_JD2_NOR |
+						RT5640_JD2_EN);
+
+			} else {
+				if (rt5640->jd_src == RT5640_JD_SRC_JD2_IN4N)
+					snd_soc_component_update_bits(
+						component, RT5640_DUMMY2,
+						RT5640_IRQ_JD2_MASK |
+						RT5640_JD2_P_MASK |
+						RT5640_JD2_MASK,
+						RT5640_IRQ_JD2_NOR |
+						RT5640_JD2_P_INV |
+						RT5640_JD2_EN);
+			}
+		}
 
 		queue_delayed_work(system_long_wq, &rt5640->jack_work, 0);
 	}
diff --git a/sound/soc/codecs/rt5640.h b/sound/soc/codecs/rt5640.h
index 505c9351405..f58b88e3325 100644
--- a/sound/soc/codecs/rt5640.h
+++ b/sound/soc/codecs/rt5640.h
@@ -1984,6 +1984,20 @@
 #define RT5640_M_MONO_ADC_R_SFT			12
 #define RT5640_MCLK_DET				(0x1 << 11)
 
+/* General Control 1 (0xfb) */
+#define RT5640_IRQ_JD2_MASK			(0x1 << 12)
+#define RT5640_IRQ_JD2_SFT			12
+#define RT5640_IRQ_JD2_BP			(0x0 << 12)
+#define RT5640_IRQ_JD2_NOR			(0x1 << 12)
+#define RT5640_JD2_P_MASK			(0x1 << 10)
+#define RT5640_JD2_P_SFT			10
+#define RT5640_JD2_P_NOR			(0x0 << 10)
+#define RT5640_JD2_P_INV			(0x1 << 10)
+#define RT5640_JD2_MASK				(0x1 << 8)
+#define RT5640_JD2_SFT				8
+#define RT5640_JD2_DIS				(0x0 << 8)
+#define RT5640_JD2_EN				(0x1 << 8)
+
 /* Codec Private Register definition */
 
 /* MIC Over current threshold scale factor (0x15) */
-- 
2.34.1

