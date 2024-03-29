Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AC3891C3E
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 14:45:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31F582CC2;
	Fri, 29 Mar 2024 14:45:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31F582CC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711719922;
	bh=7025wz2wTMy76FRP8y1NIXVAZaINC6zDkDUlwU/4nHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pc8g/PqFmza852eWjA4XuY2yqmsKY6nnLaTFuU3mGm0v736u1u72CA+3KB52K0TBB
	 OC/SlrtMGtZvt9I355ghT1nF1Gp/tBDDQsaNSOk8kTwRuARgb/ySF8STAh+RrORx7V
	 IjR494Cba5OvZ6/Bdl/so3MNOhSvxGmzdtWgB6Fg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6E46FF805AB; Fri, 29 Mar 2024 14:44:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BE6D0F80579;
	Fri, 29 Mar 2024 14:44:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8405F8025F; Fri, 29 Mar 2024 14:44:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7A326F80093
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 14:44:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A326F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BXvkl0Tv
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 593AE617E3;
	Fri, 29 Mar 2024 13:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A014C433C7;
	Fri, 29 Mar 2024 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711719878;
	bh=7025wz2wTMy76FRP8y1NIXVAZaINC6zDkDUlwU/4nHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BXvkl0TvfT1+PxySECL0GKFAzG2EXVy1HCpd5gZnIqzeTXBZvHatPstdISGNRqszL
	 2/i4DKB83b2SNCZUJDAlZNPafhEXwSVUhjhruU9MKWBNhKGBGHzWW1X1FcQddEop3p
	 yHGyhRYIyGl1RcwKILJmofwP++QLodfEFEwAG1dSZL5joltypUwc1zHUYfl5bXBxh0
	 6rdAumZ3x7dJbewJNr6pIjj/5MhIAPBiXGNc53uL4vFTq4Yv8h1u0U4fUAPCcumGIY
	 9jPrCc3KCgYXDk7f9Is+rOncUhjzUoW/bjCf08fkbnmSw1ADXT7CIQqx/73YFT9O8u
	 CKvEfz4rAMYWQ==
Date: Fri, 29 Mar 2024 13:44:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
	tiwai@suse.com, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
	CTLIN0@nuvoton.com, SJLIN0@nuvoton.com, scott6986@gmail.com,
	supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH v6 0/2] ASoC: nau8325: Modify driver code and dtschema.
Message-ID: <ZgbFv+c3fjME+x+Y@finisterre.sirena.org.uk>
References: <20240329085402.3424749-1-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/2UC1HPubXxRHY8b"
Content-Disposition: inline
In-Reply-To: <20240329085402.3424749-1-wtli@nuvoton.com>
X-Cookie: You might have mail.
Message-ID-Hash: JIHHXI5CPEXEJ5VM5FKDY5I2EKSZ6I6L
X-Message-ID-Hash: JIHHXI5CPEXEJ5VM5FKDY5I2EKSZ6I6L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JIHHXI5CPEXEJ5VM5FKDY5I2EKSZ6I6L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--/2UC1HPubXxRHY8b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 29, 2024 at 04:54:00PM +0800, Seven Lee wrote:
> Revise properties description and use standard units in dtschema.
> The unit conversion driver based on the attribute must also be
> changed accordingly.

My applying the prior version raced with you sending this new one, could
you please send incremental patches with the changes from your v6?

--/2UC1HPubXxRHY8b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYGxb4ACgkQJNaLcl1U
h9Cfzgf9FewcTdv1e2tZdg1Pri5qt9/MGVkmSh9R+8D3z1zz/pMx57wCFowDzuFs
e2FhXyaKTw8pbOXDQ6dW2Bym80xTEE6jgiSsJGPNqwT/Tep2qRdz9v9gyHyvkDZ5
hlWs1eM+NdKc9b+C98+05o+A81/Arw+deZH7ilf4rFMsLVgPgtWGkdu+B+Xd8lW5
lY7bC5SIgVK8R7kd4bg5VX9ZfqdBFPMOGEVZ6INAkHhbTOZ8mDG2/eJZ1xwXWeAr
W7jqj22t5ohZSdwBR7xCfcdaDYig6rK1Kufa+7FlC5UHGF+jZswr3GssgjNLsjeN
P+O3wgSbI2ye0QnscPtEoDJBchz4IA==
=wIjS
-----END PGP SIGNATURE-----

--/2UC1HPubXxRHY8b--
