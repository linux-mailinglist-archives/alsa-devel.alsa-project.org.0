Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBFB5FEDF9
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Oct 2022 14:24:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 878A366C2;
	Fri, 14 Oct 2022 14:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 878A366C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665750272;
	bh=opCSM6SmwEXXy81XxgCiHIRAX7jERw0sRlnq6ZysCP8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b0ToFXsAFkEMpP2IeK69nxLhRBvuXNiSPM6WxIDvlfJnoVAwrBYqn5CY/KDw9ZR1j
	 37rdfMi+CQ4YKZRA8aLrswHpwWqt3Wg7DiMVkhLbA4kvbxwFqwrSlijGqSmrGe0DEX
	 jK63/Jgr42rlkiINhb1tpmNCndTxbblxL3uH9/9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2A31F801EC;
	Fri, 14 Oct 2022 14:23:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1B06F80224; Fri, 14 Oct 2022 14:23:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4AEAF801EC
 for <alsa-devel@alsa-project.org>; Fri, 14 Oct 2022 14:23:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4AEAF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mjJ+enQb"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 19A2861B16;
 Fri, 14 Oct 2022 12:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723E5C433C1;
 Fri, 14 Oct 2022 12:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665750206;
 bh=opCSM6SmwEXXy81XxgCiHIRAX7jERw0sRlnq6ZysCP8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mjJ+enQbW9TnWdjb3oJaHBD6RoX7wLURWXKXxLiCa/MZxEX1r5jBtlkY2ORXb8a2X
 ITjqtYQZ7WdEtjVY8s//vXlmwvFYGsiGRbFhf4hEyldBCpUtjYm6YwpIVTE+aMmkmR
 l+lTZ72fDMDH2K3edklSJI+kU1wGae4aMQDs2jpmiLNzXFPO+qf2XmnfT9ifrWxlDQ
 MDGbq97IwwuGztP80lX1/Y2mmhbeMpyvquW6xxbyo7DvJ8iAbDsgTf8sHuv3RtScZa
 r4sdIvzFblIjmKXJG55S47K3HbDL6dt1yJ8znKt4dvUyZm29F7LEDhpbrDH26fSGyz
 Rw55wNMAsPN7g==
Date: Fri, 14 Oct 2022 13:23:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
Subject: Re: [PATCH 4/6] ASoC: samsung: fsd: Add FSD soundcard driver
Message-ID: <Y0lUuK0V8qVnr+LW@sirena.org.uk>
References: <20221014102151.108539-1-p.rajanbabu@samsung.com>
 <CGME20221014104904epcas5p4f458182cc9ac9c223d9a25566f3dd300@epcas5p4.samsung.com>
 <20221014102151.108539-5-p.rajanbabu@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Co4Q+wAEW5EdCUvd"
Content-Disposition: inline
In-Reply-To: <20221014102151.108539-5-p.rajanbabu@samsung.com>
X-Cookie: There's only one everything.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rcsekar@samsung.com, aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 alim.akhtar@samsung.com, linux-kernel@vger.kernel.org
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


--Co4Q+wAEW5EdCUvd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 14, 2022 at 03:51:49PM +0530, Padmanabhan Rajanbabu wrote:

> +++ b/sound/soc/samsung/fsd-card.c
> @@ -0,0 +1,349 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ALSA SoC Audio Layer - FSD Soundcard driver
> + *
> + * Copyright (c) 2022 Samsung Electronics Co. Ltd.
> + *	Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>

Please make the entire comment a C++ one so things look more
intentional.

> +	if (link->dai_fmt & SND_SOC_DAIFMT_CBC_CFC) {
> +		cdclk_dir = SND_SOC_CLOCK_OUT;
> +	} else if (link->dai_fmt & SND_SOC_DAIFMT_CBP_CFP) {
> +		cdclk_dir = SND_SOC_CLOCK_IN;
> +	} else {
> +		dev_err(card->dev, "Missing Clock Master information\n");
> +		goto err;
> +	}

We're trying to modernise the langauge around clock providers, please
use that term rather than the outdated terminology here.

> +	if (priv->tdm_slots) {
> +		ret = snd_soc_dai_set_tdm_slot(cpu_dai, false, false,
> +				priv->tdm_slots, priv->tdm_slot_width);
> +		if (ret < 0) {
> +			dev_err(card->dev,
> +				"Failed to configure in TDM mode:%d\n", ret);
> +			goto err;
> +		}
> +	}

Just set things once on probe if they don't depend on the configuration,
it's neater and marginally faster if nothing else.

> +	if (of_property_read_bool(dev->of_node, "widgets")) {
> +		ret = snd_soc_of_parse_audio_simple_widgets(card, "widgets");
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}
> +
> +	/* Add DAPM routes to the card */
> +	if (of_property_read_bool(node, "audio-routing")) {
> +		ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}

Just fix the library functions to handle missing properties gracefully,
every card is going to need the same code here.

--Co4Q+wAEW5EdCUvd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNJVLcACgkQJNaLcl1U
h9CvIgf/SAQ8DRxcD5wyuIRH7gQqZTjvWFCF4H6llSklkqzQZj83G/C8GylQqjhN
jrtgCtomymyJdlg83NY44CxMxDH4VQAVAp54N88D2AZFaxYruFasSR3MgnpdfWrX
of1VocuEnjeFu1wyBl2GZVh/yfc3ITDMtaSd3ogwwtMGCi8IOBD1fkVd/lgc9gs/
eOFEAlIsBA5jcD5PFPXjCDAHerOLxJxAnYuv5WQ1G6mnRcos8Lrb2A6hhoSn/Qed
yb9A6MoZ7oagUm2AHQd/XL9UDbmmWz+te2WGLltWPz4WkxWMtu5ySrjiE/uhD9TU
IriKVezxcSSpWV2/YbvZ5NFYwtLCvQ==
=NM3V
-----END PGP SIGNATURE-----

--Co4Q+wAEW5EdCUvd--
