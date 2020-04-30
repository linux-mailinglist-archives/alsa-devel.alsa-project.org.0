Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 675371BFDDB
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 16:22:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19EF616D6;
	Thu, 30 Apr 2020 16:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19EF616D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588256539;
	bh=Shh8Hi6+q10K6dQe13kwf19fcf48z4r+Eq/hYrd3uw4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sktT+xL2/prbAF00sXHj+9gvdF/dWegikdVhWVcLn6R7W6xXcwCQrEIS3t0NLsqrW
	 qbyXvSLnjL5CyaDgWBc8MPcxYQRL3zqNYLyDAGreLr2S0AoEc47d4EyG7oJUdRwBsE
	 FUa60qJWQDDl68z4BDyi2HzRNF9ABGTjQ3wl8o6M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34FE7F802BC;
	Thu, 30 Apr 2020 16:00:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5498CF802A9; Thu, 30 Apr 2020 16:00:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F077F802A1
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 16:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F077F802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Wxsmkjon"
Received: by mail-io1-xd43.google.com with SMTP id w4so1548071ioc.6
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 07:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nz4EYudAGnRAka2sLpxAUHkI/tIzbc4FpKMb2iD2HGI=;
 b=WxsmkjonITcLJ97YhEvjgmBobJxYhdcS0FMYbI0ha9eAYIbOvVa++0B/N61OFuA+vq
 TZYJoOOK1ZCNtDRuUb0+F6GjgICAVNM5rw4vEuVnM80xd3VkxSFGCpu0bX2tf4mdswgH
 D8T/Hct4kccVa1z5uGmKgC3cbV8W5/BGPIlISHzo6yjyI6Yd84kp1sl1eFHyPTD6GGmH
 0Q1F1IZODwzZhcHFUAcQpScBz+tK/gV6IwRa2pAu8aiuKxSgJ9XM9CrOeEgOUpJR6Mg0
 6oYATFOQutPCYugnCrV+5/HZ8KiRd7lgTda3lkj13rjmdcAeGR16UBPZIBdRZZnJts6f
 Vuww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nz4EYudAGnRAka2sLpxAUHkI/tIzbc4FpKMb2iD2HGI=;
 b=aKdak2lXDJDJ/eGCvJRNqTK6BGshMoNUQmdQgl8oAUqHDYQWxjV6ArL7utwPexpY4a
 6giFesLsNQBt5fL1jRwLW42+SJe34dpI9YMkrLl7Q2aHt5Td/ageI86KZpoPqm5VA8ml
 GFZoHCX6TIPWfp5Va2F54Shfoi1er5BeX9qyxiIbz4CqjkYSXIfb75+AErMAbL0aqQrd
 vTW4gvv+QVQtUeNztCMfblVTydsE6dm3IAGb+93AWD9P3CbHaug83ScxeEWQCl2vlUCR
 bJbW9ocx0MnyK4FlLLhXkpOqp0moa4N2W89zQTLzfMtbVHGyIT3GpwoXQGyAimSczAFn
 6DpQ==
X-Gm-Message-State: AGi0PuYEasFC7sJpvkZ7QJdLKAQoB+fg5R1IyOIOMcu2Guf8b/2FgmlS
 nukV3ZFGyYhluCqv1hnMPpOQVd0xvvwn2qweRPU=
X-Google-Smtp-Source: APiQypL/hGXbUxNw4AVM3ITxY+bWgZQNGgI8BdvnXtQMrcBmjvMtXdgrG7Lhm8mMQi0TVyWgoYz+zdbaXKGpRu9prEA=
X-Received: by 2002:a6b:b8d6:: with SMTP id i205mr2058871iof.123.1588255225316; 
 Thu, 30 Apr 2020 07:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200426104115.22630-1-peron.clem@gmail.com>
 <20200426104115.22630-4-peron.clem@gmail.com>
 <20200428081321.ht3el26yqhsnyfm4@gilmour.lan>
 <CAJiuCcdVs_drs40Q6537BYfz24F7NmC6B8S5-Lt4V4ggs-FXWA@mail.gmail.com>
 <20200429123529.y24dpy63wxq7uvkt@gilmour.lan>
 <CAJiuCcfXqizcq_JuXRCsqEqM2562cr1SGJ0pmy07jcJxAXojOw@mail.gmail.com>
 <20200430084600.samghw4zxb5zdbez@gilmour.lan>
In-Reply-To: <20200430084600.samghw4zxb5zdbez@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Thu, 30 Apr 2020 16:00:14 +0200
Message-ID: <CAJiuCcf_LHrJ6QdZgH8HyN6TRiT+GiD+t4UggFCrz-VwVHXV6w@mail.gmail.com>
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

On Thu, 30 Apr 2020 at 10:46, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Wed, Apr 29, 2020 at 06:33:00PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > On Wed, 29 Apr 2020 at 14:35, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Tue, Apr 28, 2020 at 10:55:47AM +0200, Cl=C3=A9ment P=C3=A9ron wro=
te:
> > > > > > +static int sun50i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
> > > > > > +                              unsigned int fmt)
> > > > >
> > > > > The alignment is off here
> > > > >
> > > > > > +{
> > > > > > +     u32 mode, val;
> > > > > > +     u8 offset;
> > > > > > +
> > > > > > +     /*
> > > > > > +      * DAI clock polarity
> > > > > > +      *
> > > > > > +      * The setup for LRCK contradicts the datasheet, but unde=
r a
> > > > > > +      * scope it's clear that the LRCK polarity is reversed
> > > > > > +      * compared to the expected polarity on the bus.
> > > > > > +      */
> > > > >
> > > > > Did you check this or has it been copy-pasted?
> > > >
> > > > copy-pasted, I will check this.
> > >
> > > It's not going to be easy to do this if you only have a board with HD=
MI. If you
> > > can't test that easily, just remove the comment (or make it explicit =
that you
> > > copy pasted it?), no comment is better than a wrong one.
> >
> > I have talked with Marcus Cooper it may be able to test this this week-=
end.
> > Also this can explain why we need the "
> > simple-audio-card,frame-inversion;" in the device-tree.
> >
> > If think this fix has been introduced by you, correct? Could you say
> > on which SoC did you see this issue?
>
> This was seen on an H3

Just two more questions:
- Did you observe this issue on both TDM and I2S mode?
- On which DAI node?

Since recent change in sun4i-i2s.c, we had to introduce the
"simple-audio-card,frame-inversion" in LibreElec tree.
H3 boards are quite common in LibreElec community so I think:
 - This fix is only needed in TDM mode
 - Or this fix is not required for the HDMI DAI node (HDMI DAI is a
little bit different compare to other DAI but I think the first guess
is more likely)

Regards,
Clement

>
> Maxime
