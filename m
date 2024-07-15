Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C8093123B
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jul 2024 12:24:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BFB5E76;
	Mon, 15 Jul 2024 12:24:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BFB5E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721039077;
	bh=8UdBXthv6kcV8OL3lTKGH5Wv7aPW5LihpSVs90pR3pE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=syQTxDtHDCiYNF3JCaXnJ+79MfsknJgSoyqRCFXHQevq1mYQBENcqu1YkIXrCDHuT
	 A60/ZxpG4x6s7xqy/N9bw/Aplz87P86NJwRcohKuW7ytUJtajZqiHHbE9gZkR0Q8Nz
	 GoulJKBnu84TqOMabhZ0jv8kyOIjQknibhYtwayE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3904F805B6; Mon, 15 Jul 2024 12:24:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29C7AF805AE;
	Mon, 15 Jul 2024 12:24:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06B61F800FA; Mon, 15 Jul 2024 12:18:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BEF3F800FA
	for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2024 12:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BEF3F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Q+YRYPQx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721038467; x=1752574467;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8UdBXthv6kcV8OL3lTKGH5Wv7aPW5LihpSVs90pR3pE=;
  b=Q+YRYPQxQd3J0rxNjDq2xxtAt/voq0t8AX69yZo4Xbvlpyi62GAf+OtY
   z3DfymCtGrP2t1YsrAF6FNQviDjMVgeybVKZFbzUHxVOeWKaWnI0AJmbC
   TqfV3eXCEaG86AWfWrwAHf0SONePlPhJHMnqBP8Tuank+41SjFYR2t56E
   oQcMVSl8tLbKQsq2IiT1N2B3r6sSLamVGJDmV9gGPAXb0emdmGj5y8Gzu
   GH3yRTO+ouHWnosyucq706fyRP48gRCZy13v3f8t2jxsWDOIasTkSoTho
   OB1TB+c17Iuuz9SormT5HRtuyll0vVbC85XCzMTWTNXKWx1dNBQWo+70F
   A==;
X-CSE-ConnectionGUID: GiGw76BdSlCvotJnQqYRQg==
X-CSE-MsgGUID: iSAVICnsTgSfoqaR67UeJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="35950254"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800";
   d="scan'208";a="35950254"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 03:14:21 -0700
X-CSE-ConnectionGUID: XApP/1ylRAaC9ZxzUMezUg==
X-CSE-MsgGUID: Pxd7zbB6SoaYGbcTy2LFFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800";
   d="scan'208";a="49455945"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.246.147])
 ([10.245.246.147])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 03:14:19 -0700
Message-ID: <28fbcffb-bf79-418d-93c9-cfe2516a69a5@linux.intel.com>
Date: Mon, 15 Jul 2024 11:23:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] soundwire: bus: suppress probe deferral errors
To: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20240712140801.24267-1-johan+linaro@kernel.org>
 <20240712140801.24267-2-johan+linaro@kernel.org>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240712140801.24267-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: F2OR7EBXJF5FANRTE3KZLWTDJ5FGFUPW
X-Message-ID-Hash: F2OR7EBXJF5FANRTE3KZLWTDJ5FGFUPW
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F2OR7EBXJF5FANRTE3KZLWTDJ5FGFUPW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/12/24 16:07, Johan Hovold wrote:
> Soundwire driver probe errors are currently being logged both by the bus
> code and driver core:
> 
> 	wsa884x-codec sdw:4:0:0217:0204:00:0: Probe of wsa884x-codec failed: -12
> 	wsa884x-codec sdw:4:0:0217:0204:00:0: probe with driver wsa884x-codec failed with error -12
> 
> Drop the redundant bus error message, which is also incorrectly being
> logged on probe deferral:
> 
> 	wsa884x-codec sdw:4:0:0217:0204:00:0: Probe of wsa884x-codec failed: -517
> 
> Note that no soundwire driver uses the driver struct name field, which
> will be removed by a follow-on change.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  drivers/soundwire/bus_type.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index c32faace618f..85fa5970d98a 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -83,7 +83,6 @@ static int sdw_drv_probe(struct device *dev)
>  	struct sdw_slave *slave = dev_to_sdw_dev(dev);
>  	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
>  	const struct sdw_device_id *id;
> -	const char *name;
>  	int ret;
>  
>  	/*
> @@ -108,11 +107,6 @@ static int sdw_drv_probe(struct device *dev)
>  
>  	ret = drv->probe(slave, id);
>  	if (ret) {
> -		name = drv->name;
> -		if (!name)
> -			name = drv->driver.name;
> -
> -		dev_err(dev, "Probe of %s failed: %d\n", name, ret);
>  		dev_pm_domain_detach(dev, false);
>  		return ret;
>  	}
