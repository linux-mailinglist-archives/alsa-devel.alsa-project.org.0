Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBDCE988D
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 09:57:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E40402317;
	Wed, 30 Oct 2019 09:56:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E40402317
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572425867;
	bh=g6XWtKFnAS4eqIGQjrv71wKRR6l8Ysfj7xqHNXObRIk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p8+qd9gysh8SdVqXbOleADOqtx40cq6QUraGPN7PAOnGCbpIvkfnnBVH1IMgs0Kz2
	 4EQmx5+kz2zS1Of16A54AlwblLLFc18NLByfXEBW+ADgRbJmufFb2cHPZF7q81i8Qe
	 YzMY1Hl1COPoEpGaODy6ihIoRxIGO4+CcPLPBEjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D921F80361;
	Wed, 30 Oct 2019 09:56:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3DFFF80361; Wed, 30 Oct 2019 09:56:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07628F8015A
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 09:55:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07628F8015A
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID x9U8tmeI004391,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCAS11.realtek.com.tw[172.21.6.12])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id x9U8tmeI004391
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 16:55:49 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCAS11.realtek.com.tw (172.21.6.12) with Microsoft SMTP Server id
 14.3.468.0; Wed, 30 Oct 2019 16:55:45 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Wed, 30 Oct 2019 16:55:33 +0800
Message-ID: <20191030085533.14299-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, Shuming Fan <shumingf@realtek.com>, derek.fang@realtek.com,
 sathya.prakash.m.r@intel.com, flove@realtek.com
Subject: [alsa-devel] [PATCH 1/3] ASoC: rt5682: improve the sensitivity of
	push button
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

The sensitivity could improve by decreasing the HW debounce time
and reduce the delay time of workequeue.
This patch added a device property for HW debounce time control.
We could change this value to tune the sensitivity of push button.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 include/sound/rt5682.h    |  1 +
 sound/soc/codecs/rt5682.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/sound/rt5682.h b/include/sound/rt5682.h
index bf2ee75aabb1..bc2c31734df1 100644
--- a/include/sound/rt5682.h
+++ b/include/sound/rt5682.h
@@ -31,6 +31,7 @@ struct rt5682_platform_data {
 	enum rt5682_dmic1_data_pin dmic1_data_pin;
 	enum rt5682_dmic1_clk_pin dmic1_clk_pin;
 	enum rt5682_jd_src jd_src;
+	unsigned int btndet_delay;
 };
 
 #endif
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index c50b75ce82e0..35dcec135c8a 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -44,6 +44,7 @@ static const struct rt5682_platform_data i2s_default_platform_data = {
 	.dmic1_data_pin = RT5682_DMIC1_DATA_GPIO2,
 	.dmic1_clk_pin = RT5682_DMIC1_CLK_GPIO3,
 	.jd_src = RT5682_JD1,
+	.btndet_delay = 16,
 };
 
 struct rt5682_priv {
@@ -1026,6 +1027,18 @@ static int rt5682_set_jack_detect(struct snd_soc_component *component,
 		regmap_update_bits(rt5682->regmap, RT5682_IRQ_CTRL_2,
 			RT5682_JD1_EN_MASK | RT5682_JD1_POL_MASK,
 			RT5682_JD1_EN | RT5682_JD1_POL_NOR);
+		regmap_update_bits(rt5682->regmap, RT5682_4BTN_IL_CMD_4,
+			0x7f7f, (rt5682->pdata.btndet_delay << 8 |
+			rt5682->pdata.btndet_delay));
+		regmap_update_bits(rt5682->regmap, RT5682_4BTN_IL_CMD_5,
+			0x7f7f, (rt5682->pdata.btndet_delay << 8 |
+			rt5682->pdata.btndet_delay));
+		regmap_update_bits(rt5682->regmap, RT5682_4BTN_IL_CMD_6,
+			0x7f7f, (rt5682->pdata.btndet_delay << 8 |
+			rt5682->pdata.btndet_delay));
+		regmap_update_bits(rt5682->regmap, RT5682_4BTN_IL_CMD_7,
+			0x7f7f, (rt5682->pdata.btndet_delay << 8 |
+			rt5682->pdata.btndet_delay));
 		mod_delayed_work(system_power_efficient_wq,
 			   &rt5682->jack_detect_work, msecs_to_jiffies(250));
 		break;
@@ -2467,6 +2480,8 @@ static int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev)
 		&rt5682->pdata.dmic1_clk_pin);
 	device_property_read_u32(dev, "realtek,jd-src",
 		&rt5682->pdata.jd_src);
+	device_property_read_u32(dev, "realtek,btndet-delay",
+		&rt5682->pdata.btndet_delay);
 
 	rt5682->pdata.ldo1_en = of_get_named_gpio(dev->of_node,
 		"realtek,ldo1-en-gpios", 0);
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
