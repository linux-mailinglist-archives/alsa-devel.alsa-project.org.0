Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C20572480D
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 17:42:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEFED836;
	Tue,  6 Jun 2023 17:41:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEFED836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686066144;
	bh=GelMQS7A/Lfhb0VxgBucg1eyg9fuPuwktHizh8Kwk48=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kPx66iePsl4pQeiueyFRlvlEl0/e24X9ATMkFsvhtKUfZAukG01kuvmxIOoO66SSE
	 MFdS2gndbB0T6jMvMITbbCzVwKcxtU+JwpZ8TyaWVYbT1d7qsEnoNS8P2a1GPjxnY1
	 uuyntVzbiPZvH6jDmACbyTcVhnV3T3avMT+53Bik=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7428EF80564; Tue,  6 Jun 2023 17:40:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22DC7F80564;
	Tue,  6 Jun 2023 17:40:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3504F80544; Tue,  6 Jun 2023 17:40:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F30DF800C8
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 17:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F30DF800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=oI4GuyBg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686066027; x=1717602027;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=GelMQS7A/Lfhb0VxgBucg1eyg9fuPuwktHizh8Kwk48=;
  b=oI4GuyBgbHiFqDt+549dnUpSWG4ceIXPg6fyzbNCT76cmwDBBWZO0oEf
   FGkMNvdGT+SAWQqHUt/dtIVpV3wGnu3CQzPnssR+uBVsgFiFN1Lmzp/k/
   ykoUVTweE8JWnSVr4oJzkGb5C004S3P7KGj7LFKj5zb2Dq6b6mfbiwjJD
   zXNFlcFZlWt8qJgNo2qiNqMaZnh/ofSIZhlIhv7XjbZ47g9lmDIBJw52W
   vry+2+pHpLHm/yAGT/Qf6P36wvD8tVz4ED5VTe+qM+Kk965iID/hBCbsb
   oKOQo+m3gFxuTb7bSeq6fNvy6yvCVR0uxK+/3v9B4vxGtppxAe7/JezZk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="422550153"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400";
   d="scan'208";a="422550153"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 08:39:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="955816518"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400";
   d="scan'208";a="955816518"
Received: from pdonvalk-mobl2.amr.corp.intel.com (HELO [10.255.231.168])
 ([10.255.231.168])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 08:39:09 -0700
Message-ID: <652a07e4-49be-7715-cc77-b05f1727a496@linux.intel.com>
Date: Tue, 6 Jun 2023 09:49:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH V3 2/9] ASoC: amd: ps: handle SoundWire interrupts in acp
 pci driver
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230606060724.2038680-1-Vijendar.Mukunda@amd.com>
 <20230606060724.2038680-3-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230606060724.2038680-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BNEUXHIIEZBFCO4UCBYTIPIZTWCI7YRQ
X-Message-ID-Hash: BNEUXHIIEZBFCO4UCBYTIPIZTWCI7YRQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BNEUXHIIEZBFCO4UCBYTIPIZTWCI7YRQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>  static void acp63_disable_interrupts(void __iomem *acp_base)
> @@ -102,23 +103,60 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
>  {
>  	struct acp63_dev_data *adata;
>  	struct pdm_dev_data *ps_pdm_data;
> -	u32 val;
> +	struct amd_sdw_manager *amd_manager;
> +	u32 ext_intr_stat, ext_intr_stat1;
> +	u16 irq_flag = 0;
>  	u16 pdev_index;
>  
>  	adata = dev_id;
>  	if (!adata)
>  		return IRQ_NONE;
> +	/* ACP interrupts will be cleared by reading particular bit and writing
> +	 * same value to the status register. writing zero's doesn't have any
> +	 * effect.
> +	 * Bit by bit checking of IRQ field is implemented.
> +	 */
> +	ext_intr_stat = readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> +	if (ext_intr_stat & ACP_SDW0_STAT) {
> +		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> +		pdev_index = adata->sdw0_dev_index;
> +		amd_manager = dev_get_drvdata(&adata->pdev[pdev_index]->dev);
> +		if (amd_manager)

can this test be false?

> +			schedule_work(&amd_manager->amd_sdw_irq_thread);
> +		irq_flag = 1;
> +	}
>  
> -	val = readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> -	if (val & BIT(PDM_DMA_STAT)) {
> +	ext_intr_stat1 = readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
> +	if (ext_intr_stat1 & ACP_SDW1_STAT) {
> +		writel(ACP_SDW1_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
> +		pdev_index = adata->sdw1_dev_index;
> +		amd_manager = dev_get_drvdata(&adata->pdev[pdev_index]->dev);
> +		if (amd_manager)

can this be false?

> +			schedule_work(&amd_manager->amd_sdw_irq_thread);
> +		irq_flag = 1;
> +	}
> +
> +	if (ext_intr_stat & ACP_ERROR_IRQ) {
> +		writel(ACP_ERROR_IRQ, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> +		/* TODO: Report SoundWire Manager instance errors */
> +		writel(0, adata->acp63_base + ACP_SW0_I2S_ERROR_REASON);
> +		writel(0, adata->acp63_base + ACP_SW1_I2S_ERROR_REASON);
> +		writel(0, adata->acp63_base + ACP_ERROR_STATUS);
> +		irq_flag = 1;
> +	}
> +
> +	if (ext_intr_stat & BIT(PDM_DMA_STAT)) {
>  		pdev_index = adata->pdm_dev_index;
>  		ps_pdm_data = dev_get_drvdata(&adata->pdev[pdev_index]->dev);
>  		writel(BIT(PDM_DMA_STAT), adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
>  		if (ps_pdm_data->capture_stream)
>  			snd_pcm_period_elapsed(ps_pdm_data->capture_stream);
> -		return IRQ_HANDLED;
> +		irq_flag = 1;
>  	}
> -	return IRQ_NONE;
> +	if (irq_flag)
> +		return IRQ_HANDLED;
> +	else
> +		return IRQ_NONE;
>  }
>  
>  static int sdw_amd_scan_controller(struct device *dev)
