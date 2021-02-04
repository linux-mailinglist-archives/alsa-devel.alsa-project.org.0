Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C75930F1A2
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 12:10:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3C40173A;
	Thu,  4 Feb 2021 12:09:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3C40173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612437007;
	bh=3JIvxTDaTXI58VTObFURnPKoZOFpSQYpnjpMDMtA8FE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=edosSdfIaWZQxgQR/r3tDpCLdmaZVbbRPHlndRwLEKCjwWvLm3OpusDRtaPyLnSug
	 h+BFT8KEVLfTGsaTzNHSmfF6SQltNaK1ZTUPAlwvqz9eZdR8tEvs/dLxnmkioetkMr
	 cgbcG8ye4PF0HG1yTl+ElZtodnCw5eDphcfaZfhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C334F80139;
	Thu,  4 Feb 2021 12:09:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D612F8021C; Thu,  4 Feb 2021 12:09:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA0C3F80155
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 12:09:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA0C3F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="eUUrmsSb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612436948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7n1Zx35K6Deya/aX+emtsNu6Y6NEAEqJ8jR2JgffGJA=;
 b=eUUrmsSbJyiAEbqu+9rZ8zK+pCRfKk6Jma0IOaGiqm3tFwiCWl3Hvh2fVut+l1WDGhSDNe
 bDjQemxayn13MYb5l6hQpMXESTqxj4B0VUyNF44c6bLaozXsIaGAp6Fz3p3YairDSC1+gu
 zDuHxLSqPgJIvh96QoB4ZuNLF0c9qxI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-WIQEWz0iP4-dalYQcqPD9Q-1; Thu, 04 Feb 2021 06:09:06 -0500
X-MC-Unique: WIQEWz0iP4-dalYQcqPD9Q-1
Received: by mail-ej1-f72.google.com with SMTP id jg11so2397621ejc.23
 for <alsa-devel@alsa-project.org>; Thu, 04 Feb 2021 03:09:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7n1Zx35K6Deya/aX+emtsNu6Y6NEAEqJ8jR2JgffGJA=;
 b=rOUS5G12rJCC3nJbk3P/gPoLqB2OQQmaNi82h3nwyBVsydHvxLNU8CgUBDW0eZkOZe
 /f2IP/3W+WNeYUImgtxygqefHZus6VkB7fU3T/ta59FbY/bWxeaTErvNP91C2sNA9upS
 wixof95+GnzvkX0aotD+tMyUKPzTnMJDH4LZ2WRE3ZEcwn6rrYU4qqbFgDljhYgoJT5P
 msfJM8uAhZ1DZNhMOaJJSPBTSfJ3W6Xn0AU98u6gSjz2sfNxTDe8I6Fvmsj8oe95OOUD
 rapHKnRTWqFD3uG6jrBvBnNErvqxsZ41SUg0kR6jKmXzlzVhw9w314o2et145KcI9Uqi
 vaQw==
X-Gm-Message-State: AOAM5302EmUhk/VAfBXG9js2nWhTiMF4bhHWhXj4Y2ADa3Urwag6V9Ax
 fxiMfWRF119jKdFa5hb6pVbTD2R569+zN4uvwzVqHvIDXkDDCZLqaJb5xY0gQ9IXQvD0hiVTfqK
 y1sYOMrVpxVAH1l95atpYIY+oRRSK0LnML6Ql9Yiq5+EjbxLGYFu1eJM3KRA2XPxZ09cohx3Itj
 8=
X-Received: by 2002:a50:eacd:: with SMTP id u13mr7277331edp.382.1612436944956; 
 Thu, 04 Feb 2021 03:09:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGuuzsbw84IJLIU4lz2LAP6PzugOgBr0KFhBNcmyfRgNpmW6u6KnBMr6frXkyCEaJ8TAHcQA==
X-Received: by 2002:a50:eacd:: with SMTP id u13mr7277258edp.382.1612436943892; 
 Thu, 04 Feb 2021 03:09:03 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id u23sm2287523edt.87.2021.02.04.03.09.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 03:09:03 -0800 (PST)
Subject: Re: [PATCH v4 00/13] MFD/extcon/ASoC: Rework arizona codec
 jack-detect support
To: Lee Jones <lee.jones@linaro.org>
References: <20210123121313.79530-1-hdegoede@redhat.com>
 <20210204110539.GE2789116@dell>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <3c996ea7-57dc-11ba-adc1-15fb7b97f107@redhat.com>
Date: Thu, 4 Feb 2021 12:09:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210204110539.GE2789116@dell>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>
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

On 2/4/21 12:05 PM, Lee Jones wrote:
> On Sat, 23 Jan 2021, Hans de Goede wrote:
> 
>> Hi all,
>>
>> Here is v4 of my series to rework the arizona codec jack-detect support
>> to use the snd_soc_jack helpers instead of direct extcon reporting.
>>
>> This is done by reworking the extcon driver into an arizona-jackdet
>> library and then modifying the codec drivers to use that directly,
>> replacing the old separate extcon child-devices and extcon-driver.
>>
>> This brings the arizona-codec jack-detect handling inline with how
>> all other ASoC codec driver do this. This was developed and tested on
>> a Lenovo Yoga Tablet 1051L with a WM5102 codec.
>>
>> There are various interdependencies between the patches in this
>> series, so IMHO it would be best if this entire series would be merged
>> through the MFD tree.
>>
>> Note this series applies on top of my "[PATCH v4 0/5] MFD/ASoC: Add
>> support for Intel Bay Trail boards with WM5102 codec" series.
>>
>> Changes in v4:
>> - Add sound/soc/codecs/arizona-jack.c to the WOLFSON MICROELECTRONICS DRIVERS
>>   MAINTAINERS section
>> - Small codying style tweaks to the "ASoC: arizona-jack: Cleanup logging" patch
>>
>> Changes in v3:
>> - Move the bugfix patches to earlier in the series so that they
>>   apply to drivers/extcon/extcon-arizona.c so that they can be
>>   cherry-picked into the stable series
>> - Split runtime_pm_get -> runtime_pm_get_sync changes out into their
>>   own patch
>> - Simply move drivers/extcon/extcon-arizona.c to
>>   sound/soc/codecs/arizona-jack.c instead of first adding arizona-jack.c
>>   as a copy and then later removing extcon-arizona.c
>> - Some other small tweaks, see individual patch changelogs
>>
>> Regards,
>>
>> Hans
>>
>>
>> Hans de Goede (13):
>>   mfd: arizona: Drop arizona-extcon cells
>>   extcon: arizona: Fix some issues when HPDET IRQ fires after the jack
>>     has been unplugged
>>   extcon: arizona: Fix various races on driver unbind
>>   extcon: arizona: Fix flags parameter to the gpiod_get("wlf,micd-pol")
>>     call
>>   extcon: arizona: Always use pm_runtime_get_sync() when we need the
>>     device to be awake
>>   ASoC/extcon: arizona: Move arizona jack code to
>>     sound/soc/codecs/arizona-jack.c
>>   ASoC: arizona-jack: Move jack-detect variables to struct arizona_priv
>>   ASoC: arizona-jack: Use arizona->dev for runtime-pm
>>   ASoC: arizona-jack: convert into a helper library for codec drivers
>>   ASoC: arizona-jack: Use snd_soc_jack to report jack events
>>   ASoC: arizona-jack: Cleanup logging
>>   ASoC: arizona: Make the wm5102, wm5110, wm8997 and wm8998 drivers use
>>     the new jack library
> 
>>   ASoC: Intel: bytcr_wm5102: Add jack detect support
> 
> Can't apply this patch ...
> 
>>  MAINTAINERS                                   |   3 +-
>>  drivers/extcon/Kconfig                        |   8 -
>>  drivers/extcon/Makefile                       |   1 -
>>  drivers/mfd/arizona-core.c                    |  20 -
>>  sound/soc/codecs/Makefile                     |   2 +-
>>  .../soc/codecs/arizona-jack.c                 | 577 +++++++-----------
>>  sound/soc/codecs/arizona.h                    |  44 ++
>>  sound/soc/codecs/wm5102.c                     |  12 +-
>>  sound/soc/codecs/wm5110.c                     |  12 +-
>>  sound/soc/codecs/wm8997.c                     |  14 +-
>>  sound/soc/codecs/wm8998.c                     |   9 +
>>  sound/soc/intel/boards/bytcr_wm5102.c         |  28 +-
> 
> ... since this file doesn't exist?

As mentioned this is a follow-up series on top of the:

"[PATCH v4 0/5] MFD/ASoC: Add support for Intel Bay Trail boards with WM5102 codec"

Series, that series adds that file.

Regards,

Hans

p.s.

Do you want a resend of this one, with the new *-bys added too ?

