Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 942A02FB4D9
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 10:13:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FFFE1868;
	Tue, 19 Jan 2021 10:13:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FFFE1868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611047631;
	bh=34FExZkf1iwZ/WD9Zkm0l3bwv2Kdm13tGwL1M628eW0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ptjJ42jzIAlAfxVM3EuPvygCnaFcFrRo+qhIfu7g5fKgsne5Cej1z6q/omIHQfn+n
	 Mkfw+lmNENsCE4GRvpGUe8AIXVGz0VSPOD8BtbwK748Xrc+lqgDFXAISi4ha9GDzcu
	 EGlUcRD8JALOWyQ2JD1QS8QcWV6OiQOwWV0Vrj+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 830B3F80137;
	Tue, 19 Jan 2021 10:12:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56E94F80257; Tue, 19 Jan 2021 10:12:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 758A1F80137
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 10:12:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 758A1F80137
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 10J9C4140010129,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 10J9C4140010129
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 19 Jan 2021 17:12:04 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 19 Jan 2021 17:12:04 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt5682: remove LDO2 power supply widget
Date: Tue, 19 Jan 2021 17:11:58 +0800
Message-ID: <20210119091158.12988-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, derek.fang@realtek.com,
 Shuming Fan <shumingf@realtek.com>, flove@realtek.com
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

The application circuit shall provide MICVDD power.
Hence, the codec driver doesn't need to enable LDO2.
This patch also reduces power consumption while the recording from the headset.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt5682.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 42ad5bea86b5..81a4b115b538 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1630,8 +1630,6 @@ static const struct snd_kcontrol_new rt5682_adcdat_pin_ctrl =
 	SOC_DAPM_ENUM("ADCDAT", rt5682_adcdat_pin_enum);
 
 static const struct snd_soc_dapm_widget rt5682_dapm_widgets[] = {
-	SND_SOC_DAPM_SUPPLY("LDO2", RT5682_PWR_ANLG_3, RT5682_PWR_LDO2_BIT,
-		0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("PLL1", RT5682_PWR_ANLG_3, RT5682_PWR_PLL_BIT,
 		0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("PLL2B", RT5682_PWR_ANLG_3, RT5682_PWR_PLL2B_BIT,
@@ -1854,8 +1852,6 @@ static const struct snd_soc_dapm_route rt5682_dapm_routes[] = {
 
 	{"CLKDET SYS", NULL, "CLKDET"},
 
-	{"IN1P", NULL, "LDO2"},
-
 	{"BST1 CBJ", NULL, "IN1P"},
 
 	{"RECMIX1L", "CBJ Switch", "BST1 CBJ"},
-- 
2.29.0

