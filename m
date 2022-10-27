Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 151B568AC6D
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Feb 2023 22:04:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A7F586E;
	Sat,  4 Feb 2023 22:03:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A7F586E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675544663;
	bh=0x+qp7TDI5lFBFebKsplJjfV6X8LXHj+MtvfJjST3s8=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BIR3G1RWqy8Dw8mQffOvIGYOG6/mzSyBXhaw8Rv/ZAop7QS77bwk/sI9Pe6yoXBlg
	 c6+NVszYtq5UVZfs/N51Kc/hJ+BRwDiTRUMTgYklvCdUWvSIuvB8t+qEbaFLoGde8k
	 PhGsr2HYJhHFhyeQF6RiBPAlTIVFa6vmQUT4hRSw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DA38F80551;
	Sat,  4 Feb 2023 22:02:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 197C9F80549; Sat,  4 Feb 2023 22:02:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=DATE_IN_PAST_96_XX,
 DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27601F80271
 for <alsa-devel@alsa-project.org>; Sat,  4 Feb 2023 22:02:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27601F80271
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=igorinstitute-com.20210112.gappssmtp.com
 header.i=@igorinstitute-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=TdZgv/XT
Received: by mail-pl1-x631.google.com with SMTP id g13so3774891ple.10
 for <alsa-devel@alsa-project.org>; Sat, 04 Feb 2023 13:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igorinstitute-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=38D6J740N3833rshUE9U2HYtUisuJRur7dCUFd2NB3Q=;
 b=TdZgv/XTCjn5Ew2w8CRX1nwLXdxhnkY8cW+9DDdckH0UZOlxm20bwQaaDKw0vwBqGD
 +47Ab11AHGGLu0/G7uQTJmGSbUhD8HktM7W+aWbH2vTz1LFi8KRQKmHA+EX7LMWGK/XH
 cd/6bp7xiSllIPMU43PFbxta6sx0LJ9t6gUNyDyqqSVdGujFG1GpGUHma6+rjTTf5KiS
 7xYsDEu0QFZgJ+RjKUjFBlJVAa1wqHXKXxF34hEIPK8ARFGoH+08bdRTrE71lfpW89Kk
 cm7sE57ZFzpr2Xu/8DoYbm09Q+lVDIHaQttzTtxIbW+hSu0SQH8sJ4AWQLbr5By+JGoa
 W2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:date:from:references:in-reply-to:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=38D6J740N3833rshUE9U2HYtUisuJRur7dCUFd2NB3Q=;
 b=BnYM4yYOp17X/kckXa1zFWFg4VokTmn31MXeHUNMeiUiYEneDS9j4LQYqTttn3mfs5
 FFZDCDWCkmA2xnufzcPKGd+LrJRvGI6Wv7AzeVlWSo6L2hRy9xwUiCQwZJZq6tS8wFmp
 stQvLGjFXxyxav8zAioITV4RI5onQKv4LFz1Egz64WLTJZblKaK4usrnSf+cLau82fuj
 9qe0r/oA+riRDYzx6DmQJ8aSLHOjtGK+wOjHrj4I1rv/KYBCi4zX4KvEXlpp59kvGK1+
 BRoXsD19zeedtDTduP8MQvDiiRbN63nq8WnZPgBcKr7s7y77ajnkVcpaM744fxrDx2x2
 Qj2w==
X-Gm-Message-State: AO0yUKXM1muNwqhFg+QJPR/hUVZwaz3fzc+t9KjXTi6EkjOrtLA0/SxZ
 SuTCwMM2m054hjk9gFSe/SI2oUvbXt43CWnU
X-Google-Smtp-Source: AK7set/qojJ+xgELZjMGFAfgEw2fG9MMcOPNCpht2AALraSNHtNUcG4xMT0qEvXDwqO2bWtVloWmZg==
X-Received: by 2002:a17:902:ce91:b0:194:7efa:702f with SMTP id
 f17-20020a170902ce9100b001947efa702fmr18052435plg.53.1675544526143; 
 Sat, 04 Feb 2023 13:02:06 -0800 (PST)
Received: from localhost ([121.99.145.49]) by smtp.gmail.com with ESMTPSA id
 jj20-20020a170903049400b00194ab9a4febsm3867973plb.74.2023.02.04.13.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 13:02:05 -0800 (PST)
Message-Id: <85d8ba405cb009a7a3249b556dc8f3bdb1754fdf.1675497326.git.daniel.beer@igorinstitute.com>
In-Reply-To: <cover.1675497326.git.daniel.beer@igorinstitute.com>
References: <cover.1675497326.git.daniel.beer@igorinstitute.com>
From: Daniel Beer <daniel.beer@igorinstitute.com>
Date: Thu, 27 Oct 2022 21:28:31 +1300
Subject: [PATCH v3 1/2] ASoC: tas5805m: rework to avoid scheduling while
 atomic.
To: alsa-devel@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Andy Liu <andy-liu@ti.com>, Mark Brown <broonie@kernel.org>,
 Daniel Beer <daniel.beer@igorinstitute.com>, linux-kernel@vger.kernel.org
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

