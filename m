Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CACC143E108
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 14:31:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2673A1699;
	Thu, 28 Oct 2021 14:30:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2673A1699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635424265;
	bh=0IyHeV0L08KxqGj2Yi4V76DmhaAi20BHj3eWpXmjuSc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DkfxH5C0dDeZY5KyCztbdM7uKnCDSqoo3uWBZanKAeQBkszoarOSvElsnqAQl9uCw
	 1dxYOtAM+BpHA143h/8t80zIwCr1zke2Uvk8D2Wy92//42J9Zb8Ci1yUICMFMJX9og
	 piyMymoq2bxHJDUCj3kPv/pYG5jmE/+tGrwdMxmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6827EF8014E;
	Thu, 28 Oct 2021 14:29:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3D00F802C8; Thu, 28 Oct 2021 14:28:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BE02F8010A
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 14:28:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BE02F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BPtm2gf6"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A28E610CA;
 Thu, 28 Oct 2021 12:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635424122;
 bh=0IyHeV0L08KxqGj2Yi4V76DmhaAi20BHj3eWpXmjuSc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BPtm2gf6ueNW4PwQim7p7pYHbw1vohTXjCquTE2CXOEdA7saNvRjaRHPiYer91bzW
 GKazsdh1TA8kb9OhaSQbzFZXIp0RLzdrR2D1oeibRXMWmU4LfHQZ4B/7m1/nRa7/7N
 fs4NjX2fMDRIj/oxke/iNXJfm9Jv4XEV6jeVt4YRaG3wThFWzisY2gRbwmEUO/NdxU
 YLbhLRQR0I1Fipgx/4GQd2nRcdRAixMkWgGukGIZft1pdCzsG2QXLGtqZoPO+hIEQQ
 wCZQuX3gYFqG+P7spK25lmGMHP04ZeiE/mToZxo6/+y+iBmJXB88oacFZM4po+W79n
 jzWTQlaNv1qlw==
Date: Thu, 28 Oct 2021 13:28:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH RESEND] ASoC: fix unmet dependencies on GPIOLIB for
 SND_SOC_DMIC
Message-ID: <YXqXdV0YC5BhEARB@sirena.org.uk>
References: <20211027184835.112916-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DdE/G2GeDUUSa88j"
Content-Disposition: inline
In-Reply-To: <20211027184835.112916-1-julianbraha@gmail.com>
X-Cookie: try again
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 fazilyildiran@gmail.com, tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 Vijendar.Mukunda@amd.com
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


--DdE/G2GeDUUSa88j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 27, 2021 at 02:48:35PM -0400, Julian Braha wrote:
> When SND_SOC_AMD_RENOIR_MACH or SND_SOC_AMD_RV_RT5682_MACH
> are selected, and GPIOLIB is not selected, Kbuild gives
> the following warnings, respectively:

I can't seem to find any indication that this has been sent before...

--DdE/G2GeDUUSa88j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF6l3QACgkQJNaLcl1U
h9DjMgf+NZ1xB5WHfg/qE5AWTWl3sQk/3x1QHEWf9GvEbnabN53Q4mI2Gl8BruND
Bo2jUu7e6Gk8QCBqRbPG4QBtq3E6Kp8iU5COhvwfII/YtUI48hF673+VWe5zUN/V
bGzv/5PCMHq9z4ExbSV/fRYjgWpGBundZfnkj8+NzgrzRh4LOLJz4tksc4I3oNzk
HucsQHqL/nJ4D4UG+b+mR/jHWf0BOarTY+/yY/VLUGRNV+ndAkTecPXEUucDxn5A
Zc04LducScKdd4oOBzXhF5jhdhdJNGiIMXu+byUbxbTBwwjwz7W3vYFflbPufIWF
lxLueOIx0+F4BIGUeUCVguCPfpF6Sg==
=zRlM
-----END PGP SIGNATURE-----

--DdE/G2GeDUUSa88j--
