Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C2B5B571
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2019 08:59:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89AEF1681;
	Mon,  1 Jul 2019 08:59:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89AEF1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561964395;
	bh=lfCTEbY9hz5WOBiNFfm2qdHWM4pOGy6RuesIrn64aWo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tgX17xLZBUgq58uz1ZU6viV/jjzwPWF9vwDA7hL1wUQNToFfur5dxGLCx2vxBh4qG
	 W5G/mpZtLSOZBoBBa3u/fa114eo2dIpqcpdg5geAq+nmptL4fUlNpfn1rydMTzZjWt
	 YhvTZTMZmvipT0tyteVSuuVA8SjKTqlrNKWRhWB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E109FF896EC;
	Mon,  1 Jul 2019 08:58:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74BAEF896EC; Mon,  1 Jul 2019 08:58:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODYSUB_5,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADB71F89670
 for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2019 08:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADB71F89670
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Qhdnkx3N"
Received: from localhost (unknown [122.167.76.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 05D3C20B7C;
 Mon,  1 Jul 2019 06:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561962055;
 bh=StqomvvpXflnRhDKL1dnp4Cn8wLcNE+ioYBf5EJMvSU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qhdnkx3NMl/OHo0W8jfSJlvavK54m9wt+kzowzosr+VKbbTez0psR/3NasyeR6f0v
 MlPxTCL58hYRS1tO+jFj0z7MK3WIXILIEkzL8Id+8R112wvw26PTCMX0ZQix5pGYay
 PiCd+55IRc/33wtU7duuPBEEiHt+/+7EtYec9C74=
Date: Mon, 1 Jul 2019 11:47:45 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190701061745.GK2911@vkoul-mobl>
References: <20190611104043.22181-1-srinivas.kandagatla@linaro.org>
 <20190611104043.22181-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611104043.22181-3-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 bgoswami@quicinc.com
Subject: Re: [alsa-devel] [RFC PATCH 2/5] soundwire: core: add device tree
 support for slave devices
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

On 11-06-19, 11:40, Srinivas Kandagatla wrote:
> This patch adds support to parsing device tree based
> SoundWire slave devices.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/soundwire/bus.c   |  2 +-
>  drivers/soundwire/bus.h   |  1 +
>  drivers/soundwire/slave.c | 54 ++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 55 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index fe745830a261..20f26cf4ba74 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -78,7 +78,7 @@ int sdw_add_bus_master(struct sdw_bus *bus)
>  	if (IS_ENABLED(CONFIG_ACPI) && ACPI_HANDLE(bus->dev))
>  		ret = sdw_acpi_find_slaves(bus);
>  	else
> -		ret = -ENOTSUPP; /* No ACPI/DT so error out */
> +		ret = sdw_of_find_slaves(bus);
>  
>  	if (ret) {
>  		dev_err(bus->dev, "Finding slaves failed:%d\n", ret);
> diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
> index 3048ca153f22..ee46befedbd1 100644
> --- a/drivers/soundwire/bus.h
> +++ b/drivers/soundwire/bus.h
> @@ -15,6 +15,7 @@ static inline int sdw_acpi_find_slaves(struct sdw_bus *bus)
>  }
>  #endif
>  
> +int sdw_of_find_slaves(struct sdw_bus *bus);
>  void sdw_extract_slave_id(struct sdw_bus *bus,
>  			  u64 addr, struct sdw_slave_id *id);
>  
> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
> index f39a5815e25d..6e7f5cfeb854 100644
> --- a/drivers/soundwire/slave.c
> +++ b/drivers/soundwire/slave.c
> @@ -2,6 +2,7 @@
>  // Copyright(c) 2015-17 Intel Corporation.
>  
>  #include <linux/acpi.h>
> +#include <linux/of.h>
>  #include <linux/soundwire/sdw.h>
>  #include <linux/soundwire/sdw_type.h>
>  #include "bus.h"
> @@ -28,13 +29,14 @@ static int sdw_slave_add(struct sdw_bus *bus,
>  	slave->dev.parent = bus->dev;
>  	slave->dev.fwnode = fwnode;
>  
> -	/* name shall be sdw:link:mfg:part:class:unique */
> +	/* name shall be sdw:link:mfg:part:class */

nope we are not changing dev_set_name below so this comment should not
be modified

>  	dev_set_name(&slave->dev, "sdw:%x:%x:%x:%x:%x",
>  		     bus->link_id, id->mfg_id, id->part_id,
>  		     id->class_id, id->unique_id);
>  
>  	slave->dev.release = sdw_slave_release;
>  	slave->dev.bus = &sdw_bus_type;
> +	slave->dev.of_node = of_node_get(to_of_node(fwnode));
>  	slave->bus = bus;
>  	slave->status = SDW_SLAVE_UNATTACHED;
>  	slave->dev_num = 0;
> @@ -112,3 +114,53 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
>  }
>  
>  #endif
> +
> +#if IS_ENABLED(CONFIG_OF)
> +/*
> + * sdw_of_find_slaves() - Find Slave devices in master device tree node
> + * @bus: SDW bus instance
> + *
> + * Scans Master DT node for SDW child Slave devices and registers it.
> + */
> +int sdw_of_find_slaves(struct sdw_bus *bus)
> +{
> +	struct device *dev = bus->dev;
> +	struct device_node *node;
> +
> +	if (!bus->dev->of_node)
> +		return 0;

this should be error, otherwise next condition of checking slaves wont
be triggered..

> +
> +	for_each_child_of_node(bus->dev->of_node, node) {
> +		struct sdw_slave_id id;
> +		const char *compat = NULL;
> +		int unique_id, ret;
> +		int ver, mfg_id, part_id, class_id;
> +		compat = of_get_property(node, "compatible", NULL);
> +		if (!compat)
> +			continue;
> +
> +		ret = sscanf(compat, "sdw%x,%x,%x,%x",
> +			     &ver, &mfg_id, &part_id, &class_id);
> +		if (ret != 4) {
> +			dev_err(dev, "Manf ID & Product code not found %s\n",
> +				compat);
> +			continue;
> +		}
> +
> +		ret = of_property_read_u32(node, "sdw-instance-id", &unique_id);
> +		if (ret) {
> +			dev_err(dev, "Instance id not found:%d\n", ret);
> +			continue;
> +		}
> +
> +		id.sdw_version = ver - 0xF;
> +		id.unique_id = unique_id;
> +		id.mfg_id = mfg_id;
> +		id.part_id = part_id;
> +		id.class_id = class_id;
> +		sdw_slave_add(bus, &id, of_fwnode_handle(node));
> +	}
> +	return 0;
> +}
> +
> +#endif
> -- 
> 2.21.0

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
