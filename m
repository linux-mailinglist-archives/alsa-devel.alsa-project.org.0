Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE3F4F7776
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Apr 2022 09:28:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 446C01700;
	Thu,  7 Apr 2022 09:27:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 446C01700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649316502;
	bh=gRiR27/d/nNyfqeM9QCvSJAPTXBqZkPYDAmvL0SkbA4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QIZQ+PJn4gpyOh3jGbVAg5SynkAabkRiqTA6DMsyEdGqOIE3MdK8scVxB1Vh9mpqQ
	 lO1aAmS1PwivipNNycCaV7SP0ktcqtrqvd79d4Kdp7K8S/Q1z4B4hFXosTz+XP0NmI
	 5QQfsFRNaJdax+3NRxmSfw5nexYE5D44H2+fCTX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A746DF8026A;
	Thu,  7 Apr 2022 09:27:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0E36F80085; Thu,  7 Apr 2022 09:27:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B406F80085
 for <alsa-devel@alsa-project.org>; Thu,  7 Apr 2022 09:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B406F80085
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncMXy-0006Uw-Dz; Thu, 07 Apr 2022 09:27:14 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncMXy-0005MC-1B; Thu, 07 Apr 2022 09:27:14 +0200
Date: Thu, 7 Apr 2022 09:27:14 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Joy Zou <joy.zou@nxp.com>
Subject: Re: [EXT] [PATCH v3 11/20] dmaengine: imx-sdma: Add multi fifo support
Message-ID: <20220407072713.GA4012@pengutronix.de>
References: <20220405075959.2744803-1-s.hauer@pengutronix.de>
 <20220405075959.2744803-12-s.hauer@pengutronix.de>
 <AM9PR04MB88751CC82962422123A32193E1E69@AM9PR04MB8875.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AM9PR04MB88751CC82962422123A32193E1E69@AM9PR04MB8875.eurprd04.prod.outlook.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:21:53 up 7 days, 19:51, 63 users, load average: 0.14, 0.11, 0.20
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
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

On Thu, Apr 07, 2022 at 02:23:22AM +0000, Joy Zou wrote:
> Hi Sascha,
> 
> -----Original Message-----
> From: Sascha Hauer <s.hauer@pengutronix.de> 
> Sent: 2022年4月5日 16:00
> To: alsa-devel@alsa-project.org
> Cc: Xiubo Li <Xiubo.Lee@gmail.com>; Fabio Estevam <festevam@gmail.com>; Shengjiu Wang <shengjiu.wang@gmail.com>; kernel@pengutronix.de; Vinod Koul <vkoul@kernel.org>; dl-linux-imx <linux-imx@nxp.com>; dmaengine@vger.kernel.org; Sascha Hauer <s.hauer@pengutronix.de>
> Subject: [EXT] [PATCH v3 11/20] dmaengine: imx-sdma: Add multi fifo support
> 
> Caution: EXT Email
> 
> The i.MX SDMA engine can read from / write to multiple successive hardware FIFO registers, referred to as "Multi FIFO support". This is needed for the micfil driver and certain configurations of the SAI driver. This patch adds support for this feature.
> 
> The number of FIFOs to read from / write to must be communicated from the client driver to the SDMA engine. For this the struct dma_slave_config::peripheral_config field is used.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
> 
> Notes:
>     Changes since v2:
>     - Use prefix dmaengine:
>     - document struct sdma_peripheral_config
>     - add forgotten commit message
> 
>     Changes since v1:
>     - Drop unused variable sw_done_sel
>     - Evaluate sdmac->direction directly instead of storing value in n_fifos
> 
>  drivers/dma/imx-sdma.c      | 57 +++++++++++++++++++++++++++++++++++++
>  include/linux/dma/imx-dma.h | 20 +++++++++++++
>  2 files changed, 77 insertions(+)
> 
> diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c index 0e70843567cef..95367a8a81a51 100644
> --- a/drivers/dma/imx-sdma.c
> +++ b/drivers/dma/imx-sdma.c
> @@ -14,6 +14,7 @@
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/types.h>
> +#include <linux/bitfield.h>
>  #include <linux/bitops.h>
>  #include <linux/mm.h>
>  #include <linux/interrupt.h>
> @@ -73,6 +74,7 @@
>  #define SDMA_CHNENBL0_IMX35    0x200
>  #define SDMA_CHNENBL0_IMX31    0x080
>  #define SDMA_CHNPRI_0          0x100
> +#define SDMA_DONE0_CONFIG      0x1000
> 
>  /*
>   * Buffer descriptor status values.
> @@ -180,6 +182,12 @@
>                                  BIT(DMA_MEM_TO_DEV) | \
>                                  BIT(DMA_DEV_TO_DEV))
> 
> +#define SDMA_WATERMARK_LEVEL_N_FIFOS   GENMASK(15, 12)
> +#define SDMA_WATERMARK_LEVEL_SW_DONE   BIT(23)
> +
> +#define SDMA_DONE0_CONFIG_DONE_SEL     BIT(7)
> +#define SDMA_DONE0_CONFIG_DONE_DIS     BIT(6)
> +
>  /**
>   * struct sdma_script_start_addrs - SDMA script start pointers
>   *
> @@ -441,6 +449,9 @@ struct sdma_channel {
>         struct work_struct              terminate_worker;
>         struct list_head                terminated;
>         bool                            is_ram_script;
> +       unsigned int                    n_fifos_src;
> +       unsigned int                    n_fifos_dst;
> +       bool                            sw_done;
>  };
> The struct sdma_peripheral_config can instead the three variable.
>  #define IMX_DMA_SG_LOOP                BIT(0)
> @@ -778,6 +789,14 @@ static void sdma_event_enable(struct sdma_channel *sdmac, unsigned int event)
>         val = readl_relaxed(sdma->regs + chnenbl);
>         __set_bit(channel, &val);
>         writel_relaxed(val, sdma->regs + chnenbl);
> +
> +       /* Set SDMA_DONEx_CONFIG is sw_done enabled */
> +       if (sdmac->sw_done) {
> +               val = readl_relaxed(sdma->regs + SDMA_DONE0_CONFIG);
> +               val |= SDMA_DONE0_CONFIG_DONE_SEL;
> +               val &= ~SDMA_DONE0_CONFIG_DONE_DIS;
> +               writel_relaxed(val, sdma->regs + SDMA_DONE0_CONFIG);
> +       }
>  }
> 
>  static void sdma_event_disable(struct sdma_channel *sdmac, unsigned int event) @@ -1038,6 +1057,10 @@ static int sdma_get_pc(struct sdma_channel *sdmac,
>         case IMX_DMATYPE_IPU_MEMORY:
>                 emi_2_per = sdma->script_addrs->ext_mem_2_ipu_addr;
>                 break;
> +       case IMX_DMATYPE_MULTI_SAI:
> +               per_2_emi = sdma->script_addrs->sai_2_mcu_addr;
> +               emi_2_per = sdma->script_addrs->mcu_2_sai_addr;
> +               break;
>         default:
>                 dev_err(sdma->dev, "Unsupported transfer type %d\n",
>                         peripheral_type); @@ -1214,6 +1237,22 @@ static void sdma_set_watermarklevel_for_p2p(struct sdma_channel *sdmac)
>         sdmac->watermark_level |= SDMA_WATERMARK_LEVEL_CONT;  }
> 
> +static void sdma_set_watermarklevel_for_sais(struct sdma_channel 
> +*sdmac) {
> +       unsigned int n_fifos;
> +
> +       if (sdmac->sw_done)
> +               sdmac->watermark_level |= SDMA_WATERMARK_LEVEL_SW_DONE;
> +
> +       if (sdmac->direction == DMA_DEV_TO_MEM)
> +               n_fifos = sdmac->n_fifos_src;
> +       else
> +               n_fifos = sdmac->n_fifos_dst;
> +
> +       sdmac->watermark_level |=
> +                       FIELD_PREP(SDMA_WATERMARK_LEVEL_N_FIFOS, 
> +n_fifos); }
> +
>  static int sdma_config_channel(struct dma_chan *chan)  {
>         struct sdma_channel *sdmac = to_sdma_chan(chan); @@ -1250,6 +1289,10 @@ static int sdma_config_channel(struct dma_chan *chan)
>                             sdmac->peripheral_type == IMX_DMATYPE_ASRC)
>                                 sdma_set_watermarklevel_for_p2p(sdmac);
>                 } else {
> +                       if (sdmac->peripheral_type ==
> +                                       IMX_DMATYPE_MULTI_SAI)
> +                               sdma_set_watermarklevel_for_sais(sdmac);
> +
>                         __set_bit(sdmac->event_id0, sdmac->event_mask);
>                 }
> 
> @@ -1707,9 +1750,23 @@ static int sdma_config(struct dma_chan *chan,
>                        struct dma_slave_config *dmaengine_cfg)  {
>         struct sdma_channel *sdmac = to_sdma_chan(chan);
> +       struct sdma_engine *sdma = sdmac->sdma;
> 
>         memcpy(&sdmac->slave_config, dmaengine_cfg, sizeof(*dmaengine_cfg));
> 
> +       if (dmaengine_cfg->peripheral_config) {
> +               struct sdma_peripheral_config *sdmacfg = dmaengine_cfg->peripheral_config;
> +               if (dmaengine_cfg->peripheral_size != sizeof(struct sdma_peripheral_config)) {
> +                       dev_err(sdma->dev, "Invalid peripheral size %zu, expected %zu\n",
> +                               dmaengine_cfg->peripheral_size,
> +                               sizeof(struct sdma_peripheral_config));
> +                       return -EINVAL;
> +               }
> +               sdmac->n_fifos_src = sdmacfg->n_fifos_src;
> +               sdmac->n_fifos_dst = sdmacfg->n_fifos_dst;
> +               sdmac->sw_done = sdmacfg->sw_done;
> +       }
> +
>         /* Set ENBLn earlier to make sure dma request triggered after that */
>         if (sdmac->event_id0 >= sdmac->sdma->drvdata->num_events)
>                 return -EINVAL;
> diff --git a/include/linux/dma/imx-dma.h b/include/linux/dma/imx-dma.h index b06cba85a6d46..8887762360d40 100644
> --- a/include/linux/dma/imx-dma.h
> +++ b/include/linux/dma/imx-dma.h
> @@ -39,6 +39,7 @@ enum sdma_peripheral_type {
>         IMX_DMATYPE_SSI_DUAL,   /* SSI Dual FIFO */
>         IMX_DMATYPE_ASRC_SP,    /* Shared ASRC */
>         IMX_DMATYPE_SAI,        /* SAI */
> +       IMX_DMATYPE_MULTI_SAI,  /* MULTI FIFOs For Audio */
>  };
> 
>  enum imx_dma_prio {
> @@ -65,4 +66,23 @@ static inline int imx_dma_is_general_purpose(struct dma_chan *chan)
>                 !strcmp(chan->device->dev->driver->name, "imx-dma");  }
> 
> +/**
> + * struct sdma_peripheral_config - SDMA config for audio
> + * @n_fifos_src: Number of FIFOs for recording
> + * @n_fifos_dst: Number of FIFOs for playback
> + * @sw_done: Use software done. Needed for PDM (micfil)
> + *
> + * Some i.MX Audio devices (SAI, micfil) have multiple successive FIFO
> + * registers. For multichannel recording/playback the SAI/micfil have
> + * one FIFO register per channel and the SDMA engine has to read/write
> + * the next channel from/to the next register and wrap around to the
> + * first register when all channels are handled. The number of active
> + * channels must be communicated to the SDMA engine using this struct.
> + */
> +struct sdma_peripheral_config {
> +       int n_fifos_src;
> +       int n_fifos_dst;
> +       bool sw_done;
> +};
> +
> The fifos may not be continuous.
> Follow the Wang shengjiu suggestion:
> "This is our internal definition for this sdma_peripheral_config.
> Could you please adopt this?"

The src_fifo_off and dst_fifo_off fields are only used in the fsl_sai
driver in the downstream kernel. It seems there are several pieces
missing in the upstream driver to support the usecases in which these
fields are needed. I really prefer that these fields are added as part
of a series that adds these pieces to the fsl_sai driver, because then
we have everything together to understand why and how they are used.

Sascha


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
