Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 504153BEC67
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 18:38:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CACC3167D;
	Wed,  7 Jul 2021 18:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CACC3167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625675930;
	bh=wC1t42xqWGR0RBPg6A/QyuiDHZS2a+3Q6OIeA/572BU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QVHll2OVzVWB0FT+0KyuurNLwlkUZhkBC0NwG3TvtmP9HpsaSHpfjCybF6nyNuaaD
	 OgFdDQIUjVoEYoBcpqbdrBnK1ev0wgAvdKVgokN1BfjqRRDldyVv0nVYqnsNhbPU7h
	 wMo781k4X37fAfLiRWRrbCDU4WipPtJusi0bNJgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93D32F804E7;
	Wed,  7 Jul 2021 18:35:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01378F804E0; Wed,  7 Jul 2021 18:35:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 810B0F804E1
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 18:35:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 810B0F804E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LoFsrlWl"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00DF761CCD;
 Wed,  7 Jul 2021 16:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625675739;
 bh=wC1t42xqWGR0RBPg6A/QyuiDHZS2a+3Q6OIeA/572BU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LoFsrlWlJB19jNSBTDCnly/dtCrjarMSikpPrNi/demCkZs5tBR72NUMmbj+RUEz7
 Yb7Pua10fb9XZKk+FRB3miS2GvCB9QZLalrrWVlzqIpIIA/EnVkNcI3e7+nrhUiHZS
 ciRa3EneQicv9o/3Igf5XJlnEdgs6KJ5pxvejEuwU8h8j3tEB7tHAxOIrCG1jRvG6p
 d9BGX2sw7YI1oMFPZWppiDYGLG0PC0Y5XWudKL3SP37nQRRLCsfBtZajFCy8ri+srC
 Zc5X/VXfX4ylnlOU+gnNBt0EP/cb9Hg9PVyUUFWpbkcJ01343ToAf0YH55NlVWYLxf
 NccjmLr0mPhNg==
Date: Wed, 7 Jul 2021 17:35:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <vijendar.mukunda@amd.com>
Subject: Re: [PATCH 09/12] ASoC: amd: add vangogh i2s dai driver ops
Message-ID: <20210707163507.GI4394@sirena.org.uk>
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
 <20210707055623.27371-10-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YZVh52eu0Ophig4D"
Content-Disposition: inline
In-Reply-To: <20210707055623.27371-10-vijendar.mukunda@amd.com>
X-Cookie: I will never lie to you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Alexander.Deucher@amd.com
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


--YZVh52eu0Ophig4D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 07, 2021 at 11:26:20AM +0530, Vijendar Mukunda wrote:

> +	mode = fmt & SND_SOC_DAIFMT_MASTER_MASK;
> +	switch (mode) {
> +	case SND_SOC_DAIFMT_CBS_CFS:
> +		adata->master_mode = I2S_MASTER_MODE_ENABLE;
> +		break;
> +	case SND_SOC_DAIFMT_CBM_CFM:
> +		adata->master_mode = I2S_MASTER_MODE_DISABLE;
> +		break;
> +	}

As part of moving to more modern terminology it'd be good to move to
_DAIFMT_CLOCK_PROVIDER_MASK and associated constants (with a similar
change for the driver local constant) - see f026c12300 (ASoC: topology:
use inclusive language for bclk and fsync).

--YZVh52eu0Ophig4D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDl17oACgkQJNaLcl1U
h9AGwAf+PFey2i5kbYJ5CSOWJMW6PdybzvDUculaxKRphsGDic7OZk42xdyt2XzO
uraai+eNmVN+w9gpt+i1XAH8GPsmjzTWpB7QHGy8DWulldVFORxf9amqM9FVjKuF
L3mm58KZ62FFU3Ubrk/c79hfVToGGP4cAEC2jMW7+VLQYZ4boQYu4MiMynQkqt1X
kCtPm9CEtvcEGivIxFaCXtZQDmCAvP12TmR2dVVmjmOtubSbsyupiLy7PtsBtAud
ayN2859J3wztUuUUrGp3j6oXKmYL6MOF/m2tszsJAUBbeULDLuETuS23oNCIDX+u
nMadzz2vMFjZ9FMdocrT+xfISQEyIA==
=XEl9
-----END PGP SIGNATURE-----

--YZVh52eu0Ophig4D--
