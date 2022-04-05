Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 530A04F3668
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 16:03:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9E7D1849;
	Tue,  5 Apr 2022 16:02:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9E7D1849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649167406;
	bh=GnA4g+UKLIMkvGQrZKHeAzi6hA8riPDDqpGJ82LWMrY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NtsaFSOyHuulZnUZDnkEotmnYWx3s/VAqvFXs8U3J3fuxgF10jmsNBWFusS/UeAab
	 qXd19s+vUjk11k+5BPVONSODlVvwdGpugYTlItY8u+kMfMMKauHGcxZOb9RrgB1Q5P
	 qySFqDfRg+jV/1w6NURs1VZVTlxm4BWfNxq53CuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 658FAF800D1;
	Tue,  5 Apr 2022 16:02:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6BCBF800D2; Tue,  5 Apr 2022 16:02:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EAA1F800D2
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 16:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EAA1F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AC7aTD5q"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6B86BB81BA9;
 Tue,  5 Apr 2022 14:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE28CC385A0;
 Tue,  5 Apr 2022 14:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649167340;
 bh=GnA4g+UKLIMkvGQrZKHeAzi6hA8riPDDqpGJ82LWMrY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AC7aTD5qXCiOV2jQ4INX8R997tlTCfw4NaWwJZaUG2m71xbmRqn20+4f33P1EMtIM
 CACxKPCze5Ca7q7bHtDSXIfX3vymH0PfaQNx1kjpAXR6C8Sr9TeNfmSTs/6stLomSN
 7giE49Wb3ZC3L+m4Fa6pW0NLs+2doUE8IM3zc691TbF5+RuPbBslQ/OaxD0eE+dP7y
 k/rB+EMwN16DJWXLxrmRopZNNw4zJUhDjaiViI5cB87Z8oW/xZi63hDOEW3UswFJMi
 8S17kqQs4Q7t11tN1RvdNWIBazsyF5V2DlEV2ainUQiQVsgR8p19/YnOisygiN8tei
 rPyQ9ucNpyVgQ==
Date: Tue, 5 Apr 2022 15:02:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhu Ning <zhuning0077@gmail.com>
Subject: Re: [PATCH] ASoC: codecs: add support for ES8326
Message-ID: <YkxL51j8E11u0uV/@sirena.org.uk>
References: <20220405131220.1149-1-zhuning0077@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BMbLmEImQ6t4Ji2F"
Content-Disposition: inline
In-Reply-To: <20220405131220.1149-1-zhuning0077@gmail.com>
X-Cookie: diplomacy, n:
Cc: Zhu Ning <zhuning@everest-semi.com>, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com,
 yangxiaohua <yangxiaohua@everest-semi.com>, tiwai@suse.com
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


--BMbLmEImQ6t4Ji2F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 05, 2022 at 09:12:20PM +0800, Zhu Ning wrote:

> The ES8326 codec is not compatible with ES8316 and requires a dedicated driver.

This looks mostly good - a few things below but nothing huge that should
require big restructurings or anything.

> +++ b/sound/soc/codecs/es8326.c
> @@ -0,0 +1,753 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * es8326.c -- es8326 ALSA SoC audio driver
> + * Copyright Everest Semiconductor Co., Ltd

Please make the entire comment a C++ one so things look more
intentional.

> +#include <linux/clk.h>
> +#include <linux/gpio.h>

The driver doesn't actually seem to use the GPIO APIs?

> +	/* The lock protects the situation that an irq is generated
> +	 * while the previous irq is still being processed.
> +	 */
> +	struct mutex lock;

It doesn't seem to, it seems to protect registrations and
deregistrations from racing against each other?  The actual interrupt
handling doesn't use it.

> +	SOC_SINGLE_TLV("ADC Analog PGA Gain", ES8326_PAGGAIN_23, 0, 10, 0, adc_analog_pga_tlv),

Control name should end in Volume - see control-names.rst.

> +	regmap_write(es8326->regmap, ES8326_CLK_CTL_01, ES8326_CLK_ON);
> +	/* Two channel ADC */
> +	regmap_write(es8326->regmap, ES8326_PULLUP_CTL_F9, 0x02);
> +	regmap_write(es8326->regmap, ES8326_CLK_INV_02, 0x00);
> +	regmap_write(es8326->regmap, ES8326_CLK_DIV_CPC_0C, 0x1F);
> +	regmap_write(es8326->regmap, ES8326_CLK_TRI_0E, 0x00);
> +	regmap_write(es8326->regmap, ES8326_CLK_VMIDS1_10, 0xC8);
> +	regmap_write(es8326->regmap, ES8326_CLK_VMIDS2_11, 0x88);
> +	regmap_write(es8326->regmap, ES8326_CLK_CAL_TIME_12, 0x20);
> +	regmap_write(es8326->regmap, ES8326_DAC_MUTE_14, 0x00);
> +	regmap_write(es8326->regmap, ES8326_ANA_LOWPOWER_19, 0xF0);
> +	regmap_write(es8326->regmap, ES8326_SYS_BIAS_1D, 0x08);
> +	regmap_write(es8326->regmap, ES8326_DAC2HPMIX_25, 0x22);
> +	regmap_write(es8326->regmap, ES8326_ADC_SCALE_29, 0x00);
> +	regmap_write(es8326->regmap, ES8326_ADC1_SRC_2A, es8326->mic1_src);
> +	regmap_write(es8326->regmap, ES8326_ADC2_SRC_2B, es8326->mic2_src);
> +	regmap_write(es8326->regmap, ES8326_HP_CAL_4A, 0x00);
> +	regmap_write(es8326->regmap, ES8326_DAC_DSM_4D, 0x08);
> +	regmap_write(es8326->regmap, ES8326_DAC_RAMPRATE_4E, 0x20);
> +	regmap_write(es8326->regmap, ES8326_DAC_VPPSCALE_4F, 0x15);
> +	regmap_write(es8326->regmap, ES8326_HPJACK_TIMER_56, 0x88);
> +	regmap_write(es8326->regmap, ES8326_HP_DET_57,
> +		     ES8326_HP_DET_SRC_PIN9 | es8326->jack_pol);
> +	regmap_write(es8326->regmap, ES8326_INT_SOURCE_58, 0x08);
> +	regmap_write(es8326->regmap, ES8326_INTOUT_IO_59, 0x45);
> +	regmap_write(es8326->regmap, ES8326_RESET_00, ES8326_CSM_ON);
> +	snd_soc_component_update_bits(component, ES8326_PAGGAIN_23,
> +				      ES8326_MIC_SEL_MASK, ES8326_MIC1_SEL);

This looks like some or all of it is doing routing which would normally
be configured from userspace using controls - the ADC1/2 sources and
DAC controls jump out for example.  Some of it like the pullups might
make sense fixed, or as DT properties like the jack detect polarity is
here, but not all of it.

> +#ifdef CONFIG_OF
> +static const struct i2c_device_id es8326_i2c_id[] = {
> +	{"es8326", 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, es8326_i2c_id);
> +#endif

This should be unconditional, the ifdefs should be around
es8326_of_match instead.

--BMbLmEImQ6t4Ji2F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJMS+YACgkQJNaLcl1U
h9B7qwf/cq6HuiiTZKmhMZSKZf1xbCh016wpsRV1XD42vdtGkRxxohv6oZXcbKLK
OrE15UZsZaeztO5QYa/gM0Rw1ecX/FoqcWTDuOUfd5HyAAzQw67l9Z+bce6LiVwJ
BLK4B8p39hrQ6tmeGthaijLtcceBj9wL3sV4Fi7Lpg5lwHjn1QVn8AXidy+RO6y3
WkDZi8h5/HlHcs12IE2Pyf8YoewekHLrWKMq6UYtJqGvjVUgLcZrjzXc6WIsDQ5e
4PT5P4o/+jxS4RBBQG6uoYBZ+BtdN3J+shWNTtHTfoNHEQUlTQVFq+SNJr+2KLdj
/2fnx9yiYSn6cGk/jXDJpnY/7ixpDA==
=YJm8
-----END PGP SIGNATURE-----

--BMbLmEImQ6t4Ji2F--
