Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5045E87374B
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 14:04:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82A443E8;
	Wed,  6 Mar 2024 14:04:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82A443E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709730294;
	bh=tPKM3fbs+N1jnkgIdgrhQAzhyAXdLqv6da+7MERgVTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HD9K5UfZonkztZFYqKqrIOEbBlnjmbZFLZHHJSIWhUcvfSehzaQsgn44bF1u8izYq
	 Gbql5abv3LnqGWMi3vG1/9mW9mLgDRTWXH3Cfvw4EH7NlQkcd7S8PvuqdJBuadB+3E
	 S5GE7+EtYEFZGio1ZKBYgSLc5ZSBscpJdKe+4zQE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67165F80579; Wed,  6 Mar 2024 14:04:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFE51F805A0;
	Wed,  6 Mar 2024 14:04:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37424F8024E; Wed,  6 Mar 2024 14:04:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97877F8014B
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 14:04:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97877F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GKjXhq/t
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4A942CE1F0E;
	Wed,  6 Mar 2024 13:04:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E6AC433F1;
	Wed,  6 Mar 2024 13:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709730241;
	bh=tPKM3fbs+N1jnkgIdgrhQAzhyAXdLqv6da+7MERgVTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GKjXhq/tE2qihb2Xd55900MGCJsOgaStfVo1TBt6kSoLZyEMtASEzK/j+IRRnIcA/
	 pd5e0nVj7F6/qFxTKgzw97tJ241G/DJ/GKPJnyc6SCqF2Ee9hKFonrqXjZj45ZIOQR
	 Y/8gTQ+AVn1AV+YYber7m5sKyD8zMfuyg3BNhvexYyLHJN7x+fRvjmIQ/9umBsghM6
	 CdkkxebIsOk7/b2HdUt2dGBphKHaHGnhQmkHqzTHDriqvcgejzbKC43NBGJ7rAv1AS
	 S6ZBEOxqTJgkEIRCIJnM3usfP8H14XBzv6FFVnDcBIcGmW9U0cAQR53uudWfx9Hyza
	 ihhRsjtCprb3g==
Date: Wed, 6 Mar 2024 13:03:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Shalini Manjunatha <quic_c_shalma@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Raghu Bankapur <quic_rbankapu@quicinc.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Jha <quic_kkishorj@quicinc.com>
Subject: Re: [PATCH V0 0/1] ASoC: soc-compress: Fix and add missing DPCM
 locking
Message-ID: <fae7335b-bb58-400a-9b72-936b0dcc2fc2@sirena.org.uk>
References: <cover.1709720380.git.quic_c_shalma@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1AkDkuUU23ZBtHTV"
Content-Disposition: inline
In-Reply-To: <cover.1709720380.git.quic_c_shalma@quicinc.com>
X-Cookie: Have at you!
Message-ID-Hash: SAPJMHH752DKVUTRTW6JTZDZTNTBDSPJ
X-Message-ID-Hash: SAPJMHH752DKVUTRTW6JTZDZTNTBDSPJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SAPJMHH752DKVUTRTW6JTZDZTNTBDSPJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--1AkDkuUU23ZBtHTV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2024 at 04:23:19PM +0530, Shalini Manjunatha wrote:
> We find mising DPCM locking inside soc_compr_set_params_fe()
> before calling dpcm_be_dai_hw_params() and dpcm_be_dai_prepare()
> which cause lockdep assert for DPCM lock not held in
> __soc_pcm_hw_params() and __soc_pcm_prepare() in above flow
> when ever we play compress offload audio playback use case.
>=20
> To fix this issue added DPCM lock and unlock in both places of
> above code flow mentioned.

Please don't send cover letters for single patches, if there is anything
that needs saying put it in the changelog of the patch or after the ---
if it's administrative stuff.  This reduces mail volume and ensures that=20
any important information is recorded in the changelog rather than being
lost.=20

--1AkDkuUU23ZBtHTV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXoabsACgkQJNaLcl1U
h9DCbQf+J6u1XRg5N8iHTV4CowIy+CabymZa6H2WDtsc0EK4gge5qVbNtxPiTmkP
5qDrXNXWtYDGDHZlBGGWn/YZJYjZkILCPdqsGGCi5PXsRns8EDarm0P1/fMh/qgt
dLe+eSA760Fhewm3n5ugW7aK2Y7/Jk1dVV2x8tJahVvMMslDNYqk7+xQJ6kLmE3e
VB9Eigc2AIw2gu46jg+iOKHh0eMylSjuKi61TDgWP5LN5fFY/y5TirX32tZR4w1N
NRnWQca7G2bB0zTP9JVLNSIYbELd7oKkui+nQtTFqovCPFUNv8wd5SjF/te9hCEo
KsnfC/NSgySY7g9XIKyAfwnB7mdkaA==
=6SHa
-----END PGP SIGNATURE-----

--1AkDkuUU23ZBtHTV--
