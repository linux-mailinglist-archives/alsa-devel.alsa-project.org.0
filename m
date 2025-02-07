Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D22AA2C3A2
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Feb 2025 14:33:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36C876023A;
	Fri,  7 Feb 2025 14:32:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36C876023A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1738935177;
	bh=J03El1fIwg9sWRo6dYAi97+3ceFhningAp/1mf98+ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iyKfoi6MhtGQJ/BuOkAfaN2ARBYLyZQNFn+X85TWPX8+ls1x2VVIY9V4VRVWTYPg3
	 /bsp5D15GpzPoaVr+1BkT5uQgoRzz76fN4qponO9iUcvlSEaj+g/67qsV0gf2uI0lE
	 YzgcNAAMm0D0b2f91ZsiXMgdLCn6RemX2x41urJU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A5BAF805BE; Fri,  7 Feb 2025 14:32:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8DD5F805BD;
	Fri,  7 Feb 2025 14:32:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4025F8021D; Fri,  7 Feb 2025 14:32:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C28F6F8013D
	for <alsa-devel@alsa-project.org>; Fri,  7 Feb 2025 14:32:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C28F6F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IRiTmO80
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B14665C1075;
	Fri,  7 Feb 2025 13:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DE7C4CEE2;
	Fri,  7 Feb 2025 13:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738935132;
	bh=J03El1fIwg9sWRo6dYAi97+3ceFhningAp/1mf98+ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IRiTmO80WADYJTu3BNx7mKiVQ+260cmXVczTj3WjyfI8R1XthtfQHzWmYaqWm34jp
	 g6fK+6Ps+CtYu3BBrIrzdHnx6cXo6RAlCnZtcUWURfSLvBpAaWBIz2xKBZZMNe3K4T
	 yWZVwQzhg5KJZe4Bq3VxuKKcZ7399OpjYyTOYqQpBY5+Ywwh1wxb+7FAvepaJRXJ0L
	 8uTRz0JVDOgA7aKB9bKU+kY6IzT0PK+5W5i9qkhj7+5oTNf+XghPhF0pfKlA7C0yT3
	 O6yZufys5W/j3rUVrNonG9DzlxGcVWXW9WdWh6YQfFh+xdS9RjdDJNVvruYpXwYGIb
	 xNqF9i1oqoDSw==
Date: Fri, 7 Feb 2025 13:32:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, venkataprasad.potturu@amd.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	Syed.SabaKareem@amd.com, Mario.Limonciello@amd.com
Subject: Re: [PATCH V3 16/25] ASoC: amd: ps: add soundwire dma interrupts
 handling for ACP7.0 platform
Message-ID: <a799e6fa-5ef7-4e1b-993e-52555a73f2a8@sirena.org.uk>
References: <20250207062819.1527184-1-Vijendar.Mukunda@amd.com>
 <20250207062819.1527184-17-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uteoji9fEH0SwSgL"
Content-Disposition: inline
In-Reply-To: <20250207062819.1527184-17-Vijendar.Mukunda@amd.com>
X-Cookie: MMM-MM!!  So THIS is BIO-NEBULATION!
Message-ID-Hash: UU5XMQSCUYL2UJJHZRB3MV3AM32HOCM2
X-Message-ID-Hash: UU5XMQSCUYL2UJJHZRB3MV3AM32HOCM2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UU5XMQSCUYL2UJJHZRB3MV3AM32HOCM2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--uteoji9fEH0SwSgL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 07, 2025 at 11:58:10AM +0530, Vijendar Mukunda wrote:

> +	if (adata->acp_rev == ACP63_PCI_REV) {
> +	} else  {

Unless I find something major in the rest of the series I'll apply this
but it's much better to write these as case statements, that way if you
get additional types to handle it's easier to extend the code sensibly.
Please update this incrementally.

--uteoji9fEH0SwSgL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmemC1YACgkQJNaLcl1U
h9AZjgf/Re3/hzacc4lKEq0a/6HKcVZ9lkkHESE8nuwWhO5GTHJCSiHliGmuL9oY
3QdsdDNfP39UVLf7tN5MojsX49ROaBrJmph8xeAdjls1F4FUGvjfdr9GD8NNgoFf
XsmMmneCwS8sO/sdqmZ3VhxVrb2GQkmyE5oGFg2fxwXEz8afm+agfQrepQXR5FJN
uOWq6z5LqMAaNHUPSyUT8kr1RKMFiQu3S023J+RugahD/Ec4ghUX3niFU4WT4nJi
hAzMilXSffF8fZEjUtzfQO3AlzU8R3Gi9KvwgtA9grIp4jSFXHCv0bW+9BwMh1HW
pAegkRM8mQks3u1dVpNIkHa08i9Qqg==
=xGCR
-----END PGP SIGNATURE-----

--uteoji9fEH0SwSgL--
