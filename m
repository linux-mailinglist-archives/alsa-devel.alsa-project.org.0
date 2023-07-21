Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F12D275C197
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:28:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D32DE9F;
	Fri, 21 Jul 2023 10:27:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D32DE9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689928088;
	bh=Kz9WBz1KXYep6OcTqAcHbVepccI2jxd2QSMJE0bkg30=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GFXR+zY8XgHVAOc3s0TBh9Tv/dHoeabQn1E/OjDFQpeUt7XO7QL3uvtkvDCoCGgGz
	 uMr/BPLk8Ot/NGSEbSO3DPnM0XzxwFJD/FFUDcLEsljNpu4khd3LyTcUnRhIHmQswF
	 sCzYRa6qcTmsuRm5Intub5lLsVeVDzKWZdRA076k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25E7FF80558; Fri, 21 Jul 2023 10:27:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD493F80494;
	Fri, 21 Jul 2023 10:27:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60D35F804DA; Fri, 21 Jul 2023 10:27:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id 58698F800D2
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 10:27:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58698F800D2
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 36L8QuTF2006599,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 36L8QuTF2006599
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
	Fri, 21 Jul 2023 16:26:56 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 21 Jul 2023 16:27:06 +0800
Received: from ubuntu.localdomain (172.22.102.209) by RTEXMBS01.realtek.com.tw
 (172.21.6.94) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Fri, 21 Jul
 2023 16:27:05 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, <Vijendar.Mukunda@amd.com>,
        Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 2/2] ASoC: rt711-sdca: check pin sense when system resumes
Date: Fri, 21 Jul 2023 16:27:00 +0800
Message-ID: <20230721082700.114069-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.209]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: 2QBPWRN33NFX4HIFO4X6D2RC25WAW4SY
X-Message-ID-Hash: 2QBPWRN33NFX4HIFO4X6D2RC25WAW4SY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2QBPWRN33NFX4HIFO4X6D2RC25WAW4SY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

If the jack is unplugged when the system was suspended,
the system will believe the jack exists for a while after the system resumes.
The codec needs some time, then alerts the host to detect whether the jack exists or not.
This patch wants to use the pin sense to detect whether the jack exists or not when the system resumes.
It could report the status immediately if the jack was unplugged.
It will improve the user experience.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt711-sdca-sdw.c | 18 ++++++++++++++++++
 sound/soc/codecs/rt711-sdca.c     |  2 +-
 sound/soc/codecs/rt711-sdca.h     |  2 ++
 3 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index cb27b4a98fb6..13a5316ba999 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -12,6 +12,7 @@
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <sound/jack.h>
 
 #include "rt711-sdca.h"
 #include "rt711-sdca-sdw.h"
@@ -435,6 +436,8 @@ static int __maybe_unused rt711_sdca_dev_resume(struct device *dev)
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt711_sdca_priv *rt711 = dev_get_drvdata(dev);
 	unsigned long time;
+	unsigned int pin_sense;
+	int ret;
 
 	if (!rt711->first_hw_init)
 		return 0;
@@ -457,6 +460,21 @@ static int __maybe_unused rt711_sdca_dev_resume(struct device *dev)
 	regcache_sync(rt711->regmap);
 	regcache_cache_only(rt711->mbq_regmap, false);
 	regcache_sync(rt711->mbq_regmap);
+
+	/*
+	 * detect whether jack exists or not
+	 * if the jack is unplugged, we will report it immediately
+	 * if the jack exists, it will take some time to detect, then alert the host
+	 */
+	ret = rt711_sdca_index_read(rt711, RT711_VENDOR_REG, RT711_IRQ_FLAG_TABLE2, &pin_sense);
+	pin_sense = ((pin_sense & 0x100) >> 8);
+	if (ret < 0) {
+		dev_err(&slave->dev, "Pin Sense read failed:%d\n", ret);
+		return ret;
+	}
+	if (rt711->hs_jack && !pin_sense)
+		snd_soc_jack_report(rt711->hs_jack, 0, SND_JACK_HEADSET);
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index f1a93e3ffa1c..29dce5173f90 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -42,7 +42,7 @@ static int rt711_sdca_index_write(struct rt711_sdca_priv *rt711,
 	return ret;
 }
 
-static int rt711_sdca_index_read(struct rt711_sdca_priv *rt711,
+int rt711_sdca_index_read(struct rt711_sdca_priv *rt711,
 		unsigned int nid, unsigned int reg, unsigned int *value)
 {
 	int ret;
diff --git a/sound/soc/codecs/rt711-sdca.h b/sound/soc/codecs/rt711-sdca.h
index 11d421e8ab2b..aeedb38a0260 100644
--- a/sound/soc/codecs/rt711-sdca.h
+++ b/sound/soc/codecs/rt711-sdca.h
@@ -240,4 +240,6 @@ int rt711_sdca_init(struct device *dev, struct regmap *regmap,
 	       struct regmap *mbq_regmap, struct sdw_slave *slave);
 
 int rt711_sdca_jack_detect(struct rt711_sdca_priv *rt711, bool *hp, bool *mic);
+int rt711_sdca_index_read(struct rt711_sdca_priv *rt711,
+		unsigned int nid, unsigned int reg, unsigned int *value);
 #endif /* __RT711_SDCA_H__ */
-- 
2.34.1

