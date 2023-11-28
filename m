Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0107FBDB1
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 16:07:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F027DEB;
	Tue, 28 Nov 2023 16:07:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F027DEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701184054;
	bh=pILPLtd771HZBZuE6cQu+MCbDfNms9E11eOdz1K9xtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Fet+nvsF7omi3PfVnJV6QbODKDg12o974jMxNAEHjRou4KdRNH5p/xPXxEFUFgQvH
	 QCcYslFFg/uXRAQoG9PLq+x2y4ldIqeuGbtzhEkcUoDP0xcfQsz5L1xmONBiKJRpKi
	 R3Hw6V9yDJSGHMwMlo24PTmWP5d2w/3I2FXcbIJo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B10A1F80570; Tue, 28 Nov 2023 16:07:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 01813F80571;
	Tue, 28 Nov 2023 16:07:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BB61F8016E; Tue, 28 Nov 2023 16:06:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A4F3F80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 16:06:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A4F3F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=s3LJnMZx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 18E61CE1AF7;
	Tue, 28 Nov 2023 15:06:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7072C433C7;
	Tue, 28 Nov 2023 15:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701184008;
	bh=pILPLtd771HZBZuE6cQu+MCbDfNms9E11eOdz1K9xtc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s3LJnMZxtnwWqtZPKXD/A5EFaGN3ifbKiTk6u6EozLohDOXC777GnAbm3xppzJSl0
	 sgBXd/woUqkM1RnhbjPK+unpGWi/DEeswiAdbF8Z/Ud9cTqSX2DscGttAkr+EkhybO
	 otv3ucPVw8DT9bPLsMzjSLp5jge2JPdunenyEkK4iYbShQDIFtS7M3uJRgKUqRVMnk
	 /43j4K8wlRe9Q5j4HG1mVuOYUd1Ak7u+bt9QmbLJxJnlQXHU/7KQTMa+Q+9zZKXn34
	 vSpaJ7s4ZD8TMYlf9z7pVnw9NMLAOPZFLFb6HXXKBd3nb7QKqA1bcPNx5ShPqC7mPP
	 emXbZzJLaVVPA==
Date: Tue, 28 Nov 2023 15:06:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: tlv320aic3x: Failed to init class D
Message-ID: <374f0221-9853-4eee-984c-05af01732582@sirena.org.uk>
References: <20231128-frail-parted-f6e66c217965-mkl@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xJV1iV53nk+AR+8t"
Content-Disposition: inline
In-Reply-To: <20231128-frail-parted-f6e66c217965-mkl@pengutronix.de>
X-Cookie: Must be over 21.
Message-ID-Hash: ICEO6PFRACGMF3FLOMDJJJL4OJBMRY3H
X-Message-ID-Hash: ICEO6PFRACGMF3FLOMDJJJL4OJBMRY3H
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ICEO6PFRACGMF3FLOMDJJJL4OJBMRY3H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--xJV1iV53nk+AR+8t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 28, 2023 at 11:55:25AM +0100, Marc Kleine-Budde wrote:

> we are using an I2C connected ti,tlv320aic3007. During probe,
> regmap_register_patch() returns -6, which leads to the error message:
> "tlv320aic3x 2-0018: Failed to init class D: -6". I think this is
> because the codec is still in reset and does not respond to the I2C

> How to get rid of the error message? Power on the codec, just to write
> the register sequence or don't print the error message on "-6"?

Yes, power on the CODEC - if you're applying a patch the expectation is
that it should actually be applied to the device, otherwise things might
get confused later.

--xJV1iV53nk+AR+8t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVmAgIACgkQJNaLcl1U
h9AbNgf7BM0oSD8+wY+WSPs/2PBQnwTQJoBWoC9j83wZx2RTFJhNocNYtHiKXmR5
/HZG6blOFSqT4PShf42HRXRNx3jmTcLjgH0F5QJoPybAnLbaKW1xaKDQ01cnNSyn
cBdkhuyEs/GkHz2PXrmurQ3O2kJWvq4MmsP9p43FvVw+BsT8HEITQKT8Zus1q4OE
kw8K9ini5UJ124yMBu6X3jBgLJY9CSYIqHYh1ybLKyMQtccH3H4zOwZBv/TmOosZ
lwvOFGokjJODr43FxoD+HdQ5ag+N6y+4mHfHS+3xzvVYQh0JucJ8KQIg0uD5iCql
6mQzYZ2fYguaM4d0+ETlmrUA3bkBiQ==
=dhI/
-----END PGP SIGNATURE-----

--xJV1iV53nk+AR+8t--
