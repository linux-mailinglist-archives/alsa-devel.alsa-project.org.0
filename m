Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7987B51A9
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 13:46:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2D0CDF0;
	Mon,  2 Oct 2023 13:45:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2D0CDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696247196;
	bh=bMrSRUgpXJH0CVNYlsj0cGsTOKkjL1dKbLRqtS4uC0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T9rA1GXLRbqtzw1non4ZoEjsu642qoY0Fuc2drnap26oGtqEgZ6cy064lwNXLn577
	 jeT0U6ZbfEOGjFZlOTXFtlvK0L0bMp7lLZbLA5sCPmVrVKjidcfIYgLWJRbvUZqvVe
	 +3Htg873U+2rmGia5qUYOQH29F0ww3TBtAfo1iT8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52F0CF801EB; Mon,  2 Oct 2023 13:45:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1149F802E8;
	Mon,  2 Oct 2023 13:45:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22C7AF80310; Mon,  2 Oct 2023 13:45:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C98F2F801EB
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 13:45:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C98F2F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TEARdE7M
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 77B2760E88;
	Mon,  2 Oct 2023 11:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C067FC433C7;
	Mon,  2 Oct 2023 11:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696247130;
	bh=bMrSRUgpXJH0CVNYlsj0cGsTOKkjL1dKbLRqtS4uC0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TEARdE7MMq0KRwF93d6lYooyL23xE9xprPr8ge729FaO3B7vrJhcI1Y1M6XrV/qP5
	 360f32q1g2wrqZCiIHys8sn+AMi5G85h+rAW6XYtO319lKeXWMeTeYP4lPdtQGZhPv
	 L3b0di1KwkBwk4wxTJpWXB58c7/NMvdK9z3ZajIIOlBl9RlhLhR1NL5HiVv/3wkGg4
	 IdmvHv0hEXiB+rYpDOBNxjpiu5NJWCwRPAay1LTYJXjGqzHOuujz0h2SbzupTGP5GP
	 rSYX9UbzjIy4dIGhk2751CTGsa7dlkUr40XFXlrp9R6kMJRze7U2kaW7NylGVsbJcy
	 Jdn92M4So/rRw==
Date: Mon, 2 Oct 2023 12:45:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Tony Lindgren <tony@atomide.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/5] GPIO descriptors for TI ASoC codecs
Message-ID: <5d855200-13fa-4c17-80f3-bd10f3507c2d@sirena.org.uk>
References: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
 <4eb93a15-6e6b-4b81-aa3e-d78d7ef9476c@bitmer.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j5T0cNrsIFAwur+z"
Content-Disposition: inline
In-Reply-To: <4eb93a15-6e6b-4b81-aa3e-d78d7ef9476c@bitmer.com>
X-Cookie: Postage will be paid by addressee.
Message-ID-Hash: DS7SLX3S3JGVOG36LSN3VWHRXKNV3AQN
X-Message-ID-Hash: DS7SLX3S3JGVOG36LSN3VWHRXKNV3AQN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DS7SLX3S3JGVOG36LSN3VWHRXKNV3AQN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--j5T0cNrsIFAwur+z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 01, 2023 at 08:49:12PM +0300, Jarkko Nikula wrote:

> And to 2/5:
> Tested-by: Jarkko Nikula <jarkko.nikula@bitmer.com>

Sending this on the cover letter in addition to the patch itself (which
you also did) confuses tooling since it can't read the words you wrote
and think the tag applies to all the patches.

--j5T0cNrsIFAwur+z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUarVIACgkQJNaLcl1U
h9C0Fwf/f6xhpQACSpxT+gE/sGNodFDyoSXDOLievp3xxMP80KDAhaO7bPKL6LbA
nxqJ/kyYuEIHvucMlbTGjnNw5DD7/1WvLItcsu2DWPb/Hb+wVv82EX3mZOPJotWH
+w+q5AOBTkkJPLdxUVT1g+cGzrNv7q15PpokqM3NwLzIPEsyamU0uWsFFX5qpdm1
N57fJKXS/yvaBJwmBejs7tmTd2qBgHHk+nN4912n+f9fPvBn/WYBKMC9RlmoSumi
OtHAU4GIsJtTPkPyeKF0aoRzk8yw4sOd8+2yYMXFXMeBlSwI1RTddrsL9ZpyjTx+
PCpZAOSkeHUcEQ0W9Rx+ZXc+AbQKqQ==
=dTGt
-----END PGP SIGNATURE-----

--j5T0cNrsIFAwur+z--
