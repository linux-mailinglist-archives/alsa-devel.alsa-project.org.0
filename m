Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A0D89BF28
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 14:42:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B36222CC;
	Mon,  8 Apr 2024 14:42:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B36222CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712580143;
	bh=84XOeCfBTbfAfttwzGK3yMdnjmXgpOzlJpVU1/u2iwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WffEgLX3oN4Eyvpr3oT3n2iFM3/v+AL3NVMR9M1KcM8DlYZyuZegy8A0fCuWc3Q6b
	 kCiEWkeIO+PoBxr5OuDvLBcb+ut5uUgqFrsE4oCtK5w0ksiJRLZ9N+gmELD4L6MYwO
	 B2Wv8ldP4NdszsP9Ge2sVDmFMGzpjdcR774JtXJ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FE51F80580; Mon,  8 Apr 2024 14:41:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6D2EF8057A;
	Mon,  8 Apr 2024 14:41:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B37CF8026D; Mon,  8 Apr 2024 14:41:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77837F80130
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 14:41:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77837F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ADo9i2gD
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C148C61050;
	Mon,  8 Apr 2024 12:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02028C433F1;
	Mon,  8 Apr 2024 12:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712580097;
	bh=84XOeCfBTbfAfttwzGK3yMdnjmXgpOzlJpVU1/u2iwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ADo9i2gDRMK9fGFxuyRBtekoT/HW6XfvyyIBJPylgXOsjOWfer5glc+0FAA2Zgo9E
	 KVq/2M72ncIn1oUdL/jiMVMN9tBKRDlXwGJvcM3UQr9b7TQ/EPfhREtdae0SiATLxc
	 fhKNpEjk6++Z16otyBAZtL6H+O7a/k8SMDxKzttxkZdAptOzdTEGv1efESdTIyKnRz
	 CwI70XxMnDpOkrxYWlzxgaRRc02ZtfNbGW0siFvn3tvd1QI/U60LaZvHOnFdl4fmcT
	 Kr28iG7YF4YnfdfOWKZIdCEBDxGrsV2A/MwgcCMqSmZfQQDVtwZ0bzKNPI0WH57c0B
	 e7oi/a/9Coefw==
Date: Mon, 8 Apr 2024 13:41:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 1/4] regmap: Add regmap_read_bypassed()
Message-ID: <043a984a-db22-4216-96d9-1fefe4694d88@sirena.org.uk>
References: <20240408101803.43183-1-rf@opensource.cirrus.com>
 <20240408101803.43183-2-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zejkK65P6uQG8f5B"
Content-Disposition: inline
In-Reply-To: <20240408101803.43183-2-rf@opensource.cirrus.com>
X-Cookie: Drive defensively.  Buy a tank.
Message-ID-Hash: RV3PUQVKGWFIVFAG4C2O466HTTXCP6YA
X-Message-ID-Hash: RV3PUQVKGWFIVFAG4C2O466HTTXCP6YA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RV3PUQVKGWFIVFAG4C2O466HTTXCP6YA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--zejkK65P6uQG8f5B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 08, 2024 at 11:18:00AM +0100, Richard Fitzgerald wrote:

> I have a kunit test case for this. But it's based on top of a chain of
> other changes I've made to the regmap kunit test, so I'll send it with
> that chain.

The usual term is series or patch series...

--zejkK65P6uQG8f5B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYT5fwACgkQJNaLcl1U
h9Bd2gf/aVxNn0Us1Z5jnN3TVYqcd+LL0xVE5/jlXAQJmUIqyWBzWxzmqMTFHfaR
CfWnsK6kciVGQdEfKJaWxWt0Xa4ouBC6N7k9AnUCtHVHe9ag6FMWaTOZAFPhczSi
5hk6zPZOjdiZk9NRBUB5SkLX195zJtMpu92HOOvgb/EjahoI/Gqt0vHPag27rsgv
5VnvTW3+HGkayPRoUVWCXgcm9A+SIpXMbS6sCYpA/1hHjUIa3UMd1R/ssoRuDjnR
CagEvIqMNUS4JovbB8KKdaUsEyDfqjQfXXp5k0w24if+sCPXrbDwLBpYuZqs0pnu
RrrfGlBL0NOgULLw3YOh3ZhTw2ADKw==
=SuRZ
-----END PGP SIGNATURE-----

--zejkK65P6uQG8f5B--
