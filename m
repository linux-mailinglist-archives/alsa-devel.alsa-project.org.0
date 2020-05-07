Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE55D1C82C2
	for <lists+alsa-devel@lfdr.de>; Thu,  7 May 2020 08:45:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 714C517DD;
	Thu,  7 May 2020 08:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 714C517DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588833935;
	bh=NOXms9CQEfEVy6MStNtchEuZfaRAg1+p1WPzhT8trBU=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LWb/5xsyZ18VM20c/CcYeOHnn9unQLmujJ1/NHSvMjJSfB/8IIElsGC6jBCYFA1Pf
	 VfoEzaN9YSeoicPHUjkehzjFsNRy0TFelEjYTZB65X5Ovv2M82sWZTdXJPyP6ISZ4i
	 V60CPGD7L1+VeZiODnixcF/NZQpq0b+AE4cODc8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F260F800AD;
	Thu,  7 May 2020 08:43:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADB51F8015F; Thu,  7 May 2020 08:43:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0131.hostedemail.com
 [216.40.44.131])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8EF9F800AD
 for <alsa-devel@alsa-project.org>; Thu,  7 May 2020 08:43:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8EF9F800AD
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay03.hostedemail.com (Postfix) with ESMTP id AA3E7801A056;
 Thu,  7 May 2020 06:43:42 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: humor62_7784db8d54d20
X-Filterd-Recvd-Size: 3778
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf06.hostedemail.com (Postfix) with ESMTPA;
 Thu,  7 May 2020 06:43:41 +0000 (UTC)
Message-ID: <158979eb8e6e80c9b535acfdb4821bc9547c7c50.camel@perches.com>
Subject: Re: [PATCH -next] ASoC: amd: acp3x-pcm-dma: Use bitwise instead of
 arithmetic operator for flags
From: Joe Perches <joe@perches.com>
To: Samuel Zou <zou_wei@huawei.com>, lgirdwood@gmail.com,
 broonie@kernel.org,  perex@perex.cz, tiwai@suse.com, Julia Lawall
 <julia.lawall@lip6.fr>
Date: Wed, 06 May 2020 23:43:40 -0700
In-Reply-To: <1588833562-14417-1-git-send-email-zou_wei@huawei.com>
References: <1588833562-14417-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Thu, 2020-05-07 at 14:39 +0800, Samuel Zou wrote:
> Fix the following coccinelle warnings:

> sound/soc/amd/raven/acp3x-pcm-dma.c:161:39-40: WARNING: sum of probable bitmasks, consider |
> sound/soc/amd/raven/acp3x-pcm-dma.c:172:39-40: WARNING: sum of probable bitmasks, consider |
> sound/soc/amd/raven/acp3x-pcm-dma.c:183:39-40: WARNING: sum of probable bitmasks, consider |
> sound/soc/amd/raven/acp3x-pcm-dma.c:194:39-40: WARNING: sum of probable bitmasks, consider |

These are not bitmasks.

Samuel, please look deeper at the code before submitting
bad patches.

And hey Julia.

This is the second false positive submitted for this
warning today.

Can you please remove the script or fix it so it
uses better logic?k

Thanks.


> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Samuel Zou <zou_wei@huawei.com>
> ---
>  sound/soc/amd/raven/acp3x-pcm-dma.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
> index e362f0b..b0cc0fe 100644
> --- a/sound/soc/amd/raven/acp3x-pcm-dma.c
> +++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
> @@ -158,7 +158,7 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
>  		switch (rtd->i2s_instance) {
>  		case I2S_BT_INSTANCE:
>  			reg_dma_size = mmACP_BT_TX_DMA_SIZE;
> -			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET |
>  						BT_PB_FIFO_ADDR_OFFSET;
>  			reg_fifo_addr = mmACP_BT_TX_FIFOADDR;
>  			reg_fifo_size = mmACP_BT_TX_FIFOSIZE;
> @@ -169,7 +169,7 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
>  		case I2S_SP_INSTANCE:
>  		default:
>  			reg_dma_size = mmACP_I2S_TX_DMA_SIZE;
> -			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET |
>  						SP_PB_FIFO_ADDR_OFFSET;
>  			reg_fifo_addr =	mmACP_I2S_TX_FIFOADDR;
>  			reg_fifo_size = mmACP_I2S_TX_FIFOSIZE;
> @@ -180,7 +180,7 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
>  		switch (rtd->i2s_instance) {
>  		case I2S_BT_INSTANCE:
>  			reg_dma_size = mmACP_BT_RX_DMA_SIZE;
> -			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET |
>  						BT_CAPT_FIFO_ADDR_OFFSET;
>  			reg_fifo_addr = mmACP_BT_RX_FIFOADDR;
>  			reg_fifo_size = mmACP_BT_RX_FIFOSIZE;
> @@ -191,7 +191,7 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
>  		case I2S_SP_INSTANCE:
>  		default:
>  			reg_dma_size = mmACP_I2S_RX_DMA_SIZE;
> -			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET |
>  						SP_CAPT_FIFO_ADDR_OFFSET;
>  			reg_fifo_addr = mmACP_I2S_RX_FIFOADDR;
>  			reg_fifo_size = mmACP_I2S_RX_FIFOSIZE;

