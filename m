Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C57A21521F
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jul 2020 07:19:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA4711673;
	Mon,  6 Jul 2020 07:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA4711673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594012770;
	bh=NR9JuDJSxprosR88veU7YDQWe0efhUZC8x4WAqVey/8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lkDhJv/SSj5K3AOVOSrKwMzujMeDP3Dl3VOeKmoB4zv8dCdEhyE92oj3/f4qT0mix
	 olgzHx37dxaAQv3LlcXbrmgPca96TGh6fg7UtbivHf7CCyrHlbLQmSG5GNvHkIxo4n
	 0o1evzkHVHGQyZE0p6CoXdPfKn6p81ah+OWO3jt4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE1B7F80125;
	Mon,  6 Jul 2020 07:17:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02262F80150; Mon,  6 Jul 2020 07:17:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D467F8011F
 for <alsa-devel@alsa-project.org>; Mon,  6 Jul 2020 07:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D467F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="WDwSPLS9"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="OLrQyTIq"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id EC8055804D7;
 Mon,  6 Jul 2020 01:17:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 06 Jul 2020 01:17:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=NR9JuDJSxprosR88veU7YDQWe0e
 fhUZC8x4WAqVey/8=; b=WDwSPLS9M8rF9tDzf3mDfm0xSA8tXHFrpbumq9dqb0X
 AZKBSrNnTkuv5uCu9rYWIKzblkYmWbDf2CGfip4C+NQbOCwHIw4+pTpTc2p/s1w1
 WOEZBzRYjnQrklS1eJcqnkyA4y8w4ayVXNDkCmz2EcRtg24fsvUxwbqDA7ksFyzE
 ojTEldPHWttcM10TLumzVDpBf2wwMxPuVXw7sxKwDC8COX+Q6CzuzBElLLcs5Vcf
 1B1p9CsFKDoYAyJLu6cVXXwTrLHlSUtJozFZjBjU4hQwVH78iMg8nY8Wj1zcWsKS
 1XBaAqco6rZ7vCPaB/H25tAkd6nzW7TNShOSQcMOFjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NR9JuD
 JSxprosR88veU7YDQWe0efhUZC8x4WAqVey/8=; b=OLrQyTIqHn0S5C4SUqh6qU
 E1O5/AE3ptJJ0Z5PdAYdrpZiBv7l8Ku4O/TtFSEY2zxiyqvHK2CiFteP0DP6apZE
 xwig0cmFg8gv9Tixch7s+Ya2ejNh/B1ihIxPmrGfShXzdvwNxgCLWZwUOyCZO6RR
 4NSH9tPiBhnI1RlYRkLZVpU7VJVdXLBbkN3bOxiXYnXKBEPIJ4Eyx7evmZFwOigG
 iRrdv+ODzDlwgXSxyn+TTKJcRjGW1z4kqGzVxspSVZL/2nE+pp/Fz6J4zqdVRbQz
 HeU4qyBjnDkNI6SD4qwTZR0ydvpJ/7C1yvhYo8dnwo5NZxBdJbMnsnRFgpW2KiMw
 ==
X-ME-Sender: <xms:9LMCXwmLhCywgZgbWKhVHyEt5P4RAypNXQ7HxvPkTj8JWabcJ6LaaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:9LMCX_1km0t3kWYVONVNc68GyFt_ZReQ8SKeawLZziE_eRTGUlCfog>
 <xmx:9LMCX-qlgUSDl9zxgP8ceb3Y8pdZH2yK-icwjxghNsHDz6kBvCKCVw>
 <xmx:9LMCX8lM38o54hzQ239duZgQbae2tofqbJK9AZmcM5VaKBIZXFKHyw>
 <xmx:9bMCX3tzhVPJDfDn0cLCTTeDaifRYb1PJmleVFTN3-z4tIBM-Eyi6g>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1E1C33280059;
 Mon,  6 Jul 2020 01:17:40 -0400 (EDT)
Date: Mon, 6 Jul 2020 07:17:39 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH 04/16] ASoC: sun4i-i2s: Set sign extend sample
Message-ID: <20200706051739.iq23kvpzl7v7cpkp@gilmour.lan>
References: <20200704113902.336911-1-peron.clem@gmail.com>
 <20200704113902.336911-5-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w3m5qw7u5kg7rmoz"
Content-Disposition: inline
In-Reply-To: <20200704113902.336911-5-peron.clem@gmail.com>
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


--w3m5qw7u5kg7rmoz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 04, 2020 at 01:38:50PM +0200, Cl=E9ment P=E9ron wrote:
> From: Marcus Cooper <codekipper@gmail.com>
>=20
> On the newer SoCs such as the H3 and A64 this is set by default
> to transfer a 0 after each sample in each slot. However the A10
> and A20 SoCs that this driver was developed on had a default
> setting where it padded the audio gain with zeros.
>=20
> This isn't a problem while we have only support for 16bit audio
> but with larger sample resolution rates in the pipeline then SEXT
> bits should be cleared so that they also pad at the LSB. Without
> this the audio gets distorted.
>=20
> Set sign extend sample for all the sunxi generations even if they
> are not affected. This will keep coherency and avoid relying on
> default.

Isn't it coherence? But I guess consistency would be a better fit here.

Maxime

--w3m5qw7u5kg7rmoz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXwKz8wAKCRDj7w1vZxhR
xWSLAP9hay+f8E5e/1Itz9dHVzk/FAuNYb7kshs+hKNfzm5jYwD/Wb/F1NshovgE
6IjGJfX7mAWqJ8QZTR3kC3vjvIa55gc=
=ZpQ/
-----END PGP SIGNATURE-----

--w3m5qw7u5kg7rmoz--
