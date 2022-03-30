Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF19D4EC194
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:57:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9044118E6;
	Wed, 30 Mar 2022 13:56:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9044118E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641450;
	bh=8MKOSueqAUGuN31VyJtXZ8WouYprwqTW9CycYNHA2Jw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SYalWwlQCvNJlc5EmI00e12dFMKHqtDDk/fLec/9ByT3FK9l+S7dYvDH/LFtvH1PK
	 dm/WP3ISv1Z8WAZxEvdIbmey6HY5Uky9GtAgKjbX5LDyktsYl44N1/9lXp5Si0EvTN
	 xY1aOqEaKmxFg4IfveDf0w5qnhJiMSDnS0+q+cWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6AD2F80525;
	Wed, 30 Mar 2022 13:49:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D43B1F805EE; Wed, 30 Mar 2022 13:49:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B353AF805EE
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:49:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B353AF805EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rpDA1CfQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 58C97B81C3B;
 Wed, 30 Mar 2022 11:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C4CC340F3;
 Wed, 30 Mar 2022 11:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648640972;
 bh=8MKOSueqAUGuN31VyJtXZ8WouYprwqTW9CycYNHA2Jw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rpDA1CfQ2ZyjOO7v0FhTlMhKfK6acdfApFGqC6X2v1Y5cCysLKIiJ4Vqn/hzCA20K
 DHmohNtoeTjsbbQhKaA202fcSyMRlBcPBOxhZpX4lIaACXajPzelmXxj0DbtZw906O
 VV/yl9G00mEyKY/X1dftqaczSLc2HBh4eVjARY6UVAv2rSrkKYNfmCD8QXLV4qqGkX
 wlLg+QD5Yk2gxAaf5e25Z1hDAFEj5cG8AUk3XLUlh3cVJ2RY3W6ifKHhtLS5WHoPNM
 pab7/G/qnFi+PTQMufkmYhYJVV8LVRpfj3c19YMYathVfbR7SpD+BCXMmw2F9PijI1
 lUQ0bc95PUrGg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.16 39/59] ASoC: rt5682s: Fix the wrong jack type
 detected
Date: Wed, 30 Mar 2022 07:48:11 -0400
Message-Id: <20220330114831.1670235-39-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220330114831.1670235-1-sashal@kernel.org>
References: <20220330114831.1670235-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, oder_chiou@realtek.com,
 alsa-devel@alsa-project.org, tiwai@suse.com, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, Derek Fang <derek.fang@realtek.com>,
 bardliao@realtek.com
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

[ Upstream commit c07ac3ee76e5e5506bca9c03fbbb15e40ab28430 ]

Some powers were changed during the jack insert detection and clk's
enable/disable in CCF.
If in parallel, the influence has a chance to detect the wrong jack
type.

We refer to the below commit of the variant codec (rt5682) to fix
this issue.
  ASoC: rt5682: Fix deadlock on resume

1. Remove rt5682s_headset_detect in rt5682s_jd_check_handler and
   use jack_detect_work instead of.
2. Use dapm mutex used in CCF to protect most of jack_detect_work.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
Link: https://lore.kernel.org/r/20220223101450.4577-1-derek.fang@realtek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt5682s.c | 26 +++++++++-----------------
 sound/soc/codecs/rt5682s.h |  1 -
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index d79b548d23fa..f2a2f3d60925 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -822,6 +822,7 @@ static void rt5682s_jack_detect_handler(struct work_struct *work)
 {
 	struct rt5682s_priv *rt5682s =
 		container_of(work, struct rt5682s_priv, jack_detect_work.work);
+	struct snd_soc_dapm_context *dapm;
 	int val, btn_type;
 
 	if (!rt5682s->component || !rt5682s->component->card ||
@@ -832,7 +833,9 @@ static void rt5682s_jack_detect_handler(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&rt5682s->jdet_mutex);
+	dapm = snd_soc_component_get_dapm(rt5682s->component);
+
+	snd_soc_dapm_mutex_lock(dapm);
 	mutex_lock(&rt5682s->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5682s->component, RT5682S_AJD1_CTRL)
@@ -889,6 +892,9 @@ static void rt5682s_jack_detect_handler(struct work_struct *work)
 		rt5682s->irq_work_delay_time = 50;
 	}
 
+	mutex_unlock(&rt5682s->calibrate_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
+
 	snd_soc_jack_report(rt5682s->hs_jack, rt5682s->jack_type,
 		SND_JACK_HEADSET | SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 		SND_JACK_BTN_2 | SND_JACK_BTN_3);
@@ -898,9 +904,6 @@ static void rt5682s_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5682s->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5682s->jd_check_work);
-
-	mutex_unlock(&rt5682s->calibrate_mutex);
-	mutex_unlock(&rt5682s->jdet_mutex);
 }
 
 static void rt5682s_jd_check_handler(struct work_struct *work)
@@ -908,14 +911,9 @@ static void rt5682s_jd_check_handler(struct work_struct *work)
 	struct rt5682s_priv *rt5682s =
 		container_of(work, struct rt5682s_priv, jd_check_work.work);
 
-	if (snd_soc_component_read(rt5682s->component, RT5682S_AJD1_CTRL)
-		& RT5682S_JDH_RS_MASK) {
+	if (snd_soc_component_read(rt5682s->component, RT5682S_AJD1_CTRL) & RT5682S_JDH_RS_MASK) {
 		/* jack out */
-		rt5682s->jack_type = rt5682s_headset_detect(rt5682s->component, 0);
-
-		snd_soc_jack_report(rt5682s->hs_jack, rt5682s->jack_type,
-			SND_JACK_HEADSET | SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-			SND_JACK_BTN_2 | SND_JACK_BTN_3);
+		schedule_delayed_work(&rt5682s->jack_detect_work, 0);
 	} else {
 		schedule_delayed_work(&rt5682s->jd_check_work, 500);
 	}
@@ -1323,7 +1321,6 @@ static int rt5682s_hp_amp_event(struct snd_soc_dapm_widget *w,
 		struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -1339,8 +1336,6 @@ static int rt5682s_hp_amp_event(struct snd_soc_dapm_widget *w,
 		snd_soc_component_write(component, RT5682S_BIAS_CUR_CTRL_11, 0x6666);
 		snd_soc_component_write(component, RT5682S_BIAS_CUR_CTRL_12, 0xa82a);
 
-		mutex_lock(&rt5682s->jdet_mutex);
-
 		snd_soc_component_update_bits(component, RT5682S_HP_CTRL_2,
 			RT5682S_HPO_L_PATH_MASK | RT5682S_HPO_R_PATH_MASK |
 			RT5682S_HPO_SEL_IP_EN_SW, RT5682S_HPO_L_PATH_EN |
@@ -1348,8 +1343,6 @@ static int rt5682s_hp_amp_event(struct snd_soc_dapm_widget *w,
 		usleep_range(5000, 10000);
 		snd_soc_component_update_bits(component, RT5682S_HP_AMP_DET_CTL_1,
 			RT5682S_CP_SW_SIZE_MASK, RT5682S_CP_SW_SIZE_L | RT5682S_CP_SW_SIZE_S);
-
-		mutex_unlock(&rt5682s->jdet_mutex);
 		break;
 
 	case SND_SOC_DAPM_POST_PMD:
@@ -3075,7 +3068,6 @@ static int rt5682s_i2c_probe(struct i2c_client *i2c,
 
 	mutex_init(&rt5682s->calibrate_mutex);
 	mutex_init(&rt5682s->sar_mutex);
-	mutex_init(&rt5682s->jdet_mutex);
 	rt5682s_calibrate(rt5682s);
 
 	regmap_update_bits(rt5682s->regmap, RT5682S_MICBIAS_2,
diff --git a/sound/soc/codecs/rt5682s.h b/sound/soc/codecs/rt5682s.h
index 1bf2ef7ce578..397a2531b6f6 100644
--- a/sound/soc/codecs/rt5682s.h
+++ b/sound/soc/codecs/rt5682s.h
@@ -1446,7 +1446,6 @@ struct rt5682s_priv {
 	struct delayed_work jd_check_work;
 	struct mutex calibrate_mutex;
 	struct mutex sar_mutex;
-	struct mutex jdet_mutex;
 
 #ifdef CONFIG_COMMON_CLK
 	struct clk_hw dai_clks_hw[RT5682S_DAI_NUM_CLKS];
-- 
2.34.1

