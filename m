Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D50383551
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 17:33:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04BFF165F;
	Tue,  6 Aug 2019 17:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04BFF165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565105637;
	bh=LXnurt/KvxTZbHDOxRGjnIv2am6A/bUiAPjqIFUYu5A=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f1fCMOFojuDVkGsWEnmjh95FfzUrlQ84nP7A4SdrPv8HxYpuLTkg1wia+avm/x3Rf
	 beqTGI9lziAtyg1XxEMFR9rah8jzxpPLnn3P1B2Ohrei+vBKoiMLcrZ0EUB+SSOSel
	 YGfOrnwXUulqFHvRSCL/ryhuzgk6iAEx5iIiCE3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 621E7F80290;
	Tue,  6 Aug 2019 17:32:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2439F80483; Tue,  6 Aug 2019 17:32:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D086BF8011B
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 17:32:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D086BF8011B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2019 08:32:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="174210315"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.15.113])
 ([10.252.15.113])
 by fmsmga008.fm.intel.com with ESMTP; 06 Aug 2019 08:31:59 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20190806005522.22642-1-pierre-louis.bossart@linux.intel.com>
 <20190806005522.22642-10-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <a52b4fbd-1d97-d8b8-dd2c-fac30c6add4b@intel.com>
Date: Tue, 6 Aug 2019 17:31:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806005522.22642-10-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Blauciak@vger.kernel.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 Slawomir <slawomir.blauciak@intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH 09/17] soundwire: stream: remove
 unnecessary variable initializations
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2019-08-06 02:55, Pierre-Louis Bossart wrote:
> @@ -1493,6 +1493,11 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream)
>   		}
>   	}
>   
> +	if (!bus) {
> +		pr_err("Configuration error in %s\n", __func__);
> +		return -EINVAL;
> +	}
> +

This should probably be located in separate path - not at all an 
initialization removal.

> @@ -1573,6 +1578,11 @@ static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
>   		}
>   	}
>   
> +	if (!bus) {
> +		pr_err("Configuration error in %s\n", __func__);
> +		return -EINVAL;
> +	}
> +

Same here.

> @@ -1639,13 +1650,14 @@ static int _sdw_disable_stream(struct sdw_stream_runtime *stream)
>   
>   	ret = do_bank_switch(stream);
>   	if (ret < 0) {
> -		dev_err(bus->dev, "Bank switch failed: %d\n", ret);
> +		pr_err("Bank switch failed: %d\n", ret);
>   		return ret;
>   	}

Here too.

I might have missed something though I bet you got my point.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
