Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB7227E677
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 12:21:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18C4416DF;
	Wed, 30 Sep 2020 12:20:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18C4416DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601461276;
	bh=x4Bx/kxLeqOKKqIOSthLZslbzqkefEqlpXpGazmmUCE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FSLfKMIWVflJRQ9h/FrppEoQcB4iADUWTwIehs+9YEmPygMHddFuiWov2ztBrJvdL
	 sK5Fg5u7T8sU6X9G8vK6D3NpPsGhVNKyJ1UdjW8hcb7xvknlA1mjobHNf4zL3QW6xa
	 H5IxSh64AEYjNfAN/vTDJQqzbRyHU0RGR2DtN0n0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4083DF801F9;
	Wed, 30 Sep 2020 12:19:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48104F801ED; Wed, 30 Sep 2020 12:19:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7C65F80110
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 12:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7C65F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="WASw4mxJ"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="crhmRSve"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 85A535803DF;
 Wed, 30 Sep 2020 06:19:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 30 Sep 2020 06:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=51hsmLqz9/nNSWtqEjjDNGJdPsf
 EI5fyVu8+ZU5LqF8=; b=WASw4mxJEzKv4bds0eEWxanJSnI/2TKzJEUgsQAGns3
 K+soucfi0bPYbyYRo3hhV+xWYaT33ApNtXXs0Nwba1F8Zksphw19wtwMpkEsRBg9
 lfpEtRSCKY4/T9hUOJsdx6p5qqsl6mwJEHx+wL0hv8ZsLItEPeRPGfttTYL76Wun
 vp9EGkBesq3JUdmRxSllCZxfVr79dt1jIxQ5LXt1qgIMbkifknSO0OHRhTaIxMkQ
 Z62wwYaL6kNA80yXBYi7bMK/F7LamFV4YvBfBxITQqsorF32KBBxwp1eUVvAPNkK
 qrVY1iYj9S7tG1DV6Wu589+KH8z47or6lWkQ2ZMBp9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=51hsmL
 qz9/nNSWtqEjjDNGJdPsfEI5fyVu8+ZU5LqF8=; b=crhmRSvelGLaAGFWUJPjgv
 uKnov9mX1EL8WL3DMWP4wGDzRygCbY+R3BBNyNp8e6SZ5YyDlmaBdHd7pRLVSexy
 uf1uy4/HahQgkbJtTVqAXk1MW8OFvbd5jW+fqwG8q4CslwHXdhnh0eJMcLU2g8hl
 QNJifjA98V9QC4UF2Dj2S+BxJ1MwwLhQz0dqAh18KUiKRk33ZRekQexvjFRvU6JY
 lqIAseNkZv1gUIoj5tdvF9Zd7K+VxNePb6JCHDU6J+/h5N1Qd29hTAKKt2lYcY0T
 osQNm6Pngnm0e8/OvFhJgEnNkjwhpwv8akNAfEXMnArnqwOlolFb1CWgoUi8lc2A
 ==
X-ME-Sender: <xms:pFt0X4Wd3qhT-TZ9qhPg1BHxHw5GZnFD-mu5cJuwUNnFxliKqpP_Tw>
 <xme:pFt0X8mr4LxPywLl8iEgImh4u6YQ24Z_WBREKKhrYQs5O-mtuMcfMt54-mXbYC5tt
 ce1coA8CNO0u9W3_F0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfedvgddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeeutdfgjeeuudehvefgvedvtedtudelfffgffekledtffekgedukeejueevieeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pFt0X8YSrOhdFUqfBftZwAhGIXgEEZ8MDTkZ_uSwZUYh06GHd5LYlw>
 <xmx:pFt0X3VOjfFbtLGDHhxUKGnbzDG8fI_0kK79xe_6SvsU4o1RsdQmQw>
 <xmx:pFt0XylKx9OjYan_RZVkAEgxf2-wJhuoDE2P1M_S3lBLa3LemWj8CA>
 <xmx:qFt0X0cYfcm7CApF1P6Xth7KOw2Aw1dfv1k0FyBcsce4IyYa2QbvNA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A2C33306467E;
 Wed, 30 Sep 2020 06:19:16 -0400 (EDT)
Date: Wed, 30 Sep 2020 12:19:15 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v4 09/22] arm64: dts: allwinner: h6: Add HDMI audio node
Message-ID: <20200930101915.sultshdvxgu5u2rs@gilmour.lan>
References: <20200921102731.747736-1-peron.clem@gmail.com>
 <20200921135925.q7mde2cnt5jtzkb5@gilmour.lan>
 <CAJiuCcfz9A_Vmzq=s3LK2kGB_1tZPkC9Ux+Brdocp9py0fovAg@mail.gmail.com>
 <59286578.E0qSRroNqr@kista>
 <20200928084308.eipnvlfqe3c5lfmg@gilmour.lan>
 <CAJiuCceHXr_5PvG-FW+hRNV7Q33hGrp8kLbO0EgfqqBxF7wbqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="we3fv24y4dnxqond"
Content-Disposition: inline
In-Reply-To: <CAJiuCceHXr_5PvG-FW+hRNV7Q33hGrp8kLbO0EgfqqBxF7wbqQ@mail.gmail.com>
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
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


--we3fv24y4dnxqond
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2020 at 04:27:42PM +0200, Cl=C3=A9ment P=C3=A9ron wrote:
> On Mon, 28 Sep 2020 at 10:43, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Mon, Sep 21, 2020 at 08:37:09PM +0200, Jernej =C5=A0krabec wrote:
> > > Dne ponedeljek, 21. september 2020 ob 19:23:49 CEST je Cl=C3=A9ment P=
=C3=A9ron
> > > napisal(a):
> > > > Hi Maxime,
> > > >
> > > > On Mon, 21 Sep 2020 at 15:59, Maxime Ripard <maxime@cerno.tech> wro=
te:
> > > > >
> > > > > On Mon, Sep 21, 2020 at 12:27:18PM +0200, Cl=C3=A9ment P=C3=A9ron=
 wrote:
> > > > > > From: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > > >
> > > > > > Add a simple-soundcard to link audio between HDMI and I2S.
> > > > > >
> > > > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > > > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > > > > > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 33 ++++++++++++=
++++++++
> > > > > >  1 file changed, 33 insertions(+)
> > > > > >
> > > > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arc=
h/arm64/
> > > boot/dts/allwinner/sun50i-h6.dtsi
> > > > > > index 28c77d6872f6..a8853ee7885a 100644
> > > > > > --- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
> > > > > > @@ -67,6 +67,25 @@ de: display-engine {
> > > > > >               status =3D "disabled";
> > > > > >       };
> > > > > >
> > > > > > +     hdmi_sound: hdmi-sound {
> > > > > > +             compatible =3D "simple-audio-card";
> > > > > > +             simple-audio-card,format =3D "i2s";
> > > > > > +             simple-audio-card,name =3D "sun50i-h6-hdmi";
> > > > > > +             simple-audio-card,mclk-fs =3D <128>;
> > > > > > +             simple-audio-card,frame-inversion;
> > > > > > +             status =3D "disabled";
> > > > > > +
> > > > > > +             simple-audio-card,codec {
> > > > > > +                     sound-dai =3D <&hdmi>;
> > > > > > +             };
> > > > > > +
> > > > > > +             simple-audio-card,cpu {
> > > > > > +                     sound-dai =3D <&i2s1>;
> > > > > > +                     dai-tdm-slot-num =3D <2>;
> > > > > > +                     dai-tdm-slot-width =3D <32>;
> > > > >
> > > > > It looks weird to have both some TDM setup here, and yet the form=
at in
> > > > > i2s?
> > > >
> > > > Yes, I agree I will check if it's really needed.
> > >
> > > I think this was explained before.
> >
> > Possibly, but this should be in a comment or at least the commit log
> >
> > > Anyway, this is needed to force width to 32, no matter actual sample
> > > width. That's a requirement of HDMI codec. I believe Marcus Cooper
> > > have another codec which also needs fixed width.
> > >
> > > There is no similar property for I2S, so TDM one is used here.
> >
> > Except it's really dedicated to the TDM mode and doesn't really make
> > much sense here.
> >
> > If we have special requirements like this on the codec setup, that
> > sounds like a good justification for creating a custom codec instead of
> > shoehorning it into simple-card
>=20
> When all the remarks are fixed would it be possible to merge the rest
> of the series without the dts changes ?
>=20
> I will propose another series to introduce a dedicated codec for that.

Yeah, sure

Maxime

--we3fv24y4dnxqond
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3RbogAKCRDj7w1vZxhR
xQ1TAQCXyCe5QVWRsk4Xo0kYUfS4nqr+j6X8lC7NGSFSHCXQbQD/fNe30ApybdwS
uWFA5qC2rFHZegZ7IFIgsScWh32Hag0=
=Tk4P
-----END PGP SIGNATURE-----

--we3fv24y4dnxqond--
