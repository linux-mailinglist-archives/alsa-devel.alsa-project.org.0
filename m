Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 656A7456096
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 17:35:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12DAD1868;
	Thu, 18 Nov 2021 17:34:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12DAD1868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637253314;
	bh=DyMiGF8dYpIO7sFrfkTrEHyV1KL7y6BUoG/PpdzWVzI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=haDCoyQMD22b+FNzMV6PsNn0mc3Ir4SJGjb5X871uVJ/cCT5mpnQdwLwTB57C0pVh
	 m+/cNxD6AcId6ulI57UiShbH7PfcsIelRY9uejv9GCiAh27F9KuDJJpxho5naOdXCI
	 FVx2pVd9HWBiC7ZH6huq5RY9K2ctl5oOkN0+ilRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAF93F804EB;
	Thu, 18 Nov 2021 17:33:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48028F8027D; Mon, 15 Nov 2021 10:19:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A30DF800FA
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 10:19:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A30DF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.b="IazgGZ0N"
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9F1E9CA;
 Mon, 15 Nov 2021 10:19:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1636967950;
 bh=DyMiGF8dYpIO7sFrfkTrEHyV1KL7y6BUoG/PpdzWVzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IazgGZ0N2QKgbD2xiliOgSKM/Wh6Ku2e/ttwUbC+gF1dv3N9Q27dBA+K+YHkhhn3f
 128fjkKnCXSOo6RM9eqPTMGb4Rdwc+4oI3NFochnUeHBJsqlLB6JXS7U5djKpnhGrr
 6nHRXJmkdxcDwrNkgsOFzaGTd+Zdnc73MAIEaL64=
Date: Mon, 15 Nov 2021 11:18:47 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 11/11] dmaengine: remove slave_id config field
Message-ID: <YZIl92Akt2QEqad9@pendragon.ideasonboard.com>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-12-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211115085403.360194-12-arnd@kernel.org>
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

On Mon, Nov 15, 2021 at 09:54:03AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> All references to the slave_id field have been removed, so
> remove the field as well to prevent new references from
> creeping in again.

A rationale to explain why the slave_id field shouldn't be used would be
nice.

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/linux/dmaengine.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> index 9000f3ffce8b..0349b35235e6 100644
> --- a/include/linux/dmaengine.h
> +++ b/include/linux/dmaengine.h
> @@ -418,9 +418,6 @@ enum dma_slave_buswidth {
>   * @device_fc: Flow Controller Settings. Only valid for slave channels. Fill
>   * with 'true' if peripheral should be flow controller. Direction will be
>   * selected at Runtime.
> - * @slave_id: Slave requester id. Only valid for slave channels. The dma
> - * slave peripheral will have unique id as dma requester which need to be
> - * pass as slave config.
>   * @peripheral_config: peripheral configuration for programming peripheral
>   * for dmaengine transfer
>   * @peripheral_size: peripheral configuration buffer size
> @@ -448,7 +445,6 @@ struct dma_slave_config {
>  	u32 src_port_window_size;
>  	u32 dst_port_window_size;
>  	bool device_fc;
> -	unsigned int slave_id;
>  	void *peripheral_config;
>  	size_t peripheral_size;
>  };

-- 
Regards,

Laurent Pinchart
