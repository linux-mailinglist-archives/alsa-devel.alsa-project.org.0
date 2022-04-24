Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F87E50E1CC
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 15:32:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C974917EA;
	Mon, 25 Apr 2022 15:31:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C974917EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650893544;
	bh=B9WXEvMPCJfjtsoFAQ1oROQXG2hTvvFo/oCcE1/QGJ4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JE7tFQa6iFQrD3e28OYv1oMBRB23AFmqA6OrGpTciZFBaS7m7+xlA8Ij7fslax8aq
	 Yb/qY3lyX35wS2Dk5zV+Jd59f88pvoay66Uq/1Bdlh5+Z7FFMFHihc09RWIl9NhVFw
	 /Zzd4hhsYbm0kdL75IITfNbTJ/Nk0IGzS3Vhi18w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8CF2F8055B;
	Mon, 25 Apr 2022 15:27:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F36FF80163; Sun, 24 Apr 2022 04:09:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06E5CF80141
 for <alsa-devel@alsa-project.org>; Sun, 24 Apr 2022 04:09:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06E5CF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iMm7j9be"
Received: by mail-ot1-x332.google.com with SMTP id
 e15-20020a9d63cf000000b006054e65aaecso8383765otl.0
 for <alsa-devel@alsa-project.org>; Sat, 23 Apr 2022 19:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/4WY8lQ2r9E3jRayXo+cM/u5KEpSVq7T3K2hgqZLRN8=;
 b=iMm7j9be64nnY2we3kMeOQC5Pj129NrX5ABYhzCFQgIRJ+Ik/psrhjF5r/pmbNZvJy
 nA3uaouN4tuYuhiNIaHKYw+YwzjV+kJKW5pZWtDU0GTKWu//N59zGG1fdbP9tNgWJRjg
 AqNszvtPvjJNt2cEMqoWc2MQsq1/aQ70s6DAcNDBOaPYwZvIWFR4+Zb0ls+3EVu9eOAb
 KTSMm2n+k9g4CyFP8heqe4gzTDNSh2sRc5XtpvQCIpTgIm/O2folezzCln192gATJAVk
 i8DvmOlTzlnLi/wkKkSV70TYGsg4chRlc2jxJB+NXokPS/xNBOb/lAVbFPkYyy464S89
 OnjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/4WY8lQ2r9E3jRayXo+cM/u5KEpSVq7T3K2hgqZLRN8=;
 b=v7Wj+NNOkj+Us3C1Tz7DNVwhMWqSeCjgBXb1S1eq2HGLrCwtC0YOLV1F+bk6D8OURX
 UJrQP+lrdXG29oNpe13CFxgS0y/iLC8Z/AbUAM6AdJHJgWst2vvAzpD9DdUji7cGPUT6
 necb9QlcNXCXQUtzcXK7fJsk4ZmBVqi06TiSqi5QexEJEMbPY/Bspuqq1udto3wuJrw3
 pUS6P6UgD2+oiyK0KsGbszYUq5BkiOOusqRPCVmnAi9j/QrX720E6iP0PvBZ9j/pHnNp
 GNFUXOt88bjrhf8+m6NjyJv5iJlv1xZ9Dl1/enjUyvd/R6yhqXlVQWqp2xAm313lBkFV
 pWYQ==
X-Gm-Message-State: AOAM533CXy/Tx6aOg2AXXyCbln35oswhRm01hyCDnnNIxqqSlPC6jg4O
 Hfk/0WQy0ZhqbH9Q/6qLH+8=
X-Google-Smtp-Source: ABdhPJw1Nv7YurwGcrk889YKSXtPCE0PE6W5Bg0YNZLXIur1o0RT75r4zuYxuJBEQLPxL9fB1XCPwg==
X-Received: by 2002:a05:6830:2b29:b0:605:7cdb:f10b with SMTP id
 l41-20020a0568302b2900b006057cdbf10bmr4208370otv.157.1650766147578; 
 Sat, 23 Apr 2022 19:09:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 j126-20020acab984000000b002da77222b7dsm2325070oif.22.2022.04.23.19.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 19:09:06 -0700 (PDT)
Message-ID: <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
Date: Sat, 23 Apr 2022 19:09:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
 <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
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

On 4/23/22 12:55, Arnd Bergmann wrote:
> On Sat, Apr 23, 2022 at 1:41 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Sat, Apr 23, 2022 at 12:04:31AM +0200, Arnd Bergmann wrote:
>>> On Fri, Apr 22, 2022 at 10:55 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>> On 4/22/22 12:16, Arnd Bergmann wrote:
>>>>> On Fri, Apr 22, 2022 at 7:05 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>>>>
>>>>> Which machine did you hit this on? Is this on hardware or in qemu?
>>>>>
>>>> qemu, as always. borzoi, spitz, terrier, tosa, z2, and sx1 fail.
>>>> Also, I just noticed that the failure is not always the same.
>>>> z2 fails to boot from initrd, and sx1 fails to boot completely.
>>>
>>> That's a lot of machines failing, I hope at least we got the same bugs more
>>> than once here.
>>>
>>> For the I/O space, I found now that PXA was not using the standard
>>> virtual I/O address yet, but instead used a NULL-based offset.
>>>
>>> I'm not entirely happy with this patch, but this is an outline of what
>>> I think we need to fix that: https://pastebin.com/3nVgQsEw
>>> This one is probably incomplete, at least it breaks sa1100 for now,
>>> and it adds a bogus CONFIG_PCI dependency. I'm also not sure
>>> in what way the last patch in the series triggers it, rather than the
>>> one that removed mach/io.h.
>>>
>>> I had sx1 booting in qemu at least, with the omap1 multiplatform series only.
>>> If you have a custom config for this one, make sure you get the right
>>> DEBUG_LL address.
>>>
>>>> I'll do another round of bisects.
>>>
>>
>> Here is the bisect for the sx1 boot failure.
> 
> Odd, I can't reproduce this at all. Do you get any console output at
> all for this?
> 
> Is this the plain omap1_defconfig, or something else?
> 

No, it is my own sx1 specific configuration.

https://github.com/groeck/linux-build-test/blob/master/rootfs/arm/qemu_sx1_defconfig

I don't recall where I got it from but ...

> One thing I keep having to apply myself is this snippet:
> 
> diff --git a/arch/arm/mm/proc-arm925.S b/arch/arm/mm/proc-arm925.S
> index 0bfad62ea858..87c695703580 100644
> --- a/arch/arm/mm/proc-arm925.S
> +++ b/arch/arm/mm/proc-arm925.S
> @@ -441,7 +441,6 @@ __arm925_setup:
> 
>   #ifdef CONFIG_CPU_DCACHE_WRITETHROUGH
>          mov     r0, #4                          @ disable write-back
> on caches explicitly
> -       mcr     p15, 7, r0, c15, c0, 0
>   #endif

it does not have CONFIG_CPU_DCACHE_WRITETHROUGH enabled.

Guenter

> 
>          adr     r5, arm925_crval
> 
> I don't remember what the story is behind this, but I can't actually manage
> to boot omap1_defconfig on qemu with the instruction intact.
> 
>         Arnd

