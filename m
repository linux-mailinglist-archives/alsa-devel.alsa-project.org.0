Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAAD1A891B
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 20:20:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8712016AE;
	Tue, 14 Apr 2020 20:19:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8712016AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586888415;
	bh=g8XxEuGvkW3QZN1to2dOAopNFSxEV5tPajKzUlfZ6Y0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W8R8pDiDVS17SCbI+rcUNBVE2IkaTNFNQlGvBj26t8f6k0YMC3H4lwyxsDLdfPDUh
	 q70ckvdUGUsMUqpDSbl7jRx7StzOy+YqSOhiwi9SmEX0IWqB3VrFWQRxnWVg2TBrXC
	 Cb6WGbjFQR7GAYlK4qjfZeudg7a2XOTTFIp8PhVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D8EDF802A1;
	Tue, 14 Apr 2020 20:17:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A327F802A0; Tue, 14 Apr 2020 20:17:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D066F80292
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 20:16:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D066F80292
IronPort-SDR: B3KttiPURol3IFd7u09cSqjsH4lGq0W/Sh6/elce0EnrYb6ZSlQiXGbjbnwWEC41OYYSqe3yT4
 HrYde/jYTf9g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 11:16:56 -0700
IronPort-SDR: PSCQxYOBgG/KRnSVwz6t0T307zmoiAEV1+rS7DuMMYdAflRVrE4k7RQuT8DDDeP3LYxtQ8Ysh2
 IjarvwZ20lXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; d="scan'208";a="253272925"
Received: from svarahab-mobl.amr.corp.intel.com (HELO [10.212.190.40])
 ([10.212.190.40])
 by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 11:16:53 -0700
Subject: Re: [RFC PATCH 04/16] ASoC: Intel: sof-pcm512x: detect Hifiberry DAC+
 PRO
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-5-pierre-louis.bossart@linux.intel.com>
 <20200414172002.GD34613@smile.fi.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d3b154f4-fa8a-50a5-7246-51d31e18c4e6@linux.intel.com>
Date: Tue, 14 Apr 2020 13:02:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414172002.GD34613@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Matthias Reichl <hias@horus.com>,
 tiwai@suse.de, Linus Walleij <linus.walleij@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Daniel Matuschek <daniel@hifiberry.com>,
 linux-clk@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 broonie@kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
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



On 4/14/20 12:20 PM, Andy Shevchenko wrote:
> On Thu, Apr 09, 2020 at 02:58:29PM -0500, Pierre-Louis Bossart wrote:
>> Try to detect HifiBerry 44.1 and 48kHz oscillators on codec init
> 
> ...
> 
>> +	ctx->sclk = devm_clk_get(rtd->card->dev, "sclk");
> 
> Is this in the bindings?

Not for now. the 'sclk' part is only used by me myself and I in an ACPI 
context. I can add this description if desired.
> 
>> +	if (IS_ERR(ctx->sclk)) {
> 
>> +		dev_info(dev, "Could not get SCLK, will operate in SOC master mode\n");
> 
> Sounds like devm_clk_get_optional().

I am not sure about the semantic here. This driver selects the one which 
implements this clock, so if we get a -ENOENT return it's a very bad 
sign. Not sure what suppressing the error and converting to NULL would do?

> 
>> +		goto skip_dacpro;
>> +	}
> 
