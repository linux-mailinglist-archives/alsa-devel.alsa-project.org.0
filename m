Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 248D964298B
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 14:39:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BC8F1840;
	Mon,  5 Dec 2022 14:38:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BC8F1840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670247563;
	bh=bekCWIrDwJwNJDJTYD0aY310Agll7BI3ZChFgpmI5KY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TPeMTiUyyd6CPbVE0zzMNa5eOcygCauUOyjQVF/LpCUzVgrqqVJ3J1+RXhTRuA9od
	 msiSO9hje5oAUAXOBzWgnuoPH3a/BkdO0mDvnUcwSMugTjOne0CwZkcGSCGZ41NH3d
	 hA6zwmR5OcEQkyhWizAgttn3g37PKrQvE5n3LKXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20FFBF8047C;
	Mon,  5 Dec 2022 14:38:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AF7EF80236; Mon,  5 Dec 2022 14:38:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EDDCF8014C
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 14:38:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EDDCF8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="S45yVKvt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7C5A5B810A5;
 Mon,  5 Dec 2022 13:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 264DCC433D6;
 Mon,  5 Dec 2022 13:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670247501;
 bh=bekCWIrDwJwNJDJTYD0aY310Agll7BI3ZChFgpmI5KY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S45yVKvtI/1zr/G9DWLq+IHfh4MZvFeMUCqgxFSwqnWZNgzNtaE1rI8b8Mh8OdENc
 z9MeXaFGGtwDEcHo/O9MLAMbpfjV4b4wn0hiXcFDV3n35kdoECHNfXox5u5RYH4hk4
 qcgCe0uBUdS409fcbqWC3XbEw+oTg6VGjvNeQf0T05sdFNWnqReh2wvO+mgQkhUMG9
 kx/6FlCoM1+OLixBCiFAonzpFMnMbq9RtzyrcS7cws0VBKdiHBuke651RyQvX3aRkc
 HCSUJr/R90X3T3+LGUzSnFAoihWR2EN2j3OR0/d9BpSZpUssWZ8A58ue/FIOxuGQ7d
 K1ca4EHdLvKkg==
Date: Mon, 5 Dec 2022 13:38:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: Drop Jee Heng Sia
Message-ID: <Y430RlENo2cjtl2r@sirena.org.uk>
References: <20221203162144.99225-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="XKB8a64cbKHYLz9M"
Content-Disposition: inline
In-Reply-To: <20221203162144.99225-1-krzysztof.kozlowski@linaro.org>
X-Cookie: If it ain't broke, don't fix it.
Cc: devicetree@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dmaengine@vger.kernel.org, "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>
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


--XKB8a64cbKHYLz9M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Dec 03, 2022 at 05:21:43PM +0100, Krzysztof Kozlowski wrote:
> Emails to Jee Heng Sia bounce ("550 #5.1.0 Address rejected.").  Add
> Keembay platform maintainers as Keembay I2S maintainers.

Acked-by: Mark Brown <broonie@kernel.org>

--XKB8a64cbKHYLz9M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmON9EUACgkQJNaLcl1U
h9A33gf/b2Cog2bcg/VPxxlK5WyJaOySjZs31TN8cqPq2zwUIu7qOCxgsixtw4s8
/W6JP2IZC6GOKJay/Pq+EDrhFqkXghjYx7jI4K8JnL/EYb2J+VBAZ1d6GG2ixSd5
j911bMTNDkVFwV2rgCOyIrJBJ24jcy0E8SFuE97IjZBmgDYGtNyEWCouUVvpGcgM
0eCmv8Hmr4nWnj5Jz9TLsBpiRsH7GewlOHsJgpQJP21yPOKT1IDjWqslSZrVu1dY
8Fid5N2IX7DnmGOnhaEr4cCCAUWjmgp/sUQvPnjpPNbPWSbx2d8hIKi8DVDobfkR
a9Dls3HHAM0nh7/HWkaQq4j0gW6/NA==
=+Wfw
-----END PGP SIGNATURE-----

--XKB8a64cbKHYLz9M--
