Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10512130C6
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 16:56:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B08B17F7;
	Fri,  3 May 2019 16:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B08B17F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556895391;
	bh=6QW+jej1LhPLvM8pXHfMCZoThMd1xMQYFkMkdnegs/4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=trasvzi7G1mi/Be5igrwukkL4N2Pb1woctLC0G6TKDjmV+n0bQslR5JZZskaugfYf
	 3X3BHH8Mm2WtFu1fHFjSUpqTaS6LYdw+Tq1brckRCFASnFCXwoc/yrMdwqLslVTznK
	 ccG7bLurgf4CV4gomRTeXEfoh0Rz7dUdL1bHnaZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34BB8F896B9;
	Fri,  3 May 2019 16:54:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EEC9F896B7; Fri,  3 May 2019 16:54:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7603DF8075A
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 16:54:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7603DF8075A
X-Originating-IP: 90.88.149.145
Received: from localhost (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr
 [90.88.149.145]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C246D1BF20C;
 Fri,  3 May 2019 14:54:35 +0000 (UTC)
Date: Fri, 3 May 2019 16:54:35 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Message-ID: <20190503145435.jziomr3sqxp6jbpd@flea>
References: <20190419191730.9437-1-peron.clem@gmail.com>
 <20190419191730.9437-3-peron.clem@gmail.com>
 <20190502082526.c5zo4uzceqzizbxo@flea>
 <CAJiuCcdFUPBsXfKtDLt-p6Edx-7JrST9d0C=ofCU4CL8ZxwcsA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJiuCcdFUPBsXfKtDLt-p6Edx-7JrST9d0C=ofCU4CL8ZxwcsA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v2 2/5] ASoC: sun4i-spdif: Add support for
	H6 SoC
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
Content-Type: multipart/mixed; boundary="===============3672828247969754182=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3672828247969754182==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f5z2x6ysmbssgmgl"
Content-Disposition: inline


--f5z2x6ysmbssgmgl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2019 at 11:39:24AM +0200, Cl=E9ment P=E9ron wrote:
> > > @@ -169,16 +181,25 @@ struct sun4i_spdif_dev {
> > >       struct snd_soc_dai_driver cpu_dai_drv;
> > >       struct regmap *regmap;
> > >       struct snd_dmaengine_dai_dma_data dma_params_tx;
> > > +     const struct sun4i_spdif_quirks *quirks;
> >
> > I guess this will generate a warning since the structure hasn't been
> > defined yet?
>
> It's a pointer to a structure so no warning from the compiler.

Damn, I was convinced just declaring a pointer to a structure would
result to a gcc warning. Nevermind then.

> > > @@ -405,22 +426,26 @@ static struct snd_soc_dai_driver sun4i_spdif_da=
i =3D {
> > >       .name =3D "spdif",
> > >  };
> > >
> > > -struct sun4i_spdif_quirks {
> > > -     unsigned int reg_dac_txdata;    /* TX FIFO offset for DMA confi=
g */
> > > -     bool has_reset;
> > > -};
> > > -
> > >  static const struct sun4i_spdif_quirks sun4i_a10_spdif_quirks =3D {
> > >       .reg_dac_txdata =3D SUN4I_SPDIF_TXFIFO,
> > > +     .reg_fctl_ftx   =3D SUN4I_SPDIF_FCTL_FTX,
> > >  };
> > >
> > >  static const struct sun4i_spdif_quirks sun6i_a31_spdif_quirks =3D {
> > >       .reg_dac_txdata =3D SUN4I_SPDIF_TXFIFO,
> > > +     .reg_fctl_ftx   =3D SUN4I_SPDIF_FCTL_FTX,
> > >       .has_reset      =3D true,
> > >  };
> > >
> > >  static const struct sun4i_spdif_quirks sun8i_h3_spdif_quirks =3D {
> > >       .reg_dac_txdata =3D SUN8I_SPDIF_TXFIFO,
> > > +     .reg_fctl_ftx   =3D SUN4I_SPDIF_FCTL_FTX,
> > > +     .has_reset      =3D true,
> > > +};
> > >
> > > +static const struct sun4i_spdif_quirks sun50i_h6_spdif_quirks =3D {
> > > +     .reg_dac_txdata =3D SUN8I_SPDIF_TXFIFO,
> > > +     .reg_fctl_ftx   =3D SUN50I_H6_SPDIF_FCTL_FTX,
> > >       .has_reset      =3D true,
> >
> > The reg_dac_txdata and reg_fctl_ftx changes here should also be part
> > of a separate patch.
>
> You mean the reg_fctl_ftx quirk and the H6 introduction should be split ?

Yep

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--f5z2x6ysmbssgmgl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXMxWKwAKCRDj7w1vZxhR
xTheAQD9sE7A0WEHij5Wf1qBjNLpFuz3ZidjjR2KW3BxB9EWSgD/fmxUP0w8djKy
bpfpawxYsCpDiDgb1b2tfBSFbXO87wE=
=ry69
-----END PGP SIGNATURE-----

--f5z2x6ysmbssgmgl--

--===============3672828247969754182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3672828247969754182==--
