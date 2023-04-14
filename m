Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F303C6E248E
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 15:47:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB3F1E7D;
	Fri, 14 Apr 2023 15:46:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB3F1E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681480054;
	bh=qdNpHUIC4JiGrdurn0+vm4Wd/ENL/9ooEsteVaLuuk4=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UXpY7cv4BDqAv9cVMQvPNOeWHHrCkOZT9xYMw98bba3YrCoSN5ZsDGYjcHLKV30b8
	 RI/YgnGnSGMhsPaGIV4CSK/nI52hiH12sCHSBvXNJW2ufH3GEEPaz3vOYf+3fCtO75
	 k+BHhESm27g5WGWXThIC4bb32745X2LvvG/fIUKk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FB57F8025E;
	Fri, 14 Apr 2023 15:46:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AC5DF8032B; Fri, 14 Apr 2023 15:46:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5AD1F8023A
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 15:46:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5AD1F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MPrLMrcM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5081C63300;
	Fri, 14 Apr 2023 13:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C67EDC433EF;
	Fri, 14 Apr 2023 13:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681479994;
	bh=qdNpHUIC4JiGrdurn0+vm4Wd/ENL/9ooEsteVaLuuk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MPrLMrcMmSp15iChEYeae4n22b0YBGJDx0YqK5fu8DsGgg4Inxm0Ktu4Qh2d1L2lD
	 7du/zQbSfh1Uz7fg4+7X98wfuh9x+flZOxdqoUfIcsCFUDVTdxKt3v0jHabFqM7oiI
	 b1gu7RtI6ffrFJ/j+i8EjJsIEhr/6lupcpy7Sgguq+oVazPxCqtYR5TK5A8s56XAsz
	 3dwGLXg2Z0iH7zYcza79z1JaHM4p5BfAwzmxpJD2KtjKbV4lGrOT/Z+LkyuDTWuWz5
	 4KnZrRr94hIM7RbmzM86Q/uauf2JqI0jQS9MOvSTv0Uc73vBnNvZ71tL7FXhHYOyIV
	 4NpV490GajA7w==
Date: Fri, 14 Apr 2023 14:46:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: nau8825: Add delay control for
 input path
Message-ID: <4f854448-c643-4ce0-be3b-770e0f7c7814@sirena.org.uk>
References: <20230414103941.39566-1-CTLIN0@nuvoton.com>
 <7826c2f8-3e8d-7786-4742-4b885b840cae@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YrWsGFGeEwf0jzLa"
Content-Disposition: inline
In-Reply-To: <7826c2f8-3e8d-7786-4742-4b885b840cae@kernel.org>
X-Cookie: One Bell System - it works.
Message-ID-Hash: RONYDMF4PIDCFEDFX3CF7KDV6EORIWUR
X-Message-ID-Hash: RONYDMF4PIDCFEDFX3CF7KDV6EORIWUR
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: David Lin <CTLIN0@nuvoton.com>, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 SJLIN0@nuvoton.com, WTLI@nuvoton.com, ctlin0.linux@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RONYDMF4PIDCFEDFX3CF7KDV6EORIWUR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--YrWsGFGeEwf0jzLa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 14, 2023 at 02:34:19PM +0200, Krzysztof Kozlowski wrote:
> On 14/04/2023 12:39, David Lin wrote:

> > +  - nuvoton,adc-delay-ms: Delay (in ms) to make input path stable and avoid pop noise. The
> > +      default value is 125 and range between 125 to 500 ms.

> Convert the binding to DT Schema first.

That seems disproportionate for such a trivial change.

--YrWsGFGeEwf0jzLa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ5WTQACgkQJNaLcl1U
h9AkVQf/T4gUM8Xf2ON2eylGJwUS2Jvw5AYEcP5qsVXHluewOAz/v6QdFgkQ2iHB
08os5FXV1DhC0uCIcAytKcIL350IF5Xm3oBAzzOk2PDNGLWRqjkOVvj+g1sgapcn
F67CDxf3R08sXIA8/8xU81EitMxHq9589aWdjHjDKG2cF8qBrS1bUj9JJ55yPuv/
1zPqkaiKOS8mLaVpCvB7++VdDwpxax+njH4gN0jp6XLrYN5YcTbXIjk4F3Q6OqAL
Nr7kSviPkJ5fJgwLp9ahCIIdciq1Z8759zLJoxBlPVKHWba0xHi1yn0lIDv0WQay
A3AwnNMUTMcuiaHCt2J3gS4yIK3w0w==
=oIAK
-----END PGP SIGNATURE-----

--YrWsGFGeEwf0jzLa--
