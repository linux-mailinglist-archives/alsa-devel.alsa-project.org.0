Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 014B475C195
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:27:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DCB2E9C;
	Fri, 21 Jul 2023 10:27:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DCB2E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689928077;
	bh=1PmjbTeRGiRPYo8AJ6R/wBAbXmmLjmnNBE0auP1OJ1w=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OCMHp+KFE+nrtHAhdDXU2nad3WUToyN/WM4W4K4jQZcigtpJs+CPPgk8QhtPZaB9S
	 TY8Igx6y6rq7Ia4H9iCay/jjNy2o7tVxLKX6YmNtr4uInfM8LSJfFNt//dsP/DOKom
	 CdkZ7uirMR9e8rBaJ1UUmKqPvJ+Tm9zene40CV4Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28021F80544; Fri, 21 Jul 2023 10:27:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69604F8047D;
	Fri, 21 Jul 2023 10:27:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23BC3F80527; Fri, 21 Jul 2023 10:27:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BECAF800D2
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 10:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BECAF800D2
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 36L8QhJtA006516,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 36L8QhJtA006516
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Fri, 21 Jul 2023 16:26:43 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 21 Jul 2023 16:26:52 +0800
Received: from ubuntu.localdomain (172.22.102.209) by RTEXMBS01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 21 Jul
 2023 16:26:51 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <Vijendar.Mukunda@amd.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 1/2] ASoC: rt711-sdca: fix key tone missing
Date: Fri, 21 Jul 2023 16:26:45 +0800
Message-ID: <20230721082645.114050-1-shumingf@realtek.com>
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
Message-ID-Hash: JIPXP2S5OKBQ6NMXXSCQXHFUP4GOVCEQ
X-Message-ID-Hash: JIPXP2S5OKBQ6NMXXSCQXHFUP4GOVCEQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JIPXP2S5OKBQ6NMXXSCQXHFUP4GOVCEQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

This patch uses a bit to check whether the system was hibernated or not.
It could avoid repeating the recalibration and CBJ detection.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt711-sdca-sdw.c |  1 +
 sound/soc/codecs/rt711-sdca.c     | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index 119e1f9605d7..cb27b4a98fb6 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -101,6 +101,7 @@ static bool rt711_sdca_mbq_volatile_register(struct device *dev, unsigned int re
 	case 0x2000080:
 	case 0x2000081:
 	case 0x2000083:
+	case 0x200009f:
 	case 0x5800000:
 	case 0x5800001:
 	case 0x5f00001:
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 07640d2f6e56..f1a93e3ffa1c 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -488,6 +488,12 @@ static void rt711_sdca_jack_init(struct rt711_sdca_priv *rt711)
 		/* set SCP_SDCA_IntMask2[0]=1 */
 		sdw_write_no_pm(rt711->slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
 		dev_dbg(&rt711->slave->dev, "in %s enable\n", __func__);
+
+		/* trigger GE interrupt */
+		rt711_sdca_index_update_bits(rt711, RT711_VENDOR_HDA_CTL,
+			RT711_GE_MODE_RELATED_CTL, 0x0080, 0x0080);
+		rt711_sdca_index_update_bits(rt711, RT711_VENDOR_HDA_CTL,
+			RT711_GE_MODE_RELATED_CTL, 0x0080, 0x0000);
 	} else {
 		/* disable HID 1/2 event */
 		rt711_sdca_index_update_bits(rt711, RT711_VENDOR_HDA_CTL,
@@ -1493,7 +1499,7 @@ int rt711_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct rt711_sdca_priv *rt711 = dev_get_drvdata(dev);
 	int ret = 0;
-	unsigned int val;
+	unsigned int val, hibernation_flag;
 
 	rt711->disable_irq = false;
 
@@ -1525,6 +1531,11 @@ int rt711_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 
 	pm_runtime_get_noresume(&slave->dev);
 
+	rt711_sdca_index_read(rt711, RT711_VENDOR_REG, 0x9f, &val);
+	hibernation_flag = (val >> 8);
+	if (hibernation_flag)
+		goto _preset_ready_;
+
 	rt711_sdca_reset(rt711);
 
 	rt711_sdca_index_read(rt711, RT711_VENDOR_REG, RT711_JD_PRODUCT_NUM, &val);
@@ -1559,6 +1570,10 @@ int rt711_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	if (rt711->hs_jack)
 		rt711_sdca_jack_init(rt711);
 
+	if (!hibernation_flag)
+		rt711_sdca_index_update_bits(rt711, RT711_VENDOR_REG, 0x9f, 0x0100, 0x0100);
+
+_preset_ready_:
 	if (rt711->first_hw_init) {
 		regcache_cache_bypass(rt711->regmap, false);
 		regcache_mark_dirty(rt711->regmap);
-- 
2.34.1

