Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C30416A1B04
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 12:01:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9931206;
	Fri, 24 Feb 2023 12:01:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9931206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677236517;
	bh=b6UnrXdbOvsw26llr97RvVw5yMo749QdfA10asCWUx8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=I3TQ4Kwfr8H20PUVWIEp23++NuTuSyEcwbyGHPWHvzGc/3DSGOYHetflDKcKIDZPR
	 ZxVb+UJuDPz+Jq/Qd7NRNe2Ik4e/6J/Be8+DKlYx9i2KztXrGcKie+UoavADP1b9kQ
	 ZXolUFO2lyXviNwTOfMO1Qyyxm5G74x/7oLCbU7Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86C93F80116;
	Fri, 24 Feb 2023 12:01:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68595F80125; Fri, 24 Feb 2023 12:01:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7F7FF800DF
	for <alsa-devel@alsa-project.org>; Fri, 24 Feb 2023 12:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7F7FF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IF92FQ4Y
Received: by mail-wm1-x32b.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so1478441wmi.3
        for <alsa-devel@alsa-project.org>;
 Fri, 24 Feb 2023 03:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YQXdthJWktVg+AfZN3EoP9jJpFIjhltnajA7ETUKP00=;
        b=IF92FQ4Yrs/99XAN+aqzcbXp4q8ualq5rHhtoMYPBPlGl+yLUC1qMVQp1MDew/kI5W
         dyucBtwA4rU7jqF9GMi8YqoVxBlp5+mmjE1fNgQ1XqogirLvoMlzMA1u8vJWL2mlm9O5
         dvtqdu8v6Qbjnsczl1sAnAfmy7qNcMAo+Yk8Oy41pceC5k6mDReHfciIhqWCR1CYKQwx
         haS1KGir4qcCazCkrw5yF1C/MAiEbn1FFaReSc1D1kehH7TB0/aCrwkK5nqZ87xNirsz
         sNYC5iAFoqnZU8koEuYwjKku4tgWtVgQBBQiVYXZjWvRgRu84yvqpy9i/ME2jxgbz0FJ
         AdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YQXdthJWktVg+AfZN3EoP9jJpFIjhltnajA7ETUKP00=;
        b=v5/Kr67oa+XmgOGVHnBGxOJl6Opc4enBZVXmFeaL9bgCl1xIWov/dR+eTCq2UJZpVq
         Ffpjy8o/3QrIomx5GKwsmyVSHCnLbP5hyBZtz39p/aecxZkjEjWLiogSNxNIVzOBkjoV
         Q9OzYDygbZrviT4vTsHeKVb4PJYMU1KU/D7mnJ8rJEOITjOOg6V6ZUqcSnGhZGF4qwsN
         /MOUSwj04Ceam2rtclFgVLFJV4rxLydY8HOaV+PpUvBQYLGZ7j3ZVB6v+//OAqlybwO3
         G344lmMvpWI55x6C6usMQIYfTcI4Wb1OEbHigfS07wv2e/Mzpys2wHm8XZGMelcYvIlA
         KaqA==
X-Gm-Message-State: AO0yUKX3XFhOC0RJ6OOFCtw0Xd1wpG5Ns+6hLRvqItiRdn2Ew/nQwVxk
	J7bOaFzSCK/M+D/INb1SSeczpA==
X-Google-Smtp-Source: 
 AK7set9dHj9kLkZPaISJBsJ10O8wJ3m2rq4+MiUJiAJbe2kWTXSiXT1NDaqULWv9AGtBmE4CHqkD5Q==
X-Received: by 2002:a05:600c:3b1e:b0:3ea:e5fc:a5a4 with SMTP id
 m30-20020a05600c3b1e00b003eae5fca5a4mr2599117wms.1.1677236457750;
        Fri, 24 Feb 2023 03:00:57 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 fm19-20020a05600c0c1300b003e22508a343sm2535437wmb.12.2023.02.24.03.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 03:00:57 -0800 (PST)
Message-ID: <c4ee1a7b-a500-5fa5-6a97-93b1eba2c852@linaro.org>
Date: Fri, 24 Feb 2023 12:00:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: wlf,wm8524: Add a property to
 specify power up sequency time
Content-Language: en-US
To: Chancel Liu <chancel.liu@nxp.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20230222113945.3390672-1-chancel.liu@nxp.com>
 <20230222113945.3390672-2-chancel.liu@nxp.com>
 <506f92cd-7cf5-4fd5-a930-9af086732f84@linaro.org>
 <VI1PR04MB42221B1708BA02B1FA2149D9E3A89@VI1PR04MB4222.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: 
 <VI1PR04MB42221B1708BA02B1FA2149D9E3A89@VI1PR04MB4222.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FXW7DSUVQKHBYWV3MWPQGBKPZSYO6OSO
X-Message-ID-Hash: FXW7DSUVQKHBYWV3MWPQGBKPZSYO6OSO
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FXW7DSUVQKHBYWV3MWPQGBKPZSYO6OSO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24/02/2023 11:54, Chancel Liu wrote:
>> On 22/02/2023 12:39, Chancel Liu wrote:
>>> This property specifies power up to audio out time. It's necessary
>>> beacause this device has to wait some time before ready to output audio
>>
>> typo... run spellcheck, also on the subject
>>
>>> after MCLK, BCLK and MUTE=1 are enabled. For more details about the
>>> timing constraints, please refer to WTN0302 on
>>>
>>>
>>> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>>> ---
>>>  .../devicetree/bindings/sound/wlf,wm8524.yaml          | 10
>> ++++++++++
>>>  1 file changed, 10 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8524.yaml
>> b/Documentation/devicetree/bindings/sound/wlf,wm8524.yaml
>>> index 09c54cc7de95..54b4da5470e4 100644
>>> --- a/Documentation/devicetree/bindings/sound/wlf,wm8524.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/wlf,wm8524.yaml
>>> @@ -21,6 +21,15 @@ properties:
>>>      description:
>>>        a GPIO spec for the MUTE pin.
>>>
>>> +  wlf,power-up-delay-ms:
>>> +    maximum: 1500
>>
>> maximum is 1003. Where do you see 1500?
>>
>> minimum: 82
>>
> 
> Yes, you are absolutely right. From the power up to audio out timing table in
> WTN0302, the minimum number is 82 and the maximum is 1003.
> 
> Consider the following possibilities:
> 1. These timings may depend on the system design
> 2. These timings may be simulated results
> 3. These timings may be the minimum values
> 
> I set a larger value trying to extend the time. The larger value of course
> introduces unwanted time delay but it benefits on avoiding beginning audio
> lost.
> 
> I also did some tests on a board. If I want to work on 48KHZ sample rate and
> 512FS, the recommended value is 143. But the test result showed 143ms is not
> enough. I increased the value to 500ms and could hear the beginning sound.

Maybe you miss proper regulator ramp-up?

> 
> Maybe it's a better choice to let DT set the suitable value? Is there a similar
> situation before?

That's not really good argument. DT should describe hardware and if this
property does not match hardware, it means you mix this with something
else. Something not for DT.


Best regards,
Krzysztof

