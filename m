Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 186569040F0
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2024 18:12:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9818CA4A;
	Tue, 11 Jun 2024 18:12:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9818CA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718122377;
	bh=aJeW2N3kwCz5oB5MHCriHIh05QZu77JtFLwwq8ApGUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A1RN3jxAMTFNiByL5LYgAghdGBlOt7gcKwA7mRFNqwMbiPc78xMKJd3siA07myufR
	 lQZ6W+HS2gPkOhgYCMJzgqxQSHUiXmUgFkyavJgUNPagjwg+vLhi+uu4O7RLXC3xxm
	 z7OZKrhfP50mJqgaRlFH0woajyaMshQb9sAHocNc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D9DBF805BE; Tue, 11 Jun 2024 18:12:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0ED0F805B3;
	Tue, 11 Jun 2024 18:12:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8222F8057A; Tue, 11 Jun 2024 18:12:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9AF33F800D0
	for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2024 18:12:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AF33F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=UVK+Wppn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92DF160CBA;
	Tue, 11 Jun 2024 16:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30FCC2BD10;
	Tue, 11 Jun 2024 16:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718122328;
	bh=aJeW2N3kwCz5oB5MHCriHIh05QZu77JtFLwwq8ApGUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UVK+Wppnos2Eafl97QCMr2wdlm/2KelWydzXxwnCLqUxDoPSLbKXLE271XLZjkrte
	 5djNSV+lx9sZkprvFxfdo5CL4kbyEdw9lmWaT1MKEziFI+8thhCPBu70hZ9ycDCuN1
	 xL73+msP+cFrzPDaCvgvLVkCRnHAwlFX49GItoKAFqRqTEcq+zhT/n3nPzFVoDg6to
	 Lg0/sByxIkG7WYQ3rdUHWohXZkumAp0iLs1bRF4EoDz61s6oNt/E36UswwbaNXZj0k
	 /R0hYfTkrNewOYYdmhF2R4atxDfHFQ9IyJsxH7QWTOzosghxwRZgMyaR9doznST0Lo
	 fi3kguYpwwPIA==
Date: Tue, 11 Jun 2024 17:12:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: cs35l56: Disconnect ASP1 TX sources when ASP1 DAI
 is hooked up
Message-ID: <Zmh3VmRfGEU6pGps@finisterre.sirena.org.uk>
References: <20240611145746.1454663-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4hy4b+bAfizSELLR"
Content-Disposition: inline
In-Reply-To: <20240611145746.1454663-1-rf@opensource.cirrus.com>
X-Cookie: Your love life will be... interesting.
Message-ID-Hash: IJ2VIA3F277RO6BEBNFQBGYEMCQ6E5GV
X-Message-ID-Hash: IJ2VIA3F277RO6BEBNFQBGYEMCQ6E5GV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IJ2VIA3F277RO6BEBNFQBGYEMCQ6E5GV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--4hy4b+bAfizSELLR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 03:57:46PM +0100, Richard Fitzgerald wrote:
> If the ASP1 DAI is hooked up by the machine driver the ASP TX mixer
> sources should be initialized to disconnected.
>=20
> The silicon default is for the mixer source registers to default to
> a collection of monitoring sources. The problem with this is that it
> causes the DAPM graph to initialize with the capture path connected
> to a valid source widget, even though nothing setup a path. When the
> ASP DAI is connected as a codec-to-codec link this will cause the other
> codec to power-up even though nothing is using it.
>=20
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Fixes: dfd2ffb37399 ("ASoC: cs35l56: Prevent overwriting firmware ASP con=
fig")

This doesn't seem particularly different to any other unhelpful chip
default, I'm not sure why it'd be so urgent that we'd hard code a
default?  There were some other devices with things like bypass routes
set up.  The capture path getting spuriously triggered feels like
something that should just be sorted in general (TBH I thought that
worked OK but it's been quite some time since I looked properly).

--4hy4b+bAfizSELLR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZod1UACgkQJNaLcl1U
h9CBAQf+OhZdPDxTYMLChOAhYTNb0+Q25t451LvA/upiJjwv4Wz/TNIntO6kFK2c
8ntuUtQlz/SSqBwrYDTbQbPT8f37cKiXEN/VggO6LIFbLvoaNsuxMUVrs557l+u9
Kh2NltpGwT0tsIF1Se0uTxaHCRbW25jW73sGjjUVnkdesGGGA03uejObLNxMoSxb
GBBdSy5PbML9buuiqz7HeP8e8wyi+/Qg/M+oD0loP+3AJShbYgp3/92f1gDQpPJk
9GWYAz8FdIsCyLY5GwOrcViV6l6DX/mFbH2+sF386uz/XsT7psQurHhTG4oKPSlB
ioBDd73aX0JCg0csiL83a9YcA36IXQ==
=6QSb
-----END PGP SIGNATURE-----

--4hy4b+bAfizSELLR--
