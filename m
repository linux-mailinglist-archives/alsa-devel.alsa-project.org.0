Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA49A2C384F
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Nov 2020 06:07:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 587F71719;
	Wed, 25 Nov 2020 06:06:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 587F71719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606280838;
	bh=OQivpyeKMz4JHTOLZeqk0jAOobpDhVdKkjY2Gy+r8VA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rrzXLnS+hAAStfibjuqAttZW+IIr28QYPyWXrc+CBUqNzLgSVY0qv7yJjOwQFETjO
	 nSmod+kDXZHXbq7z6HB5FL+QVsgiIWP/Qmh7afExbZCuMBqvY7oAidGTkHUqs6P3G5
	 pI7Z6VaBRsYmWUkjS8oCsC9uvmI1RzcZZtm2EW9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32FF0F800D2;
	Wed, 25 Nov 2020 06:05:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8280F80128; Wed, 25 Nov 2020 06:05:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0786F800D2
 for <alsa-devel@alsa-project.org>; Wed, 25 Nov 2020 06:05:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0786F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kaxDI2pc"
Received: from localhost (unknown [122.179.120.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F0C312075A;
 Wed, 25 Nov 2020 05:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606280734;
 bh=OQivpyeKMz4JHTOLZeqk0jAOobpDhVdKkjY2Gy+r8VA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kaxDI2pcNpXJ643EHknXHl3rHCWh49qRo2CtOIUkY+YIkwvvhfmrLku1NdEHYpb9n
 yk4Y++tty12lSbOPHuEarrh/sg2q92xfp2YMU1LbVH9OyqcvgGIBQ5AYDJcVkaNTX5
 OyY+he6dFIiKj0vzpCYgaEnbAYwOQbO4PrbNbfiM=
Date: Wed, 25 Nov 2020 10:35:28 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: master: use pm_runtime_set_active() on add
Message-ID: <20201125050528.GC8403@vkoul-mobl>
References: <20201124130742.10986-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124130742.10986-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com,
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

On 24-11-20, 21:07, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> The 'master' device acts as a glue layer used during bus
> initialization only, and it needs to be 'transparent' for pm_runtime
> management. Its behavior should be that it becomes active when one of
> its children becomes active, and suspends when all of its children are
> suspended.
> 
> In our tests on Intel platforms, we routinely see these sort of
> warnings on the initial boot:
> 
> [ 21.447345] rt715 sdw:3:25d:715:0: runtime PM trying to activate
> child device sdw:3:25d:715:0 but parent (sdw-master-3) is not active
> 
> This is root-caused to a missing setup to make the device 'active' on
> probe. Since we don't want the device to remain active forever after
> the probe, the autosuspend configuration is also enabled at the end of
> the probe - the device will actually autosuspend only in the case
> where there are no devices physically attached. In practice, the
> master device will suspend when all its children are no longer active.
> 
> Fixes: bd84256e86ecf ('soundwire: master: enable pm runtime')
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/master.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/soundwire/master.c b/drivers/soundwire/master.c
> index 3488bb824e84..9b05c9e25ebe 100644
> --- a/drivers/soundwire/master.c
> +++ b/drivers/soundwire/master.c
> @@ -8,6 +8,15 @@
>  #include <linux/soundwire/sdw_type.h>
>  #include "bus.h"
>  
> +/*
> + * The 3s value for autosuspend will only be used if there are no
> + * devices physically attached on a bus segment. In practice enabling
> + * the bus operation will result in children devices become active and
> + * the master device will only suspend when all its children are no
> + * longer active.
> + */
> +#define SDW_MASTER_SUSPEND_DELAY_MS 3000
> +
>  /*
>   * The sysfs for properties reflects the MIPI description as given
>   * in the MIPI DisCo spec
> @@ -154,7 +163,12 @@ int sdw_master_device_add(struct sdw_bus *bus, struct device *parent,
>  	bus->dev = &md->dev;
>  	bus->md = md;
>  
> +	pm_runtime_set_autosuspend_delay(&bus->md->dev, SDW_MASTER_SUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(&bus->md->dev);
> +	pm_runtime_mark_last_busy(&bus->md->dev);
> +	pm_runtime_set_active(&bus->md->dev);
>  	pm_runtime_enable(&bus->md->dev);
> +	pm_runtime_idle(&bus->md->dev);

I understand that this needs to be done somewhere but is the core the
right place. In intel case it maybe a dummy device but other controllers
are real devices and may not support pm.

I think better idea would be to do this in respective driver.. that way
it would be an opt-in for device supporting pm.

Thanks
-- 
~Vinod
