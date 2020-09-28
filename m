Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A20327AFFC
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 16:29:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E714818CF;
	Mon, 28 Sep 2020 16:29:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E714818CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601303399;
	bh=lC/H4lhipuFLcG7i7/wRlckWXhY7RDOeyiXinRFCV/w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lfAyPNmqLmGJYK6+CyzzOPTh+qAr3RO014cgNQNGSVuX9axJMOT6rcZdV//TYglUm
	 Yw7Xyeu1+d7761GBfpm8HMdN9rhqajw1ujfnM1tK0Rhw8Y9b94jDBTL8v5kfm2NqXG
	 tuT+xz7CyxWam5T4i9h07Ldkfwhaiu4Esk6RZzAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DBE12F801F9;
	Mon, 28 Sep 2020 16:28:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32D5EF801ED; Mon, 28 Sep 2020 16:28:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D098F800FD
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 16:27:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D098F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BOKMig27"
Received: by mail-il1-x143.google.com with SMTP id t12so1430368ilh.3
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 07:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=swpXeTWHWCNF6KXrz68zf9yRkpoPYhiTjW+lMQcubDQ=;
 b=BOKMig27yWnniwJh3B4l/zCp7mHNUCUubmP8fwzAFvtftEdZrq/J5g9GHUBm8+rBuS
 7amT5mIVNrvgC4h1nJVlIySswEDjj9KrXY7EYQiVaVvuH7TBrJ6dfBuiWOfpA6V2IDOx
 x9LC2kOWZB0ps5+Cyr6Xg+yjE8OMl6kIbLSj/ATKUBG5HsSlyCEdJfEQK70juLfljq5j
 1dQF4HWNgPah2G3fS8Xd50ag91nSTfdiRRC+sj1wUizOwipypUqx7Pk3IoeV7D/SwCNf
 U3/X/j+AwtDaXBvH5eeOcRi5yscC+RRR6tBZQYohGmJfwYktf4JYiFAbARckHIswggK1
 P8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=swpXeTWHWCNF6KXrz68zf9yRkpoPYhiTjW+lMQcubDQ=;
 b=CjyIQpn0Q9G5GDg88IJkFAs1skZQUR/MYrLcxksMLvFLGx5rlwSNM5tPHAg5l6uX/m
 CQCg6I3f9nHlMuTKCy9IMb0DAy1Rx/j5m5dVh+GBjgkUppB0hInT/GZ5Uhg+erLdTGZw
 eL7E6IE4jhEoxjyp+MGc6+xlG5ItrVPx1oUsLG0rp3o6oH6xyRX1YkF6583TFFrCXWAE
 DSDcd6EdvTNjm4oy95vgCRJo6Wohw9DMobr3BfVVwcEcqAByzeIkQCGKMsK2+GYYOEu/
 3sF4x+doMK4nmdMHFQbSrHe7b+RgPKT2vHtU235MFNxZz/ljeccAHKkD4BMTrcrcgwAp
 XFAg==
X-Gm-Message-State: AOAM5328M7b/fgkGMNBM5XY0Dy05Amxp8FeQ8BMOS6xyi8sy//H8X07k
 Z6rRo5wEO3/96fiPBdMfVDSYl5k8IG9jFD7f5UI=
X-Google-Smtp-Source: ABdhPJzOveX0je2bblXhCXBXIiaCyUUc4S3JAXPSmt4lEfMi8iabOV8HZOiVHqjpmvDzsFtEhoueN56owxsQKZojPH0=
X-Received: by 2002:a92:d68b:: with SMTP id p11mr1294955iln.59.1601303274202; 
 Mon, 28 Sep 2020 07:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200921102731.747736-1-peron.clem@gmail.com>
 <20200921135925.q7mde2cnt5jtzkb5@gilmour.lan>
 <CAJiuCcfz9A_Vmzq=s3LK2kGB_1tZPkC9Ux+Brdocp9py0fovAg@mail.gmail.com>
 <59286578.E0qSRroNqr@kista> <20200928084308.eipnvlfqe3c5lfmg@gilmour.lan>
In-Reply-To: <20200928084308.eipnvlfqe3c5lfmg@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 28 Sep 2020 16:27:42 +0200
Message-ID: <CAJiuCceHXr_5PvG-FW+hRNV7Q33hGrp8kLbO0EgfqqBxF7wbqQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/22] arm64: dts: allwinner: h6: Add HDMI audio node
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>,
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

On Mon, 28 Sep 2020 at 10:43, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Sep 21, 2020 at 08:37:09PM +0200, Jernej =C5=A0krabec wrote:
> > Dne ponedeljek, 21. september 2020 ob 19:23:49 CEST je Cl=C3=A9ment P=
=C3=A9ron
> > napisal(a):
> > > Hi Maxime,
> > >
> > > On Mon, 21 Sep 2020 at 15:59, Maxime Ripard <maxime@cerno.tech> wrote=
:
> > > >
> > > > On Mon, Sep 21, 2020 at 12:27:18PM +0200, Cl=C3=A9ment P=C3=A9ron w=
rote:
> > > > > From: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > >
> > > > > Add a simple-soundcard to link audio between HDMI and I2S.
> > > > >
> > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 33 ++++++++++++++=
++++++
> > > > >  1 file changed, 33 insertions(+)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/=
arm64/
> > boot/dts/allwinner/sun50i-h6.dtsi
> > > > > index 28c77d6872f6..a8853ee7885a 100644
> > > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > @@ -67,6 +67,25 @@ de: display-engine {
> > > > >               status =3D "disabled";
> > > > >       };
> > > > >
> > > > > +     hdmi_sound: hdmi-sound {
> > > > > +             compatible =3D "simple-audio-card";
> > > > > +             simple-audio-card,format =3D "i2s";
> > > > > +             simple-audio-card,name =3D "sun50i-h6-hdmi";
> > > > > +             simple-audio-card,mclk-fs =3D <128>;
> > > > > +             simple-audio-card,frame-inversion;
> > > > > +             status =3D "disabled";
> > > > > +
> > > > > +             simple-audio-card,codec {
> > > > > +                     sound-dai =3D <&hdmi>;
> > > > > +             };
> > > > > +
> > > > > +             simple-audio-card,cpu {
> > > > > +                     sound-dai =3D <&i2s1>;
> > > > > +                     dai-tdm-slot-num =3D <2>;
> > > > > +                     dai-tdm-slot-width =3D <32>;
> > > >
> > > > It looks weird to have both some TDM setup here, and yet the format=
 in
> > > > i2s?
> > >
> > > Yes, I agree I will check if it's really needed.
> >
> > I think this was explained before.
>
> Possibly, but this should be in a comment or at least the commit log
>
> > Anyway, this is needed to force width to 32, no matter actual sample
> > width. That's a requirement of HDMI codec. I believe Marcus Cooper
> > have another codec which also needs fixed width.
> >
> > There is no similar property for I2S, so TDM one is used here.
>
> Except it's really dedicated to the TDM mode and doesn't really make
> much sense here.
>
> If we have special requirements like this on the codec setup, that
> sounds like a good justification for creating a custom codec instead of
> shoehorning it into simple-card

When all the remarks are fixed would it be possible to merge the rest
of the series without the dts changes ?

I will propose another series to introduce a dedicated codec for that.

>
> Maxime
