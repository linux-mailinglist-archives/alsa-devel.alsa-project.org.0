Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0AC456095
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 17:34:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03F521867;
	Thu, 18 Nov 2021 17:33:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03F521867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637253289;
	bh=Mqu9AjHOXNqVwePLKX9nbSoWI9lixf+/xad48n+NCXQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z5jv8yLnwqj3gogxziVpx//loFYV3HpV9JU5lwhe2anY3KmtwuM1iDRRaKeLDl0lO
	 kgmHr/xOXLUOdKI6ZXDNBdgTpE0I8eLSCWBTlNHBVP/ft6a4iib0GzGO65ca0UihrH
	 b/W7pELtmIU82iQiw7yqAR3T+L7m8P+MaxCQKEWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02A62F80423;
	Thu, 18 Nov 2021 17:33:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D060F8027D; Mon, 15 Nov 2021 10:14:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C81BCF80163
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 10:14:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C81BCF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.b="KmpIYw6i"
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68509D3E;
 Mon, 15 Nov 2021 10:14:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1636967679;
 bh=Mqu9AjHOXNqVwePLKX9nbSoWI9lixf+/xad48n+NCXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KmpIYw6iL+QGg/jQfPaAXjxBhbT8ed5+LXpS9Vfki8On0XIjUU+Fxa8QV1Z77Uq7z
 y6IDsVjB8zbvUKldzAH2W1BEVsA/FZvp6/ibJRVnAxSdL6j4sHfh4FyJeHP6WjIk0w
 BufJuEgiIHtwCFssoB38BxxBci3DM0+P7P/jbs7w=
Date: Mon, 15 Nov 2021 11:14:17 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 08/11] dmaengine: xilinx_dpdma: stop using slave_id field
Message-ID: <YZIk6cVb7XibrMjf@pendragon.ideasonboard.com>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-9-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211115085403.360194-9-arnd@kernel.org>
X-Mailman-Approved-At: Thu, 18 Nov 2021 17:33:03 +0100
Cc: alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-staging@lists.linux.dev, Michal Simek <michal.simek@xilinx.com>,
 Jon Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-serial@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
 Baolin Wang <baolin.wang7@gmail.com>
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

Hi Arnd,

Thank you for the patch.

On Mon, Nov 15, 2021 at 09:54:00AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The display driver wants to pass a custom flag to the DMA engine driver,
> which it started doing by using the slave_id field that was traditionally
> used for a different purpose.
> 
> As there is no longer a correct use for the slave_id field, it should
> really be removed, and the remaining users changed over to something
> different.
> 
> The new mechanism for passing nonstandard settings is using the
> .peripheral_config field, so use that to pass a newly defined structure
> here, making it clear that this will not work in portable drivers.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/dma/xilinx/xilinx_dpdma.c  | 12 ++++++++----
>  drivers/gpu/drm/xlnx/zynqmp_disp.c |  9 +++++++--
>  include/linux/dma/xilinx_dpdma.h   | 11 +++++++++++
>  3 files changed, 26 insertions(+), 6 deletions(-)
>  create mode 100644 include/linux/dma/xilinx_dpdma.h
> 
> diff --git a/drivers/dma/xilinx/xilinx_dpdma.c b/drivers/dma/xilinx/xilinx_dpdma.c
> index ce5c66e6897d..e2c1ef7a659c 100644
> --- a/drivers/dma/xilinx/xilinx_dpdma.c
> +++ b/drivers/dma/xilinx/xilinx_dpdma.c
> @@ -12,6 +12,7 @@
>  #include <linux/clk.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
> +#include <linux/dma/xilinx_dpdma.h>
>  #include <linux/dmaengine.h>
>  #include <linux/dmapool.h>
>  #include <linux/interrupt.h>
> @@ -1273,6 +1274,7 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
>  			       struct dma_slave_config *config)
>  {
>  	struct xilinx_dpdma_chan *chan = to_xilinx_chan(dchan);
> +	struct xilinx_dpdma_peripheral_config *pconfig;
>  	unsigned long flags;
>  
>  	/*
> @@ -1285,11 +1287,13 @@ static int xilinx_dpdma_config(struct dma_chan *dchan,
>  	spin_lock_irqsave(&chan->lock, flags);
>  
>  	/*
> -	 * Abuse the slave_id to indicate that the channel is part of a video
> -	 * group.
> +	 * Abuse the peripheral_config to indicate that the channel is part

Is it still an abuse, or is this now the right way to pass custom data
to the DMA engine driver ?

> +	 * of a video group.
>  	 */
> -	if (chan->id <= ZYNQMP_DPDMA_VIDEO2)
> -		chan->video_group = config->slave_id != 0;
> +	pconfig = config->peripheral_config;

This could be moved to the variable declaration above, up to you.

> +	if (chan->id <= ZYNQMP_DPDMA_VIDEO2 &&
> +	    config->peripheral_size == sizeof(*pconfig))

Silently ignoring a size mismatch isn't nice. Could we validate the size
at the beginning of the function and return an error ?

With these issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		chan->video_group = pconfig->video_group;
>  
>  	spin_unlock_irqrestore(&chan->lock, flags);
>  
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index ff2b308d8651..11c409cbc88e 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -24,6 +24,7 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/dma/xilinx_dpdma.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
>  #include <linux/module.h>
> @@ -1058,14 +1059,18 @@ static void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
>  	zynqmp_disp_avbuf_set_format(layer->disp, layer, layer->disp_fmt);
>  
>  	/*
> -	 * Set slave_id for each DMA channel to indicate they're part of a
> +	 * Set pconfig for each DMA channel to indicate they're part of a
>  	 * video group.
>  	 */
>  	for (i = 0; i < info->num_planes; i++) {
>  		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
> +		struct xilinx_dpdma_peripheral_config pconfig = {
> +			.video_group = true,
> +		};
>  		struct dma_slave_config config = {
>  			.direction = DMA_MEM_TO_DEV,
> -			.slave_id = 1,
> +			.peripheral_config = &pconfig,
> +			.peripheral_size = sizeof(pconfig),
>  		};
>  
>  		dmaengine_slave_config(dma->chan, &config);
> diff --git a/include/linux/dma/xilinx_dpdma.h b/include/linux/dma/xilinx_dpdma.h
> new file mode 100644
> index 000000000000..83a1377f03f8
> --- /dev/null
> +++ b/include/linux/dma/xilinx_dpdma.h
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#ifndef __LINUX_DMA_XILINX_DPDMA_H
> +#define __LINUX_DMA_XILINX_DPDMA_H
> +
> +#include <linux/types.h>
> +
> +struct xilinx_dpdma_peripheral_config {
> +	bool video_group;
> +};
> +
> +#endif /* __LINUX_DMA_XILINX_DPDMA_H */

-- 
Regards,

Laurent Pinchart
