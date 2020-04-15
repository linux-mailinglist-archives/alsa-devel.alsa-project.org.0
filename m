Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB601AAAFB
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 17:00:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE57A1662;
	Wed, 15 Apr 2020 16:59:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE57A1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586962819;
	bh=ssSOrsJ7xvXlA+GOclAUTRbR0WGV/6xfQ5yobsESd9A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MXxLeqPUdmyrepf2F6uyW9ttNHoFL1ni1TwKO80FNllwjpJWEnsTosmZjEf+WJyZs
	 qUC126d6QihNycKNJRVrjO1XH89MZ2TZZ8aHY7FlBCg0H9RWI8C+FQLVXqkw8cJMgk
	 WwDDZ5jL6ZKN6f6fMOdTqS6RdvokYuo1ltorIKD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61D2EF802A8;
	Wed, 15 Apr 2020 16:57:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC9A0F802A8; Wed, 15 Apr 2020 16:57:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5544DF80245
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 16:57:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5544DF80245
IronPort-SDR: ou2Hk9eewIurbmtBxQnwpnPjXpTAIeiLsHiMWeGc7rGp2MznMLFyKCEDQsxyAmnvUJze5vVM2h
 5+bMnANhtmZA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 07:57:13 -0700
IronPort-SDR: TNZsy4SP9GBFchjn5F8fxYVqunPZfBr4bT/E/57a2xp65b6ujjeSwvZ/IlU6gpMvCpNL9io1CH
 G+2zgrGgvWtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; d="scan'208";a="400337213"
Received: from ccarey-mobl.amr.corp.intel.com (HELO [10.209.36.121])
 ([10.209.36.121])
 by orsmga004.jf.intel.com with ESMTP; 15 Apr 2020 07:57:12 -0700
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4635e57b-fccd-d8a9-fa99-8124debb3428@linux.intel.com>
Date: Wed, 15 Apr 2020 09:44:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415113630.GC5265@sirena.org.uk>
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



On 4/15/20 6:36 AM, Mark Brown wrote:
> On Tue, Apr 14, 2020 at 03:13:01PM -0500, Pierre-Louis Bossart wrote:
>> On 4/14/20 2:50 PM, Mark Brown wrote:
> 
>>> It's not just DT platforms that I'm worried about here, it's also ACPI
>>> systems - all it takes is for a system to have a second device and a
>>> name collision could happen, especially with such generic names.  We
>>> tried to avoid doing this for board files for the same reason.
> 
>> I am on the paranoid side but here I don't see much potential for conflicts:
> 
>> a) this only works for the Up2 board with a HAT connector
>> b) this only work with the Hifiberry DAC+ PRO board.
> 
>> This codec is not used in any traditional client devices.
> 
> That's what you're doing right now but someone else can use the same
> devices, or adopt the same approaches on something like a Chromebook.
> 
>>> My understanding is that ACPI just doesn't have clock bindings (or audio
>>> bindings or...) so you're basically using board files here and board
>>> files can definitely do more than we're seeing here.
> 
>> I don't understand your definition of board file, sorry. We've never had
>> one, the only thing that's board-specific is the machine driver.
> 
> Architectures that don't have firmware bindings use straight C code to
> register and set things up.  Machine drivers are essentially board
> files, they're just audio specific bits of board file that use audio
> APIs and so are in the sound directory.

Humm, we may have a conceptual disconnect here. In the ACPI world, there 
is no support for the machine driver - unlike Device Tree. It is probed 
when the SST/SOF driver creates a platform device using the codec _HID 
as a key to hard-coded lookup tables in 
sound/soc/intel/common/soc-acpi*.c - it will be probed *after* the codec 
driver probes. I really don't see how to use the machine driver as 
currently implemented to establish board-level connections that would 
influence the codec driver probe and its use of a clock.

> 
>>> You should be able to register links between devices using the clock
>>> API, or add that functionality if it's not there but AFAIK clkdev still
>>> works.
> 
>> The machine driver has no information whatsoever on who provides the clock.
>> I just don't see how I might link stuff without at least some amount of
>> information?
> 
> The machine driver must have this information, it knows exactly what
> hardware it runs on.  The whole point of a machine driver is that it's
> board specific.
> 
>> All I needed was to toggle 2 gpios to select 44.1 or 48kHz...Looks like it's
>> going to take two more years, oh well.
> 
> I think you're giving up way too easily here.  The kernel has really
> good support for systems that don't have any firmware description at
> all, this shouldn't be complex or breaking new ground.

See above, I don't think the machine driver can do what you had in mind?

I don't see how to proceed unless we remove all support for ACPI, both 
for codec and clock driver, and trigger their probe "manually" with a 
board-level initialization.

And btw there's already a precedent for using global names, it's what 
the Skylake driver does for the mclk and ssp clocks. To the best of my 
knowledge the device specific namespacing does not exist on any ACPI 
platform. We have a request from Dialog to implement the same thing for 
SOF to solve dependencies on the clock being stable before turning on 
the codec, so if global names are not acceptable we have a real problem.

