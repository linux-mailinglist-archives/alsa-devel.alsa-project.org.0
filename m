Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A49771EFBB
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 18:53:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B682C83A;
	Thu,  1 Jun 2023 18:53:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B682C83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685638432;
	bh=pm4VUQyubQxYWLZEuh6qnK28OPDj9UxOI+MeZtmOfaI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=npGw2Ht/sdFJsRetECOtxlCEFpnNBXmI9m1JRsvv2bHn2nJHavwkwH9IEhmT06s44
	 4neGw+7QKhYjuDjrfWTTO2XxBFm+MBBA2V8KheWhOYlyA3ZBx2joDBw7kzdncxF4ra
	 IlWDwOcSvEJb810vjFFhiCPIN4orfcn7DoSGFuhg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54823F8055A; Thu,  1 Jun 2023 18:52:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0117F80549;
	Thu,  1 Jun 2023 18:52:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36D1AF80199; Thu,  1 Jun 2023 18:52:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C5265F80132
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 18:51:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5265F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FxxQv6iW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685638321; x=1717174321;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=pm4VUQyubQxYWLZEuh6qnK28OPDj9UxOI+MeZtmOfaI=;
  b=FxxQv6iWb+LfUv3Lj7pouwAPRgAh8X9n82AktTBH5ZzoufI3S2Ok2Z+5
   kpnvI1J/3kkBuHkVzun4NlO/MZ85ThwpFL+rme0vsuzXPY1FqATeMw67Z
   8YJjdsJ6jM0z++R8h/8ElaCQYLrhM2yEbTAUiQMA3fw4FDcpdc4Etv5iB
   fHBkCOsdfYRLzX+fTvbJHU4z3dliWfQzbDaKe1AOjpYfcBTQBBte2ZyFl
   0+qr8yc5/nsDF4F6yKPoQIxHYptM4uUtgdNiu3Vvvek8/NDWI7hQSG68J
   OMGGEm8McpnVSRB9PaqXiLyo/425nWdAB/LAzZ1ZYuuiEH+x+BwYTOrZg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="421426881"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400";
   d="scan'208";a="421426881"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 09:51:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="777283282"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400";
   d="scan'208";a="777283282"
Received: from rcelisco-mobl.amr.corp.intel.com (HELO [10.212.207.82])
 ([10.212.207.82])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 09:51:56 -0700
Message-ID: <d9bbf549-7ee3-1f8f-ad66-75350a5baf52@linux.intel.com>
Date: Thu, 1 Jun 2023 11:39:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 2/4] soundwire: bandwidth allocation: Remove pointless
 variable
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20230601161622.1808135-1-ckeepax@opensource.cirrus.com>
 <20230601161622.1808135-2-ckeepax@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230601161622.1808135-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KYCMXUBY426X73GJQULCSZXRMWMSZ6FE
X-Message-ID-Hash: KYCMXUBY426X73GJQULCSZXRMWMSZ6FE
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KYCMXUBY426X73GJQULCSZXRMWMSZ6FE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/1/23 11:16, Charles Keepax wrote:
> The block_offset variable in _sdw_compute_port_params adds nothing
> either functionally or in terms of code clarity, remove it.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

This one is easy enough, thanks!

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  drivers/soundwire/generic_bandwidth_allocation.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
> index 325c475b6a66d..31162f2b56381 100644
> --- a/drivers/soundwire/generic_bandwidth_allocation.c
> +++ b/drivers/soundwire/generic_bandwidth_allocation.c
> @@ -139,20 +139,16 @@ static void _sdw_compute_port_params(struct sdw_bus *bus,
>  {
>  	struct sdw_master_runtime *m_rt;
>  	int hstop = bus->params.col - 1;
> -	int block_offset, port_bo, i;
> +	int port_bo, i;
>  
>  	/* Run loop for all groups to compute transport parameters */
>  	for (i = 0; i < count; i++) {
>  		port_bo = 1;
> -		block_offset = 1;
>  
>  		list_for_each_entry(m_rt, &bus->m_rt_list, bus_node) {
> -			sdw_compute_master_ports(m_rt, &params[i],
> -						 port_bo, hstop);
> +			sdw_compute_master_ports(m_rt, &params[i], port_bo, hstop);
>  
> -			block_offset += m_rt->ch_count *
> -					m_rt->stream->params.bps;
> -			port_bo = block_offset;
> +			port_bo += m_rt->ch_count * m_rt->stream->params.bps;
>  		}
>  
>  		hstop = hstop - params[i].hwidth;
