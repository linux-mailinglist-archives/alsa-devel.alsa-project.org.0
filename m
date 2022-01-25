Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD9149B9CF
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 18:13:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85E711FB0;
	Tue, 25 Jan 2022 18:12:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85E711FB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643130810;
	bh=SecGRklzjqzQtpVLJgODWo5jHzBgrSKFhHDgYzsFpL4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DcBa6xszg4ZsoJouj7dHulSUAR8h1UuxujPNZ8b4C8Y+DBy1i7YmTWIsS+lPZ24r1
	 j/ZHUpgzRExStOTdufYp+KobJ4OSiMrePoNSlEiiEyQaMJiwT/agCwKcnpiaBfQhZ7
	 VjQwIT6jhLtm/hYZ2wTlKTHsI75NszMkZ8WzNO5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7156F800D1;
	Tue, 25 Jan 2022 18:12:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF809F800D1; Tue, 25 Jan 2022 18:12:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [IPv6:2607:f8b0:4864:20::930])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 781B0F800D1
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 18:12:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 781B0F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jHQvLPkH"
Received: by mail-ua1-x930.google.com with SMTP id m90so38697987uam.2
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 09:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BW5yXQ5lJft+cD/Slr/1z0KsH24O/DFZhm12oMSW/RU=;
 b=jHQvLPkHKA11ph3BP9lYx6SP3zrxKlmalE7dfb75JujJs0FzZqi3SHbfglem7R3SYO
 nj18V8Knom0GB2BErIR8hKXbFXLQauxbpcjfQgafsv+zpFjmMwyh0R2THYfOVdlOcZZu
 wryklTHFhRq8Bmlvm0Po48pDAGiBaDMQvD04bhnoAwGCOQHIajycDeYZwRjeJsbEcgRJ
 kLW1vlYjKxaMGI/VkgMBUzhwPwQLS9KQTOWIBnfFcCPwpCzddqdflOIorEr148j7bzDE
 RA6OIhjlB0DxFLc7yMlCIjm/9rlHFuEhVYb3GxwYxrFv88a9HDj1M5x+BK/m600g7sXT
 IVEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BW5yXQ5lJft+cD/Slr/1z0KsH24O/DFZhm12oMSW/RU=;
 b=7KXRyYPAOl+4mqnH59sQVLohurAroxeYMbo6rNEmRPQaGGmtCVuo02v6uIDSr8Cxxm
 zMEB1n4pb18ic7UrgcE1sdisdUSztEBTZCVnf041jOb3oXqtKwfDpakR30BEcOwwmpD+
 MieXVqndm+er2NFvuL3+02vEdsn31TyAyTiZ6LCfXMx0fYcFAmpAeG3mdQUSGB6YT+h/
 gsaZ1KrItPEE2QoJnLYbTENBroAP4Ld47jtB3pq2ukeX+BfVK5CEmJW9tyJJl5/JjHwD
 RDbvGQtRBaph0X5J3YlH4yrrRXA36N5O8thfEntDaSwmzXVeNGvoMgoC3PrERsPOPWmq
 i6QA==
X-Gm-Message-State: AOAM533awnQlbQiZfZo0eotVTrqWAYMSl0iSy35fSlqe00sxCrKlBJw/
 VSM2dc6NLgvQ7XQ9V+1fAePN+ivMQcCBXuF9z1I=
X-Google-Smtp-Source: ABdhPJzasN6sOBSMURKDcJGHegiM1qZqn3eh9M1akSWRAl00Ivi1Y3jotN5njk3aPpxzyy+c0Ks89nOQfJQmV+1oJQo=
X-Received: by 2002:a67:c117:: with SMTP id d23mr8200832vsj.72.1643130733139; 
 Tue, 25 Jan 2022 09:12:13 -0800 (PST)
MIME-Version: 1.0
References: <CAAEBy7fQ6x95H5XkaKmXWsB1KCDbYAFtA5zUZ03ToJSegHb05w@mail.gmail.com>
 <d08bfba6-3aa8-e0d6-6d21-8734eed55978@linux.intel.com>
 <CAAEBy7exurcqZ+7Js27O7bWHsJQ9tQ_2yWXDeA3_smr5BDc5RA@mail.gmail.com>
 <1164c015-46b3-1efc-b5ce-044cc3492b78@linux.intel.com>
 <CAAEBy7f8z1LRr_EjRZtsFhj7c9hkfEkm+kGAw-yhCA-j0TvYOA@mail.gmail.com>
 <de932fa4-516e-c7d7-c3cd-388fa199bf23@linux.intel.com>
In-Reply-To: <de932fa4-516e-c7d7-c3cd-388fa199bf23@linux.intel.com>
From: anthony tonitch <d.tonitch@gmail.com>
Date: Tue, 25 Jan 2022 18:12:00 +0100
Message-ID: <CAAEBy7cB=WeaqEKPP=dF=RjOQzAF4LDAiHjfVUMGzJqAW7RHYg@mail.gmail.com>
Subject: Re: No sound on gpd pocket 3
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>
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

I made the isuue here https://github.com/thesofproject/linux/issues/3393

I will be happy to test and give you feedback but I'm currently not at
my home and downloading takes forever
I will try this as soon as I can

can I get you any info on my bios ? as you might have seen on the
first sent mail, there is some screen capture of my bios with things I
though was relevant
but maybe I have to look elsewhere ?

Le mar. 25 janv. 2022 =C3=A0 16:41, Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> a =C3=A9crit :
>
>
>
> On 1/25/22 03:07, anthony tonitch wrote:
> > Le lun. 24 janv. 2022 =C3=A0 20:02, Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com> a =C3=A9crit :
> >> ah, now it's starting to make sense.
> >>
> >> I am afraid you have the ES8316 codec, or one of its variants.
> >> /sys/bus/acpi/devices/ESSX8326:00/status         15
> >>
> >> so no you don't want to use options snd-intel-dspcfg dsp_driver=3D1 bu=
t
> >>
> >> options snd-intel-dspcfg dsp_driver=3D3
> >>
> >> The auto-detection don't work because we use a different codec HID for
> >> the driver selection
> >>
> >>
> >>         {
> >>                 .flags =3D FLAG_SOF,
> >>                 .device =3D 0x5a98,
> >>                 .codec_hid =3D "ESSX8336",
> >>         },
> >>
> >> as well as the machine driver selection
> >>
> >>         {
> >>                 .id =3D "ESSX8336",
> >>                 .drv_name =3D "sof-essx8336",
> >>                 .sof_tplg_filename =3D "sof-glk-es8336.tplg",
> >>         },
> >>
> >> This is really a problematic set of devices, where absolutely all
> >> possible I2S links have been used, along with GPIO settings and DMICs.
> >>
> >> Please file a bug on https://github.com/thesofproject/linux/issues so
> >> that we can keep track of this and suggest solution.
> >>
> >> Thanks!
> >
> > I will file the bug issue later in the day but I have two question here=
,
> >
> > 1. does the dsp_driver=3D3 is supposed to work then because it doesn't
> > seems to ^^ maybe I did it wrong but here is the alsa info again if
> > you see anything
> > http://alsa-project.org/db/?f=3D847cdba9058170337515f57b460ed7bcae964af=
7
> >
> > 2. Because it works for everyone else and not for me, does this mean
> > the chip is different and then that I have a "faulty one"? I will
> > obviously still try to make the sound work if I can but at least I can
> > contact gpd hk for an explaination
> >
> > Thanks a lot for your quick response!
>
> All the solutions we suggested will not work because of a change in your
> BIOS. We've only see "ESSX8336" so far and hard-coded this value, now
> the BIOS writers in their infinite wisdom chose a different HID
> (ESSX8326) which breaks all the existing matching.
>
> if you can install a new kernel, please try and provide feedback on
> https://github.com/thesofproject/linux/pull/3338, where I added support
> for more BIOS variations of the same device. I don't have any hardware
> to test so have to crowd-source the tests to the community, thanks for
> your understanding if this isn't a turn-key solution.
