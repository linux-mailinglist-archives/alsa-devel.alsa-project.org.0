Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 665F73BBE08
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jul 2021 16:11:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D522A16A6;
	Mon,  5 Jul 2021 16:11:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D522A16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625494311;
	bh=NTldhNPsZnPfESfW6fZ/KzqvGzIpBUD3krnP2hFNQ58=;
	h=To:References:From:Subject:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s70TKyWACdoLNdodjpI4tFO9jrQcUnkyYli3FILDUxD6V1rlLqGLFLJBVSw+FCYuS
	 Sfn1GxYhDd93ENTlJyD59hkE0QJRp3HVMANXTR3ETCdNdSJOMH5nTLENRgCPTedE6m
	 +vUppSxo4EWeANk5H3Z1urYZaW/pZuy143oMbaKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 320F3F8025C;
	Mon,  5 Jul 2021 16:10:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2329F80224; Mon,  5 Jul 2021 16:10:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1749F8014E
 for <alsa-devel@alsa-project.org>; Mon,  5 Jul 2021 16:10:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1749F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Xi/LY6n7"
Received: by mail-lj1-x22e.google.com with SMTP id r16so24808276ljk.9
 for <alsa-devel@alsa-project.org>; Mon, 05 Jul 2021 07:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OdZYTiftP3sztHkdp6OFT92fCx9XkufzdKaqoXE/Mzg=;
 b=Xi/LY6n7Ocia1kSXm+s2WiwqWgNETA3QeaJgaP/f/uBSdziCLAzBswETzqcohamZbP
 befyWbXrKFIikXx/SSzs4DoatFjrpnS+XexUfZ8zTcTzB/LDHblf3Oxuj4DX9E/dYO6C
 IzWQs1HeNmgDcCaHJNZ5JNYg/mLe/AQXdkG18otZyAktwLJe5fxRv8n4gGvjnFmhDT18
 W96Y4fDcZO7IgtlnEm21hlie34vO8xxmZEFcIMplFMKHXGUozvYC48SN72hDtHwaPWmk
 AFyeXVtZlzvUmCMhTzfAvHEwMn2SZ5mJkxIs6UBP1iht2LCdL5A5L0LL/eQ+6lN2AdCh
 sZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OdZYTiftP3sztHkdp6OFT92fCx9XkufzdKaqoXE/Mzg=;
 b=MfmSrRxZfHVv/zUWOGNPPsRkucD3HI0mfBgVFvbusHlDfQWn9JVcFoySYTRQcRvpCC
 LDZdQK4XAMDEUkTy3c76IotAmEBpHXQK1pKp6l6i3D2Li1Kdt0vN8lJ4e5lnfElB0j6Z
 2WNPs6zhhESDnTAnLNIyXRivq8HNU7iioGTOMLXj2qE3eLVKpyU+DY/mExzxBSZPoqbR
 c/BfDjqrQS+APuJoWaCzZNlDdwKdUYh+Rq7UavblcBZYwUWZQNqAWJjB81hvQBNxm9R+
 zJs4YeM+vILnn2+zn5EUTY1hHHfm8vRE8a6xK7YuDpbbCM3JlLJYlIrEIpxsyI4JzHw1
 EFuA==
X-Gm-Message-State: AOAM533NFzxweGH7S4mwizWSUplMyL+vunouD775QIkVY6fxX7b3DUvN
 79zAD5cWR+eo/Alpg+mZAnQ=
X-Google-Smtp-Source: ABdhPJxiJcAfWRp9SnmDGTyaqdBgXo8GaVL7MZv37XgiNc2RTU6bYGKpfovOTE/FGAXGjg0841AOxg==
X-Received: by 2002:a2e:9f4c:: with SMTP id v12mr11240593ljk.179.1625494209278; 
 Mon, 05 Jul 2021 07:10:09 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id d4sm245484lfv.0.2021.07.05.07.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 07:10:08 -0700 (PDT)
To: "H. Nikolaus Schaller" <hns@goldelico.com>
References: <20210704150450.20106-1-peter.ujfalusi@gmail.com>
 <E1C17C0D-1363-4109-89B3-A652A2B47703@goldelico.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode and OMAP4
 support
Message-ID: <e7a02ee7-6c44-f3e1-f3e7-19e908790246@gmail.com>
Date: Mon, 5 Jul 2021 17:10:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <E1C17C0D-1363-4109-89B3-A652A2B47703@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: tony@atomide.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com,
 linux-omap@vger.kernel.org
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

Hi Nikolaus,

On 05/07/2021 16:32, H. Nikolaus Schaller wrote:
> Hi Péter,
> 
>> Am 04.07.2021 um 17:04 schrieb Peter Ujfalusi <peter.ujfalusi@gmail.com>:
>>
>> Hi,
>>
>> it has been on my todo list for several years to support McASP on OMAP4 devices.
>> For Galaxy Nexus we had an omap-mcasp driver (which was mostly a stripped down
>> davinci-mcasp driver) to support what was needed on that specific phone + it's
>> dock for S/PDIF (48KHz, 16bit, stereo).
>>
>> Not many (if any) device available to test the DIT mode of McASP.
>> I have used BeagleBone White (McASP1 AXR3 can be routed to a pin) to get the
>> S/PDIF mode working then PandaES for OMAP4 support (on PandaES the gpio_121 is
>> not used and the signal is routed to expansion J6 pin14)
>>
>> In theory the McASP in OMAP5 should be working after this series, but the OMAP5
>> TRM is not public and I do not have one to check the addresses and see if there
>> is a way to test it on omap5-uevm.
>>
>> Mark, Tony:
>> The ASoC and dts patches can go via separate tree I felt that it is better if
>> they are together, at least initially.
>>
>> Nikolaus: fyi, this might be useful for Pyra?
> 
> Yes, definitively.
> 
> I just wonder how compatible it is with the "old" omap-mcasp driver we carry
> along for the Pyra:
> 
> https://git.goldelico.com/?p=letux-kernel.git;a=blob;f=sound/soc/ti/omap-mcasp.c;h=24d839a24f34ec02456176744d3690016592b5a3;hb=7789ab635e56a2fd9fe04ca2e9ccfeaccb8e0f52
> 
> Does it now have additional functionality or robustness?

The davinci-mcasp with series does work on OMAP4. I could not made the
omap-mcasp working. I have picked the driver from pyra in hopes that it
is working so I will ahve a stable base.
Have you tested it?

the omap-mcasp supports only 48KHz and 16bit, no passthrough, no 24bit,
all is hardwired for the Galaxy Nexus setup, afaik.

The davinci-mcasp should be better all around, I think the PM side is
also more robust.

The other point is that I would not accept the omap-mcasp driver
upstream. The IP is the same so the driver should be also...

> And does it need changes of the OMAP5 device tree?

In a similar way as the dts patches in this series.
fwiw:
https://github.com/omap-audio/linux-audio/commit/2f0a632db0b52321f1fc3623d088a741aeb72ef7
is the patch I have for PandaES to get S/PDIF working.

> And also important seems to be the ABE/AESS integration where we so far failed
> to make it work again on more recent kernels.

The McASP is not routed via ABE/AESS, it has been always handled outside
of the firmware, so it is just a simple link outside.

> Our most recent patch set is here:
> 
> https://git.goldelico.com/?p=letux-kernel.git;a=shortlog;h=refs/heads/letux/aess-v5

Yes, I'm following it ;)

> Anyways I am happy to see a little progress on the omap4/5 audio subsystem.

It is in maintenance mode as there is not much of an interest outside of
a small group of people, but I try to help to get it better for Pyra.

> BR and thanks,
> Nikolaus
> 
> 
> 
>>
>> Regards,
>> Péter
>> ---
>> Peter Ujfalusi (5):
>>  ASoC: ti: davinci-mcasp: Fix DIT mode support
>>  ASoC: dt-bindings: davinci-mcasp: Add compatible string for OMAP4
>>  ASoC: ti: davinci-mcasp: Add support for the OMAP4 version of McASP
>>  ARM: dts: omap4-l4-abe: Correct sidle modes for McASP
>>  ARM: dts: omap4-l4-abe: Add McASP configuration
>>
>> .../bindings/sound/davinci-mcasp-audio.txt    |   1 +
>> arch/arm/boot/dts/omap4-l4-abe.dtsi           |  39 ++--
>> include/linux/platform_data/davinci_asp.h     |   1 +
>> sound/soc/ti/Kconfig                          |   1 +
>> sound/soc/ti/davinci-mcasp.c                  | 168 +++++++++++++++---
>> 5 files changed, 168 insertions(+), 42 deletions(-)
>>
>> -- 
>> 2.32.0
>>
> 

-- 
Péter
