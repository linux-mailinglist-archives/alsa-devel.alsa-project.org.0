Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A217FF13
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 19:01:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCA7216D4;
	Fri,  2 Aug 2019 19:00:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCA7216D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564765281;
	bh=CKN095pHWBG627uU441m6lrmVXOHYrXSl+IoXYYapzU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vRYUkRDswybzckFjgqQiJIiD63y2RD2zhgEYbTZm1lNriiBdhYn1rzUK5hZ2/ZibG
	 0BCtH26KRUJNbz/r419xfOu2O/Ipos78UD/0GHEjq9+/Qf+QXHOBjwzm6KIFkGXKj7
	 JGujfr/jLVgSEy6unS4YytEtGB7b/sAC2PfTgfEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF87FF8049A;
	Fri,  2 Aug 2019 18:59:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E969F8048F; Fri,  2 Aug 2019 18:59:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F701F80114
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 18:59:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F701F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TCEBW38X"
Received: from localhost (unknown [106.51.106.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1952220644;
 Fri,  2 Aug 2019 16:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564765170;
 bh=css3TiD9hFLpyOJyxwQpDcPAKn6XWOJ8sWPynjEeDxA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TCEBW38XNwwGcSUNTevEsWJQrVwNiv5hlBRQrLnK7USqrL5mHxFbSTHR51HKDAL31
 G9MGwoi/fcMLXf+nP3t+4wsNCXmRuOjN53dPMozdQX8qXPDAmP8l/3mLSN7rvoKM2u
 djSvhTgnF1tMpGzcSpIP2QYZDCv6bvmPCJ4U4ua0=
Date: Fri, 2 Aug 2019 22:28:16 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190802165816.GU12733@vkoul-mobl.Dlink>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-18-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-18-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 25-07-19, 18:40, Pierre-Louis Bossart wrote:
> Not all platforms support runtime_pm for now, let's use runtime_pm
> only when enabled.

We discussed this with Ulf sometime back and it was a consensus the core
should handle it, but that may take a while.

So that led me to explore what others do notably ASoC, based on this I
feel we should not check the error code. We handle the non streaming
case here but streaming is handled in ASoC which doesnt check the return

Pierre, can you verify the below patch and let me know if that is fine
for Intel platforms

--- >8 ---

From: Vinod Koul <vkoul@kernel.org>
Date: Fri, 2 Aug 2019 22:15:11 +0530
Subject: [PATCH] soundwire: dont check return of pm_runtime_get_sync()

Soundwire core checks pm_runtime_get_sync() return. But in case the
driver has not enabled runtime pm we get an error.

To fix this, dont check the return. We handle the non streaming case in
framework but streaming case has similar handling in ASoC so make it
same across use cases

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soundwire/bus.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index fe745830a261..9cdf7e9e0852 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -326,9 +326,7 @@ int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 	if (ret < 0)
 		return ret;
 
-	ret = pm_runtime_get_sync(slave->bus->dev);
-	if (ret < 0)
-		return ret;
+	pm_runtime_get_sync(slave->bus->dev);
 
 	ret = sdw_transfer(slave->bus, &msg);
 	pm_runtime_put(slave->bus->dev);
@@ -354,9 +352,7 @@ int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
 	if (ret < 0)
 		return ret;
 
-	ret = pm_runtime_get_sync(slave->bus->dev);
-	if (ret < 0)
-		return ret;
+	pm_runtime_get_sync(slave->bus->dev);
 
 	ret = sdw_transfer(slave->bus, &msg);
 	pm_runtime_put(slave->bus->dev);
-- 
2.20.1



> 
> Suggested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/bus.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 5ad4109dc72f..0a45dc5713df 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -332,12 +332,16 @@ int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
>  	if (ret < 0)
>  		return ret;
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
>  	ret = sdw_transfer(slave->bus, &msg);
> -	pm_runtime_put(slave->bus->dev);
> +
> +	if (pm_runtime_enabled(slave->bus->dev))
> +		pm_runtime_put(slave->bus->dev);
>  
>  	return ret;
>  }
> @@ -359,13 +363,16 @@ int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
>  			   slave->dev_num, SDW_MSG_FLAG_WRITE, val);
>  	if (ret < 0)
>  		return ret;
> -
> -	ret = pm_runtime_get_sync(slave->bus->dev);
> -	if (ret < 0)
> -		return ret;
> +	if (pm_runtime_enabled(slave->bus->dev)) {
> +		ret = pm_runtime_get_sync(slave->bus->dev);
> +		if (ret < 0)
> +			return ret;
> +	}
>  
>  	ret = sdw_transfer(slave->bus, &msg);
> -	pm_runtime_put(slave->bus->dev);
> +
> +	if (pm_runtime_enabled(slave->bus->dev))
> +		pm_runtime_put(slave->bus->dev);
>  
>  	return ret;
>  }
> -- 
> 2.20.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
