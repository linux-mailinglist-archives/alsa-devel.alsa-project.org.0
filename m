Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B93BA464785
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 08:01:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD2CC232A;
	Wed,  1 Dec 2021 08:00:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD2CC232A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638342069;
	bh=D+NRen2wtf9orNHP96lw9UBEWZPu/26ivmq6iyedtMI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fgxZwo71q6Mjaj4fwR2yzsLz7FwFquhPWHOce328oeTQAJNCwvRkwp//MVHZkVsF0
	 YY8a+7B68Lx3qVEYbORCQXhvSuLBcNTAeN6H1mTveNs4gAzTESgtQyl7DD/oEismFc
	 hFJjTBeaujIB8R+Lazp2tXYu+TAHZka7H3CX7gt8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F176F80217;
	Wed,  1 Dec 2021 07:59:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A764EF80246; Wed,  1 Dec 2021 07:59:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D642F80217
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 07:59:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D642F80217
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="223276975"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; d="scan'208";a="223276975"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 22:59:39 -0800
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; d="scan'208";a="654664912"
Received: from eromano1-mobl.ger.corp.intel.com (HELO [10.252.34.207])
 ([10.252.34.207])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 22:59:36 -0800
Message-ID: <fa42decd-44a3-b27d-550f-df1d5b893cea@linux.intel.com>
Date: Wed, 1 Dec 2021 09:00:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] ASoC: rt1011: revert 'I2S Reference' to SOC_ENUM_EXT
Content-Language: en-US
To: Jack Yu <jack.yu@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>, 
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
References: <20211111091705.20879-1-jack.yu@realtek.com>
 <2c3eb3db-d32c-edbf-75b3-29ab478cea13@linux.intel.com>
 <58fb5f01ad11482f8777e7d4d1ced173@realtek.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <58fb5f01ad11482f8777e7d4d1ced173@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?UTF-8?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d?=
 <kent_chen@realtek.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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

Hi jack,

On 01/12/2021 04:36, Jack Yu wrote:
> Hi Peter,
> 
>> On 11/11/2021 11:17, Jack Yu wrote:
>>> Revert 'I2S Reference' to SOC_ENUM_EXT because the settings are
>>> specific for some platforms, the default setting for 'I2S Reference'
>>> does nothing, only some SoC platform need to configure it.
>>> Previous 'I2S Reference' in SOC_ENUM format only toggles one bit of
>>> RT1011_TDM1_SET_1 register, which isn't enough for specific platform.
>>
>> This patch again breaks audio but in a less obvious way.
>> If a user _ever_ touches the "I2S Reference" then audio playback will never
>> going to work again as instead of changing the i2s reference the code clears all
>> settings done by set_tdm_slot, dai_fmt to something which is some product
>> specific setting.
>> One would think that a reboot helps, but on boot we tend to restore the saved
>> amixer settings -> audio playback is broken.
>> So, before reboot one has to set the reference to None and reboot and hope
>> that on boot the NOP (None) is going to be set which means that the custom
>> enum code would not overwrite the configuration of the codec.
>>
>> There is a single bit in RT1011_TDM1_SET_1 (bit 7) which selects the I2S
>> reference and the reset value is Left (0).
>>
>> With this custom enum put code you effectively reconfigure the code to be
>> unusable on most likely in all systems except the one which needs these
>> settings...
>>
> This patch is specific for device which uses I2S format and need the reference data, 
> if the device uses TDM format, it doesn't need to call "I2S Reference ".
> 
> If device runs TDM mode, machine driver sets TDM slot and DAI format, but no need to call " I2S reference ".
> If device runs I2S mode, machine driver sets I2S DAI format, and ucm sets "I2S reference" (it's optional, only if device needs reference signal )

But then this should not be called as 'I2S Reference'
'I2S Reference' is _one_ bit.
This is something like drop dai_fmt and all configuration and
set ADCDAT1/2 pin to output
set I2S, 24 bit for rx/tx
set undocumented BIT12 in RT1011_TDM1_SET_1
set 'TDM1 DOUT Source' to ALC

What happens if one starts 16bit audio playback after triggering this
macro? It is going to change some of the settings and things might brake
here and there?

What I'm saying is that the implementation is misleading and it is
covertly reconfigures the codec to some static config

> 
>>>
>>> Signed-off-by: Jack Yu <jack.yu@realtek.com>
>>> ---
>>>  sound/soc/codecs/rt1011.c | 55
>>> ++++++++++++++++++++++++++++++++++-----
>>>  sound/soc/codecs/rt1011.h |  7 +++++
>>>  2 files changed, 56 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
>>> index 297af7ff824c..b62301a6281f 100644
>>> --- a/sound/soc/codecs/rt1011.c
>>> +++ b/sound/soc/codecs/rt1011.c
>>> @@ -1311,13 +1311,54 @@ static int rt1011_r0_load_info(struct
>> snd_kcontrol *kcontrol,
>>>  	.put = rt1011_r0_load_mode_put \
>>>  }
>>>
>>> -static const char * const rt1011_i2s_ref_texts[] = {
>>> -	"Left Channel", "Right Channel"
>>> +static const char * const rt1011_i2s_ref[] = {
>>> +	"None", "Left Channel", "Right Channel"
>>>  };
>>>
>>> -static SOC_ENUM_SINGLE_DECL(rt1011_i2s_ref_enum,
>>> -			    RT1011_TDM1_SET_1, 7,
>>> -			    rt1011_i2s_ref_texts);
>>> +static SOC_ENUM_SINGLE_DECL(rt1011_i2s_ref_enum, 0, 0,
>>> +	rt1011_i2s_ref);
>>> +
>>> +static int rt1011_i2s_ref_put(struct snd_kcontrol *kcontrol,
>>> +		struct snd_ctl_elem_value *ucontrol) {
>>> +	struct snd_soc_component *component =
>>> +		snd_soc_kcontrol_component(kcontrol);
>>> +	struct rt1011_priv *rt1011 =
>>> +		snd_soc_component_get_drvdata(component);
>>> +
>>> +	rt1011->i2s_ref = ucontrol->value.enumerated.item[0];
>>> +	switch (rt1011->i2s_ref) {
>>> +	case RT1011_I2S_REF_LEFT_CH:
>>> +		regmap_write(rt1011->regmap, RT1011_TDM_TOTAL_SET, 0x0240);
>>> +		regmap_write(rt1011->regmap, RT1011_TDM1_SET_2, 0x8);
>>> +		regmap_write(rt1011->regmap, RT1011_TDM1_SET_1, 0x1022);
>>> +		regmap_write(rt1011->regmap, RT1011_ADCDAT_OUT_SOURCE,
>> 0x4);
>>> +		break;
>>> +	case RT1011_I2S_REF_RIGHT_CH:
>>> +		regmap_write(rt1011->regmap, RT1011_TDM_TOTAL_SET, 0x0240);
>>> +		regmap_write(rt1011->regmap, RT1011_TDM1_SET_2, 0x8);
>>> +		regmap_write(rt1011->regmap, RT1011_TDM1_SET_1, 0x10a2);
>>> +		regmap_write(rt1011->regmap, RT1011_ADCDAT_OUT_SOURCE,
>> 0x4);
>>> +		break;
>>> +	default:
>>> +		dev_info(component->dev, "I2S Reference: Do nothing\n");
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int rt1011_i2s_ref_get(struct snd_kcontrol *kcontrol,
>>> +		struct snd_ctl_elem_value *ucontrol) {
>>> +	struct snd_soc_component *component =
>>> +		snd_soc_kcontrol_component(kcontrol);
>>> +	struct rt1011_priv *rt1011 =
>>> +		snd_soc_component_get_drvdata(component);
>>> +
>>> +	ucontrol->value.enumerated.item[0] = rt1011->i2s_ref;
>>> +
>>> +	return 0;
>>> +}
>>>
>>>  static const struct snd_kcontrol_new rt1011_snd_controls[] = {
>>>  	/* I2S Data In Selection */
>>> @@ -1358,7 +1399,8 @@ static const struct snd_kcontrol_new
>> rt1011_snd_controls[] = {
>>>  	SOC_SINGLE("R0 Temperature", RT1011_STP_INITIAL_RESISTANCE_TEMP,
>>>  		2, 255, 0),
>>>  	/* I2S Reference */
>>> -	SOC_ENUM("I2S Reference", rt1011_i2s_ref_enum),
>>> +	SOC_ENUM_EXT("I2S Reference", rt1011_i2s_ref_enum,
>>> +		rt1011_i2s_ref_get, rt1011_i2s_ref_put),
>>>  };
>>>
>>>  static int rt1011_is_sys_clk_from_pll(struct snd_soc_dapm_widget
>>> *source, @@ -2017,6 +2059,7 @@ static int rt1011_probe(struct
>>> snd_soc_component *component)
>>>
>>>  	schedule_work(&rt1011->cali_work);
>>>
>>> +	rt1011->i2s_ref = 0;
>>>  	rt1011->bq_drc_params = devm_kcalloc(component->dev,
>>>  		RT1011_ADVMODE_NUM, sizeof(struct rt1011_bq_drc_params *),
>>>  		GFP_KERNEL);
>>> diff --git a/sound/soc/codecs/rt1011.h b/sound/soc/codecs/rt1011.h
>>> index 68fadc15fa8c..4d6e7492d99c 100644
>>> --- a/sound/soc/codecs/rt1011.h
>>> +++ b/sound/soc/codecs/rt1011.h
>>> @@ -654,6 +654,12 @@ enum {
>>>  	RT1011_AIFS
>>>  };
>>>
>>> +enum {
>>> +	RT1011_I2S_REF_NONE,
>>> +	RT1011_I2S_REF_LEFT_CH,
>>> +	RT1011_I2S_REF_RIGHT_CH,
>>> +};
>>> +
>>>  /* BiQual & DRC related settings */
>>>  #define RT1011_BQ_DRC_NUM 128
>>>  struct rt1011_bq_drc_params {
>>> @@ -692,6 +698,7 @@ struct rt1011_priv {
>>>  	unsigned int r0_reg, cali_done;
>>>  	unsigned int r0_calib, temperature_calib;
>>>  	int recv_spk_mode;
>>> +	int i2s_ref;
>>>  };
>>>
>>>  #endif		/* end of _RT1011_H_ */
>>>
>>
>> --
>> Péter
>> ------Please consider the environment before printing this e-mail.

-- 
Péter
