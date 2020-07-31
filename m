Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01348234A68
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 19:44:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 855431667;
	Fri, 31 Jul 2020 19:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 855431667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596217463;
	bh=1RBJrByuU1/4YwH7R7c4LoRXyjsSYMzkPBOWevrI01g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pQAKGWzlr1HqtROoKbyTyHokbIJE6GQnOWB0pAcj+0U1LHm9tZcNO026Q35PGz/5o
	 8ghEgCtAxRINWMkH/67+pFFhY///xWMxWEA/jJ0gq2Rym9KojE7Vns6SR4zlp8wtIN
	 kc5NqgzOjMKRYI2BsJGvBPqz/SyZA+iN2Wk/npX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 941E3F8015C;
	Fri, 31 Jul 2020 19:42:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B825BF80171; Fri, 31 Jul 2020 19:42:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC7E1F8015C
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 19:42:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC7E1F8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1Gn+rYBx"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1620D2083B;
 Fri, 31 Jul 2020 17:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596217348;
 bh=1RBJrByuU1/4YwH7R7c4LoRXyjsSYMzkPBOWevrI01g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1Gn+rYBxy/1RR7v0EzwvHkDTLU3XQqh+OPCnvh/csSGj/3+GWe+7hjTF+3qa4xilB
 Xy7aqJY5CtRnyLrJA6QcmvjxrgpO6op0Q2fVH0eaomPAFXnf0nsDUOQwnblR33tvTc
 CoAEdiePSFluw00g8kTPlbfIHXYbOWeXwcp1X1sk=
Date: Fri, 31 Jul 2020 18:42:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: core: restore dpcm flags semantics
Message-ID: <20200731174207.GC4510@sirena.org.uk>
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
 <20200729154639.1983854-1-jbrunet@baylibre.com>
 <2ad13f95-434d-376a-bc38-b209623b461e@linux.intel.com>
 <1jft998jbe.fsf@starbuckisacylon.baylibre.com>
 <936d6e37-0ad0-b0d7-814a-1ace12087746@linux.intel.com>
 <20200730185229.GH5055@sirena.org.uk>
 <1j7duj98wk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Content-Disposition: inline
In-Reply-To: <1j7duj98wk.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Some optional equipment shown.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Liam Girdwood <lgirdwood@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 zhangn1985@outlook.com, linux-amlogic@lists.infradead.org
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


--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 31, 2020 at 02:16:43PM +0200, Jerome Brunet wrote:

> One last thing I'd like to understand. Is this behavior of throwing an
> error going to applied to the non-DPCM case as well ? so at least thing
> are consistent between both cases ?

> IOW:
>  * An error is now throw if dpcm_capture is set on the link and the CPU
>  DAI support playback_only

We should definitely complain about that.

>  * on non-DPCM links, will an error be thrown as well if playback_only
>  is not set and the CPU on the link happen to not support capture ?

I think we should move towards not needing to do that for DPCM.

--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8kV+8ACgkQJNaLcl1U
h9B67Af+MxqJXiRcEr3b1wsfZYNzZAmN8zNYmZH8ubxUHrcXWUMDl5SAjY/+aEMq
JL+V4yKWh6qgn0fB5NoCNak05vKjZ12E3RpBZu7zN5q620XE3DXC45b+2pv91DCn
FBVrTazkRYfe2IOp2odw47F5Mfnd4x4yfiTuIgGgolmmC8uXeTIZ5TIUGzrPwKoX
aZESOyB5mglx21aMK4JqHah0Lo/fzYIxjdejoAG2yClR11CdHKgPxI6JQA6+/FQr
17Xx+Xd2pd4rhdOIJ91Shgmd5jIyroODzlU3k7PIiNPGeCMP7MlzwUv6ehBOPUGU
n+e6KyufvWAE7FCqi86jv6GQFhguPQ==
=9eeM
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--
