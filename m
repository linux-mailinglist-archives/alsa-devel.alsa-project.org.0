Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB82920F965
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 18:26:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39AE51676;
	Tue, 30 Jun 2020 18:25:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39AE51676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593534405;
	bh=CA3nHyfxTt5b1R32rWUTSv3+CAfH63brn8Mthhcj5GY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cJ+GAoaLfmqJr8FVIC14nhsbGC6aw62Rkva1k+C6fV3+GHkCZtTEaDaM6gEjYgx25
	 bTQq27XQndpaTW9bi4fDiuIWV436liT/vNCp+0ViKdXzy4AJzd7ojIedLF+1yTZcBv
	 b4v16XC3BIh9qmT/4DHkuIqkyp7hLIGRnbL9qiDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BF5EF8013E;
	Tue, 30 Jun 2020 18:25:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E393F801F2; Tue, 30 Jun 2020 18:25:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D659BF8013E
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 18:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D659BF8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X5lsBO7e"
Received: from localhost (unknown [122.182.251.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B8BA22074F;
 Tue, 30 Jun 2020 16:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593534292;
 bh=CA3nHyfxTt5b1R32rWUTSv3+CAfH63brn8Mthhcj5GY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X5lsBO7eBmQN0ZvntviXS602smRp2C8rAqVZdsdqUO9nGyAejBF+LOBiHRNsxv2wk
 1ws6EOhs9mxfKon7LaUP/KeC3ckDEw4XWAlmNEtqEjUy93K8ybjaRD5FxTiqa4C+xA
 osGXLf+A+HzRDVguyAiliwW7hY9xTtHyhh1X9PYE=
Date: Tue, 30 Jun 2020 21:54:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 7/9] soundwire: intel/cadence: merge Soundwire interrupt
 handlers/threads
Message-ID: <20200630162448.GS2599@vkoul-mobl>
References: <20200623173546.21870-1-yung-chuan.liao@linux.intel.com>
 <20200623173546.21870-8-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623173546.21870-8-yung-chuan.liao@linux.intel.com>
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

On 24-06-20, 01:35, Bard Liao wrote:
> The existing code uses one pair of interrupt handler/thread per link
> but at the hardware level the interrupt is shared. This works fine for
> legacy PCI interrupts, but leads to timeouts in MSI (Message-Signaled
> Interrupt) mode, likely due to edges being lost.
> 
> This patch unifies interrupt handling for all links. The dedicated
> handler is removed since we use a common one for all shared interrupt
> sources, and the thread function takes care of dealing with interrupt
> sources. This partition follows the model used for the SOF IPC on
> HDaudio platforms, where similar timeout issues were noticed and doing
> all the interrupt handling/clearing in the thread improved
> reliability/stability.
> 
> Validation results with 4 links active in parallel show a night-and-day
> improvement with no timeouts noticed even during stress tests. Latency
> and quality of service are not affected by the change - mostly because
> events on a SoundWire link are throttled by the bus frame rate
> (typically 8..48kHz).
> 
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/cadence_master.c | 18 ++++++++++--------
>  drivers/soundwire/cadence_master.h |  4 ++++
>  drivers/soundwire/intel.c          | 15 ---------------
>  drivers/soundwire/intel.h          |  4 ++++
>  drivers/soundwire/intel_init.c     | 19 +++++++++++++++++++
>  5 files changed, 37 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index 613dbd415b91..24eafe0aa1c3 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -17,6 +17,7 @@
>  #include <linux/soundwire/sdw.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
> +#include <linux/workqueue.h>
>  #include "bus.h"
>  #include "cadence_master.h"
>  
> @@ -790,7 +791,7 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
>  			     CDNS_MCP_INT_SLAVE_MASK, 0);
>  
>  		int_status &= ~CDNS_MCP_INT_SLAVE_MASK;
> -		ret = IRQ_WAKE_THREAD;
> +		schedule_work(&cdns->work);
>  	}
>  
>  	cdns_writel(cdns, CDNS_MCP_INTSTAT, int_status);
> @@ -799,13 +800,15 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
>  EXPORT_SYMBOL(sdw_cdns_irq);
>  
>  /**
> - * sdw_cdns_thread() - Cadence irq thread handler
> - * @irq: irq number
> - * @dev_id: irq context
> + * To update slave status in a work since we will need to handle
> + * other interrupts eg. CDNS_MCP_INT_RX_WL during the update slave
> + * process.
> + * @work: cdns worker thread
>   */
> -irqreturn_t sdw_cdns_thread(int irq, void *dev_id)
> +static void cdns_update_slave_status_work(struct work_struct *work)
>  {
> -	struct sdw_cdns *cdns = dev_id;
> +	struct sdw_cdns *cdns =
> +		container_of(work, struct sdw_cdns, work);
>  	u32 slave0, slave1;
>  
>  	dev_dbg_ratelimited(cdns->dev, "Slave status change\n");
> @@ -822,9 +825,7 @@ irqreturn_t sdw_cdns_thread(int irq, void *dev_id)
>  	cdns_updatel(cdns, CDNS_MCP_INTMASK,
>  		     CDNS_MCP_INT_SLAVE_MASK, CDNS_MCP_INT_SLAVE_MASK);
>  
> -	return IRQ_HANDLED;
>  }
> -EXPORT_SYMBOL(sdw_cdns_thread);
>  
>  /*
>   * init routines
> @@ -1427,6 +1428,7 @@ int sdw_cdns_probe(struct sdw_cdns *cdns)
>  	init_completion(&cdns->tx_complete);
>  	cdns->bus.port_ops = &cdns_port_ops;
>  
> +	INIT_WORK(&cdns->work, cdns_update_slave_status_work);
>  	return 0;
>  }
>  EXPORT_SYMBOL(sdw_cdns_probe);
> diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
> index b410656f8194..7638858397df 100644
> --- a/drivers/soundwire/cadence_master.h
> +++ b/drivers/soundwire/cadence_master.h
> @@ -129,6 +129,10 @@ struct sdw_cdns {
>  
>  	bool link_up;
>  	unsigned int msg_count;
> +
> +	struct work_struct work;
> +
> +	struct list_head list;
>  };
>  
>  #define bus_to_cdns(_bus) container_of(_bus, struct sdw_cdns, bus)
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 0a4fc7f65743..06c553d94890 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -1258,21 +1258,7 @@ static int intel_master_probe(struct platform_device *pdev)
>  			 "SoundWire master %d is disabled, will be ignored\n",
>  			 bus->link_id);
>  
> -	/* Acquire IRQ */
> -	ret = request_threaded_irq(sdw->link_res->irq,
> -				   sdw_cdns_irq, sdw_cdns_thread,
> -				   IRQF_SHARED, KBUILD_MODNAME, cdns);
> -	if (ret < 0) {
> -		dev_err(dev, "unable to grab IRQ %d, disabling device\n",
> -			sdw->link_res->irq);
> -		goto err_init;
> -	}
> -
>  	return 0;
> -
> -err_init:
> -	sdw_bus_master_delete(bus);
> -	return ret;
>  }
>  
>  int intel_master_startup(struct platform_device *pdev)
> @@ -1344,7 +1330,6 @@ static int intel_master_remove(struct platform_device *pdev)
>  	if (!bus->prop.hw_disabled) {
>  		intel_debugfs_exit(sdw);
>  		sdw_cdns_enable_interrupt(cdns, false);
> -		free_irq(sdw->link_res->irq, sdw);
>  		snd_soc_unregister_component(dev);
>  	}
>  	sdw_bus_master_delete(bus);
> diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
> index d6bdd4d63e08..bf127c88eb51 100644
> --- a/drivers/soundwire/intel.h
> +++ b/drivers/soundwire/intel.h
> @@ -17,6 +17,8 @@
>   * @dev: device implementing hw_params and free callbacks
>   * @shim_lock: mutex to handle access to shared SHIM registers
>   * @shim_mask: global pointer to check SHIM register initialization
> + * @cdns: Cadence master descriptor
> + * @list: used to walk-through all masters exposed by the same controller
>   */
>  struct sdw_intel_link_res {
>  	struct platform_device *pdev;
> @@ -29,6 +31,8 @@ struct sdw_intel_link_res {
>  	struct device *dev;
>  	struct mutex *shim_lock; /* protect shared registers */
>  	u32 *shim_mask;
> +	struct sdw_cdns *cdns;
> +	struct list_head list;
>  };
>  
>  struct sdw_intel {
> diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
> index ad3175272e88..63b3beda443d 100644
> --- a/drivers/soundwire/intel_init.c
> +++ b/drivers/soundwire/intel_init.c
> @@ -9,6 +9,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/export.h>
> +#include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> @@ -166,6 +167,19 @@ void sdw_intel_enable_irq(void __iomem *mmio_base, bool enable)
>  }
>  EXPORT_SYMBOL_NS(sdw_intel_enable_irq, SOUNDWIRE_INTEL_INIT);
>  
> +irqreturn_t sdw_intel_thread(int irq, void *dev_id)
> +{
> +	struct sdw_intel_ctx *ctx = dev_id;
> +	struct sdw_intel_link_res *link;
> +
> +	list_for_each_entry(link, &ctx->link_list, list)
> +		sdw_cdns_irq(irq, link->cdns);
> +
> +	sdw_intel_enable_irq(ctx->mmio_base, true);
> +	return IRQ_HANDLED;
> +}
> +EXPORT_SYMBOL(sdw_intel_thread);

Who will call this API? Also don't see header for this..
Is this called from irq context or irq thread or something else?

Also no EXPORT_SYMBOL_NS() for this one?

-- 
~Vinod
