Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB87010C89C
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Nov 2019 13:21:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E41016DF;
	Thu, 28 Nov 2019 13:20:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E41016DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574943691;
	bh=L3xqJ7T6nUVzJYw/9vwJO8zhPhBMkzYPxsWX6SR7Dz0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FF2W0niavsYdeiubxw5TXBRwutIVPvyI3dDjCR8n+W1w/m0eQxs1YEddHcCAiLra/
	 sHqZ2hggjsJOZUnSGH2KcXIgHxpcs28QA/642ryc7bgx0xcg45zMPosWzQJct6L0Re
	 Vii8nIBOyqyH/rVixa18RjRdDS6WGYqW/lUMyyKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F9EBF80159;
	Thu, 28 Nov 2019 13:19:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21702F80149; Thu, 28 Nov 2019 13:19:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43CF4F800CB
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 13:19:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43CF4F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com
 header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="YzG0xK1c"
Received: by mail-wm1-x342.google.com with SMTP id b11so10691505wmj.4
 for <alsa-devel@alsa-project.org>; Thu, 28 Nov 2019 04:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BWz2ZM0iVkn7qtCeMiE174FhJ8PK/VMK9gzTnGG8u34=;
 b=YzG0xK1cKVK0hRKr296mjhXq3h8XQSUQKI5keNetAFIDb8hoezeSSEFPnNE5IV+A7m
 RBFb0B7Tng9VBLTJcyuHVUqJnAh7m9xoizXG0oWmAq8DBVMQdTcjETujufx3UgORCz8U
 WGfJgux0RsiSO7Vs2/OStvDKq8/e5g+mAp6ronVbf73uC27PqSi3zyCZp8VEkjIAhG/i
 F615tmRYUGu0ZGOOAjMZy/41RNKFscivewTrlhN8Hs4JC1z1Pny+ze+vYCMnSeUrVTRs
 ajP+71np3xSzsR2V4SSNl4ofM4K4+4LfAzwqAb54ANQgsejLFZUF3Xo9Ru4C3FsBya/x
 VFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BWz2ZM0iVkn7qtCeMiE174FhJ8PK/VMK9gzTnGG8u34=;
 b=rDjwdpkTt5wWZdYE6JdddBMBzgdHL0TRv33NKH+XdelTOb79+FzcNZSQ4siuzQHTn4
 chgSoan2vOvJHqAsrqNMUXXOE7cdNMFwPNvPqex/uqvoOFFLart+NW9kOLGEKBn3qb5+
 Sqi85jjZZGGZfTGtFEPNY6ihMG5MHNIAEjGuzf/bg18t/1dRlRV5x+b9mFfMjHWoc5Dc
 ngObboE1u8/1yUr6YlkeYniUac1ucaIovsgTK3ZjmX16nicU/OU7jCiFAKp+Ivugt+Du
 tcTHEmtbJd7dbipJL3pWZtHhqsxAszAFbkiJo992nqygkTrYPw4j1drV39fJneIBykTG
 JqpQ==
X-Gm-Message-State: APjAAAXf4DV1n/LHgSVrHfna5Mf2PPKV4sbgR8wZmD6gt4rL2iXphdqW
 Wp4JfGalbHSUB0kLrtKWSFOsaw==
X-Google-Smtp-Source: APXvYqy5pUWFqDnj3jL4S55vfeNSWZl7DWu+0uoeX4F5VGvWes7K5XEgYiLYwb8lGGbOKk8/hYYMyw==
X-Received: by 2002:a7b:c4c8:: with SMTP id g8mr8771198wmk.36.1574943581198;
 Thu, 28 Nov 2019 04:19:41 -0800 (PST)
Received: from [192.168.112.17] (nikaet.starlink.ru. [94.141.168.29])
 by smtp.gmail.com with ESMTPSA id c10sm10150754wml.37.2019.11.28.04.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2019 04:19:40 -0800 (PST)
To: Mark Brown <broonie@kernel.org>
References: <20191128093955.29567-1-nikita.yoush@cogentembedded.com>
 <20191128121128.GA4210@sirena.org.uk>
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Message-ID: <ecfa48d3-284b-5234-02b9-adc0c6892b6f@cogentembedded.com>
Date: Thu, 28 Nov 2019 15:19:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191128121128.GA4210@sirena.org.uk>
Content-Language: en-US
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 "Andrew F. Davis" <afd@ti.com>, Chris Healy <cphealy@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH] ASoC: tlv320aic31xx: Add HP output driver
 pop reduction controls
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

>> +static const char * const hp_poweron_time_text[] = {
>> +	"0us", "15.3us", "153us", "1.53ms", "15.3ms", "76.2ms",
>> +	"153ms", "304ms", "610ms", "1.22s", "3.04s", "6.1s" };
>> +
>> +static SOC_ENUM_SINGLE_DECL(hp_poweron_time_enum, AIC31XX_HPPOP, 3,
>> +	hp_poweron_time_text);
>> +
>> +static const char * const hp_rampup_step_text[] = {
>> +	"0ms", "0.98ms", "1.95ms", "3.9ms" };
>> +
>> +static SOC_ENUM_SINGLE_DECL(hp_rampup_step_enum, AIC31XX_HPPOP, 1,
>> +	hp_rampup_step_text);
> 
> I'm not seeing any integration with DAPM here, I'd expect to see that so
> we don't cut off the start of audio especially with the longer times
> available (which I'm frankly not sure are seriously usable).

I believe driver already has that integration, there is aic31xx_dapm_power_event() that is called on 
DAPM events, and polls state in register bits waiting for operation to complete.

Btw, the default setting for register fields in question is "304ms" / "3.9ms" thus some delay is already 
there. This patch just makes it explicitly controllable by those who wait it.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
