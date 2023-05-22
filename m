Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA7070C540
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 20:34:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA60A1FA;
	Mon, 22 May 2023 20:33:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA60A1FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684780473;
	bh=XAXCCp+4iACwZFaEUSigJa9p6OzPE1evsHYjiRa7ZYc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LkJxBBosAla/2tBj2a6fUMyjlv+YC/bA5y611zRor/06wM8t41Y4o8R/3bQvlRKer
	 ynoiZIUyvv5ohYDFU1zKmlMtuSZhNojc8gxWnBw5YQjw+xplz3fsDFwwLivZjgZ0dD
	 4hV1/nUlNfifUMMgllv+g8lbTEjwOveKmu5uuaVk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAB49F80548; Mon, 22 May 2023 20:33:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC59FF80249;
	Mon, 22 May 2023 20:33:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2186AF8026A; Mon, 22 May 2023 20:33:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F885F8026A
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 20:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F885F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Kdi+83qj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684780334; x=1716316334;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=XAXCCp+4iACwZFaEUSigJa9p6OzPE1evsHYjiRa7ZYc=;
  b=Kdi+83qjwckUUUWT3tI1n9saOyj7e68hinyz83mg49joU54mZqhVzyL0
   h9ezRzC9/S22yFkfCkuL20YbyEf2yONWGi7kNuHNcL2aV8VQURpo4gruY
   m968zkSbZ3krDECUa3N2/8Y//5UvqF29Ll9Cz5WsZlRp2q173Y0ucD75b
   yNFEZiuZeU15WmL8+nuBW32GfDPuxn0P6+glQeBhlDC1Mkb73DfOyQ2MZ
   sjHHgenjEOxAct+jLeuaMg2rEAOQTdQR4dfT2nMybw7dSK/VRTKqqrF3i
   7mFBeebT7afRg1H1Ir9V/84wbhAdezwsblNJ5Zsztpz3UNz2i+aVoDAv1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="356235165"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="356235165"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 11:31:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="697740842"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="697740842"
Received: from ljgreene-mobl.amr.corp.intel.com (HELO [10.209.124.121])
 ([10.209.124.121])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 11:31:50 -0700
Message-ID: <fea3c862-1470-7911-ff77-5d945b1d77cf@linux.intel.com>
Date: Mon, 22 May 2023 13:12:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH V2 5/9] ASoC: amd: ps: add support for SoundWire DMA
 interrupts
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230522133122.166841-1-Vijendar.Mukunda@amd.com>
 <20230522133122.166841-6-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230522133122.166841-6-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: I755WHYZLM3QN64KOG3J353IRWE6PMJG
X-Message-ID-Hash: I755WHYZLM3QN64KOG3J353IRWE6PMJG
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I755WHYZLM3QN64KOG3J353IRWE6PMJG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/22/23 08:31, Vijendar Mukunda wrote:
> Initialize workqueue for SoundWire DMA interrupts handling.
> Whenever audio data equal to the SoundWire FIFO watermark level
> are produced/consumed, interrupt is generated.
> Acknowledge the interrupt and schedule the workqueue.

It would help to explain why a work queue is needed is the first place,
as opposed to handling periods in the interrupt thread.

> +static void acp63_sdw_dma_workthread(struct work_struct *work)
> +{
> +	struct acp63_dev_data *adata = container_of(work, struct acp63_dev_data,
> +						    acp_sdw_dma_work);
> +	struct sdw_dma_dev_data *sdw_dma_data;
> +	u32 stream_index;
> +	u16 pdev_index;
> +
> +	pdev_index = adata->sdw_dma_dev_index;
> +	sdw_dma_data = dev_get_drvdata(&adata->pdev[pdev_index]->dev);
> +
> +	for (stream_index = 0; stream_index < ACP63_SDW0_DMA_MAX_STREAMS; stream_index++) {
> +		if (adata->sdw0_dma_intr_stat[stream_index]) {
> +			if (sdw_dma_data->sdw0_dma_stream[stream_index])
> +				snd_pcm_period_elapsed(sdw_dma_data->sdw0_dma_stream[stream_index]);
> +			adata->sdw0_dma_intr_stat[stream_index] = 0;
> +		}
> +	}
> +	for (stream_index = 0; stream_index < ACP63_SDW1_DMA_MAX_STREAMS; stream_index++) {
> +		if (adata->sdw1_dma_intr_stat[stream_index]) {
> +			if (sdw_dma_data->sdw1_dma_stream[stream_index])
> +				snd_pcm_period_elapsed(sdw_dma_data->sdw1_dma_stream[stream_index]);
> +			adata->sdw1_dma_intr_stat[stream_index] = 0;
> +		}
> +	}

I am not clear on the benefits of the workqueue which only tests a flag
that's set ...

> +}
> +
>  static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
>  {
>  	struct acp63_dev_data *adata;
>  	struct pdm_dev_data *ps_pdm_data;
>  	struct amd_sdw_manager *amd_manager;
>  	u32 ext_intr_stat, ext_intr_stat1;
> +	u32 stream_id = 0;
>  	u16 irq_flag = 0;
> +	u16 sdw_dma_irq_flag = 0;
>  	u16 pdev_index;
> +	u16 index;
>  
>  	adata = dev_id;
>  	if (!adata)
> @@ -148,7 +178,57 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
>  			snd_pcm_period_elapsed(ps_pdm_data->capture_stream);
>  		irq_flag = 1;
>  	}
> -	if (irq_flag)
> +	if (ext_intr_stat & ACP_SDW_DMA_IRQ_MASK) {
> +		for (index = ACP_AUDIO2_RX_THRESHOLD; index <= ACP_AUDIO0_TX_THRESHOLD; index++) {
> +			if (ext_intr_stat & BIT(index)) {
> +				writel(BIT(index), adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> +				switch (index) {
> +				case ACP_AUDIO0_TX_THRESHOLD:
> +					stream_id = ACP_SDW0_AUDIO0_TX;
> +					break;
> +				case ACP_AUDIO1_TX_THRESHOLD:
> +					stream_id = ACP_SDW0_AUDIO1_TX;
> +					break;
> +				case ACP_AUDIO2_TX_THRESHOLD:
> +					stream_id = ACP_SDW0_AUDIO2_TX;
> +					break;
> +				case ACP_AUDIO0_RX_THRESHOLD:
> +					stream_id = ACP_SDW0_AUDIO0_RX;
> +					break;
> +				case ACP_AUDIO1_RX_THRESHOLD:
> +					stream_id = ACP_SDW0_AUDIO1_RX;
> +					break;
> +				case ACP_AUDIO2_RX_THRESHOLD:
> +					stream_id = ACP_SDW0_AUDIO2_RX;
> +					break;
> +				}
> +
> +				adata->sdw0_dma_intr_stat[stream_id] = 1;

.. here ...
> +				sdw_dma_irq_flag = 1;
> +			}
> +		}
> +	}
> +
> +	/* SDW1 BT RX */
> +	if (ext_intr_stat1 & ACP_P1_AUDIO1_RX_THRESHOLD) {
> +		writel(ACP_P1_AUDIO1_RX_THRESHOLD,
> +		       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
> +		adata->sdw1_dma_intr_stat[ACP_SDW1_AUDIO1_RX] = 1;

... and here ...

> +		sdw_dma_irq_flag = 1;
> +	}
> +
> +	/* SDW1 BT TX*/
> +	if (ext_intr_stat1 & ACP_P1_AUDIO1_TX_THRESHOLD) {
> +		writel(ACP_P1_AUDIO1_TX_THRESHOLD,
> +		       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
> +		adata->sdw1_dma_intr_stat[ACP_SDW1_AUDIO1_TX] = 1;

... or here ...

> +		sdw_dma_irq_flag = 1;
> +	}
> +
> +	if (sdw_dma_irq_flag)
> +		schedule_work(&adata->acp_sdw_dma_work);
> +
> +	if (irq_flag || sdw_dma_irq_flag)
>  		return IRQ_HANDLED;
>  	else
>  		return IRQ_NONE;

