Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 174C88FADB9
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 10:39:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1230DF55;
	Tue,  4 Jun 2024 10:39:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1230DF55
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717490352;
	bh=YxyvpYu5+hq9m2N6cRjmeKqrhwAeBwX4i0FpqUqrPrk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DMc7+qa3iMHT3fVUim1RBuCpLJ0tcbnvAaOk2eDUCqhHpNVnQK1v/6qp3PeXSLAu9
	 Su107BkHY5XADOH9XliZl1vATLnv2JJx6ivoXxkC06+nsHKr2lzWYCEbqm5wqWEpjs
	 D6I7/bSArrhcRBcH5ZLfiWxq9YysJxDnsZS8A/4g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38261F805FA; Tue,  4 Jun 2024 10:38:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A322F805EE;
	Tue,  4 Jun 2024 10:38:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA857F8025A; Tue,  4 Jun 2024 10:38:04 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B22FF8003A
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 10:37:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B22FF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kJZwzjO1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717490280; x=1749026280;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=YxyvpYu5+hq9m2N6cRjmeKqrhwAeBwX4i0FpqUqrPrk=;
  b=kJZwzjO1NzLjfaMzZNbRVdH3j31ESLBtjcjBr02J+3PLIJlUO9oTZG+Y
   USpOxA2I/YlcZXwRa/HYKe3CtGa3LLtHfi93VmVNvmNsN+REDbMqm02Rh
   xbX/jtTAhsZmgeZ9dgPp5FkjuGsFO8Qpb8DIZiIz+td+FVOVtAOi2Aow2
   /CQgeYl43ncXm8+0VqPB/gJuDjI9Ew4Q+yj2X5Dc1MVyScGY21WCw2EBt
   9g8DPmnCQbMIINxTPmFhcRvULqN6l3NBIw/xGW96+tdxxb4itCl4iUA0t
   d82QAzKN3eGNxuUGf7AYOYM5TJfXRufInfddyYeVYBU6k4hk1fx0KbWdX
   w==;
X-CSE-ConnectionGUID: htVbHL+hQGeitcQsB6Pp+A==
X-CSE-MsgGUID: bLhkb2KxRguCo75G5VKpuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="17809388"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000";
   d="scan'208";a="17809388"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:37:57 -0700
X-CSE-ConnectionGUID: 6NACwwD1SJ+/9p6O2rfM0Q==
X-CSE-MsgGUID: xOEvdgI2QUG6h7dt4G7Ypw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000";
   d="scan'208";a="37638037"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO [10.245.246.105])
 ([10.245.246.105])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 01:37:55 -0700
Message-ID: <8dd7cadc-138c-4ef5-b06f-7177550b1215@linux.intel.com>
Date: Tue, 4 Jun 2024 10:33:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] soundwire: bus: clean up probe warnings
To: Johan Hovold <johan+linaro@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20240604075213.20815-1-johan+linaro@kernel.org>
 <20240604075213.20815-4-johan+linaro@kernel.org>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240604075213.20815-4-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: D4FBHSCJRR2FVDHYSGTOQMGWJ4WYLWBO
X-Message-ID-Hash: D4FBHSCJRR2FVDHYSGTOQMGWJ4WYLWBO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D4FBHSCJRR2FVDHYSGTOQMGWJ4WYLWBO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/4/24 02:52, Johan Hovold wrote:
> Clean up the probe warning messages by using a common succinct format
> (e.g. without __func__ and with a space after ':').
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/soundwire/bus_type.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 3979be0f8b65..43e732ca73c0 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -123,7 +123,7 @@ static int sdw_drv_probe(struct device *dev)
>  	/* init the dynamic sysfs attributes we need */
>  	ret = sdw_slave_sysfs_dpn_init(slave);
>  	if (ret < 0)
> -		dev_warn(dev, "Slave sysfs init failed:%d\n", ret);
> +		dev_warn(dev, "failed to initialise sysfs: %d\n", ret);
>  
>  	/*
>  	 * Check for valid clk_stop_timeout, use DisCo worst case value of
> @@ -147,7 +147,7 @@ static int sdw_drv_probe(struct device *dev)
>  	if (drv->ops && drv->ops->update_status) {
>  		ret = drv->ops->update_status(slave, slave->status);
>  		if (ret < 0)
> -			dev_warn(dev, "%s: update_status failed with status %d\n", __func__, ret);
> +			dev_warn(dev, "failed to update status: %d\n", ret);

the __func__ does help IMHO, 'failed to update status' is way too general...
Replacing 'with status' by ":" is fine, but do we really care about 10
chars in a log?
