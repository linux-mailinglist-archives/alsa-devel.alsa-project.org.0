Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 602A94DD5C8
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Mar 2022 09:05:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2BF4188B;
	Fri, 18 Mar 2022 09:05:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2BF4188B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647590756;
	bh=vU53DFdwJO+HNJlKgdxijfFcQUb2id8JfLxiHmyv0T8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gmti46yO2mjy7jzfG8+/rGzY3AZxzojApkicuTYQuSOBLylE64JOS4+42tLVPJnC9
	 ZFTtwvkalNNTYW06JK+mGcp2Q67rWK23UfU9CzrkmIhREQxzj55ciA3vsPQzXmyJtg
	 YQxlHD6ArusR8Xq0z0WfL6cvuLFA8sRdavHIob7g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49DCDF8026D;
	Fri, 18 Mar 2022 09:04:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50FBDF8026A; Fri, 18 Mar 2022 09:04:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28E74F80121
 for <alsa-devel@alsa-project.org>; Fri, 18 Mar 2022 09:04:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28E74F80121
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nV7bC-0007eu-LD; Fri, 18 Mar 2022 09:04:38 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nV7bA-0002SO-6j; Fri, 18 Mar 2022 09:04:36 +0100
Date: Fri, 18 Mar 2022 09:04:36 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH 10/19] dma: imx-sdma: Add multi fifo support
Message-ID: <20220318080436.GA12181@pengutronix.de>
References: <20220317082818.503143-1-s.hauer@pengutronix.de>
 <20220317082818.503143-11-s.hauer@pengutronix.de>
 <CAA+D8AM5bm3Hncrf0=xdPNpC_rz_yMbokN6J-8z4tHi7-==jgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AM5bm3Hncrf0=xdPNpC_rz_yMbokN6J-8z4tHi7-==jgA@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:02:13 up 97 days, 16:47, 72 users,  load average: 0.55, 0.29, 0.16
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Sascha Hauer <kernel@pengutronix.de>, dmaengine@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>
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

On Fri, Mar 18, 2022 at 01:42:51PM +0800, Shengjiu Wang wrote:
>    Hi
>    On Thu, Mar 17, 2022 at 4:28 PM Sascha Hauer <[1]s.hauer@pengutronix.de>
>    wrote:
> 
>      Signed-off-by: Sascha Hauer <[2]s.hauer@pengutronix.de>
>      ---
>       drivers/dma/imx-sdma.c                | 54 +++++++++++++++++++++++++++
>       include/linux/platform_data/dma-imx.h |  7 ++++
>       2 files changed, 61 insertions(+)
> 
>      diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
>      index 1038f6bc7f846..21e1cec2ffde9 100644
>      --- a/drivers/dma/imx-sdma.c
>      +++ b/drivers/dma/imx-sdma.c
>      @@ -14,6 +14,7 @@
>       #include <linux/iopoll.h>
>       #include <linux/module.h>
>       #include <linux/types.h>
>      +#include <linux/bitfield.h>
>       #include <linux/bitops.h>
>       #include <linux/mm.h>
>       #include <linux/interrupt.h>
>      @@ -73,6 +74,7 @@
>       #define SDMA_CHNENBL0_IMX35    0x200
>       #define SDMA_CHNENBL0_IMX31    0x080
>       #define SDMA_CHNPRI_0          0x100
>      +#define SDMA_DONE0_CONFIG      0x1000
> 
>       /*
>        * Buffer descriptor status values.
>      @@ -180,6 +182,12 @@
>                                       BIT(DMA_MEM_TO_DEV) | \
>                                       BIT(DMA_DEV_TO_DEV))
> 
>      +#define SDMA_WATERMARK_LEVEL_N_FIFOS   GENMASK(15, 12)
>      +#define SDMA_WATERMARK_LEVEL_SW_DONE   BIT(23)
>      +
>      +#define SDMA_DONE0_CONFIG_DONE_SEL     BIT(7)
>      +#define SDMA_DONE0_CONFIG_DONE_DIS     BIT(6)
>      +
>       /**
>        * struct sdma_script_start_addrs - SDMA script start pointers
>        *
>      @@ -441,6 +449,11 @@ struct sdma_channel {
>              struct work_struct              terminate_worker;
>              struct list_head                terminated;
>              bool                            is_ram_script;
>      +       unsigned int                    n_fifos;
>      +       unsigned int                    n_fifos_src;
>      +       unsigned int                    n_fifos_dst;
>      +       bool                            sw_done;
>      +       u32                             sw_done_sel;
> 
>    "sw_done_sel" is not used, and may not be needed.

Ok, will drop.

>    And can we just add 'struct sdma_peripheral_config *pconfig'
>    to replace each item here ('n_fifos_src', 'n_fifos_dst',
>    'sw_done')? 

I rather do not access the pointer to the peripheral_config outside of
sdma_config because I know nothing about the lifetime of that structure.

>    the pconfig can point to the struct in dma_slave_config.
>    And 'n_fifos' can be moved to locally function in 
>    sdma_set_watermarklevel_for_sais(), then use sdmac->direction
>    to select 'n_fifos_dst' or 'n_fifos_src'.

Ok.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
