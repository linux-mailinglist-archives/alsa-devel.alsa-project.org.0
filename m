Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E942A0D45
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 19:21:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7EA51658;
	Fri, 30 Oct 2020 19:20:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7EA51658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604082083;
	bh=DrO9rPPWe7yx2o/HYgXvtOmqEqLUOzIreLpRvG6OK3Q=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V+b2BgtDqmuluocSWeCQOtA6zaa2KFiBz1DEqRqpiZPF6YY3mORHGkXzGUut5qoIO
	 yx/06V9mkVuhT75YbpWWFuOQZ3XnUlXmlqcjyv6swO00x82w7P9KY6nuANGFeQfYTl
	 Po86YMqAMcrastMOVab3g5o3QEd7LRKgItefUWdQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F7D9F80249;
	Fri, 30 Oct 2020 19:19:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F05C4F80212; Fri, 30 Oct 2020 19:19:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25496F800FF
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 19:19:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25496F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="wU8MnfZn"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3A3520729;
 Fri, 30 Oct 2020 18:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604081982;
 bh=DrO9rPPWe7yx2o/HYgXvtOmqEqLUOzIreLpRvG6OK3Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wU8MnfZn0r9WZ7MSs4KtDlRCtLRj8URezg836exJfCE6Vhc1S2TSv1aTFY7lXScvJ
 M6sO9r83fWp48vJbvoz0NKV228kCOSLD/EHw9VSw3Gq5gZkiagfYQsLdo1b82ncFYO
 tpbMtXUv5jiVrnckcuQWJQWfR7nv6D7iYx5gYwnw=
Date: Fri, 30 Oct 2020 18:19:35 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH v10 14/15] dt-bindings: sound: sun4i-i2s: Document H3
 with missing RX channel possibility
Message-ID: <20201030181935.GJ4405@sirena.org.uk>
References: <20201030144648.397824-1-peron.clem@gmail.com>
 <20201030144648.397824-15-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="liqSWPDvh3eyfZ9k"
Content-Disposition: inline
In-Reply-To: <20201030144648.397824-15-peron.clem@gmail.com>
X-Cookie: Blow it out your ear.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
 Takashi Iwai <tiwai@suse.com>, Maxime Ripard <mripard@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Marcus Cooper <codekipper@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
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


--liqSWPDvh3eyfZ9k
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 03:46:47PM +0100, Cl=E9ment P=E9ron wrote:
> Like A83T the Allwinner H3 doesn't have the DMA reception available for
> some audio interfaces.

Please if you're going to mix dts updates in with subsystem changes like
this keep the bits for different subsystems grouped, this makes it much
easier to handle things.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--liqSWPDvh3eyfZ9k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+cWTYACgkQJNaLcl1U
h9AyXwf7BSDWwTiF7Jtj3QLLD/yBskzrynLALio7KhuzLph2YZtmmDVoIW63VgJw
9ZpYqNu7iFdaSumpaOdukhHNRvB61XKOmhyFAUXjBER7X6AIA+fPCXoJi3JmqnfN
jxEehlb9wJJ5Fg74VASMsIuZo9et0xUtuNkU3rsmlwdIpE29EEGQVZYfMUkcDqIF
XluxWNIT6a4xQlsqan6n6do7kPz3OAVfQaZnnm4vzahnG7QhsGKob6BrBEYCdyLQ
PfC3SAIsXO+l6c/5+gRmLn/JOVWZdFdVxBz2FAd8rhgXmgxL1nbZRcBBU7IDnptb
0snc+vze5mOnvk7EFwTDHKNbUvwAOw==
=ngof
-----END PGP SIGNATURE-----

--liqSWPDvh3eyfZ9k--
