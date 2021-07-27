Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6493D7187
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Jul 2021 10:50:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D7251EDF;
	Tue, 27 Jul 2021 10:49:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D7251EDF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627375841;
	bh=hi5Ut8WSNt3T7YXxqRBJhR7NzNeE4VoK2RhcBjdOZhE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YpWbHPVz6byYRxdy/w1DJqVLd18FiFRtLMwGHpx7+oAAwCRwaEVF2bhAluzlDvqzR
	 msWXNjxyid+5QcNSFiA2GKji0kXeQEEj2nFAFnIHngfPeecQtpdGEvF2Be7oxFIlQ1
	 D8if9Mo0zmO8x6/kktnlkrvwh/HM1FvOg5EbBCXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D980F80159;
	Tue, 27 Jul 2021 10:49:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54114F8026C; Tue, 27 Jul 2021 10:49:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE32EF80159
 for <alsa-devel@alsa-project.org>; Tue, 27 Jul 2021 10:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE32EF80159
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 16R8muJH3023396,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36502.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 16R8muJH3023396
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 27 Jul 2021 16:48:56 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36502.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 27 Jul 2021 16:48:55 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 27 Jul 2021 16:48:55 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt5682: enable SAR ADC power saving mode during suspend
Date: Tue, 27 Jul 2021 16:48:46 +0800
Message-ID: <20210727084846.9867-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMBS01.realtek.com.tw (172.21.6.94) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 07/27/2021 08:27:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzcvMjcgpFekyCAwNjowMDowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36502.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 07/27/2021 08:34:55
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 165259 [Jul 27 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: shumingf@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 449 449 5db59deca4a4f5e6ea34a93b13bc730e229092f4
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: realtek.com:7.1.1; 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 07/27/2021 08:38:00
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, derek.fang@realtek.com,
 sathyanarayana.nujella@intel.com, Shuming Fan <shumingf@realtek.com>,
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

The SAR ADC power saving mode could reduce power consumption on MICVDD rail.
Therefore, this patch saves power consumption during suspend state if the headset was connected.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt5682.c | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 51ecaa2abcd1..7dc01ae6bb66 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2916,10 +2916,46 @@ static void rt5682_remove(struct snd_soc_component *component)
 static int rt5682_suspend(struct snd_soc_component *component)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
+	unsigned int val;
 
 	if (rt5682->is_sdw)
 		return 0;
 
+	cancel_delayed_work_sync(&rt5682->jack_detect_work);
+	cancel_delayed_work_sync(&rt5682->jd_check_work);
+	if (rt5682->hs_jack && rt5682->jack_type == SND_JACK_HEADSET) {
+		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_1,
+			RT5682_MB1_PATH_MASK | RT5682_MB2_PATH_MASK,
+			RT5682_CTRL_MB1_REG | RT5682_CTRL_MB2_REG);
+		val = snd_soc_component_read(component,
+				RT5682_CBJ_CTRL_2) & RT5682_JACK_TYPE_MASK;
+
+		switch (val) {
+		case 0x1:
+			snd_soc_component_update_bits(component, RT5682_SAR_IL_CMD_1,
+				RT5682_SAR_SEL_MB1_MASK | RT5682_SAR_SEL_MB2_MASK,
+				RT5682_SAR_SEL_MB1_NOSEL | RT5682_SAR_SEL_MB2_SEL);
+			break;
+		case 0x2:
+			snd_soc_component_update_bits(component, RT5682_SAR_IL_CMD_1,
+				RT5682_SAR_SEL_MB1_MASK | RT5682_SAR_SEL_MB2_MASK,
+				RT5682_SAR_SEL_MB1_SEL | RT5682_SAR_SEL_MB2_NOSEL);
+			break;
+		default:
+			break;
+		}
+
+		snd_soc_component_update_bits(component, RT5682_PWR_ANLG_3,
+			RT5682_PWR_CBJ, 0);
+
+		/* enter SAR ADC power saving mode */
+		snd_soc_component_update_bits(component, RT5682_SAR_IL_CMD_1,
+			RT5682_SAR_BUTT_DET_MASK | RT5682_SAR_BUTDET_MODE_MASK | RT5682_SAR_BUTDET_RST_MASK, 0);
+		snd_soc_component_update_bits(component, RT5682_SAR_IL_CMD_1,
+			RT5682_SAR_BUTT_DET_MASK | RT5682_SAR_BUTDET_MODE_MASK | RT5682_SAR_BUTDET_RST_MASK,
+			RT5682_SAR_BUTT_DET_EN | RT5682_SAR_BUTDET_POW_SAV | RT5682_SAR_BUTDET_RST_NORMAL);
+	}
+
 	regcache_cache_only(rt5682->regmap, true);
 	regcache_mark_dirty(rt5682->regmap);
 	return 0;
@@ -2935,6 +2971,14 @@ static int rt5682_resume(struct snd_soc_component *component)
 	regcache_cache_only(rt5682->regmap, false);
 	regcache_sync(rt5682->regmap);
 
+	if (rt5682->hs_jack && rt5682->jack_type == SND_JACK_HEADSET) {
+		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_1,
+			RT5682_MB1_PATH_MASK | RT5682_MB2_PATH_MASK,
+			RT5682_CTRL_MB1_FSM | RT5682_CTRL_MB2_FSM);
+		snd_soc_component_update_bits(component, RT5682_PWR_ANLG_3,
+			RT5682_PWR_CBJ, RT5682_PWR_CBJ);
+	}
+
 	mod_delayed_work(system_power_efficient_wq,
 		&rt5682->jack_detect_work, msecs_to_jiffies(250));
 
-- 
2.31.1

