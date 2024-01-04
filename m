Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E7682474C
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jan 2024 18:23:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5DC6E99;
	Thu,  4 Jan 2024 18:22:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5DC6E99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704388980;
	bh=zTbm8vqIgREP9xUh5RR/d7xMKSNXbjKCjPWbk6W/NSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bVTzaJj0W00V0uwYSpzEGLF4wOQizXH148uY64OThn1eFnhlTE2b1OWAT5ddsJS4+
	 6EcwHV0WKC0HfAIWkgmXloVGfHEQ32MZFPW7tlZ42P5AAraFqu8dbTgTCiVeeBv9iQ
	 cx9oj0yc+6BSCmEdojt9t2RKDwJJJjCV90y5JhEk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53082F80579; Thu,  4 Jan 2024 18:22:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2B34F804E7;
	Thu,  4 Jan 2024 18:22:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 085DDF804B0; Thu,  4 Jan 2024 18:22:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65E59F80086
	for <alsa-devel@alsa-project.org>; Thu,  4 Jan 2024 18:22:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65E59F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fix3L17+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 04B59618C9;
	Thu,  4 Jan 2024 17:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BD6C433C7;
	Thu,  4 Jan 2024 17:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704388939;
	bh=zTbm8vqIgREP9xUh5RR/d7xMKSNXbjKCjPWbk6W/NSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fix3L17+M3Q9NTGotqRuLRCFkkzimgaIIPzqhnOysfC0vb86AaR/2SIAYkhw4qYfe
	 u9OsO5rMLFgKGh8ajLxdFx+hl8dml4XKW1LznKISvr9IsRdVym9I8OeogDU7cy5bJN
	 C8aozsYBnM9o2ez8TkSAfWG+xZYoICoAgNuZbgFeKrFgcD10a30kHKy7dJ1h7wf3az
	 Cnf+4oiPbOS2J15dDrxKA1S0IzRuo+G1jrM4mqSdf4j3eE/LJxv2/lEwVUmWuKqswG
	 cWBNfmW3M6ca5GQ2KjZPhLfPxfwst9xa6dGWShhroL27OxwUFmSYBUjoALUDd3/ZP6
	 Tkm/xWnDrxOyQ==
Date: Thu, 4 Jan 2024 17:22:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	devicetree@vger.kernel.org, robh+dt@kernel.org,
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: Query on audio-graph-card DT binding
Message-ID: <42c0c4fa-585e-4194-bbe4-e0377c87e632@sirena.org.uk>
References: <dfe363ef-4638-4b5e-8308-73e286ac0b50@nvidia.com>
 <ZZblyhfzQjzyoUc_@orome.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qsCYEYAbIVCe8tbR"
Content-Disposition: inline
In-Reply-To: <ZZblyhfzQjzyoUc_@orome.fritz.box>
X-Cookie: Q:	Are we not men?
Message-ID-Hash: OCPBDJBGKMXPVS2BRI2ASWNF6IYG2JJT
X-Message-ID-Hash: OCPBDJBGKMXPVS2BRI2ASWNF6IYG2JJT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OCPBDJBGKMXPVS2BRI2ASWNF6IYG2JJT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--qsCYEYAbIVCe8tbR
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 04, 2024 at 06:07:22PM +0100, Thierry Reding wrote:
> On Tue, Dec 26, 2023 at 09:58:02PM +0530, Sameer Pujar wrote:

> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /-----> codec1 endpoint
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /
> > CPU endpoint \
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \-----> codec2 endpoint

> Can you describe the use-case? Is there a need to switch between codec1
> and codec2 endpoints or do they receive the same data in parallel all
> the time?

> Could this perhaps be described by adding multiple CPU ports with one
> endpoint each?

Don't know about the specific use case that Sameer is looking at but to
me this looks like a surround sound setup where multiple stereo (or
mono) DACs are wired in parallel, either with a TDM setup or with
multiple data lines.  There's multiple CODECs all taking input from a
single host controller.

--qsCYEYAbIVCe8tbR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWW6UYACgkQJNaLcl1U
h9BvSAf/fR1ssQ4GinXH1HRespMqPWRE4tXIuKIpgLNB3VLe4jio3IDHRoDmJrZ9
L+farGwkmen3ti02C692QzdHaRDKsPeCDjzWBEihR685UkOO5u2053eiwTwwhjRW
KtBfH7pgKiZbbQnfGwOfgzztNtW+btyQ3XeLA1sXs0y0TIzi0VgGiAihohMJ7x/5
oU2zKrqeLn7haSIzKiwU44AMssq6Nn4DVMjgLynTdlbb4xGyKFzyeI3tCgl16hTJ
bwEWxcDmHxSL9yIirvUZTM4JzuY7CuNy7JTW680vWAZx1WrqzpTXAY0jiVje7akJ
N93tflyKEj/dKxpUJIZjCNZaIHIJgA==
=cAAN
-----END PGP SIGNATURE-----

--qsCYEYAbIVCe8tbR--
