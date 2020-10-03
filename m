Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55950282335
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Oct 2020 11:34:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBBBB1908;
	Sat,  3 Oct 2020 11:34:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBBBB1908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601717699;
	bh=nZRSBslVMZx2IMOBKGeafzRgeGhJfatcGqfFpCEhwoQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rrycSIPI3mILDS3kMUdbNpasbDfeO277nwyWOj4b59LAaIKyCGfGtZp/Z+KUmW3XH
	 kypwjcLRG7NJoVjup+0wV54Sjz6LHVr4R09HfLIPqGnhi7JEHAp9KdrSZZ7AHxjmqF
	 /vVYeg/OX01D//+8TyPVTNPsiBRRvCsab5bHXYbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE34AF80271;
	Sat,  3 Oct 2020 11:32:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69C10F8022B; Sat,  3 Oct 2020 11:32:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F125F800BB
 for <alsa-devel@alsa-project.org>; Sat,  3 Oct 2020 11:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F125F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rDgBrnRU"
Received: by mail-il1-x141.google.com with SMTP id j13so3451199ilc.4
 for <alsa-devel@alsa-project.org>; Sat, 03 Oct 2020 02:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4WQdhvBY7Cu+BKjdKPqvJ/Sk6eBScmJA1Il/OJIwbPY=;
 b=rDgBrnRUVr0DmKj+rS3jI7rJF4bvwpd9IFiBZWo/PewjFMH9pC0KVJPsqhs9JpH3ok
 232gvsoNInvADJblNqWm8QHatzpimcvt3MY7GJbQlJr3nDPzukg9bSmbtYfmakKrjdEc
 UCD1BWfPhzLa7s4kz9hHJ3YLSZZuZHI/qZ5RFEW/XPbv608NrQc6DyvXlc0G7bp5ycOf
 1DPg4IKIpPBbrTUY6jywxcWSAzHLd+CfYTmoEOBWTbOwz49gpIqNmO9Sw3uPWF2Exrbu
 g2m0o7oXwUi4GZBpT0r1d9xqIs7WJI896pLleRDSyqrQiFZVjIALR08QxGHvXUOBGw8J
 DFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4WQdhvBY7Cu+BKjdKPqvJ/Sk6eBScmJA1Il/OJIwbPY=;
 b=a/sLCqE9/IYn9O15/eoMKBCdUJS+yVT1QFRBSc2cijE+ZocKBS13P51Yz97zuYv8rl
 GD7AQkPCcB+XvW3IdykG9tkpcgAZqUi/IpJahrGdcz0Ro6ofq7rm84qNuPBAclUieiAX
 /RYzSZ8+PiV/Olu67QvTnKmq+8AGX+C0+J3nNTJ92Ct5fGvPIZQczzKVpwnYSWqsRnBr
 OuX1MD+khQXaQTPNLpe0m1uCWH6rU2BET90sXAKW0qr0m3l+6HAB+xMHF79XhVX70Kcf
 WXH1O6ZAnRWp6oUutZeSDJeo7su+r4Gsb1ePV5DjExPWSrjmTHu55OSMbtYPTw7tphHW
 5G/w==
X-Gm-Message-State: AOAM531dqGZHpyXRpgnzPg6cEE2wCShO72HEtzD/fUrlZf7dkiXlSIwM
 jV/1i+JPdTEJzDs5jD3Ve10hSfcdoHmJ9T1SmM0=
X-Google-Smtp-Source: ABdhPJwznevI08Npwv/RTZ1m5OlGQQK2mF55vXywQ3Oe368RprFs3Wb7KZq9VD5M6dksP3D8DwkZVXut+VNuWVOmC7s=
X-Received: by 2002:a05:6e02:804:: with SMTP id
 u4mr4609563ilm.35.1601717546019; 
 Sat, 03 Oct 2020 02:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200927192912.46323-1-peron.clem@gmail.com>
 <20200927192912.46323-10-peron.clem@gmail.com>
 <CAGb2v64uAHUd=Ag2pQDqH=gjtPVso5dnKKdCn3ihyiVh8V8L=g@mail.gmail.com>
 <CAGb2v64U9b1Ayq-XNCHb3z6spsds6eDaz3C4EsV9xFOquHrB7w@mail.gmail.com>
 <CAJiuCcfThSqpobeZW7ugnmokc4Xy0n9o+5jvOfP9eqzvDbu_BQ@mail.gmail.com>
 <20201002162434.3jeksuelrig6yyo5@gilmour.lan>
In-Reply-To: <20201002162434.3jeksuelrig6yyo5@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sat, 3 Oct 2020 11:32:14 +0200
Message-ID: <CAJiuCccfJP4VTrpVN0ez900zWZSUbP703Hx2qa-NKdGrXwiFyQ@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v5 09/20] arm64: dts: allwinner: h6: Add DAI
 node and soundcard for HDMI
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
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

Hi,

On Fri, 2 Oct 2020 at 18:24, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Fri, Oct 02, 2020 at 06:01:21PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > Hi Chen-Yu,
> >
> > On Mon, 28 Sep 2020 at 07:42, Chen-Yu Tsai <wens@csie.org> wrote:
> > >
> > > On Mon, Sep 28, 2020 at 1:32 PM Chen-Yu Tsai <wens@csie.org> wrote:
> > > >
> > > > On Mon, Sep 28, 2020 at 3:29 AM Cl=C3=A9ment P=C3=A9ron <peron.clem=
@gmail.com> wrote:
> > > > >
> > > > > From: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > >
> > > > > Add the I2S node used by the HDMI and a simple-soundcard to
> > > > > link audio between HDMI and I2S.
> > > > >
> > > > > Note that the HDMI codec requires an inverted frame clock and
> > > > > a fixed I2S width. As there is no such option for I2S we use
> > > > > TDM property of the simple-soundcard to do that.
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
arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > index 28c77d6872f6..a8853ee7885a 100644
> > > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > @@ -67,6 +67,25 @@ de: display-engine {
> > > > >                 status =3D "disabled";
> > > > >         };
> > > > >
> > > > > +       hdmi_sound: hdmi-sound {
> > > > > +               compatible =3D "simple-audio-card";
> > > > > +               simple-audio-card,format =3D "i2s";
> > > > > +               simple-audio-card,name =3D "sun50i-h6-hdmi";
> > > > > +               simple-audio-card,mclk-fs =3D <128>;
> > > > > +               simple-audio-card,frame-inversion;
> > > > > +               status =3D "disabled";
> > > > > +
> > > > > +               simple-audio-card,codec {
> > > > > +                       sound-dai =3D <&hdmi>;
> > > > > +               };
> > > > > +
> > > > > +               simple-audio-card,cpu {
> > > > > +                       sound-dai =3D <&i2s1>;
> > > > > +                       dai-tdm-slot-num =3D <2>;
> > > >
> > > > Doesn't this end up limiting the number of audio channels HDMI can =
carry?
> > > > AFAICT the TDM properties are all optional, so just leave it out.
> > > >
> > > > Same goes for the other two patches.
> > > >
> > > > > +                       dai-tdm-slot-width =3D <32>;
> > > > > +               };
> > > > > +       };
> > > > > +
> > > > >         osc24M: osc24M_clk {
> > > > >                 #clock-cells =3D <0>;
> > > > >                 compatible =3D "fixed-clock";
> > > > > @@ -609,6 +628,19 @@ mdio: mdio {
> > > > >                         };
> > > > >                 };
> > > > >
> > > > > +               i2s1: i2s@5091000 {
> > > > > +                       #sound-dai-cells =3D <0>;
> > > > > +                       compatible =3D "allwinner,sun50i-h6-i2s";
> > > > > +                       reg =3D <0x05091000 0x1000>;
> > > > > +                       interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL=
_HIGH>;
> > > > > +                       clocks =3D <&ccu CLK_BUS_I2S1>, <&ccu CLK=
_I2S1>;
> > > > > +                       clock-names =3D "apb", "mod";
> > > > > +                       dmas =3D <&dma 4>, <&dma 4>;
> > > > > +                       resets =3D <&ccu RST_BUS_I2S1>;
> > > > > +                       dma-names =3D "rx", "tx";
> > >
> > > Sorry, missed this one.
> > >
> > > Given that usage for this interface is transmt only, and there is no
> > > RX DRQ number assigned to it, you should drop the RX DMA number and n=
ame.
> >
> > Indeed if there is no DRQ number assigned we shouldn't have it in the
> > device-tree

After reviewing the H6 User Manual it seems to be assigned :
page 269 3.10.3.3 DRQ TYPE
port 4 =3D> I2S/PCM1-RX /  I2S/PCM1-TX
Same for A64
But indeed it's not mapped for H5.

I will fix the yaml for H3/H5 but not for A64/H6.

Regards,
Clement


> >
> > but Samuel told me that the `make dtbs_check` reports:
> >
> > i2s@1c22800: dma-names:0: 'rx' was expected
> > i2s@1c22800: dma-names: ['tx'] is too short
> > i2s@1c22800: dmas: [[28, 27]] is too short
> >
> > Should I fix the YAML so?
>
> Yep :)
>
> Maxime
