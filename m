Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC458CC4DF
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2024 18:24:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA819823;
	Wed, 22 May 2024 18:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA819823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716395094;
	bh=AWTKHb0bmoEcBitaeZqYTd0+23qEPVjE572slrya0ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cmXyyO22FPajXQBmGhY/jZLMtSaligpTyO+kZhdthAW3tR2EAxC6qygwO9+sW44aE
	 4O+LQN1m7tzKgKDrC1JC6e7kfg2Hy2U2MKDC8XxayOEoCkG61+CXalTivBJSuZhoDt
	 lRq07XoadOrvTeLHqs0Uz9wdvuh5FtyFi8YpYS3Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3376EF804FF; Wed, 22 May 2024 18:24:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25B34F805AB;
	Wed, 22 May 2024 18:24:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8B50F8026A; Wed, 22 May 2024 18:22:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9929F800BA
	for <alsa-devel@alsa-project.org>; Wed, 22 May 2024 18:22:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9929F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Fky4eMAs
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A488D62603;
	Wed, 22 May 2024 16:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5C0C2BBFC;
	Wed, 22 May 2024 16:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716394942;
	bh=AWTKHb0bmoEcBitaeZqYTd0+23qEPVjE572slrya0ls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fky4eMAsBLnUS+z0kupJjk+N+lm7BPyuPATy7PrnPDc6XufE0Gn+auAfTvhCwPmfl
	 avvetGb85fhHXdyDoZooW49ws3OQBB4mKM4tM6ql7fynuLgM8uD7NfESRNb3YFEtRg
	 e1GLPba1O4ykrm3HMSYFYYwIJACKyE47Jwde7y17wRGRjAaoYBYuQHetb166tZpCEg
	 UVoQiPuFJTim0WPru6wl/d6xdzKQVtc6ixII07M7yNSfqLgXjM7OymfVpW0yreMP6V
	 w9Lg5C3jVNs0I8zxj5Y9z/1AUPXAZM0SvGnALDzGsnk9KqOEtX6jcSA2QNGlL0fcES
	 K4+fxL9I5ollQ==
Date: Wed, 22 May 2024 17:22:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 3/8] ASoC: samsung: midas_wm1811: Add headset mic bias
 supply support
Message-ID: <d64991ee-e125-4497-8030-6ca64fbe35e6@sirena.org.uk>
References: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
 <20240519-midas-wm1811-gpio-jack-v3-3-0c1736144c0e@gmail.com>
 <1aed24a7-ab2a-4c2b-a3bc-2b907e091624@sirena.org.uk>
 <52428c0d-4b18-4707-9cda-4e6a11e256bc@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EL4i+puPElguxjip"
Content-Disposition: inline
In-Reply-To: <52428c0d-4b18-4707-9cda-4e6a11e256bc@gmail.com>
X-Cookie: Bridge ahead.  Pay troll.
Message-ID-Hash: ZMER5FDSDCKQOHUSFKDZFRQ53EYEZQ5H
X-Message-ID-Hash: ZMER5FDSDCKQOHUSFKDZFRQ53EYEZQ5H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZMER5FDSDCKQOHUSFKDZFRQ53EYEZQ5H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--EL4i+puPElguxjip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 22, 2024 at 06:20:14PM +0200, Artur Weber wrote:

> What would be the correct thing to do here - add a secondary DAPM widget
> of type REGULATOR_SUPPLY and connect it to the MIC widget via audio-
> routing, or replace the entire MIC widget with a REGULATOR_SUPPLY (or
> something else entirely)?

The microphone is getting a supply so the first option seems better.

> And should this be done with the Main Mic and Sub Mic as well?

Probably yes.

--EL4i+puPElguxjip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZOG7cACgkQJNaLcl1U
h9Da9Af/YiLFo0ws5uTputzZ9Vnnzu51OTlsLRlk/AI4srvbo/yePNM+Zsxysdsm
cM6zex9GmD0DJCYpHAS6sCwGT11nGDlfAUrxi1D/xZYURxArtojJbBztByv7Y2QM
NBjQJcKcvvwtmIG4NT6YS46w2jUBfq7j8LbqMxkby62KiWPe5t1tILfeyv9qHIay
QuR6ILhS093P1LaNp/gM1u6d+usQTb7ymCMWhZWk3ODj23x2VdCSQ94DvUjIlGYV
P4rIzntrO9jzQw3NgEJBLuAhIt6VQmk7Cg04H5ElZlgT7pmbr9cWiLRnepe2uR7g
oQLU9FWtULGu/9PXCdtk2Jj3T61Liw==
=NRmF
-----END PGP SIGNATURE-----

--EL4i+puPElguxjip--
