Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 203F36660BA
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 17:38:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6644F764C;
	Wed, 11 Jan 2023 17:38:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6644F764C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673455133;
	bh=gsngSkA9zuCYNZaMCNMhzxKvwqJqeTucuW8uvJ0fSwY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=brmyi6bi8TJAfsbpCRp0ABjLhvvZRMh+xqdpDSdzw26yd3M+IzS2zETapa8FyHToz
	 e/UcOiVflskj89GngL+r8Jod6f0jQL1c47PFKueg6gx/PBmzyECQmazYH40M/TFRrL
	 zS8+jwKduZ/g8+y5FLIZ4EkPQEhc35r++TOzdi4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 720B3F80580;
	Wed, 11 Jan 2023 17:36:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12024F80579; Wed, 11 Jan 2023 17:36:15 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 14DD3F80571
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 17:36:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14DD3F80571
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bTJRZFeT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673454970; x=1704990970;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gsngSkA9zuCYNZaMCNMhzxKvwqJqeTucuW8uvJ0fSwY=;
 b=bTJRZFeTSJpxd595fBJO0hC/p9jm+yc3tsB7piox/rmfLTqEnY2TFxEE
 5cAEWWbfxFuS9Zz19HBi1wbyOLhsn5mxQpZpO7+QqQ9XaUI0nssLfkjBF
 ZQTiqfYuhaUHd61VwLiOZqPvSx+Gp/Jpp4xGbIUd8nlw+JN7nYndnSdxf
 AaazMNuBtQaSPrvrmdwOamNOV4HPN6alcDLKnyYI7Xq91n91Iz3eOVaZW
 ZF7VbuexiduVUzZPJ2kf8ozmEXBcvJabXKRtYhMShGcTy895ToNB+br2R
 o6EPKNYTkty7X17kPp2EpGKSe5cZi4oOpkMTNRYtYlfXsDWfGImENkN3C A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="324704177"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="324704177"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 08:32:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607408685"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="607408685"
Received: from flobatol-mobl1.amr.corp.intel.com (HELO [10.212.110.208])
 ([10.212.110.208])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 08:32:33 -0800
Message-ID: <1af8aa6a-9896-4d35-48de-f084fd16ebc7@linux.intel.com>
Date: Wed, 11 Jan 2023 09:47:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 14/19] soundwire: amd: add runtime pm ops for AMD master
 driver
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-15-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230111090222.2016499-15-Vijendar.Mukunda@amd.com>
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
> Add support for runtime pm ops for AMD master driver.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Signed-off-by: Mastan Katragadda <Mastan.Katragadda@amd.com>
> ---
>  drivers/soundwire/amd_master.c    | 205 ++++++++++++++++++++++++++++++
>  drivers/soundwire/amd_master.h    |   3 +
>  include/linux/soundwire/sdw_amd.h |   1 +
>  3 files changed, 209 insertions(+)
> 
> diff --git a/drivers/soundwire/amd_master.c b/drivers/soundwire/amd_master.c
> index c7063b8bdd7b..d2d7f07de202 100644
> --- a/drivers/soundwire/amd_master.c
> +++ b/drivers/soundwire/amd_master.c
> @@ -15,6 +15,7 @@
>  #include <linux/soundwire/sdw.h>
>  #include <linux/soundwire/sdw_registers.h>
>  #include <linux/soundwire/sdw_amd.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/wait.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
> @@ -290,6 +291,17 @@ static int amd_disable_sdw_interrupts(struct amd_sdwc_ctrl *ctrl)
>  	return 0;
>  }
>  
> +static int amd_deinit_sdw_controller(struct amd_sdwc_ctrl *ctrl)
> +{
> +	int ret;
> +
> +	ret = amd_disable_sdw_interrupts(ctrl);
> +	if (ret)
> +		return ret;
> +	ret = amd_disable_sdw_controller(ctrl);
> +	return ret;
> +}
> +
>  static int amd_sdwc_set_frameshape(struct amd_sdwc_ctrl *ctrl, u32 rows, u32 cols)
>  {
>  	u32 sdw_rows, sdw_cols, frame_size;
> @@ -1387,6 +1399,12 @@ static int amd_sdwc_probe(struct platform_device *pdev)
>  	INIT_WORK(&ctrl->amd_sdw_work, amd_sdwc_update_slave_status_work);
>  	INIT_WORK(&ctrl->probe_work, amd_sdwc_probe_work);
>  	schedule_work(&ctrl->probe_work);
> +	/* Enable runtime PM */
> +	pm_runtime_set_autosuspend_delay(dev, AMD_SDW_MASTER_SUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
>  	return 0;
>  }
>  
> @@ -1398,14 +1416,201 @@ static int amd_sdwc_remove(struct platform_device *pdev)
>  	amd_disable_sdw_interrupts(ctrl);
>  	sdw_bus_master_delete(&ctrl->bus);
>  	ret = amd_disable_sdw_controller(ctrl);
> +	pm_runtime_disable(&pdev->dev);
>  	return ret;
>  }
>  
> +static int amd_sdwc_clock_stop(struct amd_sdwc_ctrl *ctrl)
> +{
> +	u32 clk_resume_ctrl_reg;
> +	u32 wake_en_reg;
> +	u32 val;
> +	u32 retry_count = 0;
> +	int ret;
> +
> +	ret = sdw_bus_prep_clk_stop(&ctrl->bus);
> +	if (ret < 0 && ret != -ENODATA) {
> +		dev_err(ctrl->dev, "prepare clock stop failed %d", ret);
> +		return ret;
> +	}
> +	ret = sdw_bus_clk_stop(&ctrl->bus);
> +	if (ret < 0 && ret != -ENODATA) {
> +		dev_err(ctrl->dev, "bus clock stop failed %d", ret);
> +		return ret;

You need to be very careful here, because returning an error may prevent
the device from suspending.

If it's safe and possible to recover during the resume step, you
probably want to log the error but let the suspend continue.

> +	}
> +	switch (ctrl->instance) {
> +	case ACP_SDW0:
> +		clk_resume_ctrl_reg = ACP_SW_CLK_RESUME_CTRL;
> +		wake_en_reg = ACP_SW_WAKE_EN;
> +		break;
> +	case ACP_SDW1:
> +		clk_resume_ctrl_reg = ACP_P1_SW_CLK_RESUME_CTRL;
> +		wake_en_reg = ACP_SW1_WAKE_EN;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}

why not store these offsets during the probe and use them directly here?
You know at probe time which master you're using.

> +
> +	do {
> +		val = acp_reg_readl(ctrl->mmio + clk_resume_ctrl_reg);
> +		if (val & AMD_SDW_CLK_STOP_DONE) {
> +			ctrl->clk_stopped = true;
> +			break;
> +		}
> +	} while (retry_count++ < AMD_SDW_CLK_STOP_MAX_RETRY_COUNT);
> +
> +	if (!ctrl->clk_stopped) {
> +		dev_err(ctrl->dev, "SDW%x clock stop failed\n", ctrl->instance);
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (ctrl->wake_en_mask)
> +		acp_reg_writel(0x01, ctrl->mmio + wake_en_reg);
> +
> +	dev_dbg(ctrl->dev, "SDW%x clock stop successful\n", ctrl->instance);
> +	return 0;
> +}
> +
> +static int amd_sdwc_clock_stop_exit(struct amd_sdwc_ctrl *ctrl)
> +{
> +	int ret;
> +	u32 clk_resume_ctrl_reg;
> +	u32 val = 0;
> +	u32 retry_count = 0;
> +
> +	switch (ctrl->instance) {
> +	case ACP_SDW0:
> +		clk_resume_ctrl_reg = ACP_SW_CLK_RESUME_CTRL;
> +		break;
> +	case ACP_SDW1:
> +		clk_resume_ctrl_reg = ACP_P1_SW_CLK_RESUME_CTRL;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	if (ctrl->clk_stopped) {
> +		val = acp_reg_readl(ctrl->mmio + clk_resume_ctrl_reg);
> +		val |= AMD_SDW_CLK_RESUME_REQ;
> +		acp_reg_writel(val, ctrl->mmio + clk_resume_ctrl_reg);
> +		do {
> +			val = acp_reg_readl(ctrl->mmio + clk_resume_ctrl_reg);
> +			if (val & AMD_SDW_CLK_RESUME_DONE)
> +				break;
> +			usleep_range(10, 100);
> +		} while (retry_count++ < AMD_SDW_CLK_STOP_MAX_RETRY_COUNT);
> +		if (val & AMD_SDW_CLK_RESUME_DONE) {
> +			acp_reg_writel(0, ctrl->mmio + clk_resume_ctrl_reg);
> +			ret = sdw_bus_exit_clk_stop(&ctrl->bus);
> +			if (ret < 0)
> +				dev_err(ctrl->dev, "bus failed to exit clock stop %d\n", ret);
> +			ctrl->clk_stopped = false;
> +		}
> +	}
> +	if (ctrl->clk_stopped) {
> +		dev_err(ctrl->dev, "SDW%x clock stop exit failed\n", ctrl->instance);
> +		return -ETIMEDOUT;
> +	}
> +
> +	dev_dbg(ctrl->dev, "SDW%x clock stop exit successful\n", ctrl->instance);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused amd_suspend_runtime(struct device *dev)
> +{
> +	struct amd_sdwc_ctrl *ctrl = dev_get_drvdata(dev);
> +	struct sdw_bus *bus = &ctrl->bus;
> +	int ret;
> +
> +	if (bus->prop.hw_disabled || !ctrl->startup_done) {

do you have a case where the startup is not done? This was an
Intel-specific thing.

> +		dev_dbg(bus->dev, "SoundWire master %d is disabled or not-started, ignoring\n",
> +			bus->link_id);
> +		return 0;
> +	}
> +	if (ctrl->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
> +		ret = amd_sdwc_clock_stop(ctrl);
> +		if (ret)
> +			return ret;
> +	} else if (ctrl->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
> +		ret = amd_sdwc_clock_stop(ctrl);
> +		if (ret)
> +			return ret;
> +		ret = amd_deinit_sdw_controller(ctrl);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +static int __maybe_unused amd_resume_runtime(struct device *dev)
> +{
> +	struct amd_sdwc_ctrl *ctrl = dev_get_drvdata(dev);
> +	struct sdw_bus *bus = &ctrl->bus;
> +	int ret;
> +	u32 clk_resume_ctrl_reg;
> +	u32 val = 0;
> +	u32 retry_count = 0;
> +
> +	if (bus->prop.hw_disabled || !ctrl->startup_done) {

same here

> +		dev_dbg(bus->dev, "SoundWire master %d is disabled or not-started, ignoring\n",
> +			bus->link_id);
> +		return 0;
> +	}
> +
> +	switch (ctrl->instance) {
> +	case ACP_SDW0:
> +		clk_resume_ctrl_reg = ACP_SW_CLK_RESUME_CTRL;
> +		break;
> +	case ACP_SDW1:
> +		clk_resume_ctrl_reg = ACP_P1_SW_CLK_RESUME_CTRL;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}

select registers in the probe.

> +
> +	if (ctrl->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
> +		ret = amd_sdwc_clock_stop_exit(ctrl);
> +		if (ret)
> +			return ret;
> +	} else if (ctrl->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
> +		val = acp_reg_readl(ctrl->mmio + clk_resume_ctrl_reg);
> +		if (val) {
> +			val |= AMD_SDW_CLK_RESUME_REQ;
> +			acp_reg_writel(val, ctrl->mmio + clk_resume_ctrl_reg);
> +			do {
> +				val = acp_reg_readl(ctrl->mmio + clk_resume_ctrl_reg);
> +				if (val & AMD_SDW_CLK_RESUME_DONE)
> +					break;
> +				usleep_range(10, 100);
> +			} while (retry_count++ < AMD_SDW_CLK_STOP_MAX_RETRY_COUNT);
> +			if (val & AMD_SDW_CLK_RESUME_DONE) {
> +				acp_reg_writel(0, ctrl->mmio + clk_resume_ctrl_reg);
> +				ctrl->clk_stopped = false;
> +			}
> +		}
> +		sdw_clear_slave_status(bus, SDW_UNATTACH_REQUEST_MASTER_RESET);
> +		amd_init_sdw_controller(ctrl);
> +		amd_enable_sdw_interrupts(ctrl);
> +		ret = amd_enable_sdw_controller(ctrl);
> +		if (ret)
> +			return ret;
> +		ret = amd_sdwc_set_frameshape(ctrl, 50, 10);

this should be defined at probe time, using magic numbers like this will
not work in all cases and totally depends on the frame rate and
bandwidth needs.

> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
