Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7AD3DCF16
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Aug 2021 06:04:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62E0C17C3;
	Mon,  2 Aug 2021 06:03:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62E0C17C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627877048;
	bh=o2RpopBz6mriwSkHUyz4A5DXoiZu1wpfZ4NMHsuWe6A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Modb02N+TxdSP8pBsIg7efMliJIrbUaPtjhLX4iaf6dC1UctBh6hCdRUGPippOsFj
	 erVNMnlSouoII2bIG6dhTM91UVSN1zwc3zi9NDXzuueZHUil94enX44AbtJubLSGcQ
	 ESqMbeq4smFi9ZFxGFMR7Cj7UNlHrM5WqC5ubqJY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE8BDF80268;
	Mon,  2 Aug 2021 06:02:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8BFEF8025F; Mon,  2 Aug 2021 06:02:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C376F800BF
 for <alsa-devel@alsa-project.org>; Mon,  2 Aug 2021 06:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C376F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nKC/n0jo"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 316C860EB2;
 Mon,  2 Aug 2021 04:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627876949;
 bh=o2RpopBz6mriwSkHUyz4A5DXoiZu1wpfZ4NMHsuWe6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nKC/n0joxjgVNxZKztMSxtLLi9QyVOk32L2RdoDmSAMDQ+clmHz5xen9I0lZvniaK
 NGWQ7PXdViI3KDwePC5XlCAjfreRhPcS0YkS6i1dPCPf8+jzOwnvI/GpzpffrozFmK
 tP4mk/t51o10RwtNUUWhxsRaWR+PhEaYJTLSPDg7sM4ooU7r9V2KAstGobRIjhu1w1
 TnQ4PdqWe/V7R3Q2TaMkEUJPJCYdKsJQrRmQwawv2O/7t6ysqq/IryEOhOFL8BjkYz
 Mq+28pUIAcZgxNGjQRSBvWRSnG7QwuvT4qurmTjrzDU0lknFtKndbsexGx05Mtwvx2
 UlZW6a+D0X2zg==
Date: Mon, 2 Aug 2021 09:32:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 2/4] soundwire: intel: skip suspend/resume/wake when link
 was not started
Message-ID: <YQduUIXsoxlaDPsh@matsya>
References: <20210727055608.30247-1-yung-chuan.liao@linux.intel.com>
 <20210727055608.30247-3-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727055608.30247-3-yung-chuan.liao@linux.intel.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

On 27-07-21, 13:56, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> On some HDaudio platforms, SoundWire devices are described in the
> DSDT but never used. This patch adds a boolean status flag to skip all
> suspend/resume/wake sequences for this configuration.

Why are the sdw devices created in this case then? I would assume you
are detecting this configuration and should skip device creation?

> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/intel.c | 22 ++++++++++++----------
>  drivers/soundwire/intel.h |  1 +
>  2 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 3af922e20e64..46d1645cb7fe 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1456,6 +1456,7 @@ int intel_link_startup(struct auxiliary_device *auxdev)
>  	if (!(link_flags & SDW_INTEL_MASTER_DISABLE_PM_RUNTIME_IDLE))
>  		pm_runtime_idle(dev);
>  
> +	sdw->startup_done = true;
>  	return 0;
>  
>  err_interrupt:
> @@ -1495,8 +1496,9 @@ int intel_link_process_wakeen_event(struct auxiliary_device *auxdev)
>  	sdw = dev_get_drvdata(dev);
>  	bus = &sdw->cdns.bus;
>  
> -	if (bus->prop.hw_disabled) {
> -		dev_dbg(dev, "SoundWire master %d is disabled, ignoring\n", bus->link_id);
> +	if (bus->prop.hw_disabled || !sdw->startup_done) {
> +		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
> +			bus->link_id);
>  		return 0;
>  	}
>  
> @@ -1533,8 +1535,8 @@ static int __maybe_unused intel_suspend(struct device *dev)
>  	u32 clock_stop_quirks;
>  	int ret;
>  
> -	if (bus->prop.hw_disabled) {
> -		dev_dbg(dev, "SoundWire master %d is disabled, ignoring\n",
> +	if (bus->prop.hw_disabled || !sdw->startup_done) {
> +		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
>  			bus->link_id);
>  		return 0;
>  	}
> @@ -1587,8 +1589,8 @@ static int __maybe_unused intel_suspend_runtime(struct device *dev)
>  	u32 clock_stop_quirks;
>  	int ret;
>  
> -	if (bus->prop.hw_disabled) {
> -		dev_dbg(dev, "SoundWire master %d is disabled, ignoring\n",
> +	if (bus->prop.hw_disabled || !sdw->startup_done) {
> +		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
>  			bus->link_id);
>  		return 0;
>  	}
> @@ -1652,8 +1654,8 @@ static int __maybe_unused intel_resume(struct device *dev)
>  	bool multi_link;
>  	int ret;
>  
> -	if (bus->prop.hw_disabled) {
> -		dev_dbg(dev, "SoundWire master %d is disabled, ignoring\n",
> +	if (bus->prop.hw_disabled || !sdw->startup_done) {
> +		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
>  			bus->link_id);
>  		return 0;
>  	}
> @@ -1750,8 +1752,8 @@ static int __maybe_unused intel_resume_runtime(struct device *dev)
>  	int status;
>  	int ret;
>  
> -	if (bus->prop.hw_disabled) {
> -		dev_dbg(dev, "SoundWire master %d is disabled, ignoring\n",
> +	if (bus->prop.hw_disabled || !sdw->startup_done) {
> +		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
>  			bus->link_id);
>  		return 0;
>  	}
> diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
> index 0b47b148da3f..cd93a44dba9a 100644
> --- a/drivers/soundwire/intel.h
> +++ b/drivers/soundwire/intel.h
> @@ -41,6 +41,7 @@ struct sdw_intel {
>  	struct sdw_cdns cdns;
>  	int instance;
>  	struct sdw_intel_link_res *link_res;
> +	bool startup_done;
>  #ifdef CONFIG_DEBUG_FS
>  	struct dentry *debugfs;
>  #endif
> -- 
> 2.17.1

-- 
~Vinod
