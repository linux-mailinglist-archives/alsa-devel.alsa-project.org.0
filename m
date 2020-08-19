Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E38D624990B
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 11:08:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79DE116E7;
	Wed, 19 Aug 2020 11:07:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79DE116E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597828117;
	bh=+kIGh7xNBLq4Soui5QZSxxZW3BSSpRBV2ViZULaNly4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LLXsxBnrafGuvLSaimmMJTxYja3S/cd+NII841qS8hsDnCwRCkqv5T3HeAYqRlcIm
	 kc0vMEPJtEmpNsMb+M/EGpqb8uO63BQc3+N8wcJFWtS4CFfK1T8qF7WvhurChGfpkF
	 7eRBAaKXosEFL7T4YDlGvTcFfuYHqW/+6ufTht5k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B20C3F80114;
	Wed, 19 Aug 2020 11:06:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60192F80218; Wed, 19 Aug 2020 11:06:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41FA0F80114
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 11:06:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41FA0F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lMW0n5iy"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 402C02072D;
 Wed, 19 Aug 2020 09:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597828002;
 bh=+kIGh7xNBLq4Soui5QZSxxZW3BSSpRBV2ViZULaNly4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lMW0n5iy8gqO/oeV3/AQHudp+ujLkQsnrje1maisElRLR1vFN2nGaPgkfP2/2S63f
 HsDwTO6PMmcB4QBY0dZXybGjOXPfdYarCusMqw/k9x+vlDkVjKDuXdk1fsy88Ax6pF
 UnKKYkXVmH2B72+FnyavT0pdHRvDq3gGDzI4SSYc=
Date: Wed, 19 Aug 2020 14:36:37 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: cadence: fix race condition between suspend
 and Slave device alerts
Message-ID: <20200819090637.GE2639@vkoul-mobl>
References: <20200817222340.18042-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817222340.18042-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

On 18-08-20, 06:23, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> In system suspend stress cases, the SOF CI reports timeouts. The root
> cause is that an alert is generated while the system suspends. The
> interrupt handling generates transactions on the bus that will never
> be handled because the interrupts are disabled in parallel.
> 
> As a result, the transaction never completes and times out on resume.
> This error doesn't seem too problematic since it happens in a work
> queue, and the system recovers without issues.
> 
> Nevertheless, this race condition should not happen. When doing a
> system suspend, or when disabling interrupts, we should make sure the
> current transaction can complete, and prevent new work from being
> queued.
> 
> BugLink: https://github.com/thesofproject/linux/issues/2344
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/cadence_master.c | 24 +++++++++++++++++++++++-
>  drivers/soundwire/cadence_master.h |  1 +
>  2 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/cadence_master.c b/drivers/soundwire/cadence_master.c
> index 24eafe0aa1c3..1330ffc47596 100644
> --- a/drivers/soundwire/cadence_master.c
> +++ b/drivers/soundwire/cadence_master.c
> @@ -791,7 +791,16 @@ irqreturn_t sdw_cdns_irq(int irq, void *dev_id)
>  			     CDNS_MCP_INT_SLAVE_MASK, 0);
>  
>  		int_status &= ~CDNS_MCP_INT_SLAVE_MASK;
> -		schedule_work(&cdns->work);
> +
> +		/*
> +		 * Deal with possible race condition between interrupt
> +		 * handling and disabling interrupts on suspend.
> +		 *
> +		 * If the master is in the process of disabling
> +		 * interrupts, don't schedule a workqueue
> +		 */
> +		if (cdns->interrupt_enabled)
> +			schedule_work(&cdns->work);

would it not make sense to mask the interrupts first and then cancel the
work? that way you are guaranteed that after this call you dont have
interrupts and work scheduled?

>  	}
>  
>  	cdns_writel(cdns, CDNS_MCP_INTSTAT, int_status);
> @@ -924,6 +933,19 @@ int sdw_cdns_enable_interrupt(struct sdw_cdns *cdns, bool state)
>  		slave_state = cdns_readl(cdns, CDNS_MCP_SLAVE_INTSTAT1);
>  		cdns_writel(cdns, CDNS_MCP_SLAVE_INTSTAT1, slave_state);
>  	}
> +	cdns->interrupt_enabled = state;
> +
> +	/*
> +	 * Complete any on-going status updates before updating masks,
> +	 * and cancel queued status updates.
> +	 *
> +	 * There could be a race with a new interrupt thrown before
> +	 * the 3 mask updates below are complete, so in the interrupt
> +	 * we use the 'interrupt_enabled' status to prevent new work
> +	 * from being queued.
> +	 */
> +	if (!state)
> +		cancel_work_sync(&cdns->work);
>  
>  	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK0, slave_intmask0);
>  	cdns_writel(cdns, CDNS_MCP_SLAVE_INTMASK1, slave_intmask1);
> diff --git a/drivers/soundwire/cadence_master.h b/drivers/soundwire/cadence_master.h
> index fdec62b912d3..4d1aab5b5ec2 100644
> --- a/drivers/soundwire/cadence_master.h
> +++ b/drivers/soundwire/cadence_master.h
> @@ -133,6 +133,7 @@ struct sdw_cdns {
>  
>  	bool link_up;
>  	unsigned int msg_count;
> +	bool interrupt_enabled;
>  
>  	struct work_struct work;
>  
> -- 
> 2.17.1

-- 
~Vinod
