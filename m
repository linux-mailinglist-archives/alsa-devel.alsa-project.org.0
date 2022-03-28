Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 147524E8D81
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Mar 2022 07:35:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C312E0F;
	Mon, 28 Mar 2022 07:34:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C312E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648445712;
	bh=7lfp1574EtNcMDPVRba0fpCai7fsF29uNUXKx71RsbY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nXiF+AWoseaCQPHDYMDASbZCxwDITuLIASOHw6siYo7W6WIwW9U7GugY73RgvP6fG
	 MGZ9z077G5M4xu4XAeL91ES5LvsjGLTEmZkVosmC+sBOeqivB1o4Pe3DdGwapzm2tF
	 uclAbBebqzT4+4GCt1OBBKhc/rnmmZYGZu2wZb0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6F5BF800CB;
	Mon, 28 Mar 2022 07:34:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81523F800CB; Mon, 28 Mar 2022 07:34:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8138BF80121
 for <alsa-devel@alsa-project.org>; Mon, 28 Mar 2022 07:33:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8138BF80121
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 22S5XjwJ6013957,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36504.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 22S5XjwJ6013957
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 28 Mar 2022 13:33:45 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36504.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 28 Mar 2022 13:33:44 +0800
Received: from derek-PORTEGE-R930.realtek.com.tw (172.22.102.119) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 28 Mar 2022 13:33:44 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH v2] ASoC: rt5682s: Separate the regulator consumer controls
Date: Mon, 28 Mar 2022 13:33:38 +0800
Message-ID: <20220328053338.21441-1-derek.fang@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.102.119]
X-ClientProxiedBy: RTEXH36504.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 03/28/2022 05:21:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzMvMjggpFekyCAwMjozOTowMA==?=
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

Control the regulators separately instead of using regulator_bulk to
accord to the timing request in the datasheet.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt5682s.c | 27 ++++++++++++++++++++++-----
 sound/soc/codecs/rt5682s.h |  6 +++++-
 2 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 1cba8ec7cedb..7e4ac6560dee 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -42,8 +42,8 @@ static const struct rt5682s_platform_data i2s_default_platform_data = {
 };
 
 static const char *rt5682s_supply_names[RT5682S_NUM_SUPPLIES] = {
-	"AVDD",
-	"MICVDD",
+	[RT5682S_SUPPLY_AVDD] = "AVDD",
+	[RT5682S_SUPPLY_MICVDD] = "MICVDD",
 };
 
 static const struct reg_sequence patch_list[] = {
@@ -3025,8 +3025,18 @@ static struct snd_soc_dai_driver rt5682s_dai[] = {
 static void rt5682s_i2c_disable_regulators(void *data)
 {
 	struct rt5682s_priv *rt5682s = data;
+	struct device *dev = regmap_get_device(rt5682s->regmap);
+	int ret;
+
+	ret = regulator_disable(rt5682s->supplies[RT5682S_SUPPLY_AVDD].consumer);
+	if (ret)
+		dev_err(dev, "Failed to disable supply AVDD: %d\n", ret);
 
-	regulator_bulk_disable(ARRAY_SIZE(rt5682s->supplies), rt5682s->supplies);
+	usleep_range(1000, 1500);
+
+	ret = regulator_disable(rt5682s->supplies[RT5682S_SUPPLY_MICVDD].consumer);
+	if (ret)
+		dev_err(dev, "Failed to disable supply MICVDD: %d\n", ret);
 }
 
 static int rt5682s_i2c_probe(struct i2c_client *i2c,
@@ -3071,9 +3081,16 @@ static int rt5682s_i2c_probe(struct i2c_client *i2c,
 	if (ret)
 		return ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(rt5682s->supplies), rt5682s->supplies);
+	ret = regulator_enable(rt5682s->supplies[RT5682S_SUPPLY_MICVDD].consumer);
+	if (ret) {
+		dev_err(&i2c->dev, "Failed to enable supply MICVDD: %d\n", ret);
+		return ret;
+	}
+	usleep_range(1000, 1500);
+
+	ret = regulator_enable(rt5682s->supplies[RT5682S_SUPPLY_AVDD].consumer);
 	if (ret) {
-		dev_err(&i2c->dev, "Failed to enable supplies: %d\n", ret);
+		dev_err(&i2c->dev, "Failed to enable supply AVDD: %d\n", ret);
 		return ret;
 	}
 
diff --git a/sound/soc/codecs/rt5682s.h b/sound/soc/codecs/rt5682s.h
index 397a2531b6f6..7353831c73dd 100644
--- a/sound/soc/codecs/rt5682s.h
+++ b/sound/soc/codecs/rt5682s.h
@@ -1434,7 +1434,11 @@ struct pll_calc_map {
 	bool sel_ps;
 };
 
-#define RT5682S_NUM_SUPPLIES 2
+enum {
+	RT5682S_SUPPLY_AVDD,
+	RT5682S_SUPPLY_MICVDD,
+	RT5682S_NUM_SUPPLIES,
+};
 
 struct rt5682s_priv {
 	struct snd_soc_component *component;
-- 
2.17.1

