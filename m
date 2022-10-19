Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A61E4604080
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 11:59:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 847568359;
	Wed, 19 Oct 2022 11:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 847568359
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666173582;
	bh=JLF+HHVZmsrCrKk3A+N19/nh2Gj6qgA0Vfxh+uJI7eI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=N7N1fO5PWtIJW2tVqwPyz2rrrIRaxl7EPZfN5hfMQfoBbC4ER1kpL5Ld36t7BBwNJ
	 HXNT54C2/Ss0JfEolz4nEFQLCkOrciN4k/uCeUsUdNmwvnOULLhC0ep1EE2JDh89fj
	 15TWFibHX4iQW1pdOnOQFSmePZrTh7ag5wxnhCmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2619CF804F1;
	Wed, 19 Oct 2022 11:58:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92C6EF804F1; Wed, 19 Oct 2022 11:58:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 by alsa1.perex.cz (Postfix) with ESMTP id 805D7F804CC
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 11:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 805D7F804CC
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 29J9v3Ti9007027,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (smtpsrv.realtek.com[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 29J9v3Ti9007027
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Wed, 19 Oct 2022 17:57:04 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Wed, 19 Oct 2022 17:57:35 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Wed, 19 Oct 2022 17:57:35 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: rt1308-sdw: update the preset settings
Date: Wed, 19 Oct 2022 17:57:31 +0800
Message-ID: <20221019095731.31101-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/19/2022 09:31:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzEwLzE5IKRXpMggMDc6Mjg6MDA=?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, bard.liao@intel.com,
 Shuming Fan <shumingf@realtek.com>, flove@realtek.com,
 pierre-louis.bossart@intel.com
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

This patch updates the pad control and checks the
hardware version to set the different preset settings.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt1308-sdw.c | 17 ++++++++++++++---
 sound/soc/codecs/rt1308-sdw.h |  1 +
 sound/soc/codecs/rt1308.h     |  5 +++++
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 5c29416aa781..f99aed353f10 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -50,6 +50,7 @@ static bool rt1308_volatile_register(struct device *dev, unsigned int reg)
 	case 0x3008:
 	case 0x300a:
 	case 0xc000:
+	case 0xc710:
 	case 0xc860 ... 0xc863:
 	case 0xc870 ... 0xc873:
 		return true;
@@ -200,6 +201,7 @@ static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(dev);
 	int ret = 0;
+	unsigned int tmp;
 
 	if (rt1308->hw_init)
 		return 0;
@@ -231,6 +233,10 @@ static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 	/* sw reset */
 	regmap_write(rt1308->regmap, RT1308_SDW_RESET, 0);
 
+	regmap_read(rt1308->regmap, 0xc710, &tmp);
+	rt1308->hw_ver = tmp;
+	dev_dbg(dev, "%s, hw_ver=0x%x\n", __func__, rt1308->hw_ver);
+
 	/* initial settings */
 	regmap_write(rt1308->regmap, 0xc103, 0xc0);
 	regmap_write(rt1308->regmap, 0xc030, 0x17);
@@ -246,8 +252,14 @@ static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 	regmap_write(rt1308->regmap, 0xc062, 0x05);
 	regmap_write(rt1308->regmap, 0xc171, 0x07);
 	regmap_write(rt1308->regmap, 0xc173, 0x0d);
-	regmap_write(rt1308->regmap, 0xc311, 0x7f);
-	regmap_write(rt1308->regmap, 0xc900, 0x90);
+	if (rt1308->hw_ver == RT1308_VER_C) {
+		regmap_write(rt1308->regmap, 0xc311, 0x7f);
+		regmap_write(rt1308->regmap, 0xc300, 0x09);
+	} else {
+		regmap_write(rt1308->regmap, 0xc311, 0x4f);
+		regmap_write(rt1308->regmap, 0xc300, 0x0b);
+	}
+	regmap_write(rt1308->regmap, 0xc900, 0x5a);
 	regmap_write(rt1308->regmap, 0xc1a0, 0x84);
 	regmap_write(rt1308->regmap, 0xc1a1, 0x01);
 	regmap_write(rt1308->regmap, 0xc360, 0x78);
@@ -257,7 +269,6 @@ static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 	regmap_write(rt1308->regmap, 0xc070, 0x00);
 	regmap_write(rt1308->regmap, 0xc100, 0xd7);
 	regmap_write(rt1308->regmap, 0xc101, 0xd7);
-	regmap_write(rt1308->regmap, 0xc300, 0x09);
 
 	if (rt1308->first_hw_init) {
 		regcache_cache_bypass(rt1308->regmap, false);
diff --git a/sound/soc/codecs/rt1308-sdw.h b/sound/soc/codecs/rt1308-sdw.h
index b5f231f708cb..62ce27799307 100644
--- a/sound/soc/codecs/rt1308-sdw.h
+++ b/sound/soc/codecs/rt1308-sdw.h
@@ -165,6 +165,7 @@ struct rt1308_sdw_priv {
 	bool first_hw_init;
 	int rx_mask;
 	int slots;
+	int hw_ver;
 };
 
 struct sdw_stream_data {
diff --git a/sound/soc/codecs/rt1308.h b/sound/soc/codecs/rt1308.h
index ff7c423e879e..d3a0f91630ca 100644
--- a/sound/soc/codecs/rt1308.h
+++ b/sound/soc/codecs/rt1308.h
@@ -286,4 +286,9 @@ enum {
 	RT1308_AIFS
 };
 
+enum rt1308_hw_ver {
+	RT1308_VER_C = 2,
+	RT1308_VER_D
+};
+
 #endif		/* end of _RT1308_H_ */
-- 
2.37.0

