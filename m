Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B8E300EF6
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 22:34:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 173541F11;
	Fri, 22 Jan 2021 22:33:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 173541F11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611351287;
	bh=/6iRAcXBJqbHwFOV/jgXsqfXBlPVN+eigrCT4SCsm78=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A341+vpDfGg2SXyxX8u4JSw0ZuRxMbD+JuXqw5GbvVSD4KPabaqwozQYxlnTaUxne
	 oDPlAQ9XIu89mNuNmmxStXtSaF5t1YHJqORrIw0qLw1HelaEPXOlYtd/+e0kpJBLx4
	 tczb0pqXLhvEShEeqztPm/eXBNVTEp2D96jLNYRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B024DF8019B;
	Fri, 22 Jan 2021 22:33:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8683F8016E; Fri, 22 Jan 2021 22:33:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0676F8015B
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 22:33:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0676F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="dW3r9yIl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611351185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gvWX/CFGSihQRjsLbay3juv/HcaiKfTaRyJu5DpVCsw=;
 b=dW3r9yIlR21ES0smtsA896nj6003YTofwag+UuRPWpou564q4B9TD4Bce2TEpIdjkDC9nf
 eWeGdQnrPRCoMtu4hTTNSM7Qpk6BPoPY3wohQbMGJ6xs3HrQ9yTJF7nk4p+mYqjo42XDng
 TblRYiyJcvcfEEJhu5Wn1kSc2kwldis=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-atBsXy1_OEi2JoxpR0PcvQ-1; Fri, 22 Jan 2021 16:33:03 -0500
X-MC-Unique: atBsXy1_OEi2JoxpR0PcvQ-1
Received: by mail-ej1-f71.google.com with SMTP id j14so2719473eja.15
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 13:33:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gvWX/CFGSihQRjsLbay3juv/HcaiKfTaRyJu5DpVCsw=;
 b=UVkIZha2bBsjrQq3r9nzd5Hz2rRoGcJXpjp+yvuuJUNWJXU7EcOihBEAjp+kQiOZdS
 303g1zlm1xkzm/kAaN93al2N746nweUkHKLu9b0uYTkwuYETEl1DzZwx8kJGjUKLFqIa
 HK8/Jj77XuW9wTOxYPr+R6GTZNn0oKR1XBK0P00SINtK82PRl8Qg9EtzoUQWxXGcSFLz
 GDujzBRvyObElgNmdLBNcic6kc6p/RNqyEQTpXOt0wcNP/LFBzIiz816VpAorcfUv3Ac
 jJnDXY8kOjAfYPBP8cSzEWEHhvNnQ0+SKjZIBtVFb++yPH60d9yuRtIQJ1NZSI/l0LdU
 kf6g==
X-Gm-Message-State: AOAM532mDgx6YDgmylqlD4Xx/YMP1FSoiCIwNRvDLCANVq1m8WHkjBdj
 RLPBqQac3LD4epNdQP6ZMIOnyC0hSwqGknQvi6RbHxWg8+OnE3r9jMCnLtphu+FUUdzvPwNv2z7
 7PegT0SMIHaQ65uiONnc2q0+PyTYOlPF2nXD6Iyu+jJARHm+oYVmSKGCgBSqT8NfyqMonf/rkmq
 M=
X-Received: by 2002:a17:906:52c1:: with SMTP id
 w1mr4441170ejn.214.1611351182043; 
 Fri, 22 Jan 2021 13:33:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/FeHvpIwV/TbzHI/VBnHx0waeIY6CaKZcDNGJy7Ojizzfy6JS0vUHdP2Yo/HYZkvjr+TuSw==
X-Received: by 2002:a17:906:52c1:: with SMTP id
 w1mr4441148ejn.214.1611351181816; 
 Fri, 22 Jan 2021 13:33:01 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id cf26sm2826989edb.14.2021.01.22.13.33.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 13:33:01 -0800 (PST)
Subject: Re: [PATCH v3 11/13] ASoC: arizona-jack: Cleanup logging
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210122164107.361939-1-hdegoede@redhat.com>
 <20210122164107.361939-12-hdegoede@redhat.com>
 <CAHp75VcP6NXn8gAze3B=b1m2sRZnrV=dL456D0QAGzON21etFQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <e5742738-dd83-e1df-1789-ab75761d7600@redhat.com>
Date: Fri, 22 Jan 2021 22:33:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VcP6NXn8gAze3B=b1m2sRZnrV=dL456D0QAGzON21etFQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
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

HI,

On 1/22/21 9:56 PM, Andy Shevchenko wrote:
> On Fri, Jan 22, 2021 at 6:41 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Cleanup the use of dev_foo functions used for logging:
>>
>> 1. Many of these are unnecessarily split over multiple lines
>> 2. Use dev_err_probe() in cases where we might get a -EPROBE_DEFERRED
> 
> s/RED$//

Ack, will fix for v4.


>>    return value
> 
> ...
> 
>> +               if (ret != 0)
> 
> Since you are touching it if (ret) would work already. Ditto for the
> similar cases below.

Ack.

> ...
> 
>>         if (IS_ERR(info->micvdd)) {
>>                 ret = PTR_ERR(info->micvdd);
>> -               dev_err(arizona->dev, "Failed to get MICVDD: %d\n", ret);
>> +               dev_err_probe(arizona->dev, ret, "getting MICVDD\n");
>>                 return ret;
>>         }
> 
> Seems like your first dev_err_probe use :-)

Erm, nope. I did this on purpose.

> Can be even more optimized, i.e.
> 
>   if (IS_ERR(info->micvdd))
>     return dev_err_probe(arizona->dev, PTR_ERR(info->micvdd), "getting
> MICVDD\n");

Ok, so that works here, but I deliberately kept it as is because it does
not work below and I wanted to be consistent.

On second thought. That is not really a good reason, so I've
made this a 1-lines as you suggest for v4.

> 
> ...
> 
>>                 if (IS_ERR(info->micd_pol_gpio)) {
>>                         ret = PTR_ERR(info->micd_pol_gpio);
>> -                       dev_err(arizona->dev,
>> -                               "Failed to get microphone polarity GPIO: %d\n",
>> -                               ret);
>> +                       dev_err_probe(arizona->dev, ret, "getting microphone polarity GPIO\n");

This new line is 96 chars as-is if I turn this into a one-liner it goes significantly
over the 100 chars line-length limit.

So I've kept this as is for v4.

Regards,

Hans

