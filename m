Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E7454F359
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 10:47:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A3471B43;
	Fri, 17 Jun 2022 10:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A3471B43
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655455623;
	bh=yqzhLHcKPAJYHbRZbKXDOvARyleooSL+Wl+IzjUN4p4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hjpMcK5YHn4lOWvfiCyBEqv/GQ4ThwR1wPmceYULmEmG5QkQmn11Gh6P8l4XDPrZ4
	 +q6Uk+qM5lZnnM+cARN4XgfNJw6AW+gqQi76+dtJEhBbzW7V7vWboq3Ywy633nthRW
	 6CJwAGRmQVTzP4rcDOEacsgPyEvvnCc4kVhqtrVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45BA2F800B0;
	Fri, 17 Jun 2022 10:45:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63CD1F804BC; Fri, 17 Jun 2022 10:45:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82F7AF800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 10:45:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82F7AF800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UcxHZnnN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8BD5F61337;
 Fri, 17 Jun 2022 08:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BBD5C3411B;
 Fri, 17 Jun 2022 08:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655455523;
 bh=yqzhLHcKPAJYHbRZbKXDOvARyleooSL+Wl+IzjUN4p4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UcxHZnnNY9YJMK/0j7CavYwMR4LNBIcWcBMa62qHUvOAEXrVqtH6V+LS5oz+jZJS0
 qT3ZRdlvEcrhBCUzfISNq/c15rlmZyHYbMtG/IQ1ZMcwSCRgR8tqWt6Su0WOpDfQZm
 yvwQYttfIBB+6uaRfR5uD1uLtRCWyc+XQVrKF6yVaxAYhr0lLUvDerQGnT7b1tj8Eh
 K+Ojta6jA3AFtXowcVyEOZ6WSccsFNoPm6lcNxSWIHyVHr0qbyqDec3VGeuoR8Ld8t
 Ipq/iCF/S2AQiIWP0AmmCfkROXNAacAy3UsBgGLK7d3+pIXCZ6eLkTlMDSXJj4ag9R
 pLZ2vAdO16r9w==
Date: Fri, 17 Jun 2022 09:45:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Judy Hsiao <judyhsiao@chromium.org>
Subject: Re: [PATCH v3 0/3] ASoC: rockchip: i2s: switch BCLK to GPIO
Message-ID: <Yqw/HbgbdkFPht8D@sirena.org.uk>
References: <20220616155836.3401420-1-judyhsiao@chromium.org>
 <20220617044251.4029697-1-judyhsiao@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aLv2GpDJ47ZFHIwQ"
Content-Disposition: inline
In-Reply-To: <20220617044251.4029697-1-judyhsiao@chromium.org>
X-Cookie: 98% lean.
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--aLv2GpDJ47ZFHIwQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 17, 2022 at 04:42:48AM +0000, Judy Hsiao wrote:
> The patches series is to fix the unexpected large
> DC output voltage of Max98357a to burn the speakers=20
> on rockchip platform when BCLK and SD_MODE are ON but LRCLK is OFF.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--aLv2GpDJ47ZFHIwQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKsPxwACgkQJNaLcl1U
h9C/VAf6Ah6++LNhpFFUJaZ0Bc+FLeKDMzIEESVc0bMzROauZlkjBbR2EunJMmq4
BhlzGKMafwI0RT4sGVbO7nPwVr5ltH7tfcIxMz57xvVwie7Bb2tld2ZTSAqP5xXq
bJUNA+bJVHSW8KwiYfcydoQeCvcNMuik4ywZ6nubQPX806JQLxM9cQFdu0ayaMzM
pjFAFbXkeyJKUrsbvXfP0BQ+PVAoqnJe53NAHwd7GkTOw/vHO7zx+0Mz5HSSZ3p5
HEM9h42NagL4ZomdmeStvS2zUxms/g62hrgi9KcWiclSYGBWXDfvL4nbJ3MFugRY
ZufRWrarft2pGXl6wfWVsQwSmx05Rg==
=tvsr
-----END PGP SIGNATURE-----

--aLv2GpDJ47ZFHIwQ--
