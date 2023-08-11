Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2C3778A37
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 11:40:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85AF8823;
	Fri, 11 Aug 2023 11:39:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85AF8823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691746815;
	bh=M7Oayi45j3x3KjxIr0vdCCBaF37/lHSmySix9fDkocA=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=C9c0uiXuIjJ8KgwluKUWdR6+T511FdhBfaXZpZsQGTOQmajU5FJxRkLSINvt4t+pq
	 HrK5vRou2JZ5caKc0EFBpHmhEjlVZgoyNLkapSA4q5OR9AfLQvqD2B7STPE+0Jiq3K
	 fWe+V9SRTPB5O10uyTWfIJSzkse9R3poBcOWF4MQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DD641F80552; Fri, 11 Aug 2023 11:39:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49307F80134;
	Fri, 11 Aug 2023 11:39:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36116F80166; Fri, 11 Aug 2023 11:39:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id 5943FF800F4
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 11:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5943FF800F4
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 37B9ceNgB031258,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 37B9ceNgB031258
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Aug 2023 17:38:40 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 11 Aug 2023 17:38:58 +0800
Received: from ubuntu.localdomain (172.22.102.209) by RTEXMBS01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 11 Aug
 2023 17:38:58 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <pierre-louis.bossart@intel.com>,
        <jfmiranda@gmail.com>, Shuming Fan
	<shumingf@realtek.com>
Subject: [PATCH] ASoC: rt1308-sdw: fix random louder sound
Date: Fri, 11 Aug 2023 17:38:22 +0800
Message-ID: <20230811093822.37573-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.209]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: 7I4LEEK3VXGOOKFMT3CQMAVXS7F6LWOK
X-Message-ID-Hash: 7I4LEEK3VXGOOKFMT3CQMAVXS7F6LWOK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7I4LEEK3VXGOOKFMT3CQMAVXS7F6LWOK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

This patch uses a vendor register to check whether the system hibernated ever.
The driver will only set the preset when the driver brings up or the system hibernated.
It will avoid the unknown issue that makes the speaker output louder and can't control the volume.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1308-sdw.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index c98cd7abef6a..63d4abf964d4 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -52,6 +52,7 @@ static bool rt1308_volatile_register(struct device *dev, unsigned int reg)
 	case 0x300a:
 	case 0xc000:
 	case 0xc710:
+	case 0xcf01:
 	case 0xc860 ... 0xc863:
 	case 0xc870 ... 0xc873:
 		return true;
@@ -213,7 +214,7 @@ static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(dev);
 	int ret = 0;
-	unsigned int tmp;
+	unsigned int tmp, hibernation_flag;
 
 	if (rt1308->hw_init)
 		return 0;
@@ -231,6 +232,10 @@ static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 
 	pm_runtime_get_noresume(&slave->dev);
 
+	regmap_read(rt1308->regmap, 0xcf01, &hibernation_flag);
+	if ((hibernation_flag != 0x00) && rt1308->first_hw_init)
+		goto _preset_ready_;
+
 	/* sw reset */
 	regmap_write(rt1308->regmap, RT1308_SDW_RESET, 0);
 
@@ -271,6 +276,12 @@ static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 	regmap_write(rt1308->regmap, 0xc100, 0xd7);
 	regmap_write(rt1308->regmap, 0xc101, 0xd7);
 
+	/* apply BQ params */
+	rt1308_apply_bq_params(rt1308);
+
+	regmap_write(rt1308->regmap, 0xcf01, 0x01);
+
+_preset_ready_:
 	if (rt1308->first_hw_init) {
 		regcache_cache_bypass(rt1308->regmap, false);
 		regcache_mark_dirty(rt1308->regmap);
-- 
2.34.1

