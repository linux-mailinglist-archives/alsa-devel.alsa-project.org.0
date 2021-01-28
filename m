Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C653307702
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jan 2021 14:27:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDEAD16A8;
	Thu, 28 Jan 2021 14:26:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDEAD16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611840434;
	bh=JKjgomgT4K6KpsXghgFpt0WskBzkVQe9NastpUU7ytk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GIb229VyRhUkGBvuKSHebG4EflkCdJOoCE68khlOmvLHPz0ks2ncZy65E6UVTvtYv
	 az/eM9uBhNV/bOJyoZ9dqhCWyjHfWAEIJZWmKS8qR1o4osO15wg1RcPGSL16v3ZyCX
	 RzrmtMSdeOrmE4DXBt3ukh5ItUUPeKCb1DwBnxgE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12C27F801D8;
	Thu, 28 Jan 2021 14:25:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC9CAF8015B; Thu, 28 Jan 2021 14:25:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODY_30, PRX_BODY_76, PRX_BODY_84,
 SPF_HELO_NONE, 
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AD85F800E9
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 14:25:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AD85F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hhFyNkNd"
Received: by mail-wr1-x42c.google.com with SMTP id g10so5402345wrx.1
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 05:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5CJz8xLHc13QcIlEYKKlUT9R0qkQPk9oXqmcrIZ27QY=;
 b=hhFyNkNdt9g+ql1bsZG7vbhI10kPhDWRIYKPVMSW21jvFL7L5m6h7bD5hVgLHkXc57
 ASQb7KYAFtnHQMXZRoJMzbe1QU3YV9IklzuKF3Ty9p4pRHE8H26c4pl5l7OmnAcTQfLu
 0oQcCcVcS9sqq2c57HEEdQVG0MH7SoVGPcystgzxaY4pRBnZbVxHjHice93a1stnP2I9
 oT/texPqcMEYNXT5Vh7b5WF+2i2Vl3o37Vu9hcL6oTjFmiksDxbe6hjQXMSkgmc2//N6
 +LuyeiT41I9ZJaKt0nNpGmAd6NuM/q0dVLxH8NGLBmmWFq0L9EVM8kqsD/lmZUkSc8Zq
 oHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5CJz8xLHc13QcIlEYKKlUT9R0qkQPk9oXqmcrIZ27QY=;
 b=Fe8wCsm2iMP4qlepOPhWaExledukzLxuzj8Ic3QbU09VMB8PW5oU+35/Q2rRkqjwCB
 wTpUL64y8N3ZtHsqBQXdqlo+7vJOeT3xlyRllHujwSUUE0b6wJr20hwc9h3Cih6SaKIc
 QglAJucpudFGKLvVdIdu/pkoDogWEY6yFb3gyw3iAUymfaukwU8HNqNEigFFWmnOyh5U
 bGMZgY9+f4/CXk+e2qg26B0OayPICJoURCbxfGTFka72vA6c9GD+5oiFnxwTa/nPb/kS
 7M2FiTUJJq7VCaAVh0raT/0zpoe0JB+TLvoF6gkztLRuXv2NyB26VzLTgVDoZI9kA0i9
 tCfA==
X-Gm-Message-State: AOAM5338uz66tDCFvvzLo9a8Iam6YKT7sPdbCYc/TeIV7joeJ6u6dLi6
 0ov6grhKWZockd5LQuM1cgxSeKlL9UHohZtTkHU=
X-Google-Smtp-Source: ABdhPJwMQ9ruALH/Jb2jaRHJomVbcEBfRHKcvurxJRTBp/GAU9u3ZPLUFTVMgcarXl5ntS4iyKMiXpxmnqnazgKLVJ4=
X-Received: by 2002:a5d:4046:: with SMTP id w6mr15792973wrp.369.1611840335384; 
 Thu, 28 Jan 2021 05:25:35 -0800 (PST)
MIME-Version: 1.0
References: <CA+GA0_sPC3rp5K4qwZm-u+W1C=+2Y2p-dbF4DMdHkKaTpeKKkg@mail.gmail.com>
 <CAJZ5v0iapmc8ywuySwexwTagKr89Hj7TPXkAvd_HXMhdLoyyQQ@mail.gmail.com>
 <1f0f7273-597e-cdf0-87d1-908e56c13133@linux.intel.com>
 <CA+GA0_v3JUWS3G3=R4XuQ=OW91cpwiBP1Rp=uzYOF8c9TUJ46w@mail.gmail.com>
 <CA+GA0_sCdowanpZmg==c+xVqqNxG5whLGsKHaCfSmpERBhqMzA@mail.gmail.com>
 <1dc2639a-ecbc-c554-eaf6-930256dcda96@linux.intel.com>
 <CA+GA0_sZm2pqOfA3LsNQowb930QS_g5CiCCGthzsS=vAjB9Rjg@mail.gmail.com>
 <709fa03c-43b7-45e4-3ddc-aae0d8f4ced4@linux.intel.com>
In-Reply-To: <709fa03c-43b7-45e4-3ddc-aae0d8f4ced4@linux.intel.com>
From: =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@gmail.com>
Date: Thu, 28 Jan 2021 14:25:19 +0100
Message-ID: <CA+GA0_sXVNHr1048otvwGwORt17ET0EbvTq-kGMOQoh1YOWYRw@mail.gmail.com>
Subject: Re: Crash in acpi_ns_validate_handle triggered by soundwire on Linux
 5.10
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Len Brown <lenb@kernel.org>
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

=C5=9Br., 27 sty 2021 o 23:02 Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> napisa=C5=82(a):
> On 1/27/21 1:18 PM, Marcin =C5=9Alusarz wrote:
> > =C5=9Br., 27 sty 2021 o 18:28 Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com> napisa=C5=82(a):
> >>> Weird, I can't reproduce this problem with my self-compiled kernel :/
> >>> I don't even see soundwire modules loaded in. Manually loading them o=
f course
> >>> doesn't do much.
> >>>
> >>> Previously I could boot into the "faulty" kernel by using "recovery m=
ode", but
> >>> I can't do that anymore - it crashes too.
> >>>
> >>> Maybe there's some kind of race and this bug depends on some specific
> >>> ordering of events?
> >>
> >> missing Kconfig?
> >> You need CONFIG_SOUNDWIRE and CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE
> >> selected to enter this sdw_intel_acpi_scan() routine.
> >
> > It was a PEBKAC, but a slightly different one. I won't bore you with
> > (embarrassing) details ;).
> >
> > I reproduced the problem, tested both your and Rafael's patches
> > and the kernel still crashes, with the same stack trace.
> > (Yes, I'm sure I booted the right kernel :)
> >
> > Why "recovery mode" stopped working (or worked previously) is still a m=
ystery.
> >
>
> Thanks Marcin for the information. If you have a consistent failure
> that's better to some extent.
>
> Maybe a bit of explanation of what this routine tries to do:
> when SoundWire is enabled in a system, we need to have the following
> pattern in the DSDT:
>
>      Scope (_SB.PCI0)
>      {
>          Device (HDAS)
>          {
>              Name (_ADR, 0x001F0003)  // _ADR: Address
>          }
>
>
>          Scope (HDAS)
>          {
>              Device (SNDW)
>              {
>                  Name (_ADR, 0x40000000)  // _ADR: Address
>
> The only thing the code does is to walk through the children and check
> if the valid _ADR 0x40000000 is found.
>
> You don't have SoundWire in your device so there should not be any
> children found. I don't see anything in the DSDT that looks like
> _SB.PCI0.HDAS.<something>, so in theory we should not even enter the
> callback.
>
> The error happens in acpi_bus_get_device(), after we read the adr but
> before we check it, so wondering if we shouldn't revert the checks. Can
> you try the diff below? I am not sure why there is a crash and we should
> root-cause this issue, just trying to triangulate what is happening.
>
> diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_ini=
t.c
> index cabdadb09a1b..6bc87a682fb3 100644
> --- a/drivers/soundwire/intel_init.c
> +++ b/drivers/soundwire/intel_init.c
> @@ -369,13 +369,6 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle
> handle, u32 level,
>          if (ACPI_FAILURE(status))
>                  return AE_OK; /* keep going */
>
> -       if (acpi_bus_get_device(handle, &adev)) {
> -               pr_err("%s: Couldn't find ACPI handle\n", __func__);
> -               return AE_NOT_FOUND;
> -       }
> -
> -       info->handle =3D handle;
> -
>          /*
>           * On some Intel platforms, multiple children of the HDAS
>           * device can be found, but only one of them is the SoundWire
> @@ -386,6 +379,13 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle
> handle, u32 level,
>          if (FIELD_GET(GENMASK(31, 28), adr) !=3D SDW_LINK_TYPE)
>                  return AE_OK; /* keep going */
>
> +       if (acpi_bus_get_device(handle, &adev)) {
> +               pr_err("%s: Couldn't find ACPI handle\n", __func__);
> +               return AE_NOT_FOUND;
> +       }
> +
> +       info->handle =3D handle;
> +
>          /* device found, stop namespace walk */
>          return AE_CTRL_TERMINATE;
>   }

still the same crash
