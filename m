Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFDB25CBB4
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 23:00:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 311881AD8;
	Thu,  3 Sep 2020 22:59:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 311881AD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599166816;
	bh=VwxK7QroUxSvB5XSFFWIZuc3sg2iHrKhE1ibkbUE2jI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BYwi4yrnEIdUQz30sBl9vw5XyTQtmjZhCFObxSoiego+QFY/67Cdu20KlpqLE6Hz0
	 Ko9RQE7vo4aJce6OZ8u3BW1SpBcSQ9/SDrfNdzFjSSWIzl4Kz+Pfgubh3ZGGCdcTxU
	 mJTrRFxBuqV//re33ZAKPJ/o5E9kNHIv4XMkPlVE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8916DF8021D;
	Thu,  3 Sep 2020 22:59:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79164F8025F; Thu,  3 Sep 2020 22:59:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74395F800F0
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 22:58:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74395F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="kaAYVjpV"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="imnAfMHY"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id A707BEC7;
 Thu,  3 Sep 2020 16:58:54 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 03 Sep 2020 16:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=VwxK7QroUxSvB5XSFFWIZuc3sg2
 iHrKhE1ibkbUE2jI=; b=kaAYVjpVfI2zt0FEA9hLZs2AJlQ34nNhGLX6/6CCzsn
 86d/hqmwwLcFpORvk/XzLnAWT0DRhb7gaDEy7rEculzXeXdK/acD/bG2+Fbc7P3H
 qCl77rWvDp7eCENzxaIcrxbFkGJewXhpo4UdYXn4v8W/almc0Uxpg6heec6DrZPJ
 KJjv7F5wy/ec5mVaVCQrWtGYjHLGwmpaBF1XYfjVFBLpmiBERKF7kpazcLFnPR1l
 p8GLp16T9x3JJqh99bGs0F6vVwavkFC/puPbejl8fX3Aar0edMWZqb7366kHcZGa
 GyIovwwxUF6wf61NhLWS+BpoWzb4KJI0ld+FO35OT7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=VwxK7Q
 roUxSvB5XSFFWIZuc3sg2iHrKhE1ibkbUE2jI=; b=imnAfMHYZQvPJefQiiNTWu
 OV8c6MzWKCvYWL1NR7gRebuvx69vPz12mXaIWTf3ZYXCwOr3+b84dqT12jv8e+kP
 QcWcieNiAV3xi8BPu5i/bAeihFE9SJU1oJrLLYDYx4U7mf6Xw0pmtNBPif0AZzdZ
 hStgKhAazmw14Jy0U8pmNg4HI2rzVHuRgxHnAm0eierZMwjW7ngEH6cGfuobXP/j
 TUT9InSAxO5mhBOckCmS+E60b44I/o/pnNHmlaVUg/xXc0lw2d6hlf0mANKOaQV4
 3iH/++plLCZrOqlEmpq8DkCG+XaOxLR/PXETD41bU4Y/s02vLLYV9meiiuvuWo4w
 ==
X-ME-Sender: <xms:DVlRX2UpGHtqR86oT_wWmrdqkihvJFYhQ6sn66f7Cok5zhUe14HzQw>
 <xme:DVlRXyl6jCVnbBauNKahWIgfMWeZLHT3CQ1bBJMuKCEB0XlyA87lP9670WUi6Jmzn
 NMEV6IcOUlyJMgKoAo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeguddgudehjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetgfejtdelgeffffeitdfhtddvfeeijeffteelkefhledvvefggfdujeeg
 ieeghfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeeltddrkeelrdeike
 drjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 mhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:DVlRX6YxvVUhMIsL56aRp57nzY_7m4dxdwDF7ElxsQArBTCPrjwYCw>
 <xmx:DVlRX9WzFHpKtpaqiZWI7uocjM-GMXzwJBDZC3DEjb4AmpoU9B9oxg>
 <xmx:DVlRXwm0AU8ggWRCDcdavdaKMC8RTew-bUFhQGdYxC1sOfoEkb0RIA>
 <xmx:DllRX5daUZfHprawJieS9Oxs15ms0GAGlDUVL0O87nBddtefOiEwqz1RaJ4>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 273C33060060;
 Thu,  3 Sep 2020 16:58:53 -0400 (EDT)
Date: Thu, 3 Sep 2020 22:58:51 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v3 3/7] ASoC: sun4i-i2s: Add support for H6 I2S
Message-ID: <20200903205851.gdnpthserywsxrbs@gilmour.lan>
References: <CAJiuCcdVs_drs40Q6537BYfz24F7NmC6B8S5-Lt4V4ggs-FXWA@mail.gmail.com>
 <20200429123529.y24dpy63wxq7uvkt@gilmour.lan>
 <CAJiuCcfXqizcq_JuXRCsqEqM2562cr1SGJ0pmy07jcJxAXojOw@mail.gmail.com>
 <20200430084600.samghw4zxb5zdbez@gilmour.lan>
 <CAJiuCcf_LHrJ6QdZgH8HyN6TRiT+GiD+t4UggFCrz-VwVHXV6w@mail.gmail.com>
 <20200504120942.lnrxnnmykqnvw3fb@gilmour.lan>
 <CAJiuCceF340FiLvyeXNZtvqftQMAmk=MtFDLT_9696ix+eH1Yw@mail.gmail.com>
 <20200729143927.47f5tbuaob4ph3lp@gilmour.lan>
 <20200729151548.GB5612@sirena.org.uk>
 <CAJiuCcdf=TNLPTUPzHP9NzPHqdxG06TRDkQfONY+ScK0DV_v5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5oio2pfekr4xg52a"
Content-Disposition: inline
In-Reply-To: <CAJiuCcdf=TNLPTUPzHP9NzPHqdxG06TRDkQfONY+ScK0DV_v5w@mail.gmail.com>
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


--5oio2pfekr4xg52a
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2020 at 10:02:31PM +0200, Cl=E9ment P=E9ron wrote:
> Hi Maxime,
>=20
> On Wed, 29 Jul 2020 at 17:16, Mark Brown <broonie@kernel.org> wrote:
> >
> > On Wed, Jul 29, 2020 at 04:39:27PM +0200, Maxime Ripard wrote:
> >
> > > It really looks like the polarity of LRCK is fine though. The first w=
ord
> > > is sent with LRCK low, and then high, so we have channel 0 and then
> > > channel 1 which seems to be the proper ordering?
> >
> > Yes, that's normal.
>=20
> Thank you very much for this test.
>=20
> So I will revert the following commit:
>=20
> ASoC: sun4i-i2s: Fix the LRCK polarity
>=20
> https://github.com/clementperon/linux/commit/dd657eae8164f7e4bafe8b875031=
a7c6c50646a9

Like I said, the current code is working as expected with regard to the
LRCK polarity. The issue is that the samples are delayed and start to be
transmitted on the wrong phase of the signal.

But the LRCK polarity is fine.

Maxime

--5oio2pfekr4xg52a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX1FZCwAKCRDj7w1vZxhR
xWQVAQDmT/g2buALylg6CCaeD1ezTtMOaioshw6NnfrtEevsQAEApNN0CLywNAjR
fL54Dcath7my334lJ2MhPvnoA5PHLQY=
=euKd
-----END PGP SIGNATURE-----

--5oio2pfekr4xg52a--
