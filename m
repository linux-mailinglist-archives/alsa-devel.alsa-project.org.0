Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CFE463BCE
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 17:33:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C283C231F;
	Tue, 30 Nov 2021 17:32:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C283C231F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638289992;
	bh=Hn/gufx2Ts0ISAwRB5X7upcVUqCZvs5DpWa838hs99s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Atc3vj6Ce8PgXhISiAgH0CW459Iq+tJfn9/dfDl/OEpn2sd4YdXBYwmiouYivmAvm
	 6DRDV6DsRcfMWW2vKmSmnUDhMm7v55g9fad6+NbQE7rDrsRCMZ3TiHNI/omCPS9aux
	 cRgstMSBCgyjOBc9FbVME6tRxEeBwp/jEWRI/ixQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE591F80301;
	Tue, 30 Nov 2021 17:31:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF55CF802E0; Tue, 30 Nov 2021 17:31:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D959F800EE
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 17:31:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D959F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KNa1/ptP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 48F98CE1872;
 Tue, 30 Nov 2021 16:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9374BC53FC1;
 Tue, 30 Nov 2021 16:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638289900;
 bh=Hn/gufx2Ts0ISAwRB5X7upcVUqCZvs5DpWa838hs99s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KNa1/ptPw3AaWHCgIxEEItjwrC2O9F9CY6IQUjwCgjYPPEjuJE2uW8XYiyNXUwK0G
 LEZqcQQq+1eV3z+N0Je/hC5stCCiyiSH3NiwX+MYq+pZN9lRKBg8dK/gd9Bx1rFnvW
 aK6y6mxusFsTQRRLFMh1dgA2p8kSTKlNU8J/0ZJnamyN3UNz1eiZjBNXHMZQWo/cWc
 CxXzWnKlKlIq9cyMjSmqAhwRFi+09bQw1nMK4wJPn8mvwbGancriTtuO3kvQB9keId
 obGXMMyH67GDLHZqkZ/8EUiP83HZWm/yjj9wy/YKm9rdYwUiGIO5z1ZgSPtHk+IES6
 TGTJjJ3XwegWQ==
Date: Tue, 30 Nov 2021 16:31:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/4] ASoC: codecs: wcd934x: remove redundant ret variable
Message-ID: <YaZR56MLanjnQH1p@sirena.org.uk>
References: <20211130160507.22180-1-srinivas.kandagatla@linaro.org>
 <20211130160507.22180-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="daY3+6YO0XUW/PY/"
Content-Disposition: inline
In-Reply-To: <20211130160507.22180-3-srinivas.kandagatla@linaro.org>
X-Cookie: Check your local listings.
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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


--daY3+6YO0XUW/PY/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 30, 2021 at 04:05:05PM +0000, Srinivas Kandagatla wrote:
> return value form snd_soc_dapm_put_enum_double() directly instead
> of taking this in another redundant variable.

Cleanups like this should come after any fixes in a series.

--daY3+6YO0XUW/PY/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGmUeYACgkQJNaLcl1U
h9D1Igf+ML51uzuukMaxTAvRykBe6gdAkhbLos/H1FCBvk6bgoM5uedaC2O9DQ5/
01Yr99udo1dL8IacLmCVkaM8XW/W6YL++ZSIi+iNkxFVo7FSmwNY6U3YwWFjUWfs
Nu+w6KtqgF0/qD//ZK9bHhPk2L9OoaBaVTYPVGmDRlJ0mH0t1WUgfiZJaU91vohT
K+4/EMDRcARgZ3j+CQAF4L9uBfCtd5MOYgW5ma1Ep/Hj/iwUdYx7tUZUj1fvhd8e
3GBvU/Yw8bIlUyqPyJ2jQXXb36LjgfpTCtT0MUENYw/aAUIqoY/86hlIzcKWCQ4n
+gDaorzAGYngDZBy5y6tFEVvbi0Rew==
=IFQw
-----END PGP SIGNATURE-----

--daY3+6YO0XUW/PY/--
