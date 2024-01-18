Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9396831E9A
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 18:42:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C32D200;
	Thu, 18 Jan 2024 18:42:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C32D200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705599770;
	bh=vzxBLvgJb8isYTj5TVHeM8UbQ5M2854f6SFk/fABz0E=;
	h=From:Date:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C2W34GgUKCRCs+TB5zCdMr3fw80zH8ht/Bydq7U/L5V16HkgvkeWndA9nQyTABOSf
	 nobqTITt365RK2mhQtXOfpe3QqLkmYGqCqknxrcMtUVp4ciE2NqT4jAyWorKYajgtP
	 zVrzzx0IER3YYUY4PbBestitHwXuszTJrkamQnSs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 812C5F8028D; Thu, 18 Jan 2024 18:42:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F441F8057C;
	Thu, 18 Jan 2024 18:42:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4674F801F5; Thu, 18 Jan 2024 18:42:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi
 [62.142.5.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 859ECF8003A
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 18:41:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 859ECF8003A
Received: from localhost (88-113-24-108.elisa-laajakaista.fi [88.113.24.108])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id decf6c38-b628-11ee-b3cf-005056bd6ce9;
	Thu, 18 Jan 2024 19:41:55 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Thu, 18 Jan 2024 19:41:54 +0200
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linus.walleij@linaro.org, vkoul@kernel.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 6/6] ASoC: cs42l43: Add support for the cs42l43
Message-ID: <Zali4qxdegY7H6eY@surfacebook.localdomain>
References: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
 <20230804104602.395892-7-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804104602.395892-7-ckeepax@opensource.cirrus.com>
Message-ID-Hash: YASWZGFHW5UBUUBCTAZIJKPXMBKFXTJQ
X-Message-ID-Hash: YASWZGFHW5UBUUBCTAZIJKPXMBKFXTJQ
X-MailFrom: andy.shevchenko@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YASWZGFHW5UBUUBCTAZIJKPXMBKFXTJQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fri, Aug 04, 2023 at 11:46:02AM +0100, Charles Keepax kirjoitti:
> The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
> (Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
> for portable applications. It provides a high dynamic range, stereo
> DAC for headphone output, two integrated Class D amplifiers for
> loudspeakers, and two ADCs for wired headset microphone input or
> stereo line input. PDM inputs are provided for digital microphones.
> 
> The ASoC component provides the majority of the functionality of the
> device, all the audio functions.

...

> +static const unsigned int cs42l43_accdet_us[] = {
> +	20, 100, 1000, 10000, 50000, 75000, 100000, 200000

+ comma.

> +};
> +
> +static const unsigned int cs42l43_accdet_db_ms[] = {
> +	0, 125, 250, 500, 750, 1000, 1250, 1500

Ditto.

> +};
> +
> +static const unsigned int cs42l43_accdet_ramp_ms[] = { 10, 40, 90, 170 };
> +
> +static const unsigned int cs42l43_accdet_bias_sense[] = {
> +	14, 23, 41, 50, 60, 68, 86, 95, 0,

(as you done it here)

> +};

...

> +int cs42l43_set_jack(struct snd_soc_component *component,
> +		     struct snd_soc_jack *jack, void *d)
> +{
> +	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
> +	struct cs42l43 *cs42l43 = priv->core;
> +	/* This tip sense invert is always set, HW wants an inverted signal */
> +	unsigned int tip_deb = CS42L43_TIPSENSE_INV_MASK;
> +	unsigned int hs2 = 0x2 << CS42L43_HSDET_MODE_SHIFT;

BIT(1) ?

> +	unsigned int autocontrol = 0, pdncntl = 0;
> +	int ret;
> +
> +	dev_dbg(priv->dev, "Configure accessory detect\n");
> +
> +	ret = pm_runtime_resume_and_get(priv->dev);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to resume for jack config: %d\n", ret);
> +		return ret;
> +	}

> +	mutex_lock(&priv->jack_lock);

Use cleanup.h?

> +	priv->jack_hp = jack;
> +
> +	if (!jack)
> +		goto done;
> +
> +	ret = device_property_count_u32(cs42l43->dev, "cirrus,buttons-ohms");
> +	if (ret != -EINVAL) {
> +		if (ret < 0) {
> +			dev_err(priv->dev, "Property cirrus,buttons-ohms malformed: %d\n",
> +				ret);
> +			goto error;
> +		}
> +
> +		if (ret > CS42L43_N_BUTTONS) {
> +			ret = -EINVAL;
> +			dev_err(priv->dev, "Property cirrus,buttons-ohms too many entries\n");
> +			goto error;
> +		}
> +
> +		device_property_read_u32_array(cs42l43->dev, "cirrus,buttons-ohms",
> +					       priv->buttons, ret);

Strictly speaking this might fail, better to check the error code again.

> +	} else {
> +		priv->buttons[0] = 70;
> +		priv->buttons[1] = 185;
> +		priv->buttons[2] = 355;
> +		priv->buttons[3] = 735;
> +	}
> +
> +	ret = cs42l43_find_index(priv, "cirrus,detect-us", 10000, &priv->detect_us,
> +				 cs42l43_accdet_us, ARRAY_SIZE(cs42l43_accdet_us));
> +	if (ret < 0)
> +		goto error;
> +
> +	hs2 |= ret << CS42L43_AUTO_HSDET_TIME_SHIFT;
> +
> +	priv->bias_low = device_property_read_bool(cs42l43->dev, "cirrus,bias-low");
> +
> +	ret = cs42l43_find_index(priv, "cirrus,bias-ramp-ms", 170,
> +				 &priv->bias_ramp_ms, cs42l43_accdet_ramp_ms,
> +				 ARRAY_SIZE(cs42l43_accdet_ramp_ms));
> +	if (ret < 0)
> +		goto error;
> +
> +	hs2 |= ret << CS42L43_HSBIAS_RAMP_SHIFT;
> +
> +	ret = cs42l43_find_index(priv, "cirrus,bias-sense-microamp", 0,
> +				 &priv->bias_sense_ua, cs42l43_accdet_bias_sense,
> +				 ARRAY_SIZE(cs42l43_accdet_bias_sense));
> +	if (ret < 0)
> +		goto error;
> +
> +	if (priv->bias_sense_ua)
> +		autocontrol |= ret << CS42L43_HSBIAS_SENSE_TRIP_SHIFT;
> +
> +	if (!device_property_read_bool(cs42l43->dev, "cirrus,button-automute"))
> +		autocontrol |= CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK;
> +
> +	ret = device_property_read_u32(cs42l43->dev, "cirrus,tip-debounce-ms",
> +				       &priv->tip_debounce_ms);
> +	if (ret < 0 && ret != -EINVAL) {
> +		dev_err(priv->dev, "Property cirrus,tip-debounce-ms malformed: %d\n", ret);
> +		goto error;
> +	}
> +
> +	/* This tip sense invert is set normally, as TIPSENSE_INV already inverted */
> +	if (device_property_read_bool(cs42l43->dev, "cirrus,tip-invert"))
> +		autocontrol |= 0x1 << CS42L43_JACKDET_INV_SHIFT;
> +
> +	if (device_property_read_bool(cs42l43->dev, "cirrus,tip-disable-pullup"))
> +		autocontrol |= 0x1 << CS42L43_JACKDET_MODE_SHIFT;

BIT(0) ?

> +	else
> +		autocontrol |= 0x3 << CS42L43_JACKDET_MODE_SHIFT;

GENMASK(1, 0) ?

> +
> +	ret = cs42l43_find_index(priv, "cirrus,tip-fall-db-ms", 500,
> +				 NULL, cs42l43_accdet_db_ms,
> +				 ARRAY_SIZE(cs42l43_accdet_db_ms));
> +	if (ret < 0)
> +		goto error;
> +
> +	tip_deb |= ret << CS42L43_TIPSENSE_FALLING_DB_TIME_SHIFT;
> +
> +	ret = cs42l43_find_index(priv, "cirrus,tip-rise-db-ms", 500,
> +				 NULL, cs42l43_accdet_db_ms,
> +				 ARRAY_SIZE(cs42l43_accdet_db_ms));
> +	if (ret < 0)
> +		goto error;
> +
> +	tip_deb |= ret << CS42L43_TIPSENSE_RISING_DB_TIME_SHIFT;
> +
> +	if (device_property_read_bool(cs42l43->dev, "cirrus,use-ring-sense")) {
> +		unsigned int ring_deb = 0;
> +
> +		priv->use_ring_sense = true;
> +
> +		/* HW wants an inverted signal, so invert the invert */
> +		if (!device_property_read_bool(cs42l43->dev, "cirrus,ring-invert"))
> +			ring_deb |= CS42L43_RINGSENSE_INV_MASK;
> +
> +		if (!device_property_read_bool(cs42l43->dev,
> +					       "cirrus,ring-disable-pullup"))
> +			ring_deb |= CS42L43_RINGSENSE_PULLUP_PDNB_MASK;
> +
> +		ret = cs42l43_find_index(priv, "cirrus,ring-fall-db-ms", 500,
> +					 NULL, cs42l43_accdet_db_ms,
> +					 ARRAY_SIZE(cs42l43_accdet_db_ms));
> +		if (ret < 0)
> +			goto error;
> +
> +		ring_deb |= ret << CS42L43_RINGSENSE_FALLING_DB_TIME_SHIFT;
> +
> +		ret = cs42l43_find_index(priv, "cirrus,ring-rise-db-ms", 500,
> +					 NULL, cs42l43_accdet_db_ms,
> +					 ARRAY_SIZE(cs42l43_accdet_db_ms));
> +		if (ret < 0)
> +			goto error;
> +
> +		ring_deb |= ret << CS42L43_RINGSENSE_RISING_DB_TIME_SHIFT;
> +		pdncntl |= CS42L43_RING_SENSE_EN_MASK;
> +
> +		regmap_update_bits(cs42l43->regmap, CS42L43_RINGSENSE_DEB_CTRL,
> +				   CS42L43_RINGSENSE_INV_MASK |
> +				   CS42L43_RINGSENSE_PULLUP_PDNB_MASK |
> +				   CS42L43_RINGSENSE_FALLING_DB_TIME_MASK |
> +				   CS42L43_RINGSENSE_RISING_DB_TIME_MASK,
> +				   ring_deb);
> +	}
> +
> +	regmap_update_bits(cs42l43->regmap, CS42L43_TIPSENSE_DEB_CTRL,
> +			   CS42L43_TIPSENSE_INV_MASK |
> +			   CS42L43_TIPSENSE_FALLING_DB_TIME_MASK |
> +			   CS42L43_TIPSENSE_RISING_DB_TIME_MASK, tip_deb);
> +	regmap_update_bits(cs42l43->regmap, CS42L43_HS2,
> +			   CS42L43_HSBIAS_RAMP_MASK | CS42L43_HSDET_MODE_MASK |
> +			   CS42L43_AUTO_HSDET_TIME_MASK, hs2);
> +
> +done:
> +	ret = 0;
> +
> +	regmap_update_bits(cs42l43->regmap, CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
> +			   CS42L43_JACKDET_MODE_MASK | CS42L43_S0_AUTO_ADCMUTE_DISABLE_MASK |
> +			   CS42L43_HSBIAS_SENSE_TRIP_MASK, autocontrol);
> +	regmap_update_bits(cs42l43->regmap, CS42L43_PDNCNTL,
> +			   CS42L43_RING_SENSE_EN_MASK, pdncntl);
> +
> +	dev_dbg(priv->dev, "Successfully configured accessory detect\n");
> +
> +error:
> +	mutex_unlock(&priv->jack_lock);
> +
> +	pm_runtime_mark_last_busy(priv->dev);
> +	pm_runtime_put_autosuspend(priv->dev);
> +
> +	return ret;
> +}

...

> +static void cs42l43_start_hs_bias(struct cs42l43_codec *priv, bool force_high)
> +{
> +	struct cs42l43 *cs42l43 = priv->core;
> +	unsigned int val = 0x3 << CS42L43_HSBIAS_MODE_SHIFT;

GENMASK() ?

> +
> +	dev_dbg(priv->dev, "Start headset bias\n");
> +
> +	regmap_update_bits(cs42l43->regmap, CS42L43_HS2,
> +			   CS42L43_HS_CLAMP_DISABLE_MASK, CS42L43_HS_CLAMP_DISABLE_MASK);
> +
> +	if (!force_high && priv->bias_low)
> +		val = 0x2 << CS42L43_HSBIAS_MODE_SHIFT;

BIT(1) ?

> +	regmap_update_bits(cs42l43->regmap, CS42L43_MIC_DETECT_CONTROL_1,
> +			   CS42L43_HSBIAS_MODE_MASK, val);
> +
> +	msleep(priv->bias_ramp_ms);
> +}

...

> +static void cs42l43_start_button_detect(struct cs42l43_codec *priv)
> +{
> +	struct cs42l43 *cs42l43 = priv->core;
> +	unsigned int val = 0x3 << CS42L43_BUTTON_DETECT_MODE_SHIFT;

GENMASK() ?

> +	dev_dbg(priv->dev, "Start button detect\n");
> +
> +	priv->button_detect_running = true;
> +
> +	if (priv->bias_low)
> +		val = 0x1 << CS42L43_BUTTON_DETECT_MODE_SHIFT;

BIT(0) ?

> +	regmap_update_bits(cs42l43->regmap, CS42L43_MIC_DETECT_CONTROL_1,
> +			   CS42L43_BUTTON_DETECT_MODE_MASK |
> +			   CS42L43_MIC_LVL_DET_DISABLE_MASK, val);
> +
> +	if (priv->bias_sense_ua) {
> +		regmap_update_bits(cs42l43->regmap,
> +				   CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
> +				   CS42L43_HSBIAS_SENSE_EN_MASK |
> +				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK,
> +				   CS42L43_HSBIAS_SENSE_EN_MASK |
> +				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK);
> +	}
> +}

...

Okay, looks like those shifted values more like individual numbers (not bits or
masks), ideally they would be defined with the proper names...

...

> +	int timeout_ms = ((2 * priv->detect_us) / 1000) + 200;

USEC_PER_MSEC ?

...

> +static const char * const cs42l43_jack_text[] = {
> +	"None", "CTIA", "OMTP", "Headphone", "Line-Out",
> +	"Line-In", "Microphone", "Optical",

Better to have this by power of 2 blocks (seems it's related to the possible
values ranges in the HW).
If it's just a coincidence that there are 8 of them, perhaps other (logical)
grouping is better?

> +};

...

> +	BUILD_BUG_ON(ARRAY_SIZE(cs42l43_jack_override_modes) !=
> +		     ARRAY_SIZE(cs42l43_jack_text) - 1);

Use static_assert() instead.

...

> +#define CS42L43_IRQ_COMPLETE(name) \
> +static irqreturn_t cs42l43_##name(int irq, void *data) \
> +{ \
> +	struct cs42l43_codec *priv = data; \
> +	dev_dbg(priv->dev, #name " completed\n"); \
> +	complete(&priv->name); \
> +	return IRQ_HANDLED; \
> +}
> +
> +CS42L43_IRQ_COMPLETE(pll_ready)
> +CS42L43_IRQ_COMPLETE(hp_startup)
> +CS42L43_IRQ_COMPLETE(hp_shutdown)
> +CS42L43_IRQ_COMPLETE(type_detect)
> +CS42L43_IRQ_COMPLETE(spkr_shutdown)
> +CS42L43_IRQ_COMPLETE(spkl_shutdown)
> +CS42L43_IRQ_COMPLETE(spkr_startup)
> +CS42L43_IRQ_COMPLETE(spkl_startup)
> +CS42L43_IRQ_COMPLETE(load_detect)

#undef?

...

> +static void cs42l43_mask_to_slots(struct cs42l43_codec *priv, unsigned int mask, int *slots)
> +{
> +	int i;
> +
> +	for (i = 0; i < CS42L43_ASP_MAX_CHANNELS; ++i) {
> +		int slot = ffs(mask) - 1;
> +
> +		if (slot < 0)
> +			return;
> +
> +		slots[i] = slot;
> +
> +		mask &= ~(1 << slot);
> +	}

for_each_set_bit() ?

> +	if (mask)
> +		dev_warn(priv->dev, "Too many channels in TDM mask\n");
> +}

...

> +static int cs42l43_decim_get(struct snd_kcontrol *kcontrol,
> +			     struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
> +	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	ret = cs42l43_shutter_get(priv, CS42L43_STATUS_MIC_SHUTTER_MUTE_SHIFT);
> +	if (ret < 0)
> +		return ret;
> +	else if (!ret)

Reundant 'else'

> +		ucontrol->value.integer.value[0] = ret;
> +	else
> +		ret = cs42l43_dapm_get_volsw(kcontrol, ucontrol);

and why not positive check?

> +	return ret;

Or even simply as

	if (ret > 0)
		ret = cs42l43_dapm_get_volsw(kcontrol, ucontrol);
	else if (ret == 0)
		ucontrol->value.integer.value[0] = ret;

	return ret;

> +}

...

> +static int cs42l43_spk_get(struct snd_kcontrol *kcontrol,
> +			   struct snd_ctl_elem_value *ucontrol)

As per above.

...

> +	while (freq > cs42l43_pll_configs[ARRAY_SIZE(cs42l43_pll_configs) - 1].freq) {
> +		div++;
> +		freq /= 2;
> +	}

fls() / fls_long()?

...

> +	if (!time_left)
> +		return -ETIMEDOUT;
> +	else
> +		return 0;

Redundant 'else'.

...

> +	// Don't use devm as we need to get against the MFD device

This is weird...

> +	priv->mclk = clk_get_optional(cs42l43->dev, "mclk");
> +	if (IS_ERR(priv->mclk)) {
> +		dev_err_probe(priv->dev, PTR_ERR(priv->mclk), "Failed to get mclk\n");
> +		goto err_pm;
> +	}
> +
> +	ret = devm_snd_soc_register_component(priv->dev, &cs42l43_component_drv,
> +					      cs42l43_dais, ARRAY_SIZE(cs42l43_dais));
> +	if (ret) {
> +		dev_err_probe(priv->dev, ret, "Failed to register component\n");
> +		goto err_clk;
> +	}
> +
> +	pm_runtime_mark_last_busy(priv->dev);
> +	pm_runtime_put_autosuspend(priv->dev);
> +
> +	return 0;
> +
> +err_clk:
> +	clk_put(priv->mclk);
> +err_pm:
> +	pm_runtime_put_sync(priv->dev);
> +
> +	return ret;
> +}
> +
> +static int cs42l43_codec_remove(struct platform_device *pdev)
> +{
> +	struct cs42l43_codec *priv = platform_get_drvdata(pdev);
> +
> +	clk_put(priv->mclk);

You have clocks put before anything else, and your remove order is broken now.

To fix this (in case you may not used devm_clk_get() call), you should drop
devm calls all way after the clk_get(). Do we have
snd_soc_register_component()? If yes, use it to fix.

I believe you never tested rmmod/modprobe in a loop.

> +	return 0;
> +}

...

> +static const struct dev_pm_ops cs42l43_codec_pm_ops = {
> +	SET_RUNTIME_PM_OPS(NULL, cs42l43_codec_runtime_resume, NULL)
> +};

Why not new PM macros?

...

> +		.pm	= &cs42l43_codec_pm_ops,

pm_sleep_ptr()?

...

> +#include <linux/clk.h>

> +#include <linux/device.h>

> +#include <linux/regmap.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/types.h>
> +#include <sound/cs42l43.h>
> +#include <sound/pcm.h>
> +#include <sound/soc-jack.h>

This block is messed up. Some headers can be replaced by forward declarations,
some are missing... Please, follow IWYU principle.

...

> +#ifndef CS42L43_ASOC_INT_H
> +#define CS42L43_ASOC_INT_H

Why not guarding other inclusions? It makes build slower!

-- 
With Best Regards,
Andy Shevchenko


