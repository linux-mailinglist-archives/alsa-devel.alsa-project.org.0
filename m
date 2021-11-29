Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36283461C8C
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 18:14:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB0671F60;
	Mon, 29 Nov 2021 18:13:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB0671F60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638206082;
	bh=3PODgzHlHR6A2ipOwMK96sHBlMdnhrqLMOqL+i44sT4=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZCrm5ABqOE7J1jcMjv5W/gOT0KaVD7RVxwC638uHYucLzEuoplYmW03Ho6uzFPKfq
	 thwxD7sA7Ro9PYYOv5ptPzz5qybPvtMtbf8RTeMM17hyLpmXKz1rp4XioDt658/Ya1
	 svt9OTqB4e7gq8/ZstydAVcT5XdXAArjTb0WwY+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CAF46F80246;
	Mon, 29 Nov 2021 18:13:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A2F7F80240; Mon, 29 Nov 2021 18:13:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6774FF80084
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 18:13:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6774FF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lf2lo7e6"
Received: by mail-lf1-x12f.google.com with SMTP id f18so46541070lfv.6
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 09:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=VTatKi9nLjKf/ouxwhMrze6+WUP0SdgQqfY3/ZOFly0=;
 b=lf2lo7e6Oo6F1oAeqlYLJBN4TBBFyrGcFYIfSly83M+PSNlk7YCljNt6JsKHAzM5x1
 lOjNwPIIy88h0CXdbmCG8jsf8eLRifr4poWmtoNQcJlf4K6udZpen4ELhBp9bxIoHuVQ
 8HquW3qTwIyckbUxFVek0PzeNxD5M/gKgoR23W3WG+0bHVWHKullaQZC6j72AwDnj65W
 SkAuFB49AbNjre9/ZN3HXVsqwvxqV80txNQG44tjQPwtxWMFsnNaHhpGZXX18NUbjp3F
 XObIWnIygWyRSl6OnNGt2eqrAj9yCS/Vyk1knJ5xJAArofjhg8MU5Af+Cxczb6q4PvaG
 kjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=VTatKi9nLjKf/ouxwhMrze6+WUP0SdgQqfY3/ZOFly0=;
 b=qtVHCfhwE0Wymq6kMNE3UiAuLyhzGahM90oPFMsy53C6RADguq1qjRhpt0HVV9gCgM
 7ZrpJyeDHzw9XqeNSA59b4Aa2roCeLXgphnFx9luqpHnyCUi0xnadqMLXNpcYHqp+jEt
 5NtOyDUJo24Rett/xo2USHfcw9au9NOi6cJjMrFnV5mb6s9zgGkzIWwRRL2zAqCQlcp4
 shBLnXykLZ0LcJ7llaegcZX/AGK48T9AK9WoAiXwz1z7NW6WSmbghSBhynU62OBx2Zln
 z2gzA2V/ryoKJvNmHRlh78ErnUaqQXokFJ4phXigZKWLXU9nAGAZmjw4vuXtUaZV/kbH
 MFHQ==
X-Gm-Message-State: AOAM530JpoUx3NGVRd7shjCMolbcpbuIlEKdlGLKEOjDj+Oho8bhs0q7
 UwT3cQraqv3Xop8oplU0Le8=
X-Google-Smtp-Source: ABdhPJza825v6DwnUXQa0o2zoVz4Mcoj+1EcfWGapApxnoNOdyBNHJsWR1/ZuaHOmTRwEnOwV0uODw==
X-Received: by 2002:a05:6512:ace:: with SMTP id
 n14mr20426920lfu.53.1638206021365; 
 Mon, 29 Nov 2021 09:13:41 -0800 (PST)
Received: from [10.0.0.115] (91-153-170-164.elisa-laajakaista.fi.
 [91.153.170.164])
 by smtp.gmail.com with ESMTPSA id b13sm1406433lfc.79.2021.11.29.09.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 09:13:40 -0800 (PST)
Message-ID: <4cb46c35-0279-bef2-46dd-d9fb6901688c@gmail.com>
Date: Mon, 29 Nov 2021 19:14:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Jayesh Choudhary <j-choudhary@ti.com>, Tony Lindgren <tony@atomide.com>
References: <20211126050228.6257-1-j-choudhary@ti.com>
 <64426bc9-1160-97c6-4714-4201b8f7a81c@gmail.com>
 <a7bc460f-abf4-1d64-6416-5b50dc15d184@ti.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
In-Reply-To: <a7bc460f-abf4-1d64-6416-5b50dc15d184@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, "Yadav,
 Pratyush" <p.yadav@ti.com>
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



On 29/11/2021 13:21, Jayesh Choudhary wrote:
> 
> 
> On 29/11/21 12:23 pm, Péter Ujfalusi wrote:
>>
>>
>> On 26/11/2021 07:02, Jayesh Choudhary wrote:
>>> Convert the bindings for McASP controllers for TI SOCs
>>> from txt to YAML schema.
>>
>> Can you CC the sound/soc/ti/ maintainer next time, I have found this
>> patch in my Spam folder...
> 
> Okay. Also, I will add this file in the MAINTAINERS file under the
> heading 'TEXAS INSTRUMENTS ASoC DRIVERS'

OK, thank you. I'm sure I have missed some other binding document...

>>> Adds additional properties 'clocks', 'clock-names', 'power-domains',
>>> '#sound-dai-cells',
>>
>>> 'num-serializer'
>>
>> Which use was removed by 1427e660b49e87cd842dba94158b0fc73030c17e
> 
> The dts file of arm SOCs is not updated and was generating an error in
> dtbs_check. I will remove this property.

Yes, that dts file was added 2 years after the num-serializer got removed...

> 
>>
>>> and 'port'
>>
>> And what this "port" is?
> 
> The mcasp node in the file 'arch/arm/boot/dts/am335x-sl50.dts' has this
> as child node.

Right, it is there if McASP is used via the graph card.

>>> +
>>> +  tdm-slots:
>>
>> description?
> 
> I will add description.
> 
>>
>>> +    maxItems: 1
>>> +
>>> +  serial-dir:
>>> +    description:
>>> +      A list of serializer configuration
>>> +      Entry is indication for serializer pin direction
>>> +      0 - Inactive, 1 - TX, 2 - RX
>>
>> You should mention that _all_ AXR pins should be present in the array,
>> even if they are no in use.
>>
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    minItems: 1
>>> +    maxItems: 16
>>
>> a McASP could have up to 25 AXR pins...
>>
> 
> Will update the description and the maximum.
> 
>>> +    items:
>>> +      minimum: 0
>>> +      maximum: 2
>>> +      default: 0
>>> +
> 
> 
>>> +
>>> +  tx-num-evt:
>>
>> description?
>>
>>> +    maxItems: 1
>>> +
>>> +  rx-num-evt:
>>
>> description?
>>
>>> +    maxItems: 1
>>> +
>>> +  dismod:
>>
>> description?
>>
> 
> For the above three properties, is the description in the txt file
> sufficient?

I would add a bit more detail than just 'FIFO levels'

>>> +
>>> +  sram-size-playback:
>>> +    maxItems: 1
>>
>> should be dropped, not used
>>
>>> +
>>> +  sram-size-capture:
>>> +    maxItems: 1
>>
>> not used, please drop
>>
> 
> Okay.

Thanks

> 
>>> +
>>> +  interrupts:
>>> +    minItems: 1
>>> +    items:
>>> +      - description: TX FIFO interrupt
>>> +      - description: RX FIFO interrupt
>>
>> The 'common' does not deserve a description?
>>
> 
> Will add this.

Great

> 
> 
>>> +  gpio-controller: true
>>> +
>>> +  "#gpio-cells":
>>> +    const: 2
>>> +
>>> +  function-gpios:
>>> +    maxItems: 1
>>
>> This is not McASP property, it was an example on how to use a pin as
>> GPIO from the outside...
>>
> 
> Okay. will remove function-gpios.
> 
>>> +
>>> +  clocks:
>>> +    minItems: 1
>>> +    maxItems: 3
>>> +
>>> +  clock-names:
>>> +    minItems: 1
>>> +    items:
>>> +      - const: fck
>>> +      - const: ahclkx
>>> +      - const: ahclkr
>>
>> I can not find any use in the code for ahclkx/r?
>>
> 
> Some arm SOCs had additional clocks in the DT nodes.

It looks like dra7 family have it. On those the AHCLK x/r have other
source option than from outside (ATL for example).
I'm not certain if they are absolutely needed, but there were something
about the optional clocks...

Tony, can you recall?

>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - reg-names
>>> +  - dmas
>>> +  - dma-names
>>> +  - interrupts
>>> +  - interrupt-names
>>> +  - serial-dir
>>> +  - op-mode
>>> +  - tdm-slots
>>
>> The last three is not needed if the McASP is used only as GPIO.
>> The dmas and interrupts should not be needed in this case, but I think
>> it is not taken care of atm.
>>
>> The tdm-slots is ignored for DIT mode
>>
> 
> These were mentioned in txt file as required.
> In light of this new knowledge, I will remove 'serial-dir', 'op-mode'
> and 'tdm-slots'.

Yes, I know.
The trick is that serial-dir  op-mode and tdm-slots only needed when
audio is used and tdm-slots is only needed in I2S mode.
I would check the dmas and interrupts, but from the hardware pow they
are not needed in GPIO only mode.

-- 
Péter
