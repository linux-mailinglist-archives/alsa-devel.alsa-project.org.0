Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F50D44AB04
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 10:56:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9252E1658;
	Tue,  9 Nov 2021 10:55:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9252E1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636451794;
	bh=KhFiYFWaCDJMR6lt/zaffC7jLXAcRMfyHyLpNJ8ffnI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EmEo9NOToCd0GKpEqRwWzwgxE7+HoCsxXw+YM4gKuY/YnadeDNPc8vm1tatBOtqFV
	 MfwZ6Yn9LNSWwM27802HUFg96Te3FgcP/g4jhUlWV91pPTNZjw/nMeouWCG45itDDT
	 cKeoiilljlhLuO2ktgc/oERRuBQSMNzE7jN5b+2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03435F802E3;
	Tue,  9 Nov 2021 10:55:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E610CF802E3; Tue,  9 Nov 2021 10:55:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 226BEF801D8
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 10:55:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 226BEF801D8
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1A99stXG3017865,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36504.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 1A99stXG3017865
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 9 Nov 2021 17:54:56 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36504.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 9 Nov 2021 17:54:55 +0800
Received: from localhost.localdomain (172.22.233.64) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 9 Nov 2021 04:54:54 -0500
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 1/2] ASoC: rt5682: Avoid the unexpected IRQ event during going
 to suspend
Date: Tue, 9 Nov 2021 17:54:49 +0800
Message-ID: <20211109095450.12950-1-derek.fang@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.233.64]
X-ClientProxiedBy: RTEXH36503.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/09/2021 09:42:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzExLzkgpFekyCAwNzoxNzowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36504.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 11/09/2021 09:38:58
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 167134 [Nov 09 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: derek.fang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 465 465 eb31509370142567679dd183ac984a0cb2ee3296
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 realtek.com:7.1.1; 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/09/2021 09:42:00
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, Derek Fang <derek.fang@realtek.com>,
 shumingf@realtek.com, flove@realtek.com
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

When the system suspends, the codec driver will set SAR to
power saving mode if a headset is plugged in.
There is a chance to generate an unexpected IRQ, and leads to
issues after resuming such as noise from OMTP type headsets.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt5682.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 78b4cb5fb6c8..a486ac268c33 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -48,6 +48,7 @@ static const struct reg_sequence patch_list[] = {
 	{RT5682_SAR_IL_CMD_6, 0x0110},
 	{RT5682_CHARGE_PUMP_1, 0x0210},
 	{RT5682_HP_LOGIC_CTRL_2, 0x0007},
+	{RT5682_SAR_IL_CMD_2, 0xac00},
 };
 
 void rt5682_apply_patch_list(struct rt5682_priv *rt5682, struct device *dev)
@@ -2943,9 +2944,6 @@ static int rt5682_suspend(struct snd_soc_component *component)
 	cancel_delayed_work_sync(&rt5682->jack_detect_work);
 	cancel_delayed_work_sync(&rt5682->jd_check_work);
 	if (rt5682->hs_jack && rt5682->jack_type == SND_JACK_HEADSET) {
-		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_1,
-			RT5682_MB1_PATH_MASK | RT5682_MB2_PATH_MASK,
-			RT5682_CTRL_MB1_REG | RT5682_CTRL_MB2_REG);
 		val = snd_soc_component_read(component,
 				RT5682_CBJ_CTRL_2) & RT5682_JACK_TYPE_MASK;
 
@@ -2967,10 +2965,15 @@ static int rt5682_suspend(struct snd_soc_component *component)
 		/* enter SAR ADC power saving mode */
 		snd_soc_component_update_bits(component, RT5682_SAR_IL_CMD_1,
 			RT5682_SAR_BUTT_DET_MASK | RT5682_SAR_BUTDET_MODE_MASK |
-			RT5682_SAR_BUTDET_RST_MASK | RT5682_SAR_SEL_MB1_MB2_MASK, 0);
+			RT5682_SAR_SEL_MB1_MB2_MASK, 0);
+		usleep_range(5000, 6000);
+		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_1,
+			RT5682_MB1_PATH_MASK | RT5682_MB2_PATH_MASK,
+			RT5682_CTRL_MB1_REG | RT5682_CTRL_MB2_REG);
+		usleep_range(10000, 12000);
 		snd_soc_component_update_bits(component, RT5682_SAR_IL_CMD_1,
-			RT5682_SAR_BUTT_DET_MASK | RT5682_SAR_BUTDET_MODE_MASK | RT5682_SAR_BUTDET_RST_MASK,
-			RT5682_SAR_BUTT_DET_EN | RT5682_SAR_BUTDET_POW_SAV | RT5682_SAR_BUTDET_RST_NORMAL);
+			RT5682_SAR_BUTT_DET_MASK | RT5682_SAR_BUTDET_MODE_MASK,
+			RT5682_SAR_BUTT_DET_EN | RT5682_SAR_BUTDET_POW_SAV);
 	}
 
 	regcache_cache_only(rt5682->regmap, true);
-- 
2.17.1

