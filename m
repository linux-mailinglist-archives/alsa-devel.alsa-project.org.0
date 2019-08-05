Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF9F82337
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 18:54:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB6B11696;
	Mon,  5 Aug 2019 18:53:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB6B11696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565024068;
	bh=Cs1fdRMBCV/J5iAoBk8gFp4nFxBAlNZEXHxUSQHojAM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HtVSuKACSDoi/HKIrYTFkesx1SoulndyCdug+iidmqfRCPJLDWIdmhus5seQon+ZB
	 c1fY1/gMLGERPKa5b0QtZ/FGonCZqsfV5WoFnhYwqI3nHvVC7lN+XSWV+CZktR1kHi
	 xE51q5bBV/SK/CFsFN7c4hErZZcLhuEeGK0mmHGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CCEEF80535;
	Mon,  5 Aug 2019 18:52:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9BFEF80533; Mon,  5 Aug 2019 18:52:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BDAEF800F3
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 18:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BDAEF800F3
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 09:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="257772967"
Received: from buildpc-hp-z230.iind.intel.com (HELO buildpc-HP-Z230)
 ([10.223.89.34])
 by orsmga001.jf.intel.com with ESMTP; 05 Aug 2019 09:52:29 -0700
Date: Mon, 5 Aug 2019 22:24:22 +0530
From: Sanyog Kale <sanyog.r.kale@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190805165422.GB24889@buildpc-HP-Z230>
References: <20190725234032.21152-1-pierre-louis.bossart@linux.intel.com>
 <20190725234032.21152-28-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190725234032.21152-28-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com
Subject: Re: [alsa-devel] [RFC PATCH 27/40] soundwire: Add Intel resource
 management algorithm
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

On Thu, Jul 25, 2019 at 06:40:19PM -0500, Pierre-Louis Bossart wrote:
> This algorithm computes bus parameters like clock frequency, frame
> shape and port transport parameters based on active stream(s) running
> on the bus.
> 
> This implementation is optimal for Intel platforms. Developers can
> also implement their own .compute_params() callback for specific
> resource management algorithm.
> 
> Credits: this patch is based on an earlier internal contribution by
> Vinod Koul, Sanyog Kale, Shreyas Nc and Hardik Shah. All hard-coded
> values were removed from the initial contribution to use BIOS
> information instead.
> 
> FIXME: remove checkpatch report
> WARNING: Reusing the krealloc arg is almost always a bug
> +			group->rates = krealloc(group->rates,
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/Makefile                  |   2 +-
>  drivers/soundwire/algo_dynamic_allocation.c | 403 ++++++++++++++++++++
>  drivers/soundwire/bus.c                     |   3 +
>  drivers/soundwire/bus.h                     |  46 ++-
>  drivers/soundwire/stream.c                  |  20 +
>  include/linux/soundwire/sdw.h               |   5 +
>  6 files changed, 476 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/soundwire/algo_dynamic_allocation.c
> 
> diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
> index 88990cac48a7..f59a9d4a28fd 100644
> --- a/drivers/soundwire/Makefile
> +++ b/drivers/soundwire/Makefile
> @@ -5,7 +5,7 @@
>  
>  #Bus Objs
>  soundwire-bus-objs := bus_type.o bus.o slave.o mipi_disco.o stream.o \
> -			debugfs.o
> +			debugfs.o algo_dynamic_allocation.o
>  
>  obj-$(CONFIG_SOUNDWIRE_BUS) += soundwire-bus.o
>  
> diff --git a/drivers/soundwire/algo_dynamic_allocation.c b/drivers/soundwire/algo_dynamic_allocation.c
> new file mode 100644
> index 000000000000..89edb39162b8
> --- /dev/null
> +++ b/drivers/soundwire/algo_dynamic_allocation.c
> @@ -0,0 +1,403 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +// Copyright(c) 2015-18 Intel Corporation.
> +
> +/*
> + * Bandwidth management algorithm based on 2^n gears
> + *
> + */
> +
> +#include <linux/device.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/slab.h>
> +#include <linux/soundwire/sdw.h>
> +#include "bus.h"
> +
> +#define SDW_STRM_RATE_GROUPING		1
> +
> +struct sdw_group_params {
> +	unsigned int rate;
> +	int full_bw;
> +	int payload_bw;
> +	int hwidth;
> +};
> +
> +struct sdw_group {
> +	unsigned int count;
> +	unsigned int max_size;
> +	unsigned int *rates;
> +};
> +
> +struct sdw_transport_data {
> +	int hstart;
> +	int hstop;
> +	int block_offset;
> +	int sub_block_offset;
> +};
> +
> +
> +/**
> + * sdw_compute_port_params: Compute transport and port parameters
> + *
> + * @bus: SDW Bus instance
> + */
> +static int sdw_compute_port_params(struct sdw_bus *bus)
> +{
> +	struct sdw_group_params *params = NULL;
> +	struct sdw_group group;
> +	int ret;
> +
> +	ret = sdw_get_group_count(bus, &group);
> +	if (ret < 0)
> +		goto out;
> +
> +	if (group.count == 0)
> +		goto out;
> +
> +	params = kcalloc(group.count, sizeof(*params), GFP_KERNEL);
> +	if (!params) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	/* Compute transport parameters for grouped streams */
> +	ret = sdw_compute_group_params(bus, params,
> +				       &group.rates[0], group.count);
> +	if (ret < 0)
> +		goto out;
> +
> +	_sdw_compute_port_params(bus, params, group.count);
> +
> +out:
> +	kfree(params);
> +	kfree(group.rates);
> +
> +	return ret;
> +}
> +
> +static int sdw_select_row_col(struct sdw_bus *bus, int clk_freq)
> +{
> +	struct sdw_master_prop *prop = &bus->prop;
> +	int frame_int, frame_freq;
> +	int r, c;
> +
> +	for (c = 0; c < SDW_FRAME_COLS; c++) {
> +		for (r = 0; r < SDW_FRAME_ROWS; r++) {
> +			if (sdw_rows[r] != prop->default_row ||
> +			    sdw_cols[c] != prop->default_col)
> +				continue;

Are we only supporting default rows and cols?

> +
> +			frame_int = sdw_rows[r] * sdw_cols[c];
> +			frame_freq = clk_freq / frame_int;
> +
> +			if ((clk_freq - (frame_freq * SDW_FRAME_CTRL_BITS)) <
> +			    bus->params.bandwidth)
> +				continue;
> +
> +			bus->params.row = sdw_rows[r];
> +			bus->params.col = sdw_cols[c];
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
> -- 
> 2.20.1
> 

-- 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
