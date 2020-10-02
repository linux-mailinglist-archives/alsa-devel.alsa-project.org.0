Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D1928175E
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 18:03:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 521111F20;
	Fri,  2 Oct 2020 18:02:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 521111F20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601654607;
	bh=Mm3SHjlM5PQ+AFMb3oi/JJNeF4drskX2sjL1B0PuVWk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cVJrcQWjBAch4HTx+bIHJEzzeo8WPcB34LDWKzDgnAQucaY5HUjREAnMEvUf8P6Yi
	 e7y83FQtb1kbBugecox3wnQhWPbZMf35GuJmHezVC1wzGR9caugXz5rgC8wvM4+W5a
	 xl6EjkeLXMYLdCl/qb6igeswE1/BM1U//FZkvAag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73066F80228;
	Fri,  2 Oct 2020 18:01:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D58ACF801F9; Fri,  2 Oct 2020 18:01:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E39AFF800AB
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 18:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E39AFF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VOR2gMTs"
Received: by mail-io1-xd43.google.com with SMTP id l8so2047793ioh.11
 for <alsa-devel@alsa-project.org>; Fri, 02 Oct 2020 09:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=djx2E1NwbIz4/NZf9pUZHpgnzpKYA44NN+Q6dr4EQBY=;
 b=VOR2gMTsMF6YapeksUWrfxuuAonuvm7dyeNpVx9In8aGbHotqpoTp2kPpH9tJMnKd0
 MwlDHqMPU/qxAiLIrntySAJ2F3QSZMHfjitSZ4qs8HhpyDW9pLJEuOlnaUu9Fbx1STLP
 L7jG2/EywJPwzl57SDzNq8n3Q8upBdCBHO8SE4Q95EzDzHnekbehmmjpvQiJ38c4w3d5
 I06XIghpFSFn+xXvsH4An6TPEpaG3HwOekq32V+DavFdKvEgCnmw8WVJPhSpTungpf42
 FQ4BKfASHwV4Xcmx78Keu9hYXx+x6ftUzKcm1sp3K1nj+8x81GN7oc4yOO0YG0fHc/cu
 fu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=djx2E1NwbIz4/NZf9pUZHpgnzpKYA44NN+Q6dr4EQBY=;
 b=J3fHWpdrCZ60OfR43oxU3F5xZFb2z3V3q39z7T4TQFmy9e3szRzu9Wu3HnCR/jJSEM
 zUTi6eTU/V8pNDONIf8SnsB6IGGhI1kqjm+AZ/6lDK6+fCz+W9JKqnT+3QWIb8SpqsAQ
 YuIrPMMbinQec9sVEa+/NipRpxTdm4KpXtQOH3MU106pGCe9icfCI2pxkAVwfq2cM5GV
 SDRhs8+Aw3CZx4MizrIpyvhCyD6xgOhHqqLUPO27DbtpR+BRrf3Sz11lN22x1G/0kbUh
 hY+mMCsdj/09+fYnDVzqBkvnS90bScVWkZ3khxziv5wHx1Xf+ws5P+9ioEGntuAXuRrV
 KZAw==
X-Gm-Message-State: AOAM531I4vN41Yr4VsUM2CjH6JfIcYocQNxxwaDTVYNG5HeNphbQY9C2
 uGDcgb3mnIFT5Yj/mgEio6OhyFAVeMN2s4a5bcI=
X-Google-Smtp-Source: ABdhPJzr6hI4rDHBo9EOgqPBQNjU8Ul0TWnkEY/jKqZML69oSKgD/moghYTeu46CCisvwf7vmiU36Zt8SWWVPT/jWho=
X-Received: by 2002:a5d:8ace:: with SMTP id e14mr2463373iot.124.1601654492346; 
 Fri, 02 Oct 2020 09:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200927192912.46323-1-peron.clem@gmail.com>
 <20200927192912.46323-10-peron.clem@gmail.com>
 <CAGb2v64uAHUd=Ag2pQDqH=gjtPVso5dnKKdCn3ihyiVh8V8L=g@mail.gmail.com>
 <CAGb2v64U9b1Ayq-XNCHb3z6spsds6eDaz3C4EsV9xFOquHrB7w@mail.gmail.com>
In-Reply-To: <CAGb2v64U9b1Ayq-XNCHb3z6spsds6eDaz3C4EsV9xFOquHrB7w@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Fri, 2 Oct 2020 18:01:21 +0200
Message-ID: <CAJiuCcfThSqpobeZW7ugnmokc4Xy0n9o+5jvOfP9eqzvDbu_BQ@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v5 09/20] arm64: dts: allwinner: h6: Add DAI
 node and soundcard for HDMI
To: Chen-Yu Tsai <wens@csie.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
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

Hi Chen-Yu,

On Mon, 28 Sep 2020 at 07:42, Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Mon, Sep 28, 2020 at 1:32 PM Chen-Yu Tsai <wens@csie.org> wrote:
> >
> > On Mon, Sep 28, 2020 at 3:29 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gma=
il.com> wrote:
> > >
> > > From: Jernej Skrabec <jernej.skrabec@siol.net>
> > >
> > > Add the I2S node used by the HDMI and a simple-soundcard to
> > > link audio between HDMI and I2S.
> > >
> > > Note that the HDMI codec requires an inverted frame clock and
> > > a fixed I2S width. As there is no such option for I2S we use
> > > TDM property of the simple-soundcard to do that.
> > >
> > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 33 ++++++++++++++++++=
++
> > >  1 file changed, 33 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm6=
4/boot/dts/allwinner/sun50i-h6.dtsi
> > > index 28c77d6872f6..a8853ee7885a 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > @@ -67,6 +67,25 @@ de: display-engine {
> > >                 status =3D "disabled";
> > >         };
> > >
> > > +       hdmi_sound: hdmi-sound {
> > > +               compatible =3D "simple-audio-card";
> > > +               simple-audio-card,format =3D "i2s";
> > > +               simple-audio-card,name =3D "sun50i-h6-hdmi";
> > > +               simple-audio-card,mclk-fs =3D <128>;
> > > +               simple-audio-card,frame-inversion;
> > > +               status =3D "disabled";
> > > +
> > > +               simple-audio-card,codec {
> > > +                       sound-dai =3D <&hdmi>;
> > > +               };
> > > +
> > > +               simple-audio-card,cpu {
> > > +                       sound-dai =3D <&i2s1>;
> > > +                       dai-tdm-slot-num =3D <2>;
> >
> > Doesn't this end up limiting the number of audio channels HDMI can carr=
y?
> > AFAICT the TDM properties are all optional, so just leave it out.
> >
> > Same goes for the other two patches.
> >
> > > +                       dai-tdm-slot-width =3D <32>;
> > > +               };
> > > +       };
> > > +
> > >         osc24M: osc24M_clk {
> > >                 #clock-cells =3D <0>;
> > >                 compatible =3D "fixed-clock";
> > > @@ -609,6 +628,19 @@ mdio: mdio {
> > >                         };
> > >                 };
> > >
> > > +               i2s1: i2s@5091000 {
> > > +                       #sound-dai-cells =3D <0>;
> > > +                       compatible =3D "allwinner,sun50i-h6-i2s";
> > > +                       reg =3D <0x05091000 0x1000>;
> > > +                       interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIG=
H>;
> > > +                       clocks =3D <&ccu CLK_BUS_I2S1>, <&ccu CLK_I2S=
1>;
> > > +                       clock-names =3D "apb", "mod";
> > > +                       dmas =3D <&dma 4>, <&dma 4>;
> > > +                       resets =3D <&ccu RST_BUS_I2S1>;
> > > +                       dma-names =3D "rx", "tx";
>
> Sorry, missed this one.
>
> Given that usage for this interface is transmit only, and there is no
> RX DRQ number assigned to it, you should drop the RX DMA number and name.

Indeed if there is no DRQ number assigned we shouldn't have it in the
device-tree

but Samuel told me that the `make dtbs_check` reports:

i2s@1c22800: dma-names:0: 'rx' was expected
i2s@1c22800: dma-names: ['tx'] is too short
i2s@1c22800: dmas: [[28, 27]] is too short

Should I fix the YAML so?

Regards,
Clement

>
> > > +                       status =3D "disabled";
> > > +               };
> > > +
> > >                 spdif: spdif@5093000 {
> > >                         #sound-dai-cells =3D <0>;
> > >                         compatible =3D "allwinner,sun50i-h6-spdif";
> > > @@ -739,6 +771,7 @@ ohci3: usb@5311400 {
> > >                 };
> > >
> > >                 hdmi: hdmi@6000000 {
> > > +                       #sound-dai-cells =3D <0>;
> > >                         compatible =3D "allwinner,sun50i-h6-dw-hdmi";
> > >                         reg =3D <0x06000000 0x10000>;
> > >                         reg-io-width =3D <1>;
> >
> > The rest of the patch looks OK.
