Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7101A8934
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 20:22:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5A6916A6;
	Tue, 14 Apr 2020 20:21:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5A6916A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586888550;
	bh=k7rLI0Abcy0k53Wu+hnZEOVjVkqBkhINExPckoRfhnk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aMHvmGVRIHzNESFgxF97GYf5wTYtuXBTRQv+k2oDbzGmFEFJK/1W7SHmRTRbmySmw
	 +86BUgexVaZlLY540qvZqTYyKVZ0lpVfyPqRElskTZsjl7r0OMhLO+SfSM1RlDENfX
	 0G/5BJkrFOdJtJXRfiOcGZNPCn9t/TCYeMBkqHCI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84DD7F802E0;
	Tue, 14 Apr 2020 20:17:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C344BF802DC; Tue, 14 Apr 2020 20:17:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91417F802C3
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 20:17:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91417F802C3
IronPort-SDR: 4s/FqotwvNCOPHebz1e/ZdbwtXHDWvw/DAqjrcBQ59zCdkY8XJy8u3BtOfT/6OQRh6aMUrECOt
 AuckY8L0uKEA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 11:17:25 -0700
IronPort-SDR: zetcgI7Tu/vLLfaxeuL+7qG30tlfoiwW1C/aRreTbnxRrJpMKduGR6ULAHtMhkjjgKdDMDwX+r
 SAp+x+sP71sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; d="scan'208";a="253273018"
Received: from svarahab-mobl.amr.corp.intel.com (HELO [10.212.190.40])
 ([10.212.190.40])
 by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 11:17:20 -0700
Subject: Re: [RFC PATCH 02/16] ASoC: pcm512x: use "sclk" string to retrieve
 clock
To: Mark Brown <broonie@kernel.org>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-3-pierre-louis.bossart@linux.intel.com>
 <20200414174530.GK5412@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8ee01a4f-ceb2-d207-7cef-cf766fa670af@linux.intel.com>
Date: Tue, 14 Apr 2020 13:14:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414174530.GK5412@sirena.org.uk>
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



On 4/14/20 12:45 PM, Mark Brown wrote:
> On Thu, Apr 09, 2020 at 02:58:27PM -0500, Pierre-Louis Bossart wrote:
>> Using devm_clk_get() with a NULL string fails on ACPI platforms, use
>> the "sclk" string as a fallback.
> 
> Is this something that could be fixed at the ACPI level?

I guess to fix this we'd need some sort of ACPI-level connection or 
description of the clock, and I've never seen such a description?

All the examples I've seen use an explicit 'mclk' string (that's e.g. 
what we did for the PMC clocks for Baytrail/Cherrytrail machine drivers, 
we added a lookup). Here I used 'sclk' since it's what TI refers to in 
their documentation.

I vaguely recall AMD had similar issues with another codec.
