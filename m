Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2586849C709
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 11:04:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88EF11F1C;
	Wed, 26 Jan 2022 11:03:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88EF11F1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643191452;
	bh=SDrNrjRnrA+suzTJnZcjRIhlTnbxYLrzUfFnM8bqdko=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uFWMSaIIm1dSJkPPJ5WdolcbBqSQ0yB0YQnjtIUsnVVLYxbeWamqDZBG9jjGONhlK
	 oSTsoYLp8LMLHjRCIvoRMQOeNV2jFD0ZSuDah6cJSL1BR2X2XiXekW5DhbNNhjHvY3
	 apzqMXYENr1KdKQiDqEK93NUiqQANyPGs0PeH74Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB32DF804BC;
	Wed, 26 Jan 2022 11:03:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB73CF80118; Wed, 26 Jan 2022 11:03:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 264FBF80118
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 11:02:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 264FBF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WImu5pkY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643191379; x=1674727379;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SDrNrjRnrA+suzTJnZcjRIhlTnbxYLrzUfFnM8bqdko=;
 b=WImu5pkY8BjqKp3l5zZ5w8xd3jd39LsXWAR+ALpC8BismkdTndw1KTzR
 OUXC/eUFQfeE/reJraen4YkwkM1fhKn5GXBzp+KYDjIwx9XRPkudhsA0l
 /PKXkfXtTocu9mx4iamWYHi3eFXW465uPfzAFtuu3hffFjdePhQfVx1dd
 kLFz1unzASxwuKi3IU9p4vblWS0Qa5/crWwSqI0chhZRbDeF78Bz2aQtX
 5HmLOd8JRAN1YI3HZXzJyY9wDjIn7vtkMiITWMJQsQfno4rbsK3dOmCqE
 MkyRHnxNpS7R7JjZvnhiPPAACA1sBkxBEKwrqiS+ei9K107GBYPoaRCQJ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="227191943"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="227191943"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 02:02:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; d="scan'208";a="520741288"
Received: from rosenbaf-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.52.60])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 02:02:50 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: oder_chiou@realtek.com, lgirdwood@gmail.com, broonie@kernel.org,
 derek.fang@realtek.com
Subject: [PATCH] ASoC: rt5682: Fix deadlock on resume
Date: Wed, 26 Jan 2022 12:03:25 +0200
Message-Id: <20220126100325.16513-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.com
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

On resume from suspend the following chain of events can happen:
A rt5682_resume() -> mod_delayed_work() for jack_detect_work
B DAPM sequence starts ( DAPM is locked now)

A1. rt5682_jack_detect_handler() scheduled
 - Takes both jdet_mutex and calibrate_mutex
 - Calls in to rt5682_headset_detect() which tries to take DAPM lock, it
   starts to wait for it as B path took it already.
B1. DAPM sequence reaches the "HP Amp", rt5682_hp_event() tries to take
    the jdet_mutex, but it is locked in A1, so it waits.

Deadlock.

To solve the deadlock, drop the jdet_mutex, use the jack_detect_work to do
the jack removal handling, move the dapm lock up one level to protect the
most of the rt5682_jack_detect_handler(), but not the jack reporting as it
might trigger a DAPM sequence.
The rt5682_headset_detect() can be changed to static as well.

Fixes: 8deb34a90f063 ("ASoC: rt5682: fix the wrong jack type detected")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
Hi,

Recently we started to see resume failures in SOF CI:
https://github.com/thesofproject/linux/issues/3370

Which turned out to be caused by a lockdep in rt5682 codec driver on at resume
time.

This patch is fixing the issue while not introducing other failures, checked by
our CI:
https://github.com/thesofproject/linux/pull/3392

Regards,
Peter

 sound/soc/codecs/rt5682-i2c.c | 15 ++++-----------
 sound/soc/codecs/rt5682.c     | 24 ++++++++----------------
 sound/soc/codecs/rt5682.h     |  2 --
 3 files changed, 12 insertions(+), 29 deletions(-)

diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index 20e0f90ea498..20fc0f3766de 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -59,18 +59,12 @@ static void rt5682_jd_check_handler(struct work_struct *work)
 	struct rt5682_priv *rt5682 = container_of(work, struct rt5682_priv,
 		jd_check_work.work);
 
-	if (snd_soc_component_read(rt5682->component, RT5682_AJD1_CTRL)
-		& RT5682_JDH_RS_MASK) {
+	if (snd_soc_component_read(rt5682->component, RT5682_AJD1_CTRL) & RT5682_JDH_RS_MASK)
 		/* jack out */
-		rt5682->jack_type = rt5682_headset_detect(rt5682->component, 0);
-
-		snd_soc_jack_report(rt5682->hs_jack, rt5682->jack_type,
-			SND_JACK_HEADSET |
-			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-			SND_JACK_BTN_2 | SND_JACK_BTN_3);
-	} else {
+		mod_delayed_work(system_power_efficient_wq,
+				 &rt5682->jack_detect_work, 0);
+	else
 		schedule_delayed_work(&rt5682->jd_check_work, 500);
-	}
 }
 
 static irqreturn_t rt5682_irq(int irq, void *data)
@@ -198,7 +192,6 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 	}
 
 	mutex_init(&rt5682->calibrate_mutex);
-	mutex_init(&rt5682->jdet_mutex);
 	rt5682_calibrate(rt5682);
 
 	rt5682_apply_patch_list(rt5682, &i2c->dev);
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 415ec564c82e..0a0ec4a021e1 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -922,15 +922,13 @@ static void rt5682_enable_push_button_irq(struct snd_soc_component *component,
  *
  * Returns detect status.
  */
-int rt5682_headset_detect(struct snd_soc_component *component, int jack_insert)
+static int rt5682_headset_detect(struct snd_soc_component *component, int jack_insert)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = &component->dapm;
 	unsigned int val, count;
 
 	if (jack_insert) {
-		snd_soc_dapm_mutex_lock(dapm);
-
 		snd_soc_component_update_bits(component, RT5682_PWR_ANLG_1,
 			RT5682_PWR_VREF2 | RT5682_PWR_MB,
 			RT5682_PWR_VREF2 | RT5682_PWR_MB);
@@ -981,8 +979,6 @@ int rt5682_headset_detect(struct snd_soc_component *component, int jack_insert)
 		snd_soc_component_update_bits(component, RT5682_MICBIAS_2,
 			RT5682_PWR_CLK25M_MASK | RT5682_PWR_CLK1M_MASK,
 			RT5682_PWR_CLK25M_PU | RT5682_PWR_CLK1M_PU);
-
-		snd_soc_dapm_mutex_unlock(dapm);
 	} else {
 		rt5682_enable_push_button_irq(component, false);
 		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_1,
@@ -1011,7 +1007,6 @@ int rt5682_headset_detect(struct snd_soc_component *component, int jack_insert)
 	dev_dbg(component->dev, "jack_type = %d\n", rt5682->jack_type);
 	return rt5682->jack_type;
 }
-EXPORT_SYMBOL_GPL(rt5682_headset_detect);
 
 static int rt5682_set_jack_detect(struct snd_soc_component *component,
 		struct snd_soc_jack *hs_jack, void *data)
@@ -1094,6 +1089,7 @@ void rt5682_jack_detect_handler(struct work_struct *work)
 {
 	struct rt5682_priv *rt5682 =
 		container_of(work, struct rt5682_priv, jack_detect_work.work);
+	struct snd_soc_dapm_context *dapm;
 	int val, btn_type;
 
 	while (!rt5682->component)
@@ -1102,7 +1098,9 @@ void rt5682_jack_detect_handler(struct work_struct *work)
 	while (!rt5682->component->card->instantiated)
 		usleep_range(10000, 15000);
 
-	mutex_lock(&rt5682->jdet_mutex);
+	dapm = snd_soc_component_get_dapm(rt5682->component);
+
+	snd_soc_dapm_mutex_lock(dapm);
 	mutex_lock(&rt5682->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5682->component, RT5682_AJD1_CTRL)
@@ -1162,6 +1160,9 @@ void rt5682_jack_detect_handler(struct work_struct *work)
 		rt5682->irq_work_delay_time = 50;
 	}
 
+	mutex_unlock(&rt5682->calibrate_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
+
 	snd_soc_jack_report(rt5682->hs_jack, rt5682->jack_type,
 		SND_JACK_HEADSET |
 		SND_JACK_BTN_0 | SND_JACK_BTN_1 |
@@ -1174,9 +1175,6 @@ void rt5682_jack_detect_handler(struct work_struct *work)
 		else
 			cancel_delayed_work_sync(&rt5682->jd_check_work);
 	}
-
-	mutex_unlock(&rt5682->calibrate_mutex);
-	mutex_unlock(&rt5682->jdet_mutex);
 }
 EXPORT_SYMBOL_GPL(rt5682_jack_detect_handler);
 
@@ -1526,7 +1524,6 @@ static int rt5682_hp_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
-	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1538,17 +1535,12 @@ static int rt5682_hp_event(struct snd_soc_dapm_widget *w,
 			RT5682_DEPOP_1, 0x60, 0x60);
 		snd_soc_component_update_bits(component,
 			RT5682_DAC_ADC_DIG_VOL1, 0x00c0, 0x0080);
-
-		mutex_lock(&rt5682->jdet_mutex);
-
 		snd_soc_component_update_bits(component, RT5682_HP_CTRL_2,
 			RT5682_HP_C2_DAC_L_EN | RT5682_HP_C2_DAC_R_EN,
 			RT5682_HP_C2_DAC_L_EN | RT5682_HP_C2_DAC_R_EN);
 		usleep_range(5000, 10000);
 		snd_soc_component_update_bits(component, RT5682_CHARGE_PUMP_1,
 			RT5682_CP_SW_SIZE_MASK, RT5682_CP_SW_SIZE_L);
-
-		mutex_unlock(&rt5682->jdet_mutex);
 		break;
 
 	case SND_SOC_DAPM_POST_PMD:
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index c917c76200ea..52ff0d9c36c5 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -1463,7 +1463,6 @@ struct rt5682_priv {
 
 	int jack_type;
 	int irq_work_delay_time;
-	struct mutex jdet_mutex;
 };
 
 extern const char *rt5682_supply_names[RT5682_NUM_SUPPLIES];
@@ -1473,7 +1472,6 @@ int rt5682_sel_asrc_clk_src(struct snd_soc_component *component,
 
 void rt5682_apply_patch_list(struct rt5682_priv *rt5682, struct device *dev);
 
-int rt5682_headset_detect(struct snd_soc_component *component, int jack_insert);
 void rt5682_jack_detect_handler(struct work_struct *work);
 
 bool rt5682_volatile_register(struct device *dev, unsigned int reg);
-- 
2.34.1

