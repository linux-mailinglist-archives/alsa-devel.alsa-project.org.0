Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5075E379
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 14:08:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49D51168F;
	Wed,  3 Jul 2019 14:07:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49D51168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562155696;
	bh=CGllMbCAGsvs0+zYYgNThbC9xymjJJ7C0sqrVl61P2w=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=taIMp0Kl+QVvHD8sd8bEk2TOKm4VK+hrFavYjWwBb/hwOxRWl1uz8tuzOsHT9lRqn
	 +ReV+WWPNmx+tkFHjr44gMVE3q9cpMKIowRkzPlMbMDs9440a176FzsOfM9zBapKYA
	 WgT2O7AJ60v4x7CNhDwO7M0EV8ZZL67A/V/YCFnI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F111F800E9;
	Wed,  3 Jul 2019 14:06:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 979A6F800EA; Wed,  3 Jul 2019 14:06:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FE65F80058
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 14:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FE65F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vFN16FUn"
Received: by mail-wr1-x442.google.com with SMTP id p11so2491849wre.7
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 05:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hSMdJI3FhgIeyHE1mlFbnoJ36Q6QDvhy3QXwr2d70Kk=;
 b=vFN16FUn7+3YTQF7uYSM7pL29SVG0BkOKI4O/o5ckjt5F9XNCSHI4g92riDtdRKJ9t
 NqI7xYK5slB/a4jKAcheSONMCgPgjFh0kRRQpLpBglrOqQ5k+iY8ectIuXz0nmjNJrbx
 lzxq4QEIG33Itv86UeWZF1VoIYVRXzgaf62M1q/o7nM76/7rZ2O0vutn+L/pnuYRlOsC
 jIZxVDoheYjUtADmSlGQHb643PioO5u9FBZbioV0qa9bgvhM9AcFWuRZ9SGforU+K6jN
 yRDcTpWBI9PRxxCuap65jQhiwmpbXXcSEey8bhkBqboI+/vSH5soYm1WVerrxZF46fIH
 Gmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hSMdJI3FhgIeyHE1mlFbnoJ36Q6QDvhy3QXwr2d70Kk=;
 b=ONLzPHjytyGKcFOxJvuwsx8Eh9F8dTUmFdmqEEwTTL43dqK7B+BNx90NRHy3VJVJxT
 uML2ovknAZ7PJsrtxxDkK9apPebHyeIjY7dO1QvVFNb9isWOOjlLlFCo5UJ2pvJkEiZy
 g2jeAO6rtiT7XLXAKOmcCoTk4xQ6C2VvG6rAap3iYMj67DWAy8WxW0OxlqXRGb4sk1Xw
 hqipCdQfBFX629eNmhFOE9nUGM/P4baGxcS54bXHi9xV/MMhgWzWyB2DN6tJKbX6rtNr
 yEWYQj6cXbMGpWh6jZWVEmF3Q681AksdbT4qi2OMSMOckiGoygc91ZH1S7p7QbtTivHn
 CxrQ==
X-Gm-Message-State: APjAAAXxZwGLcc5ALVal8yw/b/3mLm+IhFg6ucL/IPHOo4eMExVnutRu
 ewGshDXZRXwEmLH/NoiD3FUsiw==
X-Google-Smtp-Source: APXvYqxQaScoeK39QlEwCNnQW0RQl2gAeoNKRVtsCmRFg7g6T/y5RlCTz7NUvUssSYOqoeOBDUy2eA==
X-Received: by 2002:adf:c613:: with SMTP id n19mr15717871wrg.109.1562155587366; 
 Wed, 03 Jul 2019 05:06:27 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id f10sm2495431wru.31.2019.07.03.05.06.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 05:06:26 -0700 (PDT)
To: Mark Brown <broonie@kernel.org>
References: <20190702080920.22623-1-srinivas.kandagatla@linaro.org>
 <20190702080920.22623-3-srinivas.kandagatla@linaro.org>
 <20190702144411.GP2793@sirena.org.uk>
 <2e2a32dd-3dca-5391-1bfa-ab1c1f420e3a@linaro.org>
 <20190702165753.GQ2793@sirena.org.uk>
 <0a9a994c-5a88-539f-3af0-76754b9b58d1@linaro.org>
 <20190703115243.GV2793@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8edd8bc6-4b32-7f7e-2521-d7038a4ffb8d@linaro.org>
Date: Wed, 3 Jul 2019 13:06:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190703115243.GV2793@sirena.org.uk>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, bgoswami@codeaurora.org, lgirdwood@gmail.com,
 vkoul@kernel.org, robh+dt@kernel.org, srini@kernel.org
Subject: Re: [alsa-devel] [PATCH 2/6] ASoC: wcd934x: add support to
	wcd9340/wcd9341 codec
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



On 03/07/2019 12:52, Mark Brown wrote:
> On Wed, Jul 03, 2019 at 09:49:37AM +0100, Srinivas Kandagatla wrote:
>> On 02/07/2019 17:57, Mark Brown wrote:
> 
>>> This is a driver for a single device, you should be able to
>>> instantiate things without requiring binding through DT (and
>>> hence support non-DT systems such as those using ACPI).
> 
>> My view point atleast from hw side was that Codec is Parent which is
>> encompassing these different blocks and bus interface. DT representation
>> clearly showed that relationship between the parent and child devices.
>> Binding it through DT will make sure that resources are ready before
>> they are instantiated.
> 
>> All the child devices also have some machine/board specific properties
>> and dependency on resources from parent like regmap, clks, and bus.
> 
>> In ACPI case, am not 100% sure how these will be represented inline with
>> hw representation.
> 
>> Are you suggesting to use MFD here?
> 
> I'm saying that you should be using a MFD here like all the other
> CODECs with multiple functions and that you shouldn't have
> compatible strings in DT for the subfunctions since you already
> know they'll be there simply from enumerating the chip as a whole
> and how exactly they are divided up is a function of how Linux
> currently has subsystems, not of the hardware.
> 
Got it!, thanks for the input, I will change that in v2.



--srin
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
