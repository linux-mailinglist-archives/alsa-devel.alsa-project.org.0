Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ACF3A81FF
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Jun 2021 16:11:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 024CA829;
	Tue, 15 Jun 2021 16:10:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 024CA829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623766288;
	bh=5Eala36z3fsuK70M+Qc0HSDimDvKYvsrG7+Uc+awhgQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D9NUN4HSEHvIndz9n4aDcV2A0CgPF/HvjxG7Bb1PYYyq9rZCT71INTI5hqXG9CQxm
	 K6xRvJdR7AfgxqIFVGbS8vn0a2iyOgJgDdz6nDDeYFeXTA7KfOkxs/18bDHpgA5SIw
	 3zZcA5shk0l0praLctwIeT2LP929peHLiR4tKlNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76823F80113;
	Tue, 15 Jun 2021 16:10:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4941F80171; Tue, 15 Jun 2021 16:09:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F329F8016C
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 16:09:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F329F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="CQWma7Gy"
Received: by mail-ot1-x32c.google.com with SMTP id
 q5-20020a9d66450000b02903f18d65089fso14368124otm.11
 for <alsa-devel@alsa-project.org>; Tue, 15 Jun 2021 07:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G03LeVSqzx4r6UWRg21tN37T3lMTHXfodYVAYedgndk=;
 b=CQWma7GynKiGTf/Cfus0SAXooczcUtAUWmj8IMcII3ayR0fKCmZlvQCTp2kl51BNqC
 UBRoHcbAAUBRK+qrsVV2EAsxHEOBbQnbH9nChYvVvUDW34ReH9str/1pEbuzDJXnn6x2
 LE5uC+WvITpjeejAf1fIDtVu5tyUBV5lx0kGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G03LeVSqzx4r6UWRg21tN37T3lMTHXfodYVAYedgndk=;
 b=EKYDczxQbQ7ZCfmhE3AnweWG3lZlkczb7Jrblnnle3JjXYtdRGLKD/9tHZjZdBBurb
 5mk0ACuM4VCDOMiaSZTXiQSZ+YcYuy38pP3SsK0rlQVeENwcShGh1rstSTiI2RbqQbD6
 ukRCAtkY7F1FMNVmnkr2Tqupo8TxFMXoPRyk7VevOB+4rIxP3i/GYMksM5vz5pkA6WH6
 xG86h9kKkKad64fczVktWu1a8zy6YUtkFVpQyjzoyuJZJYHss0FTSlDLrqX2sxuU67M2
 1YmkWVEp2LiOsib4ot6NIcLktpwAzOvwz8uYpputFUJLzJrIv7imcKR7s9w1iR+Qbuk7
 f1tQ==
X-Gm-Message-State: AOAM530Ol5V/WE2PYWbluNX6PfLuJ3QFg0hc93kzF8LXo7rjFcrGpV1d
 Jc3pzHHxFJz+N/zOT314h53Bvw==
X-Google-Smtp-Source: ABdhPJzif/rlAZ6AcdzlQfzAzDQSxFh0lbrTGIvzUs2Bf5Btgj19yIiD+Dgccd+ZOgiGbJJ3LAy97g==
X-Received: by 2002:a05:6830:17c8:: with SMTP id
 p8mr17682543ota.167.1623766192538; 
 Tue, 15 Jun 2021 07:09:52 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id k8sm3760778ool.5.2021.06.15.07.09.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 07:09:51 -0700 (PDT)
Subject: Re: [PATCH] media: Fix Media Controller API config checks
To: Hans Verkuil <hverkuil@xs4all.nl>, sakari.ailus@linux.intel.com,
 laurent.pinchart@ideasonboard.com, dan.carpenter@oracle.com,
 mchehab@kernel.org
References: <20210611015849.42589-1-skhan@linuxfoundation.org>
 <3745852a-a14d-3e66-dd9f-409ec7e43f48@xs4all.nl>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <04f0ce7b-71c3-948c-fdb0-72e234f8c7da@linuxfoundation.org>
Date: Tue, 15 Jun 2021 08:09:50 -0600
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
Oops. I tried different combinations of CONFIG_USB and didn't try this
one. Will send v2.

thanks,
-- Shuah
