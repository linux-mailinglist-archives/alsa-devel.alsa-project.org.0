Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 565B949AEF6
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jan 2022 10:08:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC3162090;
	Tue, 25 Jan 2022 10:08:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC3162090
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643101731;
	bh=/rhSozADVB8zRcH5kbE08A7876Ztn5FHXC8yv1hqHMs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ct1nQw7rvgRaQrqCGQcWZcusA9WS/ROSZQU+EPWKY5pVlQOm/1GV76x9obw/OFeKI
	 U3NWVlOxQN5xO0NJM8e3LvSA6Cys6Gqgx3CSe1lA3bKL7yIpn7Il7Gdl5ZKD0wP1j0
	 ZhjaxRgDjh3j/SHaZx7hkkFPGzGBZqryl8/C0bIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03C91F804CF;
	Tue, 25 Jan 2022 10:07:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40874F804C3; Tue, 25 Jan 2022 10:07:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB93BF800D1
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 10:07:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB93BF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="p1zXtreT"
Received: by mail-ua1-x935.google.com with SMTP id n15so34609922uaq.5
 for <alsa-devel@alsa-project.org>; Tue, 25 Jan 2022 01:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3fB9tNFuc+unz/Bpd9ZLUPJk71K3Y9AUpv2QR/wkNJ4=;
 b=p1zXtreTX/WNYL49aAVOU+RrabRAhB/ezTuJzSY2T+cBjT/nnMiryBfHbLyhqCOf4B
 /Khn0cIOTUDq4gOoqrx9xnbSqUHxTH6sfbwxvFc/nnOxwdwDWDk7Nur7ne+M6iFqw6CO
 M5qYwPmZz6vZVuN9P7Y1jKSb452Aj/xZOvkmO144eb31dJs8wZ6yAPTMA8sF36hzPvSM
 lr1BEESy+DTJZq8xVkRFVYG+lihMvXiTgD9F5Va/Th2pSCMUOJO3VUdWKbhIpC02WehC
 vnjILSnT73iPrJz8+QfaElKvIdzS5ESfPh7Sz70HCyQs1Gu8xX2/iI+R5j6mNmnGcKUb
 IZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3fB9tNFuc+unz/Bpd9ZLUPJk71K3Y9AUpv2QR/wkNJ4=;
 b=kE1Nnt3bJsNwwy+TvISF0ZDOTQ1/4OowPzPU0uvKC8Hbdl3AWMOAc2OUPX1rC0LjgV
 ja6oGUrKbloFHdkiVyo3AePujIe3rhea0FWIskQSarOt5sMUIEF6Hs/UXRn1IIdgp07o
 jfEVwaSqlxzmqUl3vnamSC9eJazTmjkkT6iafadtICUbEwECKY8oW10VcK1KlJg0YjQN
 J9TB2S55RxUzVeRFmFvkcaAHtcpbZK3xztl8DnqO3gvWwU3FxVKdvVO821xPz0y3nfJN
 4/itmeppVtVJBJKlidtn8b4jHrltCX3t7x1pwm+qGV17hqGYOOuq6/1PEzyT3jtelhrt
 ltRQ==
X-Gm-Message-State: AOAM533g5+PBkF0mYMWyW2LwPgS/D05SxmOZPhrspsfT8+SkzLRATACb
 1hVPbOQG+Utexm9QExe0w4QhGJ7ROyeTdQpEu6A=
X-Google-Smtp-Source: ABdhPJwAz0GdLxHyfAf0fGDi/sYzQUlgkyM9MEK4NfQ7yFdbaoiY6CclJJ6LGSKuJQfVNZHQM+BGpYmX8mibYlj87xo=
X-Received: by 2002:a67:6f42:: with SMTP id k63mr7326284vsc.46.1643101659225; 
 Tue, 25 Jan 2022 01:07:39 -0800 (PST)
MIME-Version: 1.0
References: <CAAEBy7fQ6x95H5XkaKmXWsB1KCDbYAFtA5zUZ03ToJSegHb05w@mail.gmail.com>
 <d08bfba6-3aa8-e0d6-6d21-8734eed55978@linux.intel.com>
 <CAAEBy7exurcqZ+7Js27O7bWHsJQ9tQ_2yWXDeA3_smr5BDc5RA@mail.gmail.com>
 <1164c015-46b3-1efc-b5ce-044cc3492b78@linux.intel.com>
In-Reply-To: <1164c015-46b3-1efc-b5ce-044cc3492b78@linux.intel.com>
From: anthony tonitch <d.tonitch@gmail.com>
Date: Tue, 25 Jan 2022 10:07:27 +0100
Message-ID: <CAAEBy7f8z1LRr_EjRZtsFhj7c9hkfEkm+kGAw-yhCA-j0TvYOA@mail.gmail.com>
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

Le lun. 24 janv. 2022 =C3=A0 20:02, Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> a =C3=A9crit :
> ah, now it's starting to make sense.
>
> I am afraid you have the ES8316 codec, or one of its variants.
> /sys/bus/acpi/devices/ESSX8326:00/status         15
>
> so no you don't want to use options snd-intel-dspcfg dsp_driver=3D1 but
>
> options snd-intel-dspcfg dsp_driver=3D3
>
> The auto-detection don't work because we use a different codec HID for
> the driver selection
>
>
>         {
>                 .flags =3D FLAG_SOF,
>                 .device =3D 0x5a98,
>                 .codec_hid =3D "ESSX8336",
>         },
>
> as well as the machine driver selection
>
>         {
>                 .id =3D "ESSX8336",
>                 .drv_name =3D "sof-essx8336",
>                 .sof_tplg_filename =3D "sof-glk-es8336.tplg",
>         },
>
> This is really a problematic set of devices, where absolutely all
> possible I2S links have been used, along with GPIO settings and DMICs.
>
> Please file a bug on https://github.com/thesofproject/linux/issues so
> that we can keep track of this and suggest solution.
>
> Thanks!

I will file the bug issue later in the day but I have two question here,

1. does the dsp_driver=3D3 is supposed to work then because it doesn't
seems to ^^ maybe I did it wrong but here is the alsa info again if
you see anything
http://alsa-project.org/db/?f=3D847cdba9058170337515f57b460ed7bcae964af7

2. Because it works for everyone else and not for me, does this mean
the chip is different and then that I have a "faulty one"? I will
obviously still try to make the sound work if I can but at least I can
contact gpd hk for an explaination

Thanks a lot for your quick response!
