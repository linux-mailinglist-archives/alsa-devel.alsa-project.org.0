Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BAB73229A
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 00:15:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B023828;
	Fri, 16 Jun 2023 00:15:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B023828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686867356;
	bh=r4b//9qBgVZFPURUW3oqtInPOiK+Qzc+64/jMQ9JIuE=;
	h=From:Date:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RgUXexutAQJhmOJH9HLen/hmcogbP13zfIC/3qc8Qx/IdM4mra5h2nErD19a3ztoQ
	 cSW8UPMefcSJG++qMJptee/mY7WNuOQRidghW2XaqIIagegmFVW0l7/S5AYzM4OtIE
	 iy+8gvmXSYJTXZnWAg1qj5DPJOmDYulHodjUVQ6c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73AA4F80155; Fri, 16 Jun 2023 00:15:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FF7CF800BA;
	Fri, 16 Jun 2023 00:15:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5785F80149; Fri, 16 Jun 2023 00:14:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
	SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi
 [62.142.5.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB472F80130
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 00:14:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB472F80130
Received: from localhost (88-113-24-87.elisa-laajakaista.fi [88.113.24.87])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 0df2eb39-0bca-11ee-b3cf-005056bd6ce9;
	Fri, 16 Jun 2023 01:14:54 +0300 (EEST)
From: andy.shevchenko@gmail.com
Date: Fri, 16 Jun 2023 01:14:53 +0300
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linus.walleij@linaro.org, vkoul@kernel.org, robh+dt@kernel.org,
	conor+dt@kernel.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] soundwire: bus: Allow SoundWire peripherals to
 register IRQ handlers
Message-ID: <ZIuNXQIB3j6YjYa7@surfacebook>
References: <20230605125504.2570158-1-ckeepax@opensource.cirrus.com>
 <20230605125504.2570158-2-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605125504.2570158-2-ckeepax@opensource.cirrus.com>
Message-ID-Hash: HDTOIXSIBV6UUTRKX3INQY7MOFMWR5Z6
X-Message-ID-Hash: HDTOIXSIBV6UUTRKX3INQY7MOFMWR5Z6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HDTOIXSIBV6UUTRKX3INQY7MOFMWR5Z6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Mon, Jun 05, 2023 at 01:54:59PM +0100, Charles Keepax kirjoitti:
> From: Lucas Tanure <tanureal@opensource.cirrus.com>
> 
> Currently the in-band alerts for SoundWire peripherals can only
> be communicated to the driver through the interrupt_callback
> function. This however is slightly inconvient for devices that wish to
> share IRQ handling code between SoundWire and I2C/SPI, the later would
> normally register an IRQ handler with the IRQ subsystem. However there
> is no reason the SoundWire in-band IRQs can not also be communicated
> as an actual IRQ to the driver.
> 
> Add support for SoundWire peripherals to register a normal IRQ handler
> to receive SoundWire in-band alerts, allowing code to be shared across
> control buses. Note that we allow users to use both the
> interrupt_callback and the IRQ handler, this is useful for devices which
> must clear additional chip specific SoundWire registers that are not a
> part of the normal IRQ flow, or the SoundWire specification.

...

> +	bus->irq_chip.name = dev_name(bus->dev);
> +	bus->domain = irq_domain_add_linear(NULL, SDW_MAX_DEVICES, &sdw_domain_ops, bus);

I'm wondering why you are not using existing fwnode, if any
(e.g. from parent device).

> +	if (!bus->domain) {
> +		dev_err(bus->dev, "Failed to add IRQ domain\n");
> +		return -EINVAL;
> +	}

-- 
With Best Regards,
Andy Shevchenko


