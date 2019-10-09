Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 322FCD137E
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 18:03:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF0131677;
	Wed,  9 Oct 2019 18:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF0131677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570636979;
	bh=Qwd8TEsIxnSIEz0MZsJyEDjM+S6s+Iy5bS6o7lN31+w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fi8zlH18FYCIPOWwizIjioTSdaoKKOO2FkC//DScrU07Bh2paEx2k9AM51+6mIC4n
	 r5gNvKTn/kSvaliChbvfdXuwPA6xCysVvlJJL6VNnPB7fMYUemiYwnralVUUzZ4+S1
	 Y9dDOr+JRemqEZr5sKVMRCKmF5XMiu/UE0P5u3gQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3A1CF805FC;
	Wed,  9 Oct 2019 18:01:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A9A6F805FD; Wed,  9 Oct 2019 18:01:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1D73F805FB
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 18:01:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1D73F805FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HaBfOFrH"
Received: by mail-wr1-x444.google.com with SMTP id j18so3657960wrq.10
 for <alsa-devel@alsa-project.org>; Wed, 09 Oct 2019 09:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bDqDxoFy92WA4ghkXv1lx9zPC55ecQKMRynuRGpc+u0=;
 b=HaBfOFrHa9oyt36nChd39PrJeZUuOjiwkLqEufxO0FDeZaAM8pWk3w4qC1FGJOimkU
 6wWBfq2FQ/2E8UwhSjPpYWlZ+oBCdv6+FSOJIHJg4+UDLU1RVGiSXws/q5x6ExjaEtfU
 zY6UQfEr64W+A634cyy+tMjAFKqRE7kRsq7zQNtKYkuOe0Fk/sI/R66Q9wnewpNnPv5i
 YFish3WqSGpPEY6BlBJU4lqY8vkSGrKW0vVc6bHEhhpKx/OJhUGrnSdSK/7dpNia+Piu
 RBrnot2SiL8iXKl9WrBpL0hG05qmasETpP59f8VRzgfBv2358jKef340rHlceZw20cVW
 r4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bDqDxoFy92WA4ghkXv1lx9zPC55ecQKMRynuRGpc+u0=;
 b=ErJsQAujTA3P6ew3cUaC168HS7gVDk+HljZ5txx5utPwh2kEOp+cFEeBYuhrFemHV5
 mldOGKUTLfXsZPrNhseaFYYF0LpikQmfZEakzY+017M/8DiE4Z3JZaO2btgTaTeVqhB8
 C2Px6TIV620wNXK1gL0cgw+dk5IoA2c9fbhKnfbtrvx35gyJJMtnVvJGgiNDXpHa9QZw
 sdqsV6Ec3oni3M3YM9fgESY1ILpnQdOgkqZmQzJyO8jp9zsDtAkoqxpILiYPYI734Wth
 SzQqgiIveV1YgFbT5F98kL0ancKSCVUiBptQSSgSedinnHZJgVk1gPVJxPDqnRn134pR
 4/wA==
X-Gm-Message-State: APjAAAXzau3cow3U250CRYb7uDBBfpQy5UBO+qpYcRm6jSTVAbKfe1De
 3K1y54dmneZh3XRs/XfI9oS0cw==
X-Google-Smtp-Source: APXvYqzS4G4hCzugWk9CK8hEXOZqPw/jgCNwNE5AD8pAOVurhhqma+ZSJFGExlpy2Hxm0bdJ4iPIUw==
X-Received: by 2002:adf:8123:: with SMTP id 32mr3763237wrm.300.1570636862592; 
 Wed, 09 Oct 2019 09:01:02 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id q124sm3600028wma.5.2019.10.09.09.01.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 09:01:01 -0700 (PDT)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-4-srinivas.kandagatla@linaro.org>
 <ba88e0f9-ae7d-c26e-d2dc-83bf910c2c01@linux.intel.com>
 <c2eecd44-f06a-7287-2862-0382bf697f8d@linaro.org>
 <d2b7773b-d52a-7769-aa5b-ef8c8845d447@linux.intel.com>
 <d7c1fdb2-602f-ecb1-9b32-91b893e7f408@linaro.org>
 <f0228cb4-0a6f-17f3-fe03-9be7f5f2e59d@linux.intel.com>
 <20190813191827.GI5093@sirena.co.uk>
 <cc360858-571a-6a46-1789-1020bcbe4bca@linux.intel.com>
 <20190813195804.GL5093@sirena.co.uk>
 <20190814041142.GU12733@vkoul-mobl.Dlink>
 <99d35a9d-cbd8-f0da-4701-92ef650afe5a@linux.intel.com>
 <5e08f822-3507-6c69-5d83-4ce2a9f5c04f@linaro.org>
 <53bb3105-8e85-a972-fce8-a7911ae4d461@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <95870089-25da-11ea-19fd-0504daa98994@linaro.org>
Date: Wed, 9 Oct 2019 17:01:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <53bb3105-8e85-a972-fce8-a7911ae4d461@linux.intel.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
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



On 09/10/2019 15:29, Pierre-Louis Bossart wrote:
> 
> 
> On 10/9/19 3:32 AM, Srinivas Kandagatla wrote:
>> Hi Pierre,
>>
>> On 14/08/2019 15:09, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 8/13/19 11:11 PM, Vinod Koul wrote:
>>>> On 13-08-19, 20:58, Mark Brown wrote:
>>>>> On Tue, Aug 13, 2019 at 02:38:53PM -0500, Pierre-Louis Bossart wrote:
>>>>>
>>>>>> Indeed. I don't have a full understanding of that part to be 
>>>>>> honest, nor why
>>>>>> we need something SoundWire-specific. We already abused the 
>>>>>> set_tdm_slot API
>>>>>> to store an HDaudio stream, now we have a rather confusing stream
>>>>>> information for SoundWire and I have about 3 other 'stream' 
>>>>>> contexts in
>>>>>> SOF... I am still doing basic cleanups but this has been on my 
>>>>>> radar for a
>>>>>> while.
>>>>>
>>>>> There is something to be said for not abusing the TDM slot API if 
>>>>> it can
>>>>> make things clearer by using bus-idiomatic mechanisms, but it does 
>>>>> mean
>>>>> everything needs to know about each individual bus :/ .
>>>>
>>>> Here ASoC doesn't need to know about sdw bus. As Srini explained, this
>>>> helps in the case for him to get the stream context and set the stream
>>>> context from the machine driver.
>>>>
>>>> Nothing else is expected to be done from this API. We already do a set
>>>> using snd_soc_dai_set_sdw_stream(). Here we add the 
>>>> snd_soc_dai_get_sdw_stream() to query
>>>
>>> I didn't see a call to snd_soc_dai_set_sdw_stream() in Srini's code?
>>
>>
>> There is a snd_soc_dai_get_sdw_stream() to get stream context and we 
>> add slave streams(amplifier in this case) to that context using 
>> sdw_stream_add_slave() in machine driver[1].
>>
>> Without this helper there is no way to link slave streams to stream 
>> context in non dai based setup like smart speaker amplifiers.
>>
>> Currently this driver is blocked on this patch, If you think there are 
>> other ways to do this, am happy to try them out.
> 
> So to be clear, you are *not* using snd_soc_dai_set_sdw_stream?
Yes, am not using snd_soc_dai_set_sdw_stream().

--srini
> 
> 
> 
> 
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
