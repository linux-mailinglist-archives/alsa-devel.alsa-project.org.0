Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 071621BB87A
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 10:10:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92547168E;
	Tue, 28 Apr 2020 10:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92547168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588061407;
	bh=OVZvX9ztpd3XO2zL1SITFUQ9DK5Z2gkbV9MIZCnCejk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lU/Ux2eaFYUgFgD1D9ZFdkKUFzmklTT/LVwuXTtr3SDhny7M4LO8cy1gRzSBDAtyC
	 Kwd30+bthAnesaLfNjFVw38KG8XGa12tDpPfarO2LBCmOc7epOrUkUiWSF1TU9G78B
	 MuOyrV53oweZAsXzwkJuLHTguWjfqKHtYzEE1BDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8018F8010A;
	Tue, 28 Apr 2020 10:08:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0711EF801DB; Tue, 28 Apr 2020 10:08:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CBCCF8010A
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 10:08:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CBCCF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="A97YDx9p"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="acVa4t8S"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 59CAC5802E9;
 Tue, 28 Apr 2020 04:08:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 28 Apr 2020 04:08:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=OVZvX9ztpd3XO2zL1SITFUQ9DK5
 Z2gkbV9MIZCnCejk=; b=A97YDx9pFcTwEC5Eor+FoCSnxhkgx3giVjOGqyiOt4A
 atW1Qr06fsoPI+jEj/kPk6FGdXuPiyPYzMVFb3SjCeNFsGJrU82eW85D+EKC0RQp
 WgchYwQXxdyTnWXvLpC4wxFEijEwJktaYS9bDQbPesXQW85X8qv8r3HvlathPBP/
 3D8WaYkknpJA9Fes7VpC6PjeNU5GrhB4Ge0smn9pJf0JRbwtWmZ+zB0CtgrkLMUj
 SttfQgzNLsBcDhMpmtlU2iTUzDx9pMobL0K8TQ8OKPRAp/NmqCq6lAiokUcdg7F2
 /VTYVtOhNYqaFSOSMXdypJckaHsNun5UOuF3/eBhmzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=OVZvX9
 ztpd3XO2zL1SITFUQ9DK5Z2gkbV9MIZCnCejk=; b=acVa4t8SGRiPe0dSv6nKx3
 EXA/Wok0esjUe11KXXPCqhUWsm9lka0dIvIZpSyBjDSRS67eirA8VYpzc5SIy09V
 0gtKP6ttMTbze285gJ5OMGcwmkyhvwN1OzThRnRM2WsEn15Df2XSolk5plfIPYjz
 jLu4C2en7VWEPDhyIKTk7DWRRHoTKOiYAtmJyN0hiGce7enwFXffZs4ktVDx+w2X
 P/rSNtxGzJyhyddHV3cazH7H4NLJ651FpzAz1/0QixbATlM3PX8UBvp1ZviAzTlG
 p/BY/pea26eN7lV8oIKKPL6XxwC5Vuo4JSVXohF+WxiZl1/lV313G5aYGoH71I9g
 ==
X-ME-Sender: <xms:b-SnXgWxTXvdISPFiZrB4LN6FGORQVik4Lc5WJOZl68qupLHc0ZoyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieduucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 epfffhvffukfhfgggtuggjsehgtderredttddunecuhfhrohhmpeforgigihhmvgcutfhi
 phgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:b-SnXhQpZeFTgZ5WSDqescbIPH9xvHgH_gpcvAaMx73MAKqOyZ3G9w>
 <xmx:b-SnXoRYWIsHZ3J8cS3g9aPlS0VZfxF-hy1zb2_eQqNtfq9MBAjr8w>
 <xmx:b-SnXpc7mmOGQoliWXn8ickLqT7sXTw6yRoe9wH2s6KiZvrL73YkgQ>
 <xmx:ceSnXmZR4NXkjCHV49g7STZyYbdkwpdyP1Dp7IL4PDMJCzmQakF1TQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 950693280064;
 Tue, 28 Apr 2020 04:08:15 -0400 (EDT)
Date: Tue, 28 Apr 2020 10:08:14 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: ASoC: sun4i-i2s: Add H6 compatible
Message-ID: <20200428080814.ohoheyzsxuz3a2vx@gilmour.lan>
References: <20200426104115.22630-1-peron.clem@gmail.com>
 <20200426104115.22630-3-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="bzjincgmfho5il5t"
Content-Disposition: inline
In-Reply-To: <20200426104115.22630-3-peron.clem@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Marcus Cooper <codekipper@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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


--bzjincgmfho5il5t
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2020 at 12:41:10PM +0200, Cl=E9ment P=E9ron wrote:
> From: Jernej Skrabec <jernej.skrabec@siol.net>
>=20
> H6 I2S is very similar to H3, except that it supports up to 16 channels
> and thus few registers have fields on different position.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--bzjincgmfho5il5t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqfkbgAKCRDj7w1vZxhR
xX1iAQCyxmpAiKfglOauQ1fEaSGCeuG5209yy891bHX9EQTBfQEAic7/IcGTay+I
duX3bvjzJqt4tuc/CDhoFux4gXacJAM=
=2Teg
-----END PGP SIGNATURE-----

--bzjincgmfho5il5t--
