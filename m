Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DDE1BB947
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 10:56:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18BEA167D;
	Tue, 28 Apr 2020 10:55:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18BEA167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588064162;
	bh=se+QzcCbY5sNXgN3ujTTcsO4FgQPmUT5GecbASRUJg8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RMEup10Mi+4MWVVhfpHhgEGC8ijWbhQ6676TvgCdedcGk62YcsFhWKjZ5B4TZmh9G
	 VcZso7cP40R19VGXX9Zp7r42AGFtgBNAowcWZC/2izN3bzX8fEHSVzq8dBYB2/D1Wy
	 qO7mu92h1xWBABbDKSynWhGb5efEug4C9UYJUxmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25057F800D2;
	Tue, 28 Apr 2020 10:54:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE21EF801DB; Tue, 28 Apr 2020 10:54:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAC11F800D2
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 10:54:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAC11F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bsFvHtQg"
Received: by mail-il1-x141.google.com with SMTP id c18so4248169ile.5
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 01:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dDgulWnHGZo56l/rwtjNPISMYmw8h8PKUdGgHUf/qbQ=;
 b=bsFvHtQgLA9U5xzZknhx5MWq1lav+iBhrlYLLy/RFrIxJCCZYXtPdiI9CYGPsOpUb4
 PbUMU8veALBn6Ielw6gMIuf1TIhd+jknAnEWCaC+XToSiri5IjsszZMqLqnfSZxLFzgI
 FOg+4Rn9cs6ReBn8ouy2wMpXsv0fr7I6z6ppQCOidhy3SVghFEXyjZMh2gJyeNSCpXdi
 g/9/6GDL4+DD6aLVJr82+aCYgGlY3ewCkCeOA3qhN8HGEPrQkDAsp+xEguvzAzqjBVzr
 48nhVLmXLA6gqeccxuLl+oSLxT6fxlwaXxMCwsZodpX/bN/8W+tkxYVFuSU0WBBIu7hn
 WeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dDgulWnHGZo56l/rwtjNPISMYmw8h8PKUdGgHUf/qbQ=;
 b=P0RBTBVBeyDoh/eILgTljOMwPTLZ27VKlnSTJ6AxsTYhNzwNmwRtg/ZujHFjPtcRvG
 TeoP/pvQiCUo6gmHsg50E2+p+eVOJtybgkjn9K/eIcK74rfScPvW9CWYL/pdh/k4ncqt
 OB5A/knEkD7NkUsZGsUKBgK75GZZkQaqFK5ks/dYBcnk9oG74FuyOfn+R6aUJWrH4oJI
 Ed+EiBxuvUwG9d/ExvrH3F7m9UWh2rHGBpkCRl8+mwNroDtvG7djHYq5q/IjB1byUZxr
 Xgoq7jMc2slqWBJ0/ZZiLq/paGB8qj8P0lsdUH3LM+zI8aq+rhGX59/P2ZDImo7Rz5in
 7bbA==
X-Gm-Message-State: AGi0PuYaUXatvcYCMA6xACqF9vOMtTmJ1S1Pkj7L0EKesb4cinmdpPYD
 ZPlcIpP5DwNXlwrp9OI4S9w7pWK/9NxX3EscuZs=
X-Google-Smtp-Source: APiQypLjn+quin05VpI7eccg9aPBvq4rkesUHFhJvzeuZEXRWkfxI9E/S60HRrWJ9MxsyWnLP/SFJNPDcKrdHUSAbTY=
X-Received: by 2002:a92:d151:: with SMTP id t17mr3585764ilg.35.1588064051274; 
 Tue, 28 Apr 2020 01:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200426120442.11560-1-peron.clem@gmail.com>
 <20200426120442.11560-5-peron.clem@gmail.com>
 <20200428080020.35qcuylwq2ylmubu@gilmour.lan>
In-Reply-To: <20200428080020.35qcuylwq2ylmubu@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 28 Apr 2020 10:54:00 +0200
Message-ID: <CAJiuCcc2LQ4L36KSfO8iLVFBUO6k+zsZFX+_Ovm_10PoWO4AsA@mail.gmail.com>
Subject: Re: [PATCH 4/7] arm64: dts: allwinner: a64: Add HDMI audio
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
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

On Tue, 28 Apr 2020 at 10:00, Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Sun, Apr 26, 2020 at 02:04:39PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > Add a simple-soundcard to link audio between HDMI and I2S.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 21 +++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64=
/boot/dts/allwinner/sun50i-a64.dtsi
> > index e56e1e3d4b73..08ab6b5e72a5 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > @@ -102,6 +102,25 @@
> >               status =3D "disabled";
> >       };
> >
> > +     hdmi_sound: hdmi-sound {
> > +             compatible =3D "simple-audio-card";
> > +             simple-audio-card,format =3D "i2s";
> > +             simple-audio-card,name =3D "allwinner,hdmi";
>
> I'm not sure what the usual card name should be like though. I would assu=
me that
> this should be something specific enough so that you're able to different=
iate
> between boards / SoC so that the userspace can choose a different configu=
ration
> based on it?

I really don't know what we should use here,
I just have a look at other SoC:
rk3328: "HDMI"
rk3399: "hdmi-sound"
r8a774c0-cat874: "CAT874 HDMI sound"

But maybe it's time to introduce proper name:
What about :
sun50i-a64-hdmi
sun50i-h6-hdmi
How should we handle this with h3 / h5 ?
settings the simple-audio-card,name in each SoC dts?
Or using sun50i-h3-hdmi as they are both identical?

Regards,
Clement


>
> If so, it's really too generic.
>
> Maxime
