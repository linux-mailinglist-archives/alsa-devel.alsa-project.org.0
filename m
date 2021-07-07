Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D13903BEC66
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jul 2021 18:38:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55783843;
	Wed,  7 Jul 2021 18:37:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55783843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625675917;
	bh=quEqyZuzj0n3bY8LsSVHai8FWPpLHeXUyNW61nM2mzU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RJnOOgDqe/V2udS8JI2Q9PFwwQzCWsC3PCk734QJEwNqHx70xIFbum/DueGw8s11m
	 L8sk3nnL1ZGs6+GX53QS8E1itM9TU5oKhoOMg4WXE/b4BElaAaWd6OcZtgAjXmL1j0
	 2lLzTRlhVs6Wec5f7PeTTDEvtWIsX9taTMR1ElfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AA7AF804E6;
	Wed,  7 Jul 2021 18:35:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AC6AF804E0; Wed,  7 Jul 2021 18:35:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40814F8012F
 for <alsa-devel@alsa-project.org>; Wed,  7 Jul 2021 18:35:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40814F8012F
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="209299036"
X-IronPort-AV: E=Sophos;i="5.84,220,1620716400"; d="scan'208";a="209299036"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 09:35:36 -0700
X-IronPort-AV: E=Sophos;i="5.84,220,1620716400"; d="scan'208";a="645442795"
Received: from cmcarran-mobl.amr.corp.intel.com (HELO [10.213.189.140])
 ([10.213.189.140])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 09:35:35 -0700
Subject: Re: [PATCH 07/12] ASoC: amd: add ACP5x pcm dma driver ops
To: Vijendar Mukunda <vijendar.mukunda@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20210707055623.27371-1-vijendar.mukunda@amd.com>
 <20210707055623.27371-8-vijendar.mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c2ca7755-9a28-792f-78b1-5be62474672a@linux.intel.com>
Date: Wed, 7 Jul 2021 11:27:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210707055623.27371-8-vijendar.mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Alexander.Deucher@amd.com, Takashi Iwai <tiwai@suse.com>,
 Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
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



On 7/7/21 12:56 AM, Vijendar Mukunda wrote:
> This patch adds ACP5x PCM driver DMA operations.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  sound/soc/amd/vangogh/acp5x-pcm-dma.c | 306 +++++++++++++++++++++++++-
>  sound/soc/amd/vangogh/acp5x.h         | 106 +++++++++
>  2 files changed, 410 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
> index d79712587d30..a4235cf33548 100644
> --- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
> +++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
> @@ -17,8 +17,42 @@
>  
>  #define DRV_NAME "acp5x_i2s_dma"
>  
> -static const struct snd_soc_component_driver acp5x_i2s_component = {
> -	.name		= DRV_NAME,
> +static const struct snd_pcm_hardware acp5x_pcm_hardware_playback = {
> +	.info = SNDRV_PCM_INFO_INTERLEAVED |
> +		SNDRV_PCM_INFO_BLOCK_TRANSFER |
> +		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
> +		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
> +	.formats = SNDRV_PCM_FMTBIT_S16_LE |  SNDRV_PCM_FMTBIT_S8 |
> +		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,

is S24_4LE supported? seems more useful than 8-bit audio these days, no?

> +static void config_acp5x_dma(struct i2s_stream_instance *rtd, int direction)
> +{
> +	u16 page_idx;
> +	u32 low, high, val, acp_fifo_addr, reg_fifo_addr;
> +	u32 reg_dma_size, reg_fifo_size;
> +	dma_addr_t addr;
> +
> +	addr = rtd->dma_addr;
> +	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
> +		switch (rtd->i2s_instance) {
> +		case I2S_HS_INSTANCE:
> +			val = ACP_SRAM_HS_PB_PTE_OFFSET;
> +			break;
> +		case I2S_SP_INSTANCE:
> +		default:
> +			val = ACP_SRAM_SP_PB_PTE_OFFSET;
> +		}
> +	} else {
> +		switch (rtd->i2s_instance) {
> +		case I2S_HS_INSTANCE:
> +			val = ACP_SRAM_HS_CP_PTE_OFFSET;
> +			break;
> +		case I2S_SP_INSTANCE:
> +		default:
> +			val = ACP_SRAM_SP_CP_PTE_OFFSET;
> +		}
> +	}
> +	/* Group Enable */
> +	acp_writel(ACP_SRAM_PTE_OFFSET | BIT(31), rtd->acp5x_base +
> +		   ACPAXI2AXI_ATU_BASE_ADDR_GRP_1);
> +	acp_writel(PAGE_SIZE_4K_ENABLE, rtd->acp5x_base +
> +		   ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1);
> +
> +	for (page_idx = 0; page_idx < rtd->num_pages; page_idx++) {
> +		/* Load the low address of page int ACP SRAM through SRBM */
> +		low = lower_32_bits(addr);
> +		high = upper_32_bits(addr);
> +
> +		acp_writel(low, rtd->acp5x_base + ACP_SCRATCH_REG_0 + val);
> +		high |= BIT(31);
> +		acp_writel(high, rtd->acp5x_base + ACP_SCRATCH_REG_0 + val
> +			   + 4);

use single line? I find the indentation style quite an eyesore...


> +		/* Move to next physically contiguous page */
> +		val += 8;
> +		addr += PAGE_SIZE;
> +	}
> +
> +	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
> +		switch (rtd->i2s_instance) {
> +		case I2S_HS_INSTANCE:
> +			reg_dma_size = ACP_HS_TX_DMA_SIZE;
> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
> +					HS_PB_FIFO_ADDR_OFFSET;
> +			reg_fifo_addr = ACP_HS_TX_FIFOADDR;
> +			reg_fifo_size = ACP_HS_TX_FIFOSIZE;
> +			acp_writel(I2S_HS_TX_MEM_WINDOW_START,
> +				   rtd->acp5x_base + ACP_HS_TX_RINGBUFADDR);
> +			break;
> +
> +		case I2S_SP_INSTANCE:
> +		default:
> +			reg_dma_size = ACP_I2S_TX_DMA_SIZE;
> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
> +					SP_PB_FIFO_ADDR_OFFSET;
> +			reg_fifo_addr =	ACP_I2S_TX_FIFOADDR;
> +			reg_fifo_size = ACP_I2S_TX_FIFOSIZE;
> +			acp_writel(I2S_SP_TX_MEM_WINDOW_START,
> +				   rtd->acp5x_base + ACP_I2S_TX_RINGBUFADDR);
> +		}
> +	} else {
> +		switch (rtd->i2s_instance) {
> +		case I2S_HS_INSTANCE:
> +			reg_dma_size = ACP_HS_RX_DMA_SIZE;
> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
> +					HS_CAPT_FIFO_ADDR_OFFSET;
> +			reg_fifo_addr = ACP_HS_RX_FIFOADDR;
> +			reg_fifo_size = ACP_HS_RX_FIFOSIZE;
> +			acp_writel(I2S_HS_RX_MEM_WINDOW_START,
> +				   rtd->acp5x_base + ACP_HS_RX_RINGBUFADDR);
> +			break;
> +
> +		case I2S_SP_INSTANCE:
> +		default:
> +			reg_dma_size = ACP_I2S_RX_DMA_SIZE;
> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
> +					SP_CAPT_FIFO_ADDR_OFFSET;
> +			reg_fifo_addr = ACP_I2S_RX_FIFOADDR;
> +			reg_fifo_size = ACP_I2S_RX_FIFOSIZE;
> +			acp_writel(I2S_SP_RX_MEM_WINDOW_START,
> +				   rtd->acp5x_base + ACP_I2S_RX_RINGBUFADDR);
> +		}
> +	}
> +	acp_writel(DMA_SIZE, rtd->acp5x_base + reg_dma_size);
> +	acp_writel(acp_fifo_addr, rtd->acp5x_base + reg_fifo_addr);
> +	acp_writel(FIFO_SIZE, rtd->acp5x_base + reg_fifo_size);
> +	acp_writel(BIT(I2S_RX_THRESHOLD) | BIT(HS_RX_THRESHOLD)
> +		   | BIT(I2S_TX_THRESHOLD) | BIT(HS_TX_THRESHOLD),
> +		   rtd->acp5x_base + ACP_EXTERNAL_INTR_CNTL);
> +}
> +

> +static int acp5x_dma_hw_params(struct snd_soc_component *component,
> +			       struct snd_pcm_substream *substream,
> +			       struct snd_pcm_hw_params *params)
> +{
> +	struct i2s_stream_instance *rtd;
> +	struct snd_soc_pcm_runtime *prtd;
> +	struct snd_soc_card *card;
> +	struct acp5x_platform_info *pinfo;
> +	struct i2s_dev_data *adata;
> +	u64 size;
> +
> +	prtd = asoc_substream_to_rtd(substream);
> +	card = prtd->card;
> +	pinfo = snd_soc_card_get_drvdata(card);
> +	adata = dev_get_drvdata(component->dev);
> +	rtd = substream->runtime->private_data;
> +
> +	if (!rtd)
> +		return -EINVAL;
> +
> +	if (pinfo) {
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +			rtd->i2s_instance = pinfo->play_i2s_instance;
> +			switch (rtd->i2s_instance) {
> +			case I2S_HS_INSTANCE:
> +				adata->play_stream = substream;
> +				break;
> +			case I2S_SP_INSTANCE:
> +			default:
> +				adata->i2ssp_play_stream = substream;
> +			}
> +		} else {
> +			rtd->i2s_instance = pinfo->cap_i2s_instance;
> +			switch (rtd->i2s_instance) {
> +			case I2S_HS_INSTANCE:
> +				adata->capture_stream = substream;
> +				break;
> +			case I2S_SP_INSTANCE:
> +			default:
> +				adata->i2ssp_capture_stream = substream;
> +			}
> +		}
> +	} else {
> +		pr_err("pinfo failed\n");

that seems like a rather useless message. if you want a log at least use dev_err(component->dev

> +	}
> +	size = params_buffer_bytes(params);
> +	rtd->dma_addr = substream->dma_buffer.addr;
> +	rtd->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
> +	config_acp5x_dma(rtd, substream->stream);
> +	return 0;
> +}
> +
