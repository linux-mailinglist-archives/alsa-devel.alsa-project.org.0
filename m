Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90363641B62
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Dec 2022 08:53:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3084416C5;
	Sun,  4 Dec 2022 08:52:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3084416C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670140399;
	bh=0x+qp7TDI5lFBFebKsplJjfV6X8LXHj+MtvfJjST3s8=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fo9ealdZsvTLa6nu2cZIbOEsB/c70um00I/rzZoLs8MZP4gXsNScSUW38WCmpnXZM
	 3h0h5yk0WQmqa+oHyJKkTAyy+naHKinrgB/QrU2FhHAt4ADPcniR+ECdenORpjZUQ3
	 1vk3kBT5kRTBAapZXm/iw7J8maOz2/u7FvdJ9N0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9929F800BD;
	Sun,  4 Dec 2022 08:52:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BEE2F8025A; Sun,  4 Dec 2022 08:52:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DATE_IN_PAST_96_XX, DKIM_SIGNED,
 DKIM_VALID,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCDB2F800BD
 for <alsa-devel@alsa-project.org>; Sun,  4 Dec 2022 08:52:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCDB2F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=igorinstitute-com.20210112.gappssmtp.com
 header.i=@igorinstitute-com.20210112.gappssmtp.com header.b="LVbxwIhj"
Received: by mail-pf1-x431.google.com with SMTP id c7so5245592pfc.12
 for <alsa-devel@alsa-project.org>; Sat, 03 Dec 2022 23:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igorinstitute-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=38D6J740N3833rshUE9U2HYtUisuJRur7dCUFd2NB3Q=;
 b=LVbxwIhjO57ku+02wJGJ7Wvl9VxchywCv4XW7desqYMoGVROb2RtD0X+Bc78BeaYG/
 LlVC0XT3UV6JobOAPIZ/pOiRDwBCrds3Q6lTac6JIpyL8sj3FDpUkq8fu3VrDrdhVsJh
 E3g0BQSOQt3ogV5Gk29qdk6qb/Kjo9wwJiTtNdb3WbyUCLtxnIXpzQy1SDRK1HN41qVX
 ZADfcKAuQv20unPK6CJggy7d9h0FJ6bjZETP9WpJZBVQ4I9KQAVc4wNVJi0WXA5NhSY+
 VLn3XkkMTKIbPdhf6ol33+eBHNX/SHLxFB1nigjlUFn2Mk5qsPHZwU9h0n3mGGI9xNuj
 yxIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:date:from:message-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=38D6J740N3833rshUE9U2HYtUisuJRur7dCUFd2NB3Q=;
 b=GxJnEmqg5avC/CzsJ87Xib15zU2oruQSvYJ9SWBBR8Lu0S+qXwlNBpvHKgaKwpRrVq
 jKi6aaapCHBwKcK4LD8C4vEwSLVxJijWSP7eIGEQ92LuUkjxkEQ0CeIw6737WU4oR24b
 4q0C35kVlqAYMAdDgCBfncbkOEnvaIkhCUUJlA0ZpaRjjWsdFWeXJcr6V35x5qP3PlnP
 cU6kNZo0dQa67bVHbTmzmfGbN9aDDGW5N0OKhFX56u5NfEx2bLRTWjqFbwXERA4+5v6j
 1B5Hmb1GW41lwhEE0aR7xCLdb7UmjKM2XDCdQG9shwoBNfQt7f6aMiIALGHa1SMlPzKd
 qDEw==
X-Gm-Message-State: ANoB5pnIAHjRKsR1/EHDIPMN5DxEvbdCYSl2zpjKKPPqGsICHKoCNm47
 e063szSaGZp5RUM9sYvYzWoUuIpu0yembeRSKRQ=
X-Google-Smtp-Source: AA0mqf76BGZRn9zqWXY/mKOO+plucx24kj7VHR+afk5rtNJFyKJRPsvG7ntj364Re1UIy+oBZQQeuw==
X-Received: by 2002:a05:6a00:4104:b0:56c:e37d:ec12 with SMTP id
 bu4-20020a056a00410400b0056ce37dec12mr59102766pfb.80.1670140332761; 
 Sat, 03 Dec 2022 23:52:12 -0800 (PST)
Received: from localhost ([121.99.145.49]) by smtp.gmail.com with ESMTPSA id
 14-20020a17090a0f8e00b002132f3e71c6sm7165637pjz.52.2022.12.03.23.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 23:52:12 -0800 (PST)
Message-ID: <638c51ac.170a0220.1058d.d8e8@mx.google.com>
From: Daniel Beer <daniel.beer@igorinstitute.com>
Date: Thu, 27 Oct 2022 21:28:31 +1300
Subject: [PATCH v2 1/2] ASoC: tas5805m: rework to avoid scheduling while
 atomic.
To: alsa-devel@alsa-project.org
Cc: Andy Liu <andy-liu@ti.com>,
 Derek Simkowiak <derek.simkowiak@igorinstitute.com>,
 Mark Brown <broonie@kernel.org>, Daniel Beer <daniel.beer@igorinstitute.com>,
 linux-kernel@vger.kernel.org
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

There's some setup we need to do in order to get the DSP initialized,
and this can't be done until a bit-clock is ready. In an earlier version
of this driver, this work was done in a DAPM callback.

The DAPM callback doesn't guarantee that the bit-clock is running, so
the work was moved instead to the trigger callback. Unfortunately this
callback runs in atomic context, and the setup code needs to do I2C
transactions.

Here we use a work_struct to kick off the setup in a thread instead.

Fixes: ec45268467f4 ("ASoC: add support for TAS5805M digital amplifier")
Signed-off-by: Daniel Beer <daniel.beer@igorinstitute.com>
---
 sound/soc/codecs/tas5805m.c | 128 ++++++++++++++++++++++++------------
 1 file changed, 87 insertions(+), 41 deletions(-)

diff --git a/sound/soc/codecs/tas5805m.c b/sound/soc/codecs/tas5805m.c
index beb4ec629a03..6e2edf045446 100644
--- a/sound/soc/codecs/tas5805m.c
+++ b/sound/soc/codecs/tas5805m.c
@@ -154,6 +154,7 @@ static const uint32_t tas5805m_volume[] = {
 #define TAS5805M_VOLUME_MIN	0
 
 struct tas5805m_priv {
+	struct i2c_client		*i2c;
 	struct regulator		*pvdd;
 	struct gpio_desc		*gpio_pdn_n;
 
@@ -165,6 +166,9 @@ struct tas5805m_priv {
 	int				vol[2];
 	bool				is_powered;
 	bool				is_muted;
+
+	struct work_struct		work;
+	struct mutex			lock;
 };
 
 static void set_dsp_scale(struct regmap *rm, int offset, int vol)
@@ -181,13 +185,11 @@ static void set_dsp_scale(struct regmap *rm, int offset, int vol)
 	regmap_bulk_write(rm, offset, v, ARRAY_SIZE(v));
 }
 
-static void tas5805m_refresh(struct snd_soc_component *component)
+static void tas5805m_refresh(struct tas5805m_priv *tas5805m)
 {
-	struct tas5805m_priv *tas5805m =
-		snd_soc_component_get_drvdata(component);
 	struct regmap *rm = tas5805m->regmap;
 
-	dev_dbg(component->dev, "refresh: is_muted=%d, vol=%d/%d\n",
+	dev_dbg(&tas5805m->i2c->dev, "refresh: is_muted=%d, vol=%d/%d\n",
 		tas5805m->is_muted, tas5805m->vol[0], tas5805m->vol[1]);
 
 	regmap_write(rm, REG_PAGE, 0x00);
@@ -226,8 +228,11 @@ static int tas5805m_vol_get(struct snd_kcontrol *kcontrol,
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
 
+	mutex_lock(&tas5805m->lock);
 	ucontrol->value.integer.value[0] = tas5805m->vol[0];
 	ucontrol->value.integer.value[1] = tas5805m->vol[1];
+	mutex_unlock(&tas5805m->lock);
+
 	return 0;
 }
 
@@ -243,11 +248,13 @@ static int tas5805m_vol_put(struct snd_kcontrol *kcontrol,
 		snd_soc_kcontrol_component(kcontrol);
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
+	int ret = 0;
 
 	if (!(volume_is_valid(ucontrol->value.integer.value[0]) &&
 	      volume_is_valid(ucontrol->value.integer.value[1])))
 		return -EINVAL;
 
+	mutex_lock(&tas5805m->lock);
 	if (tas5805m->vol[0] != ucontrol->value.integer.value[0] ||
 	    tas5805m->vol[1] != ucontrol->value.integer.value[1]) {
 		tas5805m->vol[0] = ucontrol->value.integer.value[0];
@@ -256,11 +263,12 @@ static int tas5805m_vol_put(struct snd_kcontrol *kcontrol,
 			tas5805m->vol[0], tas5805m->vol[1],
 			tas5805m->is_powered);
 		if (tas5805m->is_powered)
-			tas5805m_refresh(component);
-		return 1;
+			tas5805m_refresh(tas5805m);
+		ret = 1;
 	}
+	mutex_unlock(&tas5805m->lock);
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_kcontrol_new tas5805m_snd_controls[] = {
@@ -294,54 +302,83 @@ static int tas5805m_trigger(struct snd_pcm_substream *substream, int cmd,
 	struct snd_soc_component *component = dai->component;
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
-	struct regmap *rm = tas5805m->regmap;
-	unsigned int chan, global1, global2;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		dev_dbg(component->dev, "DSP startup\n");
-
-		/* We mustn't issue any I2C transactions until the I2S
-		 * clock is stable. Furthermore, we must allow a 5ms
-		 * delay after the first set of register writes to
-		 * allow the DSP to boot before configuring it.
-		 */
-		usleep_range(5000, 10000);
-		send_cfg(rm, dsp_cfg_preboot,
-			ARRAY_SIZE(dsp_cfg_preboot));
-		usleep_range(5000, 15000);
-		send_cfg(rm, tas5805m->dsp_cfg_data,
-			tas5805m->dsp_cfg_len);
-
-		tas5805m->is_powered = true;
-		tas5805m_refresh(component);
+		dev_dbg(component->dev, "clock start\n");
+		schedule_work(&tas5805m->work);
 		break;
 
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		dev_dbg(component->dev, "DSP shutdown\n");
+		break;
 
-		tas5805m->is_powered = false;
+	default:
+		return -EINVAL;
+	}
 
-		regmap_write(rm, REG_PAGE, 0x00);
-		regmap_write(rm, REG_BOOK, 0x00);
+	return 0;
+}
 
-		regmap_read(rm, REG_CHAN_FAULT, &chan);
-		regmap_read(rm, REG_GLOBAL_FAULT1, &global1);
-		regmap_read(rm, REG_GLOBAL_FAULT2, &global2);
+static void do_work(struct work_struct *work)
+{
+	struct tas5805m_priv *tas5805m =
+	       container_of(work, struct tas5805m_priv, work);
+	struct regmap *rm = tas5805m->regmap;
 
-		dev_dbg(component->dev,
-			"fault regs: CHAN=%02x, GLOBAL1=%02x, GLOBAL2=%02x\n",
-			chan, global1, global2);
+	dev_dbg(&tas5805m->i2c->dev, "DSP startup\n");
 
-		regmap_write(rm, REG_DEVICE_CTRL_2, DCTRL2_MODE_HIZ);
-		break;
+	mutex_lock(&tas5805m->lock);
+	/* We mustn't issue any I2C transactions until the I2S
+	 * clock is stable. Furthermore, we must allow a 5ms
+	 * delay after the first set of register writes to
+	 * allow the DSP to boot before configuring it.
+	 */
+	usleep_range(5000, 10000);
+	send_cfg(rm, dsp_cfg_preboot, ARRAY_SIZE(dsp_cfg_preboot));
+	usleep_range(5000, 15000);
+	send_cfg(rm, tas5805m->dsp_cfg_data, tas5805m->dsp_cfg_len);
+
+	tas5805m->is_powered = true;
+	tas5805m_refresh(tas5805m);
+	mutex_unlock(&tas5805m->lock);
+}
 
-	default:
-		return -EINVAL;
+static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
+			      struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct tas5805m_priv *tas5805m =
+		snd_soc_component_get_drvdata(component);
+	struct regmap *rm = tas5805m->regmap;
+
+	if (event & SND_SOC_DAPM_PRE_PMD) {
+		unsigned int chan, global1, global2;
+
+		dev_dbg(component->dev, "DSP shutdown\n");
+		cancel_work_sync(&tas5805m->work);
+
+		mutex_lock(&tas5805m->lock);
+		if (tas5805m->is_powered) {
+			tas5805m->is_powered = false;
+
+			regmap_write(rm, REG_PAGE, 0x00);
+			regmap_write(rm, REG_BOOK, 0x00);
+
+			regmap_read(rm, REG_CHAN_FAULT, &chan);
+			regmap_read(rm, REG_GLOBAL_FAULT1, &global1);
+			regmap_read(rm, REG_GLOBAL_FAULT2, &global2);
+
+			dev_dbg(component->dev, "fault regs: CHAN=%02x, "
+				"GLOBAL1=%02x, GLOBAL2=%02x\n",
+				chan, global1, global2);
+
+			regmap_write(rm, REG_DEVICE_CTRL_2, DCTRL2_MODE_HIZ);
+		}
+		mutex_unlock(&tas5805m->lock);
 	}
 
 	return 0;
@@ -354,7 +391,8 @@ static const struct snd_soc_dapm_route tas5805m_audio_map[] = {
 
 static const struct snd_soc_dapm_widget tas5805m_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("DAC IN", "Playback", 0, SND_SOC_NOPM, 0, 0),
-	SND_SOC_DAPM_DAC("DAC", NULL, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0,
+		tas5805m_dac_event, SND_SOC_DAPM_PRE_PMD),
 	SND_SOC_DAPM_OUTPUT("OUT")
 };
 
@@ -375,11 +413,14 @@ static int tas5805m_mute(struct snd_soc_dai *dai, int mute, int direction)
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
 
+	mutex_lock(&tas5805m->lock);
 	dev_dbg(component->dev, "set mute=%d (is_powered=%d)\n",
 		mute, tas5805m->is_powered);
+
 	tas5805m->is_muted = mute;
 	if (tas5805m->is_powered)
-		tas5805m_refresh(component);
+		tas5805m_refresh(tas5805m);
+	mutex_unlock(&tas5805m->lock);
 
 	return 0;
 }
@@ -434,6 +475,7 @@ static int tas5805m_i2c_probe(struct i2c_client *i2c)
 	if (!tas5805m)
 		return -ENOMEM;
 
+	tas5805m->i2c = i2c;
 	tas5805m->pvdd = devm_regulator_get(dev, "pvdd");
 	if (IS_ERR(tas5805m->pvdd)) {
 		dev_err(dev, "failed to get pvdd supply: %ld\n",
@@ -507,6 +549,9 @@ static int tas5805m_i2c_probe(struct i2c_client *i2c)
 	gpiod_set_value(tas5805m->gpio_pdn_n, 1);
 	usleep_range(10000, 15000);
 
+	INIT_WORK(&tas5805m->work, do_work);
+	mutex_init(&tas5805m->lock);
+
 	/* Don't register through devm. We need to be able to unregister
 	 * the component prior to deasserting PDN#
 	 */
@@ -527,6 +572,7 @@ static void tas5805m_i2c_remove(struct i2c_client *i2c)
 	struct device *dev = &i2c->dev;
 	struct tas5805m_priv *tas5805m = dev_get_drvdata(dev);
 
+	cancel_work_sync(&tas5805m->work);
 	snd_soc_unregister_component(dev);
 	gpiod_set_value(tas5805m->gpio_pdn_n, 0);
 	usleep_range(10000, 15000);
-- 
2.38.1

