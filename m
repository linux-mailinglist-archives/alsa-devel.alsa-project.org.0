Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FDB40C5D6
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 15:02:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E59E1838;
	Wed, 15 Sep 2021 15:01:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E59E1838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631710969;
	bh=PgDil3PrTalF6yA+yZogCpSrTsKqXjtMoVFDkSYgyHM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qj/vXPRAhXOY7hV+oq69RI6lGwy+RNeDm41xprlJkMwCNBt/S9WA35wywzsNDKWQk
	 8z1Bz2GBHeHD8VXoQG49xytHei3hMrfRUhRYcEmIZRUV+WY5mkjKG9GZi8qA25yK+Y
	 eDQIP23Ra3i88hN8CBeA3AH+PErb/BnNZ46hEEmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF2A8F802E8;
	Wed, 15 Sep 2021 15:01:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CE74F8027C; Wed, 15 Sep 2021 15:01:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B915F80117
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 15:01:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B915F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pOdpoAoA"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81C3E61359;
 Wed, 15 Sep 2021 13:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631710882;
 bh=PgDil3PrTalF6yA+yZogCpSrTsKqXjtMoVFDkSYgyHM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pOdpoAoAedQgwV7/v3uMXRDTnAmBaH2GP4FlWC6XEs2/aimgrYyThPf+yhrHYhXby
 YB0eHN4DYhOg3gRJdl4D9AlfjShmO+XQBuvvXC9DoNQ0zo8T3/1kTTRopjLkG9KMxB
 rlXrH1U5KkffDF1k2o3ZN0y2+LyNRw5leU/Pc1WNCRyTXU+uwmVAoxFzwMuLzdUyft
 3Jq/GLC6fzvsMPJ7qUh2K6qaauVPz5ZFo+Kebq0FmPEwURf98UVvCCnuLHYAWVfvuk
 23fsnmDFx07PfzdHGfHc6JZ8qh0CtHvKjWeeiPQYHuOhcNCo61VJJ6BlK8ftOOPZOs
 1lkutHeK6kYDA==
Date: Wed, 15 Sep 2021 14:00:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 04/12] ASoC: SOF: imx: imx8: Bar index is only valid for
 IRAM and SRAM types
Message-ID: <20210915130041.GG5389@sirena.org.uk>
References: <20210915122116.18317-1-peter.ujfalusi@linux.intel.com>
 <20210915122116.18317-5-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RDS4xtyBfx+7DiaI"
Content-Disposition: inline
In-Reply-To: <20210915122116.18317-5-peter.ujfalusi@linux.intel.com>
X-Cookie: Absence makes the heart grow frantic.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, daniel.baluta@gmail.com,
 pierre-louis.bossart@linux.intel.com
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


--RDS4xtyBfx+7DiaI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2021 at 03:21:08PM +0300, Peter Ujfalusi wrote:
> i.MX8 only uses SOF_FW_BLK_TYPE_IRAM (1) and SOF_FW_BLK_TYPE_SRAM (3)
> bars, everything else is left as 0 in sdev->bar[] array.
>=20
> If a broken or purposefully crafted firmware image is loaded with other
> types of FW_BLK_TYPE then a kernel crash can be triggered.

This is a fix which should have been at the start of the series.

--RDS4xtyBfx+7DiaI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFB7nkACgkQJNaLcl1U
h9Aw+wf+NNYDOdcxqk2Cp1jY8eBn6CRJ8XpZGNl10iAZkqJkt6CJ+uZhXVEJxk59
dDFBPlX4cnS7b4vi/CvcjHsrk+Z9Edw8gSRwqm1cIZ3aonLxHFd4C3h4/nMeVHO2
YpKyXl/cijgskP3e20sLleZ+lV0/2fwvdRVRTMNniSQAc+Sqzqdim3dRX72LxMai
A0DKMdMTYjR4kpotjvO3Pmgmz43Yq+pM6Pj1nAuP16zY44VLetd785YDXrQ9WNaa
UVyfUuVybbdW5d5rqDg50stvKCVmzVO82Mz1ovyGwHJ0M1gXE47srPqDTfs6Ql5T
OgFZf3ngH3fRMvc6FOzqbqsMCy8SoA==
=Gyob
-----END PGP SIGNATURE-----

--RDS4xtyBfx+7DiaI--
