Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E01464B17
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 10:58:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46CF52585;
	Wed,  1 Dec 2021 10:57:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46CF52585
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638352699;
	bh=/c3k/ImVdbOJuhNSJnVSZMzIfwOgZctQU0u6d+isWRM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Yebu1hOF9h30IPj2VHJ0HBpJdAi5cXQZPeUDLJtJrYqc1A2bPxPCo8kWCCVfIUAEK
	 Wg/ljjruqxhIoT9hweOeGrVejFzsPVLkpeHDk0B50aWTY4xttGJoh2fMgAiK8M7Ana
	 9ngXmIWz7muEPiDG5uvbYJ3B074L9C4CJy3biJMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9CE9F80249;
	Wed,  1 Dec 2021 10:57:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 911EEF80246; Wed,  1 Dec 2021 10:56:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8A6BF800EE
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 10:56:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8A6BF800EE
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1B19uZyY5023469,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 1B19uZyY5023469
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 1 Dec 2021 17:56:35 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 1 Dec 2021 17:56:35 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 1 Dec 2021 17:56:34 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt5640: Fix the wrong state of the JD in the HDA header
Date: Wed, 1 Dec 2021 17:56:29 +0800
Message-ID: <20211201095629.21818-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36504.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 12/01/2021 09:31:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzEyLzEgpFekyCAwNjo1NDowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
Cc: Oder Chiou <oder_chiou@realtek.com>, jack.yu@realtek.com,
 alsa-devel@alsa-project.org, jacal_tseng@realtek.com, danielz@nvidia.com,
 spujar@nvidia.com, albertchen@realtek.com, derek.fang@realtek.com,
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

The patch fixes the wrong state of the JD with 1M pull up resistor in the
HDA header.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 sound/soc/codecs/rt5640.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index 08b37878cb00..f3659b14c74e 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -1973,7 +1973,7 @@ static int rt5640_set_bias_level(struct snd_soc_component *component,
 				RT5640_PWR_FV1 | RT5640_PWR_FV2,
 				RT5640_PWR_FV1 | RT5640_PWR_FV2);
 			snd_soc_component_update_bits(component, RT5640_DUMMY1,
-						0x0301, 0x0301);
+						0x1, 0x1);
 			snd_soc_component_update_bits(component, RT5640_MICBIAS,
 						0x0030, 0x0030);
 		}
@@ -2533,7 +2533,7 @@ static void rt5640_enable_hda_jack_detect(
 	snd_soc_component_update_bits(component, RT5640_GPIO_CTRL3,
 		RT5640_GP1_PF_MASK, RT5640_GP1_PF_OUT);
 
-	snd_soc_component_update_bits(component, RT5640_DUMMY1, 0x700, 0x300);
+	snd_soc_component_update_bits(component, RT5640_DUMMY1, 0x400, 0x0);
 
 	rt5640->jack = jack;
 
@@ -2651,13 +2651,16 @@ static int rt5640_probe(struct snd_soc_component *component)
 
 	if (device_property_read_u32(component->dev,
 				     "realtek,jack-detect-source", &val) == 0) {
-		if (val <= RT5640_JD_SRC_GPIO4)
+		if (val <= RT5640_JD_SRC_GPIO4) {
 			rt5640->jd_src = val << RT5640_JD_SFT;
-		else if (val == RT5640_JD_SRC_HDA_HEADER)
+		} else if (val == RT5640_JD_SRC_HDA_HEADER) {
 			rt5640->jd_src = RT5640_JD_SRC_HDA_HEADER;
-		else
+			snd_soc_component_update_bits(component, RT5640_DUMMY1,
+				0x0300, 0x0);
+		} else {
 			dev_warn(component->dev, "Warning: Invalid jack-detect-source value: %d, leaving jack-detect disabled\n",
 				 val);
+		}
 	}
 
 	if (!device_property_read_bool(component->dev, "realtek,jack-detect-not-inverted"))
-- 
2.34.1

