Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB7E3D671A
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 21:01:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC5051AFB;
	Mon, 26 Jul 2021 21:00:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC5051AFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627326085;
	bh=plFmCRvggw85dmXN5e0xuta8Z9I/gmxaScYHMY+CHdk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hx2jS2Mo7dOr1ZLz/FlpevcedbR2NqhNI2cNLqXa/emql3SUuNNk+xbucpZWdLyES
	 aHSyZXchc9FqNghFqzm8LXLUR7kYX/O9zLZcSVlpU8ZpSCso1KpDJbHqySmcwX8miY
	 rPBdGIj9yuz+6paCkkjLV8HePa8CVAG0S8qXSR04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81FA7F8020D;
	Mon, 26 Jul 2021 20:59:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D67C2F8025A; Mon, 26 Jul 2021 20:59:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4439F80132
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 20:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4439F80132
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M7auL-1m08oT0UqD-0085j8 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021
 20:59:48 +0200
Received: by mail-wr1-f52.google.com with SMTP id l18so4625105wrv.5
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 11:59:47 -0700 (PDT)
X-Gm-Message-State: AOAM530AGevfmLEDxe1/lZ5ooSq7rZtSejNnVwhI3hBG87GMQDkSZIzV
 4l8lsgfANHlmJSOGntAocGpWxbsJx4zGUzcs+XU=
X-Google-Smtp-Source: ABdhPJxY2Msxg10GQvXzi7iOXfW5B9LxrsADv4U+iggka3WOIJFd2TpVLEeNQgwDubTiO6YXhpkea5oFDkxJcEOewH0=
X-Received: by 2002:adf:e107:: with SMTP id t7mr20722060wrz.165.1627325987583; 
 Mon, 26 Jul 2021 11:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 26 Jul 2021 20:59:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a38tizZh1z=iJQotL3Tv3z8iK0qq2WCSy853M-nfwt4mQ@mail.gmail.com>
Message-ID: <CAK8P3a38tizZh1z=iJQotL3Tv3z8iK0qq2WCSy853M-nfwt4mQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] ALSA/ASoC/SOF/SoundWire: fix Kconfig issues
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:tIq1e8YoXRJwGsJ7G3myqGwiyuvgqEZQiRO6yiTQo5+CwxqM92/
 mhkNWVga3XDvcKDTvXyByYadcQXs89AgyX6/C868S1dfuYPkdzNEwEae2omung9j1munik6
 aXVASllw+b73xFdWNMuITTCRG5CyPkeLPawkV6nOPIxl4CziFFpvNTu7caXyNaCv3blxo/d
 4ouKUpxWci2f116dory9g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4msdzEaQKBc=:taotD+240Q4ZbRBlFXl0+a
 Nd2imWv/DhvtVyT17sjXrRbaejgBZ4hmnHmRMaapdgUgAcDxOQGCKo6RJgbd5tTndYzjroscK
 ZI7oSk7nyTuOBKr9ypo8/ys2LSAYRClbmrDFumjkx2L6rm0T91dc74t9QZVwnBrVuzD3vLZ/i
 Lvrtgrc4anQ1pSzv79nUiq7AAMkKTlgwPsHw/SoeS108z2NPX9sZ561LEYdJl4jBuBSAS/j7Y
 TxwwxMLxePrD+0gKcZJKRyHLFvgf1whdrmYjFLuOve9dekeVWwkwCOCST0dRV7E5s/95zugKR
 eyYtjIB0pXOtIhS4TocpLEn3aJAhxBNnXPz1x/PmAnc/FaSXZ2YfSZk6d1ExhuaOWncqKg2Ny
 VIwQWWYdR8Esu1OqK4tDTIIDZKz7UsizPbdOF+zR7aF4fV1uWPbDhx7V1IfgxbOjcUklhg81r
 PwD8QeoWb1Ss1V5zKtSmmxtZdSqI/KAFNu+opBSZRi4bf2OJ2wk2X7NrJF1cujwlijevnUt/k
 BWPVfA7Mf2d+QN2zNCTiiHrjUOgE1yc3R5uC3lKrEQtdun9qUaJTQTyTCKK3no6VuIyqwlfox
 suHMvWXX8QBIy2okJwr5y1xn1/QP5m+WHBUr33A4InmzvXN/fU4bheybJLwcouJcJwFgp/Rmf
 RpudWTJBSGckm8ufZp/x5BxKj5ClfMJ/c+loALHQb8GwbCZB3AxZgqRnhLAJMo6iZKjBbB/uH
 woqAcK1FUFkZ6EMaGXTroAmXTw4glatKi7cUq5VzLgM7oR8djc4WgfApAbEMFDfczZPNQLt8P
 7K1rWHEbtVOwJ7Uf9Fmm97+ykoDWM1rl+5oxrPfJ8GcalXeDNjL7mPAm4aJqrnhKi66GMMbi4
 fpeU2LViSSfnRB4iPsUvdlvcZ+p7+QOA5hoDx8fmeYpJSgQfJOV5iGJPuC7ovic+M/cIrmFmR
 PXlItuX1JYdqoktyF4U6FpDcbvjBcWbot1xF7oi4l+/69Zepjy4cg
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Takashi Iwai <tiwai@suse.de>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>
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

On Tue, Mar 2, 2021 at 1:31 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
> In January, Intel kbuild bot and Arnd Bergmann reported multiple
> issues with randconfig. This patchset builds on Arnd's suggestions to
>
> a) expose ACPI and PCI devices in separate modules, while sof-acpi-dev
> and sof-pci-dev become helpers. This will result in minor changes
> required for developers/testers, i.e. modprobe snd-sof-pci will no
> longer result in a probe. The SOF CI was already updated to deal with
> this module dependency change and introduction of new modules.
>
> b) Fix SOF/SoundWire/DSP_config dependencies by moving the code
> required to detect SoundWire presence in ACPI tables to sound/hda.
>
> Integration note:
> This patchset touches directories maintained by Vinod, Takashi and
> Mark in separate trees, and will impact additional changes to use the
> auxiliary bus in drivers/soundwire/.
> I can think of two options, both of which are fine:
> 1. Mark merges the patches with Vinod and Takashi Acked-by tags, then
> Mark provides an immutable tag to Vinod.
> 2. Vinod merges the patches with Mark and Takashi Acked-by tags, then
> Vinod provides an immutable tag to Mark
>
> Acknowledgements:
> Thanks to Arnd for suggesting fixes and testing these patches with
> more randconfigs.
> Thanks to Vinod Koul for his feedback on the move of this common
> helper to sound/hda/

Hi Pierre-Louis,

I have not done as much randconfig tested recently as I used to, but
since I ramped up the rate again after the merge window, I have unfortunately
once more run into a variation of this problem, with
CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE=m and
CONFIG_SND_SOC_SOF_HDA_COMMON=y:

x86_64-linux-ld: sound/soc/sof/intel/hda.o: in function
`hda_dsp_interrupt_thread':
hda.c:(.text+0x739): undefined reference to `sdw_intel_thread'
x86_64-linux-ld: hda.c:(.text+0x764): undefined reference to
`sdw_intel_process_wakeen_event'
x86_64-linux-ld: sound/soc/sof/intel/hda.o: in function `hda_sdw_int_enable':
hda.c:(.text+0x782): undefined reference to `sdw_intel_enable_irq'
x86_64-linux-ld: sound/soc/sof/intel/hda.o: in function `hda_sdw_startup':
hda.c:(.text+0x7ac): undefined reference to `sdw_intel_startup'
x86_64-linux-ld: sound/soc/sof/intel/hda.o: in function
`hda_sdw_process_wakeen':
hda.c:(.text+0x7dc): undefined reference to `sdw_intel_process_wakeen_event'
x86_64-linux-ld: sound/soc/sof/intel/hda.o: in function `hda_dsp_probe':
hda.c:(.text+0xee1): undefined reference to `sdw_intel_probe'
x86_64-linux-ld: sound/soc/sof/intel/hda.o: in function `hda_dsp_remove':
hda.c:(.text+0xf7f): undefined reference to `sdw_intel_enable_irq'
x86_64-linux-ld: hda.c:(.text+0xf8e): undefined reference to `sdw_intel_exit'

This only seems to appear very rarely, as I still did around 25000 randconfig
builds since you merged the series, but this config does show the problem
for any kernel version between the fix and the latest linux-next:

https://pastebin.com/raw/VCjcB3EU

I have only done the quick bisection but no analysis regarding what
we may have missed back in March. I hope you can figure this out.

       Arnd
