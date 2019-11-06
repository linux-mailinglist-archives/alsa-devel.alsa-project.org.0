Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC76F1D2C
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 19:11:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A182D1658;
	Wed,  6 Nov 2019 19:10:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A182D1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573063898;
	bh=O1ozRCRFTmK+0Gk+4JgpSDIkz84cxToQvN8AiFi61ho=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WZijhnqZIgYO5GGDgV/Kxzw5IrnzW698+yn9awtHlg/8qBO4OH4cdN8WqzUKpHuf3
	 RNUjPPUiqJ77Mr17cmkM7lnMB1CvSzotXbS21dG/A26/us7my3g59auB5bxgzVHT8g
	 vKpUgt8yFmgb/e1Ww+097lw4UUrmya/4HJ2I7hRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24477F803F4;
	Wed,  6 Nov 2019 19:09:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3C0FF803D0; Wed,  6 Nov 2019 19:09:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6E83F800F3
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 19:09:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6E83F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="deTo+90l"
Received: by mail-wm1-x343.google.com with SMTP id x4so4790242wmi.3
 for <alsa-devel@alsa-project.org>; Wed, 06 Nov 2019 10:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rgJXsUBNZa/F0SLsO+it3k7f9qVrt3VaEEsEU5U0WF4=;
 b=deTo+90lJ6be7HHxTg00sHjXhZ3BCSqrIZB22Zr4Ih0eXfNoJ6Gwt/RbEw5gQSjgIg
 qidpwKs5uRX2/lu5DRzqXig8ftmUi03AhVaEYUpWJ0jjW9auDFhXL1SkjGYGBmto2pb8
 veFrOCGDVpD9USl2jXCi2MXpsVt0aBgUqTgiEF6etTbJSDsHDbDcWFVFy6vonpSHsMI7
 L2D0mmBoCGDPshPuZzY4p7VQhtH6IXIpaaGTfk6LPUmiJgvxFMYwzdxm8qdcFIcjlA9c
 b7kkPdCm7cyF1fB5SXXtiruwEQBPAIdGxrexuet+sitv4fmBS9v4vcbQa8fKE9swANAS
 tp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rgJXsUBNZa/F0SLsO+it3k7f9qVrt3VaEEsEU5U0WF4=;
 b=msMUP9/GIii7K+1Shj/ccum1Lg4neI7EMn+h6NMvOfTVEkp7RpJCDA66g93VydwVlF
 vwzNmO1N79voj/vPUb4RBo1bxl3d+Wq9wmkFwrXKnky50Q2m4RkIcoFjJQ0UD3oOHJrJ
 ndlegA57+YMg4J2WH42kZWHzhb4Dv5nfHPCTXidrbuKjXH0i/r+JDz8L/Qy7qi5e0I+p
 L+k0AuigyxSPcmaihjOP1AV1htgtXpsgKLuK4bhm7zOsUKt4RdLVbgqGN2zrj8RG1xoU
 C4SrnMWJ6k7OGvPbu10FDIOX0unkShmu8ueNA8DhSeNKv78BpS40px6pS1vv1TIB5Vw+
 91Lg==
X-Gm-Message-State: APjAAAWgDVxuqvbjB4bPLtxai7wJgWhFEaPbOVgnLrVVbp/YyMBKB97F
 l/TIKcwbstJBhuPYXWs6b6YQAA==
X-Google-Smtp-Source: APXvYqwuEOoV5aCzLlGkVZlVwso0Ano0flwVy5rE6QbRo8vNmNb2jFk7drTtQSJedQIw1NCPZ+6geA==
X-Received: by 2002:a1c:6a0d:: with SMTP id f13mr3948924wmc.164.1573063784694; 
 Wed, 06 Nov 2019 10:09:44 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id r19sm29208269wrr.47.2019.11.06.10.09.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Nov 2019 10:09:43 -0800 (PST)
To: Rob Herring <robh@kernel.org>
References: <20191018001849.27205-1-srinivas.kandagatla@linaro.org>
 <20191018001849.27205-2-srinivas.kandagatla@linaro.org>
 <20191025204338.GA25892@bogus>
 <90b2d83b-f2b2-3a5d-4deb-589f4b48b208@linaro.org>
 <371955d9-ad2d-5ddc-31b4-710729feae42@linaro.org>
 <CAL_JsqJmRReW2n0R_Sh4f7AFGYA+ZLxuFDokLTSBKoFTg6uRSg@mail.gmail.com>
 <7811be04-dfda-5953-110c-bca685fdcaa4@linaro.org>
 <CAL_JsqJNcXe7YSUjHWyFO_czncnR3y7w3NP8ofXfCiXpMrqzRw@mail.gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b3d078a1-f87d-c146-bdf7-7a6b30547bd5@linaro.org>
Date: Wed, 6 Nov 2019 18:09:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJNcXe7YSUjHWyFO_czncnR3y7w3NP8ofXfCiXpMrqzRw@mail.gmail.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>, Vinod Koul <vinod.koul@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 01/11] ASoC: dt-bindings: add dt
 bindings for WCD9340/WCD9341 audio codec
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



On 05/11/2019 19:08, Rob Herring wrote:
> On Wed, Oct 30, 2019 at 4:55 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>>
>>
>> On 29/10/2019 20:47, Rob Herring wrote:
>>> On Mon, Oct 28, 2019 at 7:45 AM Srinivas Kandagatla
>>> <srinivas.kandagatla@linaro.org> wrote:
>>>>
>>>>
>>>>
>>>> On 28/10/2019 12:40, Srinivas Kandagatla wrote:
>>>>> Its Phandle.
>>>>>
>>>>> something like this is okay?
>>>>>
>>>>> slim-ifc-dev:
>>>>>      $ref: '/schemas/types.yaml#/definitions/phandle-array'
>>>>
>>>> Sorry this should not be an array, so something like this:
>>>>
>>>>      slim-ifc-dev:
>>>>        description: SLIMBus Interface device phandle
>>>
>>> You're just spelling out the abbreviated name. I can do that much.
>>> What is 'SLIMBus Interface device'?
>>
>> Each SLIMBus Component contains one Interface Device. Which is
>> responsible for Monitoring and reporting the status of component, Data
>> line to Data pin connection setup for SLIMBus streaming. Interface
>> device is enumerated just like any other slim device.
> 
> So a standard set of registers every slimbus device has? In hindsight,
> I would have made reg have 2 entries with both addresses. I guess that
> ship has sailed.

That will break SLIMBus bindings, Which is expecting one device per 
device node.

> 
> It seems strange you would need both "devices" described as separate
> nodes in DT.

Because they are two different devices on the SLIMBus Component.

> 
>>
>> We already have exactly same bindings for WCD9335 in upstream at:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/sound/qcom,wcd9335.txt?h=v5.4-rc5#n42
>>
>>>
>>> Is it a standard SLIMBus property? If so, document it in the right
>>> place. If not, then needs a vendor prefix.
>>
>> "SLIMBus Interface Device" itself is documented in SLIMBus Specification.
>>
>> If I remember it correctly You suggested me to move to "slim-ifc-dev"
>> as this is part of SLIMBus Specification.
> 
> Probably so. If it is common, then document it in bindings/slimbus/bus.txt.
>
As we are dealing with audio codecs here, it might be that 
"slim-ifc-dev" is common across wcd9335 and wcd934x but not all devices 
on the SLIMBus Component would need handle to interface device. SLIMbus 
can also be used for control buses as well which might not need this.


> Then here, 'slim-ifc-dev: true' is sufficient. You can just assume we
> convert bus.txt to schema (or feel free to do that :) ).

We need phandle to the interface device so that we can program the 
streaming parameters for the SLIMBus Component.


--srini


> 
> Rob
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
