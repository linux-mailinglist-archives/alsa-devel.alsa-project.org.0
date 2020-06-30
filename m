Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8774F20F9E2
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 18:53:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE4B81658;
	Tue, 30 Jun 2020 18:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE4B81658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593536006;
	bh=aJfBwSRR9T2vIaRp4pZHy0LuJfSWE/tmG0LQ3K1OGjQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rOC+PMNNxTlKkTPf2Cv7L5RiOqCw5hHrlcoJ2sKPY5nXABfwGtKd+PJp2n9nO/QrS
	 ZKpidkxiQcBzJm/fcjWzNQtiR86VzcNWEcMf3nlStQ/NHkSXLvbatziNz3vmW4EUNV
	 rQfxkVyYtIuoIyNzTI8AHmarfG+0Zw5vmELtQAns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 082D0F8022D;
	Tue, 30 Jun 2020 18:51:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66697F801F2; Tue, 30 Jun 2020 18:51:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FFBFF800EA
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 18:51:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FFBFF800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tVZzCLkr"
Received: from localhost (unknown [122.182.251.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 29E2220722;
 Tue, 30 Jun 2020 16:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593535891;
 bh=aJfBwSRR9T2vIaRp4pZHy0LuJfSWE/tmG0LQ3K1OGjQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tVZzCLkrtwW+KIgZor7eQaHmVHcIeI8AY1I/KDSPtbMRrulci8G1m7PXQAENQK2Gv
 RvOswL281ETj2PeoapQ0y3wbiaAxtU9H43IDzRVoPoLxbgiZjhluhxBJiFA0osypvT
 jRm4VnOhPXCzx7nswbjCJgC41LgtiYYuwb10xSA0=
Date: Tue, 30 Jun 2020 22:21:26 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 8/9] soundwire: intel: add wake interrupt support
Message-ID: <20200630165126.GT2599@vkoul-mobl>
References: <20200623173546.21870-1-yung-chuan.liao@linux.intel.com>
 <20200623173546.21870-9-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623173546.21870-9-yung-chuan.liao@linux.intel.com>
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
> From: Rander Wang <rander.wang@intel.com>
> 
> When system is suspended in clock stop mode on intel platforms, both
> master and slave are in clock stop mode and soundwire bus is taken
> over by a glue hardware. The bus message for jack event is processed
> by this glue hardware, which will trigger an interrupt to resume audio
> pci device. Then audio pci driver will resume soundwire master and slave,
> transfer bus ownership to master, finally slave will report jack event
> to master and codec driver is triggered to check jack status.
> 
> if a slave has been attached to a bus, the slave->dev_num_sticky
> should be non-zero, so we can check this value to skip the
> ghost devices defined in ACPI table but not populated in hardware.
> 
> Signed-off-by: Rander Wang <rander.wang@intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/intel.c      | 48 +++++++++++++++++++++++++++++++++-
>  drivers/soundwire/intel.h      |  1 +
>  drivers/soundwire/intel_init.c | 22 ++++++++++++++++
>  3 files changed, 70 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
> index 06c553d94890..22d9fd3e34fa 100644
> --- a/drivers/soundwire/intel.c
> +++ b/drivers/soundwire/intel.c
> @@ -13,6 +13,7 @@
>  #include <linux/io.h>
>  #include <linux/platform_device.h>
>  #include <sound/pcm_params.h>
> +#include <linux/pm_runtime.h>
>  #include <sound/soc.h>
>  #include <linux/soundwire/sdw_registers.h>
>  #include <linux/soundwire/sdw.h>
> @@ -436,7 +437,7 @@ static int intel_shim_init(struct sdw_intel *sdw, bool clock_stop)
>  	return ret;
>  }
>  
> -static void __maybe_unused intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)
> +static void intel_shim_wake(struct sdw_intel *sdw, bool wake_enable)

why drop __maybe?

>  {
>  	void __iomem *shim = sdw->link_res->shim;
>  	unsigned int link_id = sdw->instance;
> @@ -1337,6 +1338,51 @@ static int intel_master_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +int intel_master_process_wakeen_event(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct sdw_intel *sdw;
> +	struct sdw_bus *bus;
> +	struct sdw_slave *slave;
> +	void __iomem *shim;
> +	u16 wake_sts;
> +
> +	sdw = platform_get_drvdata(pdev);
> +	bus = &sdw->cdns.bus;
> +
> +	if (bus->prop.hw_disabled) {
> +		dev_dbg(dev,
> +			"SoundWire master %d is disabled, ignoring\n",
> +			bus->link_id);

single line pls

> +		return 0;
> +	}
> +
> +	shim = sdw->link_res->shim;
> +	wake_sts = intel_readw(shim, SDW_SHIM_WAKESTS);
> +
> +	if (!(wake_sts & BIT(sdw->instance)))
> +		return 0;
> +
> +	/* disable WAKEEN interrupt ASAP to prevent interrupt flood */
> +	intel_shim_wake(sdw, false);

when & where is this enabled?

> +
> +	/*
> +	 * wake up master and slave so that slave can notify master
> +	 * the wakeen event and let codec driver check codec status
> +	 */
> +	list_for_each_entry(slave, &bus->slaves, node) {
> +		/*
> +		 * discard devices that are defined in ACPI tables but
> +		 * not physically present and devices that cannot
> +		 * generate wakes
> +		 */
> +		if (slave->dev_num_sticky && slave->prop.wake_capable)
> +			pm_request_resume(&slave->dev);

Hmmm, shouldn't slave do this? would it not make sense to notify the
slave thru callback and then slave decides to resume or not..? 

-- 
~Vinod
