Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D6012794C
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 11:29:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B28B01615;
	Fri, 20 Dec 2019 11:28:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B28B01615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576837752;
	bh=NDFyiS9cnyNg6W1mlihXcR0yp60Yi3SKcV/JRagTfmQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kBpwMdPz8aHSZjb88Ct5/xq1cQ8xLr5v0WKjhs15fHie0mLTREnIapFBehNZK3dLD
	 H1nKu7B2vkjXh3lYaAKAI5V7A+grrIrmBgZ57JaCV4O2HYGYNJDdIRkKBintZOddNx
	 TYEsj40oBlxSiR5SK6YJwfGnlsL0Grgzdru1EdMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4291BF8015A;
	Fri, 20 Dec 2019 11:27:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2E3AF80059; Fri, 20 Dec 2019 11:27:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29843F80059
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 11:27:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29843F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vLmOQumr"
Received: by mail-wm1-x342.google.com with SMTP id 20so8533521wmj.4
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 02:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n0d7A9vcdYOjJrptRZ7l/Py3puK9fLPBMNKquvCDBS8=;
 b=vLmOQumrckuy/uRuCU6yj4xJmKBQPT49yE9Lmv9XbT/e4gBL/sCo8bZKZcNnCad6h0
 EzThNeJ09aW/PlljQ59lBAJU4BTFH/sJ04aytmPiYK8I+kWIlRR7MA+jfxfIdYPt0QA+
 nWQBF3Yni8tdLR3XUHykRBHWmfvqVXQaGhEGSRHgOQSSpQYvqCdZLAV47obw4KLsYyi9
 53sRvzHkBz6I54lzaP/B2akmRLThzlzDdlRePi86UJs02KQobisvc7mvwOLdjBx6VCTX
 127qaleSFwWS0mM1so33m0aD7tPk56PVtyMWniexnnQ7x7CARkRBFdSJ9Z+wu8UimdzM
 7p3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n0d7A9vcdYOjJrptRZ7l/Py3puK9fLPBMNKquvCDBS8=;
 b=Hf8XkTKI1DKD9yFolCt0Zly6RVQ28V2yKBY5mUn9c2Ii0QVoDYg9BQG45LWsDzaNPp
 NdmIAq4uF4AyDpnhdzLn8ql7uUfAbsUu+leVl0GlqUQKO7PmU4dZ0dug0Rl29yp5d+hm
 5pRYpeDpnLWzbUdjpOgvgjQ3p8s4SdQZ4rjOQB2bTjbcnz1kRojFzQoh2StDdZr9TdlI
 Mglp8/iWxXH3u9cYEXUwsm4PFbUhGX6dLQzXaMsgxzWdHVDBl6dYLwJXolbkDxAFRhgp
 y2KCO70xwXclkk9CSy6+m3PCFnUEsOhwyb9IgeUAqhfRuCp0s8pBaSNycwnW3iLVdMMH
 pVDA==
X-Gm-Message-State: APjAAAWEh6ahhdqv4gE/BqOZDwkWtktVNh5ni+r+AHr1FEJ17yK4cpJu
 TrWDXdY82cFln98S5+czsPG0ulsYjfg=
X-Google-Smtp-Source: APXvYqyVpEoQ0ffKKhojLArPhnqkXcZq4Qsi1o1iUUiVSKzewceGkEew3wQ3Hvpb8P8F0HzsUlM/ag==
X-Received: by 2002:a7b:c246:: with SMTP id b6mr15254728wmj.75.1576837643320; 
 Fri, 20 Dec 2019 02:27:23 -0800 (PST)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id r68sm9232066wmr.43.2019.12.20.02.27.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Dec 2019 02:27:22 -0800 (PST)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, lee.jones@linaro.org, linus.walleij@linaro.org
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
 <20191219103153.14875-3-srinivas.kandagatla@linaro.org>
 <af48cd71-fa1a-dbc5-0e88-e315ea13c28c@linux.intel.com>
 <db36d6d7-40a2-bbd2-f299-838abf4d92cc@linaro.org>
 <4492b71e-9923-365c-f22c-3766e2d5bae2@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <3fa4997f-4409-97f6-ba10-a87013383eb7@linaro.org>
Date: Fri, 20 Dec 2019 10:27:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4492b71e-9923-365c-f22c-3766e2d5bae2@linux.intel.com>
Content-Language: en-US
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 vinod.koul@linaro.org, devicetree@vger.kernel.org, spapothi@codeaurora.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v6 02/11] mfd: wcd934x: add support to
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



On 19/12/2019 20:05, Pierre-Louis Bossart wrote:
>>>
>> Note these are the child devices of the MFD SLIMBus device.
> 
> Ah ok. I guess the creation of those child devices when the parent 
> SLIMbus device reports PRESENT initially if fine, it's the part where 
> you remove them if the device loses sync or gets powered off which is 
> odd. And I guess technically you could still have race conditions where 
> a child device starts a transaction just as the parent is no longer 
> attached to the bus.

Losing power to SLIMBus device is very odd usecase and if it happens 
suggests that threre are bigger issues on the board design itself. This 
case should never happen. Even if it happens we would get timeout errors 
on every SLIMbus transactions.

> 
>>> I would however not remove the devices when the status is down but 
>>> only on an explicit .remove.
>>
>> Am open for suggestions but I would not like the child devices to talk 
>> on the bus once the SLIMbus device is down! Only way to ensure or make 
>> it silent is to remove.
> 
> it's as if you are missing a mechanism to forward the parent status to 
> the children so use remove() for lack of a better solution?
That is true. This gives bit more control on the slave device lifecycle.
Current solution works fine for now with less complexities across 
multiple drivers. I also agree that there is scope of improvement in 
future for this.

Thanks,
srini
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
