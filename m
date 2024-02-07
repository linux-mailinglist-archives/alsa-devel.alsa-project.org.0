Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B0184CEDC
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 17:27:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D74184D;
	Wed,  7 Feb 2024 17:27:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D74184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707323257;
	bh=PowRBFjz75WWYEtFZnydwXqExpiqvShTdLKPfWCIPg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mStg0BNEOSqGyXHkREwEN4MWdgPNNDVoS2P+i551zF5GRNHBqR4BNZ5K2p5p6P+Wj
	 Lm/kOHeZ/XMEWffXGykDgt+TAAz5VPimW6eEFjk1LRhWxlQRwSWL0uFNDZFA8L9mxz
	 Zdal1A1gxtoIVLRQFGGGjn/hbM8Yf6kPPg0D2aDc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2EC8F805AD; Wed,  7 Feb 2024 17:27:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0F8DF8056F;
	Wed,  7 Feb 2024 17:27:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37A0CF801EB; Wed,  7 Feb 2024 17:27:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C81FAF800EE
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 17:26:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C81FAF800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tV/1//8g
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 21083CE1A08;
	Wed,  7 Feb 2024 16:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DECBFC433F1;
	Wed,  7 Feb 2024 16:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707323212;
	bh=PowRBFjz75WWYEtFZnydwXqExpiqvShTdLKPfWCIPg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tV/1//8gmuYg8UQWVRYRPGpWBRe7tk8hpqX4Fa+hCjQTh5jOhH9qCqY2+w/SbpPnD
	 OtwhsPh/2f/eXCURP++4uL52+aLyCtoZGc9nrGdtLDpx0gIiUlxYVdD8FzIZeyIdEF
	 8JXAK0CS38f4Bsv+SUWIIcdKeNTNp+EniAbRPvVN6qdrGEpJYZdSy1VH3lU+5PkhNa
	 U3C7vH3eqFU7cSmLVWPS70PQnUZGdO1PXTiUwW1qOqrCMhwWG35BQ8/w65/aWTGuUV
	 opE5xg02jBDPibX3mNGIEQPctLXuER6gxILCfsVoTBA+4UKpX7S1OkOg/e4xLtCEMG
	 PMksVQD0be53Q==
Date: Wed, 7 Feb 2024 16:26:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs35l56: Fix deadlock in ASP1 mixer register
 initialization
Message-ID: <ZcOvREgHBiQVuB9n@finisterre.sirena.org.uk>
References: <20240207161602.1030342-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EMCHHW87nQ+T4IA8"
Content-Disposition: inline
In-Reply-To: <20240207161602.1030342-1-rf@opensource.cirrus.com>
X-Cookie: You might have mail.
Message-ID-Hash: B4V6REKT3N6FGC22OEFZ5F7433UD737J
X-Message-ID-Hash: B4V6REKT3N6FGC22OEFZ5F7433UD737J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B4V6REKT3N6FGC22OEFZ5F7433UD737J/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--EMCHHW87nQ+T4IA8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 07, 2024 at 04:16:02PM +0000, Richard Fitzgerald wrote:

> +	if (!cs35l56->asp1_mixer_widgets_initialized) {
> +		ret = cs35l56_sync_asp1_mixer_widgets_with_firmware(cs35l56);
> +		if (ret)
> +			return ret;
> +	}

Might it make sense to factor the check for init into the function since
it looks like all the callers do it and I'd expect that'd be the case
for any new ones?

--EMCHHW87nQ+T4IA8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXDr0MACgkQJNaLcl1U
h9DaLAgAhU2r1USCPLg8AOzumIzQ20m/PAOaACMu81xCBh4JH5D7EHv+uNOBql0p
/wxF88FtoX/xe5ZsN9JzyjApP9Y1dSSsBUgRbTqge/5ixuZHKgzuDDbqwt+fDSky
dODR1k+1Yw85DtKlAmk2aA0bbMV0QpjQ+iuRt4nauR3IHF/p9kSTPzqaf33eiBJL
kO3rT10QH8IQWtzKwnltiTnKMlBrnsgzlzyJ/oLfMyN26g5yWCdaTWoY/LCxMmmL
dfWnPVXJ7+Cpq+xAi2mhDX78Fb/X+uGK9KeE9bIKwZITWGuc5z9ITkkr20fruvCQ
e8meSxc2yddRLmf5q8DFlPjU46T0DQ==
=j0DP
-----END PGP SIGNATURE-----

--EMCHHW87nQ+T4IA8--
