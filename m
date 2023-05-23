Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 308F870E4A5
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 20:27:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7008683B;
	Tue, 23 May 2023 20:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7008683B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684866456;
	bh=84usJSpGpBI3Z1x+GJuKV/qWu0n30FukNBqyQZYcTnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H2oU2YMcCaiA8l6aROnYWIQoTD1WHHjU+fYA1LuIRhUfoNM/3hAcmakc3M8sCd2Gc
	 X3uGufNOw1B2FMm1rZCg18J0y9OMyjM+fPu17YjE8biiCv5dS0lIeNQjImLUEIwm3L
	 fQPtWSVza5sk0vCFA+Eoy+p2wwCRzcL5AzXDHdpM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5963F8053D; Tue, 23 May 2023 20:26:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 861A9F8053D;
	Tue, 23 May 2023 20:26:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A74AF80542; Tue, 23 May 2023 20:26:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66083F8024E
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 20:25:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66083F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=e0rcMVWw
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DC3EA61172;
	Tue, 23 May 2023 18:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65FA3C4339B;
	Tue, 23 May 2023 18:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684866356;
	bh=84usJSpGpBI3Z1x+GJuKV/qWu0n30FukNBqyQZYcTnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e0rcMVWwbJRUDv3Um5Xnvj3WqCjt+Mr9kgb1/f+nNfZTjEeKRbKoj4GIoGWTlf8H5
	 JuAAp+iIaQ0kmMaWbvhMVI5c1hcAH7u0HJXQl9iU/8rSA69avpEnUEThrJZ1jRQAlq
	 reJMs03Xg0tBpZMYRB/66Ds2w88vFKinR1Lvp75moTFXIIc90XNwQpGU8FIjV04Fw8
	 p2HjbbVaqQJ8rr5P9C/M6otjPhuHbUStXJjwonISLMamsAZMY4bhevw6Pczvzrj1Vh
	 SZfVgi+t0nCIpiI4gGdyrm8W5hvgggGndQFAC+y2MEqoGPUKAshp8q9gXd7SOExFLn
	 HV8weKmzxe3SA==
Date: Tue, 23 May 2023 19:25:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] ASoC: dwc: move DMA init to snd_soc_dai_driver
 probe()
Message-ID: <bff15efe-2234-40dd-ba48-622148f8f869@sirena.org.uk>
References: <20230512110343.66664-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/wIEsaftd97g4Bi6"
Content-Disposition: inline
In-Reply-To: <20230512110343.66664-1-fido_max@inbox.ru>
X-Cookie: Beware of low-flying butterflies.
Message-ID-Hash: MQNFQBC46YSBIYPXWEKAFSKUDN75C3MD
X-Message-ID-Hash: MQNFQBC46YSBIYPXWEKAFSKUDN75C3MD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MQNFQBC46YSBIYPXWEKAFSKUDN75C3MD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--/wIEsaftd97g4Bi6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 12, 2023 at 02:03:42PM +0300, Maxim Kochetkov wrote:
> When using DMA mode we are facing with Oops:
> [  396.458157] Unable to handle kernel access to user memory without uaccess routines at virtual address 000000000000000c
> [  396.469374] Oops [#1]

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative (it often is
for search engines if nothing else) then it's usually better to pull out
the relevant sections.

--/wIEsaftd97g4Bi6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRtBS4ACgkQJNaLcl1U
h9BV2Af/YCikO3HWyyALlDKIAdamItXVN5sLIyRESGSHgnY0mJDLx1esF6J8kwqt
cgTLZ8amlgBl5WZ9u2LDNU+b5ppISah4xbhyS8IoOYAFIJVEngfxM/VHDNQGAyL7
2dYWg5D45U1Lb55YAUeEWfmLrXX0nI7piQZv1aeZAdvy81ZBaBk0bF/IgPNWr0uz
sKa+6a3+mRPNjU5JDMlAndudNiA8J72a7yXFO3aiLvJoWhU6EIRderm5Em/R8cmi
ChAqNaMW4B3w994TlP5nzcwvrwGxDdW7bs26xpIVCzC1yAT4yrGIrrSx/dN8+KCX
Lx37403VVBojsk4HIhCgyaKDMM9YzQ==
=mo+1
-----END PGP SIGNATURE-----

--/wIEsaftd97g4Bi6--
