Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B31FB6660C5
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 17:40:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FE067651;
	Wed, 11 Jan 2023 17:39:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FE067651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673455216;
	bh=60RwI3ta0zzohG/RqWrOlSWa3GvLJ4TqPML70PsLVWQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=f0xkNaHJnq5AL/ldPuxkP53LmEYru4hov2AyWGQF3AjeWvIOPaKbdm5D+kTizgWyk
	 T7iJ+80oftBJ7nHyL3OMIHgOU6KXhIx8Kd1y6GM1gQXYF3E44vRxwBCZS/g0N5VY1Q
	 aTscV2ywsyWogioS0vY47Dti6OmyfSi+8edxQ75o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9745FF805B5;
	Wed, 11 Jan 2023 17:36:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA05EF805B0; Wed, 11 Jan 2023 17:36:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02937F805AB
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 17:36:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02937F805AB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jlmv+Z95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673454981; x=1704990981;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=60RwI3ta0zzohG/RqWrOlSWa3GvLJ4TqPML70PsLVWQ=;
 b=jlmv+Z95f3JCQ96e2j96sqqYCrhH7JTpmQI8ZIGn+7cMbYvFHSx0jWK0
 ctTeFOcgvCk7DLuGhJ0Dkz1ObYZoSU3jEuKfI3vF+u7HIIu0nbfGwjeyS
 Vx1HLOKUm/4djglWeX7wRIA4JDzw2DPrwWW0TYAD4iw6+AgltXhlZ9iSX
 VQnYY3rJnFckJSuMUlFt9E6LX7NUIiXmkz7XrVpTNcgybfdo7CdeWMhQN
 vT2YhFK1QEVjoTT2rw/cDiQ4BrZ3OWhrURrweoKUOcubmXPo4TMwVWgiE
 GcFvm5+fW1PERABXyJBly+DWi3O57WPqGKkkyGTktI06TUWV4R2JO4Li7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="324704277"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="324704277"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 08:32:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607408829"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="607408829"
Received: from flobatol-mobl1.amr.corp.intel.com (HELO [10.212.110.208])
 ([10.212.110.208])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 08:32:45 -0800
Message-ID: <a76043ad-c212-f625-8d0e-ef9460a078a5@linux.intel.com>
Date: Wed, 11 Jan 2023 09:58:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 17/19] soundwire: amd: add pm_prepare callback and pm ops
 support
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-18-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230111090222.2016499-18-Vijendar.Mukunda@amd.com>
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>,
 Mario.Limonciello@amd.com, arungopal.kondaveeti@amd.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/11/23 03:02, Vijendar Mukunda wrote:
> Add pm_prepare callback and System level pm ops support for
> AMD master driver.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Signed-off-by: Mastan Katragadda <Mastan.Katragadda@amd.com>
> ---
>  drivers/soundwire/amd_master.c | 76 ++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/drivers/soundwire/amd_master.c b/drivers/soundwire/amd_master.c
> index 2fd77a673c22..f4478cc17aac 100644
> --- a/drivers/soundwire/amd_master.c
> +++ b/drivers/soundwire/amd_master.c
> @@ -1552,6 +1552,80 @@ static int amd_sdwc_clock_stop_exit(struct amd_sdwc_ctrl *ctrl)
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
> +
> +	if (!pm_runtime_suspended(dev))
> +		return 0;
> +	ret = pm_request_resume(dev);
> +	if (ret < 0)
> +		dev_err(dev, "%s: pm_request_resume failed: %d\n", __func__, ret);
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused amd_pm_prepare(struct device *dev)
> +{
> +	struct amd_sdwc_ctrl *ctrl = dev_get_drvdata(dev);
> +	struct sdw_bus *bus = &ctrl->bus;
> +	int ret;
> +
> +	if (bus->prop.hw_disabled || !ctrl->startup_done) {
> +		dev_dbg(bus->dev, "SoundWire master %d is disabled or not-started, ignoring\n",
> +			bus->link_id);
> +		return 0;
> +	}
> +	ret = device_for_each_child(bus->dev, NULL, amd_resume_child_device);
> +	if (ret < 0)
> +		dev_err(dev, "%s: amd_resume_child_device failed: %d\n", __func__, ret);
> +	if (pm_runtime_suspended(dev) && ctrl->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
> +		ret = pm_request_resume(dev);
> +		if (ret < 0) {
> +			dev_err(bus->dev, "pm_request_resume failed: %d\n", ret);
> +			return 0;
> +		}
> +	}
> +	return 0;
> +}

This seems to be inspired by the Intel code, but is this necessary here?

For Intel, we saw cases where we had to pm_resume before doing a system
suspend, otherwise the hardware was in a bad state.

Do you actually need to do so, or is is possible to do a system suspend
when the clock is stopped.

And in the case where the bus is in 'power-off' mode, do you actually
need to resume at all?

> +
> +static int __maybe_unused amd_suspend(struct device *dev)
> +{
> +	struct amd_sdwc_ctrl *ctrl = dev_get_drvdata(dev);
> +	struct sdw_bus *bus = &ctrl->bus;
> +	int ret;
> +
> +	if (bus->prop.hw_disabled || !ctrl->startup_done) {
> +		dev_dbg(bus->dev, "SoundWire master %d is disabled or not-started, ignoring\n",
> +			bus->link_id);
> +		return 0;
> +	}
> +
> +	if (ctrl->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
> +		ret = amd_sdwc_clock_stop(ctrl);
> +		if (ret)
> +			return ret;
> +	} else if (ctrl->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
> +		ret = amd_sdwc_clock_stop(ctrl);

do you actually need to stop the clock before powering-off? This seems
counter intuitive and not so useful?

> +		if (ret)
> +			return ret;
> +		ret = amd_deinit_sdw_controller(ctrl);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
>  static int __maybe_unused amd_suspend_runtime(struct device *dev)
>  {
>  	struct amd_sdwc_ctrl *ctrl = dev_get_drvdata(dev);
> @@ -1638,6 +1712,8 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops amd_pm = {
> +	.prepare = amd_pm_prepare,
> +	SET_SYSTEM_SLEEP_PM_OPS(amd_suspend, amd_resume_runtime)
>  	SET_RUNTIME_PM_OPS(amd_suspend_runtime, amd_resume_runtime, NULL)
>  };
>  
