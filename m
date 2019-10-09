Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 653DAD09F7
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 10:34:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8107C1612;
	Wed,  9 Oct 2019 10:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8107C1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570610039;
	bh=A6rRle8tfuEvSmBMS7kL85itrURqXUTeBHFitASM5AY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n+Wza/nPtkFU7x6euEk4winntbWeNHrTaOOWZCfC9IXhkpJi8T8+7Rk5YXiUhbzGW
	 Xdkiph8foriMYOAq+R1fx+KdPhANlO7wEKU0w2nbMP/RISHa4aF0xdnKq1Kej1P++T
	 Qd90vORSiEX/nOngxl8l7hQHSGbh0+obXmIAcIAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1983F802BE;
	Wed,  9 Oct 2019 10:32:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7829F802FB; Wed,  9 Oct 2019 10:32:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B7FBF802BD
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 10:32:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B7FBF802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NhZ3NqWV"
Received: by mail-wm1-x343.google.com with SMTP id 3so1488777wmi.3
 for <alsa-devel@alsa-project.org>; Wed, 09 Oct 2019 01:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JxJNRe0Hszsg2U+Mp+z1v4R0II23QRMT5ghWEEi5RWE=;
 b=NhZ3NqWVqaig7QVQN06AhJ9BzVpRIStl4PO90WhabZkYR4TZahH1FZFVa8AuhAbYOQ
 mr+y43IuW+Gz2TUSN3DRidWkigXShaqiFNEe5CZ6+KRlHt3+1ZwCmVc3UF1NBIJ5RYgd
 QcYM/Mk3PAJmjItLNhySrm+th3lCHLvsMBYAZgw0JlFyEfKyatS7ULxI8HuZzirdcHgQ
 m1hYLIHicmZKXs26cm/Zj0ixcud7v4a9MU7G7cH7QMoulEEmtNoQaAbApLxrLKuy5xHV
 tb/8Skr5Hm4WCRtpABjq1M3h1U53H+OEJDU3ALp15Ck91Zqv7iiwohtLzjX1PVGLLSQc
 PoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JxJNRe0Hszsg2U+Mp+z1v4R0II23QRMT5ghWEEi5RWE=;
 b=NZ4na4TTjqvBRoOK8U3t3U2VCP6AEed/VU1CS5R+dQ8OtxraRx0k1kyolCja/ivMvT
 bt/kTYIwtjXU5MYTNDKw83Ev4fk7RMWB+8MTW4d2TpUYJCidM4I3CBjgGPZ4LUb/ENeO
 yj2U3wcWztveS8rFDujQFv6+pm6ZcjQj5X1OJiIocAoWp+8USl3Lc5pS2BhWm9VgryeV
 UqVX449iNU7FpmKZkRAG4rWxQR/kJnZG+YPVnzK3txkQWFrjHixXs9JYjhv4a0wolO+/
 Q/UIpC1D9ctP7lZRNKNtd0EF5T1fKPXf5/5BMzY6F7YHfhrU8amMQMQEv5Z499jSGbnc
 ELaA==
X-Gm-Message-State: APjAAAVqdWqQG8GfHYH7myIvg8lloz6oSs8VLKdrUkxojkt/F1DKAhHy
 tpOQJi/KyHl55NgcGS7rUecU3w==
X-Google-Smtp-Source: APXvYqywaXIHFEarJCg72s40634GXF/8q5QIy4svArSx2M3KgbShup6P+88T7XbSi5C97I9i5mw2Kw==
X-Received: by 2002:a7b:c74a:: with SMTP id w10mr1647617wmk.30.1570609973203; 
 Wed, 09 Oct 2019 01:32:53 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id x5sm1478910wrt.75.2019.10.09.01.32.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 01:32:52 -0700 (PDT)
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
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5e08f822-3507-6c69-5d83-4ce2a9f5c04f@linaro.org>
Date: Wed, 9 Oct 2019 09:32:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <99d35a9d-cbd8-f0da-4701-92ef650afe5a@linux.intel.com>
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

Hi Pierre,

On 14/08/2019 15:09, Pierre-Louis Bossart wrote:
> 
> 
> On 8/13/19 11:11 PM, Vinod Koul wrote:
>> On 13-08-19, 20:58, Mark Brown wrote:
>>> On Tue, Aug 13, 2019 at 02:38:53PM -0500, Pierre-Louis Bossart wrote:
>>>
>>>> Indeed. I don't have a full understanding of that part to be honest, 
>>>> nor why
>>>> we need something SoundWire-specific. We already abused the 
>>>> set_tdm_slot API
>>>> to store an HDaudio stream, now we have a rather confusing stream
>>>> information for SoundWire and I have about 3 other 'stream' contexts in
>>>> SOF... I am still doing basic cleanups but this has been on my radar 
>>>> for a
>>>> while.
>>>
>>> There is something to be said for not abusing the TDM slot API if it can
>>> make things clearer by using bus-idiomatic mechanisms, but it does mean
>>> everything needs to know about each individual bus :/ .
>>
>> Here ASoC doesn't need to know about sdw bus. As Srini explained, this
>> helps in the case for him to get the stream context and set the stream
>> context from the machine driver.
>>
>> Nothing else is expected to be done from this API. We already do a set
>> using snd_soc_dai_set_sdw_stream(). Here we add the 
>> snd_soc_dai_get_sdw_stream() to query
> 
> I didn't see a call to snd_soc_dai_set_sdw_stream() in Srini's code?


There is a snd_soc_dai_get_sdw_stream() to get stream context and we add 
slave streams(amplifier in this case) to that context using 
sdw_stream_add_slave() in machine driver[1].

Without this helper there is no way to link slave streams to stream 
context in non dai based setup like smart speaker amplifiers.

Currently this driver is blocked on this patch, If you think there are 
other ways to do this, am happy to try them out.

Thanks,
srini

[1] 
https://git.linaro.org/people/srinivas.kandagatla/linux.git/tree/sound/soc/qcom/db845c.c?h=release/db845c/qcomlt-5.2
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
