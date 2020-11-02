Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1446A2A28F2
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 12:21:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92F5616B9;
	Mon,  2 Nov 2020 12:20:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92F5616B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604316099;
	bh=GEoUg5rCgTkgRYcJyr+nfgB5OEXj0gqibv1EB00LCis=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hy1aukJ4b8DXe99MT0Zqc75/mswr82lj8EUSdj28hZgaXBVz2pkXDTIATqDeKJELc
	 RS1TYrSwQm4bJ6B7YujsHJlOVn6soldROW20Ze4oXR0lXSD+P8QO/PxgKKEAJXL5XY
	 4Ajhog5I9Ksi8G6+kQoxEqDQCIrYLtn2hlqR0YF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDA77F80234;
	Mon,  2 Nov 2020 12:20:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 629CEF80232; Mon,  2 Nov 2020 12:20:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98FC9F8012B
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 12:19:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98FC9F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rBX5rTWO"
Received: by mail-io1-xd41.google.com with SMTP id s24so7738603ioj.13
 for <alsa-devel@alsa-project.org>; Mon, 02 Nov 2020 03:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6jGIEcHWVxAn3fg0VUHHhYb4aY1F4L9zbPIcUYHsHdk=;
 b=rBX5rTWOyGpQ2QFTArzJXmF9gLj+2qHhpHtq5IccV7K+4i7zEXERiFzL57WJY+4iQX
 5w0fUre1grj24vaBMH4+zK7WtUSE8xQPv4kQQ4ei/rRCO4LldWrvf/9hKf42vlAGlXh1
 S6rGwf6r7WPzLzC69ZwHgXnKZcLHvQZ4G6qYWpkNYPNRzPt/Ydho3dPSUhMcYe66Yvos
 GRyLWQhkTcYclNim1YmzvP6WdrUg5vLj8RXCXeaDuKrMbcSbECG9iMPKJ8Y950kSDDeS
 4jzMIKZLYmwqonUIn4A+5TMDkyxlRfD/Kq7j7k7iNGtH7nQ9mJKXt4IuKLpdAzDGkIAk
 tNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6jGIEcHWVxAn3fg0VUHHhYb4aY1F4L9zbPIcUYHsHdk=;
 b=TXDc3G++cxvpiQ0XgFa7JSqe9CQ+Ne2Dxa6IRaKpzHEVvGhVeKK496m/wW1AOiuqn5
 qF9JtwD/ygN6VMXbnkxfXV5+iGSzs1dIbRzDTKyZ87Cc2oPp1NCO97C4WR1waSzxS3NX
 eX01sibWTknnvSK09xgoy9ji5QF41GJ7QjNPHkMLwveu8LVrgNPKIX6pBHQJDitRw4vB
 Xp60yIUldfRKoP87quj2QQuqf9nFtAEdiW2sSfH9uUIoimvdE5BgmAq/oFQ34oneuxQA
 VVfpEz/KT7uwtQPiHpSprDarEleb6Py//e6MVzkB9/ft/Alimhx6SXvJIr30J8YQL4zR
 LMWQ==
X-Gm-Message-State: AOAM5300YZZTN/puWv0Dpw2+7g1NoTZyy5ZnQMW6avoTO+5MFWVgbfbm
 B7o3hM5Q9UhvQdu+oZcUxIc27A21uyQpx/coKgI=
X-Google-Smtp-Source: ABdhPJx/Qx/ZXs30Y9m8IaogsMishx8Ib+4C2FwhUAGSo+27iaGj5JH/Ee9nIxebt9ovk2o2pSt6QQWjg3AgHAMVA3A=
X-Received: by 2002:a05:6602:164b:: with SMTP id
 y11mr3299604iow.36.1604315995103; 
 Mon, 02 Nov 2020 03:19:55 -0800 (PST)
MIME-Version: 1.0
References: <20200921102731.747736-1-peron.clem@gmail.com>
 <20200921135925.q7mde2cnt5jtzkb5@gilmour.lan>
 <CAJiuCcfz9A_Vmzq=s3LK2kGB_1tZPkC9Ux+Brdocp9py0fovAg@mail.gmail.com>
 <59286578.E0qSRroNqr@kista> <20200928084308.eipnvlfqe3c5lfmg@gilmour.lan>
 <CAJiuCceHXr_5PvG-FW+hRNV7Q33hGrp8kLbO0EgfqqBxF7wbqQ@mail.gmail.com>
 <20200930101915.sultshdvxgu5u2rs@gilmour.lan>
 <CAJiuCcdMbMQGoBG-SmgQ5=25v3AB+kh0H8ZdX7rFMHAXQ2A=QA@mail.gmail.com>
 <20201102102117.hp6v5nnkhzp3bful@gilmour.lan>
In-Reply-To: <20201102102117.hp6v5nnkhzp3bful@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 2 Nov 2020 12:19:44 +0100
Message-ID: <CAJiuCceXBBWLCg6pgH389m8itauHkfcvVoe-EgnZxnQx3xrzMg@mail.gmail.com>
Subject: Re: [PATCH v4 09/22] arm64: dts: allwinner: h6: Add HDMI audio node
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
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

On Mon, 2 Nov 2020 at 11:21, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Sun, Nov 01, 2020 at 04:27:05PM +0100, Cl=C3=A9ment P=C3=A9ron wrote:
> > On Wed, 30 Sep 2020 at 12:19, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Mon, Sep 28, 2020 at 04:27:42PM +0200, Cl=C3=A9ment P=C3=A9ron wro=
te:
> > > > On Mon, 28 Sep 2020 at 10:43, Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > > >
> > > > > On Mon, Sep 21, 2020 at 08:37:09PM +0200, Jernej =C5=A0krabec wro=
te:
> > > > > > Dne ponedeljek, 21. september 2020 ob 19:23:49 CEST je Cl=C3=A9=
ment P=C3=A9ron
> > > > > > napisal(a):
> > > > > > > Hi Maxime,
> > > > > > >
> > > > > > > On Mon, 21 Sep 2020 at 15:59, Maxime Ripard <maxime@cerno.tec=
h> wrote:
> > > > > > > >
> > > > > > > > On Mon, Sep 21, 2020 at 12:27:18PM +0200, Cl=C3=A9ment P=C3=
=A9ron wrote:
> > > > > > > > > From: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > > > > > >
> > > > > > > > > Add a simple-soundcard to link audio between HDMI and I2S=
.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > > > > > > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > > > > > > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.=
com>
> > > > > > > > > ---
> > > > > > > > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 33 ++++++=
++++++++++++++
> > > > > > > > >  1 file changed, 33 insertions(+)
> > > > > > > > >
> > > > > > > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi=
 b/arch/arm64/
> > > > > > boot/dts/allwinner/sun50i-h6.dtsi
> > > > > > > > > index 28c77d6872f6..a8853ee7885a 100644
> > > > > > > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > > > > > @@ -67,6 +67,25 @@ de: display-engine {
> > > > > > > > >               status =3D "disabled";
> > > > > > > > >       };
> > > > > > > > >
> > > > > > > > > +     hdmi_sound: hdmi-sound {
> > > > > > > > > +             compatible =3D "simple-audio-card";
> > > > > > > > > +             simple-audio-card,format =3D "i2s";
> > > > > > > > > +             simple-audio-card,name =3D "sun50i-h6-hdmi"=
;
> > > > > > > > > +             simple-audio-card,mclk-fs =3D <128>;
> > > > > > > > > +             simple-audio-card,frame-inversion;
> > > > > > > > > +             status =3D "disabled";
> > > > > > > > > +
> > > > > > > > > +             simple-audio-card,codec {
> > > > > > > > > +                     sound-dai =3D <&hdmi>;
> > > > > > > > > +             };
> > > > > > > > > +
> > > > > > > > > +             simple-audio-card,cpu {
> > > > > > > > > +                     sound-dai =3D <&i2s1>;
> > > > > > > > > +                     dai-tdm-slot-num =3D <2>;
> > > > > > > > > +                     dai-tdm-slot-width =3D <32>;
> > > > > > > >
> > > > > > > > It looks weird to have both some TDM setup here, and yet th=
e format in
> > > > > > > > i2s?
> >
> >
> > I was looking at sound documentation regarding how I can properly
> > write the multi-lane I2S support.
> > And I think we made a wrong interpretation here.
> >
> > TDM slot-num and slot-width are not referencing the format called PCM
> > or DSP_A / DSP_B.
> > But really the physical time division representation of a format.
> >
> > For example Amlogic do the following representation for Multi-lane I2S:
> >
> > dai-link-7 {
> >     sound-dai =3D <&tdmif_b>;
> >     dai-format =3D "i2s";
> >     dai-tdm-slot-tx-mask-0 =3D <1 1>;
> >     dai-tdm-slot-tx-mask-1 =3D <1 1>;
> >     dai-tdm-slot-tx-mask-2 =3D <1 1>;
> >     dai-tdm-slot-tx-mask-3 =3D <1 1>;
> >     mclk-fs =3D <256>;
> >
> >     codec {
> >         sound-dai =3D <&tohdmitx TOHDMITX_I2S_IN_B>;
> >     };
> > };
> >
> > So i think for 2 channels HDMI using the simple sound card with TDM
> > property is not a hack but the correct way to represent it.
> >
> > Do you agree ?
> >
> > If so, can I resend the simple sound card for HDMI audio ?
>
> I mean, it's not less weird :)
>
> And like I said before we still have the option to write a card driver
> ourselves that doesn't take anything from the DT beside the phandle of
> the i2s controller and the HDMI controller.
>
> If it's a fixed configuration, I'm not sure why we bother trying to make
> it dynamic in the DT.

Ok I see what you mean here, as the link is hardcoded in the SoC it's
a better representation to hardcode it in the sound card driver than
having it dynamically represented in each board device-tree.

Sounds correct for me,
Thanks :)

>
> Maxime
