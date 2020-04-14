Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3921A8749
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 19:19:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D0DD16A3;
	Tue, 14 Apr 2020 19:19:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D0DD16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586884792;
	bh=dkXdr0CAevfQVuDxknxcJpGtVqZ+l00Cln1GYX5ybKo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tRvgGxzPcqcZ1/c5xInu8CVKuR1szkzbRL1XD8JQBL/5kFOLzE7ro/7xegW3t6Yp8
	 LHY1pqdocujVcbg1uIiMENcbzw3EGD23PzSqCg2BXejCST9SWUZ6eIITIMYX5bxnCk
	 JBaSBURWC8m8aWQuyvEdXVhRvts7HPtrAaVELIDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEDBEF8014E;
	Tue, 14 Apr 2020 19:18:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67776F8013D; Tue, 14 Apr 2020 19:18:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9860EF800F5
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 19:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9860EF800F5
IronPort-SDR: YIEG5LnoVu6Y9Ns/EOxd9oRolF4vDZ3/zCQyMaeaDeW8Tn5c4STLPaPpkniZYXbnzw/Tt8mw9I
 sk+MnhZPAIeA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 10:17:54 -0700
IronPort-SDR: wSdXoXBWbtwb3E7Tm0mh49EdJASJhS4vvbnijD6FTeBStrc1NUUNKh844LrZnzhDD7+w5nbfAD
 Ad73pOsdtXRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; d="scan'208";a="256582475"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga006.jf.intel.com with ESMTP; 14 Apr 2020 10:17:50 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jOPC4-000Zo4-PO; Tue, 14 Apr 2020 20:17:52 +0300
Date: Tue, 14 Apr 2020 20:17:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 03/16] ASoC: Intel: sof-pcm512x: use gpiod for LED
Message-ID: <20200414171752.GC34613@smile.fi.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409195841.18901-4-pierre-louis.bossart@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 linux-gpio@vger.kernel.org, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Daniel Matuschek <daniel@hifiberry.com>, Hui Wang <hui.wang@canonical.com>,
 Matthias Reichl <hias@horus.com>, broonie@kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
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

On Thu, Apr 09, 2020 at 02:58:28PM -0500, Pierre-Louis Bossart wrote:
> Remove direct regmap access, use gpios exposed by PCM512x codec
> Keep the codec_init function, this will be used in following patches
> 
> The gpios handling is done with an explicit lookup table. We cannot
> use ACPI-based mappings since we don't have an ACPI device for the
> machine driver, and the gpiochip is created during the probe of the
> PCM512x driver.

...

> +#include <linux/gpio/machine.h>

Okay, it's a board code.

...

> +static struct gpiod_lookup_table pcm512x_gpios_table = {
> +	/* .dev_id set during probe */
> +	.table = {

> +		GPIO_LOOKUP("pcm512x-gpio", 3, "PCM512x-GPIO4", GPIO_ACTIVE_HIGH),

It says GPIO 4 and here is number 3.
Does this 4 come from hardware documentation?

> +		{ },

No comma for terminator entries.

> +	},
> +};

...

> +	gpiod_add_lookup_table(&pcm512x_gpios_table);

Where is the counterpart gpiod_remove_lookup_table() call?

> +	ctx->gpio_4 = devm_gpiod_get(&pdev->dev, "PCM512x-GPIO4",
> +				     GPIOD_OUT_LOW);

Can driver work without this GPIO? If so, perhaps devm_gpiod_get_optional().

> +	if (IS_ERR(ctx->gpio_4)) {
> +		dev_err(&pdev->dev, "gpio4 not found\n");
> +		ret = PTR_ERR(ctx->gpio_4);
> +		return ret;
> +	}

-- 
With Best Regards,
Andy Shevchenko


