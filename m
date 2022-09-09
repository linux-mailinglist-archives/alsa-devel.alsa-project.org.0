Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 905A55B318F
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 10:22:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EDAD1691;
	Fri,  9 Sep 2022 10:21:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EDAD1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662711758;
	bh=3/5lh040XL2XYyO3gW/gEVC7DKdH4gdtknM6KMMrM0A=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JnC8vzNdr+sMXGceuGbFNhKKOgdKleYlYWfBrHjDYoJdmWwvB3rAotSpxtYktdFIW
	 koXIF7XaPa3fyw0wVKk/h7RJns+q7E0J5VQDhZP0+Zof/rDx6VTZyyFGLTpulzQCJx
	 RY2GWDdSIKY0X1AmzjE9N8NGHACwTjPPVz2mD+Bk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EDDEF8032B;
	Fri,  9 Sep 2022 10:21:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12C23F8016C; Fri,  9 Sep 2022 10:21:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F600F8016C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 10:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F600F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="h1FG2nMj"
Received: by mail-lj1-x234.google.com with SMTP id z23so961350ljk.1
 for <alsa-devel@alsa-project.org>; Fri, 09 Sep 2022 01:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=VIOofoEHYZmULXPTWVPGHc4pkhqvtC/tMOM+JD3igag=;
 b=h1FG2nMj6e9S5512GyMcPIKesaliGmRKaXgVBLNQER9TuQ+CU9BcsTY9CmMNBvMeHV
 gaVtUE2506qGQMtNji9+xRUrEnEGauYBHnEyCOZQf2G8qTiep/DuDPa/aygCCENsGdIZ
 7sPOOSAcUCavibVyqsqUVmfK/FnymyJOl6UyjUyMbpvyQxsXi1vL3OlPdAV1KOZere7D
 QG5khTFtrf0++WHA8O7/M/PZDs9pyh7rnT7CVFAGRnD2uIo5AgR2JOgRzbgTibYEjKVM
 mJdYUJ9ArSVt4ALUHuqoVNKu6jnELbzbu/FvzcOIrA0EdejdhvNKYd8OXp+aLpcW8y50
 QISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=VIOofoEHYZmULXPTWVPGHc4pkhqvtC/tMOM+JD3igag=;
 b=5B8ok57TfdEmPaKm//02YlDT5+BgEhpXOG3XCFVHzcEMhHZzBwoMYbY0TDUnoxkN5g
 e3zl3N3Tck3J212e/N2K27bAS4H/JxZK50/89BhFWqddE/DYbQW/BdBLXYZOmOEJcptu
 JDIGQPUC/wPZ1kmnLKvaBYTib1KnFdO2ZHrmw2fXqLipSYWVqVKBbjcTCbV8hkpPwOB3
 Z1V0Ic9GWcJjatA+zo9BXTj6frKLudByz5Mc/+oLfXorhl5AWwrPOHc877a/C51tOHLi
 7fNSPA5VCVXWh+tFzMC844ff8WaeoSVwsQk3PTnYqrfmo8anQF2bvbXi7eAln7yAv4jr
 DYiA==
X-Gm-Message-State: ACgBeo3MAmEPRpZKX4g/vSwXi8aCQwcCvezHX3qXv2sKSeaMsZkYP1vw
 FGE0rOxuFughSmhzO/FOc0IoqQ==
X-Google-Smtp-Source: AA6agR7Jar9ldUV3gwhxvjF2xUIm+NzQJ3cd0ihIdQCNH34VPmDvaDFUKs5QG+gPdVUMh8Y8lJLxCg==
X-Received: by 2002:a2e:944a:0:b0:24f:10bd:b7e8 with SMTP id
 o10-20020a2e944a000000b0024f10bdb7e8mr3866304ljh.238.1662711692268; 
 Fri, 09 Sep 2022 01:21:32 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 p13-20020a2eb98d000000b0026ac2fffda4sm180761ljp.105.2022.09.09.01.21.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 01:21:31 -0700 (PDT)
Message-ID: <9a72bd22-9298-65ce-a894-540f98745a7e@linaro.org>
Date: Fri, 9 Sep 2022 10:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: sound: ts3a227e: add control of debounce
 times
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>
References: <20220907135827.16209-1-astrid.rost@axis.com>
 <2b81d814-f47a-e548-83dc-b1e38857e8ce@linaro.org>
 <Yxn9o1MVMPnFO3PM@sirena.org.uk>
 <ac2bcca1-6997-2d17-b1d6-a5e81ced2613@linaro.org>
In-Reply-To: <ac2bcca1-6997-2d17-b1d6-a5e81ced2613@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org,
 alsa-devel-mejlinglistan <alsa-devel@alsa-project.org>,
 Astrid Rost <astrid.rost@axis.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 kernel@axis.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On 09/09/2022 09:23, Krzysztof Kozlowski wrote:
> On 08/09/2022 16:35, Mark Brown wrote:
>> On Thu, Sep 08, 2022 at 02:20:42PM +0200, Krzysztof Kozlowski wrote:
>>
>>> Anyway new properties cannot be accepted. This has to be converted to DT
>>> schema (YAML).
>>
>> Doing a whole binding conversion feels like a bit of a steep requirement
>> when people are just adding a simple property, it's a lot of stop energy
>> to figure out the tooling, do the conversion and deal with all the
>> bikeshedding that the tools don't catch.  It's definitely nice if people
>> want to look at that, for more complex binding changes it gets more
>> reasonable but for trivial properties it's disproportionate.
> 
> It's more than one property here and many patch submitters are using
> this reason as well. In an effect few bindings TXT grew from 5 to 10
> properties in one year and still no conversion to YAML.
> 
> I understand your concerns however I have stronger motivation to do the
> conversion is stronger for me, than for accepting new features.

Eh, that was still during drinking coffee, so it barely reminds English
sentences. Let me try one more time:

It's more than one property and many other patch submitters were using
this reason as well. As a result, few TXT bindings grew from 5 to 10
properties within one year and there was still no conversion to YAML.

I understand your concerns however I have stronger motivation to do the
conversion, than for accepting new features.

Best regards,
Krzysztof
