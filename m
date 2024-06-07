Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7E1900976
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2024 17:44:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEDBE86E;
	Fri,  7 Jun 2024 17:44:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEDBE86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717775061;
	bh=Oak7/RY7bDtE/YffJGOhtWBTzO+b3JvmAbgh9CNNL7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BfFWb78gMQR/+BlqowosyuxN8wRwjfjqkkbanng2IZgoB4POZMOP+RxrM1mMUJFvK
	 T0K3l9gHIIntN5nTUD/RNeSgq4hpl6/1Xk+LSELekTk94vki1YVPERcctPaRVGLKe7
	 0wyB3SJXgjKKqN7RKd7621ZwVSssQjGrBP6GwQ4U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FF9FF805B2; Fri,  7 Jun 2024 17:43:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A27BFF80564;
	Fri,  7 Jun 2024 17:43:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1457F804B2; Fri,  7 Jun 2024 17:43:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82465F800AC
	for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2024 17:43:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82465F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KswXNit0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D91B61EBE;
	Fri,  7 Jun 2024 15:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69EF2C2BBFC;
	Fri,  7 Jun 2024 15:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717775011;
	bh=Oak7/RY7bDtE/YffJGOhtWBTzO+b3JvmAbgh9CNNL7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KswXNit0c+KzUCH64bi5nQnmphSXrUOvAZmYXkidLEAMmcZQZrGHZ9mkL/CaV1DRY
	 Yd+MZeCZRdEkqnzOHaZt697IySBQxQDCCKfUdk/IJRpwWbq0W7QBMhfXqhnclhY6wZ
	 ee1f3+CzYq7h8LJ1tterkxhX1MRNtFfmTq90IpTf+RI0coPB/5BkUB0W8G16s+Qndh
	 9ljjAnCzetjixTcNDHuBn1fjPE/jEjCSV4TFSocFZTE8+/tRVfsjy5sHc65QCGa4Co
	 H+qTZo0BQNibIWPAs2sMh0SecbRZct0H80wVPiil1EZI6zCCJugakAheoXMuKwTDHl
	 KLf/z7U0gSohg==
Date: Fri, 7 Jun 2024 16:43:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH] ASoC: ti: omap-hdmi: Fix too long driver name
Message-ID: <ZmMqoA9nsEDh2jK5@finisterre.sirena.org.uk>
References: <20240606070645.3519459-1-primoz.fiser@norik.com>
 <dac7fba4-c7e3-4be9-8072-625d723e6cf5@gmail.com>
 <71d7754e-f72c-4a04-b03e-a0ee0e24c9e0@sirena.org.uk>
 <fe0ec57b-dad3-4666-abe3-75bcb65fa7df@norik.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E3iFsJivvgUV/9q+"
Content-Disposition: inline
In-Reply-To: <fe0ec57b-dad3-4666-abe3-75bcb65fa7df@norik.com>
X-Cookie: Your love life will be... interesting.
Message-ID-Hash: AE5DTSHN3TUHBPSU5JF6YBOMB4GCPYJ4
X-Message-ID-Hash: AE5DTSHN3TUHBPSU5JF6YBOMB4GCPYJ4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AE5DTSHN3TUHBPSU5JF6YBOMB4GCPYJ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--E3iFsJivvgUV/9q+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 07, 2024 at 08:14:40AM +0200, Primoz Fiser wrote:

> So card->name = "HDMI" for v2?

Yes, please.

--E3iFsJivvgUV/9q+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZjKp8ACgkQJNaLcl1U
h9BIcQf+LZpGbmqKcuAK05OwRDTh/tjjeSbQCs1/T/tGLfIz1M1M8fJGpjcIYdnA
0MZdFPYqPs/dBjNMjhCVCYp1X3U8jKDL01dVSLfR35ZZ3cGv9mMxi/+V2S1qELIV
8Da+8IA7JrqutzC+7cmFkmMrz7xGzp/jNWaBMet2upvkcXKAXBahSP6ICD9P0Qus
xritGwfbPQ1xVfSU6Yd4pPngP8Ak6sYTGsV9AuHyX9bk3UHtLxUu4Za2rwiT5mJy
e79W34zajligov/lRXgM8FdEjiFo/7yaZv5EWq9LZYc0A0VXRSlPAMtrd5aUawFz
7kCm7CHFW9FvxWn2oFVA6vqaLHqJcw==
=Wz2C
-----END PGP SIGNATURE-----

--E3iFsJivvgUV/9q+--
