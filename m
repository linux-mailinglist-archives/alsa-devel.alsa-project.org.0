Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6DB1F7B78
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 18:11:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDC62167D;
	Fri, 12 Jun 2020 18:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDC62167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591978272;
	bh=fw3+y3jTQ/X9e2wxCd6+ulf0I5tMAzgBntQiTxh6tj0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=us06RdEgzfYzb4M30mBTzb/ivDHyWN4sUA4IoTVz0OadqQ4C0p3PsVl2OXMIC87aQ
	 78AaxfOKdeOrqb8inyJTdcnkgqQgIp5ZfKgMkM9NyH0o+pqDrzCPnecsY5ZHtZPrD5
	 6fJjTjfPHwvzniVJ7j2DP7exf6Mt2EG35VWCmrDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E44E5F800CC;
	Fri, 12 Jun 2020 18:09:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73AE9F800CC; Fri, 12 Jun 2020 18:09:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E1F0F800CC
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 18:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E1F0F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vfM5E2k+"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ABDFC20836;
 Fri, 12 Jun 2020 16:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591978165;
 bh=fw3+y3jTQ/X9e2wxCd6+ulf0I5tMAzgBntQiTxh6tj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vfM5E2k+jRvOGx5FUPL2TzrsdL03GrvntWrM9UGRM32rWx0PHS3pshPiudTDVkI5s
 JD6RDgKyF/BmXsCdd24KcBopCMSBxZM7/zM2RFpr7d1SgTe4VL6sNmahb+2fAntQS3
 qpj0aMNN0J+M91nYmruvkYk2w9Z6bE85ulhvmi2Q=
Date: Fri, 12 Jun 2020 17:09:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v3 2/2] ASoC: tas2562: Update shutdown GPIO property
Message-ID: <20200612160922.GL5396@sirena.org.uk>
References: <20200612160603.2456-1-dmurphy@ti.com>
 <20200612160603.2456-2-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IuJpT0rwbUevm2bB"
Content-Disposition: inline
In-Reply-To: <20200612160603.2456-2-dmurphy@ti.com>
X-Cookie: As seen on TV.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com
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


--IuJpT0rwbUevm2bB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2020 at 11:06:03AM -0500, Dan Murphy wrote:

> -	tas2562->sdz_gpio = devm_gpiod_get_optional(dev, "shut-down-gpio",
> +	tas2562->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown",
>  						      GPIOD_OUT_HIGH);

This also changes the name from shut-down to shutdown which will be
incompatible (IIRC we do try -gpio as well as -gpios).

--IuJpT0rwbUevm2bB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7jqLEACgkQJNaLcl1U
h9CZ8wf/d5qODxuDpJv7I7DVUFHsWC+TEvljN5BSeNaWD8YPZp7AGUL7Ayfvc8jv
LHN5Bjt52gLgOGS9Sg8n3bCgI6fh72PPzPJcpV7GeniZx+WWU7nUdN9yz1kouS4H
NPPMG9qaWS2hRFtB7IWEH+DBDTCcNQ/piY8DICO4fzw17JcK1uDec0jk1dila3hx
UozPf3Z/icwZHOvrityv25rWt0V6lStgMJTWntynX/TbCVUzgLgmEbhboo5OqQp8
FdM6CJxkqelIG3SsswJyfGESVZLUpLMDfzwwLuGPvdCEzoKlv7VEX7LyEHFaBVID
1QTPOijQpcapd3GyZ1ziauKed7H2MQ==
=vLSK
-----END PGP SIGNATURE-----

--IuJpT0rwbUevm2bB--
