Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B7731B89C
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Feb 2021 13:03:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9541A15E0;
	Mon, 15 Feb 2021 13:03:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9541A15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613390638;
	bh=17TOl8pnr8rg/2goWVgaN4zZWXokZYPs1t4T/i2FgsE=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UWgkBMDEOXphQUP+MVe4vlIDs62wJ2RHFQLGPf9h/7zgjfAF7WNu33JVugv0t4n6c
	 bmWo92rA88Kz6dbvPOIpbxHqGX7zU/rEBSs89FcbMWKBnnvQXLh4wQCOPbyFxv1LI5
	 qS6uSqPofdtYVvvhQfGX7OGKNLSOHXiCrdvwqF3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D45F4F800AE;
	Mon, 15 Feb 2021 13:02:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8785F80258; Mon, 15 Feb 2021 13:02:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58B83F80089
 for <alsa-devel@alsa-project.org>; Mon, 15 Feb 2021 13:02:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58B83F80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="XqaLkhGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613390541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tIpTTn+tMQG4DMdNMX67EVWkjkIOLI+bV07HRWJJXzo=;
 b=XqaLkhGlRGPF5ptHjYJvuwqaDE6DmXY08lbNxm35nE36C6Szlmvb7KjOIKA77lqyo25zdE
 zM5sufXrPC7KTYJnBcjnQ+Syy693jo8dGJ9/G8mNqdFcykiV8YisqzM2bKioiEdxvaS4sc
 xhyfPX/ewxiJAxpBCg4lJb2IaaJNB/o=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-lXxqPtgZPlWiuYF3HsexwQ-1; Mon, 15 Feb 2021 07:02:19 -0500
X-MC-Unique: lXxqPtgZPlWiuYF3HsexwQ-1
Received: by mail-ej1-f71.google.com with SMTP id hx26so4126116ejc.3
 for <alsa-devel@alsa-project.org>; Mon, 15 Feb 2021 04:02:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tIpTTn+tMQG4DMdNMX67EVWkjkIOLI+bV07HRWJJXzo=;
 b=RZdHiWUHiUU7ACcbErz8MZAx4T641xoqeINd+7ZQ9lw6p664fzL2ScEZ1ersWtrqFC
 3UKaBTiLdkG8Et86i2zWXsoQEsY5CnUoXKCNFv6Zhc9jZ9CYI0bro/sVRA8D40fei3g0
 oUqq0TAqhxNiHGv5lwF+CvM77cyLkSx2/VGwfns73gjq5yscPOY8/XtgOs3ve7Wh0Hwj
 iY60BvqceWs7uScEXg+l3GEvQiTOkQyt7veGCZ0X30IT/KcDw1XTui37k40ojIr6fGD2
 j9Os3BkTxQjZv4id9LkxV/kvHTyw635mIKSoBNolGkqadDIYLjH4VQz6i4weAyqtQFTi
 rJOQ==
X-Gm-Message-State: AOAM532F8H5v0zPODdhoZI1fKKQvlKeE3C20t/TRGvMxaJsI3FQUm1Ol
 3Q5nrVB/G8BgqTKEH8xrpikGF97yRr04zCuIwJcx0C+IkpkAp5MM2Bm0GOAJkpnRoer7wtsyWBD
 4UkbZ7Ekqxn3jKWhXNNnoB1s=
X-Received: by 2002:a50:ec12:: with SMTP id g18mr5160012edr.293.1613390538512; 
 Mon, 15 Feb 2021 04:02:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyODHcEadCS+IBBH8DhgQljnphsE8Gtlm6LpwrdZLBkeB+RedhDjkMR3DJQ4Is5eIwEmLIQtg==
X-Received: by 2002:a50:ec12:: with SMTP id g18mr5159990edr.293.1613390538331; 
 Mon, 15 Feb 2021 04:02:18 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id z65sm9864984ede.80.2021.02.15.04.02.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 04:02:17 -0800 (PST)
Subject: Re: [PATCH 0/5] ALSA: control - add generic LED trigger code
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20210211111400.1131020-1-perex@perex.cz>
 <cb04c4b2-4722-233a-05d4-2d3472d14bd9@redhat.com>
Message-ID: <eaa36d30-8d9f-0845-4516-f89a066a76e7@redhat.com>
Date: Mon, 15 Feb 2021 13:02:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <cb04c4b2-4722-233a-05d4-2d3472d14bd9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Perry Yuan <Perry.Yuan@dell.com>
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

On 2/12/21 9:31 PM, Hans de Goede wrote:
> On 2/11/21 12:13 PM, Jaroslav Kysela wrote:

<snip>

>> The sound driver implementation is really easy:
>>
>> 1) call snd_ctl_led_request() when control LED layer should be
>>    automatically activated
>>    / it calls module_request("snd-ctl-led") on demand /
>> 2) mark all related kcontrols with
>> 	SNDRV_CTL_ELEM_ACCESS_SPK_LED or
>> 	SNDRV_CTL_ELEM_ACCESS_MIC_LED
> 
> So I've been running some tests with this,combined with writing
> UCM profiles for hw volume control, for some Intel Bay- and
> CherryTrail devices using Intel's Low Power Engine (LPE) for audio,
> which uses the ASoC framework.
> 
> My work / experiments for this are progressing a bit slower then I
> would like, but that is not the fault of this patch-set, but rather
> an issue with hw-volume control mapping, see below for details.
> 
> Leaving the ASoC implementation details aside, this patch-set
> works quite nicely to get the speaker mute-LED to work.

I've spend some more time this weekend playing with this and I've also
added mic MUTE LED support for the ASoC rt5672 codec driver now using
this.

I will post a RFC patch series with the ASoC rt5672 codec driver LED
support soon, as adding an extra use-case for this will hopefully help
with reviewing this.

FWIW there were some challenges, but those were not related to the
driver API this patch set adds. The driver API works well for ASoC
codec drivers.

Regards,

Hans


p.s.

One open issue is the lockdep issue which I reported in my
previous email.

