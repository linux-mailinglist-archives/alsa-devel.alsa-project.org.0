Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E85B4910256
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 13:16:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 946EE205;
	Thu, 20 Jun 2024 13:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 946EE205
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718882165;
	bh=41V5qM2Xc8+hKW6MPPByw1cyUc6zgZCcguLz9Xf3LIg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=U+tx0HM4ckI2GydQEfg5UK6p6UjtTIDmaK7wwliwDGQ65npFOeRXg44EevRPmf22s
	 K8im3KTXDtznWuhtWTIqV7nVfSTUP1DVYB/S+ck7/2bgOmwZ2uLqYRp4005inW9xsk
	 NiIEeyGCegNRxLYvMC8b/sCcd3v4lCv7twcRvfaA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5202BF805F1; Thu, 20 Jun 2024 13:15:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D05DF805F8;
	Thu, 20 Jun 2024 13:15:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D863F8023A; Thu, 20 Jun 2024 13:14:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A65AF800ED
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 13:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A65AF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XdSeCAg4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718882064; x=1750418064;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=41V5qM2Xc8+hKW6MPPByw1cyUc6zgZCcguLz9Xf3LIg=;
  b=XdSeCAg4hneaYYSHHoqUYvCnc8BmvC/F8cd+JdWcSdF6CTpGSUGWifK0
   v8e8PcKW0d/owpSYi1cVzXrmOM8phSe1xbbZ/Ets4F/6JkDht9064e/R0
   NpdmAU27CICJqEGS+wbXUE0sR+zxiYXKLGZzSGB3/28EAFshpv3qfWECe
   UYBQrYpDz6+8csAU9RG79TeIvZrlsJob+sfbP6gGWC1yrEYnp+BYQ9R1n
   k2Rl4mEkLlLCOHqrHvYQPx46+fkqzLH1vzPnbzH/GlzI7WnG5tRyvUbGi
   2LKjGkOUpMBbC57/7EL8jIs2+d7eydc/wOExHflboI3te8wQJow+Lbjhi
   Q==;
X-CSE-ConnectionGUID: 5fQPK2thS4Osizu1PWPYDg==
X-CSE-MsgGUID: 2rotYaLMS9OFYtKQJ1kHTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="12161664"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000";
   d="scan'208";a="12161664"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 04:14:19 -0700
X-CSE-ConnectionGUID: v4ovnh61T3ukPwlwybUEKA==
X-CSE-MsgGUID: opO1isRZRx6et/8qXf718w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000";
   d="scan'208";a="46660974"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.65])
 ([10.245.246.65])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 04:14:17 -0700
Message-ID: <6f51ef55-54a7-4dfc-b203-77bc48790c62@linux.intel.com>
Date: Thu, 20 Jun 2024 13:14:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: bus: simplify by using local slave->prop
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20240620091046.12426-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240620091046.12426-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2TEIPBCRSFTIEICCT4S7XVMSQIWZPB33
X-Message-ID-Hash: 2TEIPBCRSFTIEICCT4S7XVMSQIWZPB33
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2TEIPBCRSFTIEICCT4S7XVMSQIWZPB33/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/20/24 11:10, Krzysztof Kozlowski wrote:
> The sdw_initialize_slave() function stores 'slave->prop' as local 'prop'
> variable, so use it in all applicable places to make code a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  drivers/soundwire/bus.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 191e6cc6f962..263ca32f0c5c 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1410,7 +1410,7 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
>  		}
>  	}
>  	if ((slave->bus->prop.quirks & SDW_MASTER_QUIRKS_CLEAR_INITIAL_PARITY) &&
> -	    !(slave->prop.quirks & SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY)) {
> +	    !(prop->quirks & SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY)) {
>  		/* Clear parity interrupt before enabling interrupt mask */
>  		status = sdw_read_no_pm(slave, SDW_SCP_INT1);
>  		if (status < 0) {
> @@ -1436,7 +1436,7 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
>  	 * device-dependent, it might e.g. only be enabled in
>  	 * steady-state after a couple of frames.
>  	 */
> -	val = slave->prop.scp_int1_mask;
> +	val = prop->scp_int1_mask;
>  
>  	/* Enable SCP interrupts */
>  	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1, val, val);
> @@ -1447,7 +1447,7 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
>  	}
>  
>  	/* No need to continue if DP0 is not present */
> -	if (!slave->prop.dp0_prop)
> +	if (!prop->dp0_prop)
>  		return 0;
>  
>  	/* Enable DP0 interrupts */
