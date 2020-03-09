Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2E317E058
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 13:34:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59E4D166D;
	Mon,  9 Mar 2020 13:34:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59E4D166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583757297;
	bh=VLSxHv8anoy7mlzYMdzndVwqFAu/E3RgobpgCmTpea0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MO0CVsene9ENVoXQw3skMmMZ9RM+yzAzJdCqmEulsZTWQZd1S978d8w1A3m2ZhriM
	 Q5zxNVAhrbftFq5tayhwgzoQ0F0yl9RuIQ/G+WhCDQ8wpRTk6dnAlsdiVgamnY3Chw
	 2THxUHInjFShkTvnAnXPOsdcA/HwaxHcafkOxaws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 573CAF800B5;
	Mon,  9 Mar 2020 13:33:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 104B0F801EB; Mon,  9 Mar 2020 13:33:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 04FB5F80123
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 13:33:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04FB5F80123
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F3AB30E;
 Mon,  9 Mar 2020 05:33:09 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 972473F6CF;
 Mon,  9 Mar 2020 05:33:08 -0700 (PDT)
Date: Mon, 9 Mar 2020 12:33:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Kevin Li <kevin-ke.li@broadcom.com>
Subject: Re: [PATCH] ASoC: brcm:  Add DSL/PON SoC audio driver
Message-ID: <20200309123307.GE4101@sirena.org.uk>
References: <20200306222705.13309-1-kevin-ke.li@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VdOwlNaOFKGAtAAV"
Content-Disposition: inline
In-Reply-To: <20200306222705.13309-1-kevin-ke.li@broadcom.com>
X-Cookie: Above all things, reverence yourself.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Scott Branden <sbranden@broadcom.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Takashi Iwai <tiwai@suse.com>,
 bcm-kernel-feedback-list@broadcom.com, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-kernel@lists.infradead.org
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


--VdOwlNaOFKGAtAAV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 06, 2020 at 02:27:04PM -0800, Kevin Li wrote:
> This patch adds Broadcom DSL/PON SoC audio driver
> with Whistler I2S block. The SoC supported by this
> patch are BCM63158B0,BCM63178 and BCM47622/6755.

Please number patches within a series when you send it -
submitting-patches.rst should cover this.

> +++ b/sound/soc/bcm/bcm63xx-i2s-whistler.c
> @@ -0,0 +1,328 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * linux/sound/bcm/bcm63xx-i2s-whistler.c
> + * BCM63xx whistler i2s driver

Please make the entire comment a C++ one so things look more
intentional.

> +static int bcm63xx_i2s_set_fmt(struct snd_soc_dai *cpu_dai, unsigned int fmt)
> +{
> +	return 0;
> +}

Remove empty functions, if the framework prevents removing the function
entirely that's a sign that you need to do something.

> +static int bcm63xx_i2s_startup(struct snd_pcm_substream *substream,
> +			       struct snd_soc_dai *dai)
> +{
> +	unsigned int slaveMode;

Please use the kernel coding style.

> +	struct bcm_i2s_priv *i2s_priv = snd_soc_dai_get_drvdata(dai);
> +	struct regmap *regmap_i2s = i2s_priv->regmap_i2s;
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		regmap_update_bits(regmap_i2s, I2S_TX_CFG,
> +				   I2S_TX_OUT_R | I2S_TX_DATA_ALIGNMENT |
> +				   I2S_TX_DATA_ENABLE | I2S_TX_CLOCK_ENABLE,
> +				   I2S_TX_OUT_R | I2S_TX_DATA_ALIGNMENT |
> +				   I2S_TX_DATA_ENABLE | I2S_TX_CLOCK_ENABLE);
> +		regmap_write(regmap_i2s, I2S_TX_IRQ_CTL, 0);
> +		regmap_write(regmap_i2s, I2S_TX_IRQ_IFF_THLD, 0);
> +		regmap_write(regmap_i2s, I2S_TX_IRQ_OFF_THLD, 1);
> +
> +		regmap_read(regmap_i2s, I2S_RX_CFG_2, &slaveMode);
> +		if (slaveMode & I2S_RX_SLAVE_MODE_MASK)
> +			regmap_update_bits(regmap_i2s, I2S_TX_CFG_2,
> +					   I2S_TX_SLAVE_MODE_MASK,
> +					   I2S_TX_MASTER_MODE);
> +		else
> +			regmap_update_bits(regmap_i2s, I2S_TX_CFG_2,
> +					   I2S_TX_SLAVE_MODE_MASK,
> +					   I2S_TX_SLAVE_MODE);

Setting master or slave mode should be done with a set_fmt() operation
but your set_fmt() operation was empty.  How would this be configured?

--VdOwlNaOFKGAtAAV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5mN4IACgkQJNaLcl1U
h9CHFQf+MmfeIV26USY3oRJZbEj/rIkPnEVV5ZaGZbjZh+03KnAh8C+1n+hNYPGH
NGZTWQ3N5t2hDecM/JWR8bgmyrjW5HM0N4ICJBfNMVhJmwI49xJszkJrjQaDB9Gt
ep2UXzYoDAWUV+mvs5jqIC6PtmyXVXdtoULsgCy9jRNuHyqqBu+anpawMyw8MaOo
q3mLQiAG2mxopXXwV/OxeeXtfutAN8LDCVvLAfQr4ElkJuEUQDGS1YN7Q2g1Fbpi
nODU5PmoACBdMrzDxnbHXDAD1IjKDNuCiMaCqavsHgmuh9jXb0LG9wh747l07BL+
02ZAt8hazsrXGztdvVNOtyWo7v3wFw==
=6Y1J
-----END PGP SIGNATURE-----

--VdOwlNaOFKGAtAAV--
