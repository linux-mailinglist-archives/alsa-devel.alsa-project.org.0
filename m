Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7266532C
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2019 10:29:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B85916C1;
	Thu, 11 Jul 2019 10:28:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B85916C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562833740;
	bh=7GjH31oW7HadDvkZugshcvm294I/BvZFnYwk1UY/AXU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A9XoRgYyY/dIj/rhd4menWh6xjOkGQ7Ve/mrahLcAF9iFXrn1Z2beJMcSFwNPqzZH
	 cIAXRUxEbvPUFnwmibB+JpAa7dl10enS6qA5yA74226NayWb+KGDYoJ2QZE74N+934
	 VnlZu2i0MZAkx/X81z10qwWA3Tr4a58dZlsbHMhE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F63FF80308;
	Thu, 11 Jul 2019 10:27:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33688F80306; Thu, 11 Jul 2019 10:23:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16CCEF800D8
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 10:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16CCEF800D8
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x6B8MRB1022881,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x6B8MRB1022881
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 11 Jul 2019 16:22:27 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCASV01.realtek.com.tw (172.21.6.18) with Microsoft SMTP Server id
 14.3.439.0; Thu, 11 Jul 2019 16:22:26 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Thu, 11 Jul 2019 16:22:14 +0800
Message-ID: <20190711082214.8142-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, Shuming Fan <shumingf@realtek.com>, derek.fang@realtek.com,
 sathya.prakash.m.r@intel.com, naveen.m@intel.com, mingjane_hsieh@realtek.com,
 flove@realtek.com
Subject: [alsa-devel] [PATCH 1/2] ASoC: rt1011: fix DC calibration offset
	not applying
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

There are two issues to fix:
- DC offset calibration data will be reset after stopping playback.
- DC offset calibration data should be applied in the initial setting.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1011.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 5605b660f4bf..0a6ff13d76e1 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -39,7 +39,7 @@ static const struct reg_sequence init_list[] = {
 	{ RT1011_POWER_9, 0xa840 },
 
 	{ RT1011_ADC_SET_5, 0x0a20 },
-	{ RT1011_DAC_SET_2, 0xa232 },
+	{ RT1011_DAC_SET_2, 0xa032 },
 	{ RT1011_ADC_SET_1, 0x2925 },
 
 	{ RT1011_SPK_PRO_DC_DET_1, 0xb00c },
@@ -1917,7 +1917,7 @@ static int rt1011_set_bias_level(struct snd_soc_component *component,
 		snd_soc_component_write(component,
 			RT1011_SYSTEM_RESET_2, 0x0000);
 		snd_soc_component_write(component,
-			RT1011_SYSTEM_RESET_3, 0x0000);
+			RT1011_SYSTEM_RESET_3, 0x0001);
 		snd_soc_component_write(component,
 			RT1011_SYSTEM_RESET_1, 0x003f);
 		snd_soc_component_write(component,
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
