Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1DE34066B
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 14:07:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A7C1168C;
	Thu, 18 Mar 2021 14:07:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A7C1168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616072875;
	bh=VgEbkxDe/Ni1XYsCFfPwPgfebGgfLVht1qc6/VMNhps=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vUYRi990ASYSg/WuNB9FSYqOKr6QT8bPx6bfJI+QCOra9sfywUULgrPhACU0lJkwQ
	 2V9oZEuLI4m2JHSrA6BQSYdEhfCdyTOlnJ/IoD+HfiPIoRo5E2VfsyydKq3xucW7HO
	 QySJ/aP9gno4yp06oaliYrhAVDVGlP6OdnEvE2xU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEAFAF80171;
	Thu, 18 Mar 2021 14:06:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 41DD7F80165; Thu, 18 Mar 2021 14:06:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB7D3F800C8
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 14:06:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB7D3F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RL2qvoyo"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F104564E20;
 Thu, 18 Mar 2021 13:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616072774;
 bh=VgEbkxDe/Ni1XYsCFfPwPgfebGgfLVht1qc6/VMNhps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RL2qvoyoWFS+L3XSHA+4mfDaLnODPgFTfVvJxFp21WXLAr6OqiKuv5Qbq4CDJSN0t
 wzWVwICAe1Zs//QZFncGt9HfayaocxIjdYZt5kvY/HVNbvFpQIde6gwiJsS5LGB5n/
 xIKqgL49cEFzL3BUcyIXhK7jFj7evSML3IQrQT48v6pBynLMB9UHQ15Mq3i0CXlvKX
 NKDowKGkDG3woubk9TR/A8Jn+DetPZPR9XSy9/sywZY6BNv7Ye31JMrLX+oEcNVfpM
 fXVbtwbjv1WKwlah8DJwdB1Gw7+l/dLwZpcLsS4U+8CO1ALprXn4RD3Pc+ARyRqomM
 GpOWlfN9sFPVw==
Date: Thu, 18 Mar 2021 13:06:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v4 1/3] ASoC: Add Rockchip rk817 audio CODEC support
Message-ID: <20210318130610.GF5469@sirena.org.uk>
References: <SN6PR06MB534267976CCAB77E25EF10A9A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nYySOmuH/HDX6pKp"
Content-Disposition: inline
In-Reply-To: <SN6PR06MB534267976CCAB77E25EF10A9A56A9@SN6PR06MB5342.namprd06.prod.outlook.com>
X-Cookie: You are false data.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com
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


--nYySOmuH/HDX6pKp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 17, 2021 at 03:21:15PM -0500, Chris Morgan wrote:
> Add support for the Rockchip rk817 audio codec integrated into the
> rk817 PMIC. This is based on the sources provided by Rockchip from
> their BSP kernel.

Modulo the issue with the compatible in the binding this looks good
apart from a couple of small nits:

> +static int rk817_set_component_pll(struct snd_soc_component *component,
> +		int pll_id, int source, unsigned int freq_in,
> +		unsigned int freq_out)
> +{
> +	snd_soc_component_write(component, RK817_CODEC_APLL_CFG1, 0x58);

This should really validate freq_in and freq_out, confirming that
they're whatever fixed values this register sequence is for (if you
don't know what freq_out actually is it's more OK to skip that than
freq_in I guess since the constraints on the DAI link should ensure we
end up with a sensible value).

> +	snd_soc_component_write(component, RK817_CODEC_APLL_CFG2, 0x2d);
> +	snd_soc_component_write(component, RK817_CODEC_APLL_CFG3, 0x0c);
> +	snd_soc_component_write(component, RK817_CODEC_APLL_CFG4, 0xa5);
> +
> +	return 0;
> +};

No ; at the end of the function definition.

--nYySOmuH/HDX6pKp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBTUEEACgkQJNaLcl1U
h9C8xwgAgt6+ZfaYHkGDCtLfwwdm1PnMQCePIBymbqDRV/yuqlyyxLqqExLPl/eV
R46iINMly13jwNvISMMkc/GmInlanBAyOJ+qx2sIE2i0ZoJ1rZcDG3dE9kn31LAf
1bMx1o+QZyulsmDDHWl1KwjoONuNxM32fBi70YcM30t/kW3yvvn3x7BJCTi4waVp
PzQmRyPgH0eW2NbcYsikPOXw87sNo5TfQOJg07W5vAmG813uRICcDVMd2DmLsS4H
Uz265UmIByV4PpvxQ5bmsaOTpnVcrK/JAFSEwQQuRMxidD6owwjxSeFSeql/oee9
sE7vzoamh7JslrZfWPW4tE8VXQ+TTA==
=LQ8R
-----END PGP SIGNATURE-----

--nYySOmuH/HDX6pKp--
