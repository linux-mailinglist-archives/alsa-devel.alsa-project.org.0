Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE6B30772B
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jan 2021 14:33:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5AD216AF;
	Thu, 28 Jan 2021 14:33:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5AD216AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611840831;
	bh=n87AacIpZl1ndarA2Kd6c26h4+NRS9+s/hgtKRKNOOQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iCm0m5wpxlPjq9+0kq+b0xAsZMM8ETrQOKLHW2IlGEXbRvsovh5pcyTcLmE6b9DRD
	 vV/4DZpTBwhYBlU3i5dZ9ohnuAwBYByKGyZTjioqNSRj6I9JkjutyKN6vz+QIhY47m
	 NL42oSbO1jj0EjvY41iUGWshmsA6Ql3qMa2kPzL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44541F801D8;
	Thu, 28 Jan 2021 14:32:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CE04F8015B; Thu, 28 Jan 2021 14:32:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,PRX_BODY_76,
 PRX_BODY_84,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A4E3F800E9
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 14:32:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A4E3F800E9
Received: by mail-oo1-f41.google.com with SMTP id r199so1419243oor.2
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 05:32:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0ZIAeZuY05Uv3CfEX1Xk8kyFfIF3atTVLycALxe7y1s=;
 b=MR97NMzHFf7/m6Xz/isF0GU4JUhTs34pu8juGlufQTb1akvlPVOdfoSGZLIrRl66AB
 CFN7YblED4XYJrY0Ta2IXNgi2yKLgkP65499un7fBOV9M+WFOJAQ52yxqs+73AAO4Sr0
 tFLNC7F4Mq51Mm9dLM4m+otwcwGL1ltDVe/upZlnbF06tFvjO/lKXNsJBacamgyopEiA
 e13iSGhi0ic4mrHZnWdV2Ea4pTup4O7QTb1gwfbRIf15p2SoifQvS/WXNpZCRyEKY04j
 9fRpt1cZZ1s6t9C1CkoV0lAF/W4Zv8tnBumYbV4i1lqHA/odAfycN0N/zD+5d0a0jqwO
 a4rw==
X-Gm-Message-State: AOAM533fuyo1tLxSCPGzxpM0k98GCPrxtmTmAO070he9MyW0NubNq2W9
 u1cHFwp5OYlFBPyYij8Nr47rTqP8IJIHHZDIPXw=
X-Google-Smtp-Source: ABdhPJyJ32mz1m4SbKIpE/9O/ggIXFjXPm/fgsr5hXMXRwvgMkxs2cbA5CIfK6hklkDLQrFTG2gRz0P+ObYqLqxgkl0=
X-Received: by 2002:a4a:bf14:: with SMTP id r20mr11363028oop.2.1611840730383; 
 Thu, 28 Jan 2021 05:32:10 -0800 (PST)
MIME-Version: 1.0
References: <CA+GA0_sPC3rp5K4qwZm-u+W1C=+2Y2p-dbF4DMdHkKaTpeKKkg@mail.gmail.com>
 <CAJZ5v0iapmc8ywuySwexwTagKr89Hj7TPXkAvd_HXMhdLoyyQQ@mail.gmail.com>
 <1f0f7273-597e-cdf0-87d1-908e56c13133@linux.intel.com>
 <CA+GA0_v3JUWS3G3=R4XuQ=OW91cpwiBP1Rp=uzYOF8c9TUJ46w@mail.gmail.com>
 <CA+GA0_sCdowanpZmg==c+xVqqNxG5whLGsKHaCfSmpERBhqMzA@mail.gmail.com>
 <1dc2639a-ecbc-c554-eaf6-930256dcda96@linux.intel.com>
 <CA+GA0_sZm2pqOfA3LsNQowb930QS_g5CiCCGthzsS=vAjB9Rjg@mail.gmail.com>
 <709fa03c-43b7-45e4-3ddc-aae0d8f4ced4@linux.intel.com>
 <CA+GA0_sXVNHr1048otvwGwORt17ET0EbvTq-kGMOQoh1YOWYRw@mail.gmail.com>
In-Reply-To: <CA+GA0_sXVNHr1048otvwGwORt17ET0EbvTq-kGMOQoh1YOWYRw@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 28 Jan 2021 14:31:59 +0100
Message-ID: <CAJZ5v0gRjO-0Kt8BHXwv2EbBuJhxcx=afQWpKkiUJBdVc8=dEg@mail.gmail.com>
Subject: Re: Crash in acpi_ns_validate_handle triggered by soundwire on Linux
 5.10
To: =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

On Thu, Jan 28, 2021 at 2:25 PM Marcin =C5=9Alusarz <marcin.slusarz@gmail.c=
om> wrote:
>
> =C5=9Br., 27 sty 2021 o 23:02 Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> napisa=C5=82(a):
> > On 1/27/21 1:18 PM, Marcin =C5=9Alusarz wrote:
> > > =C5=9Br., 27 sty 2021 o 18:28 Pierre-Louis Bossart
> > > <pierre-louis.bossart@linux.intel.com> napisa=C5=82(a):
> > >>> Weird, I can't reproduce this problem with my self-compiled kernel =
:/
> > >>> I don't even see soundwire modules loaded in. Manually loading them=
 of course
> > >>> doesn't do much.
> > >>>
> > >>> Previously I could boot into the "faulty" kernel by using "recovery=
 mode", but
> > >>> I can't do that anymore - it crashes too.
> > >>>
> > >>> Maybe there's some kind of race and this bug depends on some specif=
ic
> > >>> ordering of events?
> > >>
> > >> missing Kconfig?
> > >> You need CONFIG_SOUNDWIRE and CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE
> > >> selected to enter this sdw_intel_acpi_scan() routine.
> > >
> > > It was a PEBKAC, but a slightly different one. I won't bore you with
> > > (embarrassing) details ;).
> > >
> > > I reproduced the problem, tested both your and Rafael's patches
> > > and the kernel still crashes, with the same stack trace.
> > > (Yes, I'm sure I booted the right kernel :)
> > >
> > > Why "recovery mode" stopped working (or worked previously) is still a=
 mystery.
> > >
> >
> > Thanks Marcin for the information. If you have a consistent failure
> > that's better to some extent.
> >
> > Maybe a bit of explanation of what this routine tries to do:
> > when SoundWire is enabled in a system, we need to have the following
> > pattern in the DSDT:
> >
> >      Scope (_SB.PCI0)
> >      {
> >          Device (HDAS)
> >          {
> >              Name (_ADR, 0x001F0003)  // _ADR: Address
> >          }
> >
> >
> >          Scope (HDAS)
> >          {
> >              Device (SNDW)
> >              {
> >                  Name (_ADR, 0x40000000)  // _ADR: Address
> >
> > The only thing the code does is to walk through the children and check
> > if the valid _ADR 0x40000000 is found.
> >
> > You don't have SoundWire in your device so there should not be any
> > children found. I don't see anything in the DSDT that looks like
> > _SB.PCI0.HDAS.<something>, so in theory we should not even enter the
> > callback.
> >
> > The error happens in acpi_bus_get_device(), after we read the adr but
> > before we check it, so wondering if we shouldn't revert the checks. Can
> > you try the diff below? I am not sure why there is a crash and we shoul=
d
> > root-cause this issue, just trying to triangulate what is happening.
> >
> > diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_i=
nit.c
> > index cabdadb09a1b..6bc87a682fb3 100644
> > --- a/drivers/soundwire/intel_init.c
> > +++ b/drivers/soundwire/intel_init.c
> > @@ -369,13 +369,6 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle
> > handle, u32 level,
> >          if (ACPI_FAILURE(status))
> >                  return AE_OK; /* keep going */
> >
> > -       if (acpi_bus_get_device(handle, &adev)) {
> > -               pr_err("%s: Couldn't find ACPI handle\n", __func__);
> > -               return AE_NOT_FOUND;
> > -       }
> > -
> > -       info->handle =3D handle;
> > -
> >          /*
> >           * On some Intel platforms, multiple children of the HDAS
> >           * device can be found, but only one of them is the SoundWire
> > @@ -386,6 +379,13 @@ static acpi_status sdw_intel_acpi_cb(acpi_handle
> > handle, u32 level,
> >          if (FIELD_GET(GENMASK(31, 28), adr) !=3D SDW_LINK_TYPE)
> >                  return AE_OK; /* keep going */
> >
> > +       if (acpi_bus_get_device(handle, &adev)) {
> > +               pr_err("%s: Couldn't find ACPI handle\n", __func__);
> > +               return AE_NOT_FOUND;
> > +       }
> > +
> > +       info->handle =3D handle;
> > +
> >          /* device found, stop namespace walk */
> >          return AE_CTRL_TERMINATE;
> >   }
>
> still the same crash

The modification doesn't fundamentally change the conditions, but
since the flow gets to the acpi_bus_get_device() evaluation, adr
appears to make sense (which is kind of strange, because it shouldn't
in the "no SoundWire" case).
