Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF93D4740D4
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 11:52:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 449DF1906;
	Tue, 14 Dec 2021 11:51:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 449DF1906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639479127;
	bh=Sggu/Y9vzrRMoW1hyk60uuRoSRjqiMJq23dx5SCjDjY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mBx2sTItBQ8CJJXuqGL+TdfFF0/Zv2iZGHsw7xy2vgFvZE5vdJMMvEbyDs0raW6ac
	 TbFzDGBTEtkpDObPtJESWyVOdm8rZpq85l2suGc+3SCCmJOrC8mXGWKbHSzAZ2Eq0E
	 hQv+Y4Mj/NnJEQ8dHaoDpEKi8CmJLnQoBwvoao08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94444F80249;
	Tue, 14 Dec 2021 11:50:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D2E6F80246; Tue, 14 Dec 2021 11:50:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E85E7F8013C
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 11:50:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E85E7F8013C
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1BEAodOV3004196,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36504.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 1BEAodOV3004196
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 14 Dec 2021 18:50:39 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36504.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 14 Dec 2021 18:50:39 +0800
Received: from localhost.localdomain (172.22.233.22) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 14 Dec 2021 18:50:38 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt5682: fix the wrong jack type detected
Date: Tue, 14 Dec 2021 18:50:33 +0800
Message-ID: <20211214105033.471-1-derek.fang@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.233.22]
X-ClientProxiedBy: RTEXH36504.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 12/14/2021 10:17:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzEyLzE0IKRXpMggMDg6MDQ6MDA=?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36504.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
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

Some powers were changed during the jack insert detection
and clk's enable/disable in CCF.
If in parallel, the influence has a chance to detect
the wrong jack type, so add a lock.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt5682.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 5224123d0d3b..b34a8542077d 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -929,6 +929,8 @@ int rt5682_headset_detect(struct snd_soc_component *component, int jack_insert)
 	unsigned int val, count;
 
 	if (jack_insert) {
+		snd_soc_dapm_mutex_lock(dapm);
+
 		snd_soc_component_update_bits(component, RT5682_PWR_ANLG_1,
 			RT5682_PWR_VREF2 | RT5682_PWR_MB,
 			RT5682_PWR_VREF2 | RT5682_PWR_MB);
@@ -979,6 +981,8 @@ int rt5682_headset_detect(struct snd_soc_component *component, int jack_insert)
 		snd_soc_component_update_bits(component, RT5682_MICBIAS_2,
 			RT5682_PWR_CLK25M_MASK | RT5682_PWR_CLK1M_MASK,
 			RT5682_PWR_CLK25M_PU | RT5682_PWR_CLK1M_PU);
+
+		snd_soc_dapm_mutex_unlock(dapm);
 	} else {
 		rt5682_enable_push_button_irq(component, false);
 		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_1,
-- 
2.17.1

