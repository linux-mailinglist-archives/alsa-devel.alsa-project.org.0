Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD884388ECD
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 15:17:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56146167E;
	Wed, 19 May 2021 15:16:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56146167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621430242;
	bh=s2ZiLX0oxaYiG5Uyl4cMEnqwcLMqFNuPgzn6NGQMww8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZWMkKuwqHHDtz2IQmwoX0b5mwPzLi4X1BtSP3bzfY0oFIHPUSqYbNJw6rrxn1W7Fq
	 E3hP9M9S9hNV2c9qk0zsqrYveLABkU4XoHg8DsHvg3L6oVYAMULF68SPfiCKUaTCTY
	 YqBt9MY5XQvXb9Nm0zGAfF/yNj6X8/7l41KntrpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6D14F80153;
	Wed, 19 May 2021 15:15:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C649AF8016E; Wed, 19 May 2021 15:15:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12DECF80148
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 15:15:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12DECF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="T5nB4YJN"
Received: by mail-lf1-x130.google.com with SMTP id z13so19027188lft.1
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 06:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9RcQ9v9QPlq03Y26uBjbqA7L/wB0h2ultT6e+0JtppE=;
 b=T5nB4YJNlamqRp4SvsAcy8JKObamBWOsiCQRt+EFUPpScmK3beaXK7G9gmFoG9XJO0
 1jMwc7JMw9fMX6Bwd3y+d59vrVdrRjD0nBwL+qZuNNf2waw8jWJIWtK0sYw+21BCuQZ9
 CXq1oGOChiaJjG4Oqztagnf7iQM+5Ib6H5f+jga1YfQXBe5pYGUd9tPst+T72NLVWLDm
 tFL3YCknrwyPiveDKWFoZZiyn8OunU1n3d72tM62tQYmS2Zexkq9uFXCrv6KDLEbHwPX
 AZUwhkzSZAi08yWac0ItMHZ/8/+wHMgQoK/sKytfInxnsacauCFFRRuvXD5gEXl8qL35
 XBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9RcQ9v9QPlq03Y26uBjbqA7L/wB0h2ultT6e+0JtppE=;
 b=PBDLnK9nXeR1YhYclJrHKb0L2FiF/0jnLcsX7veC5N1iGCCtn9cZsqYqMPlKd1LGJT
 Hpaqze1ox+w0SVCMGvrq34+Dzr3fnLHTBDjKVGsq1p7G0mnolsvdm3w2+4VlH0pkbBil
 vXP19F7FL8GA+cj8qtkeFr0iE+TH5WBGOvYm7pgS1r/JRftB6L+Iy/5T+Hle1ydUOqw9
 DsZHz41z435SzXm7ltszPjrgYmuX3/MqtTJydiV/teedXNuQbd2koxqnJMK9tgiCeiqT
 tE6pHs0o+n0+Uh9zzEPFcrMh6HOGkHnE/labUPa1Sh8Jcg+ynIHw6m6049n2AKWjco7l
 Z9yg==
X-Gm-Message-State: AOAM530csgJa1MUW/HMowPftFQ4w+l/NAhgRRkm4uWxcUvm0RmkDuF3c
 4fbhlt9pajB8dlAk1zJtJlw=
X-Google-Smtp-Source: ABdhPJy0QFH+MbToxjV7XSE4yKRM7FG24t3G2GHywRQOcMMQ0RSq/bRfX66NLC10V0zEVYnT5YxhKQ==
X-Received: by 2002:a05:6512:3d2:: with SMTP id
 w18mr8489263lfp.573.1621430144965; 
 Wed, 19 May 2021 06:15:44 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-55.dynamic.spd-mgts.ru.
 [109.252.193.55])
 by smtp.googlemail.com with ESMTPSA id c7sm2612193lfv.27.2021.05.19.06.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 06:15:44 -0700 (PDT)
Subject: Re: Question about Tegra UCMs
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>
References: <20210518001356.19227-1-digetx@gmail.com>
 <20210518001356.19227-3-digetx@gmail.com>
 <20210518180949.GA949047@robh.at.kernel.org>
 <20210518183455.GE4358@sirena.org.uk>
 <92cef674-c454-e08c-b44d-d8c08b1e8ccf@gmail.com>
 <562efe35-dd91-12a0-96a5-b8f4f34ea153@perex.cz>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d5944fc0-4f8a-9881-c336-b418d76540c5@gmail.com>
Date: Wed, 19 May 2021 16:15:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <562efe35-dd91-12a0-96a5-b8f4f34ea153@perex.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Ion Agorria <ion@agorria.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Rob Herring <robh@kernel.org>
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

19.05.2021 14:13, Jaroslav Kysela пишет:
> Dne 19. 05. 21 v 0:31 Dmitry Osipenko napsal(a):
>> Mark, could you please help me to understand the UCM naming scheme that ALSA uses..
>>
>> About a year ago I tried to complain to Jaroslav Kysela in a comment to the UCM change [1] that it should be breaking the naming scheme of Tegra UCMs, but haven't got a meaningful reply and moved on to other things.
>>
>> [1] https://github.com/alsa-project/alsa-ucm-conf/commit/8ff2d50745efbb6959324f672460e413f0b618b8
> 
> I'm sorry about that, but it's better to create a tracked ticket (issue or
> pull request).
> 
>> Today I noticed that the naming scheme changed again and I still don't understand what to do about it.
>>
>> I have two devices:
>>
>>  1. Acer Picasso tablet that uses "Acer Iconia Tab A500 WM8903" for the card model name.
>>
>>  2. Google Nexus 7 that uses "ASUS Google Nexus 7 ALC5642".
>>
>> Previously UCMs were picked up by pulseaudio from these paths:
>>
>>  1. /usr/share/alsa/ucm2/Acer Iconia Tab A500 WM8903/
>>  2. /usr/share/alsa/ucm2/ASUS Google Nexus 7 ALC5642/
>>
>> Now the lookup paths are changed to:
>>
>>  1. /usr/share/alsa/ucm2/Acer_Iconia_Tab/
>>  2. /usr/share/alsa/ucm2/ASUS_Google_Nex/
> 
> Yes, it's based on the driver name (which is incorrectly set /or not set/ in
> your case).
> 
> Lookup paths (with description):
> 
> https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/ucm.conf
> 
> The latest scheme is even different - lookups were moved to ucm2/conf.d with
> redirection to the more descriptive layered configuration tree structure, so
> the other developers can immediately identify the hardware which is
> configured. See Qualcomm examples. The long card names does not help us so much.
> 
>> Strace shows that pulseaudio searches UCMs only at these paths.
>>
>> The output of /proc/asound/cards:
>>
>>  0 [WM8903         ]: Acer_Iconia_Tab - Acer Iconia Tab A500 WM8903
>>                       Acer Iconia Tab A500 WM8903
>>
>>  0 [ALC5642        ]: ASUS_Google_Nex - ASUS Google Nexus 7 ALC5642
>>                       ASUS Google Nexus 7 ALC5642
> 
> Fields are explained in:
> 
> https://github.com/alsa-project/alsa-ucm-conf/blob/master/ucm2/README.md
> 
>> Is there anything on the kernel side that I could change to get a working naming scheme? If yes, I may try to do something about it in the v2, thanks in advance.
> 
> Try to set a meaningful driver name (usually the code handling the ASoC card
> creation). It should be very close to the kernel module name (but more user
> friendly). The current code for your hardware use the auto-generated driver
> name from the ALSA long name.

The current name isn't auto-generated, it's specified via the
nvidia,model device-tree property.

> Then try to reuse the existing configs - for example your Nexus 7 config has
> many blocks from codecs/rt5640/* .
> 
> Anyway, create a PR so we can discuss the details.

I will create the PR, thank you very much. It's important problem which
can't be postponed anymore since sound doesn't work without UCMs on
Tegra devices.
