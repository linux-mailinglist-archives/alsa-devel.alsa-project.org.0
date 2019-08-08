Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B488650A
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 17:02:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAFCD823;
	Thu,  8 Aug 2019 17:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAFCD823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565276558;
	bh=bd8nGvuD5bgtyAssTaezFJBYSARrgKFtiNbMp2z8XU4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mFstJiK4hI2ZIzLK/HxPVk8imyzebEYS2G4anxKHlh+Dl0VGNxt0b//6j/UtlEoSE
	 5XuIwI9+HDqTk/HbFb0KF6zXyauZCqS1e6yZfInA7EfsLdFuTT4RrxQK+1FrmHISt3
	 I5+WNkdvK89B/PRluzCYaOcSxW0K1kDj82jm2vx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16E0AF804FF;
	Thu,  8 Aug 2019 17:00:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C89EF80534; Thu,  8 Aug 2019 17:00:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=PRX_BODYSUB_5,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B676FF800E3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 17:00:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B676FF800E3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 08:00:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,361,1559545200"; d="scan'208";a="182617457"
Received: from spenceke-mobl1.amr.corp.intel.com (HELO [10.251.157.200])
 ([10.251.157.200])
 by FMSMGA003.fm.intel.com with ESMTP; 08 Aug 2019 08:00:40 -0700
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org,
 broonie@kernel.org
References: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
 <20190808144504.24823-3-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <42ca4170-0fa0-6951-f568-89a05c095d5a@linux.intel.com>
Date: Thu, 8 Aug 2019 10:00:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808144504.24823-3-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org
Subject: Re: [alsa-devel] [PATCH v2 2/4] soundwire: core: add device tree
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> @@ -35,6 +36,7 @@ static int sdw_slave_add(struct sdw_bus *bus,
>   
>   	slave->dev.release = sdw_slave_release;
>   	slave->dev.bus = &sdw_bus_type;
> +	slave->dev.of_node = of_node_get(to_of_node(fwnode));

shouldn't this protected by
#if IS_ENABLED(CONFIG_OF) ?

>   	slave->bus = bus;
>   	slave->status = SDW_SLAVE_UNATTACHED;
>   	slave->dev_num = 0;
> @@ -112,3 +114,48 @@ int sdw_acpi_find_slaves(struct sdw_bus *bus)
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
> +		struct sdw_slave_id id;
> +		const char *compat = NULL;
> +		int unique_id, ret;
> +		int ver, mfg_id, part_id, class_id;
> +
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

I am confused here.
If you have two identical devices on the same link, isn't this property 
required and that should be a real error instead of a continue?

> +		}
> +
> +		id.sdw_version = ver - 0xF;

maybe a comment in the code would help to make the encoding 
self-explanatory, as you did in the DT bindings

   Version number '0x10' represents SoundWire 1.0
   Version number '0x11' represents SoundWire 1.1

> +		id.unique_id = unique_id;
> +		id.mfg_id = mfg_id;
> +		id.part_id = part_id;
> +		id.class_id = class_id;
> +		sdw_slave_add(bus, &id, of_fwnode_handle(node));
> +	}
> +	return 0;
> +}
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
