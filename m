Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFEC5762E0
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 15:36:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB20818D6;
	Fri, 15 Jul 2022 15:35:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB20818D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657892178;
	bh=r08EIwO55OHoEudV34JOehN8n2LAoGGwPVFuAdHyXXw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oE+DYHS3Z+9jRFDjDC1DkyH6iayEilnRlleUVQRuW4rvRFTyTfuPVYKwIPaW0nxIo
	 C8HmfEUyscE38O11F+XsHsXBh/bdWIKZqrQBX1tBmLutLuYH6ES/9EHwLEA5LOn+NE
	 4prE1jDF4MByDmBmIEkPKwL4Dy2GTDhILc1YXWWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BFE8F80212;
	Fri, 15 Jul 2022 15:35:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97951F8015B; Fri, 15 Jul 2022 15:35:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0679AF8012F
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 15:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0679AF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="T3abp05g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657892110; x=1689428110;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=r08EIwO55OHoEudV34JOehN8n2LAoGGwPVFuAdHyXXw=;
 b=T3abp05ge/rC5YE/6LiTg6YDp/GooQBQHVqgQb99mqVHgOXZ8wvyVCth
 jqYSr4bZFn11tqfl+X0Ec6s74Pbaw3Gm8OlpdUuhJwU8YnmeNKQvCnxEt
 4wZWrJmzyiBkVD+GOulSQ4uB6w283uAkMMr7Xm1fbthHfD3n0nlAj2AB2
 M9wHX0G5BqZWataumIvOtV6oHI3QidxcfD2qcawz7UGnPnlqJuwLpzt4s
 jvCEm53VDG1g8FhQTywC3coKlfVBVEMRftP3aNPO9Q7zH8dH6iN06akIy
 TZNFrXyvLRr0oGwoGOnLm6aMm6v/n1L5M3+PjeyAHtges3ftnF1wuWpm5 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="284555118"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="284555118"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 06:35:06 -0700
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="723084879"
Received: from lingjuch-mobl.amr.corp.intel.com (HELO [10.209.147.93])
 ([10.209.147.93])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 06:35:05 -0700
Message-ID: <7e892b40-7a67-342e-40a9-35f846a11c28@linux.intel.com>
Date: Fri, 15 Jul 2022 08:05:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] ASoC: codecs: add support for ES8326
Content-Language: en-US
To: Zhu Ning <zhuning0077@gmail.com>, alsa-devel@alsa-project.org
References: <20220715054100.9240-1-zhuning0077@gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220715054100.9240-1-zhuning0077@gmail.com>
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



On 7/15/22 00:41, Zhu Ning wrote:
> The ES8326 codec is not compatible with ES8316 and requires a dedicated driver.
> 
> Signed-off-by: David Yang <yangxiaohua@everest-semi.com>
> Signed-off-by: Zhu Ning <zhuning@everest-semi.com>
> ---

It's helpful for reviewers when you use the -v option in git
format-patch, and a change history below the --- mark also helps
understand what has been modified between versions. Thanks!

>  sound/soc/codecs/Kconfig  |   5 +
>  sound/soc/codecs/Makefile |   2 +
>  sound/soc/codecs/es8326.c | 794 ++++++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/es8326.h | 187 +++++++++
>  4 files changed, 988 insertions(+)
>  mode change 100644 => 100755 sound/soc/codecs/Kconfig
>  mode change 100644 => 100755 sound/soc/codecs/Makefile
>  create mode 100755 sound/soc/codecs/es8326.c
>  create mode 100755 sound/soc/codecs/es8326.h

> +#define es8326_RATES SNDRV_PCM_RATE_8000_96000

this definition omits 24 kHz, you may want to add it explicitly.

> +
> +#define es8326_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
> +	SNDRV_PCM_FMTBIT_S24_LE)
> +
> +static const struct snd_soc_dai_ops es8326_ops = {
> +	.hw_params = es8326_pcm_hw_params,
> +	.set_fmt = es8326_set_dai_fmt,
> +	.set_sysclk = es8326_set_dai_sysclk,
> +};
> +
> +static struct snd_soc_dai_driver es8326_dai = {
> +	.name = "ES8326 HiFi",
> +	.playback = {
> +		.stream_name = "Playback",
> +		.channels_min = 1,
> +		.channels_max = 2,
> +		.rates = es8326_RATES,
> +		.formats = es8326_FORMATS,
> +		},
> +	.capture = {
> +		.stream_name = "Capture",
> +		.channels_min = 1,
> +		.channels_max = 2,
> +		.rates = es8326_RATES,
> +		.formats = es8326_FORMATS,
> +		},
> +	.ops = &es8326_ops,
> +	.symmetric_rate = 1,
> +};
> +
> +static void es8326_enable_micbias(struct snd_soc_component *component)
> +{
> +	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
> +
> +	snd_soc_dapm_mutex_lock(dapm);
> +	snd_soc_dapm_force_enable_pin_unlocked(dapm, "MICBIAS1");
> +	snd_soc_dapm_force_enable_pin_unlocked(dapm, "MICBIAS2");
> +	snd_soc_dapm_sync_unlocked(dapm);
> +	snd_soc_dapm_mutex_unlock(dapm);
> +}
> +
> +static void es8326_disable_micbias(struct snd_soc_component *component)
> +{
> +	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
> +
> +	snd_soc_dapm_mutex_lock(dapm);
> +	snd_soc_dapm_disable_pin_unlocked(dapm, "MICBIAS1");
> +	snd_soc_dapm_disable_pin_unlocked(dapm, "MICBIAS2");
> +	snd_soc_dapm_sync_unlocked(dapm);
> +	snd_soc_dapm_mutex_unlock(dapm);
> +}
> +static void es8326_jack_detect_handler(struct work_struct *work)
> +{
> +	struct es8326_priv *es8326 =
> +		container_of(work, struct es8326_priv, jack_detect_work.work);
> +	struct snd_soc_component *comp = es8326->component;
> +	unsigned int iface;
> +
> +	iface = snd_soc_component_read(comp, ES8326_HP_DETECT_FB);
> +	dev_dbg(comp->dev, "gpio flag %#04x", iface);
> +	if ((iface & ES8326_HPINSERT_FLAG) == 0) {
> +		dev_dbg(comp->dev, "No headset detected");
> +		snd_soc_jack_report(es8326->jack, 0, SND_JACK_HEADSET);
> +		snd_soc_component_write(comp, ES8326_ADC1_SRC_2A, es8326->mic2_src);
> +		es8326_disable_micbias(comp);
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
> +	if(!es8326->jack)
> +		goto out;
> +	es8326_enable_micbias(comp);
> +
> +	queue_delayed_work(system_wq, &es8326->jack_detect_work,
> +			   msecs_to_jiffies(300));
> +
> +out:
> +	return IRQ_HANDLED;
> +}
> +
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
> +	snd_soc_component_update_bits(component, ES8326_PGAGAIN_23,
> +				      ES8326_MIC_SEL_MASK, ES8326_MIC1_SEL);
> +
> +	es8326_irq(es8326->irq, es8326);
> +	return 0;
> +}
> +
> +static int es8326_suspend(struct snd_soc_component *component)
> +{
> +	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
> +
> +	regmap_write(es8326->regmap, ES8326_CLK_CTL_01, ES8326_CLK_OFF);


For symmetry with the resume case, aren't you missing

es8326_disable_micbias(comp);

cancel_delayed_work_sync(&es8326->jack_detect_work);

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

This one is odd, you don't handle buttons anywhere in this patch but here?

> +
> +	es8326->jack = NULL;
> +	mutex_unlock(&es8326->lock);
> +}
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

Something's weird here, either you are missing a return ret;, a newline
or both. This doesn't seem right.

> +
> +	es8326->mclk = devm_clk_get_optional(&i2c->dev, "mclk");
> +	if (IS_ERR(es8326->mclk)) {
> +		dev_err(&i2c->dev, "unable to get mclk\n");
> +		return PTR_ERR(es8326->mclk);
> +	}
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

I am also wondering if on remove you'd need to do the same thing as on
suspend (disable the mic bias and cancel the workqueue)?
