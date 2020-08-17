Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F792465B1
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Aug 2020 13:49:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EB131694;
	Mon, 17 Aug 2020 13:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EB131694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597664964;
	bh=PWU1FA67zQAasUqd3BPumylawraXXdrgHP9MCo9WyJc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=diqTmCQ87+8BE0jbzyi2aspKMIP+zQNTVuIu9e5WCnA+ldAkll2Rer0PbmEr5vufp
	 M6FwWZYDdD9ar+b/pfhAW1zsg6CkCB6O35xaYn9DPY+AwleadBcOyAUYVvmAwXdWOw
	 Eoo0uEceh1/HD/s/8vo56dOyTtsBZTdOecIFw5Ig=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AE1EF80216;
	Mon, 17 Aug 2020 13:47:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2C34F80218; Mon, 17 Aug 2020 13:47:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3217F800F0
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 13:47:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3217F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="2Bb0s9c1"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C07AE20674;
 Mon, 17 Aug 2020 11:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597664853;
 bh=PWU1FA67zQAasUqd3BPumylawraXXdrgHP9MCo9WyJc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2Bb0s9c1fXzrj0yzxKH6TCjhWGcINNywtn7fDxCldvxcXqhjpd+ietw8xoQr1LBU4
 +tId8AB1jrQEbVZDeJb458pPtVyNcCho0J3XN5oui0KxZzSSAUpgVTgwSfGcxehI18
 juHydM2Zsdmrr3Rko36cqSQH8+J5gro0pUpgtS08=
Date: Mon, 17 Aug 2020 17:17:29 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 09/13] soundwire: intel: add CLK_STOP_BUS_RESET support
Message-ID: <20200817114729.GP2639@vkoul-mobl>
References: <20200721203723.18305-1-yung-chuan.liao@linux.intel.com>
 <20200721203723.18305-10-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721203723.18305-10-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 slawomir.blauciak@intel.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 22-07-20, 04:37, Bard Liao wrote:
> From: Rander Wang <rander.wang@intel.com>
> 
> Move existing pm_runtime suspend under the CLK_STOP_TEARDOWN case.
> 
> In this mode the Master IP will lose all context but in-band wakes are
> supported.
> 
> On pm_runtime resume a complete re-enumeration will be performed after
> a bus reset.
> 
> Signed-off-by: Rander Wang <rander.wang@intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/intel.c | 44 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 1954eb48b86c..744fc0a4816a 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1576,6 +1576,26 @@ static int intel_suspend_runtime(struct device *dev)
>  
>  		intel_shim_wake(sdw, false);
>  
> +	} else if (clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET) {
> +		ret = sdw_cdns_clock_stop(cdns, true);
> +		if (ret < 0) {
> +			dev_err(dev, "cannot enable clock stop on suspend\n");
> +			return ret;
> +		}
> +
> +		ret = sdw_cdns_enable_interrupt(cdns, false);
> +		if (ret < 0) {
> +			dev_err(dev, "cannot disable interrupts on suspend\n");
> +			return ret;
> +		}
> +
> +		ret = intel_link_power_down(sdw);
> +		if (ret) {
> +			dev_err(dev, "Link power down failed: %d", ret);
> +			return ret;
> +		}

no cleanup on all the error cases here?

> +
> +		intel_shim_wake(sdw, true);
>  	} else {
>  		dev_err(dev, "%s clock_stop_quirks %x unsupported\n",
>  			__func__, clock_stop_quirks);
> @@ -1694,6 +1714,30 @@ static int intel_resume_runtime(struct device *dev)
>  			dev_err(dev, "unable to exit bus reset sequence during resume\n");
>  			return ret;
>  		}
> +	} else if (clock_stop_quirks & SDW_INTEL_CLK_STOP_BUS_RESET) {
> +		ret = intel_init(sdw);
> +		if (ret) {
> +			dev_err(dev, "%s failed: %d", __func__, ret);
> +			return ret;
> +		}
> +
> +		/*
> +		 * make sure all Slaves are tagged as UNATTACHED and
> +		 * provide reason for reinitialization
> +		 */
> +		sdw_clear_slave_status(bus, SDW_UNATTACH_REQUEST_MASTER_RESET);
> +
> +		ret = sdw_cdns_enable_interrupt(cdns, true);
> +		if (ret < 0) {
> +			dev_err(dev, "cannot enable interrupts during resume\n");
> +			return ret;
> +		}
> +
> +		ret = sdw_cdns_clock_restart(cdns, true);
> +		if (ret < 0) {
> +			dev_err(dev, "unable to restart clock during resume\n");
> +			return ret;
> +		}
>  	} else {
>  		dev_err(dev, "%s clock_stop_quirks %x unsupported\n",
>  			__func__, clock_stop_quirks);
> -- 
> 2.17.1

-- 
~Vinod
