Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAAC6E287F
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Apr 2023 18:40:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14C1CAE8;
	Fri, 14 Apr 2023 18:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14C1CAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681490407;
	bh=UBjDcBltRrc65UQqBD10A3UE1qPpibkHbHReUbc2beY=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a98oH1wL/dVv347GAT4RVh9JVcDRC/PGductS2am964gr29v6NRWEdv4p29V8Cy9H
	 8+x/jAT1jgYVC1cXG5aj3eBkEbROp7avKHFLpN3put2tzb/Ra1aSJ43YXGSsYYKnIg
	 /pcPpHElgEGg4B4doiS/VKPNazTgmMUL1ZjbIkU4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80799F8025E;
	Fri, 14 Apr 2023 18:39:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D11FCF8032B; Fri, 14 Apr 2023 18:39:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B4D8F80149
	for <alsa-devel@alsa-project.org>; Fri, 14 Apr 2023 18:39:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B4D8F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pdNs67qe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A2A00647D2;
	Fri, 14 Apr 2023 16:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E00C433D2;
	Fri, 14 Apr 2023 16:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681490342;
	bh=UBjDcBltRrc65UQqBD10A3UE1qPpibkHbHReUbc2beY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pdNs67qeWLjx+WeweJ/+qGKuU15d3Kz5RZmXQwITGG9Gq/IstoJg7gsIcv4W5sgGD
	 weECsi2ISsoeCTF4TtJidx55hhBTZ3RU8DVH6tPCYb96NGD/j40cUjp938BsmnNvfX
	 As9p53qoMLkdP6clzzR5ZuAe5ZXUHEAr4rrxTsU6dgyKia86YPSiMg0A94uxxRPt/1
	 1FkKUaDW77H0VidYQGVvlW9B4v1Xkf8lCsbzKQ7AQ27JuwvKPxla5BrgNaEkHBiyPX
	 6DMsCMWqMrkZ1CpT+0dLV7OJvniYUeGGKr8DSJRLbfcr4Xlj23bsggNe7W1BVuvWvp
	 ANDMEVIqLRzFQ==
Date: Fri, 14 Apr 2023 17:38:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: nau8825: Add delay control for
 input path
Message-ID: <054c3a85-9e29-490f-91ee-42912cef1767@sirena.org.uk>
References: <20230414103941.39566-1-CTLIN0@nuvoton.com>
 <7826c2f8-3e8d-7786-4742-4b885b840cae@kernel.org>
 <4f854448-c643-4ce0-be3b-770e0f7c7814@sirena.org.uk>
 <82b74a2f-edab-908f-bc7a-2cac572cf3a9@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fKOKeV15bh7uCYwO"
Content-Disposition: inline
In-Reply-To: <82b74a2f-edab-908f-bc7a-2cac572cf3a9@kernel.org>
X-Cookie: One Bell System - it works.
Message-ID-Hash: LXGM45V5GFKOZOG6OGUGYE7CQG7T56IF
X-Message-ID-Hash: LXGM45V5GFKOZOG6OGUGYE7CQG7T56IF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LXGM45V5GFKOZOG6OGUGYE7CQG7T56IF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--fKOKeV15bh7uCYwO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 14, 2023 at 03:58:06PM +0200, Krzysztof Kozlowski wrote:
> On 14/04/2023 15:46, Mark Brown wrote:

> > That seems disproportionate for such a trivial change.

> What is the difference between:
> 1. Adding 2 or 3 new properties to TXT file without converting the file
> to DT Schema,

> 2. Adding 1 property in 2022 Sep. Then adding one more property now.
> Then adding another property in 3 months.

> I don't see.

Me either, but I also don't see an issue with this situation.  If
someone wants to convert to schema they'll get round to it, meanwhile
the code isn't held up by that process.

> Every time the excuse is the same - it is just one property, so let's
> add it. Since this is second property, after we started enforcing DT
> schema, I don't think my request is disproportionate.

> I think my request is reasonable.

The schema conversion patches are very often disproportionately hard
work, there's a lot of poorly communicated rules beyond whatever the
tools actually check for.

--fKOKeV15bh7uCYwO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ5gZ8ACgkQJNaLcl1U
h9AT8gf9FnJekJDnKgCvMCjSjmBVCXaExYwsF/m0bUkStjteiu20Je9Afk1QeNS3
DTYm7taCOhiBUjSycCpfNoa0t3EGMkdd5YFryCfwWxpXkvFKuDfx6Mqly2+SH8gW
jymeBGy14efyPyMl+5eld+JGTuY4yA6JZw604PGFPDAcdmTTxpmeZsU82Zx5O1hN
WkgRVJ2Mb+97BZcBG7kt+HJHzUFc0H9SK6VgstVSVLXS26QE1cmtKSalvy2cps9x
pIs95++C/gRI3y/XKAJGNx9N8BJHP3rSky1UCOgSHOHki55NE9Z5Wz7jNR9HyfXZ
IfxbyU0L+5oHuj77H4ayyOb5v+u91Q==
=pjIt
-----END PGP SIGNATURE-----

--fKOKeV15bh7uCYwO--
