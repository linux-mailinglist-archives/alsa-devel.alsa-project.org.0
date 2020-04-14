Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6F71A8BFD
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 22:14:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BE5C1616;
	Tue, 14 Apr 2020 22:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BE5C1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586895293;
	bh=JlMd5F5gGF2wKF1oYS0Nbm4zZJt48j91wCKmF5YHEXg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iehl00h9Nty39DkXhXptz/xNQotxi+5tB8SdbzS7fCblxnV/R0JLpGILWP3JdQMXE
	 9UjzVNiYMN42/XQ7CuJSBm8OJIrhqOF7t5woVIwvEgrYH8h3cRyX0rmBJkCa9TXzVe
	 mUWN6f48OGq3IHa9DP/HQmeOSm7Bk0TC86syUQAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97DE3F8014E;
	Tue, 14 Apr 2020 22:13:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B469AF8013D; Tue, 14 Apr 2020 22:13:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0B80F80115
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 22:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0B80F80115
IronPort-SDR: egisT9iyo3Ebbr3UT0JnAc8XCGf2WJHw6DFj2INeH3VwNs6zu+MsCbLUrSL1xUOE+8x5v8kp3e
 RDKWHb50aEJQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 13:13:03 -0700
IronPort-SDR: 2Ewn15Ji8stuoV7+I13V/tQewZwPzGnIug1GjNuXiEvj4iVvCxW72WcX6xG8aBFuF3tDZqajeY
 0vb5X5EmMNEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,384,1580803200"; d="scan'208";a="253299512"
Received: from svarahab-mobl.amr.corp.intel.com (HELO [10.212.190.40])
 ([10.212.190.40])
 by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 13:13:02 -0700
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0d2aed9b-5c79-9ed2-6ca1-67b2688e4c99@linux.intel.com>
Date: Tue, 14 Apr 2020 15:13:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414195031.GP5412@sirena.org.uk>
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



On 4/14/20 2:50 PM, Mark Brown wrote:
> On Tue, Apr 14, 2020 at 02:15:16PM -0500, Pierre-Louis Bossart wrote:
>> On 4/14/20 1:27 PM, Mark Brown wrote:
> 
>>> Wait, so SCLK is in the *global* namespace and the provider has to
>>> register the same name?  That doesn't sound clever.  It might be better
>>> to have the board register the connection from the clock provider to the
>>> device rather than hard code global namespace strings like this, that
>>> sounds like a recipie for misery.
> 
>> I believe this change has zero impact on DT platforms.
> 
>> The 'sclk' is a fallback here. If you find a clock with the NULL string,
>> it's what gets used. Likewise for the clock provider, the 'sclk' is a lookup
>> - an alias in other words. The use of the references and phandles should
>> work just fine for Device Tree.
> 
> It's not just DT platforms that I'm worried about here, it's also ACPI
> systems - all it takes is for a system to have a second device and a
> name collision could happen, especially with such generic names.  We
> tried to avoid doing this for board files for the same reason.

I am on the paranoid side but here I don't see much potential for conflicts:

a) this only works for the Up2 board with a HAT connector
b) this only work with the Hifiberry DAC+ PRO board.

This codec is not used in any traditional client devices.

> 
>>> It is really sad that nobody involved in producing these systems that
>>> don't work with the current limitations in ACPI has been able to make
>>> progress on improving ACPI so it can cope with modern hardware and we're
>>> having to deal with this stuff.
> 
>> I can't disagree but I have to live with what's available to me as an audio
>> guy...I had a solution two years ago where I could set the clock directly
>> from the machine driver. The recommendation at the time was to use the clk
>> framework, but that clk framework is limited for ACPI platforms, so we can
>> only use it with these global names.
> 
> My understanding is that ACPI just doesn't have clock bindings (or audio
> bindings or...) so you're basically using board files here and board
> files can definitely do more than we're seeing here.

I don't understand your definition of board file, sorry. We've never had 
one, the only thing that's board-specific is the machine driver.

>> We had the same problem on Baytrail/Cherrytrail devices some 4 years ago and
>> we had to use an 'mclk' alias. We are going to have the same problem when we
>> expose the SSP MCLK, BLCK and FSYNC clocks - and that's also what the
>> Skylake driver did - we don't have a solution without global names.
> 
> You should be able to register links between devices using the clock
> API, or add that functionality if it's not there but AFAIK clkdev still
> works.

The machine driver has no information whatsoever on who provides the 
clock. I just don't see how I might link stuff without at least some 
amount of information?

All I needed was to toggle 2 gpios to select 44.1 or 48kHz...Looks like 
it's going to take two more years, oh well.
