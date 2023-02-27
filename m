Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 644B46A46EA
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 17:23:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96083826;
	Mon, 27 Feb 2023 17:22:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96083826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677515025;
	bh=/H5jajqIkZJ9qNlrUca1p6fHslxzGwbu0vaBkTnfrYU=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f2vz/T2zCujq62jTrpUef+2aAmEmQ3pA1DeFtNTh6Yn+zAiiZLhTRqbWhWq63Ob1B
	 hQWfgDGvoPpjEthSGD1MgOKjWjsT3iakpO8hrqZ0WjVpHfBJVAxFR8gagDAFD+qgNQ
	 mMV0kwvQMuKNd7yMOV1YBFnJ8w0s/oRHd+G3/d/g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D502F8051B;
	Mon, 27 Feb 2023 17:22:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C30AF8049C; Mon, 27 Feb 2023 17:22:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B9DCF800BA
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 17:21:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B9DCF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ni3tmRvW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677514918; x=1709050918;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/H5jajqIkZJ9qNlrUca1p6fHslxzGwbu0vaBkTnfrYU=;
  b=ni3tmRvWuA0jnKL1OMYf2LUflMmADeMtJIUqFbznkb9Irs9+ROSuhqj5
   2oU0N19fofuY8tUZokGJYSHQugBp7pXy5of7RGxdFaMguwP2QfSYXfxQQ
   oFVqvGBJp28mispm9c7bljfFRrG8nHadFfrpj2jpY8KNNia2Y4M2D2+Ks
   XrhBBZG5vTEBHOmU+zh9chA069FpB+ygH455inrGE+zzFDldAtIj0GPkm
   y/I9MPRr7cteOpyZ7B/AkwtM2NWqrKiQgd9n8st7jMazi+9abkGKN8CcR
   RhBZ43ZWL4ENzT7EKNrJLD99LZC5fXFjCin5kujyUpRSqaYgV9xs2FyRU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="396451415"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400";
   d="scan'208";a="396451415"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 08:21:51 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="673790527"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400";
   d="scan'208";a="673790527"
Received: from jaidenno-mobl.amr.corp.intel.com (HELO [10.212.85.4])
 ([10.212.85.4])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 08:21:50 -0800
Message-ID: <189e24e1-682f-2df9-c54e-7c72a904c7e6@linux.intel.com>
Date: Mon, 27 Feb 2023 10:27:02 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH] soundwire: bus: Fix unbalanced pm_runtime_put() causing
 usage count underflow
To: Richard Fitzgerald <rf@opensource.cirrus.com>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
References: <20230227112933.1593997-1-rf@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230227112933.1593997-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DFCKQ4ICIHFBVYQQTYNA5TRGUIJNWBAF
X-Message-ID-Hash: DFCKQ4ICIHFBVYQQTYNA5TRGUIJNWBAF
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DFCKQ4ICIHFBVYQQTYNA5TRGUIJNWBAF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/27/23 06:29, Richard Fitzgerald wrote:
> This reverts commit
> 443a98e649b4 ("soundwire: bus: use pm_runtime_resume_and_get()")
> 
> Change calls to pm_runtime_resume_and_get() back to pm_runtime_get_sync().
> This fixes a usage count underrun caused by doing a pm_runtime_put() even
> though pm_runtime_resume_and_get() returned an error.
> 
> The three affected functions ignore -EACCES error from trying to get
> pm_runtime, and carry on, including a put at the end of the function.
> But pm_runtime_resume_and_get() does not increment the usage count if it
> returns an error. So in the -EACCES case you must not call
> pm_runtime_put().
> 
> The documentation for pm_runtime_get_sync() says:
>  "Consider using pm_runtime_resume_and_get() ...  as this is likely to
>  result in cleaner code."
> 
> In this case I don't think it results in cleaner code because the
> pm_runtime_put() at the end of the function would have to be conditional on
> the return value from pm_runtime_resume_and_get() at the top of the
> function.
> 
> pm_runtime_get_sync() doesn't have this problem because it always
> increments the count, so always needs a put. The code can just flow through
> and do the pm_runtime_put() unconditionally.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Agreed, in hindsight the move to use pm_runtime_resume_and_get() mostly
added issues left and right with limited benefits - just too hard to
review and figure out what cases work and which ones don't.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>



> ---
>  drivers/soundwire/bus.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 76515c33e639..4fd221d0cc81 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -571,9 +571,11 @@ int sdw_nread(struct sdw_slave *slave, u32 addr, size_t count, u8 *val)
>  {
>  	int ret;
>  
> -	ret = pm_runtime_resume_and_get(&slave->dev);
> -	if (ret < 0 && ret != -EACCES)
> +	ret = pm_runtime_get_sync(&slave->dev);
> +	if (ret < 0 && ret != -EACCES) {
> +		pm_runtime_put_noidle(&slave->dev);
>  		return ret;
> +	}
>  
>  	ret = sdw_nread_no_pm(slave, addr, count, val);
>  
> @@ -595,9 +597,11 @@ int sdw_nwrite(struct sdw_slave *slave, u32 addr, size_t count, const u8 *val)
>  {
>  	int ret;
>  
> -	ret = pm_runtime_resume_and_get(&slave->dev);
> -	if (ret < 0 && ret != -EACCES)
> +	ret = pm_runtime_get_sync(&slave->dev);
> +	if (ret < 0 && ret != -EACCES) {
> +		pm_runtime_put_noidle(&slave->dev);
>  		return ret;
> +	}
>  
>  	ret = sdw_nwrite_no_pm(slave, addr, count, val);
>  
> @@ -1565,9 +1569,10 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
>  
>  	sdw_modify_slave_status(slave, SDW_SLAVE_ALERT);
>  
> -	ret = pm_runtime_resume_and_get(&slave->dev);
> +	ret = pm_runtime_get_sync(&slave->dev);
>  	if (ret < 0 && ret != -EACCES) {
>  		dev_err(&slave->dev, "Failed to resume device: %d\n", ret);
> +		pm_runtime_put_noidle(&slave->dev);
>  		return ret;
>  	}
>  
