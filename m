Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B822C4ED33C
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 07:27:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4949E1756;
	Thu, 31 Mar 2022 07:26:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4949E1756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648704459;
	bh=OcYuDJA5/eKT1FXz6dlrEwtPxABYoYB/hdBiQS6lC0k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m0IzvY+0hTKk3m9Do1MzuhHl40WjbskcTUUsK80QzRe0DN1KyTbILhYHhX3hBPo6k
	 +kOGPB2YbR9FnHgFatSYNm9/Qis70jVnVL7zmA9ifI+/7hoXFYVJVciW3+Tc3fH8N7
	 MTwk9LRc/00cQ+lOBOPTuTMgBG+KqS/hUbuM8XLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D659F80238;
	Thu, 31 Mar 2022 07:26:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C462F800E4; Thu, 31 Mar 2022 07:26:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CEAAF800E4
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 07:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CEAAF800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PflSaV5/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E04B7CE1F4D;
 Thu, 31 Mar 2022 05:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF682C340EE;
 Thu, 31 Mar 2022 05:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648704374;
 bh=OcYuDJA5/eKT1FXz6dlrEwtPxABYoYB/hdBiQS6lC0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PflSaV5/YPo3OqmWGpA13oCAXVG1GvhlqrWu6Jln3ixAyrKKAhUbkCgei8AUzJ7aq
 NnirU4fBOT4o3TaPsyc/ZmSeKQ1Dj5FpJF7XRAm48KyCPZSPKWJC0YByL5P1z1SAng
 PLCkN74Dw6TjL7sfGPPx5O+BPj1i9rradr3ChK3sEe+I+McVxlm/jUR6atvzolxo0x
 MrSRDoESzWohqVwhW3RnXFSr3HGAWCedqET3e3l9O5/Cme9Pck1WuAh2PUJsUt4qlL
 ZWjsssDc13M+3fj11IbGkK5AN0Xq421B9dNAZWcS/X6Y2uL4BhKETR5hI+Oq7cosJr
 JWsicS3g+wE3w==
Date: Thu, 31 Mar 2022 10:56:09 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 10/19] dma: imx-sdma: Add multi fifo support
Message-ID: <YkU7cYhZUuGyWbob@matsya>
References: <20220328112744.1575631-1-s.hauer@pengutronix.de>
 <20220328112744.1575631-11-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328112744.1575631-11-s.hauer@pengutronix.de>
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, dmaengine@vger.kernel.org,
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

On 28-03-22, 13:27, Sascha Hauer wrote:
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>

it is dmaengine: xxx

Also is this patch dependent on rest of the series, if not consider
sending separately

> diff --git a/include/linux/platform_data/dma-imx.h b/include/linux/platform_data/dma-imx.h
> index 281adbb26e6bd..4a43a048e1b4d 100644
> --- a/include/linux/platform_data/dma-imx.h
> +++ b/include/linux/platform_data/dma-imx.h
> @@ -39,6 +39,7 @@ enum sdma_peripheral_type {
>  	IMX_DMATYPE_SSI_DUAL,	/* SSI Dual FIFO */
>  	IMX_DMATYPE_ASRC_SP,	/* Shared ASRC */
>  	IMX_DMATYPE_SAI,	/* SAI */
> +	IMX_DMATYPE_MULTI_SAI,	/* MULTI FIFOs For Audio */
>  };
>  
>  enum imx_dma_prio {
> @@ -65,4 +66,10 @@ static inline int imx_dma_is_general_purpose(struct dma_chan *chan)
>  		!strcmp(chan->device->dev->driver->name, "imx-dma");
>  }
>  
> +struct sdma_peripheral_config {
> +	int n_fifos_src;
> +	int n_fifos_dst;
> +	bool sw_done;
> +};

Not more platform data :(

Can you explain this structure and why this is required? What do these
fields refer to..?

-- 
~Vinod
