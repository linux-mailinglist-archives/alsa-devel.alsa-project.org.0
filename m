Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 845A236488A
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 18:51:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE9CF1680;
	Mon, 19 Apr 2021 18:50:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE9CF1680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618851104;
	bh=G6gi9IjvdNZuZmHQ/8XdX7I5tvLU/HvmeSYi0RrlJh0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=otueWiE2Eq9fq8wUZ66kGFxOygED+3Eq3iQ3wLm84OUBeTiXX/sA2K7FznUiA1EbJ
	 1NaB8JCyNNIuYJ6oRVc87Th7PRh8lDTWc0iUHj35kGKxzqBlFp7ZN43oUtDLaRwr3U
	 i/Mk0ThZ40g1vE0a4qKqHIQJs1z2lkvniPr0n4Oo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14D79F80256;
	Mon, 19 Apr 2021 18:50:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5865DF80227; Mon, 19 Apr 2021 18:50:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93ED0F8014D
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 18:50:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93ED0F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rcx8KDUs"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A88B761157;
 Mon, 19 Apr 2021 16:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618851001;
 bh=G6gi9IjvdNZuZmHQ/8XdX7I5tvLU/HvmeSYi0RrlJh0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rcx8KDUspMsnso4SdE1irJBmyMVW7dUsAzNGrCdhztyAh6zSGvQ+OBZnC3lN0GJHt
 qEwW9ZWHLbsHa4dam13PWxl7QXF8uB+wODR89NOHKFhDxIemDicY8AeuKOkyWh29tF
 9HLNuvoN1WHTvQ9wnf98rwWlvw6RNmQHrHU1HtKNdgbT6HyL5tXhy+LYYTQM5UNGOM
 e6RIHQf258ClL/BSuOsOJSIiozY5sFXD0ZmsRbOz9s8h3jaMP1I2JpM7hnU+q14S3g
 IbTM+OTTpC2Za3bWZVZ+CvWB2wr1xIJYTjZc4N6GA6wR9LVApPlmLAC9m9DC8RbxOa
 YdFBYd6QkAOvg==
Date: Mon, 19 Apr 2021 17:49:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [v6 2/3] ASoC: Add Rockchip rk817 audio CODEC support
Message-ID: <20210419164936.GD5645@sirena.org.uk>
References: <20210419155718.17348-1-macromorgan@hotmail.com>
 <SN6PR06MB5342B0506101902E4889B335A5499@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="76DTJ5CE0DCVQemd"
Content-Disposition: inline
In-Reply-To: <SN6PR06MB5342B0506101902E4889B335A5499@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Cookie: I will never lie to you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 heiko@sntech.de, devicetree@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 lee.jones@linaro.org
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


--76DTJ5CE0DCVQemd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 19, 2021 at 10:57:17AM -0500, Chris Morgan wrote:
> Add support for the Rockchip rk817 audio codec integrated into the
> rk817 PMIC. This is based on the sources provided by Rockchip from
> their BSP kernel.

Reviewed-by: Mark Brown <broonie@kernel.org>

--76DTJ5CE0DCVQemd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB9tJ8ACgkQJNaLcl1U
h9COQwf9E3C8jlYIm7wGEcFotmudBgIWSQEkeJ9fvGuyz5NgjBU2HPyJG3r2XMeG
Q16qzMuSYLrcmKp9UKL+I04sRxmbF6CVUhwmz4qwkB+KXo1XncQgxe/U9r21kvsx
egbsEcowqE8efCYXQPaGKQfT1V/YgSSzWUaDmbv09RzZ6i0OuVTrMQsmZoOmVtqH
yoBTdNLvTCNGJ7fRqeuvWzP5K4CCyxA+pO3Z0qMGLJx6GzKBrol6CY92Bp7boqOm
InC+F/7hBtgQgjL8tzojOl+MMh2j067ICSQYcfr/rfxuA4Pb07/gJuZZA8HzV9mg
Et4oE70z2RXFXMzbzesIPIW3wUGq4g==
=7Sjc
-----END PGP SIGNATURE-----

--76DTJ5CE0DCVQemd--
