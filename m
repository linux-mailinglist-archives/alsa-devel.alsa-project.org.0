Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D987B53C6
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 15:15:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F7FADF9;
	Mon,  2 Oct 2023 15:15:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F7FADF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696252550;
	bh=HuaILnKaqJkgCcuZj0uhvKwWfMGfSaYcyoOOPL8N3Ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mGSMIhfPbcKeBorb77ZGsIHmwHEhHPfeX4F2+8/nm5wQlhEsl3IjiRqC6xa1vRb9h
	 HSIUJF2ZYUnso5oxQXNsbw2jSS1aqDpkGFcFdksLfK1TTABTz4OhDuCYtltUiD3tPS
	 Wu913mD0WQBPdG229eleBMb5+2r/b7YFqb1qXW9g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EF3DF800C1; Mon,  2 Oct 2023 15:14:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 203C4F802E8;
	Mon,  2 Oct 2023 15:14:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAC91F80310; Mon,  2 Oct 2023 15:14:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5332DF80166
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 15:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5332DF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nyxj3Bm9
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 25E6FCE0E67;
	Mon,  2 Oct 2023 13:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B20C433C8;
	Mon,  2 Oct 2023 13:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696252484;
	bh=HuaILnKaqJkgCcuZj0uhvKwWfMGfSaYcyoOOPL8N3Ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nyxj3Bm9iKxI/T17uFMykPGU1tTM7jVoFjG4QkCsRe4xLgXU0SNoiBzmpGqOQZR7D
	 Krc3mkFWTAUtaF+MyUbwio62QhKKRk2Yea0YYP5vfditpWH6kCTNEjWCL1r5l/woGm
	 LqbkTjiWtTWlV6ThgMN19+3YVO5Y9ZhoZu2zlqDQFXxdgYD4PB1r0YTXSSdJ6DLfOu
	 HaEnTOpmRtJOqVMHA1q0uJFa8sHXvQv9U9draxNyirFHxy4XnLJ1e0SDZqfDf+/MX3
	 EXVM+X1t+aZ5zLAUwpz7mfsZTsqJarJgILGGApfmvXswJWO9w7UMj9Cirqkyb/AFTo
	 0ZfZSytatbVfA==
Date: Mon, 2 Oct 2023 14:14:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Antoine Gennart <gennartan@disroot.org>
Cc: linux-kernel@vger.kernel.org, shenghao-ding@ti.com, kevin-lu@ti.com,
	baojun.xu@ti.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH] audio: tlv320adc3xxx: BUG: Correct micbias setting
Message-ID: <d5250bc9-403e-4b2a-a5c9-1c3711caef68@sirena.org.uk>
References: <20230929130117.77661-1-gennartan@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="omQMoXSCBIHz/SbF"
Content-Disposition: inline
In-Reply-To: <20230929130117.77661-1-gennartan@disroot.org>
X-Cookie: Postage will be paid by addressee.
Message-ID-Hash: 36Y6LWK7RV7AINGXUJ7CR3BXZVTZM4ZD
X-Message-ID-Hash: 36Y6LWK7RV7AINGXUJ7CR3BXZVTZM4ZD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/36Y6LWK7RV7AINGXUJ7CR3BXZVTZM4ZD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--omQMoXSCBIHz/SbF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 29, 2023 at 03:01:17PM +0200, Antoine Gennart wrote:
> The micbias setting for tlv320adc can also have the value '3' which
> means that the micbias ouput pin is connected to the input pin AVDD.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--omQMoXSCBIHz/SbF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUawj0ACgkQJNaLcl1U
h9Dhpgf+Mpc4EGYGbWS6TYHo7x660bBHpu32KWRzDoyKjmkmbTBakRX4niRBRqFN
kFvgfT/+UY1AV7dT/FTRb8qcAfIJvkCJkul7iIY/2DjVcr4Xm1779DqIE/zqnfri
qI+TJ7f4jgzl1XbAzG/3t4VT4HJsUo7Y3ajlAo2ZjQyePFRDeEEnZQ5i4oCXrq2u
3lKrvCzt5nnE1fVGPtj7vRHgnBmBuFiu47f38aEbG5CTY4zSHF69w4yrHDNI1E9m
FGSSaHn9N32xr00GeD2UGS0JYzfR4n+cAfTWMPKXKqgB+FzniGVEDOBNXgbdgnFX
dP5me0cXpACy2E5Yn7vBghaXy2K9wg==
=jAA9
-----END PGP SIGNATURE-----

--omQMoXSCBIHz/SbF--
