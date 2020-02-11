Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B2D159481
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 17:11:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D62B168F;
	Tue, 11 Feb 2020 17:10:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D62B168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581437466;
	bh=Gz5efdMQ6fb4UkCrTctYyBW174fAUZ3OQHF1+fukQnA=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fjwSDxxqk7YdceWDVcXFJWVhLpqibNtrcUlYKcmpyxdQErxd4XMRYPr31rUfZlrDD
	 4ZQofbDwiUxpn0MlYyIJw7JFBuinPQ8VeFXsI1lVFE10J0x9i0Wnimn8cxNymuxYfS
	 ZZvCxRahzTHOw090kNxjs9nFIBCCmjthz2KVkkcs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCEA5F80407;
	Tue, 11 Feb 2020 16:49:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ACB6F803F9; Tue, 11 Feb 2020 16:49:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 79DAAF803D6
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 16:49:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79DAAF803D6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE30D13FD;
 Tue, 11 Feb 2020 07:49:45 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51D643F68E;
 Tue, 11 Feb 2020 07:49:45 -0800 (PST)
Date: Tue, 11 Feb 2020 15:49:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>
In-Reply-To: <980b97e1ab9c4fab8bd345ec2158f1fd@realtek.com>
Message-Id: <applied-980b97e1ab9c4fab8bd345ec2158f1fd@realtek.com>
X-Patchwork-Hint: ignore
Cc: Jack Yu <jack.yu@realtek.com>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 Mark Brown <broonie@kernel.org>,
 =?big5?B?RGVyZWsgW6TovHe4cV0=?= <derek.fang@realtek.com>,
 =?big5?B?U2h1bWluZyBbrVOu0bvKXQ==?= <shumingf@realtek.com>,
 yung-chuan.liao@linux.intel.com, "Flove \(HsinFu\)" <flove@realtek.com>
Subject: [alsa-devel] Applied "ASoC: rt5682: Add the field "is_sdw" of
	private data" to the asoc tree
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

   ASoC: rt5682: Add the field "is_sdw" of private data

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

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

From b5848c814cdb6ea87f77559a143c464101330c7e Mon Sep 17 00:00:00 2001
From: Oder Chiou <oder_chiou@realtek.com>
Date: Wed, 5 Feb 2020 02:28:56 +0000
Subject: [PATCH] ASoC: rt5682: Add the field "is_sdw" of private data

The field "is_sdw" is used for distinguishing the driver whether is run
in soundwire mode or not. That will run the separated setting in runtime
to make sure the driver can be run with the same build between i2s mode
and soundwire mode.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
Link: https://lore.kernel.org/r/980b97e1ab9c4fab8bd345ec2158f1fd@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5682.c | 148 +++++++++++++++++++++-----------------
 sound/soc/codecs/rt5682.h |   6 ++
 2 files changed, 90 insertions(+), 64 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index ae6f6121bc1b..82a636620131 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -56,6 +56,7 @@ struct rt5682_priv {
 	struct delayed_work jack_detect_work;
 	struct delayed_work jd_check_work;
 	struct mutex calibrate_mutex;
+	bool is_sdw;
 
 	int sysclk;
 	int sysclk_src;
@@ -805,10 +806,11 @@ static const struct snd_kcontrol_new rt5682_if1_45_adc_swap_mux =
 static const struct snd_kcontrol_new rt5682_if1_67_adc_swap_mux =
 	SOC_DAPM_ENUM("IF1 67 ADC Swap Mux", rt5682_if1_67_adc_enum);
 
-static void rt5682_reset(struct regmap *regmap)
+static void rt5682_reset(struct rt5682_priv *rt5682)
 {
-	regmap_write(regmap, RT5682_RESET, 0);
-	regmap_write(regmap, RT5682_I2C_MODE, 1);
+	regmap_write(rt5682->regmap, RT5682_RESET, 0);
+	if (!rt5682->is_sdw)
+		regmap_write(rt5682->regmap, RT5682_I2C_MODE, 1);
 }
 /**
  * rt5682_sel_asrc_clk_src - select ASRC clock source for a set of filters
@@ -871,6 +873,8 @@ static int rt5682_button_detect(struct snd_soc_component *component)
 static void rt5682_enable_push_button_irq(struct snd_soc_component *component,
 		bool enable)
 {
+	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
+
 	if (enable) {
 		snd_soc_component_update_bits(component, RT5682_SAR_IL_CMD_1,
 			RT5682_SAR_BUTT_DET_MASK, RT5682_SAR_BUTT_DET_EN);
@@ -880,8 +884,15 @@ static void rt5682_enable_push_button_irq(struct snd_soc_component *component,
 		snd_soc_component_update_bits(component, RT5682_4BTN_IL_CMD_2,
 			RT5682_4BTN_IL_MASK | RT5682_4BTN_IL_RST_MASK,
 			RT5682_4BTN_IL_EN | RT5682_4BTN_IL_NOR);
-		snd_soc_component_update_bits(component, RT5682_IRQ_CTRL_3,
-			RT5682_IL_IRQ_MASK, RT5682_IL_IRQ_EN);
+		if (rt5682->is_sdw)
+			snd_soc_component_update_bits(component,
+				RT5682_IRQ_CTRL_3,
+				RT5682_IL_IRQ_MASK | RT5682_IL_IRQ_TYPE_MASK,
+				RT5682_IL_IRQ_EN | RT5682_IL_IRQ_PUL);
+		else
+			snd_soc_component_update_bits(component,
+				RT5682_IRQ_CTRL_3, RT5682_IL_IRQ_MASK,
+				RT5682_IL_IRQ_EN);
 	} else {
 		snd_soc_component_update_bits(component, RT5682_IRQ_CTRL_3,
 			RT5682_IL_IRQ_MASK, RT5682_IL_IRQ_DIS);
@@ -999,62 +1010,69 @@ static int rt5682_set_jack_detect(struct snd_soc_component *component,
 
 	rt5682->hs_jack = hs_jack;
 
-	if (!hs_jack) {
-		regmap_update_bits(rt5682->regmap, RT5682_IRQ_CTRL_2,
-				   RT5682_JD1_EN_MASK, RT5682_JD1_DIS);
-		regmap_update_bits(rt5682->regmap, RT5682_RC_CLK_CTRL,
-				   RT5682_POW_JDH | RT5682_POW_JDL, 0);
-		cancel_delayed_work_sync(&rt5682->jack_detect_work);
-		return 0;
-	}
+	if (!rt5682->is_sdw) {
+		if (!hs_jack) {
+			regmap_update_bits(rt5682->regmap, RT5682_IRQ_CTRL_2,
+					   RT5682_JD1_EN_MASK, RT5682_JD1_DIS);
+			regmap_update_bits(rt5682->regmap, RT5682_RC_CLK_CTRL,
+					   RT5682_POW_JDH | RT5682_POW_JDL, 0);
+			cancel_delayed_work_sync(&rt5682->jack_detect_work);
+			return 0;
+		}
 
-	switch (rt5682->pdata.jd_src) {
-	case RT5682_JD1:
-		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_2,
-			RT5682_EXT_JD_SRC, RT5682_EXT_JD_SRC_MANUAL);
-		snd_soc_component_write(component, RT5682_CBJ_CTRL_1, 0xd042);
-		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_3,
-			RT5682_CBJ_IN_BUF_EN, RT5682_CBJ_IN_BUF_EN);
-		snd_soc_component_update_bits(component, RT5682_SAR_IL_CMD_1,
-			RT5682_SAR_POW_MASK, RT5682_SAR_POW_EN);
-		regmap_update_bits(rt5682->regmap, RT5682_GPIO_CTRL_1,
-			RT5682_GP1_PIN_MASK, RT5682_GP1_PIN_IRQ);
-		regmap_update_bits(rt5682->regmap, RT5682_RC_CLK_CTRL,
+		switch (rt5682->pdata.jd_src) {
+		case RT5682_JD1:
+			snd_soc_component_update_bits(component,
+				RT5682_CBJ_CTRL_2, RT5682_EXT_JD_SRC,
+				RT5682_EXT_JD_SRC_MANUAL);
+			snd_soc_component_write(component, RT5682_CBJ_CTRL_1,
+				0xd042);
+			snd_soc_component_update_bits(component,
+				RT5682_CBJ_CTRL_3, RT5682_CBJ_IN_BUF_EN,
+				RT5682_CBJ_IN_BUF_EN);
+			snd_soc_component_update_bits(component,
+				RT5682_SAR_IL_CMD_1, RT5682_SAR_POW_MASK,
+				RT5682_SAR_POW_EN);
+			regmap_update_bits(rt5682->regmap, RT5682_GPIO_CTRL_1,
+				RT5682_GP1_PIN_MASK, RT5682_GP1_PIN_IRQ);
+			regmap_update_bits(rt5682->regmap, RT5682_RC_CLK_CTRL,
 				RT5682_POW_IRQ | RT5682_POW_JDH |
 				RT5682_POW_ANA, RT5682_POW_IRQ |
 				RT5682_POW_JDH | RT5682_POW_ANA);
-		regmap_update_bits(rt5682->regmap, RT5682_PWR_ANLG_2,
-			RT5682_PWR_JDH | RT5682_PWR_JDL,
-			RT5682_PWR_JDH | RT5682_PWR_JDL);
-		regmap_update_bits(rt5682->regmap, RT5682_IRQ_CTRL_2,
-			RT5682_JD1_EN_MASK | RT5682_JD1_POL_MASK,
-			RT5682_JD1_EN | RT5682_JD1_POL_NOR);
-		regmap_update_bits(rt5682->regmap, RT5682_4BTN_IL_CMD_4,
-			0x7f7f, (rt5682->pdata.btndet_delay << 8 |
-			rt5682->pdata.btndet_delay));
-		regmap_update_bits(rt5682->regmap, RT5682_4BTN_IL_CMD_5,
-			0x7f7f, (rt5682->pdata.btndet_delay << 8 |
-			rt5682->pdata.btndet_delay));
-		regmap_update_bits(rt5682->regmap, RT5682_4BTN_IL_CMD_6,
-			0x7f7f, (rt5682->pdata.btndet_delay << 8 |
-			rt5682->pdata.btndet_delay));
-		regmap_update_bits(rt5682->regmap, RT5682_4BTN_IL_CMD_7,
-			0x7f7f, (rt5682->pdata.btndet_delay << 8 |
-			rt5682->pdata.btndet_delay));
-		mod_delayed_work(system_power_efficient_wq,
-			   &rt5682->jack_detect_work, msecs_to_jiffies(250));
-		break;
+			regmap_update_bits(rt5682->regmap, RT5682_PWR_ANLG_2,
+				RT5682_PWR_JDH | RT5682_PWR_JDL,
+				RT5682_PWR_JDH | RT5682_PWR_JDL);
+			regmap_update_bits(rt5682->regmap, RT5682_IRQ_CTRL_2,
+				RT5682_JD1_EN_MASK | RT5682_JD1_POL_MASK,
+				RT5682_JD1_EN | RT5682_JD1_POL_NOR);
+			regmap_update_bits(rt5682->regmap, RT5682_4BTN_IL_CMD_4,
+				0x7f7f, (rt5682->pdata.btndet_delay << 8 |
+				rt5682->pdata.btndet_delay));
+			regmap_update_bits(rt5682->regmap, RT5682_4BTN_IL_CMD_5,
+				0x7f7f, (rt5682->pdata.btndet_delay << 8 |
+				rt5682->pdata.btndet_delay));
+			regmap_update_bits(rt5682->regmap, RT5682_4BTN_IL_CMD_6,
+				0x7f7f, (rt5682->pdata.btndet_delay << 8 |
+				rt5682->pdata.btndet_delay));
+			regmap_update_bits(rt5682->regmap, RT5682_4BTN_IL_CMD_7,
+				0x7f7f, (rt5682->pdata.btndet_delay << 8 |
+				rt5682->pdata.btndet_delay));
+			mod_delayed_work(system_power_efficient_wq,
+				   &rt5682->jack_detect_work,
+					msecs_to_jiffies(250));
+			break;
 
-	case RT5682_JD_NULL:
-		regmap_update_bits(rt5682->regmap, RT5682_IRQ_CTRL_2,
-			RT5682_JD1_EN_MASK, RT5682_JD1_DIS);
-		regmap_update_bits(rt5682->regmap, RT5682_RC_CLK_CTRL,
-				RT5682_POW_JDH | RT5682_POW_JDL, 0);
-		break;
+		case RT5682_JD_NULL:
+			regmap_update_bits(rt5682->regmap, RT5682_IRQ_CTRL_2,
+				RT5682_JD1_EN_MASK, RT5682_JD1_DIS);
+			regmap_update_bits(rt5682->regmap, RT5682_RC_CLK_CTRL,
+					RT5682_POW_JDH | RT5682_POW_JDL, 0);
+			break;
 
-	default:
-		dev_warn(component->dev, "Wrong JD source\n");
-		break;
+		default:
+			dev_warn(component->dev, "Wrong JD source\n");
+			break;
+		}
 	}
 
 	return 0;
@@ -1134,11 +1152,13 @@ static void rt5682_jack_detect_handler(struct work_struct *work)
 			    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 			    SND_JACK_BTN_2 | SND_JACK_BTN_3);
 
-	if (rt5682->jack_type & (SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-		SND_JACK_BTN_2 | SND_JACK_BTN_3))
-		schedule_delayed_work(&rt5682->jd_check_work, 0);
-	else
-		cancel_delayed_work_sync(&rt5682->jd_check_work);
+	if (!rt5682->is_sdw) {
+		if (rt5682->jack_type & (SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			SND_JACK_BTN_2 | SND_JACK_BTN_3))
+			schedule_delayed_work(&rt5682->jd_check_work, 0);
+		else
+			cancel_delayed_work_sync(&rt5682->jd_check_work);
+	}
 
 	mutex_unlock(&rt5682->calibrate_mutex);
 }
@@ -2332,7 +2352,7 @@ static void rt5682_remove(struct snd_soc_component *component)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
 
-	rt5682_reset(rt5682->regmap);
+	rt5682_reset(rt5682);
 }
 
 #ifdef CONFIG_PM
@@ -2474,7 +2494,7 @@ static void rt5682_calibrate(struct rt5682_priv *rt5682)
 
 	mutex_lock(&rt5682->calibrate_mutex);
 
-	rt5682_reset(rt5682->regmap);
+	rt5682_reset(rt5682);
 	regmap_write(rt5682->regmap, RT5682_I2C_CTRL, 0x000f);
 	regmap_write(rt5682->regmap, RT5682_PWR_ANLG_1, 0xa2af);
 	usleep_range(15000, 20000);
@@ -2586,7 +2606,7 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 		return -ENODEV;
 	}
 
-	rt5682_reset(rt5682->regmap);
+	rt5682_reset(rt5682);
 
 	mutex_init(&rt5682->calibrate_mutex);
 	rt5682_calibrate(rt5682);
@@ -2676,7 +2696,7 @@ static void rt5682_i2c_shutdown(struct i2c_client *client)
 {
 	struct rt5682_priv *rt5682 = i2c_get_clientdata(client);
 
-	rt5682_reset(rt5682->regmap);
+	rt5682_reset(rt5682);
 }
 
 #ifdef CONFIG_OF
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index 18faaa2a49a0..4d3a8c41546e 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -1091,11 +1091,17 @@
 #define RT5682_JD1_POL_MASK			(0x1 << 13)
 #define RT5682_JD1_POL_NOR			(0x0 << 13)
 #define RT5682_JD1_POL_INV			(0x1 << 13)
+#define RT5682_JD1_IRQ_MASK			(0x1 << 10)
+#define RT5682_JD1_IRQ_LEV			(0x0 << 10)
+#define RT5682_JD1_IRQ_PUL			(0x1 << 10)
 
 /* IRQ Control 3 (0x00b8) */
 #define RT5682_IL_IRQ_MASK			(0x1 << 7)
 #define RT5682_IL_IRQ_DIS			(0x0 << 7)
 #define RT5682_IL_IRQ_EN			(0x1 << 7)
+#define RT5682_IL_IRQ_TYPE_MASK			(0x1 << 4)
+#define RT5682_IL_IRQ_LEV			(0x0 << 4)
+#define RT5682_IL_IRQ_PUL			(0x1 << 4)
 
 /* GPIO Control 1 (0x00c0) */
 #define RT5682_GP1_PIN_MASK			(0x3 << 14)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
