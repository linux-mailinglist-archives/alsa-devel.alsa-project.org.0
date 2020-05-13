Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 934341D1981
	for <lists+alsa-devel@lfdr.de>; Wed, 13 May 2020 17:34:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ECE11663;
	Wed, 13 May 2020 17:33:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ECE11663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589384086;
	bh=C/N9FIfCZHMh9EGxSyQqk1iZZmo+/7mzHg2e3Ia0L1w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=roCahauqW9AXcSvufA589N3MSXwlM6yDZkpBaMKjmUBrETWj6WTMZKh0ul+ElsJqC
	 jyQWcgr+erEoMDChQtJYtXnRzTO5wOvPJiR5FQIWUsl6IGgMHmGe7W4bqM8txGiWwi
	 3UkND6GVY3H58InS3truCwpu/yP6AWr3Az3jVKBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CB16F8022D;
	Wed, 13 May 2020 17:33:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 856DCF80247; Wed, 13 May 2020 17:32:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6F72F800BD
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 17:32:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6F72F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="n+9kSdXR"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 45EF520671;
 Wed, 13 May 2020 15:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589383966;
 bh=C/N9FIfCZHMh9EGxSyQqk1iZZmo+/7mzHg2e3Ia0L1w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n+9kSdXRBx0dDZtEKjZGv+Ow0KyRX21TIcUGnkTr1KCuxteg0DhsOusf2FJrjyKp1
 YyHEYc/jYpi7s3nxCpF3LuZpjY8K1BilGi2VUQlNmoaNN3/QQbdvsyAOEwtZy1oruu
 fc0to2v+l7mTA4oAkS2STP57F8VP99saKHxtXRQc=
Date: Wed, 13 May 2020 16:32:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] ASoC: tlv320adcx140: Add controls for PDM clk and edge
Message-ID: <20200513153243.GO4803@sirena.org.uk>
References: <20200513144746.14337-1-dmurphy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gqEssfNGWsEa4HfM"
Content-Disposition: inline
In-Reply-To: <20200513144746.14337-1-dmurphy@ti.com>
X-Cookie: Long life is in store for you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--gqEssfNGWsEa4HfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 13, 2020 at 09:47:46AM -0500, Dan Murphy wrote:

> +static const char * const pdmclk_text[] = {
> +	"2.8224 MHz", "1.4112 MHz", "705.6 kHz", "5.6448 MHz"
> +};
> +
> +static SOC_ENUM_SINGLE_DECL(pdmclk_select_enum, ADCX140_PDMCLK_CFG, 0,
> +			    pdmclk_text);
> +
> +static const struct snd_kcontrol_new pdmclk_div_controls[] = {
> +	SOC_DAPM_ENUM("PDM Clk Divider Select", pdmclk_select_enum),
> +};
> +
> +static const char * const pdm_edge_text[] = {
> +	"Negative", "Positive"
> +};

Are these (especially the clock and polarity) things that are going to
vary at runtime?  I'd have expected these to come from the hardware
rather than being something that could usefully change.

--gqEssfNGWsEa4HfM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl68ExsACgkQJNaLcl1U
h9AYXwf8CDQMAxRVDvKQhd4vXEmLmaggMSdkYS9R7GwjxYhFwSWmXTNjDbM2lgot
uBF+G/YhxOy96eCpN+DenbicG+no7Vu/JmzeyrlPGVH7Oks9mdENb63rvnLjnyLg
GWM3GCrqbCwEN2IWbuQvytenhGLwliYh8tFSSoEk/y7nhc0n8uVHK+ifBnBk3sBs
8Hs4KO+LIP+Q2DOjSJmTmbbNrZY8X5nIYtMdvbLPNSYSjAsutzCFlMi151V514sP
f0Ui1rhafy5ekQkFRZRCrPjs6Zg4MtMmYN245ROgnuD/UuPi6g1ZSnzohkXB9A3g
JP04uB7C/9qlvOJkktKcLRWEhifElA==
=Ts3k
-----END PGP SIGNATURE-----

--gqEssfNGWsEa4HfM--
