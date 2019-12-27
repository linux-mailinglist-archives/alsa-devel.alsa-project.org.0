Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4259F12B240
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 08:04:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C46241711;
	Fri, 27 Dec 2019 08:04:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C46241711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577430296;
	bh=I7vfhOO9hXK0acv+J3v1P8A2Is6PMQIhmuA/TZa+/P8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=btIrJXJjbtjiYKOessOLwBmh8AfuxMi49W2DGYFHyrOhcVyjK/vMeCSgKChgnf8DB
	 rqjOG7TZYVkJf6kxFATQSVmGJLHg93qNX7vG4l7OYvxUzcRnsSQt3dOE4pIfOGMOeT
	 61f+CwzIVZ6f0y3v8wccAR9F9eWW+QwiGRPmxBcs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3ED8F800E3;
	Fri, 27 Dec 2019 08:03:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90787F80132; Fri, 27 Dec 2019 08:03:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A82AF800CD
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 08:03:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A82AF800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CdaRs8QX"
Received: from localhost (unknown [106.201.34.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 822DB206CB;
 Fri, 27 Dec 2019 07:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577430185;
 bh=pK5NjLlc8HWBe47WJjU0g8KCM1MJ3oftsVNdPgivXf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CdaRs8QXBYpI2r4LreKJRhblBBK09MHiUsO0+7huZUxbJwstfxXw0v8PjlK68WVVu
 Gm3c/IV1aFRx0IMm25OXBpy9AO+ZX4NZdOQGZBGcrGp/DBA3am1FSfTILalUud0bn8
 uX0EQZNbS9o43FCSDVHpn31M8IqMPjLGV3RSijGc=
Date: Fri, 27 Dec 2019 12:33:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191227070301.GK3006@vkoul-mobl>
References: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
 <20191217210314.20410-7-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217210314.20410-7-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v5 06/17] soundwire: add support for
	sdw_slave_type
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

On 17-12-19, 15:03, Pierre-Louis Bossart wrote:
> In the existing SoundWire code, the bus does not have any explicit
> representation for Master Devices - only SoundWire Slaves are exposed.
> 
> In SoundWire, the Master Device provides the clock, synchronization
> information and command/control channels. When multiple links are
> supported, a Controller may expose more than one Master Device; they
> are typically embedded inside a larger audio cluster (be it in an
> SOC/chipset or an external audio codec), and we need to describe it
> using the Linux device and driver model.  This will allow for
> configuration functions to account for external dependencies such as
> power rails, clock sources or wake-up mechanisms. This transition will
> also allow for better sysfs support without the reference count issues
> mentioned in the initial reviews.
> 
> In this patch, we first convert the existing code to use an explicit
> sdw_slave_type and add error checks if this type is not set.
> 
> In follow-up patches we can add support for the sdw_master_type.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/bus_type.c       | 23 ++++++++++++++++++-----
>  drivers/soundwire/slave.c          |  7 ++++++-
>  include/linux/soundwire/sdw_type.h |  6 ++++++
>  3 files changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 9a0fd3ee1014..9719680a1e48 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -49,13 +49,26 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
>  
>  static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
>  {
> -	struct sdw_slave *slave = to_sdw_slave_device(dev);
> +	struct sdw_slave *slave;
>  	char modalias[32];
>  
> -	sdw_slave_modalias(slave, modalias, sizeof(modalias));
> -
> -	if (add_uevent_var(env, "MODALIAS=%s", modalias))
> -		return -ENOMEM;
> +	if (is_sdw_slave(dev)) {
> +		slave = to_sdw_slave_device(dev);
> +
> +		sdw_slave_modalias(slave, modalias, sizeof(modalias));
> +
> +		if (add_uevent_var(env, "MODALIAS=%s", modalias))
> +			return -ENOMEM;
> +	} else {
> +		/*
> +		 * We only need to handle uevents for the Slave device
> +		 * type. This error cannot happen unless the .uevent
> +		 * callback is set to use this function for a
> +		 * different device type (e.g. Master or Monitor)
> +		 */
> +		dev_err(dev, "uevent for unknown Soundwire type\n");
> +		return -EINVAL;

At this point and after next patch, the above code would be a no-op, do
we want this here, if so why?

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
