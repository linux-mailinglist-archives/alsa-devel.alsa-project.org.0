Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC1570CC6
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 00:36:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D99E1855;
	Tue, 23 Jul 2019 00:35:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D99E1855
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563834962;
	bh=tCTMazQiSaSinJND4bk4R1T2YD1GDuP8iDjnaCyjhKI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uLeLpAHXJNuXbWmIlmuy/uQuKkzy5aJZCwEQXTGcOaVkAFe4W84k+aV+JRfuv+Val
	 mDJrgTf2vtVKiadp1pRNNWdYf5tcO08oA/IJiU0PFdRiRWfcVy7Fdjq3Hdk5JBHfPm
	 YhLp+Jr6IsCsZvr3Bo76+LoN6ly3hch8rIyZCWX8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AFCEF803D5;
	Tue, 23 Jul 2019 00:34:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FFCAF803D5; Tue, 23 Jul 2019 00:34:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29D38F800E8
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 00:34:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29D38F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 15:34:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,296,1559545200"; d="scan'208";a="344554500"
Received: from pgkutch-mobl1.amr.corp.intel.com (HELO [10.252.130.35])
 ([10.252.130.35])
 by orsmga005.jf.intel.com with ESMTP; 22 Jul 2019 15:34:05 -0700
To: Jon Flatley <jflat@chromium.org>
References: <20190718231225.88991-1-jflat@chromium.org>
 <f2e1c69e-bba9-8798-536c-1a2681e02599@linux.intel.com>
 <CACJJ=py4hEJMSVBX+=O8Myj-LQYvDL6vugTUR4ypq0W6uCn1kw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a2b40b35-d572-04af-2a38-ece191bd91b4@linux.intel.com>
Date: Mon, 22 Jul 2019 17:34:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CACJJ=py4hEJMSVBX+=O8Myj-LQYvDL6vugTUR4ypq0W6uCn1kw@mail.gmail.com>
Content-Language: en-US
Cc: benzh@chromium.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 cujomalainey@chromium.org, fletcherw@chromium.org
Subject: Re: [alsa-devel] [PATCH] ASoC: intel: Add Broadwell rt5650 machine
 driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 7/22/19 4:04 PM, Jon Flatley wrote:
> On Mon, Jul 22, 2019 at 5:34 AM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>
>>
>> On 7/18/19 6:12 PM, Jon Flatley wrote:
>>> From: Ben Zhang <benzh@chromium.org>
>>>
>>> Add machine driver for Broadwell + rt5650.
>>
>> Interesting. the only Broadwell device we encountered with I2S instead
>> of HDaudio was Samus w/ rt5677, can you share which model this is?
> 
> Yes, this is for the Acer Chromebase 24, aka Buddy.

Ah ok, I wasn't aware of this one, thanks for the pointer.


>>> +static int bdw_rt5650_rtd_init(struct snd_soc_pcm_runtime *rtd)
>>> +{
>>> +     struct snd_soc_component *component =
>>> +             snd_soc_rtdcom_lookup(rtd, DRV_NAME);
>>> +     struct sst_pdata *pdata = dev_get_platdata(component->dev);
>>> +     struct sst_hsw *broadwell = pdata->dsp;
>>> +     int ret;
>>> +
>>> +     /* Set ADSP SSP port settings
>>> +      * clock_divider = 4 means BCLK = MCLK/5 = 24MHz/5 = 4.8MHz
>>> +      */
>>> +     ret = sst_hsw_device_set_config(broadwell, SST_HSW_DEVICE_SSP_0,
>>> +             SST_HSW_DEVICE_MCLK_FREQ_24_MHZ,
>>> +             SST_HSW_DEVICE_TDM_CLOCK_MASTER, 4);
>>
>> this is going to break compilation if SOF is selected. this function
>> should be filtered out with
>> #if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
>>
>> as done in bdw-rt5677
>>
>>> +     if (ret < 0) {
>>> +             dev_err(rtd->dev, "error: failed to set device config\n");
>>> +             return ret;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int bdw_rt5650_init(struct snd_soc_pcm_runtime *rtd)
>>> +{
>>> +     struct bdw_rt5650_priv *bdw_rt5650 =
>>> +             snd_soc_card_get_drvdata(rtd->card);
>>> +     struct snd_soc_component *component = rtd->codec_dai->component;
>>> +     struct snd_soc_dai *codec_dai = rtd->codec_dai;
>>> +     int ret;
>>> +
>>> +     /* Enable codec ASRC function for Stereo DAC/Stereo1 ADC/DMIC/I2S1.
>>> +      * The ASRC clock source is clk_i2s1_asrc.
>>> +      */
>>> +     rt5645_sel_asrc_clk_src(component,
>>> +                             RT5645_DA_STEREO_FILTER |
>>> +                             RT5645_DA_MONO_L_FILTER |
>>> +                             RT5645_DA_MONO_R_FILTER |
>>> +                             RT5645_AD_STEREO_FILTER |
>>> +                             RT5645_AD_MONO_L_FILTER |
>>> +                             RT5645_AD_MONO_R_FILTER,
>>> +                             RT5645_CLK_SEL_I2S1_ASRC);
>>> +
>>> +     /* TDM 4 slots 24 bit, set Rx & Tx bitmask to 4 active slots */
>>> +     ret = snd_soc_dai_set_tdm_slot(codec_dai, 0xF, 0xF, 4, 24);
>>
>> could we move this to bdw_rt5650_rtd_init() so that this doesn't impact SOF?
> 
> I'm not familiar with the differences in SOF. Can you elaborate on
> what exactly needs to be moved?

The 2 main differences are that SOF does not have any support for this 
sst_hsw_device_set_config() function - and it should have been 
abstracted away with a dai operation - and the fixed settings are 
replaced by topology-defined configurations.

we can of course do the SOF support later but you want to make sure the 
compilation issue is sorted out with the #if !IS_ENABLED() code above.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
