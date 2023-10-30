Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 536707DB861
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 11:38:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 426CCAE9;
	Mon, 30 Oct 2023 11:37:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 426CCAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698662287;
	bh=QOSGZdiYo3StJZ3rn8b/EwEaZCxPpK9VQ5PWqdO1KIc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jziETZJ1BSWuC4tbtNEha76yttKUvQtS7Fdnp7rQ/wOezB60VGApGPCKq/SwGDTOq
	 EPZSWPRmPr8nFWbdqbJG7d8e1AQWiYjMwksAWcfxLb3PiW/aaAxLlYh4kpF68Wk+og
	 ZoL2NNgsse+C82mRv6ik9xNeHtww9EiXqJ0AfM9E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99774F80431; Mon, 30 Oct 2023 11:37:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37D20F80166;
	Mon, 30 Oct 2023 11:37:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E95AF8016D; Mon, 30 Oct 2023 11:37:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0603AF80152
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 11:37:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0603AF80152
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 39UAapwU73008100,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.93/5.92) with ESMTPS id 39UAapwU73008100
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Oct 2023 18:36:51 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Mon, 30 Oct 2023 18:36:51 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Mon, 30 Oct 2023 18:36:51 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <bard.liao@intel.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt712-sdca: fix speaker route missing issue
Date: Mon, 30 Oct 2023 18:36:44 +0800
Message-ID: <20231030103644.1787948-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: RVJWN525CXR7SXO2I37U4KCDDOHHBYJW
X-Message-ID-Hash: RVJWN525CXR7SXO2I37U4KCDDOHHBYJW
X-MailFrom: shumingf@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RVJWN525CXR7SXO2I37U4KCDDOHHBYJW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

Sometimes the codec probe would be called earlier than the hardware initialization.
Therefore, the speaker route should be added before the the first_hw_init check.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt712-sdca.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 7077ff6ba1f4..6954fbe7ec5f 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -963,13 +963,6 @@ static int rt712_sdca_probe(struct snd_soc_component *component)
 	rt712_sdca_parse_dt(rt712, &rt712->slave->dev);
 	rt712->component = component;
 
-	if (!rt712->first_hw_init)
-		return 0;
-
-	ret = pm_runtime_resume(component->dev);
-	if (ret < 0 && ret != -EACCES)
-		return ret;
-
 	/* add SPK route */
 	if (rt712->hw_id != RT712_DEV_ID_713) {
 		snd_soc_add_component_controls(component,
@@ -980,6 +973,13 @@ static int rt712_sdca_probe(struct snd_soc_component *component)
 			rt712_sdca_spk_dapm_routes, ARRAY_SIZE(rt712_sdca_spk_dapm_routes));
 	}
 
+	if (!rt712->first_hw_init)
+		return 0;
+
+	ret = pm_runtime_resume(component->dev);
+	if (ret < 0 && ret != -EACCES)
+		return ret;
+
 	return 0;
 }
 
-- 
2.34.1

