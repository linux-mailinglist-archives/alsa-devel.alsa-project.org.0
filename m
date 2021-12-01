Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D769F465448
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 18:50:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 764D72608;
	Wed,  1 Dec 2021 18:49:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 764D72608
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638381047;
	bh=Brk69ITNANm8GtoKP5Z3rUd/O8O8TMXLqjraNs7vWXk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B2DoaUzGIh+RLlUuWfeeH2XPeRdxZiLgqyY9aKveliXSW0LCCaZ3K5ip0mu9xZx+M
	 fL52w9pNrn1nY0patg0CMGtgYZAjBRiPEWApQcT6L4VnF2A8EmE7TqYTV9ijBr/2p6
	 9ZAwKlUt1fMLEsWmZznzic2qEqYlyrjhuq4ZqWVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8FDCF800EE;
	Wed,  1 Dec 2021 18:49:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA892F80246; Wed,  1 Dec 2021 18:49:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE409F800EE
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 18:49:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE409F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b01bWCud"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7730ACE2003;
 Wed,  1 Dec 2021 17:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF970C53FCC;
 Wed,  1 Dec 2021 17:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638380957;
 bh=Brk69ITNANm8GtoKP5Z3rUd/O8O8TMXLqjraNs7vWXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b01bWCud5jDr259w60dEanzC7vuitJxiazlBIf4djq4Qj1kMUl6dCmS/XMhONnSXw
 2s1ywsPWkvXhaXI+bws6DttM4XoYscBGvC3iGLbAKv57kCp70Y/F31hEXwfyUsWt7m
 H15HEZf0MkMo2hur8s12IKc0U+3hpOpx1g4vnr5zPvxVgSANHKRxk6huwF2WDPdRkn
 mKS/RFZHLbs33oe7c8/We4cYd2U+CoFw7eupfyFg8VlYEh4qLI+kc+Vvkp6uKQZYnb
 DoDZK4ILq2kRTpXpWbmHBiI6jbxFXu2FKxjUBmBdJghF1wJeLwK5QFzbwuNsx6JjUl
 SsL+o1Z3qBLuQ==
Date: Wed, 1 Dec 2021 17:49:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Lucas Tanure <tanureal@opensource.cirrus.com>
Subject: Re: [PATCH 1/2] ASoC: amd: Fix dependency for SPI master
Message-ID: <Yae1mPxvy82OfORz@sirena.org.uk>
References: <20211201174307.1399625-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Rl5rCMjYGRvwkRHy"
Content-Disposition: inline
In-Reply-To: <20211201174307.1399625-1-tanureal@opensource.cirrus.com>
X-Cookie: All true wisdom is found on T-shirts.
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Len Brown <lenb@kernel.org>
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


--Rl5rCMjYGRvwkRHy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 01, 2021 at 05:43:06PM +0000, Lucas Tanure wrote:
> Select SPI_MASTER as is using CS35L41 SPI driver

> -	depends on SND_SOC_AMD_ACP5x && I2C
> +	depends on SND_SOC_AMD_ACP5x && I2C && SPI_MASTER

This is a depends not a select (which is good, a select wouldn't be
appropriate here).

--Rl5rCMjYGRvwkRHy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGntZcACgkQJNaLcl1U
h9BPaAf/eSG+AALgRUVHBsCL7mBTlkMMB+SpF0gPhWHYYZb/3RY7ehJmKagYeR1N
79PiIcGmuIRJrgQESqdBva18ZRUKNYCU0pV/QgeUBqYLgoEOUMFLu7C/PN0QTLRO
DxldjkK9419RHw+4MIrUA+JuHCCi9MrsmPl+KhCWShSwNJRVU2HczFxy3nUS2jJB
WApP7Cx5zQDNjQGvKRIRgOO+rrm40h0QRgAjiM2X4RSpwPQyilDFWJPO6snxls3A
rwi/GrKuj/GYz7pQvYaebqwczJYnhdH/v1iNioqHVhLDvzJL/VQ4rdaiFGthAVDa
GOHrisWoarI53pzxugUG7AzBcVWOBQ==
=fKwA
-----END PGP SIGNATURE-----

--Rl5rCMjYGRvwkRHy--
