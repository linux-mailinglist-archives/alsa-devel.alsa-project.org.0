Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DFE3A042D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 21:50:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06BD816C8;
	Tue,  8 Jun 2021 21:50:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06BD816C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623181856;
	bh=JhIelEsiCuLe22QtJ9lUEBLTPC81o7VT3KND8neL0AA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZF6pZ6n5PQly2kcNb3OZvMiNwB7thgB5luKOhcXRQDd8qx+IntmRVfUQpO0yw8NR/
	 hVtTwf8tslWORD5Eulcy3KCoa2TcGzVSIt7aMW2CeNuq6oQzMkN//xrYWxeZ43uEY9
	 HkJnrtnTD6AaPFX1vh7vofq+5qXSy5tsn9fcB7dc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 796D5F80116;
	Tue,  8 Jun 2021 21:49:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1259DF80218; Tue,  8 Jun 2021 21:49:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50AC4F80116
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 21:49:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50AC4F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="WcHjQoRw"
Received: by mail-ot1-x32c.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so21503439otp.4
 for <alsa-devel@alsa-project.org>; Tue, 08 Jun 2021 12:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=APi+jbY3obldVw/tiZrYKk6KNK+cdDWeeoG2qx6eyaQ=;
 b=WcHjQoRwYi9DIxyexZIPH5S0HAQ/eezqFUCIDxkn8MSZ45er1dl4HEMRlUJC1dqEyc
 Y6mZ7ZeyWUsROhy1zzTh6KnNOBbRCG0JviwSMYM1CY9xe+3+iRPzZglXdFMQUEAWioBe
 AXtg9P13LWwrjt7dO9oA9j8zrIsA2RUT25QlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=APi+jbY3obldVw/tiZrYKk6KNK+cdDWeeoG2qx6eyaQ=;
 b=kEk136XJ+e9ceWqVpsgjTkvqZ14Pl6sy9o8vH/lj+fU3sExx+8NWVG6Bk/23jfAWoe
 kl+giaFtfS9KbO2MFNM1YeUjORKQQEMrNjNaQBMKve7tiWjhfpUzEsle/tj6ccWTrBD+
 tMrZcbKsmoCfu20C3Rh859j1pWlwbDG5/uDO5Uk6UQxKuVmXqoCjlpRlLAaQOOWWEPy2
 HMa+jcYdydUAPhU+ClXh1BDLjjqqWwWBa67398VTYf6b8lj14IW6JUwBhdhz6gEayWEk
 aL2ngpMfib91D50ZnfgUcoJ9iVWKvCE7VNhcQ3UDl/U/K4+U53MEXqG6aSxeDcKZAhwI
 0FSQ==
X-Gm-Message-State: AOAM531vItRJTwllg+5BqE5rJsWjD4QWWd9o54obkTj3nHVjAsBHW3o1
 li7/9LCurRagdbB7YSf8GFJVdQ==
X-Google-Smtp-Source: ABdhPJxWNEBMyHcTANC/XXIXPrUs3aMDPLEL2jvpSG7XesJygv55t+ociSmoSMImc2FrqTM0vYLiLQ==
X-Received: by 2002:a9d:2cf:: with SMTP id 73mr10087594otl.204.1623181754514; 
 Tue, 08 Jun 2021 12:49:14 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id o26sm832671otk.77.2021.06.08.12.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 12:49:14 -0700 (PDT)
Subject: Re: [bug report] media: sound/usb: Use Media Controller API to share
 media resources
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <YLeAvT+R22FQ/Eyw@mwanda>
 <3c0f6858-ca94-3cd9-7398-20073dfff7b0@linuxfoundation.org>
 <20210608190309.GJ10983@kadam>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <11ad1173-4b37-3bb9-6435-f8d7321921af@linuxfoundation.org>
Date: Tue, 8 Jun 2021 13:49:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210608190309.GJ10983@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, shuah@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
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

On 6/8/21 1:03 PM, Dan Carpenter wrote:
> On Tue, Jun 08, 2021 at 11:53:53AM -0600, Shuah Khan wrote:
>> On 6/2/21 6:59 AM, Dan Carpenter wrote:
>>> Hello Shuah Khan,
>>>
>>> The patch 66354f18fe5f: "media: sound/usb: Use Media Controller API
>>> to share media resources" from Apr 1, 2019, leads to the following
>>> static checker warning:
>>>
>>> 	sound/usb/media.c:287 snd_media_device_create()
>>> 	warn: 'mdev' can also be NULL
>>>
>>> sound/usb/media.c
>>>      270
>>>      271          mdev = media_device_usb_allocate(usbdev, KBUILD_MODNAME, THIS_MODULE);
>>>                   ^^^^
>>>
>>> If CONFIG_MEDIA_CONTROLLER is disabled then "mdev" is NULL.
>>
>> If CONFIG_MEDIA_CONTROLLER is disabled, this file won't be compiled.
>> Please see below clause in the Makefile.
>>
>> sound/usb/Makefile:
>> snd-usb-audio-$(CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER) += media.o
>>
>> Also, this select in sound/usb/Kconfig selects appropriate
>> configs.
>>
>> select SND_USB_AUDIO_USE_MEDIA_CONTROLLER if MEDIA_CONTROLLER &&
>> (MEDIA_SUPPORT=y || MEDIA_SUPPORT=SND_USB_AUDIO)
>>
>> We are good here with the above in place to make sure media.c
>> code isn't in play when CONFIG_MEDIA_CONTROLLER is disabled.
> 
> Smatch is working based on a real .config but I misunderstood the
> problem.
> 
> include/media/media-dev-allocator.h
>      21
>      22  #if defined(CONFIG_MEDIA_CONTROLLER) && defined(CONFIG_USB)
>                                                  ^^^^^^^^^^^^^^^^^^^
> When I have CONFIG_USB=m then this is false, but when I use CONFIG_USB=y
> then this is true.  I'm not an expert on the kernel build system so I
> can't explain why defined() is not working as expected but I know that
> if we used IS_ENABLED(CONFIG_USB) that would work.
> 
> #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER) && IS_ENABLED)CONFIG_USB)
> 

Good find. IS_ENABLED is the right usage. When CONFIG_USB=m,
CONFIG_USB_MODULE is defined and CONFIG_USB isn't.

IS_ENABLED does the following and catches both, where as defined()
checks just for CONFIG_USB.

include/linux/kconfig.h     71
#define IS_ENABLED(option) __or(IS_BUILTIN(option), IS_MODULE(option))

I will send patch to fix this. Thanks for finding it.

thanks,
-- Shuah
