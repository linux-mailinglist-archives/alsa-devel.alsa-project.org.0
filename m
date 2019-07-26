Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CE0770FF
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 20:10:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73ABD1779;
	Fri, 26 Jul 2019 20:10:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73ABD1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564164652;
	bh=3fIRQiZYQHZ07LZTeyYZ95fzFABoSUzkzQe7yEFd0E4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tZ2nBX64vooVNUZPgY0CEvMoH7iTEJrefr8DxWfG7Pq2s6ak5IIEGGrpoSn+GOBtA
	 IgBhE+qeP0nVUbsct5xARGcO0mB2oE8Q67CtwjHg9Pcgjhs4+x70KGWkLTJX/xfPsK
	 H4S6aEwg+IzVzfrynk/DOKYNieA95eNC5fyi1ni8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03251F803D1;
	Fri, 26 Jul 2019 20:09:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 119D7F80393; Fri, 26 Jul 2019 20:09:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODYSUB_10, SPF_HELO_NONE, 
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E54EDF801A4
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 20:09:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E54EDF801A4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 11:08:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="198474640"
Received: from andawes-mobl.amr.corp.intel.com (HELO [10.251.145.66])
 ([10.251.145.66])
 by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2019 11:08:57 -0700
To: alsa-devel@alsa-project.org
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-18-pierre-louis.bossart@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <45a912c5-134b-8642-70ef-8c1060389300@linux.intel.com>
Date: Fri, 26 Jul 2019 13:08:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725234032.21152-18-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 17/40] soundwire: bus: use
 runtime_pm_get_sync/pm when enabled
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

This thread became unreadable with interleaved top-posting, allow me 
restate the options and ask PM folks what they think

On 7/25/19 6:40 PM, Pierre-Louis Bossart wrote:
> Not all platforms support runtime_pm for now, let's use runtime_pm
> only when enabled.
> 
> Suggested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   drivers/soundwire/bus.c | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 5ad4109dc72f..0a45dc5713df 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -332,12 +332,16 @@ int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
>   	if (ret < 0)
>   		return ret;
>   
> -	ret = pm_runtime_get_sync(slave->bus->dev);
> -	if (ret < 0)
> -		return ret;
> +	if (pm_runtime_enabled(slave->bus->dev)) {
> +		ret = pm_runtime_get_sync(slave->bus->dev);
> +		if (ret < 0)
> +			return ret;
> +	}
>   
>   	ret = sdw_transfer(slave->bus, &msg);
> -	pm_runtime_put(slave->bus->dev);
> +
> +	if (pm_runtime_enabled(slave->bus->dev))
> +		pm_runtime_put(slave->bus->dev);

This is option1: we explicitly test if pm_runtime is enabled before 
calling _get_sync() and _put()

option2 (suggested by Jan Kotas): catch the -EACCESS error code

  	ret = pm_runtime_get_sync(slave->bus->dev);
-	if (ret < 0)
+	if (ret < 0 && ret != -EACCES)
  		return ret;

option3: ignore the return value as done in quite a few drivers

Are there any other options? I am personally surprised this is not 
handled in the pm_runtime core, not sure why users need to test for this?

Thanks
Pierre
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
