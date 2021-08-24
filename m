Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5073F6378
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 18:55:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA85C167E;
	Tue, 24 Aug 2021 18:54:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA85C167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629824107;
	bh=Ry+gbdY6M+gFAxkvcMaWAEbe9OZPoUFftlVZ4SG4TbA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FoqcZaPfy0ZrEwVEy0SQ6h/VAJi6t7VsM2j3UFl7AIjqApWekNELn01WR14/3Y+F4
	 U6etIJdl7sxQyllS8FcS3Bwn2cplHxO79+WipRzMR7HgjyG7ihHYlFbQRSLdafKg3q
	 xnj6FfPAoosLWSq3E3J7qdmKHny7YjbCGyQ9xafc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59F67F8025C;
	Tue, 24 Aug 2021 18:53:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16A2FF80224; Tue, 24 Aug 2021 18:53:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DBAFF800AE
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 18:53:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DBAFF800AE
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="217076294"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; d="scan'208";a="217076294"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 09:53:30 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; d="scan'208";a="685433419"
Received: from jlrivera-mobl1.amr.corp.intel.com (HELO [10.212.8.132])
 ([10.212.8.132])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 09:53:29 -0700
Subject: Re: [PATCH] ASoC: nau8821: Add driver for Nuvoton codec NAU88L21
To: Seven Lee <wtli@nuvoton.com>, broonie@kernel.org
References: <20210824041647.1732378-1-wtli@nuvoton.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1651f0ee-5667-c7ef-9cb0-a648e2ad7d02@linux.intel.com>
Date: Tue, 24 Aug 2021 11:02:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824041647.1732378-1-wtli@nuvoton.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com, KCHSU0@nuvoton.com,
 lgirdwood@gmail.com, YHCHuang@nuvoton.com, CTLIN0@nuvoton.com,
 dardar923@gmail.com, supercraig0719@gmail.com
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

couple of nit-picks/typos/indentations, see below.

On 8/23/21 11:16 PM, Seven Lee wrote:
> The driver is for codec NAU88L21 of Nuvoton Technology Corporation.
> The NAU88L21 is an ultra-low power high performance audio codec that
> supportsboth analog and digital audio functions.

supports both

> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 82ee233a269d..11bcf17b5f91 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -136,6 +136,7 @@ config SND_SOC_ALL_CODECS
>  	imply SND_SOC_NAU8315
>  	imply SND_SOC_NAU8540
>  	imply SND_SOC_NAU8810
> +        imply SND_SOC_NAU8821

indent looks off?

>  	imply SND_SOC_NAU8822
>  	imply SND_SOC_NAU8824
>  	imply SND_SOC_NAU8825
> @@ -1904,6 +1905,10 @@ config SND_SOC_NAU8810
>  	tristate "Nuvoton Technology Corporation NAU88C10 CODEC"
>  	depends on I2C
>  
> +config SND_SOC_NAU8821
> +        tristate "Nuvoton Technology Corporation NAU88L21 CODEC"
> +        depends on I2C
> +

and here indent is off as well?


> +#include <linux/module.h>
> +#include <linux/delay.h>
> +#include <linux/init.h>
> +#include <linux/i2c.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/clk.h>
> +#include <linux/acpi.h>
> +#include <linux/math64.h>
> +#include <linux/semaphore.h>
> +#include <sound/initval.h>
> +#include <sound/tlv.h>
> +#include <sound/core.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/jack.h>

alphabetical order?


> +/**
> + * nau8821_sema_acquire - acquire the semaphore of nau8821
> + * @nau8821:  component to register the codec private data with
> + * @timeout: how long in jiffies to wait before failure or zero to wait
> + * until release
> + *
> + * Attempts to acquire the semaphore with number of jiffies. If no more
> + * tasks are allowed to acquire the semaphore, calling this function will
> + * put the task to sleep. If the semaphore is not released within the
> + * specified number of jiffies, this function returns.
> + * If the semaphore is not released within the specified number of jiffies,
> + * this function returns -ETIME. If the sleep is interrupted by a signal,
> + * this function will return -EINTR. It returns 0 if the semaphore was
> + * acquired successfully.
> + *
> + * Acquires the semaphore without jiffies. Try to acquire the semaphore
> + * atomically. Returns 0 if the semaphore has been acquired successfully
> + * or 1 if it cannot be acquired.
> + */
> +static int nau8821_sema_acquire(struct nau8821 *nau8821, long timeout)
> +{
> +	int ret;
> +
> +	if (!nau8821->irq)
> +		return 1;
> +
> +	if (timeout) {
> +		ret = down_timeout(&nau8821->jd_sem, timeout);
> +		if (ret < 0)
> +			dev_dbg(nau8821->dev, "Acquire semaphore timeout\n");
> +	} else {
> +		ret = down_trylock(&nau8821->jd_sem);
> +		if (ret)
> +			dev_dbg(nau8821->dev, "Acquire semaphore fail\n");
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * nau8821_sema_release - release the semaphore of nau8821
> + * @nau8821:  component to register the codec private data with
> + *
> + * Release the semaphore which may be called from any context and
> + * even by tasks which have never called down().
> + */
> +static inline void nau8821_sema_release(struct nau8821 *nau8821)
> +{
> +	if (!nau8821->irq)
> +		return;
> +	up(&nau8821->jd_sem);
> +}

is there any specific reason why Nuvoton codec drivers use a semaphore?
isn't a mutex good enough?

> +
> +/**
> + * nau8821_sema_reset - reset the semaphore for nau8821
> + * @nau8821:  component to register the codec private data with
> + *
> + * Reset the counter of the semaphore. Call this function to restart
> + * a new round task management.
> + */
> +static inline void nau8821_sema_reset(struct nau8821 *nau8821)
> +{
> +	nau8821->jd_sem.count = 1;
> +}

> +static int nau8821_left_adc_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		msleep(125);

use a define to keep track of sleep times in a header file?

> +		regmap_update_bits(nau8821->regmap, NAU8821_R01_ENA_CTRL,
> +			NAU8821_EN_ADCL, NAU8821_EN_ADCL);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		regmap_update_bits(nau8821->regmap,
> +			NAU8821_R01_ENA_CTRL, NAU8821_EN_ADCL, 0);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int nau8821_right_adc_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		msleep(125);

#define?

> +		regmap_update_bits(nau8821->regmap, NAU8821_R01_ENA_CTRL,
> +			NAU8821_EN_ADCR, NAU8821_EN_ADCR);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		regmap_update_bits(nau8821->regmap,
> +			NAU8821_R01_ENA_CTRL, NAU8821_EN_ADCR, 0);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int nau8821_pump_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct nau8821 *nau8821 =
> +		snd_soc_component_get_drvdata(component);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		/* Prevent startup click by letting charge pump to ramp up */
> +		msleep(20);

#define?

> +		regmap_update_bits(nau8821->regmap, NAU8821_R80_CHARGE_PUMP,
> +			NAU8821_JAMNODCLOW, NAU8821_JAMNODCLOW);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		regmap_update_bits(nau8821->regmap, NAU8821_R80_CHARGE_PUMP,
> +			NAU8821_JAMNODCLOW, 0);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int nau8821_output_dac_event(struct snd_soc_dapm_widget *w,
> +	struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		/* Disables the TESTDAC to let DAC signal pass through. */
> +		regmap_update_bits(nau8821->regmap, NAU8821_R66_BIAS_ADJ,
> +			NAU8821_BIAS_TESTDAC_EN, 0);
> +		break;
> +	case SND_SOC_DAPM_POST_PMD:
> +		regmap_update_bits(nau8821->regmap, NAU8821_R66_BIAS_ADJ,
> +			NAU8821_BIAS_TESTDAC_EN, NAU8821_BIAS_TESTDAC_EN);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

> +static int nau8821_clock_check(struct nau8821 *nau8821,
> +	int stream, int rate, int osr)
> +{
> +	int osrate = 0;
> +
> +	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		if (osr >= ARRAY_SIZE(osr_dac_sel))
> +			return -EINVAL;
> +		osrate = osr_dac_sel[osr].osr;
> +	} else {
> +		if (osr >= ARRAY_SIZE(osr_adc_sel))
> +			return -EINVAL;
> +		osrate = osr_adc_sel[osr].osr;
> +	}
> +
> +	if (!osrate || rate * osrate > CLK_DA_AD_MAX) {
> +		dev_err(nau8821->dev,
> +		"exceed the maximum frequency of CLK_ADC or CLK_DAC\n");

odd indentation

> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}

> +static int nau8821_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
> +{
> +	struct snd_soc_component *component = codec_dai->component;
> +	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
> +	unsigned int ctrl1_val = 0, ctrl2_val = 0;
> +
> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> +	case SND_SOC_DAIFMT_CBM_CFM:

use CDP_CFP

> +		ctrl2_val |= NAU8821_I2S_MS_MASTER;
> +		break;
> +	case SND_SOC_DAIFMT_CBS_CFS:

use CBC_CFC

> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
> +	case SND_SOC_DAIFMT_NB_NF:
> +		break;
> +	case SND_SOC_DAIFMT_IB_NF:
> +		ctrl1_val |= NAU8821_I2S_BP_INV;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_I2S:
> +		ctrl1_val |= NAU8821_I2S_DF_I2S;
> +		break;
> +	case SND_SOC_DAIFMT_LEFT_J:
> +		ctrl1_val |= NAU8821_I2S_DF_LEFT;
> +		break;
> +	case SND_SOC_DAIFMT_RIGHT_J:
> +		ctrl1_val |= NAU8821_I2S_DF_RIGTH;
> +		break;
> +	case SND_SOC_DAIFMT_DSP_A:
> +		ctrl1_val |= NAU8821_I2S_DF_PCM_AB;
> +		break;
> +	case SND_SOC_DAIFMT_DSP_B:
> +		ctrl1_val |= NAU8821_I2S_DF_PCM_AB;
> +		ctrl1_val |= NAU8821_I2S_PCMB_EN;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	nau8821_sema_acquire(nau8821, HZ);
> +
> +	regmap_update_bits(nau8821->regmap, NAU8821_R1C_I2S_PCM_CTRL1,
> +		NAU8821_I2S_DL_MASK | NAU8821_I2S_DF_MASK |
> +		NAU8821_I2S_BP_MASK | NAU8821_I2S_PCMB_MASK, ctrl1_val);
> +	regmap_update_bits(nau8821->regmap, NAU8821_R1D_I2S_PCM_CTRL2,
> +		NAU8821_I2S_MS_MASK, ctrl2_val);
> +
> +	nau8821_sema_release(nau8821);
> +
> +	return 0;
> +}
> +
> +static int nau8821_digital_mute(struct snd_soc_dai *dai, int mute,
> +	int direction)

indentation?

> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
> +	unsigned int val = 0;
> +
> +	if (mute)
> +		val = NAU8821_DAC_SOFT_MUTE;
> +
> +	return regmap_update_bits(nau8821->regmap,
> +		NAU8821_R31_MUTE_CTRL, NAU8821_DAC_SOFT_MUTE, val);
> +}
> +

> +static int nau8821_set_bias_level(struct snd_soc_component *component,
> +		enum snd_soc_bias_level level)
> +{
> +	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
> +	struct regmap *regmap = nau8821->regmap;
> +
> +	switch (level) {
> +	case SND_SOC_BIAS_ON:
> +		break;
> +
> +	case SND_SOC_BIAS_PREPARE:
> +		break;
> +
> +	case SND_SOC_BIAS_STANDBY:
> +		/* Setup codec configuration after resume */
> +		if (snd_soc_component_get_bias_level(component) ==
> +			SND_SOC_BIAS_OFF)
> +			nau8821_resume_setup(nau8821);
> +		break;
> +
> +	case SND_SOC_BIAS_OFF:
> +		/* HPL/HPR short to ground */
> +		regmap_update_bits(regmap, NAU8821_R0D_JACK_DET_CTRL,
> +			NAU8821_SPKR_DWN1R | NAU8821_SPKR_DWN1L, 0);
> +		if (nau8821->irq) {
> +			/* Reset semaphore */
> +			nau8821_sema_reset(nau8821);
> +			/* Reset the configuration of jack type for detection.
> +			 * Detach 2kOhm Resistors from MICBIAS to MICGND1/2.
> +			 */
> +			regmap_update_bits(regmap, NAU8821_R74_MIC_BIAS,
> +				NAU8821_MICBIAS_JKR2, 0);
> +			/* Turn off all interruptions before system shutdown.
> +			 * Keep theinterruption quiet before resume
> +			 * setup completes.
> +			 */
> +			regmap_write(regmap,
> +				NAU8821_R12_INTERRUPT_DIS_CTRL, 0xffff);
> +			regmap_update_bits(regmap, NAU8821_R0F_INTERRUPT_MASK,
> +				NAU8821_IRQ_EJECT_EN | NAU8821_IRQ_INSERT_EN,
> +				NAU8821_IRQ_EJECT_EN | NAU8821_IRQ_INSERT_EN);
> +		}
> +		break;

default case?

> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused nau8821_suspend(struct snd_soc_component *component)
> +{
> +	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
> +
> +	if (nau8821->irq)
> +		disable_irq(nau8821->irq);
> +	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
> +	/* Power down codec power; don't suppoet button wakeup */

support?

> +	snd_soc_dapm_disable_pin(nau8821->dapm, "MICBIAS");
> +	snd_soc_dapm_sync(nau8821->dapm);
> +	regcache_cache_only(nau8821->regmap, true);
> +	regcache_mark_dirty(nau8821->regmap);
> +
> +	return 0;
> +}
> +

> +MODULE_LICENSE("GPL v2");

MODULE_LICENSE("GPL");

the license version is provided by the SPDX line

