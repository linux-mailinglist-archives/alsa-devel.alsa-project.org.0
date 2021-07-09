Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DBE3C2624
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jul 2021 16:42:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E10D515E2;
	Fri,  9 Jul 2021 16:41:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E10D515E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625841728;
	bh=tWkj1CPfpq2ygg5ceXzbxsvDR+JFw2BRTjJ0/PgFYV4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ur17VA1H4IWCvFPy0ca193/bGdq+hb0KCJKR4NQva6b9TZ+j4TdyBXJ26y2n3QO+r
	 K9a5DxryLXP5jSkVR2zu8fzXG2ekSVRfxg9rTc73XBQxwm4P/s77X4htaWSNKSjIUS
	 AMbQz6X4oxa8GpwqbnvE5ijnRwMTIvhsoKSrqQDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51EBEF8025C;
	Fri,  9 Jul 2021 16:40:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81424F80224; Fri,  9 Jul 2021 16:40:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A3B6F80059
 for <alsa-devel@alsa-project.org>; Fri,  9 Jul 2021 16:40:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A3B6F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="D8lk6Lj8"
Received: by mail-lf1-x132.google.com with SMTP id x25so10926929lfu.13
 for <alsa-devel@alsa-project.org>; Fri, 09 Jul 2021 07:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZL12w8fFLbmAUNIpYNN7IW/U1IsQYiXwxKki1Gb33EM=;
 b=D8lk6Lj8Rewb94TQyAZI1uKPbva5tr+DLmYmUQkKLgjB0f2fXN6FnfX6fjjGTh2eFG
 6NFifvq8RHM4zPEo3GyAhmqRcGbwtTJVk6GjtQU+4SXHitTBEIQv4GUKesAqAj17452X
 tmfTQ6vuNoyCinS0tGXc+wTBusin1eh/7uzNNHF0lt3ge0+JM2ONQf4ML4rAdNhtvJ4G
 b5T8D8XPFh4vhCX3k2vntE2cc/N0mehSV1KKGSzJo85AXjHxQtAH34qeabfJ9SJ2SKat
 p5vtdmBEbWQAhj+/E9DV/cggxHzCDnQJxXue/sVfabf3jkab4DPvSkfysu3SlT0kHOvV
 hD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZL12w8fFLbmAUNIpYNN7IW/U1IsQYiXwxKki1Gb33EM=;
 b=mcnIJnEnrCpRvAKiaWlzSAJwL9s+KpqmTNuQeAFDMM8H1zJgHbRVdtVNB75a4mX3bD
 YOwJK1lST7FsNN23G8WTElMyuHj4yfuA1eeHkYYVIJ1R0n9erGs70myh420MrQyNHhl1
 vyAxGja1nq+rxvI9EaAkLchAKA3RHiLNMZx3iOgbniUw9uGWlJEomVEOGhZKkYULIinp
 hqzDAZEKhdlhzaznqiaPKYP5MsSYYawCR0yPyH7guG+d2ydhTEf0wtGSQbOkpFpUidkP
 bnzMCK313xrqoiCa3/N+ZR6MveIIWf7unu/7UmFLsvfPT3Tyql225qCuC8PGcQMusj+7
 pDvw==
X-Gm-Message-State: AOAM532/Eym0n4PPWSdjR5+dJMczMQR/ZZQtanOmI/regMFoyvHnf9SI
 kzMFjvtxkl+ncOsbgH5j/afS9NWrNV46r6ezIos=
X-Google-Smtp-Source: ABdhPJy2RKavWzgLQ7lDPz/WawBHYPzX2FMYza8MuYzLw8PblWlYourkKLMyPXunmx+RUM0pcbrFFGmdA+P+KTrSZOU=
X-Received: by 2002:a19:4950:: with SMTP id l16mr3838101lfj.4.1625841629807;
 Fri, 09 Jul 2021 07:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAEk1YH4Jd0a8vfZxORVu7qg+Zsc-K+pR187ezNq8QhJBPW4gpw@mail.gmail.com>
 <s5hlf6h594o.wl-tiwai@suse.de>
 <CAEk1YH6ca3jDq4AD7tD8xk3Cht5aA9rhkmFsMjjjzrKvRgL3Lw@mail.gmail.com>
 <s5hczrt55mp.wl-tiwai@suse.de>
In-Reply-To: <s5hczrt55mp.wl-tiwai@suse.de>
From: Damjan Georgievski <gdamjan@gmail.com>
Date: Fri, 9 Jul 2021 16:40:18 +0200
Message-ID: <CAEk1YH4vXSjf1kYM=uJ5DKbO3zPaY1K6W4MveEBtkzao5V=NHA@mail.gmail.com>
Subject: Re: Audio out on DisplayPort but not HDMI, on AMD Ryzen APU/Vega
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org
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

> > Should this hardware be supported with the
> > sound/soc/amd/renoir/rn-pci-acp3x.c driver (instead of snd_hda_intel)?
> > =E2=80=A6 since it is a Renoir desktop APU.
> >
> > > Please give alsa-info.sh output for more detailed analysis.
> >
> > http://alsa-project.org/db/?f=3D00b31f3f0e6c58b56c73f98aec7c6b5ccaff700=
e
>
> The codec proc output there shows that only one pin is enabled for
> HDMI/DP output, and that's the reason why the driver created only one
> stream.  It's basically a BIOS setup.
>
> The patch below should enable all pins forcibly and this should give
> more streams.  Give it a try.
>
>
> Takashi
>
> --- a/sound/pci/hda/patch_hdmi.c
> +++ b/sound/pci/hda/patch_hdmi.c
> @@ -1940,6 +1940,7 @@ static int hdmi_add_cvt(struct hda_codec *codec, hd=
a_nid_t cvt_nid)
>  static const struct snd_pci_quirk force_connect_list[] =3D {
>         SND_PCI_QUIRK(0x103c, 0x870f, "HP", 1),
>         SND_PCI_QUIRK(0x103c, 0x871a, "HP", 1),
> +       SND_PCI_QUIRK(0x1462, 0xec94, "MS-7C94", 1),
>         {}
>  };
>

This somewhat improved the situation. I get multiple HDMI devices on
the card now, and the
default seems to be the actual HDMI port (as opposed to the DisplayPort).

But I can't manually control where the audio goes, and at one point (I
think when the TV was off),
it automatically switched to the DisplayPort.

http://alsa-project.org/db/?f=3Deb8da3434b011820de868451e55ae4f22fbb350c



--=20
damjan
