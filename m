Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9079E3EDD3F
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 20:41:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 251AB16B1;
	Mon, 16 Aug 2021 20:40:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 251AB16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629139265;
	bh=zxs7PfDCzOg5/JKaFuj1ZRG3AUP94enAwR2htcd+f3M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G8aQZ0p8/gwIuq9mFW3JcLgS8TAPrVNG3kp+VwNvX8Iw4OAZlNfU224yUse8668/p
	 mrOZ4FSVuWv+izzlsDD2b+9vy9hhaE8AQXl1aFWeFcYP1xUc2DtMuXI5wpvVx8r8lS
	 1V1uKg0frCwTwpEOySTrNC+O90eEmtl63CkweaHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93264F80259;
	Mon, 16 Aug 2021 20:39:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E649FF80249; Mon, 16 Aug 2021 20:39:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D468FF800AF
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 20:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D468FF800AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="J/m4g2Kc"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6F0760F22;
 Mon, 16 Aug 2021 18:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629139169;
 bh=zxs7PfDCzOg5/JKaFuj1ZRG3AUP94enAwR2htcd+f3M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J/m4g2KcCGRuaPCzT4cJm8n8B2i7bDPFRLkN5v14dCq8JZs8fMZRV4ZgCvaeD4QUH
 ItI0vGPuAeIrPEI1PWlF4YY3+4BQUufG9Hry9UbIi9zLW0Gx8KMhGi9YiZrtg1JyHW
 BIymJ6PvjRJgX14Ye868QzaV3b0jGet8tYHCqCL7sObzEbeXalELIS0VuV9ckIpGoH
 FBS0/8VufzaZHf7wF8pHKGKiQQWIgOzy5jvySlJIe72+gsMSJ8bOd7HbAKTe4Agq98
 9s8MyH6K13kgNJfPuQgYuWnA3ka4x6KFRJ+0875qxcItLnm+1UwQrWIUJySQfaqFg2
 88PMFB6s2qIFw==
Date: Mon, 16 Aug 2021 19:39:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Aakash Hemadri <aakashhemadri123@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: tegra30: ahub: Use of_device_get_match_data
Message-ID: <20210816183906.GC4253@sirena.org.uk>
References: <cover.1628971397.git.aakashhemadri123@gmail.com>
 <e568d621c9c05ee23732a6a6f9e3606a780b1707.1628971397.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Content-Disposition: inline
In-Reply-To: <e568d621c9c05ee23732a6a6f9e3606a780b1707.1628971397.git.aakashhemadri123@gmail.com>
X-Cookie: Allow 6 to 8 weeks for delivery.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Bjorn Helgaas <bjorn@helgaas.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-tegra@vger.kernel.org
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


--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 15, 2021 at 01:42:18AM +0530, Aakash Hemadri wrote:

> -	match = of_match_device(tegra30_ahub_of_match, &pdev->dev);
> +	match = of_device_get_match_data(&pdev->dev);
>  	if (!match)

Thierry, are you sure about your review here?  As others have been
pointing out of_device_get_match_data() returns match->data while
of_match_device() returns the device.

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEasMoACgkQJNaLcl1U
h9C+Iwf+J9Ygbk55AEmLiBKbA3H+0cbaMUPZPYozas8BV793kLwX6y7eYrFg+CVj
6vDpzijY3mrdK6fVhJMjwsu/MzEel6qoLiB0EZF21JSUgMdrkCJ/lImAXyD8rh66
IC9pQo2mnorWs8lEG3QJmnFOY7dH6YGBRwLk/kyffQHkHGzz0D/+kFLBi3Fuy7kP
d3kBV91h3c11wiRzBe2dPC5/xyO+Gp9nFtLu6OoLCO32YssTPu32x9YUxRXWWsmf
vEB1G8GNRt66HYr9D0V9LPOjlPGIJLs6Q+F2MRyBPbyzesDGKOzG81mGjPPGfnvU
pUEDPwZlEw+VtfUzcVZIMhAmrKU29A==
=//If
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--
