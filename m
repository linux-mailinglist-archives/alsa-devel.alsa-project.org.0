Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 118D32519CD
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 15:37:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DDB41672;
	Tue, 25 Aug 2020 15:36:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DDB41672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598362660;
	bh=wOf4X/fWLzwCT3xpO1o6hi1NUhKdfNn7hI60H1EAEeU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ffcuUAEMDWofFP1z3zqWOkXdT6q/6wTvtklwkqvuV7Hi92Du/BwRFNYX/St9d3k3Y
	 0ngKyrkOk1NvD/dyN3k0JqXH59ghetKgvvFKgD0063uYWTp47EiOCJ2Eb7zm5XjA7j
	 bAz7qcFZfpwW/uHH7b1AHPRkMaR7WblTVD5M9i7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B72B3F80245;
	Tue, 25 Aug 2020 15:35:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74D6FF80245; Tue, 25 Aug 2020 15:35:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DATE_IN_PAST_12_24, DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8469F800D1
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 15:35:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8469F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="X32HTzXX"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="J25fnVd3"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id A4ED0580423;
 Tue, 25 Aug 2020 09:35:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 25 Aug 2020 09:35:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=PmDVIe/cKeDetXNk9iFyeUHXQ64
 mnfoc1lt/FVJ93Kg=; b=X32HTzXX6hzMZOlCQdx3uRION0txh8adS788wtjhJCv
 XrAXuwhHPmApReZaDY44F+HBCD03wMRGtqwn/lm2pqAlEP6UtyWqpgPH7txcBNtM
 d9lcAonE54F4BpSoZBIuD9ggWRcJcJgPdfRa8n52RebrVlyJrrgBgtLwGf74f1x2
 Pqc58r09XWZNcTESHOb40y/qIAtn+V45sAKvEAliERnutsrp+fsJRZES8n5Z5cKh
 X48329FkI3v+E6mx3ERAM5BiXnlxvZJCuaQn6Zp11hSd+okQH1bD4eAFVO9lC35P
 PUT6LnKy9AXAa/6juamnEcxAqNtFkdKjQ/YAz0QrQ7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=PmDVIe
 /cKeDetXNk9iFyeUHXQ64mnfoc1lt/FVJ93Kg=; b=J25fnVd3koC27dFAJuxA94
 QDsZaTn+vf9BNu78XVcgPW2DEiYLxDUZeYMHSw4zP8duokB1/cQbpBkNvlN0RxJ+
 3DXgYWvrFAl2uPLr80foBTV6nr+v9hoTXzX2/THO/zohTP40WGPX6TqfHue4ON4U
 tkFOJCHjMHmR5KcJKu+6pUm31U/EUgvgcazRcHquI6icGxYqF6URihAVs8RsX26z
 ardMTrXQ4KQYYF6ENmMUFM/vtPvwH/qOR9ZC5bYG/Ma1699PL1b7W/3vwNhJ59xY
 jYJG8tmaQD+enTfZI4aNpPR+ldsvsamOfxETzc/uwNA6Dsbow7Y4b/0AOEi73vwQ
 ==
X-ME-Sender: <xms:rhNFX95GPxJbTI8kFKQK923jm3zfdRT0o1TCXr8Tw7d3THgV5iAtpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rhNFX668Or-y4nGx90j8S1txwhfE5SXl_EoJ2_Oozc4hrTRZc8CoEg>
 <xmx:rhNFX0cCT_0JYPsIWtXo0APvSdiaonXlu2M5OuFiJqJSTg_PdZuDKQ>
 <xmx:rhNFX2IuB8eQoRuYd4tBthm9szkmLn6G91cIjeP7k-Y6ua8SlFg1OQ>
 <xmx:rxNFX-BKqYeSOUTRUX4Nij72zzm39kR7RJiUclNgqF3ccD6lJI7tQA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A38AA3280063;
 Tue, 25 Aug 2020 09:35:42 -0400 (EDT)
Date: Mon, 24 Aug 2020 16:03:34 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/7] Allwinner A64 digital audio codec fixes
Message-ID: <20200824140334.6gflonflqju6g5ea@gilmour.lan>
References: <20200726012557.38282-1-samuel@sholland.org>
 <159776961932.56094.2705667823777375165.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="457356sm2td7eqkr"
Content-Disposition: inline
In-Reply-To: <159776961932.56094.2705667823777375165.b4-ty@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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


--457356sm2td7eqkr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Tue, Aug 18, 2020 at 05:54:50PM +0100, Mark Brown wrote:
> On Sat, 25 Jul 2020 20:25:50 -0500, Samuel Holland wrote:
> > This series fixes a couple of issues with the digital audio codec in the
> > Allwinner A64 SoC:
> >   1) Left/right channels were swapped when playing/recording audio
> >   2) DAPM topology was wrong, breaking some kcontrols
> >=20
> > This is the minimum set of changes necessary to fix these issues in a
> > backward-compatible way. For that reason, some DAPM widgets still have
> > incorrect or confusing names; those and other issues will be fixed in
> > later patch sets.
> >=20
> > [...]
>=20
> Applied to
>=20
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-=
next
>=20
> Thanks!
>=20
> [1/7] ASoC: dt-bindings: Add a new compatible for the A64 codec
>       commit: cef305d4eb0733f25215793ed30b056a7db9bb62
> [2/7] ASoC: sun8i-codec: Fix DAPM to match the hardware topology
>       commit: 90cac932976e93b17203b4216ba83bdcd68e0ed0
> [3/7] ASoC: sun8i-codec: Add missing mixer routes
>       commit: e47d2dcd88fc3e6837f8aa0060ce820ec9001e26
> [4/7] ASoC: sun8i-codec: Add a quirk for LRCK inversion
>       commit: 7518805fb636308909a6a7953e9fdb194abb15f8
> [5/7] ARM: dts: sun8i: a33: Update codec widget names
>       (no commit info)
> [6/7] arm64: dts: allwinner: a64: Update codec widget names
>       (no commit info)
> [7/7] arm64: dts: allwinner: a64: Update the audio codec compatible
>       (no commit info)

Ideally we should get the DT patches through arm-soc, can you drop the
patches 5 to 7?

Thanks!
Maxime

--457356sm2td7eqkr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0PItgAKCRDj7w1vZxhR
xYPZAPsGRq4e2tB/N6+ZuohoedI67bQ5p+8oauiJ2kg8IjdAyQEA636KGr9JLm41
S1l3gUGjHSbGcPV8mGftLJRybQl7QwU=
=i8pn
-----END PGP SIGNATURE-----

--457356sm2td7eqkr--
