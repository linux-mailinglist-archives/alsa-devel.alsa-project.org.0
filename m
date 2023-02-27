Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BC56A47B2
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Feb 2023 18:15:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9190868;
	Mon, 27 Feb 2023 18:15:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9190868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677518152;
	bh=v7SeSzLWRnY4KlcEImoHo5oqZX4MNLiw33Iga3FRf4M=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=isrQef+6Er3H6ZQphXB/5KhCaF4mzpExcx9h4VdwfEODNd1loJfyXZUAyJyjnD0Ew
	 GD6YZr8VOKeR8vaGRSrrCmtTJie7kqAr5IUMZ8zn+UGGgdNDsE4f8EG2Wh5Pb07uEX
	 1vQ1/6yeTSSmzn2Ja8qMz4T7ddLjPQTNLl2Wgsgc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03E04F8055C;
	Mon, 27 Feb 2023 18:13:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F3F4F80558; Mon, 27 Feb 2023 18:13:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36FACF800FA
	for <alsa-devel@alsa-project.org>; Mon, 27 Feb 2023 18:13:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36FACF800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Zwj8nwJZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677517989; x=1709053989;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=v7SeSzLWRnY4KlcEImoHo5oqZX4MNLiw33Iga3FRf4M=;
  b=Zwj8nwJZgCsUVKuBEaVLtPMG8QHG4SSVeSt4IgzioSSSAboWt94AWK9i
   MEPNM0EOT+rFFOagNijsBPFhNTNDiP+oVxbwLN+hbEEWk0FMkLLTaeQVA
   s5O8Tp9TYn+mQMUd45N8n3Oi9l1rG5mE+3iewAQDMSQ+cxh0PYeAMTmSf
   /Gh619dDoZ+42FjlqKNzv6sz3I+2rspaUCGyER1dYV0xzvYtNGUeMtfjp
   fagfEQnVCYHQZ+rZj4WiSmfuBL6CfHSHiFe2gtr5cIi+qzC8QJmi1SE7v
   K8lJdeXdZsKz4lySXbir5TXJjBobVVSPbDug6awJVFjTtXE5Cn9SgTGZe
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="313583780"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400";
   d="scan'208";a="313583780"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 09:08:43 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="651302272"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400";
   d="scan'208";a="651302272"
Received: from jaidenno-mobl.amr.corp.intel.com (HELO [10.212.85.4])
 ([10.212.85.4])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 09:08:40 -0800
Message-ID: <82c7303b-131e-0633-2c08-5b4b414ad941@linux.intel.com>
Date: Mon, 27 Feb 2023 12:07:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH V4 8/8] soundwire: amd: add pm_prepare callback and pm ops
 support
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, vkoul@kernel.org
References: <20230227154801.50319-1-Vijendar.Mukunda@amd.com>
 <20230227154801.50319-9-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230227154801.50319-9-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3LNVNM27SXMTI6ZG475X7EH76PSLLZZM
X-Message-ID-Hash: 3LNVNM27SXMTI6ZG475X7EH76PSLLZZM
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mario.Limonciello@amd.com,
 amadeuszx.slawinski@linux.intel.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3LNVNM27SXMTI6ZG475X7EH76PSLLZZM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/27/23 10:48, Vijendar Mukunda wrote:
> Add pm_prepare callback and System level pm ops support for
> AMD SoundWire manager driver.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Signed-off-by: Mastan Katragadda <Mastan.Katragadda@amd.com>

seems like you missed my comments in
https://lore.kernel.org/alsa-devel/7d32d552-6ca0-3c40-11ce-c8d727cadc05@linux.intel.com/

> ---
>  drivers/soundwire/amd_manager.c | 89 +++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
> index 88f0ad7ea7ec..5337443d9aea 100644
> --- a/drivers/soundwire/amd_manager.c
> +++ b/drivers/soundwire/amd_manager.c
> @@ -1141,6 +1141,93 @@ static int amd_sdw_clock_stop_exit(struct amd_sdw_manager *amd_manager)
>  	return 0;
>  }
>  
> +static int amd_resume_child_device(struct device *dev, void *data)
> +{
> +	int ret;
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +
> +	if (!slave->probed) {
> +		dev_dbg(dev, "skipping device, no probed driver\n");
> +		return 0;
> +	}
> +	if (!slave->dev_num_sticky) {
> +		dev_dbg(dev, "skipping device, never detected on bus\n");
> +		return 0;
> +	}
> +	if (!pm_runtime_suspended(dev))
> +		return 0;
> +	ret = pm_request_resume(dev);

I think it's just better to let the pm_runtime framework deal with the
states than do this is two steps.

> +	if (ret < 0)
> +		dev_err(dev, "pm_request_resume failed: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused amd_pm_prepare(struct device *dev)
> +{
> +	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
> +	struct sdw_bus *bus = &amd_manager->bus;
> +	int ret;
> +
> +	if (bus->prop.hw_disabled) {
> +		dev_dbg(bus->dev, "SoundWire manager %d is disabled, ignoring\n",
> +			bus->link_id);
> +		return 0;
> +	}
> +	/*
> +	 * When multiple peripheral devices connected over the same link, if SoundWire manager
> +	 * device is not in runtime suspend state, observed that device alerts are missing
> +	 * without pm_prepare on AMD platforms in clockstop mode0.
> +	 */
> +	if (pm_runtime_suspended(dev) && amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
> +		ret = pm_request_resume(dev);

same here.

> +		if (ret < 0) {
> +			dev_err(bus->dev, "pm_request_resume failed: %d\n", ret);
> +			return 0;
> +		}
> +	}
> +	/* To force peripheral devices to system level suspend state, resume the devices
> +	 * from runtime suspend state first. Without that unable to dispatch the alert
> +	 * status to peripheral driver during system level resume as they are in runtime
> +	 * suspend state.
> +	 */
> +	ret = device_for_each_child(bus->dev, NULL, amd_resume_child_device);
> +	if (ret < 0)
> +		dev_err(dev, "amd_resume_child_device failed: %d\n", ret);
> +	return 0;
> +}
> +
> +static int __maybe_unused amd_suspend(struct device *dev)
> +{
> +	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
> +	struct sdw_bus *bus = &amd_manager->bus;
> +	int ret;
> +
> +	if (bus->prop.hw_disabled) {
> +		dev_dbg(bus->dev, "SoundWire manager %d is disabled, ignoring\n",
> +			bus->link_id);
> +		return 0;
> +	}
> +
> +	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
> +		ret = amd_sdw_clock_stop(amd_manager);
> +		if (ret)
> +			return ret;
> +	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
> +		/*
> +		 * As per hardware programming sequence on AMD platforms,
> +		 * clock stop should be invoked first before powering-off
> +		 */
> +		ret = amd_sdw_clock_stop(amd_manager);
> +		if (ret)
> +			return ret;
> +		ret = amd_deinit_sdw_manager(amd_manager);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
>  static int __maybe_unused amd_suspend_runtime(struct device *dev)
>  {
>  	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
> @@ -1213,6 +1300,8 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops amd_pm = {
> +	.prepare = amd_pm_prepare,
> +	SET_SYSTEM_SLEEP_PM_OPS(amd_suspend, amd_resume_runtime)
>  	SET_RUNTIME_PM_OPS(amd_suspend_runtime, amd_resume_runtime, NULL)
>  };
>  
