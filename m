Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE1391BEB1
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 14:35:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 812EC2354;
	Fri, 28 Jun 2024 14:34:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 812EC2354
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719578108;
	bh=RoLBOx1Xy5qBc1UCaefddNk4J2vlDpzCR1gAkGZkB/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VYzUEm9fZfwO2KUhyXeZMJLljQQrr5OXW2w+sXnOQ3fa0xpWmM1LEd0LfMR7pr+Fn
	 tDdUK4vAgKL+xua4gDvl0Bz8QNbMCGqFUqvhiWVye2iwpqjDP0Z3YuLUvluSPadNOh
	 yPSywvI7OhxkBXqNaVVJeTAFUuML4jBQq/zPAZio=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38E72F804F2; Fri, 28 Jun 2024 14:34:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5480F805B0;
	Fri, 28 Jun 2024 14:34:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2905DF80423; Fri, 28 Jun 2024 14:34:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C5DDF80154
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 14:34:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C5DDF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EdXMo6Cx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC3926215A;
	Fri, 28 Jun 2024 12:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FF36C116B1;
	Fri, 28 Jun 2024 12:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719578055;
	bh=RoLBOx1Xy5qBc1UCaefddNk4J2vlDpzCR1gAkGZkB/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EdXMo6Cxj9Dz+FuOl47zowYC7zIEJSxGvnLpwVbU4Jw9Jw2tey7v8Oqm8vmeiVrYU
	 IxCsDH0n+dnk8FNybI2064pZTyJrlqMtiYB8glFYUx1aEPeNd6joFdi5QilE9dwpA6
	 UkobrgcmNhcvDocPlG4jtZXdwZ/xVUtf66iwf0nl5lQdPfztZQd/V4qOi0pxcBflOx
	 BfzwJDSaxXsxe6BI8qrZi0HvXhMFPNlkYomqVEg2iYbPm4A7NT0N+XQwDCrSSnpd+N
	 EoWccaexWOTDRDQ6XQmqn8l7/P1+h0C5oFqYTwC/rGYTr8iw7PeE3gjyElAHZs+6dM
	 JZKa+9tT/aw8g==
Date: Fri, 28 Jun 2024 13:34:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] ASoC: spdif: extend supported rates to 768kHz
Message-ID: <c68fc059-d02e-4e83-a6ae-6de566016696@sirena.org.uk>
References: <20240628122429.2018059-1-jbrunet@baylibre.com>
 <20240628122429.2018059-4-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xj3uMmawnUkssIii"
Content-Disposition: inline
In-Reply-To: <20240628122429.2018059-4-jbrunet@baylibre.com>
X-Cookie: divorce, n:
Message-ID-Hash: JLMDKU7SPCVLITNYM6LI3QMMPDBPUEAT
X-Message-ID-Hash: JLMDKU7SPCVLITNYM6LI3QMMPDBPUEAT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JLMDKU7SPCVLITNYM6LI3QMMPDBPUEAT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Xj3uMmawnUkssIii
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 28, 2024 at 02:23:08PM +0200, Jerome Brunet wrote:
> IEC958-3 defines sampling rate up to 768 kHz.
> Such rates maybe used with high bandwidth IEC958 links, such as eARC.

Acked-by: Mark Brown <broonie@kernel.org>

--Xj3uMmawnUkssIii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ+rcIACgkQJNaLcl1U
h9BRLQf+OO8G76LapZvgf0BF5bWkvUp1HUCuRr1vY60IHBG9xBAQFKffRXGvKgFZ
MkSfqFOYApi/BcabkuQRtnbwqRsd+BDj32lipbd37dLnyGZgBb/LfpXaMotrHVYi
QdcsRnTjh5FzXCHxVmm5oD+VYvKJon8uJM4njmYwcSy5rWcLXbMMYgRs+DDBfTxi
xzszPeGff9v7d33aSjs9jLGbS4K6GCr03JMVGasejPOQJHBc9s7CsjXGFYNF0ASt
J9xI2mcFnD41/9+DhS1uWZvbqPDEJYvYh+V7itdlphATD4ZNGqn/FFGo/210flr/
gOi6fVFUYJodvTI2Zq6xRSX7SRbAFg==
=YXi5
-----END PGP SIGNATURE-----

--Xj3uMmawnUkssIii--
