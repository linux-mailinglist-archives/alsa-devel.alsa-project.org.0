Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A4C1FF05E
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 13:16:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73F731763;
	Thu, 18 Jun 2020 13:16:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73F731763
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592479016;
	bh=UT1FJJxUaRXffXu0wgBanfwio7zzEycd0uxbxe6JEGo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KuHeC3P5ScTCLAIg0y5Yxbc/ZQP4DBHlFpBJQbPZbqu8ubbrkeRHAAkNMvDpfKrQR
	 fjrQjoyfjHQyP2svpHI8AG2WGnynVnnwhWHqIivA1DFBuyXGWO9klzIgzl0UOEqG7j
	 3U8zKEbxguWaAqxmp9YjuNYfQHRmmqI9aFPz8iRU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D154BF80323;
	Thu, 18 Jun 2020 13:09:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E595F802DD; Thu, 18 Jun 2020 13:09:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76344F801EB
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 13:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76344F801EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O6AbxAxV"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20E432078D;
 Thu, 18 Jun 2020 11:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592478544;
 bh=UT1FJJxUaRXffXu0wgBanfwio7zzEycd0uxbxe6JEGo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O6AbxAxVMZkzeQcITMO7bEfBb4kIhp9PTFNFNgAc4qhLrDgrpkqLK6tKJpW5dTQMD
 k/kgEkreTaWYFBvkQKCz+EiMpIyWIQyGcYCy2mEjUrLjnNS9Wwhr7ategYfDtrlPiD
 QLwnP8C+fMOR3ZEpjIG1GeBM64tB1CYr+WFQn+MY=
Date: Thu, 18 Jun 2020 12:09:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: codecs: Added MAX98373 Soundwire Driver
Message-ID: <20200618110902.GE5789@sirena.org.uk>
References: <20200617163015.16809-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tVmo9FyGdCe4F4YN"
Content-Disposition: inline
In-Reply-To: <20200617163015.16809-1-pierre-louis.bossart@linux.intel.com>
X-Cookie: Androphobia:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Ryan Lee <ryans.lee@maximintegrated.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org, vkoul@kernel.org,
 Naveen Manohar <naveen.m@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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


--tVmo9FyGdCe4F4YN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 17, 2020 at 11:30:15AM -0500, Pierre-Louis Bossart wrote:

> +static void max98373_read_config(struct sdw_slave *slave)
> +{
> +	int value;
> +	struct device *dev = &slave->dev;
> +	struct max98373_priv *max98373 = dev_get_drvdata(dev);
> +
> +	if (!device_property_read_u32(dev, "maxim,vmon-slot-no", &value))
> +		max98373->v_slot = value & 0xF;
> +	else
> +		max98373->v_slot = 0;

The DT bindings need updating to add SoundWire support.

> +	/* L/R mix configuration */
> +	regmap_write(max98373->regmap,
> +		     MAX98373_R2029_PCM_TO_SPK_MONO_MIX_1,
> +		     0x80);
> +	regmap_write(max98373->regmap,
> +		     MAX98373_R202A_PCM_TO_SPK_MONO_MIX_2,
> +		     0x1);
> +	/* Set initial volume (0dB) */
> +	regmap_write(max98373->regmap,
> +		     MAX98373_R203D_AMP_DIG_VOL_CTRL,
> +		     0x00);
> +	regmap_write(max98373->regmap,
> +		     MAX98373_R203E_AMP_PATH_GAIN,
> +		     0x00);

I'd expect these to be chip defaults, especially the volumes.

> +	/* Speaker enable */
> +	regmap_update_bits(max98373->regmap,
> +			   MAX98373_R2043_AMP_EN,
> +			   MAX98373_SPK_EN_MASK, 1);

I'd expect this to be managed via DAPM.

> +/* SPDX-License-Identifier: GPL-2.0-only

AIUI this needs the trailing */ on the same line for the license
compliance people.

--tVmo9FyGdCe4F4YN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7rS00ACgkQJNaLcl1U
h9Di3Qf8DQNux1KS2yuLr/ffoHzaXRDOAckEwJcvAFTzUGbe9McgoIR16RjFrhSK
DgVlBwvvko7JodCtABJV15X9jstt81uGqvafldT3btmKO2w9qWiTAoxc7BAtLFM1
1/h+5GS8As/7rhtRH9Tnc95R4kqLWOoYgy0So72w6opCG51tPiNdM3NKKUJoXFM/
ndeVmRZElkqQ9tXoOnE0lPX9BMDk+wDmpnmFLeRUec7dHqkIh5QcN4/3tbuo2eM1
VJfvaXkgM50O7FgxNdm0Qs39RenEAEZgXHA9sZxQOhqmWILoIo91QSuYUT+Pbz2u
6lpR3n5N5/kAsVb8eywW0Kyjj5jUNQ==
=KT6p
-----END PGP SIGNATURE-----

--tVmo9FyGdCe4F4YN--
