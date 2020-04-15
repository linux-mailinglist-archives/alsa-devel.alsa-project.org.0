Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8231AAF88
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 19:28:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBA241663;
	Wed, 15 Apr 2020 19:28:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBA241663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586971731;
	bh=sKTfzVEcuDEtxUT/7JCKkv2DJ/bDEh/jdwSXNWToYNQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jYFZbNkXRsGrN5AAlc6NWZkjHTEWEMpmoOsCFySgQCFg4HA2tS9UHZKu3cUyV6pO2
	 upLvQVvJauZUeLIeUbnIBfVZBmCJb/fiasb8mWlQ/1Stj/gKk/acV+IKraby02knin
	 JmOAKK+wCT9G7fqf2IjUsicbk8CpB+FdgtTGRTJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2CC7F800ED;
	Wed, 15 Apr 2020 19:27:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E4CBF8025F; Wed, 15 Apr 2020 19:27:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F84DF800ED
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 19:27:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F84DF800ED
IronPort-SDR: Y1rt0P2xmE4OXVXHQT4l2ia38nq33jFsuxingE5FMugYCxDEn+KXjt8sXZYKNHbw5WA9CvXJqg
 vBVBKnk/gphQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 10:26:59 -0700
IronPort-SDR: mSk6aOISQhPtyVxBoM3CwHC1wCmHkRux0rvXtc6dsTm0VfMBf0EFhMxn3GGLZyAWqeKcLqI6xk
 CZlyMDkirMZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; d="scan'208";a="271795362"
Received: from jplam-mobl1.amr.corp.intel.com (HELO [10.209.82.197])
 ([10.209.82.197])
 by orsmga002.jf.intel.com with ESMTP; 15 Apr 2020 10:26:58 -0700
Subject: Re: [RFC PATCH 02/16] ASoC: pcm512x: use "sclk" string to retrieve
 clock
To: Mark Brown <broonie@kernel.org>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
 <20200414174530.GK5412@sirena.org.uk>
 <8ee01a4f-ceb2-d207-7cef-cf766fa670af@linux.intel.com>
 <20200414182728.GM5412@sirena.org.uk>
 <3017b762-7a0c-cee2-06dd-1e96f52eb849@linux.intel.com>
 <20200414195031.GP5412@sirena.org.uk>
 <0d2aed9b-5c79-9ed2-6ca1-67b2688e4c99@linux.intel.com>
 <20200415113630.GC5265@sirena.org.uk>
 <4635e57b-fccd-d8a9-fa99-8124debb3428@linux.intel.com>
 <20200415162247.GF5265@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9a7fbbac-818a-01d0-7a32-8ae313f9ad50@linux.intel.com>
Date: Wed, 15 Apr 2020 12:26:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415162247.GF5265@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 linux-gpio@vger.kernel.org, tiwai@suse.de,
 Linus Walleij <linus.walleij@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Daniel Matuschek <daniel@hifiberry.com>, Hui Wang <hui.wang@canonical.com>,
 Matthias Reichl <hias@horus.com>, Michael Turquette <mturquette@baylibre.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-clk@vger.kernel.org
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


>> the SST/SOF driver creates a platform device using the codec _HID as a key
>> to hard-coded lookup tables in sound/soc/intel/common/soc-acpi*.c - it will
>> be probed *after* the codec driver probes. I really don't see how to use the
>> machine driver as currently implemented to establish board-level connections
>> that would influence the codec driver probe and its use of a clock.
> 
> You have the opportunity to run whatever code you want to run at the
> point where you're registering your drivers with the system on module
> init, things like DMI quirk tables (which is what you're going to need
> to do here AFAICT) should work just as well there as they do later on
> when the driver loads.

The idea here was to have one single build, and then rely on what the 
user configured with initrd override to probe the right I2C codec driver 
and indirectly the machine driver. It's similar to device tree overlays.

With the same up2 board, I change the .aml file in 
/lib/firmware/acpi-upgrades, swap one HAT board for another and the new 
board is handled automagically.

I don't see how I can use hard-coded DMI tables or board-specific things 
without losing the single build?

>>> I think you're giving up way too easily here.  The kernel has really
>>> good support for systems that don't have any firmware description at
>>> all, this shouldn't be complex or breaking new ground.
> 
>> See above, I don't think the machine driver can do what you had in mind?
> 
>> I don't see how to proceed unless we remove all support for ACPI, both for
>> codec and clock driver, and trigger their probe "manually" with a
>> board-level initialization.
> 
> The clkdev stuff can use dev_name() so so long as the devices appear
> with predictable names you should be fine.  If not IIRC everything in
> ACPI is named in the AML so clkdev could be extended to be able to find
> things based on the names it gives.

I had a discussion with Andy Shevchenko that we should precisely not be 
using dev_name() since we don't control the names that ACPI selects for 
us. And since I was using the generic PRP0001 thing for the clock device 
to probe using the 'compatible' string it's actually even less reliable 
and unique...

>> And btw there's already a precedent for using global names, it's what the
>> Skylake driver does for the mclk and ssp clocks. To the best of my knowledge
>> the device specific namespacing does not exist on any ACPI platform. We have
> 
> No machine description at all exists on board file systems other than
> what we write in C and they manage to cope with this, I'm sure we can
> find a way to do it with ACPI.  I mentioned clkdev before, that is
> something that's done entirely at the Linux level.
> 
>> a request from Dialog to implement the same thing for SOF to solve
>> dependencies on the clock being stable before turning on the codec, so if
>> global names are not acceptable we have a real problem.
> 
> If existing usages that have ended up getting merged are going to be
> used to push for additional adoption then that's not encouraging.

I wasn't trying to push this against your will, rather I wanted to 
highlight that we should be clear on the direction for all these uses of 
the clk API in an ACPI context. If what I suggested here is not the 
right path, then how do we deal with all the existing cases? This 
PCM512x use is not a mainstream usage, we use this board mainly for 
validation and for community support, the other cases with 'mclk' and 
'sspX_fsync' are critical and impact devices shipping in large volumes.
