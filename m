Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3707E8812F2
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 15:07:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3D6E2BDA;
	Wed, 20 Mar 2024 15:07:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3D6E2BDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710943678;
	bh=WfPXnP6t7cHKpeY26sKjr21+Kh2F1G9NyLztVt3Pd0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hG2hi6UmPnswWDfi1Q2Py131ATZ/mdmd7+E9Mg0Y1m3FPhAN/KO5bB8qRNS9GbSPy
	 pLcX03uWUrzMTHJoKrw3BUu9oPkCencD/rLjbG9ANJL1aSIXH0lCcnSZSYAwUjpoUI
	 EyiTmedXk6XX1PRN8dUzCsGSKUJsFeOl8NMMEPuo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE65EF897C3; Wed, 20 Mar 2024 15:01:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4904EF897B2;
	Wed, 20 Mar 2024 15:01:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9669FF80548; Wed, 20 Mar 2024 09:30:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail78-60.sinamail.sina.com.cn (mail78-60.sinamail.sina.com.cn
 [219.142.78.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CB0CF804E7
	for <alsa-devel@alsa-project.org>; Wed, 20 Mar 2024 09:30:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CB0CF804E7
Received: from unknown (HELO zy-virtual-machine.localdomain)([116.232.53.71])
	by sina.net (10.75.30.234) with ESMTP
	id 65FA9E9500036383; Wed, 20 Mar 2024 16:30:16 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 3E7527F402F54072A96EB664C79177C5
X-SMAIL-UIID: 3E7527F402F54072A96EB664C79177C5-20240320-163016
From: Zhang Yi <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Cc: tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com,
	yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com,
	zhangyi@everest-semi.com
Subject: [PATCH v1 1/2] ASoC: codecs: ES8326: Reducing power consumption
Date: Wed, 20 Mar 2024 16:30:11 +0800
Message-Id: <20240320083012.4282-2-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240320083012.4282-1-zhangyi@everest-semi.com>
References: <20240320083012.4282-1-zhangyi@everest-semi.com>
X-MailFrom: zhangyi@everest-semi.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: I5UBL5Z4SDGTMJOHZWB2EPDN3OTSYIGG
X-Message-ID-Hash: I5UBL5Z4SDGTMJOHZWB2EPDN3OTSYIGG
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:59:30 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I5UBL5Z4SDGTMJOHZWB2EPDN3OTSYIGG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For lower power consumption during hibernation, the configuration of
es8326_suspend and es8326_remove will be adjusted.
Adding es8326_i2c_shutdown and es8326_i2c_remove to cover different
situations

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8326.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 15289dadafea..635320c86c00 100755
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -1072,12 +1072,13 @@ static int es8326_suspend(struct snd_soc_component *component)
 	es8326->calibrated = false;
 	regmap_write(es8326->regmap, ES8326_CLK_CTL, ES8326_CLK_OFF);
 	regcache_cache_only(es8326->regmap, true);
-	regcache_mark_dirty(es8326->regmap);
 
 	/* reset register value to default */
 	regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x01);
 	usleep_range(1000, 3000);
 	regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x00);
+
+	regcache_mark_dirty(es8326->regmap);
 	return 0;
 }
 
@@ -1163,8 +1164,13 @@ static int es8326_set_jack(struct snd_soc_component *component,
 
 static void es8326_remove(struct snd_soc_component *component)
 {
+	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
+
 	es8326_disable_jack_detect(component);
 	es8326_set_bias_level(component, SND_SOC_BIAS_OFF);
+	regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x01);
+	usleep_range(1000, 3000);
+	regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x00);
 }
 
 static const struct snd_soc_component_driver soc_component_dev_es8326 = {
@@ -1236,6 +1242,29 @@ static int es8326_i2c_probe(struct i2c_client *i2c)
 					&es8326_dai, 1);
 }
 
+
+static void es8326_i2c_shutdown(struct i2c_client *i2c)
+{
+	struct snd_soc_component *component;
+	struct es8326_priv *es8326;
+
+	es8326 = i2c_get_clientdata(i2c);
+	component = es8326->component;
+	dev_dbg(component->dev, "Enter into %s\n", __func__);
+	cancel_delayed_work_sync(&es8326->jack_detect_work);
+	cancel_delayed_work_sync(&es8326->button_press_work);
+
+	regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x01);
+	usleep_range(1000, 3000);
+	regmap_write(es8326->regmap, ES8326_CSM_I2C_STA, 0x00);
+
+}
+
+static void es8326_i2c_remove(struct i2c_client *i2c)
+{
+	es8326_i2c_shutdown(i2c);
+}
+
 static const struct i2c_device_id es8326_i2c_id[] = {
 	{"es8326", 0 },
 	{}
@@ -1265,6 +1294,8 @@ static struct i2c_driver es8326_i2c_driver = {
 		.of_match_table = of_match_ptr(es8326_of_match),
 	},
 	.probe = es8326_i2c_probe,
+	.shutdown = es8326_i2c_shutdown,
+	.remove = es8326_i2c_remove,
 	.id_table = es8326_i2c_id,
 };
 module_i2c_driver(es8326_i2c_driver);
-- 
2.17.1

