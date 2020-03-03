Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C791776E7
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Mar 2020 14:23:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D2161686;
	Tue,  3 Mar 2020 14:22:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D2161686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583241784;
	bh=XB238MXEfH8xpKZt76KZ0NzhaYG/4J/KJ091QcUfRwA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gZpqhRqp9v5x1P8zIGBXZhyBRNVpLt3vJImFeBoYRVjIJiXeNLePCi2At0fEuTHRy
	 u/qkAD9vdS9J3ZohVf1lrUS3UhT3GyVmU1Sq99lKYjnYN9N9Qw7rtU9nKhD5hjqwKP
	 4MxWTMOZaZEfF5EfeTu5ty67eLV6/a50LtoROTyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A714BF80266;
	Tue,  3 Mar 2020 14:21:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11835F8025F; Tue,  3 Mar 2020 14:21:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 741E5F80131
 for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2020 14:21:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 741E5F80131
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B1D8FEC;
 Tue,  3 Mar 2020 05:21:16 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E33803F534;
 Tue,  3 Mar 2020 05:21:15 -0800 (PST)
Date: Tue, 3 Mar 2020 13:21:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 1/3] ALSA: pcm: Add a standalone version of
 snd_pcm_limit_hw_rates
Message-ID: <20200303132114.GF3866@sirena.org.uk>
References: <20200223034533.1035-1-samuel@sholland.org>
 <20200223034533.1035-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7mxbaLlpDEyR1+x6"
Content-Disposition: inline
In-Reply-To: <20200223034533.1035-2-samuel@sholland.org>
X-Cookie: Drilling for oil is boring.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ondrej Jirman <megous@megous.com>, alsa-devel@alsa-project.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
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


--7mxbaLlpDEyR1+x6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 22, 2020 at 09:45:31PM -0600, Samuel Holland wrote:
> It can be useful to derive min/max rates of a snd_pcm_hardware without
> having a snd_pcm_runtime, such as before constructing an ASoC DAI link.

Takashi, are you OK with me taking this patch?

--7mxbaLlpDEyR1+x6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5eWckACgkQJNaLcl1U
h9Ducwf/YF/9IryVmRNLlQXZGWZvKAI5ANfSxt6KxrXJelsiOzPqfIIwJARt5zer
SIOmcAciTHMHaIcr577bM0h9o0GocGU0Ugr9xJimGbIkHkkV8vVP5FvEG5BzDmzq
+HXwIbriuIB/ya21VXYghWnFqlLtWnaqAPm+pjGJRdwNglphNYgz+YOO/Rg7VMhp
5LmuTTeNsEW3ZkOzsVUHE5/Dzv5k4KOGd0IXd6mnNZ/elE03NgVTNinYZTYVFF2c
wjylTL3Lj2LAq5glbu2Jkm5DIEY/9LsB3PlYwiHVwcl/cgSfU5b+pz6oE/r2ezmT
COhEOZGW3psRcCnqHaxjrsTwfYhNEg==
=terh
-----END PGP SIGNATURE-----

--7mxbaLlpDEyR1+x6--
