Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 049F5F356C
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Nov 2019 18:08:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 745971690;
	Thu,  7 Nov 2019 18:07:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 745971690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573146483;
	bh=GNiAR+XyF3Akg0gHE1XFYlzSSBSobnCuMyWz/1uUznc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pe2If0mmFPwnzRljAglPRmSvDkTt9ZjD0I9FALe6ickxu7072p/EAKwKVDJMUq4WJ
	 0zsBDWIySQXWDKky12zP0UN6SSK7F9DgdeusTT3NyxUYhApD0BcxoapvTQ03rrSkHL
	 mK45USc95Xk12Mky8qx9vT61Ckda0CdGEaLj8t9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06200F805AE;
	Thu,  7 Nov 2019 18:05:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1A57F800F3; Thu,  7 Nov 2019 18:05:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81871F800F3
 for <alsa-devel@alsa-project.org>; Thu,  7 Nov 2019 18:05:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81871F800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Nov 2019 09:05:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,278,1569308400"; d="scan'208";a="192880772"
Received: from cjense2x-mobl1.amr.corp.intel.com (HELO [10.251.130.63])
 ([10.251.130.63])
 by orsmga007.jf.intel.com with ESMTP; 07 Nov 2019 09:05:24 -0800
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
References: <1573133093-28208-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1573133093-28208-4-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <73a0569b-7885-3461-4aff-e38e85a06ebf@linux.intel.com>
Date: Thu, 7 Nov 2019 09:22:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1573133093-28208-4-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Content-Language: en-US
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, YueHaibing <yuehaibing@huawei.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, djkurtz@google.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Akshu.Agrawal@amd.com
Subject: Re: [alsa-devel] [PATCH v3 3/6] ASoC: amd: Enabling I2S instance in
 DMA and DAI
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


>   	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -		val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
> -		val = val | (rtd->xfer_resolution  << 3);
> -		rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
> +		switch (rtd->i2s_instance) {
> +		case I2S_BT_INSTANCE:
> +			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
> +			val = val | (rtd->xfer_resolution  << 3);
> +			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
> +			break;
> +		case I2S_SP_INSTANCE:
> +		default:
> +			val = rv_readl(rtd->acp3x_base + mmACP_I2STDM_ITER);
> +			val = val | (rtd->xfer_resolution  << 3);
> +			rv_writel(val, rtd->acp3x_base + mmACP_I2STDM_ITER);
> +		}
>   	} else {
> -		val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_IRER);
> -		val = val | (rtd->xfer_resolution  << 3);
> -		rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
> +		switch (rtd->i2s_instance) {
> +		case I2S_BT_INSTANCE:
> +			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_IRER);
> +			val = val | (rtd->xfer_resolution  << 3);
> +			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
> +			break;
> +		case I2S_SP_INSTANCE:
> +		default:
> +			val = rv_readl(rtd->acp3x_base + mmACP_I2STDM_IRER);
> +			val = val | (rtd->xfer_resolution  << 3);
> +			rv_writel(val, rtd->acp3x_base + mmACP_I2STDM_IRER);
> +		}

You could reduce the code by setting the address in the switch case, 
then perform the read/modify/write outisde of the switch.

> @@ -131,33 +168,104 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
>   		rtd->bytescount = acp_get_byte_count(rtd,
>   						substream->stream);
>   		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -			rv_writel(period_bytes, rtd->acp3x_base +
> +			switch (rtd->i2s_instance) {
> +			case I2S_BT_INSTANCE:
> +				rv_writel(period_bytes, rtd->acp3x_base +
>   					mmACP_BT_TX_INTR_WATERMARK_SIZE);
> -			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
> -			val = val | BIT(0);
> -			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
> +				val = rv_readl(rtd->acp3x_base +
> +						mmACP_BTTDM_ITER);
> +				val = val | BIT(0);
> +				rv_writel(val, rtd->acp3x_base +
> +						mmACP_BTTDM_ITER);
> +				rv_writel(1, rtd->acp3x_base +
> +						mmACP_BTTDM_IER);
> +				break;
> +			case I2S_SP_INSTANCE:
> +			default:
> +				rv_writel(period_bytes, rtd->acp3x_base +
> +					mmACP_I2S_TX_INTR_WATERMARK_SIZE);
> +				val = rv_readl(rtd->acp3x_base +
> +						mmACP_I2STDM_ITER);
> +				val = val | BIT(0);
> +				rv_writel(val, rtd->acp3x_base +
> +						mmACP_I2STDM_ITER);
> +				rv_writel(1, rtd->acp3x_base +
> +						mmACP_I2STDM_IER);
> +			}
>   		} else {
> -			rv_writel(period_bytes, rtd->acp3x_base +
> +			switch (rtd->i2s_instance) {
> +			case I2S_BT_INSTANCE:
> +				rv_writel(period_bytes, rtd->acp3x_base +
>   					mmACP_BT_RX_INTR_WATERMARK_SIZE);
> -			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_IRER);
> -			val = val | BIT(0);
> -			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
> +				val = rv_readl(rtd->acp3x_base +
> +						mmACP_BTTDM_IRER);
> +				val = val | BIT(0);
> +				rv_writel(val, rtd->acp3x_base +
> +						mmACP_BTTDM_IRER);
> +				rv_writel(1, rtd->acp3x_base +
> +						mmACP_BTTDM_IER);
> +				break;
> +			case I2S_SP_INSTANCE:
> +			default:
> +				rv_writel(period_bytes, rtd->acp3x_base +
> +					mmACP_I2S_RX_INTR_WATERMARK_SIZE);
> +				val = rv_readl(rtd->acp3x_base +
> +						mmACP_I2STDM_IRER);
> +				val = val | BIT(0);
> +				rv_writel(val, rtd->acp3x_base +
> +						 mmACP_I2STDM_IRER);
> +				rv_writel(1, rtd->acp3x_base +
> +						mmACP_I2STDM_IER);
> +			}

same here, you could set 3 addresses in the switch cases, and perform 
the operations outside of the switch.

>   		}
> -		rv_writel(1, rtd->acp3x_base + mmACP_BTTDM_IER);
>   		break;
>   	case SNDRV_PCM_TRIGGER_STOP:
>   	case SNDRV_PCM_TRIGGER_SUSPEND:
>   	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
>   		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_ITER);
> -			val = val & ~BIT(0);
> -			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_ITER);
> +			switch (rtd->i2s_instance) {
> +			case I2S_BT_INSTANCE:
> +				val = rv_readl(rtd->acp3x_base +
> +							mmACP_BTTDM_ITER);
> +				val = val & ~BIT(0);
> +				rv_writel(val, rtd->acp3x_base +
> +							mmACP_BTTDM_ITER);
> +				rv_writel(0, rtd->acp3x_base +
> +							mmACP_BTTDM_IER);
> +				break;
> +			case I2S_SP_INSTANCE:
> +			default:
> +				val = rv_readl(rtd->acp3x_base +
> +							mmACP_I2STDM_ITER);
> +				val = val & ~BIT(0);
> +				rv_writel(val, rtd->acp3x_base +
> +							mmACP_I2STDM_ITER);
> +				rv_writel(0, rtd->acp3x_base +
> +							mmACP_I2STDM_IER);
> +			}
> +
>   		} else {
> -			val = rv_readl(rtd->acp3x_base + mmACP_BTTDM_IRER);
> -			val = val & ~BIT(0);
> -			rv_writel(val, rtd->acp3x_base + mmACP_BTTDM_IRER);
> +			switch (rtd->i2s_instance) {
> +			case I2S_BT_INSTANCE:
> +				val = rv_readl(rtd->acp3x_base +
> +							mmACP_BTTDM_IRER);
> +				val = val & ~BIT(0);
> +				rv_writel(val, rtd->acp3x_base +
> +							mmACP_BTTDM_IRER);
> +				rv_writel(0, rtd->acp3x_base +
> +							mmACP_BTTDM_IER);
> +				break;
> +			case I2S_SP_INSTANCE:
> +			default:
> +				val = rv_readl(rtd->acp3x_base +
> +							mmACP_I2STDM_IRER);
> +				val = val & ~BIT(0);
> +				rv_writel(val, rtd->acp3x_base +
> +							mmACP_I2STDM_IRER);
> +				rv_writel(0, rtd->acp3x_base +
> +							mmACP_I2STDM_IER);
> +			}

and here too...

>   	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
> -		/* Config ringbuffer */
> -		rv_writel(MEM_WINDOW_START, rtd->acp3x_base +
> -			  mmACP_BT_TX_RINGBUFADDR);
> -		rv_writel(MAX_BUFFER, rtd->acp3x_base +
> -			  mmACP_BT_TX_RINGBUFSIZE);
> -		rv_writel(DMA_SIZE, rtd->acp3x_base + mmACP_BT_TX_DMA_SIZE);
> -
> -		/* Config audio fifo */
> -		acp_fifo_addr = ACP_SRAM_PTE_OFFSET + (rtd->num_pages * 8)
> -				+ PLAYBACK_FIFO_ADDR_OFFSET;
> -		rv_writel(acp_fifo_addr, rtd->acp3x_base +
> -			  mmACP_BT_TX_FIFOADDR);
> -		rv_writel(FIFO_SIZE, rtd->acp3x_base + mmACP_BT_TX_FIFOSIZE);
> +		switch (rtd->i2s_instance) {
> +		case I2S_BT_INSTANCE:
> +				/* Config ringbuffer */
> +			rv_writel(I2S_BT_TX_MEM_WINDOW_START,
> +				rtd->acp3x_base + mmACP_BT_TX_RINGBUFADDR);
> +			rv_writel(MAX_BUFFER, rtd->acp3x_base +
> +					mmACP_BT_TX_RINGBUFSIZE);
> +			rv_writel(DMA_SIZE,
> +				rtd->acp3x_base + mmACP_BT_TX_DMA_SIZE);
> +
> +			/* Config audio fifo */
> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
> +						BT_PB_FIFO_ADDR_OFFSET;
> +			rv_writel(acp_fifo_addr,
> +				rtd->acp3x_base +  mmACP_BT_TX_FIFOADDR);
> +			rv_writel(FIFO_SIZE,
> +				rtd->acp3x_base + mmACP_BT_TX_FIFOSIZE);
> +			/* Enable  watermark/period interrupt to host */
> +			rv_writel(BIT(BT_TX_THRESHOLD),
> +				rtd->acp3x_base + mmACP_EXTERNAL_INTR_CNTL);
> +			break;
> +
> +		case I2S_SP_INSTANCE:
> +		default:
> +			/* Config ringbuffer */
> +			rv_writel(I2S_SP_TX_MEM_WINDOW_START,
> +				rtd->acp3x_base + mmACP_I2S_TX_RINGBUFADDR);
> +			rv_writel(MAX_BUFFER,
> +				rtd->acp3x_base + mmACP_I2S_TX_RINGBUFSIZE);
> +			rv_writel(DMA_SIZE,
> +				rtd->acp3x_base + mmACP_I2S_TX_DMA_SIZE);
> +
> +			/* Config audio fifo */
> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
> +						SP_PB_FIFO_ADDR_OFFSET;
> +			rv_writel(acp_fifo_addr,
> +				rtd->acp3x_base + mmACP_I2S_TX_FIFOADDR);
> +			rv_writel(FIFO_SIZE,
> +				rtd->acp3x_base + mmACP_I2S_TX_FIFOSIZE);
> +			/* Enable  watermark/period interrupt to host */
> +			rv_writel(BIT(I2S_TX_THRESHOLD),
> +				rtd->acp3x_base + mmACP_EXTERNAL_INTR_CNTL);
> +		}
>   	} else {
> -		/* Config ringbuffer */
> -		rv_writel(MEM_WINDOW_START + MAX_BUFFER, rtd->acp3x_base +
> -			  mmACP_BT_RX_RINGBUFADDR);
> -		rv_writel(MAX_BUFFER, rtd->acp3x_base +
> -			  mmACP_BT_RX_RINGBUFSIZE);
> -		rv_writel(DMA_SIZE, rtd->acp3x_base + mmACP_BT_RX_DMA_SIZE);
> -
> -		/* Config audio fifo */
> -		acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
> -				(rtd->num_pages * 8) + CAPTURE_FIFO_ADDR_OFFSET;
> -		rv_writel(acp_fifo_addr, rtd->acp3x_base +
> -			  mmACP_BT_RX_FIFOADDR);
> -		rv_writel(FIFO_SIZE, rtd->acp3x_base + mmACP_BT_RX_FIFOSIZE);
> +		switch (rtd->i2s_instance) {
> +		case I2S_BT_INSTANCE:
> +			/* Config ringbuffer */
> +			rv_writel(I2S_BT_RX_MEM_WINDOW_START,
> +				rtd->acp3x_base + mmACP_BT_RX_RINGBUFADDR);
> +			rv_writel(MAX_BUFFER,
> +				rtd->acp3x_base + mmACP_BT_RX_RINGBUFSIZE);
> +			rv_writel(DMA_SIZE,
> +				rtd->acp3x_base + mmACP_BT_RX_DMA_SIZE);
> +
> +			/* Config audio fifo */
> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
> +						BT_CAPT_FIFO_ADDR_OFFSET;
> +			rv_writel(acp_fifo_addr,
> +				rtd->acp3x_base + mmACP_BT_RX_FIFOADDR);
> +			rv_writel(FIFO_SIZE,
> +				rtd->acp3x_base + mmACP_BT_RX_FIFOSIZE);
> +			/* Enable  watermark/period interrupt to host */
> +			rv_writel(BIT(BT_RX_THRESHOLD),
> +				rtd->acp3x_base + mmACP_EXTERNAL_INTR_CNTL);
> +			break;
> +
> +		case I2S_SP_INSTANCE:
> +		default:
> +			/* Config ringbuffer */
> +			rv_writel(I2S_SP_RX_MEM_WINDOW_START,
> +				rtd->acp3x_base + mmACP_I2S_RX_RINGBUFADDR);
> +			rv_writel(MAX_BUFFER,
> +				rtd->acp3x_base + mmACP_I2S_RX_RINGBUFSIZE);
> +			rv_writel(DMA_SIZE,
> +				rtd->acp3x_base + mmACP_I2S_RX_DMA_SIZE);
> +
> +			/* Config audio fifo */
> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
> +						SP_CAPT_FIFO_ADDR_OFFSET;
> +			rv_writel(acp_fifo_addr,
> +				rtd->acp3x_base + mmACP_I2S_RX_FIFOADDR);
> +			rv_writel(FIFO_SIZE,
> +				rtd->acp3x_base + mmACP_I2S_RX_FIFOSIZE);
> +			/* Enable  watermark/period interrupt to host */
> +			rv_writel(BIT(I2S_RX_THRESHOLD),
> +				rtd->acp3x_base + mmACP_EXTERNAL_INTR_CNTL);
> +		}

and here too. You are doing the same operations with just different offsets.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
