Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 252DC1AB26B
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:25:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A93C3950;
	Wed, 15 Apr 2020 22:24:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A93C3950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586982301;
	bh=Xm/800VbqWEfDTybnii7kgQcbbjpEapNNZpdU5w5cq8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Be/pxWkzeml5HBM+MaKCoiXVIQQDcBC6nmw2Z4Unb9XwtHsTwZnpt7QXZhfPODcEx
	 ofCCDRwZm/r0SGQFAvGKH+uenh3enrwwNT++MYwscmOXsAjWCsCfMPzb+yi8iDD2Rl
	 d4c2nGEj7571QToZkwUnr2boA5XdR8YTgXJ/iN/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF408F8025F;
	Wed, 15 Apr 2020 22:23:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93597F80245; Wed, 15 Apr 2020 22:23:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F31D5F80115
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F31D5F80115
IronPort-SDR: OkzE65VNRV/4kU5r9Z8vjnMHRctKsOfATSdUBK8rvvDfFlzD1b6EJCNbP3r1hOL9xvjg7A42fi
 7Z9XjHnoqMTQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:23:02 -0700
IronPort-SDR: 08Pg1nHfQyQeKArKnSkmpdMH/b4HOwFCML4/ru7SX9KLnJdr4lOWTww+DWNMC0geyIscbyA35T
 ROiYRywaa4Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="332606832"
Received: from jplam-mobl1.amr.corp.intel.com (HELO [10.209.82.197])
 ([10.209.82.197])
 by orsmga001.jf.intel.com with ESMTP; 15 Apr 2020 13:22:59 -0700
Subject: Re: [RFC PATCH 02/16] ASoC: pcm512x: use "sclk" string to retrieve
 clock
To: Mark Brown <broonie@kernel.org>
References: <20200414174530.GK5412@sirena.org.uk>
 <8ee01a4f-ceb2-d207-7cef-cf766fa670af@linux.intel.com>
 <20200414182728.GM5412@sirena.org.uk>
 <3017b762-7a0c-cee2-06dd-1e96f52eb849@linux.intel.com>
 <20200414195031.GP5412@sirena.org.uk>
 <0d2aed9b-5c79-9ed2-6ca1-67b2688e4c99@linux.intel.com>
 <20200415113630.GC5265@sirena.org.uk>
 <4635e57b-fccd-d8a9-fa99-8124debb3428@linux.intel.com>
 <20200415162247.GF5265@sirena.org.uk>
 <9a7fbbac-818a-01d0-7a32-8ae313f9ad50@linux.intel.com>
 <20200415195033.GL5265@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b2db6026-c29f-0213-98d1-d8533e3159e1@linux.intel.com>
Date: Wed, 15 Apr 2020 15:22:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415195033.GL5265@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Matthias Reichl <hias@horus.com>,
 tiwai@suse.de, Linus Walleij <linus.walleij@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Daniel Matuschek <daniel@hifiberry.com>,
 linux-clk@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Michael Turquette <mturquette@baylibre.com>
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



> In the case of this driver could you look at registering the link from
> the device for the clocks?  Have it say "I supply SCK on device X" as it
> registers.  That should be fairly straightforward I think, we do that
> for one of the regulators.

When you wrote 'in the case of this driver', were you referring to the 
clock provider, saying 'I support SCK on device i2c-104C5122:00' ?

If you have a pointer on the regulator example, I'd appreciate it, I am 
really way beyond my comfort zone.

> The main thing I want to avoid is having to have the CODEC drivers know
> platform specific strings that they're supposed to look up, or general
> approaches where that ends up being a thing that looks idiomatic.  That
> was something board files did for a while, it didn't work very well and
> we did something better with clkdev instead.  I'm a lot less worried
> about this for cases where it's two devices that are part of the SoC
> talking to each other, that's relatively well controled and doesn't
> affect non-x86 platforms.  When it starts touching the CODECs it's a lot
> more worrying.

I see the nuance, thanks for the clarification.

Maybe an alternate suggestion if you want to avoid hard-coded strings in 
the kernel: what if we added optional properties for the clock lookup 
name in both the codec and clock driver, and set the name in a _DSD 
blob. That would move the platform-specific names to platform firmware, 
and avoid the links described above that are probably ACPI-only.

In this case we can add whatever we want, the DSDT table contains 
absolutely nothing for audio so we can add things as needed, and in case 
another usage of this codec happens in a future device they'd have to 
define their own clock name and store it in platform firmware.

> I think by now there's ample evidence that it's worth investing in
> better firmware descriptions :(

Indeed, and tools to check they are correct! Most of the stuff we 
defined for SoundWire ends-up wrong or undefined, still an uphill battle...
