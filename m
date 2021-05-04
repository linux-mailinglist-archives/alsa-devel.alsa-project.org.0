Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E52E5372870
	for <lists+alsa-devel@lfdr.de>; Tue,  4 May 2021 12:06:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75E331695;
	Tue,  4 May 2021 12:05:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75E331695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620122785;
	bh=r3LlMTItbH+QYbe7UyXozDP8xkzWBV0z3Gbpf1vEKt4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ezH/rxa7JqAC/VGOB3WCDXHeYx5OCM8F3J9dSv3Kbsu8zbjK9n1+5VH8FDCgMXcOD
	 0Vs50F+0WN1isTkbndchCgiSYPQL1r3oLgCiONVJk/P2vD4RFhESba96oEuaU2sK/e
	 E6IMC3cjajzb51my6ewzNl4rjQqhuLEu3SuMeUBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE4A6F801F7;
	Tue,  4 May 2021 12:04:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 578DBF8021C; Tue,  4 May 2021 12:04:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5ABC3F80114
 for <alsa-devel@alsa-project.org>; Tue,  4 May 2021 12:04:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ABC3F80114
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 144A4VOQ0031342,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36502.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 144A4VOQ0031342
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 4 May 2021 18:04:31 +0800
Received: from RTEXDAG01.realtek.com.tw (172.21.6.100) by
 RTEXH36502.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 4 May 2021 18:04:30 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXDAG01.realtek.com.tw (172.21.6.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 4 May 2021 18:04:29 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt711-sdca: fix the function number of SDCA control for
 feature unit 0x1E
Date: Tue, 4 May 2021 18:04:24 +0800
Message-ID: <20210504100424.8760-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXDAG01.realtek.com.tw (172.21.6.100)
X-KSE-ServerInfo: RTEXDAG01.realtek.com.tw, 9
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzUvMyCkVaTIIDExOjQxOjAw?=
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 05/04/2021 09:51:00
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 10
X-KSE-AntiSpam-Info: Lua profiles 163446 [May 04 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: shumingf@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 445 445 d5f7ae5578b0f01c45f955a2a751ac25953290c9
X-KSE-AntiSpam-Info: {Prob_from_in_msgid}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: realtek.com:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Track_Chinese_Simplified, headers_charset}
X-KSE-AntiSpam-Info: Rate: 10
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 05/04/2021 09:54:00
X-KSE-ServerInfo: RTEXH36502.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 05/04/2021 09:46:59
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 10
X-KSE-AntiSpam-Info: Lua profiles 163446 [May 04 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: shumingf@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 445 445 d5f7ae5578b0f01c45f955a2a751ac25953290c9
X-KSE-AntiSpam-Info: {Prob_from_in_msgid}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; realtek.com:7.1.1
X-KSE-AntiSpam-Info: Rate: 10
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 05/04/2021 09:49:00
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, Shuming Fan <shumingf@realtek.com>,
 flove@realtek.com, pierre-louis.bossart@intel.com
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

The function number should be FUNC_NUM_MIC_ARRAY(0x2) for the feature unit 0x1E.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt711-sdca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index cc36739f7fcf..24a084e0b48a 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -683,13 +683,13 @@ static int rt711_sdca_set_fu1e_capture_ctl(struct rt711_sdca_priv *rt711)
 	ch_r = (rt711->fu1e_dapm_mute || rt711->fu1e_mixer_r_mute) ? 0x01 : 0x00;
 
 	err = regmap_write(rt711->regmap,
-			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU1E,
+			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_USER_FU1E,
 			RT711_SDCA_CTL_FU_MUTE, CH_L), ch_l);
 	if (err < 0)
 		return err;
 
 	err = regmap_write(rt711->regmap,
-			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU1E,
+			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_USER_FU1E,
 			RT711_SDCA_CTL_FU_MUTE, CH_R), ch_r);
 	if (err < 0)
 		return err;
-- 
2.29.0

