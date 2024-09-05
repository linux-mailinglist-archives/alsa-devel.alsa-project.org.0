Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B680796DB85
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Sep 2024 16:18:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4478E80;
	Thu,  5 Sep 2024 16:17:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4478E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725545886;
	bh=VqQy8KfKmVgPTGbG8DNpb8zbYk8Nc0D2lgFnKi69kn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V5nzwLyknOayfMI2KShbNJBGeDoJOVOw9YfoMA8vFzye0c8GGaQubs0mKnNeU8Zkt
	 GF+LQBK4UhFf+Z3rKEgoohlf8lX+eIVWU9PJ93sANzfKYydYtLQyeHFFgKY0K8XUrl
	 stfjGKkEd2kcGjZrr/QlmCW3FdQwfitGIzzqWkCw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CCCEF805BD; Thu,  5 Sep 2024 16:17:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F827F805AE;
	Thu,  5 Sep 2024 16:17:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EE85F8016C; Thu,  5 Sep 2024 16:17:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F9D5F80027
	for <alsa-devel@alsa-project.org>; Thu,  5 Sep 2024 16:17:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F9D5F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=andDZzaP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4B402A44C64;
	Thu,  5 Sep 2024 14:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A541AC4CEC3;
	Thu,  5 Sep 2024 14:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725545857;
	bh=VqQy8KfKmVgPTGbG8DNpb8zbYk8Nc0D2lgFnKi69kn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=andDZzaPhYZMZgV6Ut5i5Ns/LKGNLi/g7c0Ojq5UbJczxdxaq9euO+qT/qKkPg9PI
	 5Q7JN9ERfhEAwiEnTLxOYYdapOFegv4+6hOlgMYYNE03nYfIWP4zyvVB/SsygAwgoh
	 OyhO7Tp72ejapkrrhVTspxSs4mjaIqVlNxgNWE6FNvOPCq7L1bQlyQiqzTLBXURZia
	 5tgem0TV6DR1XucnCmJK4KEptn+HnrM21FHLVbxpdRSKvpnUZ6IfnMB/d+1H7NBhGF
	 KXxEwPniE54XJKJcpbjR3RUCe+xQQ0zp2uoWz8gLmR5ToYn3C+ORfLnAnh3xak1pU5
	 /uJJyQFjNk67Q==
Date: Thu, 5 Sep 2024 15:17:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 00/13] ALSA: update sample rate definitions
Message-ID: <81e3d628-cfca-43b0-9af6-de2a3c606a39@sirena.org.uk>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uuNJXLNXUva0AK+X"
Content-Disposition: inline
In-Reply-To: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
X-Cookie: The horror... the horror!
Message-ID-Hash: LKK76FC7XXI2QDZFKN3M2FN5Y5IZNHVR
X-Message-ID-Hash: LKK76FC7XXI2QDZFKN3M2FN5Y5IZNHVR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LKK76FC7XXI2QDZFKN3M2FN5Y5IZNHVR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--uuNJXLNXUva0AK+X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 05, 2024 at 04:12:51PM +0200, Jerome Brunet wrote:
> This patchset adds rate definitions for 12kHz, 24kHz and 128kHz.
>=20
> It is follow-up on the series/discussion [0] about adding 128kHz for
> spdif/eARC support. The outcome was to add 12kHz and 24kHz as well and
> clean up the drivers that no longer require custom rules to allow these
> rates.

Acked-by: Mark Brown <broonie@kernel.org>

--uuNJXLNXUva0AK+X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbZvXkACgkQJNaLcl1U
h9Dcdgf/ZQoGyidIWQUnoePm2VX00vw06P9W9aOo2sqjGlu4flrG6fH5N+tv92vc
hX0ctx0G6C1f4iafWkIPCjHVecaWETi2yb/hpKpSPTy0nFrEBN06Zl02mDSa3jfs
ngxTVhHYUMoS2ZMRR9dAy3XgnVgZS9Lccvvq52mEYaxh1G+hzi3HEDgM5oWZPEaI
CcqzVwxRaRokIAZO3prOKdX4rMXG+Nz7kSFb/Hx9/K9H4jYwgwFyKJ2TV3H7fVYM
767vMvyA1T3nKRZ1yiZfYWYYIf2rs0h7iQxgjH4Gzb9575MFPOiqAk4/pIYcvVKj
hf1swcI9kcYqQrgoLzqE82HPkErNaQ==
=WnP9
-----END PGP SIGNATURE-----

--uuNJXLNXUva0AK+X--
