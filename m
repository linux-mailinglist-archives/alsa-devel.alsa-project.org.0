Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A28D21A891F
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 20:20:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48B07169D;
	Tue, 14 Apr 2020 20:20:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48B07169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586888458;
	bh=0XOYLW1TG0sNcxurg9zPZnXL7edftdvPFeW1BUnPR+w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lM2XyGkcvtQCkQ5Rb1F+BOz0yMuAnXlNGnUBUugabH7sFFBG7snnUd0jcRZixffLJ
	 HnuvhoguzTJ8zC81v8Kpgep3bdXfGFEk4mkkYkmJexhWvJx2sCG4bq0P5KeRF1sdd2
	 fcuU3XQqMTrExfHdWlh4pUFsDTnM9ZpHvRw+yhlc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08460F802BC;
	Tue, 14 Apr 2020 20:17:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F0FDF802A8; Tue, 14 Apr 2020 20:17:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65EF1F802A0
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 20:17:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65EF1F802A0
IronPort-SDR: FPpfc+BWJQPiLNOlgnx02jWgzfYGeXByL3f9BAtqgxCob4JjgwBwBeh25MvlKe75qWF0qFsnv5
 LP2FwMSBtf1w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 11:17:03 -0700
IronPort-SDR: 425xsj/me+Mu6KoRt4fmVvOx1tDcYvRrrY3jMhJI3+ahp/vk1Nz3R6YgMJAcUuVTc1v1tVNijn
 4HDs1NURcHXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; d="scan'208";a="253272934"
Received: from svarahab-mobl.amr.corp.intel.com (HELO [10.212.190.40])
 ([10.212.190.40])
 by orsmga003.jf.intel.com with ESMTP; 14 Apr 2020 11:16:58 -0700
Subject: Re: [RFC PATCH 05/16] ASoC: Intel: sof-pcm512x: reconfigure sclk in
 hw_params if needed
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200409195841.18901-1-pierre-louis.bossart@linux.intel.com>
 <20200409195841.18901-6-pierre-louis.bossart@linux.intel.com>
 <20200414172459.GE34613@smile.fi.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d7817bad-eae5-a2e9-ef3b-240419e5f285@linux.intel.com>
Date: Tue, 14 Apr 2020 13:06:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414172459.GE34613@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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


>> +	err = snd_interval_ratnum(hw_param_interval(params,
>> +						    SNDRV_PCM_HW_PARAM_RATE),
>> +				  1, &rats_no_pll, &num, &den);
> 
>> +	if (err >= 0 && den) {
> 
> Perhaps usual pattern, i.e.
> 
> 	if (err < 0 || !den)
> 		return 0;
> (so, above seems optional configuration)
> 
> 	params...;
> 	return 0;

ok

> 
>> +	if (ctx->is_dac_pro) {
> 
> 	if (!...)
> 		return 0;
> 
> ...and drop the redundant ret assignment above.

yes, this was suggested by Guennadi today as well.


>> +		ret = aif1_update_rate_den(substream, params);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to update rate denominator: %d\n", ret);
>> +			return ret;
>> +		}
> 
> Do you still need below steps when current_rate == sclk_rate?

Good question. I assume the values are properly stored by the regmap 
cache, but if these channel and width do change (something we don't 
support for now) then yes we should move this out of the if case.

I'll give it a try, thanks for flagging this.

>> +		ret = snd_soc_dai_set_bclk_ratio(rtd->codec_dai,
>> +						 channels * width);
>> +		if (ret) {
>> +			dev_err(dev, "Failed to set bclk ratio : %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
> 
