Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A2E49CC5B
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jan 2022 15:31:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 620F11F0A;
	Wed, 26 Jan 2022 15:31:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 620F11F0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643207514;
	bh=J1b6kf8mTQJ2em6X3EU2prKP5GVclaaXgfw8wCeWepM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U04f2InzROhgd+607f7pSq68jE8i7EYN9FJ/5z2G/zCPmnQ8cYMCqYAq27T4e6Cn6
	 yVA2evYxwwkrA6f4LVRI3jvKKESxopcc0Q+R+8ixm+wsD4WX6qIGG1q/swC8YToIav
	 KqlqiG7tOGbyHuKv/yhMTHkSsAsoE9bid1xqgHB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C51D8F804BC;
	Wed, 26 Jan 2022 15:30:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B21E4F8049C; Wed, 26 Jan 2022 15:30:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1F3CF800C8
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 15:30:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1F3CF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RFChwqPU"
Received: by mail-ua1-x931.google.com with SMTP id c36so43147333uae.13
 for <alsa-devel@alsa-project.org>; Wed, 26 Jan 2022 06:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=KXyFspKLdphRnX58IwkLvTQE8np6AnPYhWD+Xl8dte0=;
 b=RFChwqPUTb1K2RpfVtT/eoF/MXlj+9TwxMCexbp675+EXCPJmUVE+rovhqCTph7URl
 Evx2SWOoQd0CunZlng6/cQqRsFZ3FWnq5he9oTX8Qqizd+BbLlg1JNpxYKTao1CAQ5TE
 lMXINKjPSatcLQk5JynZxI5L81Qfll3wab28i8oOcKvSNIWxI9ongmJjNAhGYH7BwaVy
 p75VStGTt0wxC+1nwhZYxFKfjgR11guaW3RvjJPD2zO4oxbSNBFC1HpdBgHxkIv/1PS2
 s15qIY8AKHcgX3r9td5orUA9xEDdmtAyiVPU046UNxln90S8+TTdUFRxwt5tdp1OCMNE
 IS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KXyFspKLdphRnX58IwkLvTQE8np6AnPYhWD+Xl8dte0=;
 b=yT/hVPMGcGIoNLHHLRKlhM/b7IRsawwRlAP2NP0QFut8LY62+bUEChqCtmxAts1UuN
 lFbyCXP5BAGUEEi/GtY/eMiNK4gxZ16N5r5xdcZm8AgkElTfyOqgDWMf1Eoz3Y+LYrfU
 SBmGOC5n9P5ldRmqou5uee6vXrjfpec8a/8UoD2QOITVnYr2WEAz+BU39DFyABUXipaw
 lXXcCQ3yaWTYRbGJUIID9GXKhNP124cMe67h85tv23XRVTm7gki4Jrmr69pQKUAkQRJ8
 6M2QYi/tVE/zTQ8dHDvD6bDV+6yrF68ynZ+jVyXF87JajRdXIQPr7Sq4Zi39s/TwRrlg
 Zq4g==
X-Gm-Message-State: AOAM531aDAVUAcAPyQzsKM32M57E1sQspwy36sAzTfMTsGDxP1gTWAnK
 rd3R/T7Rv9vXFJEfRxBVcHrUJYBg6p2CgMJWVuc=
X-Google-Smtp-Source: ABdhPJxmbeIAESYJPFoRCq1VxlWunxYt5/RY9lrILy6MqmbANRRFmtsFWTPRH0H/yJpjg7YJs3gw9Al+eylpR7PtGBM=
X-Received: by 2002:a67:6f42:: with SMTP id k63mr9862366vsc.46.1643207433866; 
 Wed, 26 Jan 2022 06:30:33 -0800 (PST)
MIME-Version: 1.0
References: <CAAEBy7fQ6x95H5XkaKmXWsB1KCDbYAFtA5zUZ03ToJSegHb05w@mail.gmail.com>
 <d08bfba6-3aa8-e0d6-6d21-8734eed55978@linux.intel.com>
 <CAAEBy7exurcqZ+7Js27O7bWHsJQ9tQ_2yWXDeA3_smr5BDc5RA@mail.gmail.com>
 <1164c015-46b3-1efc-b5ce-044cc3492b78@linux.intel.com>
 <CAAEBy7f8z1LRr_EjRZtsFhj7c9hkfEkm+kGAw-yhCA-j0TvYOA@mail.gmail.com>
 <de932fa4-516e-c7d7-c3cd-388fa199bf23@linux.intel.com>
 <CAAEBy7cB=WeaqEKPP=dF=RjOQzAF4LDAiHjfVUMGzJqAW7RHYg@mail.gmail.com>
In-Reply-To: <CAAEBy7cB=WeaqEKPP=dF=RjOQzAF4LDAiHjfVUMGzJqAW7RHYg@mail.gmail.com>
From: anthony tonitch <d.tonitch@gmail.com>
Date: Wed, 26 Jan 2022 14:30:22 +0000
Message-ID: <CAAEBy7fYSSnDiq4VZXYgSSUe2C-3OFmMFdT1p=nkKPQ-HCZtNg@mail.gmail.com>
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

FWIW, I did installed your branch kernel and the sound wasn't working,
however shutting down my computer made a segfault error but this is
the first time I'm compilling a kernel by myself so It could really be
my fault here!

Le mar. 25 janv. 2022 =C3=A0 17:12, anthony tonitch <d.tonitch@gmail.com> a=
 =C3=A9crit :
>
> I made the isuue here https://github.com/thesofproject/linux/issues/3393
>
> I will be happy to test and give you feedback but I'm currently not at
> my home and downloading takes forever
> I will try this as soon as I can
>
> can I get you any info on my bios ? as you might have seen on the
> first sent mail, there is some screen capture of my bios with things I
> though was relevant
> but maybe I have to look elsewhere ?
>
> Le mar. 25 janv. 2022 =C3=A0 16:41, Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> a =C3=A9crit :
> >
> >
> >
> > On 1/25/22 03:07, anthony tonitch wrote:
> > > Le lun. 24 janv. 2022 =C3=A0 20:02, Pierre-Louis Bossart
> > > <pierre-louis.bossart@linux.intel.com> a =C3=A9crit :
> > >> ah, now it's starting to make sense.
> > >>
> > >> I am afraid you have the ES8316 codec, or one of its variants.
> > >> /sys/bus/acpi/devices/ESSX8326:00/status         15
> > >>
> > >> so no you don't want to use options snd-intel-dspcfg dsp_driver=3D1 =
but
> > >>
> > >> options snd-intel-dspcfg dsp_driver=3D3
> > >>
> > >> The auto-detection don't work because we use a different codec HID f=
or
> > >> the driver selection
> > >>
> > >>
> > >>         {
> > >>                 .flags =3D FLAG_SOF,
> > >>                 .device =3D 0x5a98,
> > >>                 .codec_hid =3D "ESSX8336",
> > >>         },
> > >>
> > >> as well as the machine driver selection
> > >>
> > >>         {
> > >>                 .id =3D "ESSX8336",
> > >>                 .drv_name =3D "sof-essx8336",
> > >>                 .sof_tplg_filename =3D "sof-glk-es8336.tplg",
> > >>         },
> > >>
> > >> This is really a problematic set of devices, where absolutely all
> > >> possible I2S links have been used, along with GPIO settings and DMIC=
s.
> > >>
> > >> Please file a bug on https://github.com/thesofproject/linux/issues s=
o
> > >> that we can keep track of this and suggest solution.
> > >>
> > >> Thanks!
> > >
> > > I will file the bug issue later in the day but I have two question he=
re,
> > >
> > > 1. does the dsp_driver=3D3 is supposed to work then because it doesn'=
t
> > > seems to ^^ maybe I did it wrong but here is the alsa info again if
> > > you see anything
> > > http://alsa-project.org/db/?f=3D847cdba9058170337515f57b460ed7bcae964=
af7
> > >
> > > 2. Because it works for everyone else and not for me, does this mean
> > > the chip is different and then that I have a "faulty one"? I will
> > > obviously still try to make the sound work if I can but at least I ca=
n
> > > contact gpd hk for an explaination
> > >
> > > Thanks a lot for your quick response!
> >
> > All the solutions we suggested will not work because of a change in you=
r
> > BIOS. We've only see "ESSX8336" so far and hard-coded this value, now
> > the BIOS writers in their infinite wisdom chose a different HID
> > (ESSX8326) which breaks all the existing matching.
> >
> > if you can install a new kernel, please try and provide feedback on
> > https://github.com/thesofproject/linux/pull/3338, where I added support
> > for more BIOS variations of the same device. I don't have any hardware
> > to test so have to crowd-source the tests to the community, thanks for
> > your understanding if this isn't a turn-key solution.
