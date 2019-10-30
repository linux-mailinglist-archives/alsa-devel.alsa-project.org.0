Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8815BE9D57
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 15:21:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A78C22C6;
	Wed, 30 Oct 2019 15:20:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A78C22C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572445271;
	bh=lab985DvEDZgPfnHv631ThY27Mn/Wt04/Bs0rKW6VJ8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MOXqgbp+qXJYbhl2FB+0HoRDxrmlwIkb7xkt9VA7Q2uEaMw5PPS1JVmuLunfvHnl2
	 kWfJ9lMKfgFzt0S9CpBQZ4ZRc73gTns+Ybo5zmO96Nlitiq1jT7ss7af2xMSB4XCZF
	 0kJHMdROC/pqM+rNRJsDo2FwxzuMtd3fj1/UICHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D185F8044A;
	Wed, 30 Oct 2019 15:19:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3B36F8044A; Wed, 30 Oct 2019 15:16:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6075F8015A
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 15:16:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6075F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="biShQrnW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=2slcNVRI6gezbG+D5dW0HDTSVBztmNZYOmi0hbNafcc=; b=biShQrnWYm61
 +l2Ug3xs/lamcciJZh0GCbZlEW22tUci5Dqqwlk3JNZCBk46+UNC187voTsCCrwO8IR7zkzSJuZgd
 1p6KyJ1xPsHaVslw4vS86e3M89kG4rf7TTxt0zYJyE2PSDdXMOkD8e03jKmDYPkUTnUwaWg1WVF6Y
 j/7iY=;
Received: from [195.11.164.221] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iPolz-0005Cg-49; Wed, 30 Oct 2019 14:16:31 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id BDA77D020A7; Wed, 30 Oct 2019 14:16:30 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Shuming Fan <shumingf@realtek.com>
In-Reply-To: <20191030085533.14299-1-shumingf@realtek.com>
X-Patchwork-Hint: ignore
Message-Id: <20191030141630.BDA77D020A7@fitzroy.sirena.org.uk>
Date: Wed, 30 Oct 2019 14:16:30 +0000 (GMT)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, Mark Brown <broonie@kernel.org>,
 derek.fang@realtek.com, sathya.prakash.m.r@intel.com, flove@realtek.com
Subject: [alsa-devel] Applied "ASoC: rt5682: improve the sensitivity of push
	button" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: rt5682: improve the sensitivity of push button

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From e226445802cb2a51c3cb127fac31fba0a4330e87 Mon Sep 17 00:00:00 2001
From: Shuming Fan <shumingf@realtek.com>
Date: Wed, 30 Oct 2019 16:55:33 +0800
Subject: [PATCH] ASoC: rt5682: improve the sensitivity of push button

The sensitivity could improve by decreasing the HW debounce time
and reduce the delay time of workequeue.
This patch added a device property for HW debounce time control.
We could change this value to tune the sensitivity of push button.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20191030085533.14299-1-shumingf@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
