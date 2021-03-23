Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B52345813
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 07:59:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8E1586F;
	Tue, 23 Mar 2021 07:58:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8E1586F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616482779;
	bh=/WkMVn8JteJqWLVGkAGsNc7gqYAORiyqFDj83S0YhyM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QGvBTevrHFX2BNyPbuSFwFEgFcXULEDEzT26dk+LvGuCEuE1JPvgPfxOkMk/tPi8p
	 RTHI3UGxhVCe/COZHMBWckheJLn/Pwn06hVEmlLnzxXi+aX+tE0nmKNwvcLo6z8bpx
	 h65mnoNEhgWq9vMqP7HSoYyNhcfY8sI9zFvjN1q8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F13EF80257;
	Tue, 23 Mar 2021 07:58:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA5EAF8025F; Tue, 23 Mar 2021 07:58:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CFBFF80155
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 07:58:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CFBFF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ucO160+b"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D70526198C;
 Tue, 23 Mar 2021 06:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616482676;
 bh=/WkMVn8JteJqWLVGkAGsNc7gqYAORiyqFDj83S0YhyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ucO160+bXDEasmx03pxQ1ZbsuPUQa3KqGCJQOOU3b+GzNaWgjVZd0o42JQKfaehll
 hFuY4x83pTUX7NKPbxFiltzhTpbqalwWlA09IdB996nViBvVwtqQl1bNykRmpiax77
 1qju1YGTEycLBtCT5goY7IbYc9jd4u6SAEneEoYTRR54Jdp66cO7kn6ei0RXYOZwWK
 KWRTzmEiVXoWCvypLWfFJ1QHhPDk4usl0E/LlJaz11FjWPCU7AmOG+oTVWvfedAt8w
 Y06BPnvVMBgziX5owdAM0Cfn6JKrQa25IGrUg8t+arA4R1bijV7jMzn4rwbo5LtJ0+
 MujIMAZXhQBBg==
Date: Tue, 23 Mar 2021 12:27:52 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: add slave device to linked list after
 device_register()
Message-ID: <YFmRcPUxxFxkuMkr@vkoul-mobl.Dlink>
References: <20210323022529.21915-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323022529.21915-1-yung-chuan.liao@linux.intel.com>
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
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

On 23-03-21, 10:25, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> We currently add the slave device to a linked list before
> device_register(), and then remove it if device_register() fails.
> 
> It's not clear why this sequence was necessary, this patch moves the
> linked list management to after the device_register().

Maybe add a comment :-)

The reason here is that before calling device_register() we need to be
ready and completely initialized. device_register is absolutely the last
step in the flow, always.

The probe of the device can happen and before you get a chance to
add to list, many number of things can happen.. So adding after is not a
very good idea :)

HTH

> 
> Suggested-by: Keyon Jie <yang.jie@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/slave.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
> index 112b21967c7a..0c92db2e1ddc 100644
> --- a/drivers/soundwire/slave.c
> +++ b/drivers/soundwire/slave.c
> @@ -65,9 +65,6 @@ int sdw_slave_add(struct sdw_bus *bus,
>  	for (i = 0; i < SDW_MAX_PORTS; i++)
>  		init_completion(&slave->port_ready[i]);
>  
> -	mutex_lock(&bus->bus_lock);
> -	list_add_tail(&slave->node, &bus->slaves);
> -	mutex_unlock(&bus->bus_lock);
>  
>  	ret = device_register(&slave->dev);
>  	if (ret) {
> @@ -77,13 +74,15 @@ int sdw_slave_add(struct sdw_bus *bus,
>  		 * On err, don't free but drop ref as this will be freed
>  		 * when release method is invoked.
>  		 */
> -		mutex_lock(&bus->bus_lock);
> -		list_del(&slave->node);
> -		mutex_unlock(&bus->bus_lock);
>  		put_device(&slave->dev);
>  
>  		return ret;
>  	}
> +
> +	mutex_lock(&bus->bus_lock);
> +	list_add_tail(&slave->node, &bus->slaves);
> +	mutex_unlock(&bus->bus_lock);
> +
>  	sdw_slave_debugfs_init(slave);
>  
>  	return ret;
> -- 
> 2.17.1

-- 
~Vinod
