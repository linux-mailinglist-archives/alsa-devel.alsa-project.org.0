Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FCDA4ECD9
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Mar 2025 20:09:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4C0F6031C;
	Tue,  4 Mar 2025 20:09:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4C0F6031C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741115381;
	bh=iTsLrzXmNE6ewCyusYOdWQ/qVtARPaI4u/GWKkxxFvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=puGkeiD9gEVmqy+4Cej+Wo+yqLfqTOYbaPOQzclqm7430r7HNt+INQxYRrVHX8RpU
	 E1HVdMwIJbgg72BkrtsjMMolXm0t7jT/A03emjhc2c0WFCU48vzGofqU10YIU4ehCp
	 CGkBM+OHCkuAln1+F95gL3VAU6EqSGiMBtAzjpx8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78E7CF805C1; Tue,  4 Mar 2025 20:09:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4550AF805BA;
	Tue,  4 Mar 2025 20:09:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D847F8051F; Tue,  4 Mar 2025 20:08:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14829F8001D
	for <alsa-devel@alsa-project.org>; Tue,  4 Mar 2025 20:08:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14829F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ik+QyPl3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8D1CEA45C87;
	Tue,  4 Mar 2025 19:03:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CD6C4CEE5;
	Tue,  4 Mar 2025 19:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741115334;
	bh=iTsLrzXmNE6ewCyusYOdWQ/qVtARPaI4u/GWKkxxFvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ik+QyPl3mFK3GTSkTqm+wIY6RI5U1X2lWxHps+fFzh2yOJ14+d1Pz0veM/Bn27PYx
	 0yorqpHrl0TQtMOui1s16eIyPEWGSaNqQua8athSUA0s7PXn/yr1eXvSFmYbjFs8Ib
	 EOv1cwDi2Pkk96UsMeZOjH0S9m8SG61cUpLgtfLVf70SgfmAPVtMLNgmYnLdFnI5mY
	 vVzcsQ13LEetUgv0l/Tw77OBP7MFKMBfJwf8MJlaSmPpNvoddMrb/r/EXpZ1xasb+l
	 Ur5TbUA6QjFmLT4IKyTzve1mypAt9NE0tx3qrBH69tVm3rip6XwonvIuF1TqFkVaEK
	 Udfjf2+5s7KyA==
Date: Tue, 4 Mar 2025 19:08:49 +0000
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, tiwai@suse.com,
	amadeuszx.slawinski@linux.intel.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 1/2] ASoC: codecs: add support for ES8389
Message-ID: <683f5b2b-3583-442a-8d98-28bbbcf90d1e@sirena.org.uk>
References: <20250304114751.54635-1-zhangyi@everest-semi.com>
 <20250304114751.54635-2-zhangyi@everest-semi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PYMSt5sabbE7jsCR"
Content-Disposition: inline
In-Reply-To: <20250304114751.54635-2-zhangyi@everest-semi.com>
X-Cookie: Do not disturb.
Message-ID-Hash: AGHTTURV5DH6GZ5R45CDKUQZEJ7ANS3R
X-Message-ID-Hash: AGHTTURV5DH6GZ5R45CDKUQZEJ7ANS3R
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGHTTURV5DH6GZ5R45CDKUQZEJ7ANS3R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--PYMSt5sabbE7jsCR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 04, 2025 at 07:47:50PM +0800, Zhang Yi wrote:
> The driver is for codec es8389 of everest which is different from ES8388

> @@ -0,0 +1,961 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * es8389.c  --  ES8389/ES8390 ALSA SoC Audio Codec
> + *
> + * Copyright (C) 2025 Everest Semiconductor Co., Ltd

Please make the entire comment block a C++ one so things look more
consistent.

> +	if (es8389->dmic == true) {
> +		regmap_update_bits(es8389->regmap, ES8389_DMIC_EN, 0xC0, 0xC0);
> +		regmap_update_bits(es8389->regmap, ES8389_ADC_MODE, 0x03, 0x03);
> +	} else {
> +		regmap_update_bits(es8389->regmap, ES8389_DMIC_EN, 0xC0, 0x00);
> +		regmap_update_bits(es8389->regmap, ES8389_ADC_MODE, 0x03, 0x00);
> +	}

We also had the DMIC mux, is that useful as a runtime control when we
have firmware data telling us if there's a DMIC?  Can both a DMIC and
analog input be present in the same system?

It does still look like a lot of these settings might be things that
should be user controllable...

> +	ret = device_property_read_u8(codec->dev, "everest,adc-slot", &es8389->adc_slot);
> +	if (ret != 0) {
> +		dev_dbg(codec->dev, "adc-slot return %d", ret);
> +		es8389->adc_slot = 0x00;
> +	}
> +
> +	ret = device_property_read_u8(codec->dev, "everest,dac-slot", &es8389->dac_slot);
> +	if (ret != 0) {
> +		dev_dbg(codec->dev, "dac-slot return %d", ret);
> +		es8389->dac_slot = 0x00;
> +	}

set_tdm_slot()

Please don't ignore review comments, people are generally making them
for a reason and are likely to have the same concerns if issues remain
unaddressed.  Having to repeat the same comments can get repetitive and
make people question the value of time spent reviewing.  If you disagree
with the review comments that's fine but you need to reply and discuss
your concerns so that the reviewer can understand your decisions.

> +	if (!es8389->adc_slot) {
> +		es8389->mclk = devm_clk_get(codec->dev, "mclk");
> +		if (IS_ERR(es8389->mclk))
> +			return dev_err_probe(codec->dev, PTR_ERR(es8389->mclk),
> +				"ES8389 is unable to get mclk\n");
> +
> +		if (!es8389->mclk)
> +			dev_err(codec->dev, "%s, assuming static mclk\n", __func__);
> +
> +		ret = clk_prepare_enable(es8389->mclk);
> +		if (ret) {
> +			dev_err(codec->dev, "%s, unable to enable mclk\n", __func__);
> +			return ret;
> +		}
> +	}

Making the use of a MCLK depend on the configuration of a TDM slot for
the ADC seems *very* unusual, what's going on there?

--PYMSt5sabbE7jsCR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfHT8AACgkQJNaLcl1U
h9D7VggAgCUCy3r0SZpAyeJcxz5cqr7stWTZdLnQVpbtH0Nu+u9cGAVBSmIFLHoP
WVgSA64gPWQOJpfOT343p5YfTmz66IomnBHbQhrgGdcaZskxyHmxksA2zWsD5iJn
N7oi9D415Yfl12cvCymuWcI7pEJl99sm3xaMvq2YRrAMOpNkEKrLYETpY/uoIpu9
0JcFsU7ulq2/4myCITQ1lP9NIXMmozS3bFFbu4tU8D//BMiVtXQTDeT4hnIJADAN
dOGos/2O4qEJ27HV67eAtQgaf0EboOlpeTbmMSc7d608SygmgLRnpkKT5X64eckj
IobExlZr+Q561sBbHvTtfImWjaEWGQ==
=ngUN
-----END PGP SIGNATURE-----

--PYMSt5sabbE7jsCR--
