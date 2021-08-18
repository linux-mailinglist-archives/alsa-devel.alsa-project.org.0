Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C41BE3EFDBA
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 09:25:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B5091676;
	Wed, 18 Aug 2021 09:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B5091676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629271528;
	bh=6kMXrWR7y5vGbY6RwNa3KfseS0xHrDrMRKTTsCHIyxY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tPLa4q+lWeUY+amfe7n7dbeiAO9PMs+b+zCvth9HG2amH0fEsDKIfSymzYHWaqbhP
	 9tbV724E004/ncpXHJzlsh26uau9ci7AhfU1oU4mgwyN7ZBAktPlWY2POlo4HIEyB8
	 /kYVxrQdcMfIkhh+UeLXT2TSi1m5khwq7EBXN8VQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A325BF800EC;
	Wed, 18 Aug 2021 09:24:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C9F1F80249; Wed, 18 Aug 2021 09:24:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BE08F80163
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 09:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BE08F80163
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="238366214"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="238366214"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 00:23:56 -0700
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="520788661"
Received: from kkonopkx-mobl1.ger.corp.intel.com (HELO [10.237.12.71])
 ([10.237.12.71])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 00:23:54 -0700
Subject: Re: [PATCH] ASoC: nau8821: new driver
To: John Hsu <supercraig0719@gmail.com>, Seven Lee <wtli@nuvoton.com>,
 broonie@kernel.org
References: <20210809101000.3947156-1-wtli@nuvoton.com>
 <7fac2710-0173-cbc0-94e1-fb168dc4f069@linux.intel.com>
 <fde36a45-849b-59f8-f2f4-282ddb161262@gmail.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <cda3fd5c-a30f-ae26-c7a5-9c1dd520b913@linux.intel.com>
Date: Wed, 18 Aug 2021 09:23:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fde36a45-849b-59f8-f2f4-282ddb161262@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com, KCHSU0@nuvoton.com,
 lgirdwood@gmail.com, YHCHuang@nuvoton.com, CTLIN0@nuvoton.com,
 dardar923@gmail.com
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

On 8/18/2021 5:30 AM, John Hsu wrote:
> Hi,
> 
> On 8/9/2021 6:44 PM, Amadeusz Sławiński wrote:
>> On 8/9/2021 12:10 PM, Seven Lee wrote:
>>> Add driver for NAU88L21.
>>>
>>> Signed-off-by: Seven Lee <wtli@nuvoton.com>
>>> ---
>>
>> ...
>>
>>> +
>>> +static int dmic_clock_control(struct snd_soc_dapm_widget *w,
>>> +        struct snd_kcontrol *k, int  event)
>>> +{
>>> +    struct snd_soc_component *component =
>>> +        snd_soc_dapm_to_component(w->dapm);
>>> +    struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
>>> +    int i, speed_selection, clk_adc_src, clk_adc;
>>> +    unsigned int clk_divider_r03;
>>> +
>>> +    /* The DMIC clock is gotten from adc clock divided by
>>> +     * CLK_DMIC_SRC (1, 2, 4, 8). The clock has to be equal or
>>> +     * less than nau8821->dmic_clk_threshold.
>>> +     */
>>> +    regmap_read(nau8821->regmap, NAU8821_R03_CLK_DIVIDER,
>>> +        &clk_divider_r03);
>>> +    clk_adc_src = (clk_divider_r03 & NAU8821_CLK_ADC_SRC_MASK)
>>> +        >> NAU8821_CLK_ADC_SRC_SFT;
>>> +
>>> +    switch (clk_adc_src) {
>>> +    case 0:
>>> +        clk_adc = nau8821->fs * 256;
>>> +        break;
>>> +    case 1:
>>> +        clk_adc = (nau8821->fs * 256) >> 1;
>>> +        break;
>>> +    case 2:
>>> +        clk_adc = (nau8821->fs * 256) >> 2;
>>> +        break;
>>> +    case 3:
>>> +        clk_adc = (nau8821->fs * 256) >> 3;
>>> +        break;
>>> +    }
>>
>> Just do:
>> clk_adc = (nau8821->fs * 256) >> clk_adc_src;
>> instead of whole switch?
>>
> 
> Yes, you are right. I will fix it.
>>> +
>>> +    for (i = 0 ; i < 4 ; i++) {
>>> +        if ((clk_adc >> dmic_speed_sel[i].param) <=
>>> +            nau8821->dmic_clk_threshold) {
>>> +            speed_selection = dmic_speed_sel[i].val;
>>> +            break;
>>> +        }
>>> +    }
>>> +
>>> +    dev_dbg(nau8821->dev,
>>> +        "clk_adc=%d, dmic_clk_threshold = %d, param=%d, val = %d\n",
>>> +        clk_adc, nau8821->dmic_clk_threshold,
>>> +        dmic_speed_sel[i].param, dmic_speed_sel[i].val);
>>> +    regmap_update_bits(nau8821->regmap, NAU8821_R13_DMIC_CTRL,
>>> +        NAU8821_DMIC_SRC_MASK,
>>> +        (speed_selection << NAU8821_DMIC_SRC_SFT));
>>> +
>>> +    return 0;
>>> +}
>>> +
>>
>> ...
>>
>>> +
>>> +static int nau8821_clock_check(struct nau8821 *nau8821,
>>> +    int stream, int rate, int osr)
>>> +{
>>> +    int osrate = 0;
>>> +
>>> +    if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
>>> +        if (osr >= ARRAY_SIZE(osr_dac_sel))
>>> +            return -EINVAL;
>>> +        osrate = osr_dac_sel[osr].osr;
>>> +    } else {
>>> +        if (osr >= ARRAY_SIZE(osr_adc_sel))
>>> +            return -EINVAL;
>>> +        osrate = osr_adc_sel[osr].osr;
>>> +    }
>> true and false cases seem to be the same here, you can remove the "if 
>> else" and just leave one of them.
>>
> 
> The OSR of DAC and ADC can be different. And the ratio corresponding
> to the bit is also different. They are two different tables for
> osr_dac_sel and osr_adc_sel. Then it should be noted that the OSR and
> Fs must be selected carefully so that the max frequency of CLK_ADC or
> CLK_DAC are less than or equal to 6.144MHz.

Right, I somehow did misread dac and adc, and thought that they are the 
same table.

>>> +
>>> +    if (!osrate || rate * osrate > CLK_DA_AD_MAX) {
>>> +        dev_err(nau8821->dev,
>>> +        "exceed the maximum frequency of CLK_ADC or CLK_DAC\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>
>> ...

