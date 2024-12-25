Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A929B9FC495
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Dec 2024 10:44:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DA9C6029F;
	Wed, 25 Dec 2024 10:44:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DA9C6029F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1735119860;
	bh=vMNFaRLVOigzqY+wFNJmAnlVWLhBh3m7Q8doKQ95mIg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EQm6F+zRBybXr8xgHRyexUT93saD36dpt6M4f2Yrjh5gUwW4jbIDnOxDL8HxWbx8W
	 vIygf9sPbgxlR4oCjpq8xbIoFPY9r6aqvHS+11tPpoUThtV6JBJoL6Dwr0MdZ+ZVn5
	 3sIOsErNNpZt7GGdfUuo6l1LD7rpz8ew6JKFX0no=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EB43F805C0; Wed, 25 Dec 2024 10:43:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECBC0F805C0;
	Wed, 25 Dec 2024 10:43:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CFBFF80269; Wed, 25 Dec 2024 10:43:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CB8F1F800B0
	for <alsa-devel@alsa-project.org>; Wed, 25 Dec 2024 10:43:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB8F1F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=temperror header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256
 header.s=dkim header.b=dSdi/78l
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 4BP9hNuE5708911,
 This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1735119803; bh=vMNFaRLVOigzqY+wFNJmAnlVWLhBh3m7Q8doKQ95mIg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=dSdi/78l0nMdox837OETxlt8aXZR/RTOMXHQiHUn3B9sid2U30nanAomtjO6gbSu4
	 /NnpQ+xaEpG54XxO1CY9jJ2IPKI8P0aftB+TcoRMRqlP8kRajwboVzMEndwj+YXZ+H
	 l6fKUBAYG0LUA4elyYH+8nS1IwXL7sBkW+gNyvgAw3O/UZobA9EiqPdgIdgn2dWNz2
	 Zr8IHA67WN7KMQqjOlsaAJJ/CFlB8bYukYKdEdotBYovwgNoRawTGnCkPU0iKgJhp4
	 9BzzUCrqb3DexI/tV3qemI8uoazt2AJjkI2CPYCZK8aSgx+v2fyFHTOsbvoP9MkC87
	 mv5oMZiWjwSMg==
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 4BP9hNuE5708911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Dec 2024 17:43:23 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 25 Dec 2024 17:43:24 +0800
Received: from localhost.localdomain (172.22.102.113) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 25 Dec 2024 17:43:23 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <shumingf@realtek.com>, Derek Fang <derek.fang@realtek.com>
Subject: [PATCH] ASoC: rt5682: Support the ALC5682I-VE codec
Date: Wed, 25 Dec 2024 17:43:07 +0800
Message-ID: <20241225094307.3678837-1-derek.fang@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.113]
X-ClientProxiedBy: RTEXH36506.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: YSSPBB5PN22WOLK3TJJQJH4L7TX3Q2KU
X-Message-ID-Hash: YSSPBB5PN22WOLK3TJJQJH4L7TX3Q2KU
X-MailFrom: derek.fang@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YSSPBB5PN22WOLK3TJJQJH4L7TX3Q2KU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Derek Fang <derek.fang@realtek.com>

The ALC5682I-VD and ALC5682I-VE use the same I2C
codec driver with different calibration settings.
This patch aims to handle their differences.

Signed-off-by: Derek Fang <derek.fang@realtek.com>

diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index ff9e14fad0cd..a8820435d1e0 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -186,6 +186,12 @@ static int rt5682_i2c_probe(struct i2c_client *i2c)
 		return -ENODEV;
 	}
 
+	regmap_read(rt5682->regmap, RT5682_INT_DEVICE_ID, &val);
+	if (val == 0x6956) {
+		dev_dbg(&i2c->dev, "ALC5682I-VE device\n");
+		rt5682->ve_ic = true;
+	}
+
 	mutex_init(&rt5682->calibrate_mutex);
 	rt5682_calibrate(rt5682);
 
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index aa163ec40862..b4d72fc4a44d 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -395,6 +395,7 @@ bool rt5682_volatile_register(struct device *dev, unsigned int reg)
 	case RT5682_4BTN_IL_CMD_1:
 	case RT5682_AJD1_CTRL:
 	case RT5682_HP_CALIB_CTRL_1:
+	case RT5682_INT_DEVICE_ID:
 	case RT5682_DEVICE_ID:
 	case RT5682_I2C_MODE:
 	case RT5682_HP_CALIB_CTRL_10:
@@ -419,6 +420,7 @@ bool rt5682_readable_register(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case RT5682_RESET:
+	case RT5682_INT_DEVICE_ID:
 	case RT5682_VERSION_ID:
 	case RT5682_VENDOR_ID:
 	case RT5682_DEVICE_ID:
@@ -3139,7 +3141,10 @@ void rt5682_calibrate(struct rt5682_priv *rt5682)
 	regmap_write(rt5682->regmap, RT5682_PWR_DIG_1, 0x0100);
 	regmap_write(rt5682->regmap, RT5682_HP_IMP_SENS_CTRL_19, 0x3800);
 	regmap_write(rt5682->regmap, RT5682_CHOP_DAC, 0x3000);
-	regmap_write(rt5682->regmap, RT5682_CALIB_ADC_CTRL, 0x7005);
+	if (rt5682->ve_ic)
+		regmap_write(rt5682->regmap, RT5682_CHOP_ADC, 0x7005);
+	else
+		regmap_write(rt5682->regmap, RT5682_CALIB_ADC_CTRL, 0x7005);
 	regmap_write(rt5682->regmap, RT5682_STO1_ADC_MIXER, 0x686c);
 	regmap_write(rt5682->regmap, RT5682_CAL_REC, 0x0d0d);
 	regmap_write(rt5682->regmap, RT5682_HP_CALIB_CTRL_2, 0x0321);
@@ -3168,7 +3173,10 @@ void rt5682_calibrate(struct rt5682_priv *rt5682)
 	regmap_write(rt5682->regmap, RT5682_GLB_CLK, 0x0000);
 	regmap_write(rt5682->regmap, RT5682_PWR_DIG_1, 0x0000);
 	regmap_write(rt5682->regmap, RT5682_CHOP_DAC, 0x2000);
-	regmap_write(rt5682->regmap, RT5682_CALIB_ADC_CTRL, 0x2005);
+	if (rt5682->ve_ic)
+		regmap_write(rt5682->regmap, RT5682_CHOP_ADC, 0x2005);
+	else
+		regmap_write(rt5682->regmap, RT5682_CALIB_ADC_CTRL, 0x2005);
 	regmap_write(rt5682->regmap, RT5682_STO1_ADC_MIXER, 0xc0c4);
 	regmap_write(rt5682->regmap, RT5682_CAL_REC, 0x0c0c);
 
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index b2d9e87af259..de43a5d99403 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -22,6 +22,7 @@
 
 /* Info */
 #define RT5682_RESET				0x0000
+#define RT5682_INT_DEVICE_ID			0x00f9
 #define RT5682_VERSION_ID			0x00fd
 #define RT5682_VENDOR_ID			0x00fe
 #define RT5682_DEVICE_ID			0x00ff
@@ -1446,6 +1447,7 @@ struct rt5682_priv {
 	bool hw_init;
 	bool first_hw_init;
 	bool is_sdw;
+	bool ve_ic;
 
 #ifdef CONFIG_COMMON_CLK
 	struct clk_hw dai_clks_hw[RT5682_DAI_NUM_CLKS];
-- 
2.34.1

