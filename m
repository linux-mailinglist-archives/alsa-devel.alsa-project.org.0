Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9940793123D
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jul 2024 12:24:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BEBBEDB;
	Mon, 15 Jul 2024 12:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BEBBEDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721039088;
	bh=L1bddvNpW2JSZGxsWMXxNwVCNw6Mlro5NMh+sB6z/Z4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DPsQOyqA8Nsjd/EnpC5CaKvEXbtykvodlmU3xSPJP4CYvqsSyV1Zw/JgOq5wiFnnp
	 F9LkuUbkDVeXw/U0actOCqeaDgPVAc7nqBTrogtCJmw3D12xMdZQyd6oRbdxlfn5di
	 5sqhU6N0Xf7eVgUNU1n7wfdQDSDglacEWlOqaB/M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 029F7F80518; Mon, 15 Jul 2024 12:24:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 16931F805D6;
	Mon, 15 Jul 2024 12:24:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2450BF801C0; Mon, 15 Jul 2024 12:18:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42D2FF8026D
	for <alsa-devel@alsa-project.org>; Mon, 15 Jul 2024 12:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42D2FF8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ql+EdNr7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721038471; x=1752574471;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=L1bddvNpW2JSZGxsWMXxNwVCNw6Mlro5NMh+sB6z/Z4=;
  b=Ql+EdNr7WbhXq2FvnUPGj96AdaJKWy2cJwjtIh+GU/WzETKTTTzq71bZ
   ZoSMM5UBHJl3n9/dBmOjTyVpdyAETtdzv5aWaC1Q9Ici1swOHQedLvoHk
   mPOpxyfGrNzl9j4zGOpZwRx1sOF3EfR92YfERV+0I9ILuYtubKUP0sb5+
   GkbJcJngg6UoieYwlLcDhVou8T7GZWNC1XbFFQraIHtBZHJnZBBNDHAjW
   OaUFtVcD0VYx1zFtqscdF7iJFlS87/9OKrr/Oltpdl4gvnUOcKPjM57EP
   h1qtfVwQNw7Tr4XVQa+fn1Dma1rPb43FEsDTYQJ39l0RLDEj0+fTbc1jZ
   Q==;
X-CSE-ConnectionGUID: 2Jz4U2kOQ7+hjbqhOYxeuA==
X-CSE-MsgGUID: v/GEVWDaSruDz+MDMJvVJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="35950258"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800";
   d="scan'208";a="35950258"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 03:14:24 -0700
X-CSE-ConnectionGUID: 5/dgto6aSs2Kmkae56FYHw==
X-CSE-MsgGUID: sHt4WkWgROqcSe9Ym6+ndA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800";
   d="scan'208";a="49455954"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.246.147])
 ([10.245.246.147])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 03:14:21 -0700
Message-ID: <5a39e413-a17e-413b-9bd2-f8e0b0d0e86b@linux.intel.com>
Date: Mon, 15 Jul 2024 11:24:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] soundwire: bus: drop unused driver name field
To: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20240712140801.24267-1-johan+linaro@kernel.org>
 <20240712140801.24267-3-johan+linaro@kernel.org>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240712140801.24267-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4QJUV6X4KNHSC5PEVJYAMA6V5ZVKE2X7
X-Message-ID-Hash: 4QJUV6X4KNHSC5PEVJYAMA6V5ZVKE2X7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4QJUV6X4KNHSC5PEVJYAMA6V5ZVKE2X7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/12/24 16:08, Johan Hovold wrote:
> The soundwire driver name field is not currently used by any driver (and
> even appears to never have been used) so drop it.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  drivers/soundwire/bus_type.c  | 9 ++-------
>  include/linux/soundwire/sdw.h | 2 --
>  2 files changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 85fa5970d98a..3979be0f8b65 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -198,16 +198,11 @@ static void sdw_drv_shutdown(struct device *dev)
>   */
>  int __sdw_register_driver(struct sdw_driver *drv, struct module *owner)
>  {
> -	const char *name;
> -
>  	drv->driver.bus = &sdw_bus_type;
>  
>  	if (!drv->probe) {
> -		name = drv->name;
> -		if (!name)
> -			name = drv->driver.name;
> -
> -		pr_err("driver %s didn't provide SDW probe routine\n", name);
> +		pr_err("driver %s didn't provide SDW probe routine\n",
> +				drv->driver.name);
>  		return -EINVAL;
>  	}
>  
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 13e96d8b7423..5e133dfec8f2 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -704,8 +704,6 @@ struct sdw_master_device {
>  	container_of(d, struct sdw_master_device, dev)
>  
>  struct sdw_driver {
> -	const char *name;
> -
>  	int (*probe)(struct sdw_slave *sdw,
>  			const struct sdw_device_id *id);
>  	int (*remove)(struct sdw_slave *sdw);
