Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A2F12B22A
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 07:56:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4604170A;
	Fri, 27 Dec 2019 07:55:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4604170A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577429789;
	bh=NQO0JwcerQjMLF1r8Kmh2Hw2dQqnhTqyYYtrwIH5jdw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JETlueSc1ESa8d/H3AvkjwffsByAJlUla8K7Z0uXgZVbCFubhAruk032mz1Sfsagn
	 4b6SrIh59+2qy8MrgmHGCIHPCClqxfPfgqFuUuXfWk+vdLk8x9/FDthZHSca44moYM
	 2onzSIlYKeWjOHE+WuoNg8IrHGzEqbLsPl3u53ok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA5CDF80131;
	Fri, 27 Dec 2019 07:54:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DB66F80132; Fri, 27 Dec 2019 07:54:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56ECAF800E3
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 07:54:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56ECAF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pTfA0fEm"
Received: from localhost (unknown [106.201.34.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD880206CB;
 Fri, 27 Dec 2019 06:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577429676;
 bh=2weN5JX6ZnkjswoyolQKjBIPCekkLFG5RXJ35lLQBJs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pTfA0fEmxzH/+1heFC/7hwhz2SR019KKApYwddkwF7ZZlsMfPpImQyG65INVEOWSn
 rZqGdhz9/b6oysNvoQLMcPFyPiWnCw8ed06QRC26ADY7OUzzyMzMmPAc+WKMU04lAx
 uqIPtym/SENW8OZXY9GAMqzWM6lQQlcBuqt/HorU=
Date: Fri, 27 Dec 2019 12:24:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
Message-ID: <20191227065430.GI3006@vkoul-mobl>
References: <20191217210314.20410-1-pierre-louis.bossart@linux.intel.com>
 <20191217210314.20410-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217210314.20410-3-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v5 02/17] soundwire: rename dev_to_sdw_dev
	macro
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

On 17-12-19, 15:02, Pierre-Louis Bossart wrote:
> Since we want to introduce master devices, rename macro so that we
> have consistency between slave and master device access.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/base/regmap/regmap-sdw.c |  4 ++--

need ack from Mark on this...

>  drivers/soundwire/bus.c          |  2 +-
>  drivers/soundwire/bus_type.c     | 11 ++++++-----
>  drivers/soundwire/slave.c        |  2 +-
>  include/linux/soundwire/sdw.h    |  3 ++-
>  5 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/base/regmap/regmap-sdw.c b/drivers/base/regmap/regmap-sdw.c
> index 50a66382d87d..d1fc0c22180a 100644
> --- a/drivers/base/regmap/regmap-sdw.c
> +++ b/drivers/base/regmap/regmap-sdw.c
> @@ -10,7 +10,7 @@
>  static int regmap_sdw_write(void *context, unsigned int reg, unsigned int val)
>  {
>  	struct device *dev = context;
> -	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct sdw_slave *slave = to_sdw_slave_device(dev);
>  
>  	return sdw_write(slave, reg, val);
>  }
> @@ -18,7 +18,7 @@ static int regmap_sdw_write(void *context, unsigned int reg, unsigned int val)
>  static int regmap_sdw_read(void *context, unsigned int reg, unsigned int *val)
>  {
>  	struct device *dev = context;
> -	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct sdw_slave *slave = to_sdw_slave_device(dev);
>  	int read;
>  
>  	read = sdw_read(slave, reg);
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index be5d437058ed..4b22ee996a65 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -110,7 +110,7 @@ EXPORT_SYMBOL(sdw_add_bus_master);
>  
>  static int sdw_delete_slave(struct device *dev, void *data)
>  {
> -	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct sdw_slave *slave = to_sdw_slave_device(dev);
>  	struct sdw_bus *bus = slave->bus;
>  
>  	sdw_slave_debugfs_exit(slave);
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 370b94752662..c0585bcc8a41 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -33,7 +33,7 @@ sdw_get_device_id(struct sdw_slave *slave, struct sdw_driver *drv)
>  
>  static int sdw_bus_match(struct device *dev, struct device_driver *ddrv)
>  {
> -	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct sdw_slave *slave = to_sdw_slave_device(dev);
>  	struct sdw_driver *drv = drv_to_sdw_slave_driver(ddrv);
>  
>  	return !!sdw_get_device_id(slave, drv);
> @@ -49,7 +49,7 @@ int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size)
>  
>  static int sdw_uevent(struct device *dev, struct kobj_uevent_env *env)
>  {
> -	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct sdw_slave *slave = to_sdw_slave_device(dev);
>  	char modalias[32];
>  
>  	sdw_slave_modalias(slave, modalias, sizeof(modalias));
> @@ -69,7 +69,7 @@ EXPORT_SYMBOL_GPL(sdw_bus_type);
>  
>  static int sdw_drv_probe(struct device *dev)
>  {
> -	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct sdw_slave *slave = to_sdw_slave_device(dev);
>  	struct sdw_driver *drv = drv_to_sdw_slave_driver(dev->driver);
>  	const struct sdw_device_id *id;
>  	int ret;
> @@ -115,8 +115,9 @@ static int sdw_drv_probe(struct device *dev)
>  
>  static int sdw_drv_remove(struct device *dev)
>  {
> -	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct sdw_slave *slave = to_sdw_slave_device(dev);
>  	struct sdw_driver *drv = drv_to_sdw_slave_driver(dev->driver);
> +
>  	int ret = 0;
>  
>  	if (drv->remove)
> @@ -129,7 +130,7 @@ static int sdw_drv_remove(struct device *dev)
>  
>  static void sdw_drv_shutdown(struct device *dev)
>  {
> -	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct sdw_slave *slave = to_sdw_slave_device(dev);
>  	struct sdw_driver *drv = drv_to_sdw_slave_driver(dev->driver);
>  
>  	if (drv->shutdown)
> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
> index 19919975bb6d..48a513680db6 100644
> --- a/drivers/soundwire/slave.c
> +++ b/drivers/soundwire/slave.c
> @@ -9,7 +9,7 @@
>  
>  static void sdw_slave_release(struct device *dev)
>  {
> -	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +	struct sdw_slave *slave = to_sdw_slave_device(dev);
>  
>  	kfree(slave);
>  }
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index b7c9eca4332a..5b1180f1e6b5 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -582,7 +582,8 @@ struct sdw_slave {
>  	u32 unattach_request;
>  };
>  
> -#define dev_to_sdw_dev(_dev) container_of(_dev, struct sdw_slave, dev)
> +#define to_sdw_slave_device(d) \
> +	container_of(d, struct sdw_slave, dev)
>  
>  struct sdw_driver {
>  	const char *name;
> -- 
> 2.20.1

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
