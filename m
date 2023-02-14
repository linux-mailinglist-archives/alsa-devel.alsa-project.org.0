Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A021769678E
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 16:03:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F08684C;
	Tue, 14 Feb 2023 16:02:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F08684C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676386988;
	bh=b4qXj49NhLH+VmXo0IEZTy5nxQfaEwAeDK2n+P1ywmc=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sW1s/sNK40PM0WVg+HtOetWY01kGa+8vYBlFbaqucQL45bswepvEWnL4t00rqCCvS
	 SxNWvGLGbkcq2wHEPw4ZdKtcqA2YYjr+Br7DUZ0COTxWoyAFkH2GCkYKiD67UVEdtP
	 iwkrfA2j5zpKrkbJNxSuUQnGeXNkTcJTgJeKpdic=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DBB60F800F0;
	Tue, 14 Feb 2023 16:02:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA595F801C0; Tue, 14 Feb 2023 16:02:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6139CF800B6
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 16:02:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6139CF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EjbzqFnN
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 26E9C6154D;
	Tue, 14 Feb 2023 15:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D784EC433EF;
	Tue, 14 Feb 2023 15:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676386926;
	bh=b4qXj49NhLH+VmXo0IEZTy5nxQfaEwAeDK2n+P1ywmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EjbzqFnN4aFc6EWXGWB6K1KNNMkCWsFg6UQAksXetf8alFsuLg9B2NxdBhl7zCRS/
	 +gvKhyWOdAcno5Cpl0xcE0ik4HwMh+sSTf9Id5/xc0nl4cuCfc+T0+MTe0gkimr79M
	 2SluDBB4Nin2BdCdt8dGaMygm1gEfnd8YUDfJDu6x7Z4oV5/Wb/fGAIEdFF6swYD+x
	 Spir2LsPdDAVfoPJk3d0pdMwBiPifBiWz2QhOYoxYl51OMzMF8UamYED1XxL9O/yIL
	 mU+Cwn1ZqY0ybO4xi+6z9jMdKNp3niKQ7TZPePXMogTgv/neYzIdoL01U6tIfu1sdS
	 lJZlDUnn4NR3A==
Date: Tue, 14 Feb 2023 15:02:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: sound: ep93xx: Add I2S and AC'97
 descriptions
Message-ID: <Y+uiaqvdIL4IpRlC@sirena.org.uk>
References: <20230212232137.299005-1-alexander.sverdlin@gmail.com>
 <46d5b6af-23e1-4178-83bc-b4a435b1426e@linaro.org>
 <109868b9492aecaca0a7170cba9fb51e62de7116.camel@gmail.com>
 <c4f5f733-ce22-2dfa-30f7-cde309eadaf9@linaro.org>
 <ba51ecefb814115e977d90062ca5fe99859cb327.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V0fp7JQwCfap5FMO"
Content-Disposition: inline
In-Reply-To: <ba51ecefb814115e977d90062ca5fe99859cb327.camel@gmail.com>
X-Cookie: Serving suggestion.
Message-ID-Hash: 3W4H67YJN7EPTGOJ4IAMEGWAD3TF56IG
X-Message-ID-Hash: 3W4H67YJN7EPTGOJ4IAMEGWAD3TF56IG
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org, Hartley Sweeten <hsweeten@visionengravers.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3W4H67YJN7EPTGOJ4IAMEGWAD3TF56IG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--V0fp7JQwCfap5FMO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 14, 2023 at 03:26:14PM +0100, Alexander Sverdlin wrote:
> On Tue, 2023-02-14 at 15:11 +0100, Krzysztof Kozlowski wrote:

> > OK, but then I like the example - if datasheet would use name
> > "clk_clk_this_is_clk" would you still find it meaningful?

> > Every clock input in clocks is a clock. There is usually no need to say
> > that a clock is a clock...

> I see you point, but this is legacy code (sound/soc/cirrus/ep93xx-i2s.c)
> which took these names back in platform data times... I also see that
> rather majority of *i2s*.yaml use something "*clk", so maybe it could
> be accepted for legacy code?

Even ignoring the whole legacy thing these are industry standard
names for the clocks - they are pretty much universally named and
referred to with the clk suffix.  I can't see what removing it
would accomplish other than reducing clarity.

--V0fp7JQwCfap5FMO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPromkACgkQJNaLcl1U
h9DNdAf+PfDbEGrwAar/U6K2LSnAK3ainnO5AXgzSEuk3ZaWIdkd41jazqjW1RwD
mBX9lNnquoCvsBYlvcfod9Ccs0+GzPbFDgDkxe+EuJ9HqSucvvy4Z+rtvQ1ID14b
7TKCESoXoiIBe6V2hcBYk4bG4979bG72yNChMj59BeudkHCSYpz51D+5YfHxRR/W
BrQVo8Ek09ACp3x8dScwvhKdr3uKWLekbT5rjLRVM1YmuMiHxc1cJwneBnTwNadS
5NNFNJV3nT5ljqIIyOAmPW3REJzV1mc17XfDeFvHk12GnQzQB45j7KIEnns/oNbT
Q8pVKJsSeGBT/7ptDNUajI7hZ6SMbg==
=ZBYi
-----END PGP SIGNATURE-----

--V0fp7JQwCfap5FMO--
