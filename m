Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A860A18CF36
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 14:43:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2659317D8;
	Fri, 20 Mar 2020 14:42:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2659317D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584711785;
	bh=MgN9pJPsqG2bTCAI23maRrYMK1eh1ghBMd5dfP46JjE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uzu6uYyWTeH7DnigydYhLAz7+wnXvFXTLsj+qfae+PVt6PEMj5sVky4qi4uMkEMi3
	 5iW00c/8NVJHdpyw2wNLHRCOvdC65EBpEdNrTWiO0GZWGOz9XiBTEujGLPTu7u2hUG
	 4qBgPUKRBLwo04tsB+Ds2TwIUimZlxkF3K1EttCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C1B3F80162;
	Fri, 20 Mar 2020 14:41:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2429BF8015B; Fri, 20 Mar 2020 14:41:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35C69F80126
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 14:41:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35C69F80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="trRd25v4"
Received: from localhost (unknown [122.167.82.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74E1820739;
 Fri, 20 Mar 2020 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584711677;
 bh=MgN9pJPsqG2bTCAI23maRrYMK1eh1ghBMd5dfP46JjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=trRd25v4vy0t3nnZz59a6IOwarik97JjaQJxVmRRqwb1NI5enqJ9nO3bLaULvpL8G
 9tSHEZzVI7p7RSD7PzlyU7cYrnmh+rYIIXaLQsVNvR/eaypxE9M92TVHRqzPp4iw/f
 ww8lSjoFGNP457C+SOX5vazL2EnXfljDyIizFpF4=
Date: Fri, 20 Mar 2020 19:11:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/7] soundwire: intel: add mutex to prevent concurrent
 access to SHIM registers
Message-ID: <20200320134112.GC4885@vkoul-mobl>
References: <20200311221026.18174-1-pierre-louis.bossart@linux.intel.com>
 <20200311221026.18174-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311221026.18174-4-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On 11-03-20, 17:10, Pierre-Louis Bossart wrote:
> Some of the SHIM registers exposed fields that are link specific, and
> in addition some of the power-related registers (SPA/CPA) take time to
> be updated. Uncontrolled access leads to timeouts or errors.
> 
> Add a mutex, shared by all links, so that all accesses to such
> registers are serialized, and follow a pattern of read-modify-write.
> 
> The mutex initialization is done at the higher layer since the same
> mutex is used for all links.
> 
> GitHub issue: https://github.com/thesofproject/linux/issues/1555
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/intel.c | 37 +++++++++++++++++++++++++++++++------
>  drivers/soundwire/intel.h |  2 ++
>  2 files changed, 33 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 1a3b828b03a1..3c271a8044b8 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -286,6 +286,8 @@ static int intel_link_power_up(struct sdw_intel *sdw)
>  	int spa_mask, cpa_mask;
>  	int link_control, ret;
>  
> +	mutex_lock(sdw->link_res->shim_lock);
> +
>  	/* Link power up sequence */
>  	link_control = intel_readl(shim, SDW_SHIM_LCTL);
>  	spa_mask = (SDW_SHIM_LCTL_SPA << link_id);
> @@ -293,6 +295,8 @@ static int intel_link_power_up(struct sdw_intel *sdw)
>  	link_control |=  spa_mask;
>  
>  	ret = intel_set_bit(shim, SDW_SHIM_LCTL, link_control, cpa_mask);
> +	mutex_unlock(sdw->link_res->shim_lock);
> +
>  	if (ret < 0)
>  		return ret;
>  
> @@ -307,6 +311,8 @@ static int intel_shim_init(struct sdw_intel *sdw)
>  	int sync_reg, ret;
>  	u16 ioctl = 0, act = 0;
>  
> +	mutex_lock(sdw->link_res->shim_lock);
> +
>  	/* Initialize Shim */
>  	ioctl |= SDW_SHIM_IOCTL_BKE;
>  	intel_writew(shim, SDW_SHIM_IOCTL(link_id), ioctl);
> @@ -351,6 +357,8 @@ static int intel_shim_init(struct sdw_intel *sdw)
>  	sync_reg |= SDW_SHIM_SYNC_SYNCCPU;
>  	ret = intel_clear_bit(shim, SDW_SHIM_SYNC, sync_reg,
>  			      SDW_SHIM_SYNC_SYNCCPU);
> +	mutex_unlock(sdw->link_res->shim_lock);
> +
>  	if (ret < 0)
>  		dev_err(sdw->cdns.dev, "Failed to set sync period: %d\n", ret);
>  
> @@ -363,13 +371,15 @@ static void intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
>  	unsigned int link_id = sdw->instance;
>  	u16 wake_en, wake_sts;
>  
> +	mutex_lock(sdw->link_res->shim_lock);
> +	wake_en = intel_readw(shim, SDW_SHIM_WAKEEN);
> +
>  	if (wake_enable) {
>  		/* Enable the wakeup */
> -		intel_writew(shim, SDW_SHIM_WAKEEN,
> -			     (SDW_SHIM_WAKEEN_ENABLE << link_id));
> +		wake_en |= (SDW_SHIM_WAKEEN_ENABLE << link_id);
> +		intel_writew(shim, SDW_SHIM_WAKEEN, wake_en);
>  	} else {
>  		/* Disable the wake up interrupt */
> -		wake_en = intel_readw(shim, SDW_SHIM_WAKEEN);
>  		wake_en &= ~(SDW_SHIM_WAKEEN_ENABLE << link_id);
>  		intel_writew(shim, SDW_SHIM_WAKEEN, wake_en);
>  
> @@ -378,6 +388,7 @@ static void intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
>  		wake_sts |= (SDW_SHIM_WAKEEN_ENABLE << link_id);
>  		intel_writew(shim, SDW_SHIM_WAKESTS_STATUS, wake_sts);
>  	}
> +	mutex_unlock(sdw->link_res->shim_lock);
>  }
>  
>  static int intel_link_power_down(struct sdw_intel *sdw)
> @@ -387,6 +398,8 @@ static int intel_link_power_down(struct sdw_intel *sdw)
>  	void __iomem *shim = sdw->link_res->shim;
>  	u16 ioctl;
>  
> +	mutex_lock(sdw->link_res->shim_lock);
> +
>  	/* Glue logic */
>  	ioctl = intel_readw(shim, SDW_SHIM_IOCTL(link_id));
>  	ioctl |= SDW_SHIM_IOCTL_BKE;
> @@ -403,6 +416,8 @@ static int intel_link_power_down(struct sdw_intel *sdw)
>  	link_control &=  spa_mask;
>  
>  	ret = intel_clear_bit(shim, SDW_SHIM_LCTL, link_control, cpa_mask);
> +	mutex_unlock(sdw->link_res->shim_lock);
> +
>  	if (ret < 0)
>  		return ret;
>  
> @@ -630,11 +645,15 @@ static int intel_pre_bank_switch(struct sdw_bus *bus)
>  	if (!bus->multi_link)
>  		return 0;
>  
> +	mutex_lock(sdw->link_res->shim_lock);
> +
>  	/* Read SYNC register */
>  	sync_reg = intel_readl(shim, SDW_SHIM_SYNC);
>  	sync_reg |= SDW_SHIM_SYNC_CMDSYNC << sdw->instance;
>  	intel_writel(shim, SDW_SHIM_SYNC, sync_reg);
>  
> +	mutex_unlock(sdw->link_res->shim_lock);
> +
>  	return 0;
>  }
>  
> @@ -649,6 +668,8 @@ static int intel_post_bank_switch(struct sdw_bus *bus)
>  	if (!bus->multi_link)
>  		return 0;
>  
> +	mutex_lock(sdw->link_res->shim_lock);
> +
>  	/* Read SYNC register */
>  	sync_reg = intel_readl(shim, SDW_SHIM_SYNC);
>  
> @@ -660,9 +681,10 @@ static int intel_post_bank_switch(struct sdw_bus *bus)
>  	 *
>  	 * So, set the SYNCGO bit only if CMDSYNC bit is set for any Master.
>  	 */
> -	if (!(sync_reg & SDW_SHIM_SYNC_CMDSYNC_MASK))
> -		return 0;
> -
> +	if (!(sync_reg & SDW_SHIM_SYNC_CMDSYNC_MASK)) {
> +		ret = 0;
> +		goto unlock;
> +	}
>  	/*
>  	 * Set SyncGO bit to synchronously trigger a bank switch for
>  	 * all the masters. A write to SYNCGO bit clears CMDSYNC bit for all
> @@ -672,6 +694,9 @@ static int intel_post_bank_switch(struct sdw_bus *bus)
>  
>  	ret = intel_clear_bit(shim, SDW_SHIM_SYNC, sync_reg,
>  			      SDW_SHIM_SYNC_SYNCGO);
> +unlock:
> +	mutex_unlock(sdw->link_res->shim_lock);
> +
>  	if (ret < 0)
>  		dev_err(sdw->cdns.dev, "Post bank switch failed: %d\n", ret);
>  
> diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
> index 38b7c125fb10..568c84a80d79 100644
> --- a/drivers/soundwire/intel.h
> +++ b/drivers/soundwire/intel.h
> @@ -15,6 +15,7 @@
>   * @irq: Interrupt line
>   * @ops: Shim callback ops
>   * @dev: device implementing hw_params and free callbacks
> + * @shim_lock: mutex to handle access to shared SHIM registers
>   */
>  struct sdw_intel_link_res {
>  	struct platform_device *pdev;
> @@ -25,6 +26,7 @@ struct sdw_intel_link_res {
>  	int irq;
>  	const struct sdw_intel_ops *ops;
>  	struct device *dev;
> +	struct mutex *shim_lock; /* protect shared registers */

Where is this mutex initialized? Did you test this...

-- 
~Vinod
