Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E52F28FADB8
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 10:39:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C420E9D;
	Tue,  4 Jun 2024 10:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C420E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717490341;
	bh=clr8PNzp28iEXJhUzMTN+VUpyOtU7H+K9NS8XY7eqY8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OimjP3e17nswyRK16bBAOOaAZ++SlNHeqGKfQjTmDx6SnT1xG1/Z6mqAVOf/elti3
	 CSfoDxZ3xYh9OUs4gDTBspn8YAXimTz/3KHlWh4Bsk8pdE8rifwnh7nWRJeyc7bAhz
	 6oft7Ppy0lZSKC8W/gl4T6avXkO+Ptwz3KQt1X6g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91A29F805D4; Tue,  4 Jun 2024 10:38:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61F9DF805C0;
	Tue,  4 Jun 2024 10:38:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D07BF80496; Tue,  4 Jun 2024 10:38:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33B1AF800FA
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 10:37:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33B1AF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QAox7PD0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717490282; x=1749026282;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=clr8PNzp28iEXJhUzMTN+VUpyOtU7H+K9NS8XY7eqY8=;
  b=QAox7PD0AxjRNLUH4rvf+IpWT7plRAVSUIRsgwgi2CWdFcRTfagdokxS
   Rr0J0QubExGsH15c5CXM9Fo2rZERBQ56IyeoiZAFBpK1PLunci+yf4oKb
   sop3ab/QBXVhD/QikJUx0XD1QDzRP2edU1piO9zL5AJ8c3rsBU8A89JGF
   YlmZTlg2BcXql8ESg2z8K7jZMbgRrs8ma6ofp55OCKbCt1ZCakOpdFOQN
   BKGE6la5dhMczEXqFs33XenfvKxgQV15qyKcW5P0nzHegzw3RAGFBiDDU
   H3Z2/ul2AVh68RDi9Tt2fhfAw+8heBxVUPmy+DXTuB0CvtB2/90vwK//Y
   g==;
X-CSE-ConnectionGUID: 7hab8v+GT9CGk8sx24sQNg==
X-CSE-MsgGUID: maO07Mh3RmOVJP8YEPc/gQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17809391"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000";
   d="scan'208";a="17809391"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:38:00 -0700
X-CSE-ConnectionGUID: Jjtca514SqqL9VXY00N8mw==
X-CSE-MsgGUID: ZUNS3a2lS5SevAcJlkaM4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000";
   d="scan'208";a="37638040"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.105])
 ([10.245.246.105])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:37:58 -0700
Message-ID: <e1c63097-b628-4c97-add6-40fa479a7806@linux.intel.com>
Date: Tue, 4 Jun 2024 10:37:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] soundwire: bus: drop redundant probe debug message
To: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20240604075213.20815-1-johan+linaro@kernel.org>
 <20240604075213.20815-5-johan+linaro@kernel.org>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240604075213.20815-5-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7QU6XSTETR4URURYWQ33ZFHFQ43O7YTG
X-Message-ID-Hash: 7QU6XSTETR4URURYWQ33ZFHFQ43O7YTG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7QU6XSTETR4URURYWQ33ZFHFQ43O7YTG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/4/24 02:52, Johan Hovold wrote:
> Drop the redundant probe debug message which is already provided by
> driver core. Whether probe succeeded can also be determined through
> sysfs.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/soundwire/bus_type.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 43e732ca73c0..5b9b129badff 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -152,8 +152,6 @@ static int sdw_drv_probe(struct device *dev)
>  
>  	mutex_unlock(&slave->sdw_dev_lock);
>  
> -	dev_dbg(dev, "probe complete\n");
> -
>  	return 0;
>  }

I don't see the point of removing this, we've used it for the last 5
years to figure out when the probe complete vs. when the device becomes
attached. It's a simple log that helped us immensely with race
conditions, etc.

And no, sysfs is not a viable alternative to look at CI logs, and
enabling dynamic debug on the driver core would be way to verbose.
