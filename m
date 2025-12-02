Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71248CB00F8
	for <lists+alsa-devel@lfdr.de>; Tue, 09 Dec 2025 14:30:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72050601F0;
	Tue,  9 Dec 2025 14:30:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72050601F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765287057;
	bh=h504TlD4hkfWEx5CxoUKhaX/q+6HXNdHKNnpsA753es=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=buKeCHMmQ6LUqtTjttsas0q8iYqLqedWgh+vqMm+9WMpD6cyreSlJbXtGQM14k7c5
	 psuzuxzyQGlnNkFbEOakgRKdOiVpcSzj3tCPgg39LVHVj/gdRkWVfd7mrWd3tl36c1
	 pIWxm9YTtdJa6Rc/JdjQWaHPfDSb9nCozo0FF6jU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EB26F80604; Tue,  9 Dec 2025 14:30:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80B0FF80603;
	Tue,  9 Dec 2025 14:30:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FDCCF80246; Tue,  2 Dec 2025 23:08:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 682A8F800B5
	for <alsa-devel@alsa-project.org>; Tue,  2 Dec 2025 23:08:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 682A8F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JCRlYw5b
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C98E0434FE;
	Tue,  2 Dec 2025 22:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743A8C4CEF1;
	Tue,  2 Dec 2025 22:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764713291;
	bh=h504TlD4hkfWEx5CxoUKhaX/q+6HXNdHKNnpsA753es=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JCRlYw5bmZNXcaX2ZPvhkXNTAqKvGQwmtBoY5BOnrG3H6DX7K5Mx4Bs4LXMb0OFAR
	 zmkCm0lvdmUSCoeKti0VZpVDkF2vx/EHgu38bsLRnmxZl7XjW5JJsDkdKdkZ18Jc0K
	 r77io/RyPRNrERAYgoPcBLdN+Jmi6rH7AC5v1FuXbmDW2EmAhEQfM2fYmq6yWL99TN
	 1JphVlu2ex7DhDnKMgMIEqzyfWKrTz/6tTLurAUQB3T89DyVqzDshZUqIQU7Mdovah
	 3K4buQHHFvp2cTOgUCsMyQHfkTmXoE90wIS9D5kDfRIuKgyeKB71SMGldY2YghoYiM
	 8gMNJHYd3HXGg==
Message-ID: <9070b032-03d3-4f01-85d7-d55918678659@kernel.org>
Date: Tue, 2 Dec 2025 16:08:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: amd: acp: Audio is not resuming after s0ix
To: Raghavendra Prasad Mallela <raghavendraprasad.mallela@amd.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com,
 Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20251202175616.2213054-1-raghavendraprasad.mallela@amd.com>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20251202175616.2213054-1-raghavendraprasad.mallela@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: superm1@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5QMKEFJE3ABSW5IL2P6IPVL7FS5QAT2G
X-Message-ID-Hash: 5QMKEFJE3ABSW5IL2P6IPVL7FS5QAT2G
X-Mailman-Approved-At: Tue, 09 Dec 2025 13:29:51 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5QMKEFJE3ABSW5IL2P6IPVL7FS5QAT2G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/2/2025 11:56 AM, Raghavendra Prasad Mallela wrote:
> From: Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>
> 
> Audio fails to resume after system exits suspend mode
> due to accessing incorrect ring buffer address during
> resume. This patch resolves issue by selecting correct
> address based on the ACP version.
> 
> Signed-off-by: Hemalatha Pinnamreddy <hemalatha.pinnamreddy2@amd.com>
> Signed-off-by: Raghavendra Prasad Mallela <raghavendraprasad.mallela@amd.com>

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
One nit below.

> ---
>   sound/soc/amd/acp/acp-legacy-common.c | 32 +++++++++++++++++++++------
>   1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
> index 3078f459e005..da80c761d657 100644
> --- a/sound/soc/amd/acp/acp-legacy-common.c
> +++ b/sound/soc/amd/acp/acp-legacy-common.c
> @@ -208,7 +208,7 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
>   	struct acp_resource *rsrc = chip->rsrc;
>   	struct acp_stream *stream = substream->runtime->private_data;
>   	u32 reg_dma_size, reg_fifo_size, reg_fifo_addr;
> -	u32 phy_addr, acp_fifo_addr, ext_int_ctrl;
> +	u32 phy_addr = 0, acp_fifo_addr, ext_int_ctrl;

Why initialize this variable now?

>   	unsigned int dir = substream->stream;
>   
>   	switch (dai->driver->id) {
> @@ -219,7 +219,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
>   					SP_PB_FIFO_ADDR_OFFSET;
>   			reg_fifo_addr = ACP_I2S_TX_FIFOADDR(chip);
>   			reg_fifo_size = ACP_I2S_TX_FIFOSIZE(chip);
> -			phy_addr = I2S_SP_TX_MEM_WINDOW_START + stream->reg_offset;
> +			if (chip->acp_rev >= ACP70_PCI_ID)
> +				phy_addr = ACP7x_I2S_SP_TX_MEM_WINDOW_START;
> +			else
> +				phy_addr = I2S_SP_TX_MEM_WINDOW_START + stream->reg_offset;
>   			writel(phy_addr, chip->base + ACP_I2S_TX_RINGBUFADDR(chip));
>   		} else {
>   			reg_dma_size = ACP_I2S_RX_DMA_SIZE(chip);
> @@ -227,7 +230,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
>   					SP_CAPT_FIFO_ADDR_OFFSET;
>   			reg_fifo_addr = ACP_I2S_RX_FIFOADDR(chip);
>   			reg_fifo_size = ACP_I2S_RX_FIFOSIZE(chip);
> -			phy_addr = I2S_SP_RX_MEM_WINDOW_START + stream->reg_offset;
> +			if (chip->acp_rev >= ACP70_PCI_ID)
> +				phy_addr = ACP7x_I2S_SP_RX_MEM_WINDOW_START;
> +			else
> +				phy_addr = I2S_SP_RX_MEM_WINDOW_START + stream->reg_offset;
>   			writel(phy_addr, chip->base + ACP_I2S_RX_RINGBUFADDR(chip));
>   		}
>   		break;
> @@ -238,7 +244,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
>   					BT_PB_FIFO_ADDR_OFFSET;
>   			reg_fifo_addr = ACP_BT_TX_FIFOADDR(chip);
>   			reg_fifo_size = ACP_BT_TX_FIFOSIZE(chip);
> -			phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
> +			if (chip->acp_rev >= ACP70_PCI_ID)
> +				phy_addr = ACP7x_I2S_BT_TX_MEM_WINDOW_START;
> +			else
> +				phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
>   			writel(phy_addr, chip->base + ACP_BT_TX_RINGBUFADDR(chip));
>   		} else {
>   			reg_dma_size = ACP_BT_RX_DMA_SIZE(chip);
> @@ -246,7 +255,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
>   					BT_CAPT_FIFO_ADDR_OFFSET;
>   			reg_fifo_addr = ACP_BT_RX_FIFOADDR(chip);
>   			reg_fifo_size = ACP_BT_RX_FIFOSIZE(chip);
> -			phy_addr = I2S_BT_TX_MEM_WINDOW_START + stream->reg_offset;
> +			if (chip->acp_rev >= ACP70_PCI_ID)
> +				phy_addr = ACP7x_I2S_BT_RX_MEM_WINDOW_START;
> +			else
> +				phy_addr = I2S_BT_RX_MEM_WINDOW_START + stream->reg_offset;
>   			writel(phy_addr, chip->base + ACP_BT_RX_RINGBUFADDR(chip));
>   		}
>   		break;
> @@ -257,7 +269,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
>   					HS_PB_FIFO_ADDR_OFFSET;
>   			reg_fifo_addr = ACP_HS_TX_FIFOADDR;
>   			reg_fifo_size = ACP_HS_TX_FIFOSIZE;
> -			phy_addr = I2S_HS_TX_MEM_WINDOW_START + stream->reg_offset;
> +			if (chip->acp_rev >= ACP70_PCI_ID)
> +				phy_addr = ACP7x_I2S_HS_TX_MEM_WINDOW_START;
> +			else
> +				phy_addr = I2S_HS_TX_MEM_WINDOW_START + stream->reg_offset;
>   			writel(phy_addr, chip->base + ACP_HS_TX_RINGBUFADDR);
>   		} else {
>   			reg_dma_size = ACP_HS_RX_DMA_SIZE;
> @@ -265,7 +280,10 @@ static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
>   					HS_CAPT_FIFO_ADDR_OFFSET;
>   			reg_fifo_addr = ACP_HS_RX_FIFOADDR;
>   			reg_fifo_size = ACP_HS_RX_FIFOSIZE;
> -			phy_addr = I2S_HS_RX_MEM_WINDOW_START + stream->reg_offset;
> +			if (chip->acp_rev >= ACP70_PCI_ID)
> +				phy_addr = ACP7x_I2S_HS_RX_MEM_WINDOW_START;
> +			else
> +				phy_addr = I2S_HS_RX_MEM_WINDOW_START + stream->reg_offset;
>   			writel(phy_addr, chip->base + ACP_HS_RX_RINGBUFADDR);
>   		}
>   		break;

