Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B6D41E886
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Oct 2021 09:43:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C50D316E7;
	Fri,  1 Oct 2021 09:42:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C50D316E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633074204;
	bh=y0cA86dh0WXypVKo9VP8Phrf8u3gkxQHIrb3ssKox6Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hLZLvb6WNbcObR4v+CGn+Eme110B4CYy3lTGrjLVRoV+luWd+TFSGVe4BnSYtkIc+
	 7GQO8Ipq47ed8PQ7jbNz1i3HhNkra7f8/LPHP7AS2BkEX0V95ogxkuEWAWc2+Btebx
	 +xfoNiQNOwidvBUFQ9Ow9MB/FsFoJeDFlUWllnxc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92EC8F802C4;
	Fri,  1 Oct 2021 09:41:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DD36F80165; Fri,  1 Oct 2021 09:41:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E4F7F80165
 for <alsa-devel@alsa-project.org>; Fri,  1 Oct 2021 09:41:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E4F7F80165
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1917fJvM5009143,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 1917fJvM5009143
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 1 Oct 2021 15:41:19 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Fri, 1 Oct 2021 15:41:19 +0800
Received: from localhost.localdomain (172.22.234.227) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 1 Oct 2021 15:41:18 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: rt5682s: Fix HP noise caused by SAR mode switch
 when the system resumes
Date: Fri, 1 Oct 2021 15:41:13 +0800
Message-ID: <20211001074113.2223-2-derek.fang@realtek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211001074113.2223-1-derek.fang@realtek.com>
References: <20211001074113.2223-1-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.234.227]
X-ClientProxiedBy: RTEXH36503.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/01/2021 07:26:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzEwLzEgpFekyCAwNjowMTowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, Derek Fang <derek.fang@realtek.com>,
 kevin_chen_ym@realtek.com, shumingf@realtek.com, flove@realtek.com
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

From: Derek Fang <derek.fang@realtek.com>

When the system resumes from S3, if the system plays a beep,
there is continuous "Zizi.." noise from HP that could be heard.
It is caused by the SAR mode switch during the combo jack
re-detection which be executed parallelly in a workqueue
after the system resumes.

This patch changes the behavior of SAR mode switch to
avoid this issue.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt5682s.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 5ae54a51ff9e..639a50fa95e2 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -779,7 +779,8 @@ static int rt5682s_headset_detect(struct snd_soc_component *component, int jack_
 				RT5682S_FAST_OFF_MASK, RT5682S_FAST_OFF_EN);
 			snd_soc_component_update_bits(component, RT5682S_SAR_IL_CMD_1,
 				RT5682S_SAR_SEL_MB1_2_MASK, val << RT5682S_SAR_SEL_MB1_2_SFT);
-			rt5682s_sar_power_mode(component, SAR_PWR_SAVING, 1);
+			if (!snd_soc_dapm_get_pin_status(&component->dapm, "SAR"))
+				rt5682s_sar_power_mode(component, SAR_PWR_SAVING, 1);
 			rt5682s_enable_push_button_irq(component);
 			break;
 		default:
@@ -1313,18 +1314,6 @@ static int is_using_asrc(struct snd_soc_dapm_widget *w,
 	}
 }
 
-static int is_headset_type(struct snd_soc_dapm_widget *w,
-		struct snd_soc_dapm_widget *sink)
-{
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
-
-	if ((rt5682s->jack_type & SND_JACK_HEADSET) == SND_JACK_HEADSET)
-		return 1;
-
-	return 0;
-}
-
 static int rt5682s_hp_amp_event(struct snd_soc_dapm_widget *w,
 		struct snd_kcontrol *kcontrol, int event)
 {
@@ -1372,6 +1361,10 @@ static int sar_power_event(struct snd_soc_dapm_widget *w,
 		struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
+
+	if ((rt5682s->jack_type & SND_JACK_HEADSET) != SND_JACK_HEADSET)
+		return 0;
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1784,7 +1777,7 @@ static const struct snd_soc_dapm_route rt5682s_dapm_routes[] = {
 	{"CLKDET SYS", NULL, "MCLK0 DET PWR"},
 
 	{"BST1 CBJ", NULL, "IN1P"},
-	{"BST1 CBJ", NULL, "SAR", is_headset_type},
+	{"BST1 CBJ", NULL, "SAR"},
 
 	{"RECMIX1L", "CBJ Switch", "BST1 CBJ"},
 	{"RECMIX1L", NULL, "RECMIX1L Power"},
@@ -1890,7 +1883,7 @@ static const struct snd_soc_dapm_route rt5682s_dapm_routes[] = {
 	{"HP Amp", NULL, "DAC L1"},
 	{"HP Amp", NULL, "DAC R1"},
 	{"HP Amp", NULL, "CLKDET SYS"},
-	{"HP Amp", NULL, "SAR", is_headset_type},
+	{"HP Amp", NULL, "SAR"},
 
 	{"HPOL", NULL, "HP Amp"},
 	{"HPOR", NULL, "HP Amp"},
@@ -2823,8 +2816,9 @@ static int rt5682s_resume(struct snd_soc_component *component)
 
 	if (rt5682s->hs_jack) {
 		rt5682s->jack_type = 0;
+		rt5682s_sar_power_mode(component, SAR_PWR_NORMAL, 0);
 		mod_delayed_work(system_power_efficient_wq,
-			&rt5682s->jack_detect_work, msecs_to_jiffies(250));
+			&rt5682s->jack_detect_work, msecs_to_jiffies(0));
 	}
 
 	return 0;
-- 
2.17.1

