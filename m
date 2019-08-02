Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AE07FF76
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 19:22:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DECD16CC;
	Fri,  2 Aug 2019 19:21:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DECD16CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564766527;
	bh=ClRpudrwiEiKNxmGSu+v0w1IzKTdrpW5zn/KL2nFNiQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F+WrhfgAgt0qNdwFKlvAEzBgWBgtO2a23KN0xAPYFV/EPwYws/kMExO+mZjb2kubg
	 z1+rWOgsHKt+PtIFAMXv0ePZ4EKOdKIlpnettObxkFHkFKDkC1+YXa5mKPa1O31rbz
	 OfwjI9ps/ge4lMgjfeWwVttoFBpgCFoYmQlVYxNg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2D1DF8049B;
	Fri,  2 Aug 2019 19:20:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB31AF800F3; Fri,  2 Aug 2019 19:20:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DD53F800F3
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 19:20:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DD53F800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Aug 2019 10:20:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,338,1559545200"; d="scan'208";a="197270088"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 02 Aug 2019 10:20:12 -0700
Received: from cwhanson-mobl.amr.corp.intel.com (unknown [10.252.133.191])
 by linux.intel.com (Postfix) with ESMTP id 6A9885805B9;
 Fri,  2 Aug 2019 10:20:11 -0700 (PDT)
To: Vinod Koul <vkoul@kernel.org>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-18-pierre-louis.bossart@linux.intel.com>
 <20190802165816.GU12733@vkoul-mobl.Dlink>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1ca3579b-00ac-39a7-d60b-908d1447677c@linux.intel.com>
Date: Fri, 2 Aug 2019 12:20:10 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802165816.GU12733@vkoul-mobl.Dlink>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
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

On 8/2/19 11:58 AM, Vinod Koul wrote:
> On 25-07-19, 18:40, Pierre-Louis Bossart wrote:
>> Not all platforms support runtime_pm for now, let's use runtime_pm
>> only when enabled.
> 
> We discussed this with Ulf sometime back and it was a consensus the core
> should handle it, but that may take a while.
> 
> So that led me to explore what others do notably ASoC, based on this I
> feel we should not check the error code. We handle the non streaming
> case here but streaming is handled in ASoC which doesnt check the return
> 
> Pierre, can you verify the below patch and let me know if that is fine
> for Intel platforms

So if for some reason we cannot resume, then we'd still initiate a 
transaction and have even more issues to sort out.

Fail big and fail early would really be my preference.

Also the user of this function is largely the Slave driver, which 
typically doesn't do any streaming operation but controls the imp-def 
registers. The bus driver will only use this routine for standard 
registers and that's a very small part of the total traffic.

> 
> --- >8 ---
> 
> From: Vinod Koul <vkoul@kernel.org>
> Date: Fri, 2 Aug 2019 22:15:11 +0530
> Subject: [PATCH] soundwire: dont check return of pm_runtime_get_sync()
> 
> Soundwire core checks pm_runtime_get_sync() return. But in case the
> driver has not enabled runtime pm we get an error.
> 
> To fix this, dont check the return. We handle the non streaming case in
> framework but streaming case has similar handling in ASoC so make it
> same across use cases
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/soundwire/bus.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index fe745830a261..9cdf7e9e0852 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -326,9 +326,7 @@ int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
>   	if (ret < 0)
>   		return ret;
>   
> -	ret = pm_runtime_get_sync(slave->bus->dev);
> -	if (ret < 0)
> -		return ret;
> +	pm_runtime_get_sync(slave->bus->dev);
>   
>   	ret = sdw_transfer(slave->bus, &msg);
>   	pm_runtime_put(slave->bus->dev);
> @@ -354,9 +352,7 @@ int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
>   	if (ret < 0)
>   		return ret;
>   
> -	ret = pm_runtime_get_sync(slave->bus->dev);
> -	if (ret < 0)
> -		return ret;
> +	pm_runtime_get_sync(slave->bus->dev);
>   
>   	ret = sdw_transfer(slave->bus, &msg);
>   	pm_runtime_put(slave->bus->dev);
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
