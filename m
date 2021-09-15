Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 210B640BE50
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 05:36:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3BD91811;
	Wed, 15 Sep 2021 05:35:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3BD91811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631676984;
	bh=CzJ/v+9etUUXfg3T+1F3/HaeuWrebdQB9MDD9PUkEWE=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HHC8K9lVe5NOaV20ZXxEDyGZOtVGNehlegrm/Pm+oXyiHykvbHFtcKLXEhatK+Tsw
	 k1YGCwvg4dtNb7A6mn6iPtb2yXbwFbYvswzoCUNWDnnGAvTwayqa8MuUSjhWTd5NGv
	 bV/zXvGOHm1+GfSBw6Bwuvqhq/ZJRVSgDDFemYnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22C14F802E8;
	Wed, 15 Sep 2021 05:35:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95D45F8027C; Wed, 15 Sep 2021 05:35:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 340B7F80117
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 05:35:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 340B7F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GGucDHZ4"
Received: by mail-pg1-x52f.google.com with SMTP id u18so1397190pgf.0
 for <alsa-devel@alsa-project.org>; Tue, 14 Sep 2021 20:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=SNmqqjwjYr/bv+VJJgk77zXO+/78/7HcjDcv83BXrhA=;
 b=GGucDHZ4iPXWL4iZKFyNfRZsXau3VZ4kj9btNHeuyosfyxHYHzoNOpj/vn64cRMHMl
 hhbe56oGRwDPmmEX1P2kNzkSwR/641qg7/mREaHDTauNn0jMDRAusFSAYXAbAHocb2f6
 BE9t52IGeHL/Zrs7johWHGpAH72T3aXr+1Vs2p2GYR6i5GO+zTNifUjkER6Q8CYpeq5n
 dW1fbSXAbZ8TwEutjH9SWU1tj/rJ24hOLPA97BlTEnSUfgnW6E2IAXK2Kq7UhAb0mPrc
 Px+yRtRKIGzp+X+Ciiu6KdV/yQGxwXIUYP0A8fBRz2wWeZb2tG7lmqgldMvHBlLwQiG4
 KWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=SNmqqjwjYr/bv+VJJgk77zXO+/78/7HcjDcv83BXrhA=;
 b=l8bm1vXTeoVSz66DFHM36CIkf8ntLSZzhjA9nswufC12e2idsFKLSW8r9PlHH5QFXA
 j15JMbvDnde9F1iQWM230Nd+ChcZKojVb7iAvMaaylCibD7muycKCERfWn1NqTsGwP2E
 eDiI4umEe84g8zyP2EaxkItFJfiBmm3Kx7y6sHvVah5NffdHQVacwGiP8Y8QxP9O6DI2
 HI37vRoc3zzPGmbgPVMeui0wEWCYTLVNgcjHA3qlkfMCYZs6ivCjA9scqLAoQmoCEWNZ
 wnggIPMlKHOqsxDU/7TJCEen9n3peswOW3omhODm6lXw0IGtl2CdwpBXvPyxzkqgUAMb
 Bfyg==
X-Gm-Message-State: AOAM530ritVHL1EKRGt16DaUD00S9Hiq8Z+zK6s/e0SIn19xPXzTZjrQ
 TYoa6jouTQRC1+WR3ugaz2c=
X-Google-Smtp-Source: ABdhPJwjVWizvbQ1TPIAQQuzWtVyzmksDdxgNcV+CqYJukGvVEfquwDBWR5LVuI0B3AYnb//lhmZYQ==
X-Received: by 2002:a63:ef57:: with SMTP id c23mr18220738pgk.60.1631676898412; 
 Tue, 14 Sep 2021 20:34:58 -0700 (PDT)
Received: from ?IPv6:2001:b400:e3df:8666:4004:ab45:e89d:a0d9?
 (2001-b400-e3df-8666-4004-ab45-e89d-a0d9.emome-ip6.hinet.net.
 [2001:b400:e3df:8666:4004:ab45:e89d:a0d9])
 by smtp.gmail.com with ESMTPSA id h7sm11640053pfe.125.2021.09.14.20.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 20:34:57 -0700 (PDT)
From: Seven Lee <scott6986@gmail.com>
Subject: Re: [PATCH] ASoC: nau8821: Add driver for Nuvoton codec NAU88L21
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Seven Lee <wtli@nuvoton.com>, broonie@kernel.org
References: <20210824041647.1732378-1-wtli@nuvoton.com>
 <1651f0ee-5667-c7ef-9cb0-a648e2ad7d02@linux.intel.com>
Message-ID: <fbdf0797-e256-5c7a-ca73-91e239843660@gmail.com>
Date: Wed, 15 Sep 2021 11:34:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1651f0ee-5667-c7ef-9cb0-a648e2ad7d02@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, KCHSU0@nuvoton.com, lgirdwood@gmail.com,
 YHCHuang@nuvoton.com, CTLIN0@nuvoton.com, dardar923@gmail.com,
 supercraig0719@gmail.com
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


On 2021/8/25 上午 12:02, Pierre-Louis Bossart wrote:
> couple of nit-picks/typos/indentations, see below.
>
> On 8/23/21 11:16 PM, Seven Lee wrote:
>> The driver is for codec NAU88L21 of Nuvoton Technology Corporation.
>> The NAU88L21 is an ultra-low power high performance audio codec that
>> supportsboth analog and digital audio functions.
> supports both 

Okay, I will fix it.

>> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
>> index 82ee233a269d..11bcf17b5f91 100644
>> --- a/sound/soc/codecs/Kconfig
>> +++ b/sound/soc/codecs/Kconfig
>> @@ -136,6 +136,7 @@ config SND_SOC_ALL_CODECS
>>   	imply SND_SOC_NAU8315
>>   	imply SND_SOC_NAU8540
>>   	imply SND_SOC_NAU8810
>> +        imply SND_SOC_NAU8821
> indent looks off?

Okay, I will fix it.

>>   	imply SND_SOC_NAU8822
>>   	imply SND_SOC_NAU8824
>>   	imply SND_SOC_NAU8825
>> @@ -1904,6 +1905,10 @@ config SND_SOC_NAU8810
>>   	tristate "Nuvoton Technology Corporation NAU88C10 CODEC"
>>   	depends on I2C
>>   
>> +config SND_SOC_NAU8821
>> +        tristate "Nuvoton Technology Corporation NAU88L21 CODEC"
>> +        depends on I2C
>> +
> and here indent is off as well?

Okay, I will fix it.

>> +#include <linux/module.h>
>> +#include <linux/delay.h>
>> +#include <linux/init.h>
>> +#include <linux/i2c.h>
>> +#include <linux/regmap.h>
>> +#include <linux/slab.h>
>> +#include <linux/clk.h>
>> +#include <linux/acpi.h>
>> +#include <linux/math64.h>
>> +#include <linux/semaphore.h>
>> +#include <sound/initval.h>
>> +#include <sound/tlv.h>
>> +#include <sound/core.h>
>> +#include <sound/pcm.h>
>> +#include <sound/pcm_params.h>
>> +#include <sound/soc.h>
>> +#include <sound/jack.h>
> alphabetical order?

Okay, I will modify it for alphabetical order.

>> +/**
>> + * nau8821_sema_acquire - acquire the semaphore of nau8821
>> + * @nau8821:  component to register the codec private data with
>> + * @timeout: how long in jiffies to wait before failure or zero to wait
>> + * until release
>> + *
>> + * Attempts to acquire the semaphore with number of jiffies. If no more
>> + * tasks are allowed to acquire the semaphore, calling this function will
>> + * put the task to sleep. If the semaphore is not released within the
>> + * specified number of jiffies, this function returns.
>> + * If the semaphore is not released within the specified number of jiffies,
>> + * this function returns -ETIME. If the sleep is interrupted by a signal,
>> + * this function will return -EINTR. It returns 0 if the semaphore was
>> + * acquired successfully.
>> + *
>> + * Acquires the semaphore without jiffies. Try to acquire the semaphore
>> + * atomically. Returns 0 if the semaphore has been acquired successfully
>> + * or 1 if it cannot be acquired.
>> + */
>> +static int nau8821_sema_acquire(struct nau8821 *nau8821, long timeout)
>> +{
>> +	int ret;
>> +
>> +	if (!nau8821->irq)
>> +		return 1;
>> +
>> +	if (timeout) {
>> +		ret = down_timeout(&nau8821->jd_sem, timeout);
>> +		if (ret < 0)
>> +			dev_dbg(nau8821->dev, "Acquire semaphore timeout\n");
>> +	} else {
>> +		ret = down_trylock(&nau8821->jd_sem);
>> +		if (ret)
>> +			dev_dbg(nau8821->dev, "Acquire semaphore fail\n");
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * nau8821_sema_release - release the semaphore of nau8821
>> + * @nau8821:  component to register the codec private data with
>> + *
>> + * Release the semaphore which may be called from any context and
>> + * even by tasks which have never called down().
>> + */
>> +static inline void nau8821_sema_release(struct nau8821 *nau8821)
>> +{
>> +	if (!nau8821->irq)
>> +		return;
>> +	up(&nau8821->jd_sem);
>> +}
> is there any specific reason why Nuvoton codec drivers use a 
> semaphore? isn't a mutex good enough?

The goal is not to be affected by playback during jack detection. I'm 
worried that
the jack detection time is too long. At this time, an interrupt occurs 
and jack
detection hasn't finished yet. But we estimate that the operation time 
of jack
detection is less than 100ms so that the risk is much smaller. Therefore, we
remove the semaphore.

>> +
>> +/**
>> + * nau8821_sema_reset - reset the semaphore for nau8821
>> + * @nau8821:  component to register the codec private data with
>> + *
>> + * Reset the counter of the semaphore. Call this function to restart
>> + * a new round task management.
>> + */
>> +static inline void nau8821_sema_reset(struct nau8821 *nau8821)
>> +{
>> +	nau8821->jd_sem.count = 1;
>> +}
>> +static int nau8821_left_adc_event(struct snd_soc_dapm_widget *w,
>> +	struct snd_kcontrol *kcontrol, int event)
>> +{
>> +	struct snd_soc_component *component =
>> +		snd_soc_dapm_to_component(w->dapm);
>> +	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
>> +
>> +	switch (event) {
>> +	case SND_SOC_DAPM_POST_PMU:
>> +		msleep(125);
> use a define to keep track of sleep times in a header file?

I agree with Mark description, it's an extra barrier to figuring out the 
actual sequence
of operations and unless there's multiple users of the same underlying 
delay it
doesn't really by anything.

>> +		regmap_update_bits(nau8821->regmap, NAU8821_R01_ENA_CTRL,
>> +			NAU8821_EN_ADCL, NAU8821_EN_ADCL);
>> +		break;
>> +	case SND_SOC_DAPM_POST_PMD:
>> +		regmap_update_bits(nau8821->regmap,
>> +			NAU8821_R01_ENA_CTRL, NAU8821_EN_ADCL, 0);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int nau8821_right_adc_event(struct snd_soc_dapm_widget *w,
>> +	struct snd_kcontrol *kcontrol, int event)
>> +{
>> +	struct snd_soc_component *component =
>> +		snd_soc_dapm_to_component(w->dapm);
>> +	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
>> +
>> +	switch (event) {
>> +	case SND_SOC_DAPM_POST_PMU:
>> +		msleep(125);
> #define?

Same as above.

>> +		regmap_update_bits(nau8821->regmap, NAU8821_R01_ENA_CTRL,
>> +			NAU8821_EN_ADCR, NAU8821_EN_ADCR);
>> +		break;
>> +	case SND_SOC_DAPM_POST_PMD:
>> +		regmap_update_bits(nau8821->regmap,
>> +			NAU8821_R01_ENA_CTRL, NAU8821_EN_ADCR, 0);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int nau8821_pump_event(struct snd_soc_dapm_widget *w,
>> +	struct snd_kcontrol *kcontrol, int event)
>> +{
>> +	struct snd_soc_component *component =
>> +		snd_soc_dapm_to_component(w->dapm);
>> +	struct nau8821 *nau8821 =
>> +		snd_soc_component_get_drvdata(component);
>> +
>> +	switch (event) {
>> +	case SND_SOC_DAPM_POST_PMU:
>> +		/* Prevent startup click by letting charge pump to ramp up */
>> +		msleep(20);
> #define? 

Same as above.

>> +		regmap_update_bits(nau8821->regmap, NAU8821_R80_CHARGE_PUMP,
>> +			NAU8821_JAMNODCLOW, NAU8821_JAMNODCLOW);
>> +		break;
>> +	case SND_SOC_DAPM_PRE_PMD:
>> +		regmap_update_bits(nau8821->regmap, NAU8821_R80_CHARGE_PUMP,
>> +			NAU8821_JAMNODCLOW, 0);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int nau8821_output_dac_event(struct snd_soc_dapm_widget *w,
>> +	struct snd_kcontrol *kcontrol, int event)
>> +{
>> +	struct snd_soc_component *component =
>> +		snd_soc_dapm_to_component(w->dapm);
>> +	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
>> +
>> +	switch (event) {
>> +	case SND_SOC_DAPM_PRE_PMU:
>> +		/* Disables the TESTDAC to let DAC signal pass through. */
>> +		regmap_update_bits(nau8821->regmap, NAU8821_R66_BIAS_ADJ,
>> +			NAU8821_BIAS_TESTDAC_EN, 0);
>> +		break;
>> +	case SND_SOC_DAPM_POST_PMD:
>> +		regmap_update_bits(nau8821->regmap, NAU8821_R66_BIAS_ADJ,
>> +			NAU8821_BIAS_TESTDAC_EN, NAU8821_BIAS_TESTDAC_EN);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +static int nau8821_clock_check(struct nau8821 *nau8821,
>> +	int stream, int rate, int osr)
>> +{
>> +	int osrate = 0;
>> +
>> +	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> +		if (osr >= ARRAY_SIZE(osr_dac_sel))
>> +			return -EINVAL;
>> +		osrate = osr_dac_sel[osr].osr;
>> +	} else {
>> +		if (osr >= ARRAY_SIZE(osr_adc_sel))
>> +			return -EINVAL;
>> +		osrate = osr_adc_sel[osr].osr;
>> +	}
>> +
>> +	if (!osrate || rate * osrate > CLK_DA_AD_MAX) {
>> +		dev_err(nau8821->dev,
>> +		"exceed the maximum frequency of CLK_ADC or CLK_DAC\n");
> odd indentation

Okay, I will fix it.

>> +		return -EINVAL;
>> +	}
>> +
>> +	return 0;
>> +}
>> +static int nau8821_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
>> +{
>> +	struct snd_soc_component *component = codec_dai->component;
>> +	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
>> +	unsigned int ctrl1_val = 0, ctrl2_val = 0;
>> +
>> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
>> +	case SND_SOC_DAIFMT_CBM_CFM:
>
> use CDP_CFP

Okay, I will fix it.

>
>> +		ctrl2_val |= NAU8821_I2S_MS_MASTER;
>> +		break;
>> +	case SND_SOC_DAIFMT_CBS_CFS:
>
> use CBC_CFC

Okay, I will fix it.

>
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
>> +	case SND_SOC_DAIFMT_NB_NF:
>> +		break;
>> +	case SND_SOC_DAIFMT_IB_NF:
>> +		ctrl1_val |= NAU8821_I2S_BP_INV;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>> +	case SND_SOC_DAIFMT_I2S:
>> +		ctrl1_val |= NAU8821_I2S_DF_I2S;
>> +		break;
>> +	case SND_SOC_DAIFMT_LEFT_J:
>> +		ctrl1_val |= NAU8821_I2S_DF_LEFT;
>> +		break;
>> +	case SND_SOC_DAIFMT_RIGHT_J:
>> +		ctrl1_val |= NAU8821_I2S_DF_RIGTH;
>> +		break;
>> +	case SND_SOC_DAIFMT_DSP_A:
>> +		ctrl1_val |= NAU8821_I2S_DF_PCM_AB;
>> +		break;
>> +	case SND_SOC_DAIFMT_DSP_B:
>> +		ctrl1_val |= NAU8821_I2S_DF_PCM_AB;
>> +		ctrl1_val |= NAU8821_I2S_PCMB_EN;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	nau8821_sema_acquire(nau8821, HZ);
>> +
>> +	regmap_update_bits(nau8821->regmap, NAU8821_R1C_I2S_PCM_CTRL1,
>> +		NAU8821_I2S_DL_MASK | NAU8821_I2S_DF_MASK |
>> +		NAU8821_I2S_BP_MASK | NAU8821_I2S_PCMB_MASK, ctrl1_val);
>> +	regmap_update_bits(nau8821->regmap, NAU8821_R1D_I2S_PCM_CTRL2,
>> +		NAU8821_I2S_MS_MASK, ctrl2_val);
>> +
>> +	nau8821_sema_release(nau8821);
>> +
>> +	return 0;
>> +}
>> +
>> +static int nau8821_digital_mute(struct snd_soc_dai *dai, int mute,
>> +	int direction)
>
> indentation?

Okay, I will indent in this line.

>
>> +{
>> +	struct snd_soc_component *component = dai->component;
>> +	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
>> +	unsigned int val = 0;
>> +
>> +	if (mute)
>> +		val = NAU8821_DAC_SOFT_MUTE;
>> +
>> +	return regmap_update_bits(nau8821->regmap,
>> +		NAU8821_R31_MUTE_CTRL, NAU8821_DAC_SOFT_MUTE, val);
>> +}
>> +
>> +static int nau8821_set_bias_level(struct snd_soc_component *component,
>> +		enum snd_soc_bias_level level)
>> +{
>> +	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
>> +	struct regmap *regmap = nau8821->regmap;
>> +
>> +	switch (level) {
>> +	case SND_SOC_BIAS_ON:
>> +		break;
>> +
>> +	case SND_SOC_BIAS_PREPARE:
>> +		break;
>> +
>> +	case SND_SOC_BIAS_STANDBY:
>> +		/* Setup codec configuration after resume */
>> +		if (snd_soc_component_get_bias_level(component) ==
>> +			SND_SOC_BIAS_OFF)
>> +			nau8821_resume_setup(nau8821);
>> +		break;
>> +
>> +	case SND_SOC_BIAS_OFF:
>> +		/* HPL/HPR short to ground */
>> +		regmap_update_bits(regmap, NAU8821_R0D_JACK_DET_CTRL,
>> +			NAU8821_SPKR_DWN1R | NAU8821_SPKR_DWN1L, 0);
>> +		if (nau8821->irq) {
>> +			/* Reset semaphore */
>> +			nau8821_sema_reset(nau8821);
>> +			/* Reset the configuration of jack type for detection.
>> +			 * Detach 2kOhm Resistors from MICBIAS to MICGND1/2.
>> +			 */
>> +			regmap_update_bits(regmap, NAU8821_R74_MIC_BIAS,
>> +				NAU8821_MICBIAS_JKR2, 0);
>> +			/* Turn off all interruptions before system shutdown.
>> +			 * Keep theinterruption quiet before resume
>> +			 * setup completes.
>> +			 */
>> +			regmap_write(regmap,
>> +				NAU8821_R12_INTERRUPT_DIS_CTRL, 0xffff);
>> +			regmap_update_bits(regmap, NAU8821_R0F_INTERRUPT_MASK,
>> +				NAU8821_IRQ_EJECT_EN | NAU8821_IRQ_INSERT_EN,
>> +				NAU8821_IRQ_EJECT_EN | NAU8821_IRQ_INSERT_EN);
>> +		}
>> +		break;
>
> default case?

Okay, I will add default case.

>
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused nau8821_suspend(struct snd_soc_component *component)
>> +{
>> +	struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
>> +
>> +	if (nau8821->irq)
>> +		disable_irq(nau8821->irq);
>> +	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
>> +	/* Power down codec power; don't suppoet button wakeup */
>
> support?

Okay, I will fix this word.

>
>> +	snd_soc_dapm_disable_pin(nau8821->dapm, "MICBIAS");
>> +	snd_soc_dapm_sync(nau8821->dapm);
>> +	regcache_cache_only(nau8821->regmap, true);
>> +	regcache_mark_dirty(nau8821->regmap);
>> +
>> +	return 0;
>> +}
>> +
>> +MODULE_LICENSE("GPL v2");
>
> MODULE_LICENSE("GPL"); the license version is provided by the SPDX line

Okay, I will fix it.

