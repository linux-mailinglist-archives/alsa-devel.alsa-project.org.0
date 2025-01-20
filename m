Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A476A17101
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 18:09:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0898A6023A;
	Mon, 20 Jan 2025 18:09:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0898A6023A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737392960;
	bh=Mb2l0XcUn1bmh2jkx2y08ChvluRoWNylRcDXRyL0v18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RvC/J20bo2gjv/L6iwnj3TrMVJPUxj/8+rjd2TKyKuHOWYrMZBh/ChZZEhzbSAPb/
	 YLugxJPtkoik1rEbuw1P1jD4vMCiW4jLi37XnmUs+6wi3/M6bZb/IaxvclgmEJSahg
	 3Yks1HDcf+E1q9GDcDCefnC3YHgOzFxJS7nqcIiE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40354F805B6; Mon, 20 Jan 2025 18:08:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 27F31F805B6;
	Mon, 20 Jan 2025 18:08:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95932F80482; Mon, 20 Jan 2025 18:08:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CDB0CF800E4
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 18:08:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDB0CF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Uyjc+hu5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A740EA4117A;
	Mon, 20 Jan 2025 17:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE151C4CEDD;
	Mon, 20 Jan 2025 17:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737392915;
	bh=Mb2l0XcUn1bmh2jkx2y08ChvluRoWNylRcDXRyL0v18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uyjc+hu5XSVws+QzPhj6kX4J77LbqsRRoGglbT/acbf4Xjky7jhTF5uo1PWqv0Wht
	 1z6jgFFALMiNjioUTKlsFC2Qm7XiX5VcqGLzmZaPJEv/zp5EyV3mXnIcBArhRPjrAV
	 aEOdBJ/qOywVManvDaqJfb9icJrsG8kxz7KqNmfUg/IDFyXQutuwwnm/zERFGWorA/
	 /8O0CuKGJkG7ANn5mlMNKY4IVkSLxBPweOU5MeJaTFzH1SbDpD1qYBkkzDBxrUgFxK
	 K2ipewjCkFyqT4IxV0mLDyq3UCKm4rwP1vyfTsaA5wdL6c6P9h7IhnY5clHdfqkLGl
	 BePnRRPPs8fSg==
Date: Mon, 20 Jan 2025 17:08:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
	Mario.Limonciello@amd.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 02/23] ASoC: amd: acp70: add acp pci driver for ACP7.0
 and ACP7.1 platforms
Message-ID: <e5d8c2a5-98cf-46f1-b942-8792289ec363@sirena.org.uk>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
 <20250120100130.3710412-3-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8BbpEGHtzEpea4jW"
Content-Disposition: inline
In-Reply-To: <20250120100130.3710412-3-Vijendar.Mukunda@amd.com>
X-Cookie: No lifeguard on duty.
Message-ID-Hash: XROOD2YRWUOB6UAOGEDLELBXCA6HV7BS
X-Message-ID-Hash: XROOD2YRWUOB6UAOGEDLELBXCA6HV7BS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XROOD2YRWUOB6UAOGEDLELBXCA6HV7BS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--8BbpEGHtzEpea4jW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 20, 2025 at 03:31:09PM +0530, Vijendar Mukunda wrote:

> This patch adds common PCI driver to bind to this device and get PCI
> resources for ACP7.0 & ACP7.1 platforms.

> +	ret = pci_request_regions(pci, "AMD ACP6.2 audio");
> +	if (ret < 0) {
> +		dev_err(&pci->dev, "pci_request_regions failed\n");
> +		goto disable_pci;
> +	}

Looks like there's a cut'n'paste that needed to be updated here!  I'd
suggest there might be some chance for code sharing, but I suspect the
amount of code is so trivial that it's not really worth it.

--8BbpEGHtzEpea4jW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeOgw0ACgkQJNaLcl1U
h9AK8Qf/Y58VwBIH0bJ3HcA0LJTE7AvXKD9ItYLsXczKd0E4GpaiOgJAIUigw57t
qk/ofTDNc2ioy1agFYGjr5gL5tm3gIHNdbkgZP++DdhxWQh2BoNeRGKF9+uhRuz3
+R96VaV93fxDdzXUceHuKlOCLTL04tzQbj0RzHHdlg1pk/YRlztjaa7xhNRaYO40
ifPYGOC9+YUEtqhw8VoWoYN+Tv+hPAUPiyrwFvsBdw/aueSfTV79B36yUMaekfoW
Z3Fs8VedBLeY21ak+/+R6Fm1b34JwTwUqkCVSRDJtxR0jrxOC9cM8ROlEfDyShaZ
k/D7VOfPlBl1cMLerQJeQbjj86v+AQ==
=pT0d
-----END PGP SIGNATURE-----

--8BbpEGHtzEpea4jW--
