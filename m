Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A627E9B3C6
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 17:46:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32E6B1689;
	Fri, 23 Aug 2019 17:45:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32E6B1689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566575184;
	bh=FzAx0dyg//Zi77uIG6XND4Y1zRcqHWRJqA9VbCIvyt4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QAsOQ3caUFJq5ErqBVIJUsiyc41BM4QCnvs8B0zyHLbNsqee2v/EI596W8rbJ/gCg
	 Em41ybJlTlX7XSPe/9bwV4i0Tfbxu6JEOL9PRYWNOxwobrjlN+gILjV5gNuQK4veGh
	 jlCAqfVykLAQx8DDvg1lTLqRpR00HLRjl1BWdUJg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06FB3F80306;
	Fri, 23 Aug 2019 17:44:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2185F80306; Fri, 23 Aug 2019 17:44:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=PRX_BODYSUB_5,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF1A0F80141
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 17:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF1A0F80141
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 08:44:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,421,1559545200"; d="scan'208";a="330763198"
Received: from sdkulkar-mobl.amr.corp.intel.com (HELO [10.254.94.219])
 ([10.254.94.219])
 by orsmga004.jf.intel.com with ESMTP; 23 Aug 2019 08:44:30 -0700
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org, 
 robh+dt@kernel.org, vkoul@kernel.org
References: <20190822233759.12663-1-srinivas.kandagatla@linaro.org>
 <20190822233759.12663-3-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2f1b5e2e-4699-1d06-e28e-708d5ed99b6a@linux.intel.com>
Date: Fri, 23 Aug 2019 10:44:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822233759.12663-3-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, spapothi@codeaurora.org, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com
Subject: Re: [alsa-devel] [RESEND PATCH v4 2/4] soundwire: core: add device
 tree support for slave devices
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 8/22/19 6:37 PM, Srinivas Kandagatla wrote:
> This patch adds support to parsing device tree based
> SoundWire slave devices.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   drivers/soundwire/bus.c   |  2 ++
>   drivers/soundwire/bus.h   |  1 +
>   drivers/soundwire/slave.c | 52 +++++++++++++++++++++++++++++++++++++++
>   3 files changed, 55 insertions(+)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index 49f64b2115b9..c2eaeb5c38ed 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -77,6 +77,8 @@ int sdw_add_bus_master(struct sdw_bus *bus)
>   	 */
>   	if (IS_ENABLED(CONFIG_ACPI) && ACPI_HANDLE(bus->dev))
>   		ret = sdw_acpi_find_slaves(bus);
> +	else if (IS_ENABLED(CONFIG_OF) && bus->dev->of_node)
> +		ret = sdw_of_find_slaves(bus);
>   	else
>   		ret = -ENOTSUPP; /* No ACPI/DT so error out */
>   
> diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
> index 3048ca153f22..ee46befedbd1 100644
> --- a/drivers/soundwire/bus.h
> +++ b/drivers/soundwire/bus.h
> @@ -15,6 +15,7 @@ static inline int sdw_acpi_find_slaves(struct sdw_bus *bus)
>   }
>   #endif
>   
> +int sdw_of_find_slaves(struct sdw_bus *bus);
>   void sdw_extract_slave_id(struct sdw_bus *bus,
>   			  u64 addr, struct sdw_slave_id *id);
>   
> diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
> index f39a5815e25d..3ef265d2ee89 100644
> --- a/drivers/soundwire/slave.c
> +++ b/drivers/soundwire/slave.c
> @@ -2,6 +2,7 @@
>   // Copyright(c) 2015-17 Intel Corporation.
>   
>   #include <linux/acpi.h>
> +#include <linux/of.h>
>   #include <linux/soundwire/sdw.h>
>   #include <linux/soundwire/sdw_type.h>
>   #include "bus.h"
> @@ -35,6 +36,7 @@ static int sdw_slave_add(struct sdw_bus *bus,
>   
>   	slave->dev.release = sdw_slave_release;
>   	slave->dev.bus = &sdw_bus_type;
> +	slave->dev.of_node = of_node_get(to_of_node(fwnode));
>   	slave->bus = bus;
>   	slave->status = SDW_SLAVE_UNATTACHED;
>   	slave->dev_num = 0;
> @@ -112,3 +114,53 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
>   }
>   
>   #endif
> +
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
> +	for_each_child_of_node(bus->dev->of_node, node) {
> +		int link_id, sdw_version, ret, len;
> +		const char *compat = NULL;
> +		struct sdw_slave_id id;
> +		const __be32 *addr;
> +
> +		compat = of_get_property(node, "compatible", NULL);
> +		if (!compat)
> +			continue;
> +
> +		ret = sscanf(compat, "sdw%01x%04hx%04hx%02hhx", &sdw_version,
> +			     &id.mfg_id, &id.part_id, &id.class_id);
> +
> +		if (ret != 4) {
> +			dev_err(dev, "Invalid compatible string found %s\n",
> +				compat);
> +			continue;
> +		}
> +
> +		addr = of_get_property(node, "reg", &len);
> +		if (!addr || (len < 2 * sizeof(u32))) {
> +			dev_err(dev, "Invalid Instance and Link ID\n");
> +			continue;
> +		}
> +
> +		id.unique_id = be32_to_cpup(addr++);
> +		link_id = be32_to_cpup(addr);

So here the link ID is obviously not in the address, so you are not 
using the MIPI spec as we discussed initially?

> +		id.sdw_version = sdw_version;
> +
> +		/* Check for link_id match */
> +		if (link_id != bus->link_id)
> +			continue;
> +
> +		sdw_slave_add(bus, &id, of_fwnode_handle(node));
> +	}
> +
> +	return 0;
> +}
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
