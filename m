Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0065ED209
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Nov 2019 06:34:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34D9F18CE;
	Sun,  3 Nov 2019 06:33:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34D9F18CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572759285;
	bh=q2K470IzbeI10rez3OMkWxQb47eYi7kEw+vWHgEXVIE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RMv8GRlZCU/pXOEaL1mjJmEh27fUxkj0eFTcMXKUdm0AjB/NchKRsixOXEM8TRbBi
	 NSMBTtFF9VEGzSZV044cmuOgMXrYr6GWsCI1AsO68Wwm0U9SUdXQ4bIPwWQCehwGLE
	 w3bo3mqTw1ycYO7p6Q0UJSSrLfZKNAyY7TrHDtr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E258DF805AE;
	Sun,  3 Nov 2019 06:33:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16FB0F80535; Sun,  3 Nov 2019 06:32:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42352F8015B
 for <alsa-devel@alsa-project.org>; Sun,  3 Nov 2019 06:32:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42352F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b+V868EL"
Received: from localhost (unknown [106.206.115.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F42C20848;
 Sun,  3 Nov 2019 05:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572759170;
 bh=sWpt+8gx2UCKCgB2KXVS3k69C+FooSSl8zh1C67GoGw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b+V868ELK1D52quKLVGl8UHoVERdMDQV+Cr9+e2uPPQsfFKUGlLKA9zdLqQtPREfM
 kub4ts0/RKcabrscvpgQNVm/ZUCVTPx2yLSD08SccaKNyha2lYPjUfoG0WYzY79NT7
 o2qywTz1CkFBzx826wuhuF0UuP8U2k8Oc+psUTqg=
Date: Sun, 3 Nov 2019 11:02:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191103053243.GI2695@vkoul-mobl.Dlink>
References: <20191023212823.608-1-pierre-louis.bossart@linux.intel.com>
 <20191023212823.608-7-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023212823.608-7-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 06/14] soundwire: add support for
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

On 23-10-19, 16:28, Pierre-Louis Bossart wrote:
> Currently the bus does not have any explicit support for master
> devices.  Add explicit support for sdw_slave_type, so that in
> follow-up patches we can add support for the sdw_md_type (md==Master
> Device), following the Grey Bus example.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/bus_type.c       | 9 ++++++++-
>  drivers/soundwire/slave.c          | 7 ++++++-
>  include/linux/soundwire/sdw_type.h | 6 ++++++
>  3 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 9a0fd3ee1014..5df095f4e12f 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -49,9 +49,16 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
>  
>  static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
>  {
> -	struct sdw_slave *slave = to_sdw_slave_device(dev);
> +	struct sdw_slave *slave;
>  	char modalias[32];
>  
> +	if (is_sdw_slave(dev)) {
> +		slave = to_sdw_slave_device(dev);
> +	} else {
> +		dev_warn(dev, "uevent for unknown Soundwire type\n");
> +		return -EINVAL;

when is the case where this would be triggered?

> +	}
> +
>  	sdw_slave_modalias(slave, modalias, sizeof(modalias));
>  
>  	if (add_uevent_var(env, "MODALIAS=%s", modalias))
> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
> index 48a513680db6..c87267f12a3b 100644
> --- a/drivers/soundwire/slave.c
> +++ b/drivers/soundwire/slave.c
> @@ -14,6 +14,11 @@ static void sdw_slave_release(struct device *dev)
>  	kfree(slave);
>  }
>  
> +struct device_type sdw_slave_type = {
> +	.name =		"sdw_slave",
> +	.release =	sdw_slave_release,
> +};
> +
>  static int sdw_slave_add(struct sdw_bus *bus,
>  			 struct sdw_slave_id *id, struct fwnode_handle *fwnode)
>  {
> @@ -41,9 +46,9 @@ static int sdw_slave_add(struct sdw_bus *bus,
>  			     id->class_id, id->unique_id);
>  	}
>  
> -	slave->dev.release = sdw_slave_release;
>  	slave->dev.bus = &sdw_bus_type;
>  	slave->dev.of_node = of_node_get(to_of_node(fwnode));
> +	slave->dev.type = &sdw_slave_type;
>  	slave->bus = bus;
>  	slave->status = SDW_SLAVE_UNATTACHED;
>  	slave->dev_num = 0;
> diff --git a/include/linux/soundwire/sdw_type.h b/include/linux/soundwire/sdw_type.h
> index 7d4bc6a979bf..c681b3426478 100644
> --- a/include/linux/soundwire/sdw_type.h
> +++ b/include/linux/soundwire/sdw_type.h
> @@ -5,6 +5,12 @@
>  #define __SOUNDWIRE_TYPES_H
>  
>  extern struct bus_type sdw_bus_type;
> +extern struct device_type sdw_slave_type;
> +
> +static inline int is_sdw_slave(const struct device *dev)
> +{
> +	return dev->type == &sdw_slave_type;
> +}
>  
>  #define to_sdw_slave_driver(_drv) \
>  	container_of(_drv, struct sdw_driver, driver)
> -- 
> 2.20.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
