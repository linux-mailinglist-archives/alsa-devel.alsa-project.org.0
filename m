Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2878F710FDC
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 17:45:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFE1A1FE;
	Thu, 25 May 2023 17:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFE1A1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685029506;
	bh=Rnh9uTUVYZr2YTUohkaeBeK8GIk4QC1ZRZZ7ndFmbVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LqRfC208s11uwLiq2go+XXVrl4hLbtvZ5XjfxYFNPKCXd4N2FcvSW2fozitRyjfJH
	 d+gBZcrcDOE1UCJoVx1cH9KhbcY52LHd9uIrQDJCrkuILJFWGNf2bpkO+R9n1W88jz
	 q74cGPVWmhbjlhkk8+sJGFl2mjb8IijAsLR6GGoU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2681EF80425; Thu, 25 May 2023 17:44:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD376F80053;
	Thu, 25 May 2023 17:44:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47E6CF80249; Thu, 25 May 2023 17:44:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66AA0F80053
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 17:44:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66AA0F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Oj25qAs5
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C30A861489;
	Thu, 25 May 2023 15:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEECAC433D2;
	Thu, 25 May 2023 15:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685029441;
	bh=Rnh9uTUVYZr2YTUohkaeBeK8GIk4QC1ZRZZ7ndFmbVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oj25qAs5uQVw0/DNnVys3tM7gwwxhUjBEYwOI0WyAzJBJ6H5iiovRJsvBTtxREjIL
	 YZN2JJTCuiMDWxHzQofwPrLiG8h2AuUCbpXojkDxX/s+eemR0a3fvMqmCXHp2biIF+
	 YGLOTAZYQ/hG5ocXQeceabwkT6Li/Z5oSCsDw6D7TSphBX+xt4X0Ea982wTl1tUbkl
	 R9f33XhPqHhXV/mppwBjcwhbt6b7KVashmsd6kYFBd55/5aXbFzuLxtFWbbnT2aUT/
	 b3snwtgcA3FVLmJc5EG7RajzZpDZz1E2PgmtmWafVRuvG7oeiJZrUQPgmCs01M5hEe
	 td/2KtAtHxLiQ==
Date: Thu, 25 May 2023 16:43:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com, perex@perex.cz, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 00/13] ALSA: hda: Adding support for CS35L56 on HDA
 systems
Message-ID: <3205049f-387c-42cf-a8a4-b1156707655c@sirena.org.uk>
References: <20230525150659.25409-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vCCJbWOxCPIHYsGh"
Content-Disposition: inline
In-Reply-To: <20230525150659.25409-1-rf@opensource.cirrus.com>
X-Cookie: I demand IMPUNITY!
Message-ID-Hash: YR4EE3UQO2IRD6YOFYQ5T6CWRHC5RVYS
X-Message-ID-Hash: YR4EE3UQO2IRD6YOFYQ5T6CWRHC5RVYS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YR4EE3UQO2IRD6YOFYQ5T6CWRHC5RVYS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--vCCJbWOxCPIHYsGh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 04:06:46PM +0100, Richard Fitzgerald wrote:
> This set of patches adds support for using the CS35L56 boosted smart
> amplifier on HDA systems. In these systems the CS35L56 audio is
> routed through a HDA-to-I2S bridge codec.
>=20
> This doesn't include the changes to the Realtek driver to actually hook
> up the CS35L56 driver, because we don't yet have the QUIRK IDs to
> associate it with. But we want to publish the driver now so that it is
> available for bringing up hardware with the CS35L56.

The ASoC bits look fine modulo the one issue I mentioned, with that
fixed

Acked-by: Mark Brown <broonie@kernel.org>

--vCCJbWOxCPIHYsGh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRvgjsACgkQJNaLcl1U
h9B4RwgAhD9nQ7OWhpSd8WAk5CrscWbsV62DLDcm/qwLsFzz3VQlHXq5LY2/KM27
aqGH/8f0zUAWZxK/LMGQ7Q89lkYrmCghahCylHSHwwkyk3/U6RqPdVTjvoMeQuHC
7Cm6LwklU933g1I7SfwonG9y5Yt0DnszDCpuk9fbvohu46DtOpx3M+4kVcP/fCpP
qcjMNz5SYyUipk5Rdn8H9XN1kG5bi2DDoM+x5pVIaAfjNgTMVp04IiFZGeLzY6Fl
gtGB2rcDwvkgVXQGSg7i51+YkfA6/wflcxfxhv/o1TupzeeYwW97xyYXfbh+1NJ5
FZtCv0oydYAaWBTsnGMfWDuXaizAxQ==
=28Kw
-----END PGP SIGNATURE-----

--vCCJbWOxCPIHYsGh--
