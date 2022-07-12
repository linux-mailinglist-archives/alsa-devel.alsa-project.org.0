Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D05DF571F13
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 17:26:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 663FA1631;
	Tue, 12 Jul 2022 17:26:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 663FA1631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657639612;
	bh=j8a2E/q1G95CkSURyhdmyH9taoWE+2LrSCfgwmpTqLI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kewPTrTApO15ZAM1c6no8AYuFTHsEhmNG3tjgmNGJeI1kHQkRX2eUUj/9Nthw/L67
	 xF0Rv1uO0AZGeYW1+6obytD2WjblAzT2hwnOdz+qIIRges4IXpedDRovgt1R+AWfv7
	 dRdHUMXU/eVpsnQ6md36seRirQscMQiKIlmf7cEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC56BF800BD;
	Tue, 12 Jul 2022 17:25:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24B41F80246; Tue, 12 Jul 2022 17:25:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53432F800BD
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 17:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53432F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Dy3AkMwQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657639544; x=1689175544;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=j8a2E/q1G95CkSURyhdmyH9taoWE+2LrSCfgwmpTqLI=;
 b=Dy3AkMwQiwS9mB7Q2pyS/9xPbGqonPI7fFwPQe2fEjQbEEPVLO1SaPqx
 CaLLcuzLCqvUp6+K8UW4zwOBY1jqH4gbiga9R7k8sWN+0D8rFKuUR1jwg
 Os2a7I2/s6gyBMWAlEWnVn5QaGN5OgKiNy8+q9srq6Y2x+eXRrALXjYi3
 umhjmnMCirfShDJb7QIi5MCVHVYovx6vQq8rPoT14SVVl8SRBZLpVnemm
 Qmoam2Z1sw6uYVXjfzwAqG7zPLwaAKcTt9dIhRizlX2tuLu8pjKayloZ0
 lYiKa+FV+UMukqsCrXyDaC68ikbJ5dsgdTXhxppWze+KmG+uBUsgJ7eFW g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="283718676"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="283718676"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 08:25:39 -0700
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="545469839"
Received: from vly-mobl.amr.corp.intel.com (HELO [10.209.148.165])
 ([10.209.148.165])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 08:25:37 -0700
Message-ID: <f88ec5f9-b46b-e72d-1fc3-668b834ed105@linux.intel.com>
Date: Tue, 12 Jul 2022 10:17:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] ASoC: codecs: add support for ES8326
Content-Language: en-US
To: Zhu Ning <zhuning0077@gmail.com>, alsa-devel@alsa-project.org
References: <20220712144153.6631-1-zhuning0077@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220712144153.6631-1-zhuning0077@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, broonie@kernel.org, tiwai@suse.com,
 David Yang <yangxiaohua@everest-semi.com>, Zhu Ning <zhuning@everest-semi.com>
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




> +static void es8326_jack_detect_handler(struct work_struct *work)
> +{
> +	struct es8326_priv *es8326 =
> +		container_of(work, struct es8326_priv, jack_detect_work.work);
> +	struct snd_soc_component *comp = es8326->component;
> +	unsigned int iface;
> +
> +	iface = snd_soc_component_read(comp, ES8326_HP_DECTECT_FB);

ES8326_HP_DETECT_FB


> +	dev_dbg(comp->dev, "gpio flag %#04x", iface);
> +	if ((iface & ES8326_HPINSERT_FLAG) == 0) {
> +		dev_dbg(comp->dev, "No headset detected");
> +		snd_soc_jack_report(es8326->jack, 0, SND_JACK_HEADSET);

should you check if es8326->jack is set?
in the 8316 driver you have a check for a spurious interrupt before
set_jack() is called

> +		snd_soc_component_write(comp, ES8326_ADC1_SRC_2A, es8326->mic2_src);
> +		snd_soc_component_write(comp, ES8326_ANA_MICBIAS_1B, 0x70);
> +	} else if ((iface & ES8326_HPINSERT_FLAG) == ES8326_HPINSERT_FLAG) {
> +		if ((iface & ES8326_HPBUTTON_FLAG) == 0x00) {
> +			dev_dbg(comp->dev, "Headset detected");
> +			snd_soc_jack_report(es8326->jack, SND_JACK_HEADSET, SND_JACK_HEADSET);
> +			snd_soc_component_write(comp, ES8326_ADC1_SRC_2A, es8326->mic1_src);
> +		} else {
> +			dev_dbg(comp->dev, "Headphone detected");
> +			snd_soc_jack_report(es8326->jack, SND_JACK_HEADPHONE, SND_JACK_HEADSET);
> +		}
> +	}
> +}
> +
> +static irqreturn_t es8326_irq(int irq, void *dev_id)
> +{
> +	struct es8326_priv *es8326 = dev_id;
> +	struct snd_soc_component *comp = es8326->component;
> +
> +	snd_soc_component_write(comp, ES8326_ANA_MICBIAS_1B, 0x7c);

this ES8326_ANA_MICBIAS_1B register is also modified in the workqueue,
could this lead to invalid configurations?

> +
> +	queue_delayed_work(system_wq, &es8326->jack_detect_work,
> +			   msecs_to_jiffies(300));
> +
> +	return IRQ_HANDLED;
> +}

> +static int es8326_pcm_hw_params(struct snd_pcm_substream *substream,
> +				struct snd_pcm_hw_params *params,
> +				struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *codec = dai->component;
> +	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(codec);
> +	u8 srate = 0;
> +	int coeff;
> +
> +	coeff = get_coeff(es8326->sysclk, params_rate(params));
> +	/* bit size */
> +	switch (params_format(params)) {
> +	case SNDRV_PCM_FORMAT_S16_LE:
> +		srate |= ES8326_S16_LE;
> +		break;
> +	case SNDRV_PCM_FORMAT_S20_3LE:
> +		srate |= ES8326_S20_3_LE;
> +		break;
> +	case SNDRV_PCM_FORMAT_S18_3LE:
> +		srate |= ES8326_S18_LE;
> +		break;
> +	case SNDRV_PCM_FORMAT_S24_LE:
> +		srate |= ES8326_S24_LE;
> +		break;
> +	case SNDRV_PCM_FORMAT_S32_LE:
> +		srate |= ES8326_S32_LE;
> +		break;
> +	default:
> +		break;

was this intentional or is return -EINVAL; more relevant for formats
that are not in the supported list above?

> +	}
> +
> +	/* set iface & srate */
> +	snd_soc_component_update_bits(codec, ES8326_FMT_13, ES8326_DATA_LEN_MASK, srate);
> +
> +	if (coeff >= 0) {
> +		regmap_write(es8326->regmap,  ES8326_CLK_DIV1_04,
> +			     coeff_div[coeff].reg4);
> +		regmap_write(es8326->regmap,  ES8326_CLK_DIV2_05,
> +			     coeff_div[coeff].reg5);
> +		regmap_write(es8326->regmap,  ES8326_CLK_DLL_06,
> +			     coeff_div[coeff].reg6);
> +		regmap_write(es8326->regmap,  ES8326_CLK_MUX_07,
> +			     coeff_div[coeff].reg7);
> +		regmap_write(es8326->regmap,  ES8326_CLK_ADC_SEL_08,
> +			     coeff_div[coeff].reg8);
> +		regmap_write(es8326->regmap,  ES8326_CLK_DAC_SEL_09,
> +			     coeff_div[coeff].reg9);
> +		regmap_write(es8326->regmap,  ES8326_CLK_ADC_OSR_0A,
> +			     coeff_div[coeff].rega);
> +		regmap_write(es8326->regmap,  ES8326_CLK_DAC_OSR_0B,
> +			     coeff_div[coeff].regb);
> +	}
> +
> +	return 0;
> +}
> +
> +static int es8326_set_bias_level(struct snd_soc_component *codec,
> +				 enum snd_soc_bias_level level)
> +{
> +	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(codec);
> +	int ret;
> +
> +	switch (level) {
> +	case SND_SOC_BIAS_ON:		
> +		if (!IS_ERR(es8326->mclk)) {
> +			if (snd_soc_component_get_bias_level(codec) == SND_SOC_BIAS_ON) {
> +				clk_disable_unprepare(es8326->mclk);

not following this. if the level is BIAS_ON already, why would you
disable/unprepare the mclk?

> +			} else {
> +				ret = clk_prepare_enable(es8326->mclk);
> +				if (ret)
> +					return ret;
> +			}
> +		}
> +		regmap_write(es8326->regmap, ES8326_RESET_00, ES8326_PWRUP_SEQ_EN);
> +		regmap_write(es8326->regmap, ES8326_INTOUT_IO_59, 0x45);
> +		regmap_write(es8326->regmap, ES8326_SDINOUT1_IO_5A,
> +			    (ES8326_IO_DMIC_CLK << ES8326_SDINOUT1_SHIFT));
> +		regmap_write(es8326->regmap, ES8326_SDINOUT23_IO_5B, ES8326_IO_INPUT);
> +		regmap_write(es8326->regmap, ES8326_CLK_RESAMPLE_03, 0x05);
> +		regmap_write(es8326->regmap, ES8326_VMIDSEL_18, 0x02);
> +		regmap_write(es8326->regmap, ES8326_PGA_PDN_17, 0x40);
> +		regmap_write(es8326->regmap, ES8326_DAC2HPMIX_25, 0xAA);
> +		regmap_write(es8326->regmap, ES8326_RESET_00, ES8326_CSM_ON);
> +		break;
> +	case SND_SOC_BIAS_PREPARE:
> +		break;
> +	case SND_SOC_BIAS_STANDBY:
> +		break;
> +	case SND_SOC_BIAS_OFF:
> +		if (es8326->mclk)
> +			clk_disable_unprepare(es8326->mclk);
> +		regmap_write(es8326->regmap, ES8326_DAC2HPMIX_25, 0x11);
> +		regmap_write(es8326->regmap, ES8326_RESET_00, ES8326_CSM_OFF);
> +		regmap_write(es8326->regmap, ES8326_PGA_PDN_17, 0xF8);
> +		regmap_write(es8326->regmap, ES8326_VMIDSEL_18, 0x00);
> +		regmap_write(es8326->regmap, ES8326_INT_SOURCE_58, 0x08);
> +		regmap_write(es8326->regmap, ES8326_SDINOUT1_IO_5A, ES8326_IO_INPUT);
> +		regmap_write(es8326->regmap, ES8326_SDINOUT23_IO_5B, ES8326_IO_INPUT);
> +		regmap_write(es8326->regmap, ES8326_RESET_00,
> +			     ES8326_CODEC_RESET | ES8326_PWRUP_SEQ_EN);
> +		break;
> +	}
> +
> +	return 0;
> +}

> +static int es8326_resume(struct snd_soc_component *component)
> +{
> +	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
> +
> +	regmap_write(es8326->regmap, ES8326_CLK_CTL_01, ES8326_CLK_ON);
> +	/* Two channel ADC */
> +	regmap_write(es8326->regmap, ES8326_PULLUP_CTL_F9, 0x02);
> +	regmap_write(es8326->regmap, ES8326_CLK_INV_02, 0x00);
> +	regmap_write(es8326->regmap, ES8326_CLK_DIV_CPC_0C, 0x1F);
> +	regmap_write(es8326->regmap, ES8326_CLK_VMIDS1_10, 0xC8);
> +	regmap_write(es8326->regmap, ES8326_CLK_VMIDS2_11, 0x88);
> +	regmap_write(es8326->regmap, ES8326_CLK_CAL_TIME_12, 0x20);
> +	regmap_write(es8326->regmap, ES8326_SYS_BIAS_1D, 0x08);
> +	regmap_write(es8326->regmap, ES8326_DAC2HPMIX_25, 0x22);
> +	regmap_write(es8326->regmap, ES8326_ADC1_SRC_2A, es8326->mic1_src);
> +	regmap_write(es8326->regmap, ES8326_ADC2_SRC_2B, es8326->mic2_src);
> +	regmap_write(es8326->regmap, ES8326_HPJACK_TIMER_56, 0x88);
> +	regmap_write(es8326->regmap, ES8326_HP_DET_57,
> +		     ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol);
> +	regmap_write(es8326->regmap, ES8326_INT_SOURCE_58, 0x08);
> +	regmap_write(es8326->regmap, ES8326_INTOUT_IO_59, 0x45);
> +	regmap_write(es8326->regmap, ES8326_RESET_00, ES8326_CSM_ON);
> +	snd_soc_component_update_bits(component, ES8326_PAGGAIN_23,
> +				      ES8326_MIC_SEL_MASK, ES8326_MIC1_SEL);
> +
> +	es8326_irq(es8326->irq, es8326);
> +	return 0;
> +}
> +
> +static int es8326_probe(struct snd_soc_component *component)
> +{
> +	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
> +	int ret;
> +	u8 reg;
> +
> +	es8326->component = component;
> +	es8326->jd_inverted = device_property_read_bool(component->dev,
> +							"everest,jack-detect-inverted");
> +
> +	ret = device_property_read_u8(component->dev, "everest,mic1-src", &es8326->mic1_src);
> +	if (ret != 0) {
> +		dev_dbg(component->dev, "mic1-src return %d", ret);
> +		es8326->mic1_src = ES8326_ADC_AMIC;
> +	}
> +	dev_dbg(component->dev, "mic1-src %x", es8326->mic1_src);
> +
> +	ret = device_property_read_u8(component->dev, "everest,mic2-src", &es8326->mic2_src);
> +	if (ret != 0) {
> +		dev_dbg(component->dev, "mic2-src return %d", ret);
> +		es8326->mic2_src = ES8326_ADC_DMIC;
> +	}
> +	dev_dbg(component->dev, "mic2-src %x", es8326->mic2_src);
> +
> +	ret = device_property_read_u8(component->dev, "everest,jack-pol", &es8326->jack_pol);
> +	if (ret != 0) {
> +		dev_dbg(component->dev, "jack-pol return %d", ret);
> +		es8326->jack_pol = ES8326_HP_DET_BUTTON_POL | ES8326_HP_TYPE_OMTP;
> +	}
> +	dev_dbg(component->dev, "jack-pol %x", es8326->jack_pol);
> +
> +	es8326_resume(component);
> +	return 0;
> +}
> +
> +static void es8326_enable_jack_detect(struct snd_soc_component *component,
> +				struct snd_soc_jack *jack)
> +{
> +	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
> +
> +	mutex_lock(&es8326->lock);
> +	if (es8326->jd_inverted)
> +		snd_soc_component_update_bits(component, ES8326_HP_DET_57,
> +					      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
> +	es8326->jack = jack;
> +
> +	mutex_unlock(&es8326->lock);
> +	es8326_irq(es8326->irq, es8326);
> +}
> +
> +static void es8326_disable_jack_detect(struct snd_soc_component *component)
> +{
> +	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
> +
> +	dev_dbg(component->dev, "Enter into %s\n", __func__);
> +	if (!es8326->jack)
> +		return; /* Already disabled (or never enabled) */
> +
> +	cancel_delayed_work_sync(&es8326->jack_detect_work);
> +
> +	mutex_lock(&es8326->lock);
> +	if (es8326->jack->status & SND_JACK_MICROPHONE)
> +		snd_soc_jack_report(es8326->jack, 0, SND_JACK_BTN_0);
> +
> +	es8326->jack = NULL;
> +	mutex_unlock(&es8326->lock);
> +}
> +
> +static int es8326_set_jack(struct snd_soc_component *component,
> +			struct snd_soc_jack *jack, void *data)
> +{
> +	if (jack)
> +		es8326_enable_jack_detect(component, jack);
> +	else
> +		es8326_disable_jack_detect(component);
> +
> +	return 0;
> +}
> +
> +static void es8326_remove(struct snd_soc_component *component)
> +{
> +	es8326_disable_jack_detect(component);
> +	es8326_set_bias_level(component, SND_SOC_BIAS_OFF);
> +}
> +
> +static const struct snd_soc_component_driver soc_component_dev_es8326 = {
> +	.probe = es8326_probe,
> +	.remove = es8326_remove,
> +	.resume = es8326_resume,

it's rather odd that there's a resume but no suspend?

> +	.set_bias_level = es8326_set_bias_level,
> +	.set_jack = es8326_set_jack,
> +
> +	.dapm_widgets = es8326_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(es8326_dapm_widgets),
> +	.dapm_routes = es8326_dapm_routes,
> +	.num_dapm_routes = ARRAY_SIZE(es8326_dapm_routes),
> +	.controls = es8326_snd_controls,
> +	.num_controls = ARRAY_SIZE(es8326_snd_controls),
> +};
> +
> +static int es8326_i2c_probe(struct i2c_client *i2c,
> +			    const struct i2c_device_id *id)
> +{
> +	struct es8326_priv *es8326;
> +	int ret;
> +
> +	es8326 = devm_kzalloc(&i2c->dev, sizeof(struct es8326_priv), GFP_KERNEL);
> +	if (!es8326)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(i2c, es8326);
> +	es8326->i2c = i2c;
> +	mutex_init(&es8326->lock);
> +	es8326->regmap = devm_regmap_init_i2c(i2c, &es8326_regmap_config);
> +	if (IS_ERR(es8326->regmap)) {
> +		ret = PTR_ERR(es8326->regmap);
> +		dev_err(&i2c->dev, "Failed to init regmap: %d\n", ret);
> +		return ret;
> +	}
> +
> +	es8326->irq = i2c->irq;
> +	/* ES8316 is level-based while ES8326 is edge-based */
> +	ret = devm_request_threaded_irq(&i2c->dev, es8326->irq, NULL, es8326_irq,
> +					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
> +					"es8326", es8326);
> +	if (ret)
> +		dev_err(&i2c->dev, "Failed to reguest IRQ: %d\n", ret);
> +	INIT_DELAYED_WORK(&es8326->jack_detect_work,
> +			  es8326_jack_detect_handler);
> +
> +	es8326->mclk = devm_clk_get_optional(&i2c->dev, "mclk");
> +	if (IS_ERR(es8326->mclk)) {
> +		dev_err(&i2c->dev, "unable to get mclk\n");
> +		return PTR_ERR(es8326->mclk);
> +	}

do you need to handle the -EPROBE_DEFER case?

> +	if (!es8326->mclk)
> +		dev_warn(&i2c->dev, "assuming static mclk\n");
> +
> +	ret = clk_prepare_enable(es8326->mclk);
> +	if (ret) {
> +		dev_err(&i2c->dev, "unable to enable mclk\n");
> +		return ret;
> +	}
> +	return devm_snd_soc_register_component(&i2c->dev,
> +					&soc_component_dev_es8326,
> +					&es8326_dai, 1);
> +}

> diff --git a/sound/soc/codecs/es8326.h b/sound/soc/codecs/es8326.h
> new file mode 100755
> index 000000000000..23a099add4d8
> --- /dev/null
> +++ b/sound/soc/codecs/es8326.h
> @@ -0,0 +1,187 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * es8326.c -- es8326 ALSA SoC audio driver
> + * Copyright Everest Semiconductor Co.,Ltd
> + *
> + * Authors: David Yang <yangxiaohua@everest-semi.com>
> + */
> +
> +#ifndef _ES8326_H
> +#define _ES8326_H
> +
> +#define CONFIG_HHTECH_MINIPMP	1
> +
> +/* ES8326 register space */
> +
> +#define ES8326_RESET_00         0x00
> +#define ES8326_CLK_CTL_01         0x01
> +#define ES8326_CLK_INV_02        0x02
> +#define ES8326_CLK_RESAMPLE_03         0x03
> +#define ES8326_CLK_DIV1_04        0x04
> +#define ES8326_CLK_DIV2_05       0x05
> +#define ES8326_CLK_DLL_06       0x06
> +#define ES8326_CLK_MUX_07      0x07
> +#define ES8326_CLK_ADC_SEL_08       0x08
> +#define ES8326_CLK_DAC_SEL_09      0x09
> +#define ES8326_CLK_ADC_OSR_0A      0x0a
> +#define ES8326_CLK_DAC_OSR_0B      0x0b
> +#define ES8326_CLK_DIV_CPC_0C      0x0c
> +#define ES8326_CLK_DIV_BCLK_0D      0x0d
> +#define ES8326_CLK_TRI_0E      0x0e
> +#define ES8326_CLK_DIV_LRCK_0F      0x0f
> +#define ES8326_CLK_VMIDS1_10      0x10
> +#define ES8326_CLK_VMIDS2_11      0x11
> +#define ES8326_CLK_CAL_TIME_12     0x12
> +#define ES8326_FMT_13     0x13
> +
> +#define ES8326_DAC_MUTE_14     0x14
> +#define ES8326_ADC_MUTE_15     0x15
> +#define ES8326_ANA_PDN_16     0x16
> +#define ES8326_PGA_PDN_17      0x17
> +#define ES8326_VMIDSEL_18      0x18
> +#define ES8326_ANA_LOWPOWER_19      0x19
> +#define ES8326_ANA_DMS_1A      0x1a
> +#define ES8326_ANA_MICBIAS_1B      0x1b
> +#define ES8326_ANA_VSEL_1C      0x1c
> +#define ES8326_SYS_BIAS_1D      0x1d
> +#define ES8326_BIAS_SW1_1E      0x1e
> +#define ES8326_BIAS_SW2_1F      0x1f
> +#define ES8326_BIAS_SW3_20     0x20
> +#define ES8326_BIAS_SW4_21     0x21
> +#define ES8326_VMIDLOW_22     0x22
> +
> +#define ES8326_PAGGAIN_23     0x23

PGAGAIN?

> +#define ES8326_HP_DRVIER_24     0x24

HP_DRIVER?

> +#define ES8326_DAC2HPMIX_25     0x25
> +#define ES8326_HP_VOL_26     0x26
> +#define ES8326_HP_CAL_27     0x27
> +#define ES8326_HP_DRIVER_REF_28     0x28
> +#define ES8326_ADC_SCALE_29     0x29
> +#define ES8326_ADC1_SRC_2A     0x2a
> +#define ES8326_ADC2_SRC_2B     0x2b
> +#define ES8326_ADC1_VOL_2C     0x2c
> +#define ES8326_ADC2_VOL_2D     0x2d
> +#define ES8326_ADC_RAMPRATE_2E     0x2e
> +#define ES8326_2F     0x2f
> +#define ES8326_30     0x30
> +#define ES8326_31     0x31
> +#define ES8326_ALC_RECOVERY_32     0x32
> +#define ES8326_ALC_LEVEL_33     0x33
> +#define ES8326_ADC_HPFS1_34     0x34
> +#define ES8326_ADC_HPFS2_35     0x35
> +#define ES8326_ADC_EQ_36		0x36
> +#define ES8326_HP_CAL_4A		0x4A
> +#define ES8326_HPL_OFFSET_INI_4B		0x4B
> +#define ES8326_HPR_OFFSET_INI_4C		0x4C
> +#define ES8326_DAC_DSM_4D		0x4D
> +#define ES8326_DAC_RAMPRATE_4E		0x4E
> +#define ES8326_DAC_VPPSCALE_4F		0x4F
> +#define ES8326_DAC_VOL_50		0x50
> +#define ES8326_DRC_RECOVERY_53		0x53
> +#define ES8326_DRC_WINSIZE_54		0x54
> +#define ES8326_HPJACK_TIMER_56		0x56
> +#define ES8326_HP_DET_57	0x57
> +#define ES8326_INT_SOURCE_58	0x58
> +#define ES8326_INTOUT_IO_59	0x59
> +#define ES8326_SDINOUT1_IO_5A	0x5A
> +#define ES8326_SDINOUT23_IO_5B	0x5B
> +#define ES8326_JACK_PULSE_5C	0x5C
> +
> +#define ES8326_PULLUP_CTL_F9	0xF9
> +#define ES8326_HP_DECTECT_FB	0xFB

HP_DETECT

> +#define ES8326_CHIP_ID1_FD	0xFD
> +#define ES8326_CHIP_ID2_FE	0xFE
> +#define ES8326_CHIP_VERSION_FF	0xFF
> +
> +/* ES8326_RESET_00 */
> +#define ES8326_CSM_ON (1 << 7)
> +#define ES8326_MASTER_MODE_EN	(1 << 6)
> +#define	ES8326_PWRUP_SEQ_EN	(1 << 5)
> +#define ES8326_CODEC_RESET (0x0f << 0)
> +#define ES8326_CSM_OFF (0 << 7)
> +
> +/* ES8326_CLK_CTL_01 */
> +#define ES8326_CLK_ON (0x7f << 0)
> +#define ES8326_CLK_OFF (0 << 0)
> +
> +/* ES8326_CLK_INV_02 */
> +#define ES8326_BCLK_AS_MCLK (1 << 3)
> +
> +/* ES8326_FMT_13 */
> +#define ES8326_S24_LE	(0 << 2)
> +#define ES8326_S20_3_LE	(1 << 2)
> +#define ES8326_S18_LE	(2 << 2)
> +#define ES8326_S16_LE	(3 << 2)
> +#define ES8326_S32_LE	(4 << 2)
> +#define ES8326_DATA_LEN_MASK	(7 << 2)
> +
> +#define ES8326_DAIFMT_MASK	((1 << 5) | (3 << 0))
> +#define ES8326_DAIFMT_I2S	0
> +#define ES8326_DAIFMT_LEFT_J	(1 << 0)
> +#define ES8326_DAIFMT_DSP_A		(3 << 0)
> +#define ES8326_DAIFMT_DSP_B		((1 << 5) | (3 << 0))
> +
> +/* ES8326_PAGGAIN_23 */

PGA?

> +#define ES8326_MIC_SEL_MASK (3 << 4)
> +#define ES8326_MIC1_SEL	(1 << 4)
> +#define ES8326_MIC2_SEL (1 << 5)
> +
> +/* ES8326_HP_CAL_27 */
> +#define ES8326_HPOR_SHIFT 4
> +
> +/* ES8326_ADC1_SRC_2A */
> +#define ES8326_ADC1_SHIFT 0
> +#define ES8326_ADC2_SHIFT 4
> +#define ES8326_ADC_SRC_ANA 0
> +#define ES8326_ADC_SRC_ANA_INV_SW0 1
> +#define ES8326_ADC_SRC_ANA_INV_SW1 2
> +#define ES8326_ADC_SRC_DMIC_MCLK 3
> +#define ES8326_ADC_SRC_DMIC_SDIN2 4
> +#define ES8326_ADC_SRC_DMIC_SDIN2_INV 5
> +#define ES8326_ADC_SRC_DMIC_SDIN3 6
> +#define ES8326_ADC_SRC_DMIC_SDIN3_INV 7
> +
> +#define ES8326_ADC_AMIC	((ES8326_ADC_SRC_ANA_INV_SW1 << ES8326_ADC2_SHIFT) \
> +		| (ES8326_ADC_SRC_ANA_INV_SW1 << ES8326_ADC1_SHIFT))
> +#define ES8326_ADC_DMIC	((ES8326_ADC_SRC_DMIC_SDIN2 << ES8326_ADC2_SHIFT) \
> +		| (ES8326_ADC_SRC_DMIC_SDIN2 << ES8326_ADC1_SHIFT))
> +/* ES8326_ADC2_SRC_2B */
> +#define ES8326_ADC3_SHIFT 0
> +#define ES8326_ADC4_SHIFT 3
> +
> +/* ES8326_HP_DET_57 */
> +#define ES8326_HP_DET_SRC_PIN27 (1 << 5)
> +#define ES8326_HP_DET_SRC_PIN9 (1 << 4)
> +#define ES8326_HP_DET_JACK_POL (1 << 3)
> +#define ES8326_HP_DET_BUTTON_POL (1 << 2)
> +#define ES8326_HP_TYPE_OMTP	(3 << 0)
> +#define ES8326_HP_TYPE_CTIA	(2 << 0)
> +#define ES8326_HP_TYPE_AUTO	(1 << 0)
> +#define ES8326_HP_TYPE_AUTO_INV	(0 << 0)
> +
> +/* ES8326_SDINOUT1_IO_5A */
> +#define ES8326_IO_INPUT	(0 << 0)
> +#define ES8326_IO_SDIN_SLOT0 (1 << 0)
> +#define ES8326_IO_SDIN_SLOT1 (2 << 0)
> +#define ES8326_IO_SDIN_SLOT2 (3 << 0)
> +#define ES8326_IO_SDIN_SLOT7 (8 << 0)
> +#define ES8326_IO_DMIC_CLK (9 << 0)
> +#define ES8326_IO_DMIC_CLK_INV (0x0a << 0)
> +#define ES8326_IO_SDOUT2 (0x0b << 0)
> +#define ES8326_IO_LOW (0x0e << 0)
> +#define ES8326_IO_HIGH (0x0f << 0)
> +#define ES8326_ADC2DAC (1 << 3)
> +#define ES8326_SDINOUT1_SHIFT 4
> +
> +/* ES8326_SDINOUT23_IO_5B */
> +#define ES8326_SDINOUT2_SHIFT 4
> +#define ES8326_SDINOUT3_SHIFT 0
> +
> +/* ES8326_HP_DECTECT_FB */

DETECT

> +#define ES8326_HPINSERT_FLAG (1 << 1)
> +#define ES8326_HPBUTTON_FLAG (1 << 0)
> +
> +/* ES8326_CHIP_VERSION_FF 0xFF */
> +#define ES8326_VERSION_B (1 << 0)
> +
> +#endif
> \ No newline at end of file

?
