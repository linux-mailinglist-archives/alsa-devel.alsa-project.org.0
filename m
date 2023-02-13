Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EC4694F57
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 19:27:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D98A843;
	Mon, 13 Feb 2023 19:26:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D98A843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676312852;
	bh=tMEckqgOlH5nqIW0iJkz8l92zxlASQbCXtqfirb5BWY=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PTb5VEfyYGEzYSes8UA8ZduQupHVXVNhODKmSB/uI0C/f7lsnxZ2yi/qTQJoLEXuH
	 Z81112s+d1EZJ1mdF3srxn0Gi01vXc5YQzHdXb+YkcyxOQxnw0tFD5GGTwOGEYYVMI
	 ZO7EyaqDsA8KCMJyW9BtgaewyD8FM+iNwc8n62t8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECDCBF80553;
	Mon, 13 Feb 2023 19:25:14 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2D8EF80529; Mon, 13 Feb 2023 19:25:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79496F804DA
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 19:24:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79496F804DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=h3V4dod2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676312697; x=1707848697;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tMEckqgOlH5nqIW0iJkz8l92zxlASQbCXtqfirb5BWY=;
  b=h3V4dod20ARl8nBVtRLChtv/6QjyPBBy138TqQpgoadJmPtyAttcqxm3
   gWG1UYim+pVHkV/GFU0CIsTvqDYKk+Cic/FlGxR2OefsN06GTPTytx/ke
   gmcpGQluVfH4GjCxDWtxlpLnUIxfWTkTsh7hzFyeIdjeIb8zfuvVRxqOl
   9kMjKrjmGplY3ADG7szEe8EdVCIly5z+V0T1kCVBsWWeZh3sESBMtkaY0
   h5CYGgfX3jCCYME6GR6MSWG3o/HR9rg6/sVC2lxDcIl/Lqjhqxn+RNe8h
   NbqrLKqqC78m3NU8c0rL9GOni/ZIv1pbQmrukvhmCyrFZzKQXilcs0BBn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="328664090"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000";
   d="scan'208";a="328664090"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 10:24:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="701369338"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000";
   d="scan'208";a="701369338"
Received: from eatoledo-mobl.amr.corp.intel.com (HELO [10.212.18.132])
 ([10.212.18.132])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 10:24:42 -0800
Message-ID: <cd70a91c-231e-1bca-b0ac-4041cba0daad@linux.intel.com>
Date: Mon, 13 Feb 2023 12:24:00 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V2 7/8] soundwire: amd: handle soundwire wake enable
 interrupt
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
References: <20230213094031.2231058-1-Vijendar.Mukunda@amd.com>
 <20230213094031.2231058-8-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230213094031.2231058-8-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NF33TJDUI36KD5R2MHK4OI2GADTEICP2
X-Message-ID-Hash: NF33TJDUI36KD5R2MHK4OI2GADTEICP2
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: amadeuszx.slawinski@linux.intel.com, Mario.Limonciello@amd.com,
 Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Mastan.Katragadda@amd.com, Arungopal.kondaveeti@amd.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 "moderated list:SOUNDWIRE SUBSYSTEM" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NF33TJDUI36KD5R2MHK4OI2GADTEICP2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/13/23 03:40, Vijendar Mukunda wrote:
> Add wake enable interrupt support for both the soundwire manager
> instances.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Signed-off-by: Mastan Katragadda <Mastan.Katragadda@amd.com>
> ---
>  drivers/soundwire/amd_manager.c | 10 ++++++++++
>  drivers/soundwire/amd_manager.h |  1 +
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index eced189ba6e0..e53dc67f8529 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -934,6 +934,13 @@ static void amd_sdw_update_slave_status(u32 status_change_0to7, u32 status_chang
>  	}
>  }
>  
> +static void amd_sdw_process_wake_event(struct amd_sdw_manager *amd_manager)
> +{
> +	pm_request_resume(amd_manager->dev);
> +	acp_reg_writel(0x00, amd_manager->acp_mmio + ACP_SW_WAKE_EN(amd_manager->instance));
> +	acp_reg_writel(0x00, amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_8TO11);
> +}
> +
>  static void amd_sdw_irq_thread(struct work_struct *work)
>  {
>  	struct amd_sdw_manager *amd_manager =
> @@ -945,6 +952,9 @@ static void amd_sdw_irq_thread(struct work_struct *work)
>  	status_change_0to7 = acp_reg_readl(amd_manager->mmio + ACP_SW_STATE_CHANGE_STATUS_0TO7);
>  	dev_dbg(amd_manager->dev, "%s [SDW%d] SDW INT: 0to7=0x%x, 8to11=0x%x\n",
>  		__func__, amd_manager->instance, status_change_0to7, status_change_8to11);
> +	if (status_change_8to11 & AMD_SDW_WAKE_STAT_MASK)
> +		return amd_sdw_process_wake_event(amd_manager);
> +

it's not clear what 8to11 might have to do with the wake enable?

Can't you have a wake for devices 1..7?


>  	if (status_change_8to11 & AMD_SDW_PREQ_INTR_STAT) {
>  		amd_sdw_read_and_process_ping_status(amd_manager);
>  	} else {
> diff --git a/drivers/soundwire/amd_manager.h b/drivers/soundwire/amd_manager.h
> index 6ec37612ae4e..86bc6d4f48bf 100644
> --- a/drivers/soundwire/amd_manager.h
> +++ b/drivers/soundwire/amd_manager.h
> @@ -190,6 +190,7 @@
>  #define AMD_SDW_CLK_STOP_DONE				1
>  #define AMD_SDW_CLK_RESUME_REQ				2
>  #define AMD_SDW_CLK_RESUME_DONE				3
> +#define AMD_SDW_WAKE_STAT_MASK				BIT(16)
>  
>  enum amd_sdw_cmd_type {
>  	AMD_SDW_CMD_PING = 0,
