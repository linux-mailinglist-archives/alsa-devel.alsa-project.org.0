Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 528FC283555
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Oct 2020 14:03:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB10517E6;
	Mon,  5 Oct 2020 14:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB10517E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601899419;
	bh=Y1hLXBtPe3k97QoXYWSp0TNpaRsDYWsWj/6aYARplJc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NKIagUA/ZC+JI5/Z1kjAKYok+odwGxodfv5uDryRuyPCQ3czXtH4j1rVgOyLpNFec
	 kDRCwnN2vanaYFuU4kbXdECbyQ8wmT4tSfyJku6mCjysYGv+S+Pxcz/W18COQvvb7r
	 UvvHDakSF2dih3n5nxrPcSVdeuEfSm4UH7DL3s5s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93B36F80121;
	Mon,  5 Oct 2020 14:02:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DF82F8027B; Mon,  5 Oct 2020 14:02:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58B06F80121
 for <alsa-devel@alsa-project.org>; Mon,  5 Oct 2020 14:02:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58B06F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="AVpuGiwb"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="d3+QRcZb"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 35EE55C0047;
 Mon,  5 Oct 2020 08:02:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 08:02:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=Y1hLXBtPe3k97QoXYWSp0TNpaRs
 DYWsWj/6aYARplJc=; b=AVpuGiwbvil/tdw1QM+J6qsmYMDGZ0aI4A025mpMYHY
 8HU+1drPe5GvQjjSE9MRokekIkjNEY1DPeMDI/i6zW3ODbiYtdZu+KlYrZfHyShH
 KBnSdif1rcYG/VNdYELZ0m2FcswIPJFULOzwDG9+Utl2q03/wpL5A5n2rd+A+STK
 et8QhU7YSalDszFmevEQuMbzLrhlGSwKKCWO+ld4+6aQENj5etNrw3VMep/i6Ga2
 X5AT1UwEdb4kEJ6ZYEM1YfdgIxusjeq7wZeyQ1x1l6L/U0xd+oMg2CEw2nG81TMe
 szppAfd/gkFdI7QhJ7VQZLhUDYdSIFNLnJvMWHspSwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Y1hLXB
 tPe3k97QoXYWSp0TNpaRsDYWsWj/6aYARplJc=; b=d3+QRcZbJJe3bdYIb4A8Sq
 pEzZ79XrSqbroIsaaN6r/2fslztOPD9lteQE7P65T9USzA7f6EIsRtFB+XoeK/cV
 10YE6LijEjgnKMwH94TH7PCCKKtW1Sg5JeqWDatQNE3Ia9n+be3/X2cv1kt6l6r5
 Lv8jnqg8BF0QC7nrc0zYnycY97neGoQ6L05GAYYiVqWypZTARkttPfBJel3flN5J
 O8iycVVabwKCKb6MovPc7bIu2HdvMP0Xplw5m6uPniA4XSf4ij9wqfGiLQc1kg3J
 Eh3YVLAiA68mKXN9va0UytXXLWTJJwaYQXy+qJpa4f3RaYkvY0PAb//xnGJnWqdw
 ==
X-ME-Sender: <xms:Owt7X01V-Icm8-0CoCajiphcpKu_c6gSjMiVDGxiSWEIzDfxglv7NQ>
 <xme:Owt7X_GbUbJ29zUJhJb-1RlEAYqr0R8NQ7fp4AjQssTyBRbljZw1_KC6G1P99Z6e2
 dvHW_pYuGZ6ZXtnuwM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpeegnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Owt7X85DZvaMNgu14GEVZ_2q-U1qnLaGYZaMPkdtaXD7UTEIhQb3UA>
 <xmx:Owt7X91eQTWY0X-Ps9vH4EuYjF9Xi6x_0YuZD7FRn-DxhvuHaS31-g>
 <xmx:Owt7X3G2D76tOJiGWQoJSSrUBLEfVj7SXhb7PzJb6BhVcyftcvXYcQ>
 <xmx:PAt7X20EjuVhC5LITus2RNj8o-Y6EFVSGBaXGbTkRamyn4dGmby3DA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id AA9D3328005E;
 Mon,  5 Oct 2020 08:02:03 -0400 (EDT)
Date: Mon, 5 Oct 2020 14:02:02 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 22/25] ASoC: sun8i-codec: Enable all supported PCM formats
Message-ID: <20201005120202.ercvwd4cpbm33kdc@gilmour.lan>
References: <20201001021148.15852-1-samuel@sholland.org>
 <20201001021148.15852-23-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yeww75x6wv54vvjq"
Content-Disposition: inline
In-Reply-To: <20201001021148.15852-23-samuel@sholland.org>
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
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


--yeww75x6wv54vvjq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 09:11:45PM -0500, Samuel Holland wrote:
> Now that the DAI clock setup is correct for all hardware-supported PCM
> formats, we can enable them in the driver. With the appropriate support
> in the CPU DAI driver, this allows userspace to access the additional
> formats.
>=20
> Since this codec is connected to the CPU via a DAI, not directly, we do
> not care if the CPU DAI is using 3-byte or 4-byte formats, so we can
> support them both.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--yeww75x6wv54vvjq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3sLOgAKCRDj7w1vZxhR
xYDWAQDr5q94Ogym9NGJaETJjeya3WyYjNM3x/lY3+7DgCc4KgD/TwWZmKkUiPVh
4jSuQX7i0eDIXg/CHVOvPPRkRwj69Qk=
=EhaR
-----END PGP SIGNATURE-----

--yeww75x6wv54vvjq--
