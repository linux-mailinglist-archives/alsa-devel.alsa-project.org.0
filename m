Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8643ED2449
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 10:52:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2160166B;
	Thu, 10 Oct 2019 10:51:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2160166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570697537;
	bh=RBUWARUHuN36yFYpzOFajNlyrjENJCzKpni0dXxvXYI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ee6/1Mo0PmipdOQyIUfHRTF+HBgTmbeyRnub9OWTFm/7AdeeSc2HxCTtSiv4HviCO
	 qvgsfysk9TlrmlNsJz2pzcYnLLu+8EcI2G8SRLvw8hGdRbFfTSta3VBvFrEoJk2F6B
	 GpLJtu2WXv5Ei4xLyJPBgSCVUxoLeZyqO3JpqmY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F4B0F800E3;
	Thu, 10 Oct 2019 10:50:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30366F8038F; Thu, 10 Oct 2019 10:50:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0C61F800E3
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 10:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0C61F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Q/kFfAx5"
Received: by mail-wm1-x344.google.com with SMTP id 5so6013976wmg.0
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 01:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CaSbN7PRxQjoeZuLYZCS/ibrJufD/sGhgzh/IxmCXB0=;
 b=Q/kFfAx5bsul8OwzADd7GaD5P3N6vWkTxheK4IdLMtL3FweIIQGg3nrFmDj9FsjwYv
 g7VN4G0a+M4PgzOA5Z0f2Zj6STOST83/zIrUavjrlsK4MWXKcWXCVnlvobfPS8Y3zG13
 izHikJVVQf5NXthw+W+0V7fdGmH0jX+cMF0RBf5Xdnals8I5ckqMg1h0RYILD4IUb3LK
 qhl5/ac1GEn2CpW9AKp0Yw4Xfhcz2win1W58PFaHrnePSL5GCSRpM3g3hHB7kffo8r9S
 6QFD3RrPlHh6V1rWv7LDuDHFeB3ejpUlnLjitW4zh+HJlgw0kgEN8dCk66RQzp+jrjjN
 CPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CaSbN7PRxQjoeZuLYZCS/ibrJufD/sGhgzh/IxmCXB0=;
 b=Xt7HGr+O4re5xAZX/DIp6tSUo4IDdHF75o46wcVd1EjIZtBNKFEkC3RAYWhz1VXx1z
 TJi2iDTCdMsW1EGj62Bp+GPqIIXnzo6qR9x8rCMn4DRFg1y1zv/RpYAe19ekXny/GHQ+
 A5t5N6L2hmK9MIyyV+LOhchj99cDtNOu4P6oy9Aw/NHzZ2akcVoIu4ltBSCP53QA8NS3
 6m7jeKKXTyNpft1NKfWiWL+tjWkXXATeHbQH0G1+CJ2q+7cmGYXX76AtLrZy6s/7LKeV
 FaYUGHZdTvM2AmP6CcUA13ML0ILjGFTgUtmMm8+SIrg/L+B5M6kBd8JyFKWq7tZU1Uv0
 T7FA==
X-Gm-Message-State: APjAAAX8CIar+b+5qXwyIgW7L1swNaIdpTuo8OO6A46Vdtg72GDTUTnW
 TedvRFzMkSBhSPE8+GGyX9DnUw==
X-Google-Smtp-Source: APXvYqynP6wIggXzDDvzdrv2aJ+sTKUmFj2Xg07oubjzNbikJp1j3UntU1oUCON1/ZzY0a39oVbQlg==
X-Received: by 2002:a05:600c:1088:: with SMTP id
 e8mr6697021wmd.27.1570697424720; 
 Thu, 10 Oct 2019 01:50:24 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id b130sm7435533wmh.12.2019.10.10.01.50.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Oct 2019 01:50:23 -0700 (PDT)
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
 <95870089-25da-11ea-19fd-0504daa98994@linaro.org>
 <2326a155-332e-fda0-b7a2-b48f348e1911@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <34e4cde8-f2e5-0943-115a-651d86f87c1a@linaro.org>
Date: Thu, 10 Oct 2019 09:50:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2326a155-332e-fda0-b7a2-b48f348e1911@linux.intel.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, spapothi@codeaurora.org
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



On 09/10/2019 19:53, Pierre-Louis Bossart wrote:
> 
> 
> On 10/9/19 11:01 AM, Srinivas Kandagatla wrote:
>>
>>
>> On 09/10/2019 15:29, Pierre-Louis Bossart wrote:
>>>
>>>
>>> On 10/9/19 3:32 AM, Srinivas Kandagatla wrote:
>>>> Hi Pierre,
>>>>
>>>> On 14/08/2019 15:09, Pierre-Louis Bossart wrote:
>>>>>
>>>>>
>>>>> On 8/13/19 11:11 PM, Vinod Koul wrote:
>>>>>> On 13-08-19, 20:58, Mark Brown wrote:
>>>>>>> On Tue, Aug 13, 2019 at 02:38:53PM -0500, Pierre-Louis Bossart 
>>>>>>> wrote:
>>>>>>>
>>>>>>>> Indeed. I don't have a full understanding of that part to be 
>>>>>>>> honest, nor why
>>>>>>>> we need something SoundWire-specific. We already abused the 
>>>>>>>> set_tdm_slot API
>>>>>>>> to store an HDaudio stream, now we have a rather confusing stream
>>>>>>>> information for SoundWire and I have about 3 other 'stream' 
>>>>>>>> contexts in
>>>>>>>> SOF... I am still doing basic cleanups but this has been on my 
>>>>>>>> radar for a
>>>>>>>> while.
>>>>>>>
>>>>>>> There is something to be said for not abusing the TDM slot API if 
>>>>>>> it can
>>>>>>> make things clearer by using bus-idiomatic mechanisms, but it 
>>>>>>> does mean
>>>>>>> everything needs to know about each individual bus :/ .
>>>>>>
>>>>>> Here ASoC doesn't need to know about sdw bus. As Srini explained, 
>>>>>> this
>>>>>> helps in the case for him to get the stream context and set the 
>>>>>> stream
>>>>>> context from the machine driver.
>>>>>>
>>>>>> Nothing else is expected to be done from this API. We already do a 
>>>>>> set
>>>>>> using snd_soc_dai_set_sdw_stream(). Here we add the 
>>>>>> snd_soc_dai_get_sdw_stream() to query
>>>>>
>>>>> I didn't see a call to snd_soc_dai_set_sdw_stream() in Srini's code?
>>>>
>>>>
>>>> There is a snd_soc_dai_get_sdw_stream() to get stream context and we 
>>>> add slave streams(amplifier in this case) to that context using 
>>>> sdw_stream_add_slave() in machine driver[1].
>>>>
>>>> Without this helper there is no way to link slave streams to stream 
>>>> context in non dai based setup like smart speaker amplifiers.
>>>>
>>>> Currently this driver is blocked on this patch, If you think there 
>>>> are other ways to do this, am happy to try them out.
>>>
>>> So to be clear, you are *not* using snd_soc_dai_set_sdw_stream?
>> Yes, am not using snd_soc_dai_set_sdw_stream().
> 
> It's been a while since this thread started, and I still don't quite get 
> the concepts or logic.
> 
> First, I don't understand what the problem with "aux" devices is. All 
> the SoundWire stuff is based on the concept of DAI, so I guess I am 

That is the actual problem! Some aux devices does not have dais.

> missing why introducing the "aux" device changes anything.
> 

Problem is that aux devices(amplifier) are dai less but connected via 
SoundWire. So question is how do we attach those SoundWire streams to 
SoundWire master stream?

My Idea was to get handle to the SoundWire stream from controller dai 
and adding these aux SoundWire slave devices as slave to them in machine 
driver. This was much less intrusive than other solutions.

Is there a better way to associate a dai-less codecs to SoundWire master 
stream?

> Next, a 'stream' connects multiple DAIs to transmit information from 
> sources to sinks. A DAI in itself is created without having any notion 
> of which stream it will be associated with. This can only be done with 
> machine level information.
> 
> If you query a DAI to get a stream context, then how is this stream 
> context allocated in the first place? It looks like a horse and cart 
> problem. Or you are assuming that a specific DAI provides the context, 
> and that all other DAIs do not expose this .get_sdw_stream()? What if 
> more that 1 DAI provide a stream context?

In this particular board setup. Soundwire master is allocating the 
stream runtime for each of it dais, and this runtime is used in machine 
driver to attach Auxdev Soundwire slaves.

Other setups where the codec has dai should work as expected!


> 
> And last, I am even more lost since w/ the existing codec drivers we 
> have, sdw_stream_add_slave() is called from the dai .hw_params callback, 
> once you have information on formats/rates, etc. using 
> sdw_stream_add_slave() from a machine driver looks like an even bigger 
> stretch. I really thought the machine driver would only propagate the 
> notion of stream to all DAIs that are part of the same dailink.
> 
> I am not trying to block the Qualcomm implementation, just would like to 
> make sure the assumptions are clear and that we are not using the same 
> API in completely different ways.

Am open for any suggestions on dealing with dai less setups like what we 
have on our board.

--srini
> 
> 
> 
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
