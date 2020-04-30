Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B02551BF362
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 10:47:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58DB51669;
	Thu, 30 Apr 2020 10:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58DB51669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588236478;
	bh=qTaP5yhmQowEtGy14MQc85aZDBi5Bq9e1gjpJn+SN+M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HYK85XQvJou+mfI7/+yim1q5cR/dyWxD/2d6uDzgvj8jZ2hfRXCg7K5XPC1Bw/ja6
	 dFkWZTgZfk4GXJ23onahQ0rySxOLriQ//Kobbd3nXzjRROmlURpJY68bCJsSaxYROJ
	 O2JpbF296B1+KnfIfmsjB0MjRcP/xBn7DD8iyzac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 076BCF801EB;
	Thu, 30 Apr 2020 10:46:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70DEAF801DB; Thu, 30 Apr 2020 10:46:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7D39F800B6
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 10:46:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7D39F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="Crn54lkB"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="MfacvNZm"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 941B190D;
 Thu, 30 Apr 2020 04:46:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 30 Apr 2020 04:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=fpjtGZf8AqSI48exIlo8OnF8z0r
 obzEYf4a720y11JI=; b=Crn54lkBtd00EaqOJspktSUBCz50ahh6oNvAj45B9nN
 Iwl59n8WUN4O2OGxKJz0cNVwsmE3RdYV+3VrQAcA7L7umKCCt2/DUlTmNUBMr56Q
 BxuwEjBk4fF/pEj8TJOyPTUbKDBAkAxpha/IstRwOrsXiHC+nn78wQf7BVCXC8HC
 gRpC2Ih4tLzOA5KnczD36BWaZL6SuZQTuoggbyx8ySwZWqhfeRqjGqznqCne+QIq
 fES7oWLLnLoImdP9lHX0evFtLflOksq9e9Z+1A3dQhGjo+HAPhAQC1voptWLQyUv
 eKp6xf83V69RUKxIEV6G9GTJtNnN3VcfNvpxQPHuc0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fpjtGZ
 f8AqSI48exIlo8OnF8z0robzEYf4a720y11JI=; b=MfacvNZm1+/+qJ2z+cBQh9
 CWx/PNOje+aXmEZyXakBvlexfUNKWaee4mYIFb4WPcefbzxemjkRDc6nBp4MOoz4
 k4PmL1Flr7D9pvwoY8BiDFGOki1p61NVDqiezlvuKoOoamyRc02v40H2jxlNrfSH
 p35tV48BXr+yHhgL6RNwaDFQcGW+o2mxWIIrDBvLe2ZJkF2cqLh3deifsMOxWXZ6
 TxHjUoJjnji88vysO/jHChZtcWA0V1YRJNM/h1leuNuCrgGlfxMzjGFCN+7+a5bO
 0BDRiH+2y82LZUMIhvbK3dCeWTQU+GRMMcVangrSLfvoYzivKhm5alewsSNa2JFg
 ==
X-ME-Sender: <xms:SpCqXhoWXIPqto5Zw9q9kGy8eExsyYKiFCJs7MvLNuhXR9-EWk8Ryw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieehgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:SpCqXt8_Xg_kmJW_z9vDfQNvzkNt0Qy2S24GmNMmKFQqiZAiOHBRvw>
 <xmx:SpCqXmYF-MTqX7R7WKqDvEh1JI1fs8uIYh1nZDFpPLjek26B8d0uNQ>
 <xmx:SpCqXn0MbOxK1PQtCxaoNwCyZulXcZPqOBUhbdCAXq3jAvkcAXmQIQ>
 <xmx:TZCqXsEDR3SBul6X-zgv3p3lwGz03BsnL8RlEu8Btqu5aDV62mGCvDcSyRU>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3765C3280067;
 Thu, 30 Apr 2020 04:46:02 -0400 (EDT)
Date: Thu, 30 Apr 2020 10:46:00 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v3 3/7] ASoC: sun4i-i2s: Add support for H6 I2S
Message-ID: <20200430084600.samghw4zxb5zdbez@gilmour.lan>
References: <20200426104115.22630-1-peron.clem@gmail.com>
 <20200426104115.22630-4-peron.clem@gmail.com>
 <20200428081321.ht3el26yqhsnyfm4@gilmour.lan>
 <CAJiuCcdVs_drs40Q6537BYfz24F7NmC6B8S5-Lt4V4ggs-FXWA@mail.gmail.com>
 <20200429123529.y24dpy63wxq7uvkt@gilmour.lan>
 <CAJiuCcfXqizcq_JuXRCsqEqM2562cr1SGJ0pmy07jcJxAXojOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="y3cvvuhxye45tbpz"
Content-Disposition: inline
In-Reply-To: <CAJiuCcfXqizcq_JuXRCsqEqM2562cr1SGJ0pmy07jcJxAXojOw@mail.gmail.com>
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


--y3cvvuhxye45tbpz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 29, 2020 at 06:33:00PM +0200, Cl=E9ment P=E9ron wrote:
> On Wed, 29 Apr 2020 at 14:35, Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > On Tue, Apr 28, 2020 at 10:55:47AM +0200, Cl=E9ment P=E9ron wrote:
> > > > > +static int sun50i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
> > > > > +                              unsigned int fmt)
> > > >
> > > > The alignment is off here
> > > >
> > > > > +{
> > > > > +     u32 mode, val;
> > > > > +     u8 offset;
> > > > > +
> > > > > +     /*
> > > > > +      * DAI clock polarity
> > > > > +      *
> > > > > +      * The setup for LRCK contradicts the datasheet, but under a
> > > > > +      * scope it's clear that the LRCK polarity is reversed
> > > > > +      * compared to the expected polarity on the bus.
> > > > > +      */
> > > >
> > > > Did you check this or has it been copy-pasted?
> > >
> > > copy-pasted, I will check this.
> >
> > It's not going to be easy to do this if you only have a board with HDMI=
=2E If you
> > can't test that easily, just remove the comment (or make it explicit th=
at you
> > copy pasted it?), no comment is better than a wrong one.
>=20
> I have talked with Marcus Cooper it may be able to test this this week-en=
d.
> Also this can explain why we need the "
> simple-audio-card,frame-inversion;" in the device-tree.
>=20
> If think this fix has been introduced by you, correct? Could you say
> on which SoC did you see this issue?

This was seen on an H3

Maxime

--y3cvvuhxye45tbpz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqqQRwAKCRDj7w1vZxhR
xc06AP4quZAf2DNrCglxI3FnGicJEvn/UCQlNMdBjtAZiNt6NAEAklrbdL9EUUv6
PaDu07BZiJ7iqnqxZPn5egwCTM/O1Ac=
=jFs3
-----END PGP SIGNATURE-----

--y3cvvuhxye45tbpz--
