Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 581DA748DAE
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 21:23:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E203741;
	Wed,  5 Jul 2023 21:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E203741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688585000;
	bh=mVNP1XHCm1ujuAN+24CqZIRE255cx//Gzw9yow8paAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nk4nTWDpHxUviXLRgblr+1H0WvuaY7qpxSc5QvsOCqsaXon+4c8rXk5AlSK9IWglm
	 gOjFpao1tiMtORyCoUg/bkp0QZGFYfOs7g68PrZV3jKh6JaXzM6qxxGtCSEHtSVtcv
	 Svlo0GybN0Zu1PclCLbg9HCQ9AVO5Y8DPesFN5jM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02645F80153; Wed,  5 Jul 2023 21:22:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 884F0F80124;
	Wed,  5 Jul 2023 21:22:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 797EDF80125; Wed,  5 Jul 2023 21:22:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7620AF80100
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 21:22:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7620AF80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KxqQIxVx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 81FF8616C6;
	Wed,  5 Jul 2023 19:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3334C433C7;
	Wed,  5 Jul 2023 19:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688584924;
	bh=mVNP1XHCm1ujuAN+24CqZIRE255cx//Gzw9yow8paAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KxqQIxVxA794QTmGBDFpwJkxwwwan39x/70eMW1npZ0h2cisyfZ8X7Jz+DcHF9B2y
	 U7V00JBcbqMfm4TrexatJAwQBDeWQJ2vOlaHMxoJbRSZX/OEKo2i0vl74xmTcrmt6n
	 5eKx7otbFa3APKxzSsL1G8AGK2tHnTDR9NtYAGmQnE83gHSmFD1E/HqwbmH8ONPtdv
	 yAr2ueE4uwlE5qbXPGvdy64KqkAYkCR2WWpw5sClwFmMwrqei4WHGoUGtmWs3BP2rY
	 tOi5m4ej/tKDNT3VL9RnRQdpFJzRcQKLKCWmMA/IZY50orF/VPWtEEhjLQTvlRPJUE
	 bi+B8oPuYi/zA==
Date: Wed, 5 Jul 2023 20:21:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	peter.ujfalusi@gmail.com, jarkko.nikula@bitmer.com,
	dmitry.torokhov@gmail.com, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 2/3] ASoC: tlv320aic3x: use BCLK instead of MCLK if not
 in master mode
Message-ID: <15d3fc6e-d294-4968-bc7d-66307efc92db@sirena.org.uk>
References: <20230705190324.355282-1-andreas@kemnade.info>
 <20230705190324.355282-3-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yoex5Ky+2rrSrz/8"
Content-Disposition: inline
In-Reply-To: <20230705190324.355282-3-andreas@kemnade.info>
X-Cookie: Don't feed the bats tonight.
Message-ID-Hash: T2SQWEFUNLAN24L4QT6ORPX7HNSBFQ6N
X-Message-ID-Hash: T2SQWEFUNLAN24L4QT6ORPX7HNSBFQ6N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T2SQWEFUNLAN24L4QT6ORPX7HNSBFQ6N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--yoex5Ky+2rrSrz/8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 05, 2023 at 09:03:23PM +0200, Andreas Kemnade wrote:

> +	/* probably no mclk if not master, so rely on bitclk */
> +	if (!aic3x->master)
> +		clk_id = 2;
> +

This is fairly clearly a massive hack, we're just silently ignoring the
clock we were asked to configure and choosing another one which is
likely at a different rate to that we were expecting and sadly the
driver didn't provide an automatic mode due to how old it is.  We also
appear to try to use the configured clock rate during PLL setup which
still happens in hw_params() even with this change which is a bit of a
concern here.  Are you sure hw_params ends up doing the right thing, and
that there are no other systems that get broken by this (perhaps ones
sending a lower BCLK for example)?

It would be nicer to set the clock via the DT bindings, ideally with the
clock bindings...

--yoex5Ky+2rrSrz/8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSlwtUACgkQJNaLcl1U
h9Bt5ggAggsV+iF6iC39kukkwtxxKCtM675w6JEhW+9ET7xYGX4FrhRZTvq/mQ64
MhVd1VHY0bsPA/+vS7GtU470TRnBKYhORwVBIFFQHABfoM99rsT027jDG3gxH1gQ
Br26OAWMLgKALJ84g7HkXegZLmdtyPjcmceHoiVH8eJPuXkZJKvJ3aJIXoAtUVFF
Wfj8y/b2NoisYIRIkE8frezt4Rxtje7GJt0N2IwOcg0rcLZoNq3H7x8sgI6n+uL0
7v3ynYxxwPjFEuJ/n8w41GTidvaCZhurxk++g1DywgOcSiKcrr+ciKLYGDQfcZ/X
DMFBjIkkpCxggopwmDRMcpec92yj2g==
=sQ1/
-----END PGP SIGNATURE-----

--yoex5Ky+2rrSrz/8--
