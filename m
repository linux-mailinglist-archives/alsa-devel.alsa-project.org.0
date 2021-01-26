Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3FB303F97
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Jan 2021 15:05:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C078017A7;
	Tue, 26 Jan 2021 15:04:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C078017A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611669910;
	bh=GR3Wc4bBcfzmbtG7Ipl7qUqWbJev22wLLGAdrnJvG1I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jCeYVPtwjdMBoqriIWCnuGtxVMLfBG87NXyFWFyL1WLeLzdufTCvcLt1yf+P0cnIb
	 /WpvreyoZwAwgbK1fPuNOxMK6+QJK53aDa6tVddE7lRstiixO4f1Q9V/gAVNq4aEGP
	 maaW2Z8f6komnoqc3djeNPs6HAUoB0sX8IohDwao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CFA4F80158;
	Tue, 26 Jan 2021 15:03:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6D8BF8015B; Tue, 26 Jan 2021 15:03:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36210F80108
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 15:03:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36210F80108
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="P6Tpm4BV"
Received: by mail-wr1-x432.google.com with SMTP id a9so16588602wrt.5
 for <alsa-devel@alsa-project.org>; Tue, 26 Jan 2021 06:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hg6fbk2hPzJeVcc0/n/hzZnSJhxa5oFlovCgSGcU67s=;
 b=P6Tpm4BVnKOzhXoaIat518LzAthKeb+ZWTBK9MuSdjOT97YNNIxOI8cdDf7/LoO/v6
 a3E22//ZnT+owpQ92sTpjZ6VwuvNtbR0pWZxEpaHPszMi+eo00cbW+mUzCj1/gRA4Trk
 /tylNLzhFPs9YiVkfx2D36x0WfOXi1uAw4zqlVX3ZfNLhtBNAMpJFCVu9z1zTdpz+++p
 N+Ort/gq47Dh5Lx6pQ6Fm2kVPSZjXPrWsjkXb34pGI+VIR9yMtOGk85WRq6QUTB5PnvB
 E/8JLUH/bkI0N7rGFdrm0c4EdC8N8opOp9sWj1XSNJwWFLLWLyMA59kh2RVO0QSR0k14
 2NHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hg6fbk2hPzJeVcc0/n/hzZnSJhxa5oFlovCgSGcU67s=;
 b=CiElotU4fON4CQWvlThhs6YW5hjjBeLqzVecNz77agXAT/pQefIvfOaW8M/Kw82E1A
 fIZQYhpryuqeqzMAOWYs0jR1SKxxinMnEZJZuJtKfV2vxCCRwUZEIuvoApErhRWijpr8
 RRDf/GNIeI5bZSzuakjUgoAkSrIgGssfk/GtMsu+PFGmOj/ovMYFn/iuffrJSd9MOu0K
 C44ZbvopJ5kZbfda5gbi6+XMUYKTfVMAH5fnE754urgwQj0gNNR2TwuGhA7gK4IHA/1Z
 OovL4WYhllDdA5y9hC/XaXkUQCmW2Os7y0bRhhX1y9foOURmIvmNyfyilz82xYTRktdT
 dAzA==
X-Gm-Message-State: AOAM532tmHOX1iX1Nytg+qONWnJ8rcNS+fJ/opbqxKAeV6osD3GBYOQW
 Jcy+xbmVR8eoWCr1U4ylKIHpDQ==
X-Google-Smtp-Source: ABdhPJydvaUg5BFfRO/xEY6wVKn8k7gUjr+DsnZmxrmdhVUocszh4txZ+l25z36Vfxepv+6W9/V9ug==
X-Received: by 2002:a5d:4e89:: with SMTP id e9mr6202939wru.201.1611669811563; 
 Tue, 26 Jan 2021 06:03:31 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id n125sm3703525wmf.30.2021.01.26.06.03.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Jan 2021 06:03:30 -0800 (PST)
Subject: Re: [RFC PATCH 1/2] ASoC: soc-component: add
 snd_soc_component_read/write_field()
To: Mark Brown <broonie@kernel.org>
References: <20210126122020.19735-1-srinivas.kandagatla@linaro.org>
 <20210126133612.GB4839@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6816a9fe-9b71-6a39-485e-1b6ce2b732ed@linaro.org>
Date: Tue, 26 Jan 2021 14:03:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20210126133612.GB4839@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, vkoul@kernel.org
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



On 26/01/2021 13:36, Mark Brown wrote:
> On Tue, Jan 26, 2021 at 12:20:19PM +0000, Srinivas Kandagatla wrote:
> 
>> +#define __soc_component_field_shift(x) (__builtin_ffs(x) - 1)
> 
> Why not have this be a static inline?

Sure, that makes it even better to validate the mask aswell!

> 
>> +unsigned int snd_soc_component_read_field(struct snd_soc_component *component,
>> +					  unsigned int reg, unsigned int mask)
>> +{
>> +	unsigned int val;
>> +
>> +	mutex_lock(&component->io_mutex);
>> +	val = soc_component_read_no_lock(component, reg);
>> +	if (mask)
>> +		val = (val & mask) >> __soc_component_field_shift(mask);
> 
> I don't understand why this is open coding the locking when it's just a
> simple read and then shift?

I agree! something like this should be good I guess:

unsigned int snd_soc_component_read_field(...)
{
	unsigned int val;

	val = snd_soc_component_read(component, reg);

	val = (val & mask) >> __soc_component_field_shift(mask);

	return val;
}

> 
>> +	mutex_lock(&component->io_mutex);
>> +
>> +	old = soc_component_read_no_lock(component, reg);
>> +
>> +	val = val << __soc_component_field_shift(mask);
>> +
>> +	new = (old & ~mask) | (val & mask);
>> +
>> +	change = old != new;
>> +	if (change)
>> +		ret = soc_component_write_no_lock(component, reg, new);
>> +
>> +	mutex_unlock(&component->io_mutex);
> 
> This needs the lock as it's a read/modify/write but could also be
> implemented in terms of the existing update_bits() operation rather than
> open coding it.
True!, we could simplify this to :

int snd_soc_component_write_field(struct snd_soc_component *component,
				  unsigned int reg, unsigned int mask,
				  unsigned int val)
{
	val = (val << __soc_component_field_shift(mask)) & mask;

	return snd_soc_component_update_bits(component, reg, mask, val);
}

Does that look okay to you?


--srini
> 
