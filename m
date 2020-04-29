Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 324801BDC71
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Apr 2020 14:37:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1F681676;
	Wed, 29 Apr 2020 14:36:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1F681676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588163842;
	bh=98hhaA5apW630BEmFlV5626433MFLJ5xHsLTaCeysSQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iYCglksWUCGMU4yL/jCvGrzDG3FHkku4S7HA4JGyxaJx1QrbtfMUHJTnDuWOXsTow
	 di8GV8tl+23Enx/7aokyTVGuiZLcUVEkjNjoxUmdIqB5eFdwm+NN4VsAeX+FFJq+OH
	 YrDj0v6qqpkCsJZClLbxS0RRlJXerE7q2+AvT/1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF131F80232;
	Wed, 29 Apr 2020 14:35:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24B37F8022B; Wed, 29 Apr 2020 14:35:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 583FBF80109
 for <alsa-devel@alsa-project.org>; Wed, 29 Apr 2020 14:35:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 583FBF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="lMmqBzMs"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="gN+Mn29O"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4187A5801CC;
 Wed, 29 Apr 2020 08:35:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 29 Apr 2020 08:35:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=c+9mUYpBdnOaBwykChFhcenmVtw
 9Gzvx3ldZ3YuHZDE=; b=lMmqBzMsWh43/t2YdttBouyW5iVp6dCQdZj/fOz3H1d
 Dm/7Y0wD1t7Qhqaf1dZSlt//mf/V62NMAx9jNyzT2eA52JxeQlxbaESuOjmXbIDM
 BB0q+8AJMOLGufrIrrDmlRP0zFfbj1x4R0k4Kd1st85gvkhoqJHdJsusVXaIjzG6
 IbzGBzdc1gccaVlznMNMauP7u74kYSbQtubCgo1udKZT60Us4JEO7Lhb9w/O16UH
 OUI81hYbXkI8Z10onZX2w3fDwxM2nIxHY9PWjF4WJ4lv/CBXoNatTymKStK+9lOR
 jdc5z7er/S1wADjy2BkMXEZJxYV16xz8aoABYr+yuEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=c+9mUY
 pBdnOaBwykChFhcenmVtw9Gzvx3ldZ3YuHZDE=; b=gN+Mn29OayTJ50jcW1+vxJ
 jolSrul8nF4EHDQq2CdeL9WH36K+vk5qtiVbdhUCMDz2OriGY8S9x5zpEZAQD9XY
 zQDRhqIuXCZNSyBbwkBMSH1LfIHVctO1tYRZ7NHa6ibP1cxLoybEDi/kON/OsHHk
 aeH0W6Sm6r14ZrVLWAOFUoaHEe4cENs+2TcKIlVsZugQy/Qi5nrbwGP3rtUcMb7t
 f+d8mCsKWC3K1OhQnnCB9rnhNyQBLu0M3tDeeawWrGwYod8Ljxr8hXJISYzWYZZ/
 XjZIiNIXJI1B1Oqf5kmp+Zo9o5maELICMhOe2wHq6/N8MM2Z7+d/CBW/liq1p/Qg
 ==
X-ME-Sender: <xms:k3SpXpGA2NsI1LpjKQpePExH66TePqj82Bu0RZA-0E16HKXSo74eiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieefgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:k3SpXpcp2cjteMbrV6tVzU1OAb4HfglVBI6S6pWxqvOHWoMc0hStZw>
 <xmx:k3SpXgh6khNMHd7bQAs_djhE6464AP0f1IJNVQhCXkJvenSynyvXow>
 <xmx:k3SpXu7kpl6cHsO55jleUPsBLuO5YGvbwOn8tMIe6nb52uf53qGFtg>
 <xmx:lHSpXl2XuvQ7vHyGfSBrMMkN28yCT0mlxb8jK4PAnimTaNDh77iv3w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id BD9D13280066;
 Wed, 29 Apr 2020 08:35:30 -0400 (EDT)
Date: Wed, 29 Apr 2020 14:35:29 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v3 3/7] ASoC: sun4i-i2s: Add support for H6 I2S
Message-ID: <20200429123529.y24dpy63wxq7uvkt@gilmour.lan>
References: <20200426104115.22630-1-peron.clem@gmail.com>
 <20200426104115.22630-4-peron.clem@gmail.com>
 <20200428081321.ht3el26yqhsnyfm4@gilmour.lan>
 <CAJiuCcdVs_drs40Q6537BYfz24F7NmC6B8S5-Lt4V4ggs-FXWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xa3hju3zorbs63j6"
Content-Disposition: inline
In-Reply-To: <CAJiuCcdVs_drs40Q6537BYfz24F7NmC6B8S5-Lt4V4ggs-FXWA@mail.gmail.com>
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


--xa3hju3zorbs63j6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2020 at 10:55:47AM +0200, Cl=E9ment P=E9ron wrote:
> > > +static int sun50i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
> > > +                              unsigned int fmt)
> >
> > The alignment is off here
> >
> > > +{
> > > +     u32 mode, val;
> > > +     u8 offset;
> > > +
> > > +     /*
> > > +      * DAI clock polarity
> > > +      *
> > > +      * The setup for LRCK contradicts the datasheet, but under a
> > > +      * scope it's clear that the LRCK polarity is reversed
> > > +      * compared to the expected polarity on the bus.
> > > +      */
> >
> > Did you check this or has it been copy-pasted?
>=20
> copy-pasted, I will check this.

It's not going to be easy to do this if you only have a board with HDMI. If=
 you
can't test that easily, just remove the comment (or make it explicit that y=
ou
copy pasted it?), no comment is better than a wrong one.

Maxime

--xa3hju3zorbs63j6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXql0kQAKCRDj7w1vZxhR
xUWEAP0SrqSZD58viGba5AVL4qJo+eXiSzFllUnrvAolQg9p/gEAqQDc4TVprwLF
ugV0n3K3xZMYx6BObJM8w1vig/EXdAA=
=J0U2
-----END PGP SIGNATURE-----

--xa3hju3zorbs63j6--
