Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B519520F5
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2024 19:20:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 597162353;
	Wed, 14 Aug 2024 19:20:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 597162353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723656036;
	bh=MRuKsfYE029aDUzFxAJ1nRusLJGC4npUqxNCC0PetL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vPsG3/bKMgm4cL64nlQjJgG/ytAvoT3YU+QHz6FxhyQeeTfjdJmI2GYSUPLGhKIht
	 ZCJ11/wOxvSnvzHzvtaI4gDdMzeZr3n/Ts9CQOJA40fRfLkHK35iQRw0Uf/fXV1lYW
	 FA143Y0UoaOhgPXdqVqkOlUgXX7Jv5/sZANWrBTo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 761E9F8016E; Wed, 14 Aug 2024 19:20:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D407FF8016E;
	Wed, 14 Aug 2024 19:20:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36E8DF80423; Wed, 14 Aug 2024 19:20:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D538F800B0
	for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2024 19:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D538F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KV1z4Ghk
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B5D3ACE1A2F;
	Wed, 14 Aug 2024 17:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F04A2C116B1;
	Wed, 14 Aug 2024 17:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723655995;
	bh=MRuKsfYE029aDUzFxAJ1nRusLJGC4npUqxNCC0PetL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KV1z4Ghk9Ln2hSxNnIxOWuByLuGQBKsGi5AkmuPPSblV5jMUsWL2vCCJ2/1ZdkJ9M
	 BwSM/kEHon5F70j5qu9Dd1wfUl980Qi4iucP63jy3toooqhYPxubPVMxqjMUf8865z
	 7VnfIotxRsLUfprzp3Q0ZiBngJ3vjVlpLR7r9YH34XEEypXwWxZqr0uxYpjPfJkaCr
	 0uelh8enWI06rbMCiS0LGLFdkClGxeK/ezgE2qMIIDvwR/2y0re7MqsE/9PDLCvwiY
	 FMxjNx2FZyEijLakrRH4KffArvx/HWHyNatt4SPHce5vkNgo7KPye2xQVMyl6toPj9
	 I3xae9euQAPNA==
Date: Wed, 14 Aug 2024 18:19:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [PATCH] ASoC: soc-pcm: remove
 snd_soc_dpcm_stream_lock_irqsave_nested()
Message-ID: <717aa5e4-a857-4877-af8a-a336409d76c2@sirena.org.uk>
References: <874j87ll7k.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3itBwtoSQzGNTh6y"
Content-Disposition: inline
In-Reply-To: <874j87ll7k.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Truth can wait
Message-ID-Hash: BUQRQURSAMCECITTWMSVMLLZAQO4FHUX
X-Message-ID-Hash: BUQRQURSAMCECITTWMSVMLLZAQO4FHUX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BUQRQURSAMCECITTWMSVMLLZAQO4FHUX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3itBwtoSQzGNTh6y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 30, 2024 at 01:31:11AM +0000, Kuninori Morimoto wrote:
> soc-pcm.c has snd_soc_dpcm_stream_lock_irqsave_nested() /
> snd_soc_dpcm_stream_unlock_irqrestore()  helper function,
> but it is almost nothing help. It just makes a code complex.
> Let's remove it.

This doesn't apply against current code, please check and resend.

--3itBwtoSQzGNTh6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAma85zcACgkQJNaLcl1U
h9Ba8Qf9Hawr1UP9o4IKHFH/yXsj5N0/q3hhLNjxOssM/6q0Kt68mkhABYGdIu2Z
wtydO2XmRz9oKEbCycHLxvj34aZukrLFithTbOv7z8DG0Tcn6cH/q8F4W1HqDob6
kBlrHrBwldCTq/V9JQD2IdWZjPPhJMlf8PIpWDqvDMPDWb8CihQjdBkcl2CqzsF2
0jDJTRQ4lAoFwMd2CggW0eOs0iSGO+J+N/EVGO86N4HSPyq6fWLlRAi9DWEAW8nP
uzUE72l3nrGDWALeNWHe1vsH8xGbJVLWBLLIE1L0O2G4jEmbApCzEJ9m9oWfj2DB
hGBhVcX1Xa2kxPNuNRZZsRCa3bpWCg==
=c1ph
-----END PGP SIGNATURE-----

--3itBwtoSQzGNTh6y--
