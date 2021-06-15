Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EF63A86F9
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 18:57:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C67B1691;
	Tue, 15 Jun 2021 18:56:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C67B1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623776228;
	bh=hbUnLLedbmJMowypiB+3AebnrDrIKPfEUCExtp2B3QA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ro/kCYPjH048WfLacONXYcbXw+FzlLprGUD65LgEh9nwyv193p/cUcXgh+5c8optH
	 RBLVX7yC+WXn99JlAOxwPH+M60VcMwcCoRIF5IMUS0JWfZXIuQtXbkBezOuRSln54c
	 aOto2/RRVVz3P2+kMTYCCMVBAkfiNmZGPlj7EonQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C815F8025A;
	Tue, 15 Jun 2021 18:55:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41B6BF80171; Tue, 15 Jun 2021 18:55:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B338F8016C
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 18:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B338F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="VrBoYlpG"
Received: by mail-oo1-xc31.google.com with SMTP id
 v17-20020a4aa5110000b0290249d63900faso3691948ook.0
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 09:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+RaZJtsUnxE0LQhLgGIH6UV1neEgEYWyhmaxMuF1UDE=;
 b=VrBoYlpG3wNUBP3sbRO2ADGwvl9BBKp0P2yGMmzY7ZCUOuwgg6oK5YUVcBo+fj3gnR
 avZWr4kNiTMUNJu6BWEbsO/e5Wno19s/0EUzN2BPM3GHCrrBTmwJlI3Hzwp178w9TGnt
 K8tAjo7+V2O8iquaV5Xmf5PZfKJvh76wfBpNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+RaZJtsUnxE0LQhLgGIH6UV1neEgEYWyhmaxMuF1UDE=;
 b=dqTfi2BiWSoMfnGmfgsTRwnh+BdarBiVI0jOuieZ8HY7Brf011aqd967cRYrmK4n+m
 67esbdT1rtMbfCIwe2drFu+ZNwchqbifeiq/9nZK7flrVVVBFeR7Vw49IJcUiHhNsKaN
 ocm6bt21ddnEMq6NdRmbY8El7DPh5+vwNmAvUXyXpQhG98J7SYfDp8jclGtdBdwJX8Jz
 1dEHDG9WZ9zH2XPtMPlWb7JTJUlN/v6rsFoIcVWBLm7FIaVFe9QIQJbdHwWxkgZMDFb2
 IzlAJVu29qObI6etfETvrHNu8pZoVnGtF1iZEAMboBnqlqBJb4b5SGkow1bfb/WzVmh6
 5Fqg==
X-Gm-Message-State: AOAM532eUqHyG4yJX8Zj1qP3rMrwqalIzukXEJmOWvuil/4HkqoRiIvC
 vYgWJAxdXovESyARHAABmuNy2g==
X-Google-Smtp-Source: ABdhPJzYUKrrelOAEP5pQNrS0CNPNMjjx7cG2nUYfg+jzD3ZgZoSWPchkoTPjLj3kiiadimBxRdE6A==
X-Received: by 2002:a4a:df47:: with SMTP id j7mr109033oou.79.1623776127691;
 Tue, 15 Jun 2021 09:55:27 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id l10sm4135693otj.17.2021.06.15.09.55.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 09:55:27 -0700 (PDT)
Subject: Re: [PATCH] media: Fix Media Controller API config checks
To: Hans Verkuil <hverkuil@xs4all.nl>, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com, dan.carpenter@oracle.com,
 mchehab@kernel.org
References: <20210611015849.42589-1-skhan@linuxfoundation.org>
 <3745852a-a14d-3e66-dd9f-409ec7e43f48@xs4all.nl>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <ee53183f-6c44-4ddb-a8b1-40d650772c73@linuxfoundation.org>
Date: Tue, 15 Jun 2021 10:55:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3745852a-a14d-3e66-dd9f-409ec7e43f48@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
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

On 6/15/21 7:36 AM, Hans Verkuil wrote:
> Hi Shuah,
> 
> On 11/06/2021 03:58, Shuah Khan wrote:
>> Smatch static checker warns that "mdev" can be null:
>>
>> sound/usb/media.c:287 snd_media_device_create()
>>      warn: 'mdev' can also be NULL
>>
>> If CONFIG_MEDIA_CONTROLLER is disabled, this file should not be included
>> in the build.
>>
>> The below conditions in the sound/usb/Makefile are in place to ensure that
>> media.c isn't included in the build.
>>
>> sound/usb/Makefile:
>> snd-usb-audio-$(CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER) += media.o
>>
>> select SND_USB_AUDIO_USE_MEDIA_CONTROLLER if MEDIA_CONTROLLER &&
>>         (MEDIA_SUPPORT=y || MEDIA_SUPPORT=SND_USB_AUDIO)
>>
>> The following config check in include/media/media-dev-allocator.h is
>> in place to enable the API only when CONFIG_MEDIA_CONTROLLER and
>> CONFIG_USB are enabled.
>>
>>   #if defined(CONFIG_MEDIA_CONTROLLER) && defined(CONFIG_USB)
>>
>> This check doesn't work as intended when CONFIG_USB=m. When CONFIG_USB=m,
>> CONFIG_USB_MODULE is defined and CONFIG_USB is not. The above config check
>> doesn't catch that CONFIG_USB is defined as a module and disables the API.
>> This results in sound/usb enabling Media Controller specific ALSA driver
>> code, while Media disables the Media Controller API.
>>
>> Fix the problem requires two changes:
>>
>> 1. Change the check to use IS_ENABLED to detect when CONFIG_USB is enabled
>>     as a module or static. Since CONFIG_MEDIA_CONTROLLER is a bool, leave
>>     the check unchanged to be consistent with drivers/media/Makefile.
>>
>> 2. Change the drivers/media/mc/Makefile to include mc-dev-allocator.o
>>     in mc-objs when CONFIG_USB is y or m.
> 
> If I test this patch, then I get:
> 
> drivers/media/mc/mc-dev-allocator.c:97:22: error: redefinition of 'media_device_usb_allocate'
>     97 | struct media_device *media_device_usb_allocate(struct usb_device *udev,
>        |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/media/mc/mc-dev-allocator.c:24:
> include/media/media-dev-allocator.h:55:36: note: previous definition of 'media_device_usb_allocate' was here
>     55 | static inline struct media_device *media_device_usb_allocate(
>        |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/media/mc/mc-dev-allocator.c:119:6: error: redefinition of 'media_device_delete'
>    119 | void media_device_delete(struct media_device *mdev, const char *module_name,
>        |      ^~~~~~~~~~~~~~~~~~~
> In file included from drivers/media/mc/mc-dev-allocator.c:24:
> include/media/media-dev-allocator.h:59:20: note: previous definition of 'media_device_delete' was here
>     59 | static inline void media_device_delete(
>        |                    ^~~~~~~~~~~~~~~~~~~
> 
> The .config has:
> 
> # CONFIG_USB_SUPPORT is not set
> CONFIG_MEDIA_CONTROLLER=y
> 

Hans,

Can you share your full config with me?

thanks,
-- Shuah

