Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1416B948263
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 21:38:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 291AF5A13;
	Mon,  5 Aug 2024 21:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 291AF5A13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722886711;
	bh=lgchXb1bYk3WqJn/hE8TGf4cBjrsub46cUbjwhHDqF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NM3pAstDlVKrIqnASyCxTQ0DIwrBPMl/7gqgDOfXILSpedzTb06YNo/bn25AO6RoU
	 /Jek9s76GhCoNTyR0TjmwKHVcBJJvCVLRd1w9nzNZKnygnfR0RoyooOvjrq1DW2plr
	 HLYPorjYYr3VrayeZ7e264A+QQc+WuPACSZaqMVQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55629F8023A; Mon,  5 Aug 2024 21:37:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19592F8057A;
	Mon,  5 Aug 2024 21:37:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF0FDF802DB; Mon,  5 Aug 2024 21:37:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57643F800E3
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 21:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57643F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iQUiHNBL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 53D64CE0B66;
	Mon,  5 Aug 2024 19:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FCD3C32782;
	Mon,  5 Aug 2024 19:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722886664;
	bh=lgchXb1bYk3WqJn/hE8TGf4cBjrsub46cUbjwhHDqF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iQUiHNBLxlcj9+R+gylDfzBrxlaSiK3D86x/c3B/28wl6fTNNsV3jQUB7SKrCj3ap
	 +Mlx5J4ee3h5+DwaADPy3eAWp3Sjalo8yI7FC3nH3niYXr/RMjJyfxdgGCQLhWW8H3
	 pIJFBvK2EFJoBo/qAChdP7OP0QMtTlhGmLNjTxmHK4W66yut/Vv6ruNkRfhmgkpNOO
	 xlfJxlzg5f4oENlghLDWAz40c2u7v+g2G1TAPxzSSNjK0JKnvluQGKkIiz2JiPE82r
	 mKrF4D3zPnWc2+8sMwRv1K3xejPvXtub+7M9iXf2no4Ck8J9sGmTbhbroHod9hCeow
	 qiPVffrCVmdkg==
Date: Mon, 5 Aug 2024 20:37:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH 000/113] ALSA: add snd_pcm_is_playback/capture() macro
Message-ID: <46b37ef3-047c-4b1b-a79b-37187a46754a@sirena.org.uk>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
 <d6e47194-a708-4dfe-96c8-aba9391e4496@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZsODt8GP60oMXE9i"
Content-Disposition: inline
In-Reply-To: <d6e47194-a708-4dfe-96c8-aba9391e4496@perex.cz>
X-Cookie: Goodbye, cool world.
Message-ID-Hash: BLII6E3VBUYNT374JYR2LQYGTDST64RI
X-Message-ID-Hash: BLII6E3VBUYNT374JYR2LQYGTDST64RI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BLII6E3VBUYNT374JYR2LQYGTDST64RI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--ZsODt8GP60oMXE9i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2024 at 04:04:39PM +0200, Jaroslav Kysela wrote:
> On 05. 08. 24 2:33, Kuninori Morimoto wrote:

> > Many drivers are using below code to know the Sound direction.

> > 	if (direction =3D=3D SNDRV_PCM_STREAM_PLAYBACK)

> > This patch-set add snd_pcm_is_playback/capture() macro to handle it.

> NAK from my side (overdesign, no improved readability). The defines
> (SNDRV_PCM_STREAM_*) are enough to check the stream type value correctly.

I have to say I do remember this being a little bit of a confusing idiom
when I first stated looking at ALSA stuff, especially for capture only
cases. =20

--ZsODt8GP60oMXE9i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmaxKgMACgkQJNaLcl1U
h9CziQf/YCOXh24b4OyjkhMmIzzP6QsbfEeLXSz4lHbdfho7lUcp/8ZcPcWTccjA
8ME1VD4m03IG2W/Mo0zY056z4EMAeFRqgoUD+eHnueqxOIyHSkE/oDwmrA95LjJ7
N7vfqUv1CwQql5bCO+4AvIRtL9w8QJM2PAfHlNc9lm0VG5/GgTbGaGDGEsYt9YFy
PNBqA4bgGcynIHDIM4AB91uHUF2g6qPeHJO3QuuKflLmQDjrG96y2ni0Lz2wvuJP
GwRcz2V90XQ9a9cTGG4pOAHE/0NR+fsM286wdszwfUCz++HA1viMBLJQs2wNDlSr
gO8cdIikCG2sjXIqnS+ib0EteNuVfg==
=Jlkt
-----END PGP SIGNATURE-----

--ZsODt8GP60oMXE9i--
