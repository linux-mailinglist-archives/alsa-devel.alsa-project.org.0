Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F3A26FC56
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 14:18:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16E8216E2;
	Fri, 18 Sep 2020 14:17:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16E8216E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600431490;
	bh=r1zUqZmAKu3lKnzKleH1AcNxr2guGVh8B1TvVEd7KC0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AxC97EB7Xedc4mPLNHtzTwum6zttEjyXNgRnCX+DFI8R1zjHJpy7oJhUSu2ZboAkn
	 47PgEsS5k79v3RbZswBXVlAVqGA0KG03jW+34xCTTo69kac5dVzgI8bNPx+JYEkeXH
	 bkWEDdf84IEpjcwYbFRBLgKXwjrGFygkknAtsVw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46F93F80150;
	Fri, 18 Sep 2020 14:16:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4EA1F8015A; Fri, 18 Sep 2020 14:16:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64462F8013A
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 14:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64462F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rOFS281e"
Received: from localhost (unknown [136.185.124.244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD0FE2084C;
 Fri, 18 Sep 2020 12:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600431378;
 bh=r1zUqZmAKu3lKnzKleH1AcNxr2guGVh8B1TvVEd7KC0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rOFS281e35yAHSvZlt0QS0VsQ6hLywvrhdmh+Y3RO8jop7LC5yIhTU/GruUNuZytr
 tQ2ITxIPIDTPsHTnk+v+6OqHwuGS8iuYKUbUphx4N0D85bALHIufy8jNl6DYUO5XTh
 Zxav4cv+ArSBAYxpt8VWYFV10p2KQGCyizwvGkbI=
Date: Fri, 18 Sep 2020 17:46:14 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 2/2] soundwire: sysfs: add slave status and device
 number before probe
Message-ID: <20200918121614.GS2968@vkoul-mobl>
References: <20200917160007.153106-1-pierre-louis.bossart@linux.intel.com>
 <20200917160007.153106-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917160007.153106-3-pierre-louis.bossart@linux.intel.com>
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
> The MIPI DisCo device properties that are read by the driver from
> platform firmware, or hard-coded in the driver, should only be
> provided as sysfs entries when a driver probes successfully.
> 
> However the device status and device number is updated even when there
> is no driver present, and hence can be updated when a Slave device is
> detected on the bus without being described in platform firmware and
> without any driver registered/probed.
> 
> As suggested by GregKH, the attribute group for Slave status and
> device number is is added by default upon device registration.
> 
> Credits to Vinod Koul for the status_show() function, shared in a
> separate patch and used as is here. The status table was modified to
> remove an unnecessary enum and status_show() is handled in a different
> group attribute than what was suggested by Vinod.
> 
> Tested-by: Srinivas Kandgatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  .../ABI/testing/sysfs-bus-soundwire-slave     | 18 ++++++
>  drivers/soundwire/slave.c                     |  2 +
>  drivers/soundwire/sysfs_local.h               |  4 ++
>  drivers/soundwire/sysfs_slave.c               | 59 ++++++++++++++++++-
>  4 files changed, 82 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-soundwire-slave b/Documentation/ABI/testing/sysfs-bus-soundwire-slave
> index db4c9511d1aa..425adf7b8aec 100644
> --- a/Documentation/ABI/testing/sysfs-bus-soundwire-slave
> +++ b/Documentation/ABI/testing/sysfs-bus-soundwire-slave
> @@ -1,3 +1,21 @@
> +What:		/sys/bus/soundwire/devices/sdw:.../dev-status/status
> +		/sys/bus/soundwire/devices/sdw:.../dev-status/device_number
> +
> +Date:		September 2020
> +
> +Contact:	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> +		Bard Liao <yung-chuan.liao@linux.intel.com>
> +		Vinod Koul <vkoul@kernel.org>
> +
> +Description:	SoundWire Slave status
> +
> +		These properties report the Slave status, e.g. if it
> +		is UNATTACHED or not, and in the latter case show the
> +		device_number. This status information is useful to
> +		detect devices exposed by platform firmware but not
> +		physically present on the bus, and conversely devices
> +		not exposed in platform firmware but enumerated.
> +
>  What:		/sys/bus/soundwire/devices/sdw:.../dev-properties/mipi_revision
>  		/sys/bus/soundwire/devices/sdw:.../dev-properties/wake_capable
>  		/sys/bus/soundwire/devices/sdw:.../dev-properties/test_mode_capable
> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
> index 19b012310c29..a08f4081c1c4 100644
> --- a/drivers/soundwire/slave.c
> +++ b/drivers/soundwire/slave.c
> @@ -6,6 +6,7 @@
>  #include <linux/soundwire/sdw.h>
>  #include <linux/soundwire/sdw_type.h>
>  #include "bus.h"
> +#include "sysfs_local.h"
>  
>  static void sdw_slave_release(struct device *dev)
>  {
> @@ -51,6 +52,7 @@ int sdw_slave_add(struct sdw_bus *bus,
>  	slave->dev.bus = &sdw_bus_type;
>  	slave->dev.of_node = of_node_get(to_of_node(fwnode));
>  	slave->dev.type = &sdw_slave_type;
> +	slave->dev.groups = sdw_slave_status_attr_groups;
>  	slave->bus = bus;
>  	slave->status = SDW_SLAVE_UNATTACHED;
>  	init_completion(&slave->enumeration_complete);
> diff --git a/drivers/soundwire/sysfs_local.h b/drivers/soundwire/sysfs_local.h
> index ff60adee3c41..7268bc24c538 100644
> --- a/drivers/soundwire/sysfs_local.h
> +++ b/drivers/soundwire/sysfs_local.h
> @@ -8,6 +8,10 @@
>   * SDW sysfs APIs -
>   */
>  
> +/* basic attributes to report status of Slave (attachment, dev_num) */
> +extern const struct attribute_group *sdw_slave_status_attr_groups[];
> +
> +/* additional device-managed properties reported after driver probe */
>  int sdw_slave_sysfs_init(struct sdw_slave *slave);
>  int sdw_slave_sysfs_dpn_init(struct sdw_slave *slave);
>  
> diff --git a/drivers/soundwire/sysfs_slave.c b/drivers/soundwire/sysfs_slave.c
> index f510071b0add..99c0bdd4a726 100644
> --- a/drivers/soundwire/sysfs_slave.c
> +++ b/drivers/soundwire/sysfs_slave.c
> @@ -16,10 +16,14 @@
>  
>  /*
>   * The sysfs for Slave reflects the MIPI description as given
> - * in the MIPI DisCo spec
> + * in the MIPI DisCo spec. dev-status properties come directly
> + * from the MIPI SoundWire specification.
>   *
>   * Base file is device
>   *	|---- modalias
> + *	|---- dev-status
> + *		|---- status
> + *		|---- device_number

Any reason why we want this under dev-status.

Both the status and device_number belong to the device, so we can
put them under device and use device properties

>   *	|---- dev-properties
>   *		|---- mipi_revision
>   *		|---- wake_capable
> @@ -212,3 +216,56 @@ int sdw_slave_sysfs_init(struct sdw_slave *slave)
>  
>  	return 0;
>  }
> +
> +/*
> + * the status is shown in capital letters for UNATTACHED and RESERVED
> + * on purpose, to highligh users to the fact that these status values
> + * are not expected.

Thanks for highlighting this, indeed this was intentional

> + */
> +static const char *const slave_status[] = {
> +	[SDW_SLAVE_UNATTACHED] =  "UNATTACHED",
> +	[SDW_SLAVE_ATTACHED] = "Attached",
> +	[SDW_SLAVE_ALERT] = "Alert",
> +	[SDW_SLAVE_RESERVED] = "RESERVED",
> +};
> +
> +static ssize_t status_show(struct device *dev,
> +			   struct device_attribute *attr, char *buf)
> +{
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +
> +	return sprintf(buf, "%s\n", slave_status[slave->status]);
> +}
> +static DEVICE_ATTR_RO(status);
> +
> +static ssize_t device_number_show(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	struct sdw_slave *slave = dev_to_sdw_dev(dev);
> +
> +	if (slave->status == SDW_SLAVE_UNATTACHED)
> +		return sprintf(buf, "%s", "N/A");

Do we really want N/A here, 0 should imply UNATTACHED and then the
status_show would tell UNATTACHED.

> +	else
> +		return sprintf(buf, "%d", slave->dev_num);
> +}
> +static DEVICE_ATTR_RO(device_number);
> +
> +static struct attribute *slave_status_attrs[] = {
> +	&dev_attr_status.attr,
> +	&dev_attr_device_number.attr,
> +	NULL,
> +};
> +
> +/*
> + * we don't use ATTRIBUTES_GROUP here since we want to add a subdirectory
> + * for device-status
> + */
> +static const struct attribute_group sdw_slave_status_attr_group = {
> +	.attrs	= slave_status_attrs,
> +	.name = "dev-status",
> +};
> +
> +const struct attribute_group *sdw_slave_status_attr_groups[] = {
> +	&sdw_slave_status_attr_group,
> +	NULL
> +};
> -- 
> 2.25.1

-- 
~Vinod
