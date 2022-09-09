Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D085B4172
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 23:28:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F01916B5;
	Fri,  9 Sep 2022 23:27:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F01916B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662758880;
	bh=u0Nh9TSTVTuxdZWi8Dbgj9aIebrzI0l3cSRsCgLMXIk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b+yQWB5O63qrsltRQfbMciRClyqz7Fp7cu3kZdIVpY63Vc5m3X1syYLHle08kXDVc
	 6VvwShOgw7/hS+7Mb1e6vOSpsVW338gawEXSnxCDOpWBucE4yci4UbvY+jUDNs8msk
	 4BMxepLOluR3ls6DIJM9WiOVkj3eCrIHb+yQx+zc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B017F8011C;
	Fri,  9 Sep 2022 23:27:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC684F8023A; Fri,  9 Sep 2022 23:27:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BC98F8011C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 23:27:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BC98F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WvvJcbkZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2663EB82627;
 Fri,  9 Sep 2022 21:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81DBC433D7;
 Fri,  9 Sep 2022 21:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662758822;
 bh=u0Nh9TSTVTuxdZWi8Dbgj9aIebrzI0l3cSRsCgLMXIk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WvvJcbkZ/tG3EaIqrWFPvzsk5M34BxgnN+Eh+8UUkwXmfAium6lM9+kCrqCYiikjr
 dK747TwvDbux3CcinsBpx+wF08lzMzQF6oMs2cSxD8PCP9m3wCBoDjyRdFTbfM2emT
 o5jeHMbAjrsM3gcvNBniW2ZAxqoXim2ZKYni9Ge0S5mJ+6PO1sVnDqSQmaxW0shDoJ
 gBdLuHLyCjofEBUnhRY4nWVo2exWF15IDNWz9JywMbrnay1IFnOQV9V5XJjkyiogdW
 HoUMQur0TyUQ1VMKb/xEU84hfpt++PAn7jSPEhgi1RhJDAuHT0gN+JpwRyhS10kocZ
 cjdiY7IU+6mxg==
Date: Fri, 9 Sep 2022 22:26:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Yu Zhe <yuzhe@nfschina.com>
Subject: Re: [PATCH] ASoC: mediatek: mt6359: fix platform_get_irq error
 checking
Message-ID: <YxuvoTEXIshOy+C7@sirena.org.uk>
References: <20220909064511.22343-1-yuzhe@nfschina.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gGLklRiEh69K2ySa"
Content-Disposition: inline
In-Reply-To: <20220909064511.22343-1-yuzhe@nfschina.com>
X-Cookie: May all your PUSHes be POPped.
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, liqiong@nfschina.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
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


--gGLklRiEh69K2ySa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 09, 2022 at 02:45:11PM +0800, Yu Zhe wrote:
> The platform_get_irq() function returns negative error codes on error,
> fix the checking.

This doesn't apply against current code, please check and resend.

--gGLklRiEh69K2ySa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMbr6AACgkQJNaLcl1U
h9Bf9AgAhvx/rf91KwlZu2N+8PgTsgM42+GZFA6dK9i2ML+gdMa5aYMUlrsQ1phE
fDgTHlDCuRzu4v93hZldk3WCpHvYYs4yoA6Tbx6d6VbQ6xnsyR/gT5FNlcuyRPN2
Nydc7LMN7uPP22r+8IlzVK0LaPj5x7rSW7G6csoFgHw3C/2VgPUjOBE2N97xs6kw
RdLU5tCIrKRvhSlVgCaVrMe/mCNAHqoXY7BTCv6nowNfdQ1gfCwrzcJAh6bfrYH1
FWI60cRcGnYyCyZNeG2bn7ZEG2/zv6nMXxAIqhJXnNnJNd5K6dzaBS7Q3M/3sFsz
kKKEzwz9vszxXeeI9vzy0QbT9dv18A==
=s1Us
-----END PGP SIGNATURE-----

--gGLklRiEh69K2ySa--
