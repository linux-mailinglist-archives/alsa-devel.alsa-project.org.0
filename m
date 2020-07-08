Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6886D218CD1
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 18:20:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A9B4950;
	Wed,  8 Jul 2020 18:19:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A9B4950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594225204;
	bh=vjXbKcKdkAFsmiJJiEZ7tBeW92sorwzPcgqtTPI1nVc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VYNUt4cnsBSwDrM8GcYZuR3xgYcmm3afCZyJDRb1CIyNt5IntBBeWmUaWxPDJREgC
	 Rv9dL0h6GFCZ3XamZnv6yBuOVY/3gRGQqy/7OGCy1Bmy2Nw62OedrtuLhlUzjie6n2
	 bV07ApoWs/jmk2Rgb9DorRTbAsi9okvEEqq1KVCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93625F802A0;
	Wed,  8 Jul 2020 18:18:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 298DCF802BD; Wed,  8 Jul 2020 18:18:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_26,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.siol.net (mailoutvs16.siol.net [185.57.226.207])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FADFF802A9
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 18:17:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FADFF802A9
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 4A96C524C57;
 Wed,  8 Jul 2020 18:17:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id oLEpCQVAM4I0; Wed,  8 Jul 2020 18:17:57 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id D452E524C76;
 Wed,  8 Jul 2020 18:17:57 +0200 (CEST)
Received: from jernej-laptop.localnet (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Postfix) with ESMTPA id 47E03524BD7;
 Wed,  8 Jul 2020 18:17:57 +0200 (CEST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 08/16] arm64: dts: allwinner: h6: Add HDMI audio node
Date: Wed, 08 Jul 2020 18:17:57 +0200
Message-ID: <4073007.RJdR9ZcIkj@jernej-laptop>
In-Reply-To: <20200706052937.ygjjllrsj7rvynkq@gilmour.lan>
References: <20200704113902.336911-1-peron.clem@gmail.com>
 <20200704113902.336911-9-peron.clem@gmail.com>
 <20200706052937.ygjjllrsj7rvynkq@gilmour.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-sunxi@googlegroups.com,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

Hi!

Dne ponedeljek, 06. julij 2020 ob 07:29:37 CEST je Maxime Ripard napisal(a):
> Hi,
>=20
> On Sat, Jul 04, 2020 at 01:38:54PM +0200, Cl=E9ment P=E9ron wrote:
> > From: Jernej Skrabec <jernej.skrabec@siol.net>
> >=20
> > Add a simple-soundcard to link audio between HDMI and I2S.
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>
> > ---
> >=20
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 33 ++++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi index
> > 78b1361dfbb9..ae169d07b939 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > @@ -67,6 +67,25 @@ de: display-engine {
> >=20
> >  		status =3D "disabled";
> >  =09
> >  	};
> >=20
> > +	hdmi_sound: hdmi-sound {
> > +		compatible =3D "simple-audio-card";
> > +		simple-audio-card,format =3D "i2s";
> > +		simple-audio-card,name =3D "sun50i-h6-hdmi";
> > +		simple-audio-card,mclk-fs =3D <128>;
> > +		simple-audio-card,frame-inversion;
>=20
> Have you figured that one out?
>=20
> > +		status =3D "disabled";
> > +
> > +		simple-audio-card,codec {
> > +			sound-dai =3D <&hdmi>;
> > +		};
> > +
> > +		simple-audio-card,cpu {
> > +			sound-dai =3D <&i2s1>;
> > +			dai-tdm-slot-num =3D <2>;
> > +			dai-tdm-slot-width =3D <32>;
>=20
> I'm not sure why you need to use the TDM stuff here. IIRC the HDMI
> controller can output on up to 6 channels, so how would that work out?

dai-tdm-slot-width is needed to override automatic slot width selection. It=
=20
should always be 32 for HDMI, no matter what is actual physical sample widt=
h.=20
In this case this property is abused to set width also for I2S mode of=20
operation. IMO there is no sense to duplicate code because I2S variant woul=
d=20
work exactly the same, except name would be different.

I'm not sure about dai-tdm-slot-num. Marcus, can you explain the need for t=
his=20
property?

Would it be better to implement separate link driver instead of using simpl=
e-
card to hide all this properties into the code?

Best regards,
Jernej



