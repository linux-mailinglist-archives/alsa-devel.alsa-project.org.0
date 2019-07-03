Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C595E037
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 10:51:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35D5F1693;
	Wed,  3 Jul 2019 10:50:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35D5F1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562143889;
	bh=HGrcV5XaQYKT2R89uKkGjbZVeEj7tz/C4AZqIwFfkV8=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sNAOkobJSS/ONC7aOJQcBaWttVCnw2bUX92wpESRN4J46+vDYIV34vEVnENMvn6S1
	 7V2VXmjaYR0upldiM5dfjupWdQEmOmlBmWOdF1gC30B24kHoZYVJhCEyqcSipU44oP
	 Gmy1IMMuh4ccjb89xxrnlXiz3Ro5Q0QXGK8pL3zk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C82AF800F2;
	Wed,  3 Jul 2019 10:49:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68800F800EA; Wed,  3 Jul 2019 10:49:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B44DF800C5
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 10:49:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B44DF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lmXhyQGj"
Received: by mail-wr1-x441.google.com with SMTP id n4so1751093wrw.13
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 01:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=e9alP0im1I2wRKr908QIHV5xP+2l4mLutFvUHyMFYAk=;
 b=lmXhyQGjSdgGAdxzkKM0ong9AUeIi6a45ScAHd28c2nVnEseEKKJamYXyiTHRiP/EF
 R8Oy0VWBdFV0zlttFbYbDa3bAj6RPaOob4rjKEV5d0hAgGoNm086NIE5fX+LB//H+L6z
 YiPIGu/GwN6msUNgb6qWCu7K+Roc0xqQHyfDE15WUaF2n9RxGZ9l5MpQmAplNfwgI5Jo
 RC9k1/XXWdDIcuzOwUaOfVo3SoJlQHL1p1QGEwI20aug3gA3itCKamJ+2hif9ZCcnRBr
 nEZRObWyZu2jwq7FL9wqE2v+97WWf2nFRLdvC4NZKAUvcTqz0heW1Zfx0UQNgCAiW8Yo
 HxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e9alP0im1I2wRKr908QIHV5xP+2l4mLutFvUHyMFYAk=;
 b=jBZvsC+rAeuNonIPupjMGBFY7kZjJnSvlE551rbPeTo5j6+pFjhSjqSBvzTks/T5o+
 pTCJ1kJHt6rvfSDpP+LHxi0OaTfz1aqH726U6i8sKbagd5SKqMazcIfUOSziWzSsL39Y
 D5JrVLpO4pfnxrd0BSkO1j5WxE08Cxukihb/sRQ/cogT08IqBrJ8eQMpMr5eJS06IedB
 lesMN/vhKOgR2PIbjFUWIYxJl+yV2ntMXP2/ezzkvsrm2yHeFiAtTLLJD4xRrV+LWLsR
 Zz63sS89uC7gNzEjD/XBDGMgP5r5MRMf6zHwWCXrbhll3vUKPX/4AAFNILRUCETiIHAn
 qy1A==
X-Gm-Message-State: APjAAAVs1MyIEn8iFbFrC1V07HqflpY8a55EqK/8/sUw/u8nXQQ8yAHP
 1NGYbnmXXZ59zrkxsmx02MwxQA==
X-Google-Smtp-Source: APXvYqwFmgkphIkqfxWWjshP28A818A48RLlRF6DHm7ckJiyUrh0iPpp7SYoMLYwci6rTiP/epZdRA==
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr14006456wrw.323.1562143779941; 
 Wed, 03 Jul 2019 01:49:39 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id v67sm2068564wme.24.2019.07.03.01.49.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 01:49:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Mark Brown <broonie@kernel.org>
References: <20190702080920.22623-1-srinivas.kandagatla@linaro.org>
 <20190702080920.22623-3-srinivas.kandagatla@linaro.org>
 <20190702144411.GP2793@sirena.org.uk>
 <2e2a32dd-3dca-5391-1bfa-ab1c1f420e3a@linaro.org>
 <20190702165753.GQ2793@sirena.org.uk>
Message-ID: <0a9a994c-5a88-539f-3af0-76754b9b58d1@linaro.org>
Date: Wed, 3 Jul 2019 09:49:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190702165753.GQ2793@sirena.org.uk>
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



On 02/07/2019 17:57, Mark Brown wrote:
> On Tue, Jul 02, 2019 at 05:37:01PM +0100, Srinivas Kandagatla wrote:
>> On 02/07/2019 15:44, Mark Brown wrote:
>>> On Tue, Jul 02, 2019 at 09:09:16AM +0100, Srinivas Kandagatla wrote:
> 
>>>> +	for (i = 0; i < ARRAY_SIZE(cpr_defaults); i++) {
>>>> +		regmap_bulk_write(data->regmap,
>>>> +				  WCD934X_CODEC_CPR_WR_DATA_0,
>>>> +				(u8 *)&cpr_defaults[i].wr_data, 4);
>>>> +		regmap_bulk_write(data->regmap,
>>>> +				  WCD934X_CODEC_CPR_WR_ADDR_0,
>>>> +				(u8 *)&cpr_defaults[i].wr_addr, 4);
> 
>>> What is "cpr" and should you be using a regmap patch here?  Why
>>> is this not with the other default updates?  You've got loads of
>>> random undocumented sequences like this all through the driver,
>>> are they patches or are they things that should be controllable
>>> by the user?
> 
>> It makes sense to have a single default map here, I will do the in next
>> version. And regarding user controllable, I will go thru the list once
>> again in detail and remove user controllable registers.
> 
> What is a "default map"?  In terms of user controllable stuff
> it's not just a question of if things are currently user
> controllable but also if they should be user controllable.

I meant default updates here. These magic values and list came from 
downstream android code, so I will have to audit them before I can say 
that it will be useful for them to be exposed to user.
Most of things that made sense to provide a user control for the 
usecases of playback/capture/sidetone/speakers are already exposed via 
mixer controls.
> 
>>>> +	return of_platform_populate(wcd->dev->of_node, NULL, NULL, wcd->dev);
> 
>>> Why are we doing this?
> 
>> I will not be using MFD in this instance as most of the resources like
>> interrupts, pins, clks, SoundWire are modeled as proper drivers with
>> their respective subsystems.
> 
> This is a driver for a single device, you should be able to
> instantiate things without requiring binding through DT (and
> hence support non-DT systems such as those using ACPI).

My view point atleast from hw side was that Codec is Parent which is 
encompassing these different blocks and bus interface. DT representation 
clearly showed that relationship between the parent and child devices.
Binding it through DT will make sure that resources are ready before 
they are instantiated.

All the child devices also have some machine/board specific properties 
and dependency on resources from parent like regmap, clks, and bus.

In ACPI case, am not 100% sure how these will be represented inline with 
hw representation.

Are you suggesting to use MFD here?

> 
>> This gives a advantage of reusing those drivers like SoundWire, pinctrl
>> on other Qualcomm IPs as well!
>> Also I did not wanted to have a custom functions or hooks in the
>> drivers, so platform bus made much sense for me to use here, which can
>> take care of bringing up and tearing down the devices with proper parent
>> child relationship.
>> This will instantiate all the child devices like pinctrl, SoundWire
>> Controller and so on.
> 
> Just create platform devices like normal...
These are already modeled as platform devices, except the fact that 
these are children of Codec device.

thanks,
srini
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
