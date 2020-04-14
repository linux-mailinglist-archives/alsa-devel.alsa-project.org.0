Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 435F81A8A91
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 21:17:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB1031616;
	Tue, 14 Apr 2020 21:16:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB1031616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586891834;
	bh=Kvwu6hx5tae7M8xXUxTtdNiEoQbaNVjkRXoMkG7kBus=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f/5D7N5f97Xh9rT8WTskNybexohjh5lDPEzhif7RpS7VDWdaMMaC5bOhQMR+xEJq7
	 mKbvCN23MUvsdB4cdAJRwsPGA6Q3A0YUb87AejcvaOCpzm+1Lvhtq5o3wFhZ9vZisJ
	 dRlBsTEUspdXFDVTuyYxFMbNRDbGLmTf8zANafBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9D27F800B9;
	Tue, 14 Apr 2020 21:15:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 646B3F8013D; Tue, 14 Apr 2020 21:15:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC4EFF800F5
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 21:15:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC4EFF800F5
IronPort-SDR: h3M10ZsZmvy9t0tR7bfBFm3dsgrrY+tSh4K+FOeYl67vQ3/TdCRiWk4hg3k3xpFCTv/ZvyTDmB
 bpbVIyuI/yRA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 12:15:18 -0700
IronPort-SDR: nUbP5h8r4Jfxdlj0aUSTSSoeTj7LFFCtRqWPHvrwnAzy7QNdJYvI2BP6sjvPKDzeZkKGrfbXDY
 2EpJCRVvmNtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; d="scan'208";a="253286678"
Received: from svarahab-mobl.amr.corp.intel.com (HELO [10.212.190.40])
 ([10.212.190.40])
 by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 12:15:17 -0700
Subject: Re: [RFC PATCH 02/16] ASoC: pcm512x: use "sclk" string to retrieve
 clock
To: Mark Brown <broonie@kernel.org>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
 <20200414174530.GK5412@sirena.org.uk>
 <8ee01a4f-ceb2-d207-7cef-cf766fa670af@linux.intel.com>
 <20200414182728.GM5412@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3017b762-7a0c-cee2-06dd-1e96f52eb849@linux.intel.com>
Date: Tue, 14 Apr 2020 14:15:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414182728.GM5412@sirena.org.uk>
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



On 4/14/20 1:27 PM, Mark Brown wrote:
> On Tue, Apr 14, 2020 at 01:14:41PM -0500, Pierre-Louis Bossart wrote:
>> On 4/14/20 12:45 PM, Mark Brown wrote:
>>> On Thu, Apr 09, 2020 at 02:58:27PM -0500, Pierre-Louis Bossart wrote:
> 
>>>> Using devm_clk_get() with a NULL string fails on ACPI platforms, use
>>>> the "sclk" string as a fallback.
> 
>>> Is this something that could be fixed at the ACPI level?
> 
>> I guess to fix this we'd need some sort of ACPI-level connection or
>> description of the clock, and I've never seen such a description?
> 
> Wait, so SCLK is in the *global* namespace and the provider has to
> register the same name?  That doesn't sound clever.  It might be better
> to have the board register the connection from the clock provider to the
> device rather than hard code global namespace strings like this, that
> sounds like a recipie for misery.

I believe this change has zero impact on DT platforms.

The 'sclk' is a fallback here. If you find a clock with the NULL string, 
it's what gets used. Likewise for the clock provider, the 'sclk' is a 
lookup - an alias in other words. The use of the references and phandles 
should work just fine for Device Tree.

> It is really sad that nobody involved in producing these systems that
> don't work with the current limitations in ACPI has been able to make
> progress on improving ACPI so it can cope with modern hardware and we're
> having to deal with this stuff.

I can't disagree but I have to live with what's available to me as an 
audio guy...I had a solution two years ago where I could set the clock 
directly from the machine driver. The recommendation at the time was to 
use the clk framework, but that clk framework is limited for ACPI 
platforms, so we can only use it with these global names.

We had the same problem on Baytrail/Cherrytrail devices some 4 years ago 
and we had to use an 'mclk' alias. We are going to have the same problem 
when we expose the SSP MCLK, BLCK and FSYNC clocks - and that's also 
what the Skylake driver did - we don't have a solution without global names.

>> All the examples I've seen use an explicit 'mclk' string (that's e.g. what
>> we did for the PMC clocks for Baytrail/Cherrytrail machine drivers, we added
>> a lookup). Here I used 'sclk' since it's what TI refers to in their
>> documentation.
> 
> They appear to call it SCK not SCLK.

Yes indeed, will change.


