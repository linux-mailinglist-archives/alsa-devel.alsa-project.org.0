Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 958C483AD02
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 16:17:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D90E827;
	Wed, 24 Jan 2024 16:17:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D90E827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706109451;
	bh=teEG/HE5cVE8qRdJoU3arSGKdBLpBxrZ1kXz0DlNeQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nwldRVKlbGToSzIRx/WOXgsLAiFO7SDAN2q3MuUIi/B8rRvJe3kvj+KHT2eKeVI30
	 3wnNSF9COeTrzBSxIj1n1Aqf+2mxKh+CwyE8lDNAbbB/IQYaOw4SpdTyjgC8+/fjGd
	 adIXF0np89VbBRxrL48owFUpAH545jwdFJFThc28=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38F4DF804E7; Wed, 24 Jan 2024 16:16:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8985FF8057F;
	Wed, 24 Jan 2024 16:16:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61552F8028D; Wed, 24 Jan 2024 16:16:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FB73F80149
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 16:16:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FB73F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E4IeEzzt
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C458BCE2E42;
	Wed, 24 Jan 2024 15:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84823C433F1;
	Wed, 24 Jan 2024 15:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706109389;
	bh=teEG/HE5cVE8qRdJoU3arSGKdBLpBxrZ1kXz0DlNeQ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E4IeEzzt8PL7Pq3Tv+Y3kdLw8a3QLEHW6MaQrtF4v1lSjv+qa+J+exdrrMMuvHQAY
	 8C5wkdWbVDKSMU1wVujfpwYxmNJnSg3YGPd4kgD0Oo8lAMwAaa2m88jIPvsBkni/c7
	 OiFS9ZiY1OgcATvhch9/nGMOZZc/Rzc4UHYgmxNySDv2UPOr2J0YG/rP98vQIiHk0h
	 vlNZ83gU47NtaEVsIlFFJcoPXZVdGmVHEjtNuF22JlnzyWAnIeFSutSjFjVTjt3rz1
	 M6//f9lqcS+XSyWlTowDywBA3HqTKu3z7jTiXGowSkaVrd58r25FfpfoWFY6kt6JY5
	 EB8iijR1l3e/A==
Date: Wed, 24 Jan 2024 15:16:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lee@kernel.org, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: Re: [PATCH 6/6] spi: cs42l43: Tidy up header includes
Message-ID: <8b8fcdbd-b1c8-4618-acf8-e31b6ab33be7@sirena.org.uk>
References: <20240124151222.1448570-1-ckeepax@opensource.cirrus.com>
 <20240124151222.1448570-6-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="555fmk7VPc9JdOqq"
Content-Disposition: inline
In-Reply-To: <20240124151222.1448570-6-ckeepax@opensource.cirrus.com>
X-Cookie: To err is human, to moo bovine.
Message-ID-Hash: CRRF7SLI6XALSFUQTYJWKDX3KYEKRL7K
X-Message-ID-Hash: CRRF7SLI6XALSFUQTYJWKDX3KYEKRL7K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CRRF7SLI6XALSFUQTYJWKDX3KYEKRL7K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--555fmk7VPc9JdOqq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 03:12:22PM +0000, Charles Keepax wrote:
> Including some missing headers.
>=20
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>=20
> The changes to the MFD headers necessitate the inclusion of of.h here to
> keep things building, hence my including this SPI change in the this MFD
> series. The rest of the SPI fixups will be sent separately, as they are
> also not dependent on this change.

If this is needed to keep things building then presumably it should be
before or part of whatever change introduces the requirement, otherwise
we have a bisection issue.  Anyway:

Acked-by: Mark Brown <broonie@kernel.org>

--555fmk7VPc9JdOqq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWxKcgACgkQJNaLcl1U
h9Ai1Qf+Iwy4hQvX006euDyDS3MsQArWK4ZhxwxVt9gRfwug+2P5Krqwe0yE1X/2
H5KXUz1D8h8mb75KTMpjkFH1Inhg2xYvh6Ib+SeIkOTms3yHZV+WVCD7lOQvgz5I
1vGDBg4Rpxo7pQdxDU0yO2tBkFcAyUdLLkzl09Sfl/gwotNc1xAV1RfOZJgvXSFi
tlX/OK36m1R1iuKBX+OjF+Imn8ItunzXt9D4zoKerZ8FBHqeXNuoVT7IO9c89/K5
OWt+Wamf9D1ce+DJiY07sMRP6ZpThempR/uAR0S5ruNd43iNKirI45l43MXBzxHA
rbZOc23OXifJwDHx51yXx0pIOdS0Cg==
=Sfm2
-----END PGP SIGNATURE-----

--555fmk7VPc9JdOqq--
