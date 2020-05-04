Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD83C1C4734
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 21:45:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 299CE1721;
	Mon,  4 May 2020 21:44:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 299CE1721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588621515;
	bh=naxSuvDo4ZyclOX5pP1tyHmDj9ZsSTqrkn+6EZsob8w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BCYDNDKhiHE3w57yoBYxy5fuTwVpgmACQp5YN4QhZS7mh/PMc9imXqNlex2V+YU43
	 Hbd63hhXvqq1YcHzNUoQuGYSWf+ic2cn7SX/oYor1+JP8yLw28OhcP2YOOjAj+VkiV
	 d2RWotrfoFOo+g60uevB6RB/+phbeQiaFidPuDf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B7E4F80258;
	Mon,  4 May 2020 21:43:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 762F8F80249; Mon,  4 May 2020 21:43:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82DBAF800E5
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 21:43:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82DBAF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SjHLuiCK"
Received: by mail-il1-x144.google.com with SMTP id x2so12444717ilp.13
 for <alsa-devel@alsa-project.org>; Mon, 04 May 2020 12:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hToGumS7+rYCBAzwPejy/9G9W5aA7qrCKK0guqtnFic=;
 b=SjHLuiCKKUrEzDejZi1OKuJXwdceb+8LNelIll16QEO5qNEjAPQAAsvUxeDszeDR/N
 85+LZzWTsXE8zTa4pkn2s41g8hVSUlTYqbPn3WiM/h785rym9Jxa2Zugy26zWHlmEEWH
 8bmLR8SahzhouwKRk/8mEVPY/9kafpSmS4nBCBPYAeq63JDA3MLxr0THEWQF0//zgRAJ
 d9KQvHnphi+qyo79q9vQ71zi3ww8qqR+RX0+7KIGTtVAoQMsujxB3B/hGBkRaCXQv8EN
 dfcj7gPxu1CcV/uTPSRRS9jkJMxmYHLOwtV1mvVJUxBRDBA0qPtMAI3R+/sa18yiSjZm
 mqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hToGumS7+rYCBAzwPejy/9G9W5aA7qrCKK0guqtnFic=;
 b=CjdrGV/gQmkHfhSpeB7C/3hAMQsjHcU/u25ekktzaP1DuGWf0EUCs5Z6vt2bxKQkhH
 L2KRzP/uaK6HyL663PD8+U/4Vxc90d0pOeHgc+uQobRd46okAEgFgt7yUYSX+Bk2rjng
 j8zjHFtIrXR4iOEVIkt3vXBSvkxC3TnE3eFdMl2/2G9vAMRXoGNS7g5BawKiaF0ih6jT
 4oM08i9mFd4S+29eizbPiXHq0PA71J9a5IXlXAFqQW5FXHC13kdFsLNN6Mx7poTM6Xk8
 T/01/2azwb375UoRgEyDkfCdgZ28WkqXihiJJGwF8tRDHSwKJjlqcaM1GDutxRFY5ZDV
 GvqQ==
X-Gm-Message-State: AGi0PuaI/dKfYNqUVJBV4WCOgXODpT2olXIxFXI4GyDfGZhN0cLuwkg0
 VxrLwKEV1XtWOr8TmDJJRfiqhwVakMZfC0S3mHs=
X-Google-Smtp-Source: APiQypJrGXhhqW08yoaeDnDtx/i0JRfzWEst7LvKzsZZk7VobrfRGOVAQHzOHOnx7KngiHH3GuCSo8vUVjpnh9WKeuw=
X-Received: by 2002:a92:3a48:: with SMTP id h69mr55241ila.150.1588621396983;
 Mon, 04 May 2020 12:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200426104115.22630-1-peron.clem@gmail.com>
 <20200426104115.22630-4-peron.clem@gmail.com>
 <20200428081321.ht3el26yqhsnyfm4@gilmour.lan>
 <CAJiuCcdVs_drs40Q6537BYfz24F7NmC6B8S5-Lt4V4ggs-FXWA@mail.gmail.com>
 <20200429123529.y24dpy63wxq7uvkt@gilmour.lan>
 <CAJiuCcfXqizcq_JuXRCsqEqM2562cr1SGJ0pmy07jcJxAXojOw@mail.gmail.com>
 <20200430084600.samghw4zxb5zdbez@gilmour.lan>
 <CAJiuCcf_LHrJ6QdZgH8HyN6TRiT+GiD+t4UggFCrz-VwVHXV6w@mail.gmail.com>
 <20200504120942.lnrxnnmykqnvw3fb@gilmour.lan>
In-Reply-To: <20200504120942.lnrxnnmykqnvw3fb@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 4 May 2020 21:43:05 +0200
Message-ID: <CAJiuCceF340FiLvyeXNZtvqftQMAmk=MtFDLT_9696ix+eH1Yw@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] ASoC: sun4i-i2s: Add support for H6 I2S
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

Hi Maxime,

On Mon, 4 May 2020 at 14:09, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Clement,
>
> On Thu, Apr 30, 2020 at 04:00:14PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > On Thu, 30 Apr 2020 at 10:46, Maxime Ripard <maxime@cerno.tech> wrote:
> > > On Wed, Apr 29, 2020 at 06:33:00PM +0200, Cl=C3=A9ment P=C3=A9ron wro=
te:
> > > > On Wed, 29 Apr 2020 at 14:35, Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > > >
> > > > > On Tue, Apr 28, 2020 at 10:55:47AM +0200, Cl=C3=A9ment P=C3=A9ron=
 wrote:
> > > > > > > > +static int sun50i_i2s_set_soc_fmt(const struct sun4i_i2s *=
i2s,
> > > > > > > > +                              unsigned int fmt)
> > > > > > >
> > > > > > > The alignment is off here
> > > > > > >
> > > > > > > > +{
> > > > > > > > +     u32 mode, val;
> > > > > > > > +     u8 offset;
> > > > > > > > +
> > > > > > > > +     /*
> > > > > > > > +      * DAI clock polarity
> > > > > > > > +      *
> > > > > > > > +      * The setup for LRCK contradicts the datasheet, but =
under a
> > > > > > > > +      * scope it's clear that the LRCK polarity is reverse=
d
> > > > > > > > +      * compared to the expected polarity on the bus.
> > > > > > > > +      */
> > > > > > >
> > > > > > > Did you check this or has it been copy-pasted?
> > > > > >
> > > > > > copy-pasted, I will check this.
> > > > >
> > > > > It's not going to be easy to do this if you only have a board wit=
h HDMI. If you
> > > > > can't test that easily, just remove the comment (or make it expli=
cit that you
> > > > > copy pasted it?), no comment is better than a wrong one.
> > > >
> > > > I have talked with Marcus Cooper it may be able to test this this w=
eek-end.
> > > > Also this can explain why we need the "
> > > > simple-audio-card,frame-inversion;" in the device-tree.
> > > >
> > > > If think this fix has been introduced by you, correct? Could you sa=
y
> > > > on which SoC did you see this issue?
> > >
> > > This was seen on an H3
> >
> > Just two more questions:
> > - Did you observe this issue on both TDM and I2S mode?
> > - On which DAI node?
>
> This is fairly fuzzy now and I don't remember if I tested it in I2S. Let'=
s
> assume I didn't. And similarly, I'm not sure what the exact controller wa=
s, but
> it was one of the regular controllers (so not either connected to the cod=
ec or
> the HDMI, one that goes out of the SoC).
>
> We had pretty much the same issue on the A33 in I2S for the codec though:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/sound/soc/sunxi/sun8i-codec.c?id=3D18c1bf35c1c09bca05cf70bc984a4764e0b0372=
b
>
> I didn't think of it that way then, but it might very well have been the =
i2s
> controller suffering the same issue.
>
> > Since recent change in sun4i-i2s.c, we had to introduce the
> > "simple-audio-card,frame-inversion" in LibreElec tree.
>
> Do you have a link to that commit ? I couldn't find anything on libreelec=
's
> github repo.

These commits:
https://github.com/LibreELEC/LibreELEC.tv/blob/master/projects/Allwinner/de=
vices/A64/patches/linux/04-Add-frame-inversion-to-correct-multi-channel-aud=
io.patch
https://github.com/LibreELEC/LibreELEC.tv/blob/master/projects/Allwinner/de=
vices/H3/patches/linux/17-Add-frame-inversion-to-correct-multi-channel-audi=
o.patch
https://github.com/LibreELEC/LibreELEC.tv/blob/master/projects/Allwinner/de=
vices/H6/patches/linux/16-Add-frame-inversion-to-correct-multi-channel-audi=
o.patch

>
> > H3 boards are quite common in LibreElec community so I think:
> >  - This fix is only needed in TDM mode
> >  - Or this fix is not required for the HDMI DAI node (HDMI DAI is a
> > little bit different compare to other DAI but I think the first guess
> > is more likely)
>
> Given what we know about the A33, I'd be inclined to say the latter. I'd =
don't
> have the tools to check anymore, but if you have even a cheap logical ana=
lyzer,
> i2s being pretty slow you can definitely see it.

Me neither but maybe Marcus will be able to check this.
Thanks for all these informations.

>
> Maxime
