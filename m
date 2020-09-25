Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3D2278D73
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Sep 2020 17:59:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4065218B8;
	Fri, 25 Sep 2020 17:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4065218B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601049562;
	bh=eaI8QwcW101b6PGcfo6xt9NITCNjPhp+M5/23zs+drg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DCJcjzGiKvyBycd88DZeuL7aTSEcDXNlnh3I06VXd6ngOggZS9MaSct7LYYd2+LX/
	 xPWg9tgkxN+IQtn2YDOkCb6zw+9KMPUMH0lM9zC35kYBWy1gKIZ4mA7bM05nfV+vr+
	 3q6pys+n/X+9jBM6S28cJsfbiiA3mcejtfWJgCys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C7E6F801EC;
	Fri, 25 Sep 2020 17:57:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C331F801EB; Fri, 25 Sep 2020 17:57:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53AD6F80162
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 17:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53AD6F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="MAA7kqfx"
Received: by mail-io1-xd41.google.com with SMTP id z13so3257272iom.8
 for <alsa-devel@alsa-project.org>; Fri, 25 Sep 2020 08:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+T1vJpfGM0DJ7LWYNS1cQt+Wu4UnQDKYhsfLhTZbH8U=;
 b=MAA7kqfxNIq1GJqYRvGDYa7Yc6+mwjNJqsgEKROsjA3rHliSG+UT9inF1Zxtrsuri5
 KnZEI3PuiZL4Z82UCIo4bbbKnxfwH9/5Ulpb/DGYMjMhQeC0K93dqo1cdCVXkrcKZLUj
 yGQ9hSoEjIJyXp9TqOHeILyP2Q4k91xmg+IzGdedCy/BfZIV1S3GSZvvXFOS8ga6BTX8
 iTANGRsIvlEWy1/lBA2Dvhsaq1ZOzUYvw/iK+UFU0KAONQQcJpDhSEUtnlu7HKT0LDOD
 ocuviY06Fu4ppi/Zx6WUMTbNUiy8sGH0ULTEuEw/KR2XUbC8ABg5BcR/iJ7ynLv5Wlol
 svmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+T1vJpfGM0DJ7LWYNS1cQt+Wu4UnQDKYhsfLhTZbH8U=;
 b=fUxfiDRV34Wi81fXcqOXomz+m0TGfN6I8C5PN1BnCDXO7H3LhsZbu9IZqzmPwBNQOB
 2F1AWmM++nkDwx66Y6uCEfw2v4Bas4rJAKdEyOGAD9xRdALcV4PJQDxPSRu5Rla4Mlds
 q9WS0rwSto4wNg+yM03GhdCZYX55dsdz4SE6Pv4Ou6Y3gJs2LNLkSe3xxmXD+xBDc/qf
 9mH5PpJa7TaInn6nYtV65JsDpj6aPyV8lOtnSq6ihI85+A0bSUHKwj0BYdjQAVis37mm
 5vOpbYFcNaQdS+1t9uYzGJUe2w4SbbCHnpnZZsAQz6w72Fw+RdAnu4egTouSB8tG7qEt
 MzTA==
X-Gm-Message-State: AOAM533a+itucQDJd7PxUF4HkqQsmGBcWpxRM0+n4CmW3L4rifG2qoeR
 iQDQUExt8NBp0AWyi5xHrMgJeg==
X-Google-Smtp-Source: ABdhPJyhFEqzKYVEnagNrOoxsliKLjUGakRFPavAnpXl/f7JyHElUsNT3IpEORIIUTPhLwFTJfyDoA==
X-Received: by 2002:a05:6602:6c9:: with SMTP id n9mr706181iox.91.1601049449252; 
 Fri, 25 Sep 2020 08:57:29 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id e9sm1648359ilr.20.2020.09.25.08.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Sep 2020 08:57:28 -0700 (PDT)
Subject: Re: [PATCH 3/3] [PATCH] staging: greybus: __u8 is sufficient for
 snd_ctl_elem_type_t and snd_ctl_elem_iface_t
To: Coiby Xu <coiby.xu@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20200924102039.43895-1-coiby.xu@gmail.com>
 <20200924102039.43895-3-coiby.xu@gmail.com>
 <20200924110057.GA319713@kroah.com> <20200925140732.lqkxa3rb3beg5lm3@Rk>
From: Alex Elder <elder@linaro.org>
Message-ID: <8e613bb6-6093-cb81-3fa1-e6583837c843@linaro.org>
Date: Fri, 25 Sep 2020 10:57:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925140732.lqkxa3rb3beg5lm3@Rk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devel@driverdev.osuosl.org,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Vaibhav Agarwal <vaibhav.sr@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Greer <mgreer@animalcreek.com>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 Johan Hovold <johan@kernel.org>
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

On 9/25/20 9:07 AM, Coiby Xu wrote:
> On Thu, Sep 24, 2020 at 01:00:57PM +0200, Greg Kroah-Hartman wrote:
>> On Thu, Sep 24, 2020 at 06:20:39PM +0800, Coiby Xu wrote:
>>> Use __8 to replace int and remove the unnecessary __bitwise type 
>>> attribute.
>>>
>>> Found by sparse,

. . .

>>> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
>>> index 535a7229e1d9..8e71a95644ab 100644
>>> --- a/include/uapi/sound/asound.h
>>> +++ b/include/uapi/sound/asound.h
>>> @@ -950,7 +950,7 @@ struct snd_ctl_card_info {
>>>      unsigned char components[128];    /* card components / fine 
>>> identification, delimited with one space (AC97 etc..) */
>>>  };
>>>
>>> -typedef int __bitwise snd_ctl_elem_type_t;
>>> +typedef __u8 snd_ctl_elem_type_t;
>>>  #define    SNDRV_CTL_ELEM_TYPE_NONE    ((__force 
>>> snd_ctl_elem_type_t) 0) /* invalid */
>>>  #define    SNDRV_CTL_ELEM_TYPE_BOOLEAN    ((__force 
>>> snd_ctl_elem_type_t) 1) /* boolean type */
>>>  #define    SNDRV_CTL_ELEM_TYPE_INTEGER    ((__force 
>>> snd_ctl_elem_type_t) 2) /* integer type */
>>> @@ -960,7 +960,7 @@ typedef int __bitwise snd_ctl_elem_type_t;
>>>  #define    SNDRV_CTL_ELEM_TYPE_INTEGER64    ((__force 
>>> snd_ctl_elem_type_t) 6) /* 64-bit integer type */
>>>  #define    SNDRV_CTL_ELEM_TYPE_LAST    SNDRV_CTL_ELEM_TYPE_INTEGER64
>>>
>>> -typedef int __bitwise snd_ctl_elem_iface_t;
>>> +typedef __u8 snd_ctl_elem_iface_t;
>>>  #define    SNDRV_CTL_ELEM_IFACE_CARD    ((__force 
>>> snd_ctl_elem_iface_t) 0) /* global control */
>>>  #define    SNDRV_CTL_ELEM_IFACE_HWDEP    ((__force 
>>> snd_ctl_elem_iface_t) 1) /* hardware dependent device */
>>>  #define    SNDRV_CTL_ELEM_IFACE_MIXER    ((__force 
>>> snd_ctl_elem_iface_t) 2) /* virtual mixer device */
>>
>> I can't take a uapi sound header file patch along with a driver change,
>> these need to be independant.
> 
> Thank you and Alex for reminding me this is a change of public header!
>>
>> And this is a userspace api, you just changed the size of an externally
>> facing variable, are you _SURE_ that is ok to do?
> 
> The reasons I make this change are, 1) using int to represent 7 enumeration
> values seems to be overkill; 2) using one type could avoid worries
> about byte order.

(1) might be a valid suggestion, but the file you suggest
changing is part of the Linux user space API, which you
basically can't change.

I'm fairly certain the user space API is defined to have
CPU-local byte order (unless specified explicitly otherwise)
so that is not a concern.

> I examine one userspace example (libalsa-intf/alsa_mixer.c [1]). This
> change won't cause compiling breakage. But I don't the experience to
> imagine any other bad consequence.

As a rule, once the user space API has been established, it
stays with us forever.  You can add to it, but modifying
(or removing) an existing interface is essentially forbidden.

> Another way to avoid userspace API change is to let
> "struct gb_audio_ctl_elem_info" use snd_ctl_elem_iface_t type which may
> be more elegant than using "__force" as suggested by Alex,

The Greybus definitions were explicitly defined to be
operating system independent.  For that reason there are
(admittedly cumbersome) definitions of certain types and
values that essentially mimic those defined by Linux
exactly  That way Linux (or another system using Greybus)
can change its internal values without changing the
Greybus API definition.  (This addresses the concern you
mention below.)

What you are suggesting is not consistent with that
principle.

					-Alex


> $ git diff
> diff --git a/include/linux/greybus/greybus_protocols.h 
> b/include/linux/greybus/greybus_protocols.h
> index aeb8f9243545..7f6753ec7ef7 100644
> --- a/include/linux/greybus/greybus_protocols.h
> +++ b/include/linux/greybus/greybus_protocols.h
> @@ -8,6 +8,7 @@
>   #define __GREYBUS_PROTOCOLS_H
> 
>   #include <linux/types.h>
> +#include <sound/asound.h>
> 
>   /* Fixed IDs for control/svc protocols */
> 
> @@ -1997,7 +1998,7 @@ struct gb_audio_enumerated {
>   } __packed;
> 
>   struct gb_audio_ctl_elem_info { /* See snd_ctl_elem_info in Linux 
> source */
> -       __u8            type;           /* GB_AUDIO_CTL_ELEM_TYPE_* */
> +       snd_ctl_elem_type_t             type;           /* 
> GB_AUDIO_CTL_ELEM_TYPE_* */
>          __le16          dimen[4];
>          union {
>                  struct gb_audio_integer         integer
> 
> My only concern is if greybus authors have any special reason to not 
> include
> sound/asound.h in the first place and re-define things like 
> SNDRV_CTL_ELEM_TYPE_*,
> 
> /* See SNDRV_CTL_ELEM_TYPE_* in Linux source */
> #define GB_AUDIO_CTL_ELEM_TYPE_BOOLEAN        0x01
> #define GB_AUDIO_CTL_ELEM_TYPE_INTEGER        0x02
> 
> /* See SNDRV_CTL_ELEM_IFACE_* in Linux source */
> #define GB_AUDIO_CTL_ELEM_IFACE_CARD        0x00
> ...
> 
> /* SNDRV_CTL_ELEM_ACCESS_* in Linux source */
> #define GB_AUDIO_ACCESS_READ            BIT(0)
> ...
> 
> [1] 
> https://gitlab.com/Codeaurora/platform_hardware_qcom_audio/-/blob/aee6032826ec7c8b6edda404422fda0ef40ec2db/libalsa-intf/alsa_mixer.c 
> 
>   alsa_mixer.c
>>
>> thanks,
>>
>> greg k-h
> 
> -- 
> Best regards,
> Coiby

