Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 442603438CD
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 06:52:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB4FA15E2;
	Mon, 22 Mar 2021 06:51:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB4FA15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616392366;
	bh=AQIbCwkXxWOUJR8Z2g1SYGF2fZlBv1avJ6aW8d5tANY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZFsNMZfwhARGtm4KIi1bUuedGJaPeZfzefzgvUXeNBFf5WUH75w9fAr8hggK8XO8z
	 QqKvuzyliOvLTG2vYSLTMd7IOfTD+xp20WG3dWTm8vMpaadGAZRV8Fx3GfJ9XCwYhz
	 mofR4xfNLIfZOQveng1zY6Il0JGK9smueu2/LdJk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 099FFF801D5;
	Mon, 22 Mar 2021 06:51:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE2DBF8016B; Mon, 22 Mar 2021 06:51:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 522CFF80107
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 06:51:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 522CFF80107
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 12M5p2Ej9032564,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 12M5p2Ej9032564
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 22 Mar 2021 13:51:02 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 13:51:02 +0800
From: Jack Yu <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt1015: Add bclk detection and dc detection
Date: Mon, 22 Mar 2021 13:50:53 +0800
Message-ID: <20210322055053.31797-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMBS01.realtek.com.tw (172.21.6.94) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
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

Add bclk detection and dc detection before playback.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 sound/soc/codecs/rt1015.c | 18 +++++++++++++++++-
 sound/soc/codecs/rt1015.h | 10 ++++++++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 10a7b7745f4b..9238f12999aa 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -669,8 +669,23 @@ static int rt1015_amp_drv_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
 	struct rt1015_priv *rt1015 = snd_soc_component_get_drvdata(component);
+	unsigned int ret, ret2;
 
 	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		ret = snd_soc_component_read(component, RT1015_CLK_DET);
+		ret2 = snd_soc_component_read(component, RT1015_SPK_DC_DETECT1);
+		if (!((ret >> 15) & 0x1)) {
+			snd_soc_component_update_bits(component, RT1015_CLK_DET,
+				RT1015_EN_BCLK_DET_MASK, RT1015_EN_BCLK_DET);
+			dev_dbg(component->dev, "BCLK Detection Enabled.\n");
+		}
+		if (!((ret2 >> 12) & 0x1)) {
+			snd_soc_component_update_bits(component, RT1015_SPK_DC_DETECT1,
+				RT1015_EN_CLA_D_DC_DET_MASK, RT1015_EN_CLA_D_DC_DET);
+			dev_dbg(component->dev, "Class-D DC Detection Enabled.\n");
+		}
+		break;
 	case SND_SOC_DAPM_POST_PMU:
 		if (rt1015->hw_config == RT1015_HW_28)
 			schedule_delayed_work(&rt1015->flush_work, msecs_to_jiffies(10));
@@ -690,7 +705,8 @@ static const struct snd_soc_dapm_widget rt1015_dapm_widgets[] = {
 		r1015_dac_event, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
 		SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_OUT_DRV_E("Amp Drv", SND_SOC_NOPM, 0, 0, NULL, 0,
-			rt1015_amp_drv_event, SND_SOC_DAPM_POST_PMU),
+			rt1015_amp_drv_event, SND_SOC_DAPM_PRE_PMU |
+			SND_SOC_DAPM_POST_PMU),
 	SND_SOC_DAPM_OUTPUT("SPO"),
 };
 
diff --git a/sound/soc/codecs/rt1015.h b/sound/soc/codecs/rt1015.h
index 2aeaf65ba793..14344532048e 100644
--- a/sound/soc/codecs/rt1015.h
+++ b/sound/soc/codecs/rt1015.h
@@ -209,6 +209,11 @@
 #define RT1015_PLL_K_MASK			(RT1015_PLL_K_MAX)
 #define RT1015_PLL_K_SFT			0
 
+/* 0x0020 */
+#define RT1015_EN_BCLK_DET_MASK			(0x1 << 15)
+#define RT1015_EN_BCLK_DET				(0x1 << 15)
+#define RT1015_DIS_BCLK_DET				(0x0 << 15)
+
 /* 0x007a */
 #define RT1015_ID_MASK				0xff
 #define RT1015_ID_VERA				0x0
@@ -374,6 +379,11 @@
 #define RT1015_PWR_SWR				(0x1 << 12)
 #define RT1015_PWR_SWR_BIT			12
 
+/* 0x0519 */
+#define RT1015_EN_CLA_D_DC_DET_MASK	(0x1 << 12)
+#define RT1015_EN_CLA_D_DC_DET		(0x1 << 12)
+#define RT1015_DIS_CLA_D_DC_DET		(0x0 << 12)
+
 /* 0x1300 */
 #define RT1015_PWR_CLSD				(0x1 << 12)
 #define RT1015_PWR_CLSD_BIT			12
-- 
2.29.0

