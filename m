Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EE178790F
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Aug 2023 22:06:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7011384A;
	Thu, 24 Aug 2023 22:05:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7011384A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692907561;
	bh=uneaeEIfe52K8fhY4nb4K1HqCi+MybMD+IC/Fil8QHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FWJvvUcrOudvVpYDsflsHSqOc54IqKNx5P3yaZtQ8W9S3VdzqLcRZEiCzGlMP6neY
	 soYcrtXTpwx94p1oInbtrWjAymONjHefHBneOTHTv6fJtNr7ER/q/RRzNC/SuiYvej
	 X9fRfdswcr2U9WFm+QyK2T8FfbWLnvg/qLsAjU7I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE03EF8025F; Thu, 24 Aug 2023 22:05:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A12CF800F5;
	Thu, 24 Aug 2023 22:05:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08D8FF80158; Thu, 24 Aug 2023 22:05:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5E63EF800AE
	for <alsa-devel@alsa-project.org>; Thu, 24 Aug 2023 22:05:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E63EF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QE0AktSJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DBECD662EF;
	Thu, 24 Aug 2023 20:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6581CC433C7;
	Thu, 24 Aug 2023 20:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692907501;
	bh=uneaeEIfe52K8fhY4nb4K1HqCi+MybMD+IC/Fil8QHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QE0AktSJFv6ACmLwjhoj2pG7ZpevtM+Dxy4RJJziAPjWzPQV4+WhMApRwlatT8GBp
	 g3+EQYcl8romgTC+NfCGGVTVH4DKhOx0R1IVK8TPGMNWdVMMmELZcCMXECPz3u+INM
	 +DNa2czaA0rAo5A1GmxWvtG5JnLsJCh7eDoQtu9avreIjHHerP1knL5bC3KrfkB8V8
	 Ka8WENVLoh5yP2BMAMiR8NInzgq+1G93adGeVdcerrXOZUg6Lmf/5N3hTYekfouGFV
	 7rrU3yUi3SWA5dI0Nr7ip9xFkRZG4pq1Ryp7VEsKsAZPOy6Px0W69tsqjo0PP0VqR2
	 Iw1W9BgQjlCtw==
Date: Thu, 24 Aug 2023 21:04:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH] ASoC: soc-core.c: Do not error if a DAI link component
 is not found
Message-ID: <ZOe36EyxNQuz08qt@finisterre.sirena.org.uk>
References: <20230824193837.369761-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ItHhBaPHFpS47p4h"
Content-Disposition: inline
In-Reply-To: <20230824193837.369761-1-cristian.ciocaltea@collabora.com>
X-Cookie: Give him an evasive answer.
Message-ID-Hash: Q2UJZ7QHW3OZWWLQBEQMZ5FTNM5IG2YY
X-Message-ID-Hash: Q2UJZ7QHW3OZWWLQBEQMZ5FTNM5IG2YY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q2UJZ7QHW3OZWWLQBEQMZ5FTNM5IG2YY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ItHhBaPHFpS47p4h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 24, 2023 at 10:38:37PM +0300, Cristian Ciocaltea wrote:
> A recent cleanup of soc_dai_link_sanity_check() is responsible for
> generating lots of confusing errors before returning -EPROBE_DEFER:
>=20
>   acp5x_mach acp5x_mach.0: ASoC: Component acp5x_i2s_dma.0 not found for =
link acp5x-8821-play
>   [...]
>   acp5x_mach acp5x_mach.0: ASoC: Component spi-VLV1776:00 not found for l=
ink acp5x-CS35L41-Stereo
>   [...]
>   acp5x_mach acp5x_mach.0: ASoC: Component spi-VLV1776:01 not found for l=
ink acp5x-CS35L41-Stereo
>=20
> Switch back to the initial behaviour of logging those messages on
> KERN_DEBUG level instead of KERN_ERR.
>=20
> While at it, use the correct form of the verb in 'component_not_find'
> label.

Don't include random extra stuff in patches unless there is substantial
overlap, send one change per patch.

--ItHhBaPHFpS47p4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTnt+cACgkQJNaLcl1U
h9DpeQf/fLcMo5TgYtpEMm6QZe8+SsXOWe83/GL7qiWA20/UaeCiVe8f1HRgxisw
wsqs106dScSNu7HawAwXYukM7lX0mGuXrbZBYVzh9zsIMnE4LXvr8urhKR+QXGmg
/ZUzdgHwQ/dgz113XQJml0kbsh0aJC1RR+4tObciFjmNiHpMgt3KT1qlaceM8m9o
DRQk8KtCZnOsY3UNGwA+KQ4pPxbdsy2Sd/r7V/KBHetkJXzQazF8FCdu5dcx33oD
uorFZW9byRlZkXVfcvdEwEAzHL139W/rAt430zVst3Vu1Ld7+ROn3ct1ezwlMuGh
3bqWD7yAleCg8KX4b8pOrO9Gx+CPWg==
=5OX0
-----END PGP SIGNATURE-----

--ItHhBaPHFpS47p4h--
