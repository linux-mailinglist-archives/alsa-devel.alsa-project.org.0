Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E8D2F0F17
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 10:28:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41BA016D0;
	Mon, 11 Jan 2021 10:28:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41BA016D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610357330;
	bh=PLnRmRO7r5IjUbXEs8/sgiZDTPVd/k4wSpbYr+BccFA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FmSNt74TbAdq5tU6nDhaon6zBhowkBlFWSzZm6jkMoTWgnBQfDN0cpf/BxyF/9OlH
	 3sG3nY0Z2Juf9BvuI2v8SkJTRswNj9VO8Kgg9T35dykLbUwubR8bjZYalD5X2+NAKi
	 7ZC942cWcsMDlrTHykyNwtt82Q5d4dyKshBijPxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4FE0F8026B;
	Mon, 11 Jan 2021 10:27:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ACD3F8025F; Mon, 11 Jan 2021 10:27:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD3D2F800BE
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 10:27:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD3D2F800BE
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 10B9RlMX2022320,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 10B9RlMX2022320
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 11 Jan 2021 17:27:47 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 11 Jan 2021 17:27:46 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: rt5682: fix getting the wrong device id when the
 suspend_stress_test
Date: Mon, 11 Jan 2021 17:27:40 +0800
Message-ID: <20210111092740.9128-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, bard.liao@intel.com,
 Shuming Fan <shumingf@realtek.com>, naveen.m@intel.com, flove@realtek.com
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

This patch will be the workaround to fix getting the wrong device ID on the rare chance.
It seems like something unstable when the system resumes. e.g. the bus clock
This patch tries to read the device ID to check several times.
After the test, the driver will get the correct device ID the second time.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt5682-sdw.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 4d707e854875..69f046bba67a 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -375,18 +375,12 @@ static int rt5682_sdw_init(struct device *dev, struct regmap *regmap,
 static int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
-	int ret = 0;
+	int ret = 0, loop = 10;
 	unsigned int val;
 
 	if (rt5682->hw_init)
 		return 0;
 
-	regmap_read(rt5682->regmap, RT5682_DEVICE_ID, &val);
-	if (val != DEVICE_ID) {
-		dev_err(dev, "Device with ID register %x is not rt5682\n", val);
-		return -ENODEV;
-	}
-
 	/*
 	 * PM runtime is only enabled when a Slave reports as Attached
 	 */
@@ -406,6 +400,19 @@ static int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 
 	pm_runtime_get_noresume(&slave->dev);
 
+	while (loop > 0) {
+		regmap_read(rt5682->regmap, RT5682_DEVICE_ID, &val);
+		if (val == DEVICE_ID)
+			break;
+		dev_warn(dev, "Device with ID register %x is not rt5682\n", val);
+		usleep_range(30000, 30005);
+		loop--;
+	}
+	if (val != DEVICE_ID) {
+		dev_err(dev, "Device with ID register %x is not rt5682\n", val);
+		return -ENODEV;
+	}
+
 	if (rt5682->first_hw_init) {
 		regcache_cache_only(rt5682->regmap, false);
 		regcache_cache_bypass(rt5682->regmap, true);
-- 
2.29.0

