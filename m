Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CD2456091
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 17:34:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44EAC182F;
	Thu, 18 Nov 2021 17:33:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44EAC182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637253266;
	bh=bs5FwrGJKmZiUyJUhZtsFFkCbThCR2+MNX7sYGLdInI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rR2W3zZL3YvhIWOQ9udEU+B63Xeg+vwZMWvXkAernCimARCeaqm3/VPVyZbgmNuzp
	 v6+zuko9dIahXfAfQbPTO8dQbwOhcBWa+1bt1gPrKMYYIaC6Zk/vbcMlvu8Wk9nEZB
	 N2kG2VyII08daHzmmhZmVPrf+0K06TbxhqYO7cD0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ACCDF8026D;
	Thu, 18 Nov 2021 17:33:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9279CF8027D; Mon, 15 Nov 2021 10:10:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 338A8F800FA
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 10:10:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 338A8F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.b="dnjNnE+B"
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2837F9CA;
 Mon, 15 Nov 2021 10:10:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1636967417;
 bh=bs5FwrGJKmZiUyJUhZtsFFkCbThCR2+MNX7sYGLdInI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dnjNnE+BxQubVBzyvt35tp9eSPunAc+NOuowzVjMVfnO6jqLw3nMEngEl53CjbMh0
 UYxBQSy9hDC4AXM+j7bivGr1bDYL75caLR3Kpvgip4jQNeMxX1tvkF1//Xh3honHLn
 XZyCAuT51XsudJZ+zXrp60OeLJ0gprUub8NgbGw0=
Date: Mon, 15 Nov 2021 11:09:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 04/11] dmaengine: shdma: remove legacy slave_id parsing
Message-ID: <YZIj4iKUsj/QQ+BH@pendragon.ideasonboard.com>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-5-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211115085403.360194-5-arnd@kernel.org>
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

On Mon, Nov 15, 2021 at 09:53:56AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The slave device is picked through either devicetree or a filter
> function, and any remaining out-of-tree drivers would have warned
> about this usage since 2015.
> 
> Stop interpreting the field finally so it can be removed from
> the interface.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/dma/sh/shdma-base.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/dma/sh/shdma-base.c b/drivers/dma/sh/shdma-base.c
> index 7f72b3f4cd1a..41c6bc650fa3 100644
> --- a/drivers/dma/sh/shdma-base.c
> +++ b/drivers/dma/sh/shdma-base.c
> @@ -786,14 +786,6 @@ static int shdma_config(struct dma_chan *chan,
>  	if (!config)
>  		return -EINVAL;
>  
> -	/*
> -	 * overriding the slave_id through dma_slave_config is deprecated,
> -	 * but possibly some out-of-tree drivers still do it.
> -	 */
> -	if (WARN_ON_ONCE(config->slave_id &&
> -			 config->slave_id != schan->real_slave_id))
> -		schan->real_slave_id = config->slave_id;
> -
>  	/*
>  	 * We could lock this, but you shouldn't be configuring the
>  	 * channel, while using it...

-- 
Regards,

Laurent Pinchart
