Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA069148CAE
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 18:02:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CDD51686;
	Fri, 24 Jan 2020 18:02:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CDD51686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579885378;
	bh=UqUy3a8Qu8yfOHlcDpr3NYAGYYppcHiH+BjyYFTbTLs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O3rqON6WbQDL5chmTPqTdnRoDdi1gYnEhDjUI+zt6aqgry09pX1nh6gcgvYTxGLUO
	 JJ51u0G5FGiaQOiZePPJ+18kPuAQJQsEK4EJWQme+/9SGQ+84o2fjIX5LC3U++E1Bw
	 ZUR/PBPqAMxtM0zjLGlyrCNUo326A0JvjCoVeHQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46938F8026F;
	Fri, 24 Jan 2020 18:01:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D43F5F80245; Fri, 24 Jan 2020 18:01:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D1031F80217
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 18:01:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1031F80217
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 761321FB;
 Fri, 24 Jan 2020 09:01:01 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8C5C3F6C4;
 Fri, 24 Jan 2020 09:01:00 -0800 (PST)
Date: Fri, 24 Jan 2020 17:00:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <20200124170059.GB4918@sirena.org.uk>
References: <29db3df4-6f51-7c0f-1eef-90171f1d233a@codethink.co.uk>
 <9a5447e2-155c-7e6e-b8f1-95523c6f42c6@gmail.com>
 <b4a416fb-f2b1-660d-27e3-aebf602178f9@codethink.co.uk>
 <680e2dfd-6f4f-5c96-63b7-97520961dc82@gmail.com>
 <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <9b3a0cdd-34c7-ecb4-4a26-268fd4a63041@codethink.co.uk>
 <26aeb591-e770-5e6a-5ee4-05414ae4ddc6@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <26aeb591-e770-5e6a-5ee4-05414ae4ddc6@nvidia.com>
X-Cookie: Drop that pickle!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
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
Content-Type: multipart/mixed; boundary="===============4252127267644949126=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4252127267644949126==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Content-Disposition: inline


--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 24, 2020 at 04:56:41PM +0000, Jon Hunter wrote:

> Yes that is going to be a problem. I assume that your codec wants a
> 256*fs MCLK? Maybe in that case you are better off having the codec
> drive the bit clock and fsync?

> Is 24-bit critical to what you are doing?

> Otherwise maybe we should drop the 24-bit support for now and just keep
> 32-bit.

Removing the support because one particular board has limited clocks
isn't good - it'd be better to have components with clocking
restrictions impose constraints as needed.

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4rIsoACgkQJNaLcl1U
h9BwLQf+KKkWJLuGXicMjabWZuzPftSubNU2PI7YkuSc1kFDJAvcKRIwKwuVj4Se
qgZrGUwWPyNruy3/LyZ0FxiAwGtAaOv5QngjdAzhpluSHy5ycBAoNw8ord1sFmt6
WU7BkX5rDUqu+ME2KsZLzV5UX2+w0x12QSx1j6TjGDiW6vQYJTyXVj2AZuCbRoYx
KrPdJPuoRM1qjGF/UGnNpoJ5vN4kzv8vRitbtAxOXT6ryMpUiVJWO8QlT2YlA3b3
oJQ3OkrkseWWEI6UBddvxA0jkhDa44K5A4blwt67ueTpvBT4Sw3AvnpFWsJhpHNF
VmXdypoMjQN21oIX3cAb3W6ph8ZudA==
=G/Sk
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--

--===============4252127267644949126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4252127267644949126==--
