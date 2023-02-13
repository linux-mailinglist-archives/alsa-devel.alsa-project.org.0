Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F00694F52
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 19:27:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8614857;
	Mon, 13 Feb 2023 19:26:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8614857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676312826;
	bh=c+q7Nn9Rsvv1nO+4W6DB2XtQZhG0cfDRiAWTu+oyL1k=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f/JOZJNiOji5O/m3H+NdXrEcVMoy6m67Zo47tvm/CqYmWJQHnmE2tW98AU4ZpK52f
	 Xf1qA1biaz16km6sbACgV4pAOR/YBt8m2RoBT5wcRzxwxmZcscwQ5ONPPJXahEHfYP
	 2HRzdU8QGGIU4lrGz9X4s6ZIE1fXDJG9gxH8GYow=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EF1CF80548;
	Mon, 13 Feb 2023 19:25:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DD4EF8052D; Mon, 13 Feb 2023 19:25:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5BEDF804D6
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 19:24:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5BEDF804D6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=d/tyMU+S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676312696; x=1707848696;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=c+q7Nn9Rsvv1nO+4W6DB2XtQZhG0cfDRiAWTu+oyL1k=;
  b=d/tyMU+SyPXzjzGqgs+XmViiyisATbqfUG+NlOPqjnSVJMfR+oP+/rPd
   t4oQKXhkYjibri8Zc6aTQbBp7eYwQXzT+9C6ThEt45fDGPJYEmMd1p+H6
   rfPmKnm1edMX9oYTZRNB/qA+uUN8SpsXBa98tEPDrk8iYEpF4uHZEEoUH
   qDpexTqtkEz6qkl90CpGeZhbTxsbB+BPEDRmZJ3oedNbtJm/edAe76Exe
   bD8Yy4T0EUARg4oZ26sMr4Yfr63tefQQXIBjEHH0lv66Qks4qMx7xTJXr
   fdUDslLDbNKglprQ9iMqv8TrQ+0IHcd2lTsVwUJjHdvWklcIu+C4FEYdj
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="328664083"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000";
   d="scan'208";a="328664083"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 10:24:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="701369326"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000";
   d="scan'208";a="701369326"
Received: from eatoledo-mobl.amr.corp.intel.com (HELO [10.212.18.132])
 ([10.212.18.132])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 10:24:40 -0800
Message-ID: <383a8166-bc60-8557-e76b-f6287c967598@linux.intel.com>
Date: Mon, 13 Feb 2023 12:20:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V2 6/8] soundwire: amd: add runtime pm ops for AMD
 soundwire manager driver
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
References: <20230213094031.2231058-1-Vijendar.Mukunda@amd.com>
 <20230213094031.2231058-7-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230213094031.2231058-7-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 37SGRVOY6HZRWC7S6PWFXD3SCIQKIUCN
X-Message-ID-Hash: 37SGRVOY6HZRWC7S6PWFXD3SCIQKIUCN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37SGRVOY6HZRWC7S6PWFXD3SCIQKIUCN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/13/23 03:40, Vijendar Mukunda wrote:
> Add support for runtime pm ops for AMD soundwire manager driver.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Signed-off-by: Mastan Katragadda <Mastan.Katragadda@amd.com>
> ---
>  drivers/soundwire/amd_manager.c   | 163 ++++++++++++++++++++++++++++++
>  drivers/soundwire/amd_manager.h   |   3 +
>  include/linux/soundwire/sdw_amd.h |  16 +++
>  3 files changed, 182 insertions(+)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 87f9a987d93a..eced189ba6e0 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -14,6 +14,7 @@
>  #include <linux/slab.h>
>  #include <linux/soundwire/sdw.h>
>  #include <linux/soundwire/sdw_registers.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/wait.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
> @@ -185,6 +186,15 @@ static void amd_disable_sdw_interrupts(struct amd_sdw_manager *amd_manager)
>  	acp_reg_writel(0x00, amd_manager->mmio + ACP_SW_ERROR_INTR_MASK);
>  }
>  
> +static int amd_deinit_sdw_manager(struct amd_sdw_manager *amd_manager)
> +{
> +	int ret;
> +
> +	amd_disable_sdw_interrupts(amd_manager);
> +	ret = amd_disable_sdw_manager(amd_manager);
> +	return ret;
> +}
> +
>  static void amd_sdw_set_frameshape(struct amd_sdw_manager *amd_manager)
>  {
>  	u32 frame_size;
> @@ -1043,6 +1053,12 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
>  	INIT_WORK(&amd_manager->amd_sdw_work, amd_sdw_update_slave_status_work);
>  	INIT_WORK(&amd_manager->probe_work, amd_sdw_probe_work);
>  	schedule_work(&amd_manager->probe_work);
> +	/* Enable runtime PM */
> +	pm_runtime_set_autosuspend_delay(dev, AMD_SDW_MASTER_SUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);

that doesn't sound good to me, why do this here and not in the work
function? That creates a racy case where the device might suspend before
being initialized.

>  	return 0;
>  }
>  
> @@ -1057,14 +1073,161 @@ static int amd_sdw_manager_remove(struct platform_device *pdev)
>  	amd_disable_sdw_interrupts(amd_manager);
>  	sdw_bus_master_delete(&amd_manager->bus);
>  	ret = amd_disable_sdw_manager(amd_manager);
> +	pm_runtime_disable(&pdev->dev);

shouldn't you do the pm_runtime_disable first?

>  	return ret;
>  }

> +/* AMD pm_runtime quirk definitions */
> +
> +/*
> + * Force the clock to stop(ClockStopMode0) when suspend callback
> + * is invoked.
> + */
> +#define AMD_SDW_CLK_STOP_MODE		1
> +
> +/*
> + * Stop the bus when runtime suspend/system level suspend callback
> + * is invoked. If set, a complete bus reset and re-enumeration will
> + * be performed when the bus restarts.
> + */
> +#define AMD_SDW_POWER_OFF_MODE		2

You need to clarify this mode, can you deal with device in-band wakes if
the power is off?

>  #define ACP_SDW0	0
>  #define ACP_SDW1	1
>  
> @@ -57,6 +71,7 @@ struct sdw_amd_dai_runtime {
>   * @instance: soundwire manager instance
>   * @quirks: soundwire manager quirks
>   * @wake_en_mask: wake enable mask per soundwire manager
> + * @clk_stopped: flag set to true when clock is stopped
>   * @power_mode_mask: flag interprets amd soundwire manager power mode
>   * @dai_runtime_array: dai runtime array
>   */
> @@ -86,6 +101,7 @@ struct amd_sdw_manager {
>  	u32 quirks;
>  	u32 wake_en_mask;
>  	u32 power_mode_mask;
> +	bool clk_stopped;
>  
>  	struct sdw_amd_dai_runtime **dai_runtime_array;
>  };
