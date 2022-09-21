Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6853F5C00D4
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 17:12:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE8DD164D;
	Wed, 21 Sep 2022 17:11:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE8DD164D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663773169;
	bh=A7sz6EXwqIAWb/Tb19LXWHCaCFvIWu79u7rPwHDHwVw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SxJ65DgXp5HVzQlYWPWxoN4syl0f3KGXrF5QZBCryqvMYGLFGl88RfzKisKOQ0VRg
	 nPZ9i4JbIcCtOF5QVS6UwUcYJPul7NMkHqv24qMKmfxwyyp+QTuWOwbfoFQitm176S
	 gAZurkR90PMbUkN2vG/dgje4/WH0QfWmQ6yYsErs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BCE4F80425;
	Wed, 21 Sep 2022 17:11:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DE72F80256; Wed, 21 Sep 2022 17:11:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 844FBF800C9
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 17:11:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 844FBF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Fm0qrTSt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663773102; x=1695309102;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=A7sz6EXwqIAWb/Tb19LXWHCaCFvIWu79u7rPwHDHwVw=;
 b=Fm0qrTSt0c3ZzDXJm0sPib4EXhcbegz0JWFozcLayKDz43N6V643ZAwT
 bgWRX6QFFeW0NxrXLtEvuUpb48e1uKAk5mXWcsuMyj0Gocv5+KDpUeTL1
 NUq9f0MGn+i4NmEtJW0S/XzWUFDBev7BdrEWUnWVQuC3cqSgXUGzxJd3t
 efB5Vn+VBZOnIfF1WCuGMi/wzWcICpv2rx63MYOJA24GmZITBrDcozJKR
 JwoJjhpofaP9Ve/kWRvHW91ycuo++fW3M4e3/pWTmiqDLihFKVSjDHcfd
 QJbvjLPHEor6ON0TJ5gUMQbCRoYDqqvwJ4xJa+mFy2fvqYV36btbyAp7f Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="386315464"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="386315464"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 08:11:32 -0700
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; d="scan'208";a="864464249"
Received: from johannes-mobl1.ger.corp.intel.com (HELO [10.249.46.195])
 ([10.249.46.195])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 08:11:27 -0700
Message-ID: <fd74e77c-f3d3-1f09-2e5a-0a94e2a3eeea@linux.intel.com>
Date: Wed, 21 Sep 2022 17:11:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] ASoC: wcd9335: fix order of Slimbus unprepare/disable
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20220921145354.1683791-1-krzysztof.kozlowski@linaro.org>
 <20916c9d-3598-7c40-ee77-1148c3d2e4b1@linux.intel.com>
 <af3bd3f4-dcd9-8f6c-6323-de1b53301225@linaro.org>
 <9a210b04-2ff2-df98-ad1a-89e9d8b0f686@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <9a210b04-2ff2-df98-ad1a-89e9d8b0f686@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: stable@vger.kernel.org
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



On 9/21/22 17:08, Krzysztof Kozlowski wrote:
> On 21/09/2022 17:06, Krzysztof Kozlowski wrote:
>> On 21/09/2022 17:05, Pierre-Louis Bossart wrote:
>>>> diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
>>>> index 06c6adbe5920..d2548fdf9ae5 100644
>>>> --- a/sound/soc/codecs/wcd9335.c
>>>> +++ b/sound/soc/codecs/wcd9335.c
>>>> @@ -1972,8 +1972,8 @@ static int wcd9335_trigger(struct snd_pcm_substream *substream, int cmd,
>>>>  	case SNDRV_PCM_TRIGGER_STOP:
>>>>  	case SNDRV_PCM_TRIGGER_SUSPEND:
>>>>  	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>>>> -		slim_stream_unprepare(dai_data->sruntime);
>>>>  		slim_stream_disable(dai_data->sruntime);
>>>> +		slim_stream_unprepare(dai_data->sruntime);
>>>
>>> This looks logical but different from what the kernel doc says:
>>>
>>> /**
>>>  * slim_stream_disable() - Disable a SLIMbus Stream
>>>  *
>>>  * @stream: instance of slim stream runtime to disable
>>>  *
>>>  * This API will disable all the ports and channels associated with
>>>  * SLIMbus stream
>>>  *
>>>  * Return: zero on success and error code on failure. From ASoC DPCM
>>> framework,
>>>  * this state is linked to trigger() pause operation.
>>>  */
>>>
>>> /**
>>>  * slim_stream_unprepare() - Un-prepare a SLIMbus Stream
>>>  *
>>>  * @stream: instance of slim stream runtime to unprepare
>>>  *
>>>  * This API will un allocate all the ports and channels associated with
>>>  * SLIMbus stream
>>
>> You mean this piece of doc? Indeed looks inaccurate. I'll update it.
> 
> Wait, no, this is correct. Please point to what is wrong in kernel doc.
> I don't see it. :(

the TRIGGER_STOP and TRIGGER_PAUSE_PUSH do the same thing. There is no
specific mapping of disable() to TRIGGER_STOP and unprepare() to
TRIGGER_PAUSE_PUSH as the documentation hints at.
