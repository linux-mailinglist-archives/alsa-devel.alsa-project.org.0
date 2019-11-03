Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E14EBED208
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Nov 2019 06:32:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70CCE17F5;
	Sun,  3 Nov 2019 06:31:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70CCE17F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572759125;
	bh=MqcrYmBx2vfyanvt2UYiMJ2zsnboZUUspsAF+PbQs60=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bex4X7xqDBLclNp/Q0kV4k0cWvOBQ3mmvnLXic5Jo35G67yEOM493u3RO/Gg9RTwp
	 xxrF86b1GWSdA/em8YhqykWfXKXoyJSu768OJMQBU2Z76c8IRpq162zWcCVME/El4u
	 STBJ0gcp0j3lutvEpKaCfCFyhvSqU2vxkiUvlnjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD4FFF80535;
	Sun,  3 Nov 2019 06:30:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2035F80535; Sun,  3 Nov 2019 06:30:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 811A6F80446
 for <alsa-devel@alsa-project.org>; Sun,  3 Nov 2019 06:30:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 811A6F80446
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VjDLVTeM"
Received: from localhost (unknown [106.206.115.146])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 08C69214D8;
 Sun,  3 Nov 2019 05:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572759011;
 bh=9oqXe3JHVRI89OqTwF0y1fkMeszReKpL2VFA38BTlXs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VjDLVTeMMZD4pw16JgzV5sc6WawxToDl0wHuKA2iOd+3d/yxqsedyBk1bJNeRhSb+
 PKpyZJR2PKIzFkJTpcMUBdKuHFcr7PtpZNolj5UFLoVJHT+N6Ww1uK3AtGGd2kJe0F
 JtRu1o/h9CLriPHA6v3lqF61Lv1+KpN97N+Zf7Dg=
Date: Sun, 3 Nov 2019 11:00:03 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191103053003.GH2695@vkoul-mobl.Dlink>
References: <20191023212823.608-1-pierre-louis.bossart@linux.intel.com>
 <20191023212823.608-5-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191023212823.608-5-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 04/14] soundwire: bus_type: rename sdw_drv_
 to sdw_slave_drv
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
> Before we add master driver support, make sure there is no ambiguity
> and no occirrences of sdw_drv_ functions.
        ^^^^^^^^^^^
typo

> 
> No functionality change.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/bus_type.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 2b2830b622fa..9a0fd3ee1014 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -67,7 +67,7 @@ struct bus_type sdw_bus_type = {
>  };
>  EXPORT_SYMBOL_GPL(sdw_bus_type);
>  
> -static int sdw_drv_probe(struct device *dev)
> +static int sdw_slave_drv_probe(struct device *dev)
>  {
>  	struct sdw_slave *slave = to_sdw_slave_device(dev);
>  	struct sdw_driver *drv = to_sdw_slave_driver(dev->driver);
> @@ -113,7 +113,7 @@ static int sdw_drv_probe(struct device *dev)
>  	return 0;
>  }
>  
> -static int sdw_drv_remove(struct device *dev)
> +static int sdw_slave_drv_remove(struct device *dev)
>  {
>  	struct sdw_slave *slave = to_sdw_slave_device(dev);
>  	struct sdw_driver *drv = to_sdw_slave_driver(dev->driver);
> @@ -127,7 +127,7 @@ static int sdw_drv_remove(struct device *dev)
>  	return ret;
>  }
>  
> -static void sdw_drv_shutdown(struct device *dev)
> +static void sdw_slave_drv_shutdown(struct device *dev)
>  {
>  	struct sdw_slave *slave = to_sdw_slave_device(dev);
>  	struct sdw_driver *drv = to_sdw_slave_driver(dev->driver);
> @@ -155,13 +155,13 @@ int __sdw_register_slave_driver(struct sdw_driver *drv,
>  	}
>  
>  	drv->driver.owner = owner;
> -	drv->driver.probe = sdw_drv_probe;
> +	drv->driver.probe = sdw_slave_drv_probe;
>  
>  	if (drv->remove)
> -		drv->driver.remove = sdw_drv_remove;
> +		drv->driver.remove = sdw_slave_drv_remove;
>  
>  	if (drv->shutdown)
> -		drv->driver.shutdown = sdw_drv_shutdown;
> +		drv->driver.shutdown = sdw_slave_drv_shutdown;
>  
>  	return driver_register(&drv->driver);
>  }
> -- 
> 2.20.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
