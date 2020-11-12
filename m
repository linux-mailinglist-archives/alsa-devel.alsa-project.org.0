Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E592B0074
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 08:43:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ACBE16FA;
	Thu, 12 Nov 2020 08:42:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ACBE16FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605166987;
	bh=ovIuoeLSEZE4X6BdC1mnqZVl3806WJlwf6GPxJgsOSI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QIzJ8GZu+H346ZBTOBJWPIZWPms+87Wiz+2v4mzi/i1gBl3d+FcPtqab/9WyLN+oV
	 0Q4hLeuitTkhh14cPoFxucp1wCwRHcnRrwSzB4DNg84jyb6PH94j66AcIV92IW+KI4
	 cLh2Be+DwucYjgt10zZ9D+o1sooDnRX5ZCP7eaZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADEB1F800D1;
	Thu, 12 Nov 2020 08:41:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52875F801D5; Thu, 12 Nov 2020 08:41:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_78,RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAA07F8007E
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 08:41:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAA07F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="apQjJ5mu"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AC7fEOh093923;
 Thu, 12 Nov 2020 01:41:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605166874;
 bh=45YuHlFIl+nnPp8u/mhMJGmH384zohkuJQT6RBJvbNI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=apQjJ5mumOgTzvWaAzTnzy2fE9AB691cWG25I2OSaFk1U1VaHHVHNcP0REYcw0x9N
 zsb7+l6EDI772UFOsov6mFj5rLBEz1DOPCqazc5lgMx+peVX02PiHL0Yn1f9oooUPa
 hNCOoBq8ps7Zw7QsXdEx5ZX/N78JTIKTBnvDXlZk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AC7fEY7041868
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Nov 2020 01:41:14 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 12
 Nov 2020 01:41:13 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 12 Nov 2020 01:41:13 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AC7fBq8009001;
 Thu, 12 Nov 2020 01:41:12 -0600
Subject: Re: [PATCH] ASoC: pcm512x: Add support for data formats RJ and LJ
To: Kirill Marinushkin <kmarinushkin@birdec.com>
References: <20201109212133.25869-1-kmarinushkin@birdec.com>
 <690508c7-7029-6781-a1a2-0609e37cb9e6@ti.com>
 <a3df4fb0-35cd-4757-2037-d4ff80e9f74c@birdec.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <d0f76607-c3a5-9b87-dc0e-eddbce585558@ti.com>
Date: Thu, 12 Nov 2020 09:41:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <a3df4fb0-35cd-4757-2037-d4ff80e9f74c@birdec.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Matthias Reichl <hias@horus.com>,
 Mark Brown <broonie@kernel.org>
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

Hi Kirill,

On 11/11/2020 9.54, Kirill Marinushkin wrote:
> Hello Peter,
> 
> than you for your review!
> 
>> The bus format and
>>
>>>  	switch (pcm512x->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
>>
>>>  	case SND_SOC_DAIFMT_CBS_CFS:
>>>  		ret = regmap_update_bits(pcm512x->regmap,
>>
>> the clock generation role should be set in pcm512x_set_fmt(), in that
>> way you can deny specific setups earlier.
> 
> I think we could move both checks for`SND_SOC_DAIFMT_FORMAT_MASK` and
> `SND_SOC_DAIFMT_MASTER_MASK` into `pcm512x_set_fmt()`. But it would be a
> different scope, and I didn't intend to do that level of refactoring.

Right, I was just saying what would make sense.

> Looking at other codecs in kernel, I would say, that doing those checks in
> `pcm512x_hw_params()`, as they are done currently, is an equally valid approach.

The exception proves the rule

> As technically keeping checs where they are now doesn't break anything

They are just in a wrong place.

> and is
> aligned with ASoC codecs design, I suggest to keep the checks where they are.

The set_fmt callback is there to set the bus format, it has nothing to
do (in most cases) with the sample format (hw_params). Bus coding, clock
source has nothing to do with hw_params.

When you bind a link you will use set_fmt for the two sides to see if
they can agree, that both can support what has been asked.

The pcm512x driver just saves the fmt and say back to that card:
whatever, I'm fine with it. But runtime during hw_params it can fail due
to unsupported bus format, which it actually acked to be ok.

This is the difference.

Sure, some device have constraint based on the fmt towards the hw_params
and it is perfectly OK to do such a checks and rejections or build
rules/constraints based on fmt, but failing hw_params just because
set_fmt did not checked that the bus format is not even supported is not
a nice thing to do.

> Would you agree?

I don't have a device to test, I'm just trying to point out what is the
right thing to do.

I don't buy the argument that the sequencing is important here for the
register writes. The fmt is set only once and those registers will be
only written once.

>> I would also add DSP_A and DSP_B modes at the same time, DSP_A would
>> need a write of 1 to register 41 (PCM512x_I2S_2, offset = 1), other
>> formats should set the offset to 0.
> 
> That's a good idea, than you for technical details! I just didn't know how to
> use DSP_A and DSP_B. I will add them, and submit as patch v2

Great!
Thanks
- Péter

> Best regards,
> Kirill
> 
> On 11/10/2020 07:59 AM, Peter Ujfalusi wrote:
>>
>>
>> On 09/11/2020 23.21, Kirill Marinushkin wrote:
>>> Currently, pcm512x driver supports only I2S data format.
>>> This commit adds RJ and LJ as well.
>>>
>>> I don't expect regression WRT existing sound cards, because:
>>>
>>> * default value in corresponding register of pcm512x codec is 0 ==  I2S
>>> * existing in-tree sound cards with pcm512x codec are configured for I2S
>>> * i don't see how existing off-tree sound cards with pcm512x codec could be
>>>   configured differently - it would not work
>>> * tested explicitly, that there is no regression with Raspberry Pi +
>>>   sound card `sound/soc/bcm/hifiberry_dacplus.c`
>>>
>>> Signed-off-by: Kirill Marinushkin <kmarinushkin@birdec.com>
>>> Cc: Mark Brown <broonie@kernel.org>
>>> Cc: Takashi Iwai <tiwai@suse.com>
>>> Cc: Liam Girdwood <lgirdwood@gmail.com>
>>> Cc: Matthias Reichl <hias@horus.com>
>>> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
>>> Cc: alsa-devel@alsa-project.org
>>> Cc: linux-kernel@vger.kernel.org
>>> ---
>>>  sound/soc/codecs/pcm512x.c | 24 ++++++++++++++++++++++++
>>>  1 file changed, 24 insertions(+)
>>>
>>> diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
>>> index 8153d3d01654..c6e975fb4a43 100644
>>> --- a/sound/soc/codecs/pcm512x.c
>>> +++ b/sound/soc/codecs/pcm512x.c
>>> @@ -1167,6 +1167,7 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
>>>  	struct snd_soc_component *component = dai->component;
>>>  	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
>>>  	int alen;
>>> +	int afmt;
>>>  	int gpio;
>>>  	int clock_output;
>>>  	int master_mode;
>>> @@ -1195,6 +1196,22 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
>>>  		return -EINVAL;
>>>  	}
>>>  
>>> +	switch (pcm512x->fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>>> +	case SND_SOC_DAIFMT_I2S:
>>> +		afmt = PCM512x_AFMT_I2S;
>>> +		break;
>>> +	case SND_SOC_DAIFMT_RIGHT_J:
>>> +		afmt = PCM512x_AFMT_RTJ;
>>> +		break;
>>> +	case SND_SOC_DAIFMT_LEFT_J:
>>> +		afmt = PCM512x_AFMT_LTJ;
>>> +		break;
>>> +	default:
>>> +		dev_err(component->dev, "unsupported DAI format: 0x%x\n",
>>> +			pcm512x->fmt);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>
>> The bus format and
>>
>>>  	switch (pcm512x->fmt & SND_SOC_DAIFMT_MASTER_MASK) {
>>
>>>  	case SND_SOC_DAIFMT_CBS_CFS:
>>>  		ret = regmap_update_bits(pcm512x->regmap,
>>
>> the clock generation role should be set in pcm512x_set_fmt(), in that
>> way you can deny specific setups earlier.
>>
>> I would also add DSP_A and DSP_B modes at the same time, DSP_A would
>> need a write of 1 to register 41 (PCM512x_I2S_2, offset = 1), other
>> formats should set the offset to 0.
>>
>>> @@ -1236,6 +1253,13 @@ static int pcm512x_hw_params(struct snd_pcm_substream *substream,
>>>  		return ret;
>>>  	}
>>>  
>>> +	ret = regmap_update_bits(pcm512x->regmap, PCM512x_I2S_1,
>>> +				 PCM512x_AFMT, afmt);
>>> +	if (ret != 0) {
>>> +		dev_err(component->dev, "Failed to set data format: %d\n", ret);
>>> +		return ret;
>>> +	}
>>> +
>>>  	if (pcm512x->pll_out) {
>>>  		ret = regmap_write(pcm512x->regmap, PCM512x_FLEX_A, 0x11);
>>>  		if (ret != 0) {
>>>
>>
>> - Péter
>>
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
>>


Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
