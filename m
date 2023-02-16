Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 987D5699966
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 17:02:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C308AEF4;
	Thu, 16 Feb 2023 17:01:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C308AEF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676563321;
	bh=zn5cqo7ihCyFYu66pNpA0T87YS1Zk1ekASHfJaV9lFQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dw3sLJmdg114Nn5orIQf67rWli6GIwhtufJa9YiINZzLpWyEdNABdq48Bj5p85b/H
	 vkzSJvCym4KCoS5BnaaSSA8z5DuLnEAIIuMC5ZrDFpmYLbd0CXEGdo/4p27aTYUhpB
	 6tQkoyg9dzkAA9Pr8BiWF16hpzpeLLSqrRakxag4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E63BF80526;
	Thu, 16 Feb 2023 17:00:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82952F80527; Thu, 16 Feb 2023 17:00:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9E31F804B2
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 17:00:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9E31F804B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=skNWlZoO
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E25D8B828B5;
	Thu, 16 Feb 2023 16:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED648C4339B;
	Thu, 16 Feb 2023 16:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676563233;
	bh=zn5cqo7ihCyFYu66pNpA0T87YS1Zk1ekASHfJaV9lFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=skNWlZoOUUXh0hy+tBZaGGHPkzQBlRXFvd3ajeTtsBr9VvieB4Pdmv+sF3W75I1WW
	 efwoUZF216MVg2URY8IBDMypyQGyJHsC4CsdzlHkwB261fJA+dm7/KC0w/Lr66hyL3
	 6odrVBCFWi4Jd0PAG6hRo24i4eNiEV/mOSmBLjKIY5ZvV2Y2TTW10xWpme9Mnu579a
	 rnzyhb06wZjAAkEwNxuAKriz113isyUezmUt1jff8srxo7148y1+QHAcpRM09x6Br3
	 kWDAVePj5QETCISxrl5mU8MNmpGo1HiXRho65U1rh2Lw54ZevvuWTu+G/f5zZ1nbpF
	 n7walrUmsTm1g==
Date: Thu, 16 Feb 2023 16:00:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 14/17] dt-bindings: sound: apple,mca: Add t8112-mca
 compatible
Message-ID: <Y+5TGKoMuRr4XQ+b@sirena.org.uk>
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-14-cb5442d1c229@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zLAA02ljnSaFRQBD"
Content-Disposition: inline
In-Reply-To: <20230202-asahi-t8112-dt-v1-14-cb5442d1c229@jannau.net>
X-Cookie: Serving suggestion.
Message-ID-Hash: TQO3654FWDXTVLXIOJPTIJT7FA277ON2
X-Message-ID-Hash: TQO3654FWDXTVLXIOJPTIJT7FA277ON2
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Kettenis <kettenis@openbsd.org>,
 Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TQO3654FWDXTVLXIOJPTIJT7FA277ON2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--zLAA02ljnSaFRQBD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 12, 2023 at 04:41:24PM +0100, Janne Grunau wrote:

> This trivial dt-bindings update should be merged through the asahi-soc
> tree to ensure validation of the Apple M2 (t8112) devicetrees in this
> series.

I didn't get a response to my query about the nearness to the
merge window and the prospects of the series hitting v6.3, though
I do see that there's a new version needed for some of the other
patches.  I'm just going to go ahead and apply so it's there and
I don't need to worry about or see resends, in case the rest of
the series is going to go in it's not the end of the world if it
gets applied twice anyway so

Reviewed-by: Mark Brown <broonie@kernel.org>

--zLAA02ljnSaFRQBD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPuUxcACgkQJNaLcl1U
h9Af/Af/YMaqhnQb4Eh5+46lP4Mxb8PbrkBIC4qlIjcB+Hh/k8zv4T6lxMliCgrb
V26ONFvyzAl+q0EBaeRgwcB2htrFjzmrTmXa4QnbmfGIOriavTXNqKhfwAqqIFOs
NJhxIAqVavNLiKHkW2opVIiWRDWq8Sf/tyKwsVZB6OQym2Fj+X1Zv35s1jp2SUeb
MhzQYMIvIrLLXtIcZzBb6H7G0kOFCFbnaqTginkiQPgYawuoHaZ/kxsGlbPZA1Dr
tuWHPGnkdFtg8tnlYDn9AUSI+k5VJovf9m9bGzstnzBpH8uovKEciu6sDAkJtkww
A/goHQ6NXCEgVO+yyApSnF7Ai4X5gg==
=KvWA
-----END PGP SIGNATURE-----

--zLAA02ljnSaFRQBD--
