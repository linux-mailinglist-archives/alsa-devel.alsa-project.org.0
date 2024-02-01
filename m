Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 962D18457EC
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 13:38:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1B789F6;
	Thu,  1 Feb 2024 13:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1B789F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706791096;
	bh=f/LR2sRTdTvAYAnUCLiNKlfuJYV2a45QcY7PPTVVxYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gigL7maOmbkOIxmcX0cd3FlUOOZ/j52agldvKPBGMagsuq7HSIOpMGQ/EqtQvgUa8
	 Z+bo9Aat8t1eEqsf4XwfaB4/aSFgazwkTNsnkDvodUC04pMz3jAv6RjksELPCz+G+I
	 aEekwE42KuAKdGcR6HkqC6jLJLG2Nw9V3lQsvcuc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AA55F805A0; Thu,  1 Feb 2024 13:37:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D91B5F805A1;
	Thu,  1 Feb 2024 13:37:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96B0AF8055C; Thu,  1 Feb 2024 13:37:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A7B4F804E7
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 13:37:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A7B4F804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hZAcSt80
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AC087CE1230;
	Thu,  1 Feb 2024 12:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13015C433F1;
	Thu,  1 Feb 2024 12:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706791046;
	bh=f/LR2sRTdTvAYAnUCLiNKlfuJYV2a45QcY7PPTVVxYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hZAcSt80DYAlWUcbiCD1niFkiJumS4nctO8S2t9SF08b1fe+WgrVqYIF4QBKvcleJ
	 ckgL18JzZQfSuYPz65tboBb4XTc1W7u1Oaq2Cbt8jrv4Rp99dXc0JudInbvt1J+kDk
	 8D8E9XHgGgegB4/bYP3kYcKTiBbCbuqs7D08gHc5TeOzMS4wlKspC4/1tcajL2W57I
	 EV70qtF24mWzhUiTVjEPcOudLEk1mf/efI2w9QaMlACxQkM0GoKlhnVJy29V0bWhsc
	 nRtbiZq3ZttihQkRF/8xzNX4Edve9Qi4hsJ4etEMeL0rEXKH3O94qXSarjFneTkdnu
	 UqFyJvSOAegVw==
Date: Thu, 1 Feb 2024 12:37:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.8-rc2
Message-ID: <226e89df-489c-409c-a9e1-9b245ac4a23c@sirena.org.uk>
References: <20240201114049.62055C433C7@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e9fqvl6SH/eeGuiL"
Content-Disposition: inline
In-Reply-To: <20240201114049.62055C433C7@smtp.kernel.org>
X-Cookie: You can't cheat the phone company.
Message-ID-Hash: 64SWVPP5HYWBWF6BLQWZT5SKHYVJJJAX
X-Message-ID-Hash: 64SWVPP5HYWBWF6BLQWZT5SKHYVJJJAX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/64SWVPP5HYWBWF6BLQWZT5SKHYVJJJAX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--e9fqvl6SH/eeGuiL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 11:40:40AM +0000, Mark Brown wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd3=
3d:
>=20
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/=
asoc-fix-v6.8-rc2
>=20
> for you to fetch changes up to eeab239d6a2418fc5d2cd7ea76187085a97acde0:
>=20
>   ASoC: wcd934x: fix an incorrect use of kstrndup() (2024-01-29 23:08:56 =
+0000)

Sorry, I'll have an update for this in a minute or two.

--e9fqvl6SH/eeGuiL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmW7kIIACgkQJNaLcl1U
h9C6ugf9G2DAabTh0NxhrxuD+ig/QfnXGRqoYp04tKpp6yLbxOFXSGfCLmCt7G+R
8hbbPiPonB4+rfr/P838040A3Zv/FBSjSdMvkrZYwjGRpNohINkhZphym6PIJLPk
czoOWESgfsZ2u3YP7mpiX8so/2wixj6EERMvXpPUhS2jlYoCLIGsLHTlM3bJp1yQ
i7n1Pjiitn3GkzZ9hVtJ1lTrkzHXp+tZ36LuNZmn865Po68NaivR/ErfYIIeGaYB
EkMqo/1o9ybjR1w7eDEr6vlhPhCnfi3qzMxE/DXw7hC4T2v+BZyAhoI2q7JaHUtd
AkEs5i1bkenKR//ZU91wqI6EA716Cg==
=9Cet
-----END PGP SIGNATURE-----

--e9fqvl6SH/eeGuiL--
