Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C2C689D9F
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 16:13:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B8B3825;
	Fri,  3 Feb 2023 16:12:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B8B3825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675437180;
	bh=cL3cDZ3cU575R2Pn0PMxEk6zsutuTJdd2e6As3uhekg=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Gk59GnCDWwrWOgO16hLXaCnrIpD4FWdrAp6+E5CJRghlfZoJ08Q3yrn87FqlZ/13S
	 jWCZRNdYU9PuSx0szjqH06DLZlWc+d2UrnSALonNWL5KR6f8ZhdVvCY3SQKbQxFgoa
	 XHORYBCb6Fl4EMbLcuHDJE1XGINs7WKVPDCcyDeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D29DF800E3;
	Fri,  3 Feb 2023 16:11:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40107F8045D; Fri,  3 Feb 2023 16:11:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DATE_IN_PAST_24_48,
 DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65651F80022
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 16:11:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65651F80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=B5cSXGLL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675437089; x=1706973089;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cL3cDZ3cU575R2Pn0PMxEk6zsutuTJdd2e6As3uhekg=;
 b=B5cSXGLLlzBUpGPup13pJULp7ImXWu2MZE27YzQ/gvaxDFC5zPbCdse6
 ENQGVu4XZjU0YVemp/GZGNbZ6LLeI/OwpzXBvPeKjSwTryi/gfjrzgWL9
 jef+GOs+Xh9E/qATQ5lQT5uZi1w3xNukyMEDIkWZPB0+XXZNvhh2gnlgR
 CarI/S4pnhLdWUjDzApZasuUDn9ZY1ohpu1qiostdhgqZRItd4oAvDUtH
 eg7HkFQoBtHbIwlFpxyE9TwS0+zLVp9n9RDOBSlk65hZVT25c1ZdrSEQ8
 107IDQiUG1pcdk7CiKqCgXCwAEjFWXiKHohA5hEzOX39WfVZ44Ot+/u6Z Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330898237"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="330898237"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 07:11:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729289964"
X-IronPort-AV: E=Sophos;i="5.97,270,1669104000"; d="scan'208";a="729289964"
Received: from albuitra-desk.amr.corp.intel.com (HELO [10.209.172.145])
 ([10.209.172.145])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 07:11:25 -0800
Message-ID: <84adef23-fecf-76ec-c597-5f8b4be214da@linux.intel.com>
Date: Wed, 1 Feb 2023 17:21:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH] soundwire: export sdw_compute_slave_ports() function
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20230201165944.3169125-1-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230201165944.3169125-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mastan.Katragadda@amd.com, Sunilkumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Mario.Limonciello@amd.com,
 arungopal.kondaveeti@amd.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 2/1/23 10:59, Vijendar Mukunda wrote:
> Export sdw_compute_slave_ports() function to use it in another
> soundwire manager module.
> Move sdw_transport_data structure to bus header file to export
> sdw_compute_slave_ports() function.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>


If a specific platform has a need to modify parts of the bit allocation
but can reuse parts of the code, that's fine. The 'generic bandwidth
allocation' was meant to be a reference, not a one-size-fits-all solution.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  drivers/soundwire/bus.h                          |  9 +++++++++
>  drivers/soundwire/generic_bandwidth_allocation.c | 12 +++---------
>  2 files changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
> index 7631ef5e71fb..141b99ac58de 100644
> --- a/drivers/soundwire/bus.h
> +++ b/drivers/soundwire/bus.h
> @@ -144,6 +144,13 @@ struct sdw_master_runtime {
>  	struct list_head bus_node;
>  };
>  
> +struct sdw_transport_data {
> +	int hstart;
> +	int hstop;
> +	int block_offset;
> +	int sub_block_offset;
> +};
> +
>  struct sdw_dpn_prop *sdw_get_slave_dpn_prop(struct sdw_slave *slave,
>  					    enum sdw_data_direction direction,
>  					    unsigned int port_num);
> @@ -213,5 +220,7 @@ int sdw_bwrite_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr, u8 val
>  
>  void sdw_clear_slave_status(struct sdw_bus *bus, u32 request);
>  int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
> +void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
> +			     struct sdw_transport_data *t_data);
>  
>  #endif /* __SDW_BUS_H */
> diff --git a/drivers/soundwire/generic_bandwidth_allocation.c b/drivers/soundwire/generic_bandwidth_allocation.c
> index f7c66083a4dd..39543048baa7 100644
> --- a/drivers/soundwire/generic_bandwidth_allocation.c
> +++ b/drivers/soundwire/generic_bandwidth_allocation.c
> @@ -28,15 +28,8 @@ struct sdw_group {
>  	unsigned int *rates;
>  };
>  
> -struct sdw_transport_data {
> -	int hstart;
> -	int hstop;
> -	int block_offset;
> -	int sub_block_offset;
> -};
> -
> -static void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
> -				    struct sdw_transport_data *t_data)
> +void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
> +			     struct sdw_transport_data *t_data)
>  {
>  	struct sdw_slave_runtime *s_rt = NULL;
>  	struct sdw_port_runtime *p_rt;
> @@ -85,6 +78,7 @@ static void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
>  		}
>  	}
>  }
> +EXPORT_SYMBOL(sdw_compute_slave_ports);
>  
>  static void sdw_compute_master_ports(struct sdw_master_runtime *m_rt,
>  				     struct sdw_group_params *params,
