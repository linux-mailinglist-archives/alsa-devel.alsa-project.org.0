Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2196426FC0D
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 14:06:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7F7916DE;
	Fri, 18 Sep 2020 14:06:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7F7916DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600430817;
	bh=j1ySg9PF3kTDNfU/g06Co3f2/sTYU3bo+wWMQL/nnf0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mpZj6V5oRBHLNSYA7DZfRONpZTE3uBhERuUuvGufgQsccMyaVYKsXn8LGOBzm4gv9
	 nsVaq/YQ5E0Cor8ROwXRfDK4PLyAp6s0DOxMqwbfB0QHWCnVInCQySUGq2y9bYbvgw
	 cdAXHPenmn/GOaomHuQFgv2tqm3bIKfACUy2cPu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C14DCF80150;
	Fri, 18 Sep 2020 14:05:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66FE4F8015A; Fri, 18 Sep 2020 14:05:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0689AF800E8
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 14:05:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0689AF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HnZP6spy"
Received: from localhost (unknown [136.185.124.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8479720848;
 Fri, 18 Sep 2020 12:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600430706;
 bh=j1ySg9PF3kTDNfU/g06Co3f2/sTYU3bo+wWMQL/nnf0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HnZP6spyTomOdDXJX2A4nhCWu5tu5PFCp3ehLsTIyXB8syLzEA5C02w+y0pd/q10U
 L9J2GSSQq2V7OnFm3ZXHoj462rQLQCesuvLp4ERlHc7VS+sjLN7vBvRfuTb4cqca+6
 UR0c4hQ2LTqfvaJ1dfJTo0gvlFv+Trbp3SMS5U2Q=
Date: Fri, 18 Sep 2020 17:35:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 1/2] soundwire: bus: add enumerated Slave device to
 device list
Message-ID: <20200918120502.GR2968@vkoul-mobl>
References: <20200917160007.153106-1-pierre-louis.bossart@linux.intel.com>
 <20200917160007.153106-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917160007.153106-2-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On 17-09-20, 11:00, Pierre-Louis Bossart wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> Currently Slave devices are only added on startup, either from Device
> Tree or ACPI entries. However Slave devices that are physically
> present on the bus, but not described in platform firmware, will never
> be added to the device list. The user/integrator can only know the
> list of devices by looking a dynamic debug logs.
> 
> This patch suggests adding a Slave device eveb there is no matching DT or
> ACPI entry, so that we can see this in sysfs entry.
> 
> Initial code from Srinivas. Comments, fixes for ACPI probe and edits
> of commit message by Pierre.

You should add yours as Co-developed. That is the standard tag for these
things

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/bus.c      | 9 +++++++++
>  drivers/soundwire/bus.h      | 2 ++
>  drivers/soundwire/bus_type.c | 9 +++++++++
>  drivers/soundwire/slave.c    | 4 ++--
>  4 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 02574b4bb179..81807b332a12 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -741,6 +741,15 @@ static int sdw_program_device_num(struct sdw_bus *bus)
>  
>  		if (!found) {
>  			/* TODO: Park this device in Group 13 */
> +
> +			/*
> +			 * add Slave device even if there is no platform
> +			 * firmware description. There will be no driver probe
> +			 * but the user/integration will be able to see the
> +			 * device, enumeration status and device number in sysfs
> +			 */
> +			sdw_slave_add(bus, &id, NULL);
> +
>  			dev_err(bus->dev, "Slave Entry not found\n");
>  		}
>  
> diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
> index c53345fbc4c7..fd251c1eb925 100644
> --- a/drivers/soundwire/bus.h
> +++ b/drivers/soundwire/bus.h
> @@ -19,6 +19,8 @@ static inline int sdw_acpi_find_slaves(struct sdw_bus *bus)
>  int sdw_of_find_slaves(struct sdw_bus *bus);
>  void sdw_extract_slave_id(struct sdw_bus *bus,
>  			  u64 addr, struct sdw_slave_id *id);
> +int sdw_slave_add(struct sdw_bus *bus, struct sdw_slave_id *id,
> +		  struct fwnode_handle *fwnode);
>  int sdw_master_device_add(struct sdw_bus *bus, struct device *parent,
>  			  struct fwnode_handle *fwnode);
>  int sdw_master_device_del(struct sdw_bus *bus);
> diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
> index 6fba55898cf0..575b9bad99d5 100644
> --- a/drivers/soundwire/bus_type.c
> +++ b/drivers/soundwire/bus_type.c
> @@ -84,6 +84,15 @@ static int sdw_drv_probe(struct device *dev)
>  	const struct sdw_device_id *id;
>  	int ret;
>  
> +	/*
> +	 * fw description is mandatory to bind
> +	 */
> +	if (!dev->fwnode)
> +		return -ENODEV;
> +
> +	if (!IS_ENABLED(CONFIG_ACPI) && !dev->of_node)
> +		return -ENODEV;
> +
>  	id = sdw_get_device_id(slave, drv);
>  	if (!id)
>  		return -ENODEV;
> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
> index 4a250d33de5d..19b012310c29 100644
> --- a/drivers/soundwire/slave.c
> +++ b/drivers/soundwire/slave.c
> @@ -20,8 +20,8 @@ struct device_type sdw_slave_type = {
>  	.uevent =	sdw_slave_uevent,
>  };
>  
> -static int sdw_slave_add(struct sdw_bus *bus,
> -			 struct sdw_slave_id *id, struct fwnode_handle *fwnode)
> +int sdw_slave_add(struct sdw_bus *bus,
> +		  struct sdw_slave_id *id, struct fwnode_handle *fwnode)
>  {
>  	struct sdw_slave *slave;
>  	int ret;
> -- 
> 2.25.1

-- 
~Vinod
