Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7E92A0AD7
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 17:13:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B74F3165D;
	Fri, 30 Oct 2020 17:12:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B74F3165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604074398;
	bh=I8F4Vvc3wYb2t0jaStGMcb1u5A3f20Qozjl95gbByVE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mzRLBTC+WnIXUe6mb+LdIkV4oIK+Nth9sCatagFgFsvMCWGPGj1mPT4BJt37s2R+F
	 G9XAkRPQtcD6gH3L4DGlgW49xt4dpdi3Hcm5F9YPOabZi6KZo2IUGmyBWG14VqKEwG
	 aojXFNr+b2QOyr10n+zPwfR754tCYNJkSxSd4QIc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F100CF80107;
	Fri, 30 Oct 2020 17:11:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98839F80212; Fri, 30 Oct 2020 17:11:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23A76F80107
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 17:11:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23A76F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="KM0eAH89"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="EEJJYkcx"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id BA37EC0C;
 Fri, 30 Oct 2020 12:11:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 30 Oct 2020 12:11:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=I8F4Vvc3wYb2t0jaStGMcb1u5A3
 f20Qozjl95gbByVE=; b=KM0eAH89hcGm74JgpqCVReajJ5sitCSIfF9KokHfMzH
 FJ540m6wtAPhsDozzz+I81AFzGNx9Fta1ioujkGze7oIEbT58kE3OjGxD9hhhRR9
 MIhsEFi9CGE3/STJYeTxUoChf3e6fe524G+b9QjHtEQJS8tb38GOrt9pKnRM79J9
 v29QJIspqJEc+IOIg164Z6Xa1bQkUnESaizZxhg8GFiuBp/Cewx7fuWtmO2B34kq
 9bpVvKZMly3rx2dRMFf1vUZ5GLY+ZPNxmV7FxRgn7Yk3Athr0246JQS8fAWIm+il
 gmrF3WII/39h/SlTn0MWyX9Z9jMfK9S+OVOWRXUvz1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=I8F4Vv
 c3wYb2t0jaStGMcb1u5A3f20Qozjl95gbByVE=; b=EEJJYkcx0Wxx4TTZNb96f+
 AhCGRm4Yajet73OZz3G87tcxKYIIadEqyjyv08LfTNPaj9tDaHMeNY87uPsYLeLA
 AQNOQ7RIQdyINRjDXGdrDJgRETxMr6TfNl71pAB28lMNO4/Oyvi0fnu+cA4044ad
 KXx367lbvvyax9gYyQXkUM1wUeczrCd1tyHGsq7PSKkHq9hBbbYhS6bzB7jzQPu5
 cOSw5ZTip9Pofpayo+/RWRe0P7acmS3IfRh1B9+GpLJBS0OM3ypfv1iD+rFE3qfm
 Gbhu+T/lVmSoClCIC7BoG9ZfJBD/EUbTuJeQHbUac94DPFNMTbclbeNhTo7aIXHg
 ==
X-ME-Sender: <xms:NDucX8tQx8dGb5cvVDDmYQ5HE6Hh1mrvK2dNFFVGg5lPBYj2COLGLw>
 <xme:NDucX5fkje_WvE3LA_rL41kHZPLXohVHhzDvxSfHMtGgEJc_QMmk_m2BSfVRxEoOA
 x043uFSJfQIvNoXerU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleehgdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:NDucX3xWXh_BVrIGSOeflhr3mwvh_PbGv8_f1eDBGzLMJVMpBXHoUQ>
 <xmx:NDucX_OmEaT0TQtR5Zm-i_K-FRXLF4PgYCSIO2_6XCsKRvh4Tlki4A>
 <xmx:NDucX88rypVhIP8XD-kMFAgL26qmSRBxYm2JFAC6rx46Bsq428tg2g>
 <xmx:NzucX3WXDyla1eE7ywu2msQ1C_n0Dwgbw-bk8XAYZU1wg35y8FA2dLiT0ds>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 82E243280059;
 Fri, 30 Oct 2020 12:11:32 -0400 (EDT)
Date: Fri, 30 Oct 2020 17:11:31 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v10 01/15] ASoC: sun4i-i2s: Fix lrck_period computation
 for I2S justified mode
Message-ID: <20201030161131.dlzzpy3atiiddx4n@gilmour.lan>
References: <20201030144648.397824-1-peron.clem@gmail.com>
 <20201030144648.397824-2-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fpfjkluh6h53itoj"
Content-Disposition: inline
In-Reply-To: <20201030144648.397824-2-peron.clem@gmail.com>
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-sunxi@googlegroups.com, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
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


--fpfjkluh6h53itoj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 03:46:34PM +0100, Cl=E9ment P=E9ron wrote:
> Left and Right justified mode are computed using the same formula
> as DSP_A and DSP_B mode.
> Which is wrong and the user manual explicitly says:
>=20
> LRCK_PERDIOD:
> PCM Mode: Number of BCLKs within (Left + Right) channel width.
> I2S/Left-Justified/Right-Justified Mode: Number of BCLKs within each
> individual channel width(Left or Right)
>=20
> Fix this by using the same formula as the I2S mode.
>=20
> Fixes: 7ae7834ec446 ("ASoC: sun4i-i2s: Add support for DSP formats")
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>

Acked-by: Maxime Ripard <mripard@kernel.org>
Thanks!
Maxime

--fpfjkluh6h53itoj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5w7MwAKCRDj7w1vZxhR
xZ5FAP4xHWt9NXh9CE1ls2RUHb+wsO2JxSZ2VAcW/7oL3xdsYAD/aOAW4nVDE3be
+/sQDYsXuA2f+QvTA8TR19kiWsovUAo=
=1lV8
-----END PGP SIGNATURE-----

--fpfjkluh6h53itoj--
