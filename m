Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1253167DDC
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 14:01:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7733816DB;
	Fri, 21 Feb 2020 14:01:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7733816DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582290117;
	bh=wthlmQuSDesDNf0pY3CqpQQSDqKog1orGLVznIKggrk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sxDoryJrSeZL9AFFpzHDmK78Xc0Y7QMCVHQRj7VlsZ2HenfCH+oXbo6zkiq/3tQan
	 VNoLIhtZ74mMEx1jUrqccI8djqMUcLXzP3n4lN+sZWtyXyfJzdSgztQVT9Jn7MqmYi
	 7t/RR4QpnFBSjDeF/v+LrrGMUmxD95no05WZXasA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81F81F80273;
	Fri, 21 Feb 2020 14:00:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67A85F8025F; Fri, 21 Feb 2020 14:00:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 7D710F8011D
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 14:00:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D710F8011D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A32E430E;
 Fri, 21 Feb 2020 05:00:07 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 049DA3F703;
 Fri, 21 Feb 2020 05:00:07 -0800 (PST)
Date: Fri, 21 Feb 2020 13:00:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3 03/10] ASoC: tegra: add Tegra210 based DMIC driver
Message-ID: <20200221130005.GD5546@sirena.org.uk>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-4-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2Z2K0IlrPCVsbNpk"
Content-Disposition: inline
In-Reply-To: <1582180492-25297-4-git-send-email-spujar@nvidia.com>
X-Cookie: Dead?	No excuse for laying off work.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, digetx@gmail.com, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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


--2Z2K0IlrPCVsbNpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 20, 2020 at 12:04:45PM +0530, Sameer Pujar wrote:

> +++ b/sound/soc/tegra/tegra210_dmic.c
> @@ -0,0 +1,515 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * tegra210_dmic.c - Tegra210 DMIC driver
> + *
> + * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.

Please make the entire comment a C++ one so things look more
intentional.

> +	/* Below enables all filters - DCR, LP and SC */
> +	{ TEGRA210_DMIC_DBG_CTRL, 0xe },

So this isn't the hardware default?

> +	srate = params_rate(params);
> +	if (dmic->srate_override)
> +		srate = dmic->srate_override;

How does this work for userspace?  If we just ignore the sample rate we
were asked for I'd expect that the application would get upset.

> +	if (strstr(kcontrol->id.name, "Boost Gain"))
> +		dmic->boost_gain = value;

Volume controls should end in "Volume".

> +	else if (strstr(kcontrol->id.name, "Audio Channels"))
> +		dmic->audio_ch_override = value;

This is something that would usually come from hw_params?

> +	else if (strstr(kcontrol->id.name, "LR Polarity Select"))
> +		dmic->lrsel = value;

This and some of the others look like they're describing details of how
the board is wired up so I'd not expect them to be runtime selectable?

> +	SND_SOC_DAPM_MIC("Dummy Input", NULL),

This is just the microphone that happens to be attached, isn't it?  If
so that's a weird name.

> +static const char * const tegra210_dmic_mono_conv_text[] = {
> +	"ZERO", "COPY",
> +};

It'd be more idiomatic for ALSA to write these as Zero and Copy.

> +	SOC_ENUM_EXT("Channel Select", tegra210_dmic_ch_enum,
> +		     tegra210_dmic_get_control, tegra210_dmic_put_control),
> +	SOC_ENUM_EXT("Mono To Stereo",
> +		     tegra210_dmic_mono_conv_enum, tegra210_dmic_get_control,
> +		     tegra210_dmic_put_control),
> +	SOC_ENUM_EXT("Stereo To Mono",
> +		     tegra210_dmic_stereo_conv_enum, tegra210_dmic_get_control,
> +		     tegra210_dmic_put_control),

I'd expect these to be in DAPM.

--2Z2K0IlrPCVsbNpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5P1FQACgkQJNaLcl1U
h9BA2Af/VZiFzp4MoCq6aYyxTqN++XhNykseNkA914Q2unjc80Do1s4RvyBiVMMC
wBE6BBamgXepZrzc9ZWbWkzZfVELsrMSoQd7vM/fhpf9tGek5CWS6vpJH2RvB4v+
O9C3WID4h/y+P9Hhk1wfqW76BDWm/iU3qlSc+TOwsV1pX3DG99lXX91VDg7J5llP
nA0V3PRaJzrhMeIYpNv2O8ZeG6mCYgsUJ3KzgDcqYn25Ry+BlV92ABRPq4jQrere
feW4lb8CKHMkTxj88Y7AmSRbYrqFoztdu9ce9APLVRVnDU9BcvediwEroMXKvGoQ
78AyFutp7288RxEv5Bwa85y4EMQaxQ==
=oc1c
-----END PGP SIGNATURE-----

--2Z2K0IlrPCVsbNpk--
