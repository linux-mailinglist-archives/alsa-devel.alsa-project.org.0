Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D71994243BE
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 19:13:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7714B820;
	Wed,  6 Oct 2021 19:12:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7714B820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633540401;
	bh=640YhNXtWQTFpzEnFhvSQ+ZdMVLpP8ki2hiAj5l/Aks=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bfccykl7/rc8vgbqHSXWA480S5tGxsIJXCiDO0+hSz18nsGUog5GMisy0QMw4UHxK
	 uKkH3UKyu8kSxR42GUuDzIP2l/QVJDf8AP6w1Y1qj4ffurM8DLtVpedHxtaxmtqytk
	 6ePjk5tQCXbjJn6YaRiJ2IPD5kgCeA/au3qIG3zE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18497F80229;
	Wed,  6 Oct 2021 19:12:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B777DF80240; Wed,  6 Oct 2021 19:12:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_65,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 691ECF8020D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 19:11:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 691ECF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="WhP++GBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633540312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U4Q6R+OtmwUxo1RbNQzPAOFu+nCCtDAihVd8XB8cIPw=;
 b=WhP++GBsMe+Wf+X/I587ru8eN62ATiDlm7kEOLnd7DTclw4cROVxxzjl60iRijw46niq1m
 mkHx+83lOnS9hoBVQ7oxBDI8heKMdVaIJkU8jh51HIacog0GONVMc5HF8SCo6gdBLTZNab
 BdgYu9+4HiOLht+8hGJf0AHezORsQPo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-VlGdRjmKMwOIjSZCS2W0AQ-1; Wed, 06 Oct 2021 13:11:50 -0400
X-MC-Unique: VlGdRjmKMwOIjSZCS2W0AQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 c8-20020a50d648000000b003daa53c7518so3211805edj.21
 for <alsa-devel@alsa-project.org>; Wed, 06 Oct 2021 10:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U4Q6R+OtmwUxo1RbNQzPAOFu+nCCtDAihVd8XB8cIPw=;
 b=ydAXKicncEJktVqEA72pE8NLuaSnzy5vrz0Nr+xgn3bkAPqBfohc52xCPY5bcFHNcs
 OQjqTBFa+vJMI9641EI7cvHPhWdgJh+eOYWMaSUxzFjmL31WfMQ1FWt51tpMPO7FQHkQ
 CvU2DZ2yW3IgNsvrYU6ttpFxN++NJOWtzaY/w3eCYWjTvda/QCrzL8HhSay5k8HLxw+M
 jNRml0nnTbkkPZlZqPiRtcRf/DaLV9fMwiJFoL/pekXoa2efw/X53aGFMj+azvGVtosl
 Vhye0quzo6be+xoWyFhHXx+jQDoDAz8LY6/Znwv6qZp2tuNVFtI1+BeY1TXrknWl6mHv
 w7XQ==
X-Gm-Message-State: AOAM530HFQPXgjQueUfc5bX/3kdRaLKSwATEr8YbjySlsUvN6NEd263k
 LLJatDkEiHexXkhYgwtQES5RtkOdNEQ6l4ZCAgyJ+YUgSEodDKO23WPdQJL14YqzfK9wc9LcbkC
 7s4CSS3ITkEfsu8HU4WcvXHg=
X-Received: by 2002:a17:906:1d41:: with SMTP id
 o1mr33643493ejh.232.1633540309424; 
 Wed, 06 Oct 2021 10:11:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRdJA7qNS5aJ7ExgM7AdydSE/JTR1duLz95+tPKJYRetJ3b439DP9uqOgmOOCvdGuHiaimeQ==
X-Received: by 2002:a17:906:1d41:: with SMTP id
 o1mr33643473ejh.232.1633540309221; 
 Wed, 06 Oct 2021 10:11:49 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id d30sm4822432edn.49.2021.10.06.10.11.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 10:11:48 -0700 (PDT)
Subject: Re: [PATCH v1 3/4] ASoC: Intel: bytcr_rt5651: use
 devm_clk_get_optional() for mclk
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20211006150451.16561-1-andriy.shevchenko@linux.intel.com>
 <20211006150451.16561-3-andriy.shevchenko@linux.intel.com>
 <2d190513-7ac4-731c-7c9a-1f60a98f6345@linux.intel.com>
 <YV3NZnb6mg43nUC1@smile.fi.intel.com>
 <015e084e-70ed-7b5c-b103-8426ef0842d4@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <999a1046-864e-2b47-6f44-6e8e42528b18@redhat.com>
Date: Wed, 6 Oct 2021 19:11:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <015e084e-70ed-7b5c-b103-8426ef0842d4@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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

Hi,

On 10/6/21 6:37 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 10/6/21 11:23 AM, Andy Shevchenko wrote:
>> On Wed, Oct 06, 2021 at 10:51:52AM -0500, Pierre-Louis Bossart wrote:
>>> On 10/6/21 10:04 AM, Andy Shevchenko wrote:
>>>> The devm_clk_get_optional() helper returns NULL when devm_clk_get()
>>>> returns -ENOENT. This makes things slightly cleaner. The added benefit
>>>> is mostly cosmetic.
>>
>> ...
>>
>>>>  	if (SND_SOC_DAPM_EVENT_ON(event)) {
>>>> -		if (byt_rt5651_quirk & BYT_RT5651_MCLK_EN) {
>>>> -			ret = clk_prepare_enable(priv->mclk);
>>>> -			if (ret < 0) {
>>>> -				dev_err(card->dev,
>>>> -					"could not configure MCLK state");
>>>> -				return ret;
>>>> -			}
>>>> +		ret = clk_prepare_enable(priv->mclk);
>>>> +		if (ret < 0) {
>>>> +			dev_err(card->dev, "could not configure MCLK state");
>>>> +			return ret;
>>>>  		}
>>>
>>> I don't get why you removed the test on the BYT_RT5651_MCLK_EN quirk,
>>> see below it was designed as a fall-back mode. We don't want to return
>>> an error when we know the clock is not present/desired.
>>
>> Why should we do a unneeded test? When we switch to the optional, there
>> will be no error from these CCF APIs. Besides that it drops indentation
>> level and makes code neat.
> 
> By looking at this code only one cannot really visualize that it's a
> no-op. I personally prefer to see explicit intent rather than have to
> dig hundreds of lines below what this clock is optional.
> 
> I am also not even sure that in real products this clock is actually
> optional, the default is to make use of it:
> 
> #define BYT_RT5651_DEFAULT_QUIRKS	(BYT_RT5651_MCLK_EN | \
> 
> and the only platform without this clock is "Minnowboard Max B3" -
> probably not used by anyone. I fried mine a long time ago.
> 
> We'd need to Hans to comment on this since he's really the only one
> maintaining this code.

So as Mark wrote in his later reply:

"AIUI with the clock API the idiomatic thing is that any optionality is
handled at the point where the clock is acquired - if the clock is
optional you end up with NULL which in the clock API is a dummy clock
and ignored.  The rest of the code then doesn't need to worry about any
of this stuff and the handling can only be in one place."

Combined with there pretty much always actually being an mclk I believe
that this patch from Andy results in a nice cleanup so I'm in favor with
this. And the other cleanups also look sensible to me

I would like to run a small smoke-test with both the series to make
sure nothing regresses (should be fine but better safe then sorry).

Andy I believe that there is going to be a v2 to address a couple
of nitpicks, right ?

Note for testing I would prefer a full v2 series, even if some
patches don't change. And I assume the same applies to Mark for
applying this.

Sending partial series with only changed patches on the v2
send turns things into a puzzle, which is not ideal IMHO.

Regards,

Hans





> 
>> ...
>>
>>> same here, why was the quirk removed?
>>
>> Same answer.
>>
>> ...
>>
>>> that part in the probe looks fine, but the changes above are controversial.
>>
>> I didn't get. How controversial? Why? The whole point of _optional is to get
>> rid of unneeded checks (since they are _anyway_ be called).
> 
> It's inconsistent since you kept the following part but no longer use it:
> 
> +		/*
> +		 * Fall back to bit clock usage when clock is not
> +		 * available likely due to missing dependencies.
> +		 */
> +		if (!priv->mclk)
> +			byt_rt5651_quirk &= ~BYT_RT5651_MCLK_EN;
> 
> 
> 

