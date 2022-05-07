Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C029251E4EE
	for <lists+alsa-devel@lfdr.de>; Sat,  7 May 2022 08:54:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43E841861;
	Sat,  7 May 2022 08:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43E841861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651906441;
	bh=8Qqhk5UUaeuvAUHe1JSOwJiwpzAfqoBd7dmNHLjq8A8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gAJge4LeXNoohysBgwVvBAmW/bbJzlivrEd9pkQSEr0irFcxTEITX5wzxI3KuyaLb
	 pUso0tpAraByJFxR5g5v5109gdjaRP1VRZwT5P6N/AmV4Fq8VaIWmdnNm9/L2AcUcU
	 /BsR7xO/uz141Lzzp/xuI5svnlOCs5wj1E5T73Ts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95712F80253;
	Sat,  7 May 2022 08:53:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84B94F800D3; Sat,  7 May 2022 08:52:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2C92F800D3
 for <alsa-devel@alsa-project.org>; Sat,  7 May 2022 08:52:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2C92F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Cw3NFUj1"
Received: by mail-wm1-x336.google.com with SMTP id 129so5705561wmz.0
 for <alsa-devel@alsa-project.org>; Fri, 06 May 2022 23:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5ugJecicSvHEwm+RVDtMYhlgxoNcr0z5OqAxwLTJcpY=;
 b=Cw3NFUj1PG3LMT+NOYspXs2/n3Dq0oIFxCS3zCqAHi1RVtd22ciu1k24gVy0/qIFee
 Ri3B4BMCMpOjwb2sMhxh3wrXk70Ck3l9L9yugdFzbgwgWhbTVVsBlnTw2MrhLasaq2ZQ
 TApYlP5cAVCFB2CQ/o1f9aVq1H3eymge9OfFgUa2LAErLvYhKeIBBCrX8Ei0fbtBvhEi
 3+goqWpYP190Jtc7Wqzu5e+lNFEJSQFwfyTA8A3E1g570dRENcE20hZBfs4b2/pLxJMF
 91/4bLWOwhokeIClldzXKvB5raMgy7RjdK8AfxD8cat/4zEqbDCNlwKyg6kE0dJbU5Nu
 k+kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5ugJecicSvHEwm+RVDtMYhlgxoNcr0z5OqAxwLTJcpY=;
 b=GdDxZD6e02EHoQHKLAFFdPPDTbSosAhYe5sogG9vdOkVpMDHerPJmR0UA/95ZjlKSj
 b1rJd1CzAC1BqYcvSjjstl2u1GIuEOeqnUMGCASUFPmsaSdIIdczYFdzhLM72oKa58FX
 pZUomLa69uBMEC/4saWFDahzsx+Lg0yaqrfxot8AO6nvK5ZeJgdOLsFhJjo9UYPBIls4
 XFNuqHDK5J5rNvdPdp1AAcWkGc2oShyNZzvIR2Iz+7MzJDDSwvqIrZEFHvqzGh4UUiuv
 +3EzPGvSGa6CYSHwkgSP7EYtJWFpTZlsO0av1QSGETHpgBQjB3hkDs+Pwc4tOHnCubBM
 3dmg==
X-Gm-Message-State: AOAM533l7xPptPsXmoNCnZkYg8H+Mswtf+AmK9OoJpDrWtVQptbh2GVJ
 9BcVGYkYj7BnVpvIub6S1A/CxQ==
X-Google-Smtp-Source: ABdhPJzr0j/crsH61UsDFzT+Kh89tbOFBhhvp98wBAzg8Je4H7OusP4OvkkLXYHNs2AVkd5EyVM3xQ==
X-Received: by 2002:a05:600c:21d9:b0:394:2398:3bff with SMTP id
 x25-20020a05600c21d900b0039423983bffmr6872480wmj.101.1651906368905; 
 Fri, 06 May 2022 23:52:48 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 q1-20020adff501000000b0020c5253d8cdsm5186462wro.25.2022.05.06.23.52.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 May 2022 23:52:48 -0700 (PDT)
Message-ID: <8643d266-7108-2440-43e1-c51b829ba481@linaro.org>
Date: Sat, 7 May 2022 07:52:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] soundwire: qcom: adjust autoenumeration timeout
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20220506084705.18525-1-srinivas.kandagatla@linaro.org>
 <725af523-d144-e373-e09b-fb48b3afb9ed@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <725af523-d144-e373-e09b-fb48b3afb9ed@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com, Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Thanks Pierre,

On 06/05/2022 15:13, Pierre-Louis Bossart wrote:
> 
> 
> On 5/6/22 03:47, Srinivas Kandagatla wrote:
>> Currently timeout for autoenumeration during probe and bus reset is set to
>> 2 secs which is really a big value. This can have an adverse effect on
>> boot time if the slave device is not ready/reset.
>> This was the case with wcd938x which was not reset yet but we spent 2
>> secs waiting in the soundwire controller probe. Reduce this time to
>> 1/10 of Hz which should be good enough time to finish autoenumeration
>> if any slaves are available on the bus.
> 
> Humm, now that I think of it I am not sure what reducing the timeout does.
> 
> It's clear that autoenumeration should be very fast, but if there is
> nothing to enumerate what would happen then? It seems that reducing the
> timeout value only forces an inconsistent configuration to be exposed
> earlier, but that would not result in a functional change where the
> missing device would magically appear, would it? Is this change mainly
> to make the tests fail faster? If the 'slave device is not ready/reset',
> is there a recovery mechanism to recheck later?
> 
> Would you mind clarifying what happens after the timeout, and why the
> timeout would happen in the first place?

This issue is mostly present/seen with WCD938x codec due to its Linux 
device model.
WCD938x Codec has 3 Linux component drivers
1. TX Component (A soundwire device connected to TX Soundwire Master)
2. RX Component (A soundwire device connected to RX Soundwire Master)
3. Master Component (Linux component framework master for (1) and  (2) 
and registers ASoC codec)

Also we have only one reset for (1) and (2).

reset line is handled by (3)
There are two possibilities when the WCD938x reset can happen,

1. If reset happens earlier than probing (1) and (2) which is best case.


2. if reset happens after (1) and (2) are probed then SoundWire TX and 
RX master will have spend 2 + 2 secs waiting, Which is a long time out
Hence the patch.

TBH, the 2 sec timeout value was just a random number which I added at 
the start, we had to come up with some sensible value over the time 
anyway for that.

You could say why do we need wait itself in the first place.

The reason we need wait in first place is because, there is a danger of 
codec accessing registers even before enumeration is finished. Because 
most of the ASoC codec registration happens as part of codec/component 
driver probe function rather than status callback.

I hope this answers your questions.

thanks,
--srini



> 
> Thanks!
> 
>>
>> Reported-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>
>> Changes since v1:
>> 	replaced HZ/10 with 100 as suggested by Pierre
>>
>>   drivers/soundwire/qcom.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 7367aa88b8ac..d6111f69d320 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -105,7 +105,7 @@
>>   
>>   #define SWRM_SPECIAL_CMD_ID	0xF
>>   #define MAX_FREQ_NUM		1
>> -#define TIMEOUT_MS		(2 * HZ)
>> +#define TIMEOUT_MS		100
>>   #define QCOM_SWRM_MAX_RD_LEN	0x1
>>   #define QCOM_SDW_MAX_PORTS	14
>>   #define DEFAULT_CLK_FREQ	9600000
