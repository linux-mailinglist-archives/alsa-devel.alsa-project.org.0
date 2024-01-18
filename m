Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2337B831E22
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 18:06:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58A9C827;
	Thu, 18 Jan 2024 18:06:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58A9C827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705597614;
	bh=zwlAmsr3jy9o0CUfZAf7n0+dthoLludbuSbP800F6PU=;
	h=From:Date:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dQEFoGq09GGDjHxjq/woflL79i6HfAHURg5T5jwH8n5r1alxSrCYELCWHWwi5gCoa
	 qAkE6VXHN28aMaEkrW8htkrGOzFFSsjSqwXYbL/ojUJ8EHpMT9I6iK6QjLm3CX+9lS
	 TZoy4ZuXvNkgVqFYgb+XOI8nw/Ks1LK8kgM3irbo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B01C9F8058C; Thu, 18 Jan 2024 18:06:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34751F80567;
	Thu, 18 Jan 2024 18:06:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89263F801F5; Thu, 18 Jan 2024 18:06:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi
 [62.142.5.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3CA8DF80074
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 18:06:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CA8DF80074
Received: from localhost (88-113-24-108.elisa-laajakaista.fi [88.113.24.108])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id e241a668-b623-11ee-b3cf-005056bd6ce9;
	Thu, 18 Jan 2024 19:06:13 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Thu, 18 Jan 2024 19:06:13 +0200
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linus.walleij@linaro.org, vkoul@kernel.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 5/6] spi: cs42l43: Add SPI controller support
Message-ID: <ZalahZkCrBm-BXwz@surfacebook.localdomain>
References: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
 <20230804104602.395892-6-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804104602.395892-6-ckeepax@opensource.cirrus.com>
Message-ID-Hash: SXCX2BM3ZFNMFEXTPXLXAAY3PF2VTAE7
X-Message-ID-Hash: SXCX2BM3ZFNMFEXTPXLXAAY3PF2VTAE7
X-MailFrom: andy.shevchenko@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SXCX2BM3ZFNMFEXTPXLXAAY3PF2VTAE7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fri, Aug 04, 2023 at 11:46:01AM +0100, Charles Keepax kirjoitti:
> From: Lucas Tanure <tanureal@opensource.cirrus.com>
> 
> The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
> (Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
> for portable applications. It provides a high dynamic range, stereo
> DAC for headphone output, two integrated Class D amplifiers for
> loudspeakers, and two ADCs for wired headset microphone input or
> stereo line input. PDM inputs are provided for digital microphones.
> 
> The SPI component incorporates a SPI controller interface for
> communication with other peripheral components.

...

> +		while (buf < block) {
> +			const u8 *word = min(buf + sizeof(u32), block);
> +			int pad = (buf + sizeof(u32)) - word;
> +
> +			while (buf < word) {
> +				val >>= BITS_PER_BYTE;
> +				val |= FIELD_PREP(GENMASK(31, 24), *buf);
> +
> +				buf++;
> +			}

Is this a reinvented way of get_unaligned_*() APIs?

> +			val >>= pad * BITS_PER_BYTE;
> +
> +			regmap_write(regmap, CS42L43_TX_DATA, val);
> +		}

...

> +			while (buf < word) {
> +				*buf = FIELD_GET(GENMASK(7, 0), val);
> +
> +				val >>= BITS_PER_BYTE;
> +				buf++;
> +			}

put_unaligned_*() ?

...

> +	/* select another internal CS, which doesn't exist, so CS 0 is not used */
> +	if (spi_get_csgpiod(spi, 0))
> +		spi_config1 |= 1 << CS42L43_SPI_SS_SEL_SHIFT;

BIT() ?

> +	if (spi->mode & SPI_CPOL)
> +		spi_config1 |= CS42L43_SPI_CPOL_MASK;
> +	if (spi->mode & SPI_CPHA)
> +		spi_config1 |= CS42L43_SPI_CPHA_MASK;
> +	if (spi->mode & SPI_3WIRE)
> +		spi_config1 |= CS42L43_SPI_THREE_WIRE_MASK;

...

> +	if (is_of_node(fwnode))
> +		fwnode = fwnode_get_named_child_node(fwnode, "spi");

You can actually drop these is_of_node() tests and use another variable. In
ACPI there can't be child node in small letters.

But main problem here (and in another driver where the similar is used) that
you bumped reference count for fwnode. I haven't seen where you drop it back.
Have you tested rmmod/modprobe in a loop?

...

> +	devm_pm_runtime_enable(priv->dev);

No error check? Why?

...

> +	ret = devm_spi_register_controller(priv->dev, priv->ctlr);
> +	if (ret) {
> +		pm_runtime_disable(priv->dev);

Ah! Are you sure you properly simulated faults when testing this code?

> +		dev_err(priv->dev, "Failed to register SPI controller: %d\n", ret);
> +	}
> +
> +	return ret;

-- 
With Best Regards,
Andy Shevchenko


