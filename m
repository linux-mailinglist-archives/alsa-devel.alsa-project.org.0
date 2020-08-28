Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 951872554AF
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Aug 2020 08:53:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19CBC1823;
	Fri, 28 Aug 2020 08:52:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19CBC1823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598597607;
	bh=/bhjJvxPGi0YxD+jDxjpPtYNclCNwWY9zpiia8ZDhCA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OLShjDFnL+0DsxnqnlLwjlhmDkiYTCqnUam38rECVwfXoXrDJjqIf6aw3gQNJYAwv
	 aZlLQoYcucDLA30e9Tvqkk+ruMtIvH3bD5uA6aV+fAwcHlwqeK4BxpY0d+MIs93edz
	 WRsunk9qoZ08psSxSRBV6BcW5b+1+ChUj8mHDapY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19F22F80143;
	Fri, 28 Aug 2020 08:51:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D2B5F8016F; Fri, 28 Aug 2020 08:51:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 305C4F80105
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 08:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 305C4F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="m+NiDIn6"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AACB220825;
 Fri, 28 Aug 2020 06:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598597489;
 bh=/bhjJvxPGi0YxD+jDxjpPtYNclCNwWY9zpiia8ZDhCA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m+NiDIn6Xja1b4Arx3GBrQKP9KH40E5H+ysjB5zuUJtKdtHvV9n+YsQusa8lxVt2i
 ffQqSDy0TV4qnzlB9Rq26sisxGmXN2owFlOX9PHeC9dBLE/nwL1j0EU0+qTDc95A1h
 cReJsi/Enkve4dAcvZgX3f59Qn0SH28TPXnlFV/s=
Date: Fri, 28 Aug 2020 12:21:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, broonie@kernel.org
Subject: Re: [PATCH 1/7] soundwire: bus: use property to set interrupt masks
Message-ID: <20200828065125.GI2639@vkoul-mobl>
References: <20200818140656.29014-1-yung-chuan.liao@linux.intel.com>
 <20200818140656.29014-2-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200818140656.29014-2-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

Hi Mark,

On 18-08-20, 22:06, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Add a slave-level property and program the SCP_INT1_MASK as desired by
> the codec driver. Since there is no DisCo property this has to be an
> implementation-specific firmware property or hard-coded in the driver.
> 
> The only functionality change is that implementation-defined
> interrupts are no longer set for amplifiers - those interrupts are
> typically for jack detection or acoustic event detection/hotwording.
> 
> Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/bus.c         | 12 ++++++------
>  include/linux/soundwire/sdw.h   |  2 ++
>  sound/soc/codecs/max98373-sdw.c |  3 +++
>  sound/soc/codecs/rt1308-sdw.c   |  2 ++
>  sound/soc/codecs/rt5682-sdw.c   |  4 ++++
>  sound/soc/codecs/rt700-sdw.c    |  4 ++++
>  sound/soc/codecs/rt711-sdw.c    |  4 ++++
>  sound/soc/codecs/rt715-sdw.c    |  4 ++++
>  sound/soc/codecs/wsa881x.c      |  1 +

This touches codecs, can you Ack it please

Ideally this should have been split up to header, the codec updates and
finally the bus change!


>  9 files changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index e6e0fb9a81b4..3b6a87bc254e 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -1184,13 +1184,13 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
>  		return ret;
>  
>  	/*
> -	 * Set bus clash, parity and SCP implementation
> -	 * defined interrupt mask
> -	 * TODO: Read implementation defined interrupt mask
> -	 * from Slave property
> +	 * Set SCP_INT1_MASK register, typically bus clash and
> +	 * implementation-defined interrupt mask. The Parity detection
> +	 * may not always be correct on startup so its use is
> +	 * device-dependent, it might e.g. only be enabled in
> +	 * steady-state after a couple of frames.
>  	 */
> -	val = SDW_SCP_INT1_IMPL_DEF | SDW_SCP_INT1_BUS_CLASH |
> -					SDW_SCP_INT1_PARITY;
> +	val = slave->prop.scp_int1_mask;
>  
>  	/* Enable SCP interrupts */
>  	ret = sdw_update(slave, SDW_SCP_INTMASK1, val, val);
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 76052f12c9f7..6d91f2ca20b2 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -355,6 +355,7 @@ struct sdw_dpn_prop {
>   * @dp0_prop: Data Port 0 properties
>   * @src_dpn_prop: Source Data Port N properties
>   * @sink_dpn_prop: Sink Data Port N properties
> + * @scp_int1_mask: SCP_INT1_MASK desired settings
>   */
>  struct sdw_slave_prop {
>  	u32 mipi_revision;
> @@ -376,6 +377,7 @@ struct sdw_slave_prop {
>  	struct sdw_dp0_prop *dp0_prop;
>  	struct sdw_dpn_prop *src_dpn_prop;
>  	struct sdw_dpn_prop *sink_dpn_prop;
> +	u8 scp_int1_mask;
>  };
>  
>  /**
> diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
> index 5fe724728e84..17fd1989e873 100644
> --- a/sound/soc/codecs/max98373-sdw.c
> +++ b/sound/soc/codecs/max98373-sdw.c
> @@ -15,6 +15,7 @@
>  #include <linux/of.h>
>  #include <linux/soundwire/sdw.h>
>  #include <linux/soundwire/sdw_type.h>
> +#include <linux/soundwire/sdw_registers.h>
>  #include "max98373.h"
>  #include "max98373-sdw.h"
>  
> @@ -287,6 +288,8 @@ static int max98373_read_prop(struct sdw_slave *slave)
>  	unsigned long addr;
>  	struct sdw_dpn_prop *dpn;
>  
> +	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
> +
>  	/* BITMAP: 00001000  Dataport 3 is active */
>  	prop->source_ports = BIT(3);
>  	/* BITMAP: 00000010  Dataport 1 is active */
> diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
> index b0ba0d2acbdd..5cf10fd447eb 100644
> --- a/sound/soc/codecs/rt1308-sdw.c
> +++ b/sound/soc/codecs/rt1308-sdw.c
> @@ -123,6 +123,8 @@ static int rt1308_read_prop(struct sdw_slave *slave)
>  	unsigned long addr;
>  	struct sdw_dpn_prop *dpn;
>  
> +	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
> +
>  	prop->paging_support = true;
>  
>  	/* first we need to allocate memory for set bits in port lists */
> diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
> index 94bf6bee78e6..544073975020 100644
> --- a/sound/soc/codecs/rt5682-sdw.c
> +++ b/sound/soc/codecs/rt5682-sdw.c
> @@ -19,6 +19,7 @@
>  #include <linux/mutex.h>
>  #include <linux/soundwire/sdw.h>
>  #include <linux/soundwire/sdw_type.h>
> +#include <linux/soundwire/sdw_registers.h>
>  #include <sound/core.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
> @@ -542,6 +543,9 @@ static int rt5682_read_prop(struct sdw_slave *slave)
>  	unsigned long addr;
>  	struct sdw_dpn_prop *dpn;
>  
> +	prop->scp_int1_mask = SDW_SCP_INT1_IMPL_DEF | SDW_SCP_INT1_BUS_CLASH |
> +		SDW_SCP_INT1_PARITY;
> +
>  	prop->paging_support = false;
>  
>  	/* first we need to allocate memory for set bits in port lists */
> diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
> index 4d14048d1197..a46b957a3f1b 100644
> --- a/sound/soc/codecs/rt700-sdw.c
> +++ b/sound/soc/codecs/rt700-sdw.c
> @@ -11,6 +11,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/soundwire/sdw.h>
>  #include <linux/soundwire/sdw_type.h>
> +#include <linux/soundwire/sdw_registers.h>
>  #include <linux/module.h>
>  #include <linux/regmap.h>
>  #include <sound/soc.h>
> @@ -338,6 +339,9 @@ static int rt700_read_prop(struct sdw_slave *slave)
>  	unsigned long addr;
>  	struct sdw_dpn_prop *dpn;
>  
> +	prop->scp_int1_mask = SDW_SCP_INT1_IMPL_DEF | SDW_SCP_INT1_BUS_CLASH |
> +		SDW_SCP_INT1_PARITY;
> +
>  	prop->paging_support = false;
>  
>  	/* first we need to allocate memory for set bits in port lists */
> diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
> index 45b928954b58..a877e366fec5 100644
> --- a/sound/soc/codecs/rt711-sdw.c
> +++ b/sound/soc/codecs/rt711-sdw.c
> @@ -11,6 +11,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/soundwire/sdw.h>
>  #include <linux/soundwire/sdw_type.h>
> +#include <linux/soundwire/sdw_registers.h>
>  #include <linux/module.h>
>  #include <linux/regmap.h>
>  #include <sound/soc.h>
> @@ -342,6 +343,9 @@ static int rt711_read_prop(struct sdw_slave *slave)
>  	unsigned long addr;
>  	struct sdw_dpn_prop *dpn;
>  
> +	prop->scp_int1_mask = SDW_SCP_INT1_IMPL_DEF | SDW_SCP_INT1_BUS_CLASH |
> +		SDW_SCP_INT1_PARITY;
> +
>  	prop->paging_support = false;
>  
>  	/* first we need to allocate memory for set bits in port lists */
> diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
> index d11b23d6b240..0eb8943ed6ff 100644
> --- a/sound/soc/codecs/rt715-sdw.c
> +++ b/sound/soc/codecs/rt715-sdw.c
> @@ -12,6 +12,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/soundwire/sdw.h>
>  #include <linux/soundwire/sdw_type.h>
> +#include <linux/soundwire/sdw_registers.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/regmap.h>
> @@ -436,6 +437,9 @@ static int rt715_read_prop(struct sdw_slave *slave)
>  	unsigned long addr;
>  	struct sdw_dpn_prop *dpn;
>  
> +	prop->scp_int1_mask = SDW_SCP_INT1_IMPL_DEF | SDW_SCP_INT1_BUS_CLASH |
> +		SDW_SCP_INT1_PARITY;
> +
>  	prop->paging_support = false;
>  
>  	/* first we need to allocate memory for set bits in port lists */
> diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
> index d39d479e2378..68e774e69c85 100644
> --- a/sound/soc/codecs/wsa881x.c
> +++ b/sound/soc/codecs/wsa881x.c
> @@ -1112,6 +1112,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
>  	wsa881x->sconfig.type = SDW_STREAM_PDM;
>  	pdev->prop.sink_ports = GENMASK(WSA881X_MAX_SWR_PORTS, 0);
>  	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
> +	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
>  	gpiod_direction_output(wsa881x->sd_n, 1);
>  
>  	wsa881x->regmap = devm_regmap_init_sdw(pdev, &wsa881x_regmap_config);
> -- 
> 2.17.1

-- 
~Vinod
