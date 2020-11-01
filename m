Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 882512A1F0D
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Nov 2020 16:29:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 122B616AC;
	Sun,  1 Nov 2020 16:28:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 122B616AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604244542;
	bh=MjppX7Zpt2Fibq4J01qprLmbnm6W2OpOIazUWoR8DX0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fgHJpwBpYzpIpN94wNN0/Q2+Jujn25dHsnzOLWsY5hAAgYmACW+GOPsh5FGt3zD/J
	 /JV0x2lOGWWQskOf1z1rf2wQMJoRA5v4UlNVT73rfA2P2BHCseZbtOBqHFBQr8mE5m
	 Pma6pHnSe6BjOCfmZnr1jbBj8MAjZxIRr8syRCZ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 461CAF80171;
	Sun,  1 Nov 2020 16:27:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1838BF80162; Sun,  1 Nov 2020 16:27:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DDCBF80158
 for <alsa-devel@alsa-project.org>; Sun,  1 Nov 2020 16:27:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DDCBF80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UwR8SDbr"
Received: by mail-il1-x143.google.com with SMTP id p10so10785529ile.3
 for <alsa-devel@alsa-project.org>; Sun, 01 Nov 2020 07:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Sb+LSb8yKLdTuo/XIIeo90tsZCqN/YP0x/T/FxuDBAI=;
 b=UwR8SDbrSrYwV9KAxX280xwIhir4IekFmY1Jy0kT1/cM9oDYhC8NK7Dd5ohYWO+w5j
 FuIeOlbBOYTjMY9SSqDBNrlkPWk78ru0QVp97+hekk0OrBe7hlDHvwXh3kh8ZekCLKIf
 3cR6PBOXRUPZ7Tg+GynBO13LAQnzHm5S65HkpxMJ5laybeeSKGSOEnG3B/bfK+ARYX7g
 ETpJIrFVqzDsFNRd9We5ZK+35lxSEe0htDajTKttsTzIMM7Vp+UHxONTvo1hs633OFas
 rLn4RfdXzW1j//a7MtxZiJRFq72HbFnoivkr5c2NyG3jGMxpJ5a1FL2YLYjPIEEkDCz8
 vt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Sb+LSb8yKLdTuo/XIIeo90tsZCqN/YP0x/T/FxuDBAI=;
 b=GSUTkgN8ADSEeCj6CYHOnMNttLSPy2IWSsumJJA+jRcstE3Wh0B0SdS3E0mcgAGPpp
 aT43uS2DFGn9/jNfFiLxMsw7YAyxSGEDWsh43RrmopagsyWfQaHYnQL9N7nuokO5Tj7K
 ACiMw2v/IgGajwfdU98hZCMN5OkOnFqSwXrBiGmo4bk6zFEz3x3emznQ32c7FTlS8y4a
 KnFP9XR31usMVBvF+d7I4kOHg/uyFnTVHQc+MhGvamQ/GVSF6IZkYYoOVpKT1pmqkKaP
 KCXMa1qgOHJTRDt+MAEsgZzSyFB+1a+MJo0rb9Mhia367qi6y+R/5tOmH49u9Y2dms4+
 tb7Q==
X-Gm-Message-State: AOAM532Jyc4nrMHddTzD99FUNxmWo/eqmniJAWldhUAeblHvM9g1XU4L
 cLkSV9hjIIw7UfIfWSdT2JYFNzNrUMhLJK5ljmg=
X-Google-Smtp-Source: ABdhPJwEoz5zwAAz8pt9hCeMJDV9sIBKK1MQ5RDf7d6jvzgiKzk3xcC3XFBUC8hxC5HXm28oB8fAmqySvt/+MD/uLP4=
X-Received: by 2002:a92:5b46:: with SMTP id p67mr7738499ilb.150.1604244436992; 
 Sun, 01 Nov 2020 07:27:16 -0800 (PST)
MIME-Version: 1.0
References: <20200921102731.747736-1-peron.clem@gmail.com>
 <20200921135925.q7mde2cnt5jtzkb5@gilmour.lan>
 <CAJiuCcfz9A_Vmzq=s3LK2kGB_1tZPkC9Ux+Brdocp9py0fovAg@mail.gmail.com>
 <59286578.E0qSRroNqr@kista> <20200928084308.eipnvlfqe3c5lfmg@gilmour.lan>
 <CAJiuCceHXr_5PvG-FW+hRNV7Q33hGrp8kLbO0EgfqqBxF7wbqQ@mail.gmail.com>
 <20200930101915.sultshdvxgu5u2rs@gilmour.lan>
In-Reply-To: <20200930101915.sultshdvxgu5u2rs@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 1 Nov 2020 16:27:05 +0100
Message-ID: <CAJiuCcdMbMQGoBG-SmgQ5=25v3AB+kh0H8ZdX7rFMHAXQ2A=QA@mail.gmail.com>
Subject: Re: [PATCH v4 09/22] arm64: dts: allwinner: h6: Add HDMI audio node
To: Maxime Ripard <maxime@cerno.tech>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Takashi Iwai <tiwai@suse.com>,
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


On Wed, 30 Sep 2020 at 12:19, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Sep 28, 2020 at 04:27:42PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > On Mon, 28 Sep 2020 at 10:43, Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > On Mon, Sep 21, 2020 at 08:37:09PM +0200, Jernej =C5=A0krabec wrote:
> > > > Dne ponedeljek, 21. september 2020 ob 19:23:49 CEST je Cl=C3=A9ment=
 P=C3=A9ron
> > > > napisal(a):
> > > > > Hi Maxime,
> > > > >
> > > > > On Mon, 21 Sep 2020 at 15:59, Maxime Ripard <maxime@cerno.tech> w=
rote:
> > > > > >
> > > > > > On Mon, Sep 21, 2020 at 12:27:18PM +0200, Cl=C3=A9ment P=C3=A9r=
on wrote:
> > > > > > > From: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > > > >
> > > > > > > Add a simple-soundcard to link audio between HDMI and I2S.
> > > > > > >
> > > > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > > > > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > > > > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > > > > > ---
> > > > > > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 33 ++++++++++=
++++++++++
> > > > > > >  1 file changed, 33 insertions(+)
> > > > > > >
> > > > > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/a=
rch/arm64/
> > > > boot/dts/allwinner/sun50i-h6.dtsi
> > > > > > > index 28c77d6872f6..a8853ee7885a 100644
> > > > > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > > > @@ -67,6 +67,25 @@ de: display-engine {
> > > > > > >               status =3D "disabled";
> > > > > > >       };
> > > > > > >
> > > > > > > +     hdmi_sound: hdmi-sound {
> > > > > > > +             compatible =3D "simple-audio-card";
> > > > > > > +             simple-audio-card,format =3D "i2s";
> > > > > > > +             simple-audio-card,name =3D "sun50i-h6-hdmi";
> > > > > > > +             simple-audio-card,mclk-fs =3D <128>;
> > > > > > > +             simple-audio-card,frame-inversion;
> > > > > > > +             status =3D "disabled";
> > > > > > > +
> > > > > > > +             simple-audio-card,codec {
> > > > > > > +                     sound-dai =3D <&hdmi>;
> > > > > > > +             };
> > > > > > > +
> > > > > > > +             simple-audio-card,cpu {
> > > > > > > +                     sound-dai =3D <&i2s1>;
> > > > > > > +                     dai-tdm-slot-num =3D <2>;
> > > > > > > +                     dai-tdm-slot-width =3D <32>;
> > > > > >
> > > > > > It looks weird to have both some TDM setup here, and yet the fo=
rmat in
> > > > > > i2s?


I was looking at sound documentation regarding how I can properly
write the multi-lane I2S support.
And I think we made a wrong interpretation here.

TDM slot-num and slot-width are not referencing the format called PCM
or DSP_A / DSP_B.
But really the physical time division representation of a format.

For example Amlogic do the following representation for Multi-lane I2S:

dai-link-7 {
    sound-dai =3D <&tdmif_b>;
    dai-format =3D "i2s";
    dai-tdm-slot-tx-mask-0 =3D <1 1>;
    dai-tdm-slot-tx-mask-1 =3D <1 1>;
    dai-tdm-slot-tx-mask-2 =3D <1 1>;
    dai-tdm-slot-tx-mask-3 =3D <1 1>;
    mclk-fs =3D <256>;

    codec {
        sound-dai =3D <&tohdmitx TOHDMITX_I2S_IN_B>;
    };
};

So i think for 2 channels HDMI using the simple sound card with TDM
property is not a hack but the correct way to represent it.

Do you agree ?

If so, can I resend the simple sound card for HDMI audio ?

Thanks,
Clement

> > > > >
> > > > > Yes, I agree I will check if it's really needed.
> > > >
> > > > I think this was explained before.
> > >
> > > Possibly, but this should be in a comment or at least the commit log
> > >
> > > > Anyway, this is needed to force width to 32, no matter actual sampl=
e
> > > > width. That's a requirement of HDMI codec. I believe Marcus Cooper
> > > > have another codec which also needs fixed width.
> > > >
> > > > There is no similar property for I2S, so TDM one is used here.
> > >
> > > Except it's really dedicated to the TDM mode and doesn't really make
> > > much sense here.
> > >
> > > If we have special requirements like this on the codec setup, that
> > > sounds like a good justification for creating a custom codec instead =
of
> > > shoehorning it into simple-card
> >
> > When all the remarks are fixed would it be possible to merge the rest
> > of the series without the dts changes ?
> >
> > I will propose another series to introduce a dedicated codec for that.
>
> Yeah, sure
>
> Maxime
