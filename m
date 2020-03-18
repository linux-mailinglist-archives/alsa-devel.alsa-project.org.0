Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8419E189FA7
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 16:30:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A6B21738;
	Wed, 18 Mar 2020 16:29:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A6B21738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584545415;
	bh=GwaKzoDx+9hnrPQKhyO7A9KQ239EqlMsYx+OlG2Dr+c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p4eN+I0E/az7FkLIhuYLC/lJc5fz7G684hKgDtDy9zDOopKL0PVE4pRTrN+ZAUkLJ
	 1GGftWq9yMWzdYdApxre72AUulvT9/F47s+AbtY41ng5kDao8Z0xorrOowlBPaFnrR
	 HlAYivqyIORc5x+lOaT8/49BHpN+UxxYv32vfXoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBC56F8015B;
	Wed, 18 Mar 2020 16:28:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90782F8015B; Wed, 18 Mar 2020 16:28:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E641DF800B7
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 16:28:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E641DF800B7
IronPort-SDR: tuVw3/FaT52ivTdXK1JioBklj7lEYLkwncBH/eEqFGlOTLHmECoA2LgnEdCM8+mnO235+TRO+A
 oPDkjd00PHog==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 08:28:25 -0700
IronPort-SDR: G42k5j9C+Udeti2e8o0QxUDv4p9YSyXsUyVWRcMeC8ssQM82hCw3eerjprY4E8Jg44CfvLbpHS
 NC3hIwhi0zZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,568,1574150400"; d="scan'208";a="417985195"
Received: from nali1-mobl3.amr.corp.intel.com (HELO [10.255.33.194])
 ([10.255.33.194])
 by orsmga005.jf.intel.com with ESMTP; 18 Mar 2020 08:28:24 -0700
Subject: Re: [PATCH 1/2] ASoC: qcom: sdm845: handle soundwire stream
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20200317095351.15582-1-srinivas.kandagatla@linaro.org>
 <20200317095351.15582-2-srinivas.kandagatla@linaro.org>
 <8daeeb26-851b-8311-30f5-5d285ccbc255@linux.intel.com>
 <69c72f5a-e72e-b7b3-90cb-a7354dcb175d@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cbc6cc9b-24f5-8c2a-b60d-b5dab08c128e@linux.intel.com>
Date: Wed, 18 Mar 2020 10:26:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <69c72f5a-e72e-b7b3-90cb-a7354dcb175d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, vkoul@kernel.org,
 lgirdwood@gmail.com
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



>>>       for_each_rtd_codec_dais(rtd, i, codec_dai) {
>>> +        sruntime = snd_soc_dai_get_sdw_stream(codec_dai,
>>> +                              substream->stream);
>>> +        if (sruntime != ERR_PTR(-ENOTSUPP))
>>> +            pdata->sruntime[cpu_dai->id] = sruntime;
>>> +        else
>>> +            pdata->sruntime[cpu_dai->id] = NULL;
>>> +
>>
>> Can you explain this part?
>> The get_sdw_stream() is supposed to return what was set by 
>> set_sdw_stream(), so if it's not supported isn't this an error?
> 
> In this case its not an error because we have
> totally 3 codecs in this path.
> One wcd934x Slimbus codec and two wsa881x Soundwire Codec.
> 
> wcd934x codec side will return ENOTSUPP which is not an error.

I must admit I am quite confused here.
After reading your response, I thought this was a case of codec-to-codec 
dailink, but then you also have a notion of cpu_dai?

>>
>>>           ret = snd_soc_dai_get_channel_map(codec_dai,
>>>                   &tx_ch_cnt, tx_ch, &rx_ch_cnt, rx_ch);
>>> @@ -425,8 +437,65 @@ static void  sdm845_snd_shutdown(struct 
>>> snd_pcm_substream *substream)
>>>       }
>>>   }
>>> +static int sdm845_snd_prepare(struct snd_pcm_substream *substream)
>>> +{
>>> +    struct snd_soc_pcm_runtime *rtd = substream->private_data;
>>> +    struct sdm845_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
>>> +    struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
>>> +    struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
>>> +    int ret;
>>> +
>>> +    if (!sruntime)
>>> +        return 0;
>>
>> same here, isn't this an error?
> 
> These callbacks are used for other dais aswell in this case
> HDMI, Slimbus and Soundwire, so sruntime being null is not treated as 
> error.

Same comment, how does the notion of cpu_dai come in the picture for a 
SoundWire dailink?
Would you mind listing what the components of the dailinks are?
