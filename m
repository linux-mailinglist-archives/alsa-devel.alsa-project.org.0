Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CB947C3F2
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 17:38:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADEA71744;
	Tue, 21 Dec 2021 17:37:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADEA71744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640104726;
	bh=/2QdsJ4aOSotVXYGkHkh4VCzzsPM9XdShE24gwxfsOM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KE3lIaj7JN7iYQKinoTAc4CqXNtFhfxRjPThnQdOO5rw9QilBAnD8fCppriwx6uc6
	 FWJ7reiuei4rKoC9GMQjUZyWetvg/HqOUArYaFDrwOmf4Nh0SgV/Si6FyCyGRQifAs
	 kGOQ00bQSMtM62N8Z625z9xHWlezc2T0s8stq3kU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D1DBF80125;
	Tue, 21 Dec 2021 17:37:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F4DBF80118; Tue, 21 Dec 2021 17:37:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC6F4F800B5;
 Tue, 21 Dec 2021 17:37:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC6F4F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CC9cG3lB"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B5A86163F;
 Tue, 21 Dec 2021 16:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41791C36AE9;
 Tue, 21 Dec 2021 16:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640104648;
 bh=/2QdsJ4aOSotVXYGkHkh4VCzzsPM9XdShE24gwxfsOM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CC9cG3lBfzZoWTVa7wFP2d+F9Tx6CZ6YQ5MPhtoBIi4WcvQtiwNjcXFJ3MpMPvwdX
 bY+Tea8P842ynpBqEZKGwupW4Pj6fY/yt+jP3B4REtzTKxGlFPbpUV8RLXkI7lQ/oI
 9AzPnl87SsFIzqTulVIcjwcXWe9SWnsACTUrqehshDdbFhAfRuS9TX/9+7MjnpGPkf
 DH7yK7N7X/BdaS2eFNFPR1CyrcwhXB3fqYoQX+g9TzXSIyEkb9E8ohvuAFAWHSjPoQ
 NCfmkCPUq9+wEGKj3OpNGFlKvGCpJihiu3GQG5oPw3olD3N5O2TvZWHyaSCAU2jHId
 moAs8Rta0UTbA==
Date: Tue, 21 Dec 2021 16:37:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Subject: Re: [PATCH 1/3] ASoC: SOF: AMD: simplify return status handling
Message-ID: <YcICwuOpBjuDNipC@sirena.org.uk>
References: <20211221161814.236318-1-AjitKumar.Pandey@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="J7/dWMoLwRCr9/a+"
Content-Disposition: inline
In-Reply-To: <20211221161814.236318-1-AjitKumar.Pandey@amd.com>
X-Cookie: knowledge, n.:
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Basavaraj.Hiregoudar@amd.com,
 Ranjani Sridharan <ranjani.sridharan@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vijendar.Mukunda@amd.com, Alexander.Deucher@amd.com,
 Takashi Iwai <tiwai@suse.com>,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
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


--J7/dWMoLwRCr9/a+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2021 at 09:48:07PM +0530, Ajit Kumar Pandey wrote:
> Just return 0; on success.
>=20
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@intel.com>
> Reviewed-by: P=E9ter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---

You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--J7/dWMoLwRCr9/a+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHCArwACgkQJNaLcl1U
h9Bnkgf/R8VlhUYZw6VQS/5uDmJ/934PiphVvshWFpwsNAtInZRH2cmASDgUM495
6Xp4uSX4fn/NlNjQuRbuRWIWrO8/+c9cIMRugogtFNsYHrfj7nVdUdEu1Hi4KwnP
kRWyTIaf+ESCBnvgLbk+6Bvy4/3sc3Vb5z1H9HtZoFkG8RCNDTKk5p0IqdSsf2Ub
sqtQ1XY6eHbNtWnYszt8yr2bSzhyYqebzjKcfFIUxw4GpTtlxaXPBIV1l/104nca
CyurCNiv8u3mFx9hWiNa/4LnpbAMYEPgUK5QaIsIf50b+tOSBaiYTmRdBbsBeB7t
HZQITiJKyI2xYhR/q0i9IApJtS5Dqg==
=GxDx
-----END PGP SIGNATURE-----

--J7/dWMoLwRCr9/a+--
