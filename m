Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 016511F8C74
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jun 2020 05:27:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C0F31679;
	Mon, 15 Jun 2020 05:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C0F31679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592191657;
	bh=qqFvVDmgYZNbIJHCzPZ4IVyCOOHwSdtuiSgjIrUmhF0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mgyL6in2XilzBmzIl8dE1Jfon01YDu3txAOB41a9okbrSIPfC71UdKEfdXLMyNCGr
	 uSKE37XSVSyLUq5giOwpWA+3YhRYgUobfphUE6hMjLl6ckTujqwmuuTO5V4tbUoihm
	 eGRZa136qRaSKzxJf3oQuKaNv8sBR+c+B3YzLiUY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D72FF800EF;
	Mon, 15 Jun 2020 05:25:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85127F801EB; Mon, 15 Jun 2020 05:25:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4702F80162
 for <alsa-devel@alsa-project.org>; Mon, 15 Jun 2020 05:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4702F80162
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.69 with qID 05F3OjXH2008066,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmb06.realtek.com.tw[172.21.6.99])
 by rtits2.realtek.com.tw (8.15.2/2.66/5.86) with ESMTPS id 05F3OjXH2008066
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 15 Jun 2020 11:24:45 +0800
Received: from RTEXMB01.realtek.com.tw (172.21.6.94) by
 RTEXMB06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 15 Jun 2020 11:24:45 +0800
Received: from localhost.localdomain (172.22.102.1) by RTEXMB01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2; Mon, 15 Jun
 2020 11:24:44 +0800
From: <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: rt1015: Flush DAC data before playback.
Date: Mon, 15 Jun 2020 11:24:33 +0800
Message-ID: <20200615032433.31061-2-jack.yu@realtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200615032433.31061-1-jack.yu@realtek.com>
References: <20200615032433.31061-1-jack.yu@realtek.com>
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

Flush DAC data before playback.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 sound/soc/codecs/rt1015.c | 18 ++++++++++++++----
 sound/soc/codecs/rt1015.h |  5 +++++
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 2cccb310fa96..89bd5936f9a7 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -493,7 +493,7 @@ static int rt1015_bypass_boost_put(struct snd_kcontrol *kcontrol,
 
 	if (!rt1015->dac_is_used) {
 		rt1015->bypass_boost = ucontrol->value.integer.value[0];
-		if (rt1015->bypass_boost == 1) {
+		if (rt1015->bypass_boost == Bypass_Boost) {
 			snd_soc_component_write(component,
 				RT1015_PWR4, 0x00b2);
 			snd_soc_component_write(component,
@@ -549,7 +549,7 @@ static int r1015_dac_event(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		rt1015->dac_is_used = 1;
-		if (rt1015->bypass_boost == 0) {
+		if (rt1015->bypass_boost == Enable_Boost) {
 			snd_soc_component_write(component,
 				RT1015_SYS_RST1, 0x05f7);
 			snd_soc_component_write(component,
@@ -566,8 +566,17 @@ static int r1015_dac_event(struct snd_soc_dapm_widget *w,
 		}
 		break;
 
+	case SND_SOC_DAPM_POST_PMU:
+		if (rt1015->bypass_boost == Bypass_Boost) {
+			regmap_write(rt1015->regmap, RT1015_MAN_I2C, 0x00a8);
+			regmap_write(rt1015->regmap, RT1015_SYS_RST1, 0x0597);
+			regmap_write(rt1015->regmap, RT1015_SYS_RST1, 0x05f7);
+			regmap_write(rt1015->regmap, RT1015_MAN_I2C, 0x0028);
+		}
+		break;
+
 	case SND_SOC_DAPM_POST_PMD:
-		if (rt1015->bypass_boost == 0) {
+		if (rt1015->bypass_boost == Enable_Boost) {
 			snd_soc_component_write(component,
 				RT1015_PWR9, 0xa800);
 			snd_soc_component_write(component,
@@ -617,7 +626,8 @@ static const struct snd_soc_dapm_widget rt1015_dapm_widgets[] = {
 
 	SND_SOC_DAPM_AIF_IN("AIFRX", "AIF Playback", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_DAC_E("DAC", NULL, RT1015_PWR1, RT1015_PWR_DAC_BIT, 0,
-		r1015_dac_event, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+		r1015_dac_event, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
+		SND_SOC_DAPM_POST_PMD),
 
 	SND_SOC_DAPM_OUTPUT("SPO"),
 };
diff --git a/sound/soc/codecs/rt1015.h b/sound/soc/codecs/rt1015.h
index 8169962935a5..3cbb4fa2ac51 100644
--- a/sound/soc/codecs/rt1015.h
+++ b/sound/soc/codecs/rt1015.h
@@ -368,6 +368,11 @@ enum {
 	FIXED_ADAPTIVE,
 };
 
+enum {
+	Enable_Boost,
+	Bypass_Boost,
+};
+
 struct rt1015_priv {
 	struct snd_soc_component *component;
 	struct regmap *regmap;
-- 
2.25.1

