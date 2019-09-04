Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C883AA7C60
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 09:14:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3097F1669;
	Wed,  4 Sep 2019 09:13:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3097F1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567581252;
	bh=6zyy2zHrUXH9+MUPZ3sjdamh2kA7mSiNSosyhoSVQTs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BV9yb8jhFFKesxvV1inx8HO9gP5RqChImY/DnfHN/zfTU+nbfZpSlmk6Hd7UDe5fx
	 3DoismuztubU5YYDQCbWtVu4PV3nWbqbFRlV097TM4Iro1V4TYXizsQ/tdsdNdBlh4
	 GWjXKew8mGzeUfZYM0+FeDCCOUzbQWySq4X5QM8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15198F803A6;
	Wed,  4 Sep 2019 09:12:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 134A5F803A6; Wed,  4 Sep 2019 09:12:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2156F80228
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 09:12:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2156F80228
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="f3GMOuhq"
Received: from localhost (unknown [122.182.201.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C6952087E;
 Wed,  4 Sep 2019 07:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567581138;
 bh=6FzMAaty3Pfx4wMBupL6qy9d7B0suDpf8SXLsOO1+i0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f3GMOuhqFUBtHp537IpsnQHQSxNgXRBixH3xVmGUCbCHdEhSrjosmndKSFrh7JQ/0
 0MIkEv6HjoArq2iYH6bx4BzXlunsVN82CPS89UsmW/DweR1DsPh/3Ei6yIBWjEt2ru
 M5nqRRs9fXowyWyMYfAg+kI94BbiTK86iNLwuucU=
Date: Wed, 4 Sep 2019 12:41:08 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190904071108.GI2672@vkoul-mobl>
References: <20190813213227.5163-1-pierre-louis.bossart@linux.intel.com>
 <20190813213227.5163-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813213227.5163-2-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH 1/6] soundwire: fix startup sequence for
	Intel/Cadence
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 13-08-19, 16:32, Pierre-Louis Bossart wrote:
> Multiple changes squashed in single patch to avoid tick-tock effect.
> 
> 1. Per the hardware documentation, all changes to MCP_CONFIG,
> MCP_CONTROL, MCP_CMDCTRL and MCP_PHYCTRL need to be validated with a
> self-clearing write to MCP_CONFIG_UPDATE. Add a helper and do the
> update when the CONFIG is changed.
> 
> 2. Move interrupt enable after interrupt handler registration
> 
> 3. Add a new helper to start the hardware bus reset with maximum duration
> to make sure the Slave(s) correctly detect the reset pattern and to
> ensure electrical conflicts can be resolved.
> 
> 4. flush command FIFOs
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/cadence_master.c | 84 +++++++++++++++++++++---------
>  drivers/soundwire/cadence_master.h |  1 +
>  drivers/soundwire/intel.c          | 14 ++++-
>  3 files changed, 73 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index 502ed4ec8f07..046622e4b264 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -231,6 +231,22 @@ static int cdns_clear_bit(struct sdw_cdns *cdns, int offset, u32 value)
>  	return -EAGAIN;
>  }
>  
> +/*
> + * all changes to the MCP_CONFIG, MCP_CONTROL, MCP_CMDCTRL and MCP_PHYCTRL
> + * need to be confirmed with a write to MCP_CONFIG_UPDATE
> + */
> +static int cdns_update_config(struct sdw_cdns *cdns)
> +{
> +	int ret;
> +
> +	ret = cdns_clear_bit(cdns, CDNS_MCP_CONFIG_UPDATE,
> +			     CDNS_MCP_CONFIG_UPDATE_BIT);
> +	if (ret < 0)
> +		dev_err(cdns->dev, "Config update timedout\n");
> +
> +	return ret;
> +}
> +
>  /*
>   * debugfs
>   */
> @@ -752,7 +768,42 @@ EXPORT_SYMBOL(sdw_cdns_thread);
>  /*
>   * init routines
>   */
> -static int _cdns_enable_interrupt(struct sdw_cdns *cdns)
> +
> +/**
> + * sdw_cdns_exit_reset() - Program reset parameters and start bus operations
> + * @cdns: Cadence instance
> + */
> +int sdw_cdns_exit_reset(struct sdw_cdns *cdns)
> +{
> +	int ret;
> +
> +	/* program maximum length reset to be safe */
> +	cdns_updatel(cdns, CDNS_MCP_CONTROL,
> +		     CDNS_MCP_CONTROL_RST_DELAY,
> +		     CDNS_MCP_CONTROL_RST_DELAY);
> +
> +	/* use hardware generated reset */
> +	cdns_updatel(cdns, CDNS_MCP_CONTROL,
> +		     CDNS_MCP_CONTROL_HW_RST,
> +		     CDNS_MCP_CONTROL_HW_RST);
> +
> +	/* enable bus operations with clock and data */
> +	cdns_updatel(cdns, CDNS_MCP_CONFIG,
> +		     CDNS_MCP_CONFIG_OP,
> +		     CDNS_MCP_CONFIG_OP_NORMAL);
> +
> +	/* commit changes */
> +	ret = cdns_update_config(cdns);
> +
> +	return ret;

return cdns_update_config() ?


> +}
> +EXPORT_SYMBOL(sdw_cdns_exit_reset);
> +
> +/**
> + * sdw_cdns_enable_interrupt() - Enable SDW interrupts and update config
> + * @cdns: Cadence instance
> + */
> +int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
>  {
>  	u32 mask;
>  
> @@ -784,24 +835,8 @@ static int _cdns_enable_interrupt(struct sdw_cdns *cdns)
>  
>  	cdns_writel(cdns, CDNS_MCP_INTMASK, mask);
>  
> -	return 0;
> -}
> -
> -/**
> - * sdw_cdns_enable_interrupt() - Enable SDW interrupts and update config
> - * @cdns: Cadence instance
> - */
> -int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns)
> -{
> -	int ret;
> -
> -	_cdns_enable_interrupt(cdns);
> -	ret = cdns_clear_bit(cdns, CDNS_MCP_CONFIG_UPDATE,
> -			     CDNS_MCP_CONFIG_UPDATE_BIT);
> -	if (ret < 0)
> -		dev_err(cdns->dev, "Config update timedout\n");
> -
> -	return ret;
> +	/* commit changes */
> +	return cdns_update_config(cdns);
>  }
>  EXPORT_SYMBOL(sdw_cdns_enable_interrupt);
>  
> @@ -975,6 +1010,10 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
>  	cdns_writel(cdns, CDNS_MCP_SSP_CTRL0, CDNS_DEFAULT_SSP_INTERVAL);
>  	cdns_writel(cdns, CDNS_MCP_SSP_CTRL1, CDNS_DEFAULT_SSP_INTERVAL);
>  
> +	/* flush command FIFOs */
> +	cdns_updatel(cdns, CDNS_MCP_CONTROL, CDNS_MCP_CONTROL_CMD_RST,
> +		     CDNS_MCP_CONTROL_CMD_RST);
> +
>  	/* Set cmd accept mode */
>  	cdns_updatel(cdns, CDNS_MCP_CONTROL, CDNS_MCP_CONTROL_CMD_ACCEPT,
>  		     CDNS_MCP_CONTROL_CMD_ACCEPT);
> @@ -997,13 +1036,10 @@ int sdw_cdns_init(struct sdw_cdns *cdns)
>  	/* Set cmd mode for Tx and Rx cmds */
>  	val &= ~CDNS_MCP_CONFIG_CMD;
>  
> -	/* Set operation to normal */
> -	val &= ~CDNS_MCP_CONFIG_OP;
> -	val |= CDNS_MCP_CONFIG_OP_NORMAL;
> -
>  	cdns_writel(cdns, CDNS_MCP_CONFIG, val);
>  
> -	return 0;
> +	/* commit changes */
> +	return cdns_update_config(cdns);
>  }
>  EXPORT_SYMBOL(sdw_cdns_init);
>  
> diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
> index 0b72b7094735..1a67728c5000 100644
> --- a/drivers/soundwire/cadence_master.h
> +++ b/drivers/soundwire/cadence_master.h
> @@ -161,6 +161,7 @@ irqreturn_t sdw_cdns_thread(int irq, void *dev_id);
>  int sdw_cdns_init(struct sdw_cdns *cdns);
>  int sdw_cdns_pdi_init(struct sdw_cdns *cdns,
>  		      struct sdw_cdns_stream_config config);
> +int sdw_cdns_exit_reset(struct sdw_cdns *cdns);
>  int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns);
>  
>  #ifdef CONFIG_DEBUG_FS
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 13c54eac0cc3..5f14c6acce80 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c

As I have said in the past it doesnt help having a patch touching two
components. The patch is titled cadence!

> @@ -1043,8 +1043,6 @@ static int intel_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_init;
>  
> -	ret = sdw_cdns_enable_interrupt(&sdw->cdns);
> -
>  	/* Read the PDI config and initialize cadence PDI */
>  	intel_pdi_init(sdw, &config);
>  	ret = sdw_cdns_pdi_init(&sdw->cdns, config);
> @@ -1062,6 +1060,18 @@ static int intel_probe(struct platform_device *pdev)
>  		goto err_init;
>  	}
>  
> +	ret = sdw_cdns_enable_interrupt(&sdw->cdns);
> +	if (ret < 0) {
> +		dev_err(sdw->cdns.dev, "cannot enable interrupts\n");
> +		goto err_init;
> +	}
> +
> +	ret = sdw_cdns_exit_reset(&sdw->cdns);
> +	if (ret < 0) {
> +		dev_err(sdw->cdns.dev, "unable to exit bus reset sequence\n");
> +		goto err_init;

Don't you want to disable interrupts at least... before you return
error? err_init does bus cleanup and not controller one

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
