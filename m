Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 389E7255865
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 12:10:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0F96189D;
	Fri, 28 Aug 2020 12:09:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0F96189D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598609432;
	bh=b57exGf296fWJKFip70+95WepZTijCU8SNL0m2LtUwM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q39lYmB9ViyjJuHiO+QuKYke3o7x87/i74syh83vgoGLHoYk6iXxDIo6fPRe7Kk38
	 gJhYjq8qXNgkNiHh3ZljszRJKNGIfb2EdIoPRIkUh7JM7kXLkap4Cv9cx7QgPwXhSW
	 mpYveatgn+6a6Hcl8ECIsm3bFfZcuGpfSM00slqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E88C4F80143;
	Fri, 28 Aug 2020 12:08:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A7E3F8016F; Fri, 28 Aug 2020 12:08:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9F42F80105
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 12:08:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9F42F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="WVYxVSgb"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="CJpQvLkg"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0FD8158047F;
 Fri, 28 Aug 2020 06:08:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 28 Aug 2020 06:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=y6PHXIgWBPbtvFBPhl/0zuLOSry
 Fkqx6ez5tJ90Cqho=; b=WVYxVSgb0Adj/HUfaYwpdtq5EVjUXz7gP8VgCCXLP2Q
 KR7QR9bZwHp0oLnfep/2mVN3ysy34lehi5C/E7ARR+CCnWRpImz60w6qzWa5Qzpw
 JEmjFEF/Lo+o2ajycT5Rdu6iqQ+z1Idg64Q4oMDyP6JmaHoIc7Be7ZBETMsYwJ5q
 UymRT2ezcFYLUj04JMUH4hIA8OTNwH8AUn4AQgU1kOFUfqpuGLrpYI6ntJ7AYfEG
 REBoNMBHZiGnbwFzBqXi3Cil4qXn6qRJ/9T6pZcyGLSKO+8xLv74ZgmWqR5mGcNE
 od5ieYGs+HjLhcvEu5Dczu1mfFqXm76jvGTeKjEQklg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=y6PHXI
 gWBPbtvFBPhl/0zuLOSryFkqx6ez5tJ90Cqho=; b=CJpQvLkgz0qjavV+hmVhTe
 6sjDv3GS45I+9yYLjRDUO9k+DTz8dIAfJ0qRM0C8Tfpgv+wQXC5CMyhIt/eykBG2
 U0C2NaR6KSyhcwFMXH7NNlrUUJa/EbsXc5jTczw+14Yb+IXJoygZz3U8M6J5Ryea
 c+ihh/19yDJkkYr1jsjqIJ/quDNFYDGBeYeHq6vppOAI3tgg0w8Bd6jgWKO1dIri
 w5iEicfLApxZt1f1HKipPjUPOoAuJoFvAXv2BXpAKHt/uCwIYe2EU+ZVDC3Rx2SF
 TqaE48tNqPrUmP4ZXskJPXcpfu4zVK5Xc/+rdtPw6DUWrL8fXtRqAGtiY4TzkLwA
 ==
X-ME-Sender: <xms:otdIXyKnO1l5HxfGA3FsuAWqqeyPUuoc5qYyMCcqEoTUFEd0uoXoOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvjedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:otdIX6LR3G0Ouj-8ogYE6_olnBuRuCTNOVkxMl3nEiiqNYwxc7QEGg>
 <xmx:otdIXysmFeCeeQDSrFP1Vc0wNvYxrywertj_lx183n76QcbsvaFCsA>
 <xmx:otdIX3ZO0ycDnGoSciSOh-9sN93wLeXx0KyW3fYHVhTmmB1t0GKYWg>
 <xmx:pNdIX2QUzismPVfRgMbjinfwYLihQlpRMM64bCqDlLZZMTPtw-pJeg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3BB7F328005A;
 Fri, 28 Aug 2020 06:08:34 -0400 (EDT)
Date: Fri, 28 Aug 2020 12:08:32 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/7] Allwinner A64 digital audio codec fixes
Message-ID: <20200828100832.rdom24nne3k72qw2@gilmour.lan>
References: <20200726012557.38282-1-samuel@sholland.org>
 <159776961932.56094.2705667823777375165.b4-ty@kernel.org>
 <20200824140334.6gflonflqju6g5ea@gilmour.lan>
 <20200825153652.GG5379@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="phq3v7zpz2byao32"
Content-Disposition: inline
In-Reply-To: <20200825153652.GG5379@sirena.org.uk>
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


--phq3v7zpz2byao32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2020 at 04:36:52PM +0100, Mark Brown wrote:
> On Mon, Aug 24, 2020 at 04:03:34PM +0200, Maxime Ripard wrote:
>=20
> > > [5/7] ARM: dts: sun8i: a33: Update codec widget names
> > >       (no commit info)
> > > [6/7] arm64: dts: allwinner: a64: Update codec widget names
> > >       (no commit info)
> > > [7/7] arm64: dts: allwinner: a64: Update the audio codec compatible
> > >       (no commit info)
>=20
> > Ideally we should get the DT patches through arm-soc, can you drop the
> > patches 5 to 7?
>=20
> When it says "no commit info" that means the patch wasn't applied.

My bad, thanks :)

Maxime

--phq3v7zpz2byao32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX0jXoAAKCRDj7w1vZxhR
xbIuAQChfBrRDxrpF84qEZXzXXGsgmWR8LFHxd9RZXSZEnbopQEAvQ0j9FgXis/t
SnAqPER+37FTmAxfocXlX+oSHxTsBQA=
=N5mz
-----END PGP SIGNATURE-----

--phq3v7zpz2byao32--
