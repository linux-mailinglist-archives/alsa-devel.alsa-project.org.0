Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF1350E1DF
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 15:32:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14C1017F7;
	Mon, 25 Apr 2022 15:32:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14C1017F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650893578;
	bh=otEwWf7cMu3vg+NWlsM6CNtLzeg/hdgkxBPwIwBB4e4=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bJJhwTBCktXFdwKy05n72VRJJoYVVW1KFEF4+ZJFIyP1ewPfhhA90JWJXajzChTjI
	 8SdtloMEy8XyMQh9z21qRDXSA5YP0roc/68QzbP2l8hOxlj7BllbHeFU1FsR5cNVT+
	 JkUcX4kCMx0SnJnC+ckCa+EaRc6eABRYw8I6J+Vs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13B1AF80579;
	Mon, 25 Apr 2022 15:28:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25F85F80163; Sun, 24 Apr 2022 17:28:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B2A6F80109
 for <alsa-devel@alsa-project.org>; Sun, 24 Apr 2022 17:28:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B2A6F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YTsJBncP"
Received: by mail-oi1-x22a.google.com with SMTP id b188so14522905oia.13
 for <alsa-devel@alsa-project.org>; Sun, 24 Apr 2022 08:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :cc:references:from:subject:in-reply-to:content-transfer-encoding;
 bh=yr0/AkbMMu8pn1dkU35YlQmF7na7yjrNnK/horRQvq8=;
 b=YTsJBncPwlsdJoy0clMDPkRYsap010NbelrrDwP4gT2p8VkAeOwyCadOMVg4EkLC3g
 BU6v4rcHRP7TcChruJdux/6WqtJmUToOWUlOimc0ldD0p/STL+v6YSxQqTz/SiEj3JGk
 6SfYzDXOC60C+Zk6YtFsjMz2c7gYsvaefbEF/eKAM03STJHCFm25OuC/Z0YH/2cfNqkA
 U538FM4O480tv4oZ6rwPTTcYDvIV4RyyrEvA6n7gY5KKJPB4B+s22HrjImpN8j9osv2G
 SEdJ9k63zxNOgRDgM+KmfcxMquHhbq8CJJjUKerT4sEDujG7ogRPrwOnyNIjdLCE9lFh
 BU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=yr0/AkbMMu8pn1dkU35YlQmF7na7yjrNnK/horRQvq8=;
 b=b3LGQgd/F+1yIqcRjt7CJShYB2B2+yZl/L3hVXUOx0P0hJPRmTGzQXPx7/ee3WSS5Y
 6GTITt0O/j/OoQGR0ND9nilBeb1m1hsy8/8EXiyUt05ZuvawsF4QKEpvk+vTZWjVw0NX
 riDxIm6W3BO3DmzSlPD2AIYmTMkI5VmlbMQKUuw5HkKXQXm5nbV3OsYawKA2uLQKpqTD
 k2loJQ7WV5AyNpyY1sRdshrfgqMVRnUBIijL0cfc//2H5kUcTYgFLkVjRQZez3rBAsst
 tHUiC/JaCd+Y78Nd86PHEprqzAjXABJDbzxu8joz7N0w3Dtzqj8OFCvWL14ssHJQlMti
 K7kQ==
X-Gm-Message-State: AOAM531f8ZJwX47b5P8Tc0I0aDrkYNJrCcIiYJBRKS3+dkQNSWqaWIf4
 LbTCQje8Dluu2jxg5SoCb78=
X-Google-Smtp-Source: ABdhPJy+gDyQI+jYYZai2x5URiEV01l+fMZDWT8YjU8/GgIriEk0FB5ZVdkvpb6NfVQx+IMk0aUfQA==
X-Received: by 2002:aca:f286:0:b0:2da:58ba:c578 with SMTP id
 q128-20020acaf286000000b002da58bac578mr6576017oih.127.1650814104777; 
 Sun, 24 Apr 2022 08:28:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a056830410800b00605b48122eesm53063ott.14.2022.04.24.08.28.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Apr 2022 08:28:23 -0700 (PDT)
Message-ID: <3df135a2-17f5-d6c6-b4a8-e1a60e254297@roeck-us.net>
Date: Sun, 24 Apr 2022 08:28:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
 <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
 <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
 <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
In-Reply-To: <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 25 Apr 2022 15:27:44 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 Philipp Zabel <philipp.zabel@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Tomas Cech <sleep_walker@suse.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-clk <linux-clk@vger.kernel.org>, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>,
 Michael Turquette <mturquette@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Daniel Mack <daniel@zonque.org>
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

On 4/24/22 01:52, Arnd Bergmann wrote:
> On Sun, Apr 24, 2022 at 4:09 AM Guenter Roeck <linux@roeck-us.net> wrote:
>> On 4/23/22 12:55, Arnd Bergmann wrote:
>>> On Sat, Apr 23, 2022 at 1:41 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>> On Sat, Apr 23, 2022 at 12:04:31AM +0200, Arnd Bergmann wrote:
>>>
>>> Odd, I can't reproduce this at all. Do you get any console output at
>>> all for this?
>>>
>>> Is this the plain omap1_defconfig, or something else?
>>>
>>
>> No, it is my own sx1 specific configuration.
>>
>> https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/qemu_sx1_defconfig
>>
>> I don't recall where I got it from but ...
> 
> Ok, that explains it, thanks!
> 
> I fixed all the defconfig files that come with the kernel, but for your own
> ones you have to add
> 
> # CONFIG_ARCH_MULTI_V7 is not set
> 
> into the defconfig file, otherwise the multiplatform target defaults to
> an ARMv7 instead of ARMv5 build. For an OMAP15xx as in the SX1,
> you also need to enable CONFIG_ARCH_MULTI_V4T.
> 
> This is slightly unfortunate, but I don't see any way to avoid it, and the
> modified defconfig will still work fine with older kernel trees.
> 

Yes, that works. I changed it in my configuration.

>>> One thing I keep having to apply myself is this snippet:
>>>
>>> diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
>>> index 0bfad62ea858..87c695703580 100644
>>> --- a/arch/arm/mm/proc-arm925.S
>>> +++ b/arch/arm/mm/proc-arm925.S
>>> @@ -441,7 +441,6 @@ __arm925_setup:
>>>
>>>    #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
>>>           mov     r0, #4                          @ disable write-back
>>> on caches explicitly
>>> -       mcr     p15, 7, r0, c15, c0, 0
>>>    #endif
>>
>> it does not have CONFIG_CPU_DCACHE_WRITETHROUGH enabled.
> 
> Maybe it was disabled explicitly for the sx1_defconfig because of this
> bug. I would think that this is required for actual sx1 hardware because the
> option is default-enabled for ARM925T, and that CPU core is exclusively
> used in OMAP15xx.
> 

That looks like a bug in qemu. ARM925T instruction support is limited to V4T
instructions. qemu doesn't have explicit 5T support. It is either V4T
or V5.

Guenter
