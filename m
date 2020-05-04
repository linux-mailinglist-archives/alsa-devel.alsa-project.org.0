Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B14441C38F5
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 14:11:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47C88170B;
	Mon,  4 May 2020 14:10:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47C88170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588594299;
	bh=W/voJllt+LtW5FXIVzWe/Lf4/WFsQrLMeQCoEu/bjCg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OGr5+9rWzLu8Frg2EPtKNcz7nJXG4XtKQxH8TD1B7voLgNcYRtkv+FYV5nkXdJGYX
	 1EPTaQXLpT1o/ol6N9yTBwqv0sI6tVWefwSARz5texCqITQzaU9fAhWa4xhmDczRWY
	 On0bWkxL+1dtXZ92MCXIlpwdsZFgysKLL2rA4t0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CAD8F800E5;
	Mon,  4 May 2020 14:09:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2DE7F800E5; Mon,  4 May 2020 14:09:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA9EEF800E5
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 14:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA9EEF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="J+utQvjN"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="2k6ruSzK"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 8B7A64FE;
 Mon,  4 May 2020 08:09:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 04 May 2020 08:09:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=oIv7cAOaUdM7aBwNjylFjp/ACiL
 s4UI3J+tfLDmHYdY=; b=J+utQvjNQnsvwqzGAhL4HuZL6/tUBeLevzWMkpvOb3F
 /x/oGFPIAzF9G5oTMnpoh4E55Titshs3p1X4IDefQlVo634I8OzmhJ3OKVXZ4o+l
 fp5oO5kcwGbl2kZ9nanR0zA3MRVwyNwvpHqUW2rqwlehidEj5lNJ4lUbphUCzI5F
 y2O3FN/lepFcaaf9Rr3SjlQyVh01NRnhZREvrqgmHqyCIhfdgk18PgsxBgs5b/e/
 le3YczrRmE0H72QJFIrlrRuQWsJtCD1whQUtpHYmzuCvk86msFVusnaNL3i/5JOP
 RG9criY3nTwsprI9FAijlScLa8Nrfeuer2Ug2/NwEsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=oIv7cA
 OaUdM7aBwNjylFjp/ACiLs4UI3J+tfLDmHYdY=; b=2k6ruSzKSFiqGFUIu0QbTd
 if6kMGa4t1N2y05XOVFlw1KczfXrL9iwtj8Bfu1duoQME8A8QgHQet7gCXbyyofV
 rqwrAqmJbl5/cC07D0UAQU5cP+Czp20tsUH7Ee3YAzu96E1SHZhsHndA7xVd6XXK
 60Yy+wW4vcbaVSCH7d7+7K0HWnxjWv7VjO7CfVrXMcUa+8XczyTARKVRytnmEj8x
 h26USvVAu9IiQX9kqPm21ddO1cTEb0NZ1gkvr2Qsu2/r+qL8c3q2hAifduxwLR/q
 d1vR3LWUisjKlKkvlC1PfRtpjzbHSmM+cdCkDxNfmlPEj0xEKv9ZBK5B0UEC2eqA
 ==
X-ME-Sender: <xms:CQawXtgD5d5PhPKljuGQbAyOPEHoyzH9-V_dYB9mUwE2tpw_XLtG7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeeggdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeejkeekffdtfffhhfevvddutefgtdeljeevffevvddvteegledtgfeghfehvdei
 ffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdeikedrje
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:CQawXkffn_XVfNAFXPD2qly5eqXTbdN4TaHzu0GQDTIWaNheYzOcrw>
 <xmx:CQawXqy8VKzehlReDzsMvrHa90NNBKOoKcc7BwiEg1i3zsH2diABLw>
 <xmx:CQawXhbODQ8XgO5ckRhoK83tcTDTYBQv8QeO0Yq_tPvluT09RIbi9Q>
 <xmx:CwawXgaTkrHaU8N4VzGnFawxJQBCAP7nNs_XVxN8SJ8XAf7eh7rzcU81KYs>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 391CC3280065;
 Mon,  4 May 2020 08:09:45 -0400 (EDT)
Date: Mon, 4 May 2020 14:09:42 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v3 3/7] ASoC: sun4i-i2s: Add support for H6 I2S
Message-ID: <20200504120942.lnrxnnmykqnvw3fb@gilmour.lan>
References: <20200426104115.22630-1-peron.clem@gmail.com>
 <20200426104115.22630-4-peron.clem@gmail.com>
 <20200428081321.ht3el26yqhsnyfm4@gilmour.lan>
 <CAJiuCcdVs_drs40Q6537BYfz24F7NmC6B8S5-Lt4V4ggs-FXWA@mail.gmail.com>
 <20200429123529.y24dpy63wxq7uvkt@gilmour.lan>
 <CAJiuCcfXqizcq_JuXRCsqEqM2562cr1SGJ0pmy07jcJxAXojOw@mail.gmail.com>
 <20200430084600.samghw4zxb5zdbez@gilmour.lan>
 <CAJiuCcf_LHrJ6QdZgH8HyN6TRiT+GiD+t4UggFCrz-VwVHXV6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m7fwqhxu5jri276t"
Content-Disposition: inline
In-Reply-To: <CAJiuCcf_LHrJ6QdZgH8HyN6TRiT+GiD+t4UggFCrz-VwVHXV6w@mail.gmail.com>
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


--m7fwqhxu5jri276t
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Clement,

On Thu, Apr 30, 2020 at 04:00:14PM +0200, Cl=E9ment P=E9ron wrote:
> On Thu, 30 Apr 2020 at 10:46, Maxime Ripard <maxime@cerno.tech> wrote:
> > On Wed, Apr 29, 2020 at 06:33:00PM +0200, Cl=E9ment P=E9ron wrote:
> > > On Wed, 29 Apr 2020 at 14:35, Maxime Ripard <maxime@cerno.tech> wrote:
> > > >
> > > > On Tue, Apr 28, 2020 at 10:55:47AM +0200, Cl=E9ment P=E9ron wrote:
> > > > > > > +static int sun50i_i2s_set_soc_fmt(const struct sun4i_i2s *i2=
s,
> > > > > > > +                              unsigned int fmt)
> > > > > >
> > > > > > The alignment is off here
> > > > > >
> > > > > > > +{
> > > > > > > +     u32 mode, val;
> > > > > > > +     u8 offset;
> > > > > > > +
> > > > > > > +     /*
> > > > > > > +      * DAI clock polarity
> > > > > > > +      *
> > > > > > > +      * The setup for LRCK contradicts the datasheet, but un=
der a
> > > > > > > +      * scope it's clear that the LRCK polarity is reversed
> > > > > > > +      * compared to the expected polarity on the bus.
> > > > > > > +      */
> > > > > >
> > > > > > Did you check this or has it been copy-pasted?
> > > > >
> > > > > copy-pasted, I will check this.
> > > >
> > > > It's not going to be easy to do this if you only have a board with =
HDMI. If you
> > > > can't test that easily, just remove the comment (or make it explici=
t that you
> > > > copy pasted it?), no comment is better than a wrong one.
> > >
> > > I have talked with Marcus Cooper it may be able to test this this wee=
k-end.
> > > Also this can explain why we need the "
> > > simple-audio-card,frame-inversion;" in the device-tree.
> > >
> > > If think this fix has been introduced by you, correct? Could you say
> > > on which SoC did you see this issue?
> >
> > This was seen on an H3
>=20
> Just two more questions:
> - Did you observe this issue on both TDM and I2S mode?
> - On which DAI node?

This is fairly fuzzy now and I don't remember if I tested it in I2S. Let's
assume I didn't. And similarly, I'm not sure what the exact controller was,=
 but
it was one of the regular controllers (so not either connected to the codec=
 or
the HDMI, one that goes out of the SoC).

We had pretty much the same issue on the A33 in I2S for the codec though:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/s=
ound/soc/sunxi/sun8i-codec.c?id=3D18c1bf35c1c09bca05cf70bc984a4764e0b0372b

I didn't think of it that way then, but it might very well have been the i2s
controller suffering the same issue.

> Since recent change in sun4i-i2s.c, we had to introduce the
> "simple-audio-card,frame-inversion" in LibreElec tree.

Do you have a link to that commit ? I couldn't find anything on libreelec's
github repo.

> H3 boards are quite common in LibreElec community so I think:
>  - This fix is only needed in TDM mode
>  - Or this fix is not required for the HDMI DAI node (HDMI DAI is a
> little bit different compare to other DAI but I think the first guess
> is more likely)

Given what we know about the A33, I'd be inclined to say the latter. I'd do=
n't
have the tools to check anymore, but if you have even a cheap logical analy=
zer,
i2s being pretty slow you can definitely see it.

Maxime

--m7fwqhxu5jri276t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXrAGBgAKCRDj7w1vZxhR
xSkHAP4v8wD7S9lG0CmZac6gP5WY97N+CaOtPYTZiajfe48fqQEAy+VK7JRCf5OU
L+GaaCtSkSV6kzT4EKtLSbT6ROmKZQ4=
=xwQn
-----END PGP SIGNATURE-----

--m7fwqhxu5jri276t--
