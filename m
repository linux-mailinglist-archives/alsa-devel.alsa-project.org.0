Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CB2831D5B
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 17:16:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EED4FE72;
	Thu, 18 Jan 2024 17:16:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EED4FE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705594619;
	bh=uKYABitkPHkMBYpYoEDTqJexD8KYr1iUJcOLrzvoYoA=;
	h=From:Date:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Mh70Nm9lVAzZ7HBLn2isivpZo81FYlSMrGvOoNyfWW0DXIxkm1mBRvLmki9lA396O
	 wFWy8aC7IZXjLiCgJ4tWW4mKIqATniUf1P/I1q/ElwKqoX2Gz9am6+w//YGwznN8MX
	 Lwb3cYQOQO7so185jlbK6HDYO6hzRLtAdVw3X63Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEC44F8057A; Thu, 18 Jan 2024 17:16:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 482CEF8057D;
	Thu, 18 Jan 2024 17:16:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D7DBF801F5; Thu, 18 Jan 2024 17:16:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi
 [62.142.5.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF462F800F5
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 17:16:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF462F800F5
Received: from localhost (88-113-24-108.elisa-laajakaista.fi [88.113.24.108])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id e194e5ee-b61c-11ee-abf4-005056bdd08f;
	Thu, 18 Jan 2024 18:16:06 +0200 (EET)
From: andy.shevchenko@gmail.com
Date: Thu, 18 Jan 2024 18:16:05 +0200
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linus.walleij@linaro.org, vkoul@kernel.org, lgirdwood@gmail.com,
	yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
	pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/6] soundwire: bus: Allow SoundWire peripherals to
 register IRQ handlers
Message-ID: <ZalOxVZhPkOPvkJ-@surfacebook.localdomain>
References: <20230804104602.395892-1-ckeepax@opensource.cirrus.com>
 <20230804104602.395892-2-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804104602.395892-2-ckeepax@opensource.cirrus.com>
Message-ID-Hash: QGV5VYCBFZA5ZWJ3LV7VTQ6OZTN3XWY3
X-Message-ID-Hash: QGV5VYCBFZA5ZWJ3LV7VTQ6OZTN3XWY3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QGV5VYCBFZA5ZWJ3LV7VTQ6OZTN3XWY3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fri, Aug 04, 2023 at 11:45:57AM +0100, Charles Keepax kirjoitti:
> From: Lucas Tanure <tanureal@opensource.cirrus.com>
> 
> Currently the in-band alerts for SoundWire peripherals can only
> be communicated to the driver through the interrupt_callback
> function. This however is slightly inconvenient for devices that wish
> to share IRQ handling code between SoundWire and I2C/SPI, the later
> would normally register an IRQ handler with the IRQ subsystem. However
> there is no reason the SoundWire in-band IRQs can not also be
> communicated as an actual IRQ to the driver.
> 
> Add support for SoundWire peripherals to register a normal IRQ
> handler to receive SoundWire in-band alerts, allowing code to be
> shared across control buses. Note that we allow users to use both the
> interrupt_callback and the IRQ handler, this is useful for devices
> which must clear additional chip specific SoundWire registers that are
> not a part of the normal IRQ flow, or the SoundWire specification.

...

> +#include <linux/irqdomain.h>

Added code doesn't use anythitg from above. 
It can be fulfilled with a forward declaration.

-- 
With Best Regards,
Andy Shevchenko


