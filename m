Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE40C77E732
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 19:04:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2883A1CE;
	Wed, 16 Aug 2023 19:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2883A1CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692205484;
	bh=ev4FifmbigM1CLVALqUmJT03ZpWYzZyqPMwN2b+ho/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rjVG0O1m5FlSnWe2lkjQLYryl5zHmMc2+p85OJsTDHoY45UDv6QOepnaS1vKJymrO
	 rUBK4agYLAsFaDwCGizjJcruhKeoOsOoVC72KweTaCC5r5qHIjj1SFo3tMFnZDfpr9
	 9O11U/XhPv1yTJhp8KK31RvEDWdT1qJOTw/TRWuc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A114F80254; Wed, 16 Aug 2023 19:03:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ED78F8016A;
	Wed, 16 Aug 2023 19:03:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B518CF8016D; Wed, 16 Aug 2023 19:03:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B58CAF80074
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 19:03:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B58CAF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Xfm+zHxm
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C7CB066C96;
	Wed, 16 Aug 2023 17:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF655C433C7;
	Wed, 16 Aug 2023 17:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692205404;
	bh=ev4FifmbigM1CLVALqUmJT03ZpWYzZyqPMwN2b+ho/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xfm+zHxmWpxJ6jJyINNaLWSzf2iAhhy7k/5RYYX7c6BHVzx/HskKquQQudNDMdwPv
	 xYc7hJiSDHbxkm3l6Zi1WRwbO8pxDKhWFzLwvMyTejg09Viby16jN5D4kGYvSca44s
	 2PsI8jAPkRlZrbepnbs8C5Jf44ESBVV1k07djmsSbcm4bPBz/7aZkbYDCLlqOByby8
	 PlPVf7+tEzeI0DS7LUfG6xYIs8JIIZe4+L5Tx0EMgEdnWjemqUaygzxis9IU0SDs2b
	 hEdzn5+rvEWRavLnwLniIvbX7FwexXGtOapIljZUx7sIxn9M1nW1iIqvPO1UnnB39q
	 Y+cKOlQemDWUw==
Date: Wed, 16 Aug 2023 18:03:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	Maciej Strozek <mstrozek@opensource.cirrus.com>
Subject: Re: [PATCH 2/2] ASoC: cs35l56: Read firmware uuid from a device
 property instead of _SUB
Message-ID: <c3e42efc-9ddc-4788-85f7-cfa350d75d43@sirena.org.uk>
References: <20230816164906.42-1-rf@opensource.cirrus.com>
 <20230816164906.42-3-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mCxFNzxxpmJFmSsL"
Content-Disposition: inline
In-Reply-To: <20230816164906.42-3-rf@opensource.cirrus.com>
X-Cookie: Old soldiers never die.  Young ones do.
Message-ID-Hash: 64MMQB46YULHCK5XEN4SO2OV4QI7CAIW
X-Message-ID-Hash: 64MMQB46YULHCK5XEN4SO2OV4QI7CAIW
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/64MMQB46YULHCK5XEN4SO2OV4QI7CAIW/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--mCxFNzxxpmJFmSsL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 16, 2023 at 05:49:06PM +0100, Richard Fitzgerald wrote:
> From: Maciej Strozek <mstrozek@opensource.cirrus.com>
>=20
> Use a device property "cirrus,firmware-uid" to get the unique firmware
> identifier instead of using ACPI _SUB.
>=20
> There will not usually be a _SUB in Soundwire nodes. The ACPI can use a
> _DSD section for custom properties.
>=20
> There is also a need to support instantiating this driver using software
> nodes. This is for systems where the CS35L56 is a back-end device and the
> ACPI refers only to the front-end audio device - there will not be any AC=
PI
> references to CS35L56.

Are there any existing systems (or might there be given that the driver
is in released kernels already) which rely on _SUB?

--mCxFNzxxpmJFmSsL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTdAVcACgkQJNaLcl1U
h9Bpvwf/SfY9iHnNfei4bgVEObHBYW1vvDBYoFnc8Wf7UZyhn9vOUw/B832UE0OW
nBPxsrzdR+D0pAaOhHtO+RdZYksgVb5V0Q+2ryETwUovxq+Dt3/df+3KDXzLucXf
WOzYM9ShXr+ZkOpHz0vOa+NtI7UIlf+xxr58aa3n6756SrOA1T4008bBagARKO9e
KT2dapmWvC1Om5kEMHCmx7OlWEiu1BcD2j7yrqrs0qNyIO2I6hrwiVdwxNxhmnYo
vl3ShIyd9VjulEFs+1uGccp/gGhRcj1p/3eN1h3XwIqt+90g3NbZC4xtiJztmYvu
PjHBVkrBviRXjpA/DERYZCAGJ/mHiA==
=rCmL
-----END PGP SIGNATURE-----

--mCxFNzxxpmJFmSsL--
