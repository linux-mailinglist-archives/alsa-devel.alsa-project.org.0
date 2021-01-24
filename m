Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 423A3301EE5
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Jan 2021 22:15:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C84351869;
	Sun, 24 Jan 2021 22:14:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C84351869
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611522902;
	bh=eCMrL+epx0YUPKzqMaqlB1dCH2oLmvmiPy5CkJADUv8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MsJmeJqD9VV5f/ocwU1iDCwzlBoIbdjkqnDaJ1L7sTU63XHiGoQ0NXH3mckwMCvYa
	 aY/ysWEx88+ksUK026AfVGaf/Z9YhLhmwyDH30o0CPmsS5YnVTnNUj6TKjVdLRYi1A
	 SUA1j39LnsjzaD4luymUXY8yMhCpfGVIffFW0KIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44851F80114;
	Sun, 24 Jan 2021 22:13:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82B47F8015B; Sun, 24 Jan 2021 22:13:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F06D1F80114
 for <alsa-devel@alsa-project.org>; Sun, 24 Jan 2021 22:13:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F06D1F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="ijj9e6eJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611522799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kv9jicTdTocjJxmYHF8RW7pmq0CcKS9rS4Zkv6lNt9I=;
 b=ijj9e6eJRM74tDyl12ub1hhuDKeAGAbe4D1PO3aFG/mnNtdPa5sk4o5vWREXBuB4pXEGKf
 5XTRM++S/3spP14pE1U9LrJ4yeuWJMy3d6wQaJUx0RYuqKaybrM0mze3LSfOO6BaUaG0I1
 JMwMEjPG+jN9tzUgI672AT5Dbc54XhQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-Gk-LVC1iPrGHuB3BEWbRXQ-1; Sun, 24 Jan 2021 16:13:17 -0500
X-MC-Unique: Gk-LVC1iPrGHuB3BEWbRXQ-1
Received: by mail-ed1-f71.google.com with SMTP id a26so6290973edx.8
 for <alsa-devel@alsa-project.org>; Sun, 24 Jan 2021 13:13:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kv9jicTdTocjJxmYHF8RW7pmq0CcKS9rS4Zkv6lNt9I=;
 b=YYjutO6aDVn3Nx0DOqc/EUv2xvs1uqnVVUrk+xu0eENSc45hqtq0yspJVOTQ37Xif8
 8+sz7ZGIimIw4dmucK4iRl9FlaiRZHW3UIh++3BclL6+C8nWB7OnI98ruoq2iOS3Z069
 8uXnjRsEW2c4XNZvknXgrzi6umVLlLvAX4nncTbg1GzMSt09kn1XMKSmR4FhlIHYy/cn
 +5Gh3vVQPuy8s58Xdk8FwzrdK4G5aH4r/vOGVo61LZ9uHY6X+bG/wbxNTf1aUuzYDKb2
 1BKjhoWhnwllhUCRdNaBIsDn0jvAYz1g86U03biPbHYuJRggciPRyD1RhxT2G/xvCDg+
 DYPQ==
X-Gm-Message-State: AOAM530WbGfe7wKc949fNkDNWAVsqN/Z488muy3l9bOa7QkVA1skU09H
 AwJ+7+dGrs8hoLiOfEizFDcpC8hHZulD670kQw7Ybz2rrWJI+ul7Dd6ky2+ex3VBposdbpsYqdc
 oM635wAN+ey5duDmCO/6RJDbtyw/nbbZP1wqmlIwZXB8AobGBpFKVryhlW1ya7x08HIlBIpD7QI
 c=
X-Received: by 2002:aa7:d40f:: with SMTP id z15mr289363edq.276.1611522795579; 
 Sun, 24 Jan 2021 13:13:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUqliddwpe2eSvzpgHkPyxmGc61u3ckFkUrt683DQ8oDfJny77NWrBhfgz1/vMdO9EbBaCog==
X-Received: by 2002:aa7:d40f:: with SMTP id z15mr289349edq.276.1611522795418; 
 Sun, 24 Jan 2021 13:13:15 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id g2sm7379705ejk.108.2021.01.24.13.13.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jan 2021 13:13:14 -0800 (PST)
Subject: Re: [PATCH v4 11/13] ASoC: arizona-jack: Cleanup logging
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210123121313.79530-1-hdegoede@redhat.com>
 <20210123121720.79863-1-hdegoede@redhat.com>
 <20210123121720.79863-2-hdegoede@redhat.com>
 <CAHp75VdOhXMBb9t8GEA3qrjyuRzNSXFZ--QuaVMUAaNh-=DnGA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <5aefbd9b-6e98-6cd7-bb98-80df88109a40@redhat.com>
Date: Sun, 24 Jan 2021 22:13:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdOhXMBb9t8GEA3qrjyuRzNSXFZ--QuaVMUAaNh-=DnGA@mail.gmail.com>
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

Hi,

On 1/24/21 8:53 PM, Andy Shevchenko wrote:
> On Sat, Jan 23, 2021 at 2:17 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Cleanup the use of dev_foo functions used for logging:
>>
>> 1. Many of these are unnecessarily split over multiple lines
>> 2. Use dev_err_probe() in cases where we might get a -EPROBE_DEFER
>>    return value
> 
> ...
> 
>>                 if (IS_ERR(info->micd_pol_gpio)) {
>>                         ret = PTR_ERR(info->micd_pol_gpio);
>> -                       dev_err(arizona->dev,
>> -                               "Failed to get microphone polarity GPIO: %d\n",
>> -                               ret);
>> +                       dev_err_probe(arizona->dev, ret, "getting microphone polarity GPIO\n");
>>                         return ret;
>>                 }
> 
> I still think that using dev_err_probe() naturally, i.e. as a part of
> the return statement is better.

Just because it can be used that way does not mean that it must be used that way.

More importantly I don't think that this small tihng is worth doing a v5 of
this large series for. But if a v5 is necessary for other reasons,
then I'll change this into:

 return dev_err_probe(arizona->dev, ret, "getting microphone polarity GPIO\n");

Regards,

Hans

