Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5356700F26
	for <lists+alsa-devel@lfdr.de>; Fri, 12 May 2023 21:04:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA588EB3;
	Fri, 12 May 2023 21:03:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA588EB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683918274;
	bh=4YFJUj5gXssy7gs8iKyXUlUTPpWbGN/9UmJPKOvGXds=;
	h=From:Date:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tyebfp+49QT2+TdKB/JrZ3AR3lazkvBqLXAg3typiyejqH9Jb1BJfDmwn77XOjg7u
	 +r3pm0rOhvSCZiCtygxBDcb/yPehhi02U3mq5KetS0Y/hlhdS8wI/wkTCmO2v0JFt7
	 1oWO/5w8G9FYoAK90mGhXbKWVjzDlQBm13CTpLPk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 922F6F8053D; Fri, 12 May 2023 21:03:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3B3BF802E8;
	Fri, 12 May 2023 21:03:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5C4EF8052E; Fri, 12 May 2023 21:03:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi
 [62.142.5.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA4CCF80087
	for <alsa-devel@alsa-project.org>; Fri, 12 May 2023 21:03:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA4CCF80087
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id a2075948-f0f7-11ed-a9de-005056bdf889;
	Fri, 12 May 2023 22:03:09 +0300 (EEST)
From: andy.shevchenko@gmail.com
Date: Fri, 12 May 2023 22:03:08 +0300
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	tglx@linutronix.de, maz@kernel.org, linus.walleij@linaro.org,
	vkoul@kernel.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/10] spi: cs42l43: Add SPI controller support
Message-ID: <ZF6NbHVD4ay2S83R@surfacebook>
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-10-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512122838.243002-10-ckeepax@opensource.cirrus.com>
Message-ID-Hash: DM6UII5TTJPO5DIFWUY4JJ6IBWI5XWTP
X-Message-ID-Hash: DM6UII5TTJPO5DIFWUY4JJ6IBWI5XWTP
X-MailFrom: andy.shevchenko@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DM6UII5TTJPO5DIFWUY4JJ6IBWI5XWTP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fri, May 12, 2023 at 01:28:37PM +0100, Charles Keepax kirjoitti:
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

> +#define CS42L43_SPI_ROOT_HZ		40000000

HZ_PER_MHZ?

...

> +		const u8 *block = min_t(const u8 *, buf + CS42L43_FIFO_SIZE, end);

Wouldn't min() work?

...

> +		for (; buf < block - (sizeof(u32) - 1); buf += sizeof(u32))
> +			regmap_write(regmap, CS42L43_TX_DATA, *(const u32 *)buf);

This casting might be potentially wrong taking alignment into consideration.
Perhaps you need get_unaligned(). Also here the return value isn't checked,
while in the read it is.

...

> +		const u8 *block = min_t(const u8 *, buf + CS42L43_FIFO_SIZE, end);

min() ?

...

> +		for (; buf < block - (sizeof(u32) - 1); buf += sizeof(u32)) {
> +			ret = regmap_read(regmap, CS42L43_RX_DATA, (u32 *)buf);

put_unaligned() ?

> +			if (ret)
> +				return ret;
> +		}

...

> +static int cs42l43_prepare_transfer_hardware(struct spi_controller *ctlr)
> +{
> +	struct cs42l43_spi *priv = spi_controller_get_devdata(ctlr);
> +	int ret;
> +
> +	ret = regmap_write(priv->regmap, CS42L43_BLOCK_EN2, CS42L43_SPI_MSTR_EN_MASK);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to enable SPI controller: %d\n", ret);

> +		return ret;
> +	}
> +
> +	return 0;

	return ret; ?

> +}
> +
> +static int cs42l43_unprepare_transfer_hardware(struct spi_controller *ctlr)
> +{
> +	struct cs42l43_spi *priv = spi_controller_get_devdata(ctlr);
> +	int ret;
> +
> +	ret = regmap_write(priv->regmap, CS42L43_BLOCK_EN2, 0);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to disable SPI controller: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;

Ditto.

> +}

...

> +	if (is_of_node(dev_fwnode(cs42l43->dev))) {
> +		priv->ctlr->dev.fwnode =
> +			fwnode_get_named_child_node(dev_fwnode(cs42l43->dev), "spi");
> +		priv->ctlr->dev.of_node = to_of_node(dev_fwnode(&priv->ctlr->dev));
> +	} else {
> +		priv->ctlr->dev.fwnode = dev_fwnode(priv->dev);
> +	}

Can you use device_set_node() once you have an fwnode that needs to be passed?

...

> +	priv->ctlr->mode_bits = SPI_3WIRE | SPI_CPHA | SPI_CPOL;

SPI_MODE_X_MASK

...

> +static struct platform_driver cs42l43_spi_driver = {
> +	.driver = {
> +		.name	= "cs42l43-spi",
> +	},

> +

Unneeded blank line.

> +	.probe		= cs42l43_spi_probe,
> +	.remove		= cs42l43_spi_remove,
> +};

-- 
With Best Regards,
Andy Shevchenko


