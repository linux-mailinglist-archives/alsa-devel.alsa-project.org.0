Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC3070528A
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 17:45:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 556FE1D9;
	Tue, 16 May 2023 17:44:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 556FE1D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684251928;
	bh=Rh59zO8e75nVjvFgnk6rq5RQQysJdEwRP0tmCbgxNhY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BdTH/MfVz2fkU+K0vc65JcaokMTj2nfnzSkG9T+/MjxfxpFdmbQehb7mQ4SHmbCUz
	 jkwsg/pqxbEHMiHTd4k5QvUtOzyseUlkcjb8xfxyqu1ExHtmmf4ZIiIkmfaTwrm9i6
	 sHgAQ+Yn+8HtJUbs9bjSfLZCfOwiVWCckH9O/+j4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B044F80551; Tue, 16 May 2023 17:44:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E0B0F80551;
	Tue, 16 May 2023 17:44:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D2A9F802E8; Tue, 16 May 2023 17:44:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A2FEF8016A
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 17:43:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A2FEF8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mPZzqnKb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684251837; x=1715787837;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Rh59zO8e75nVjvFgnk6rq5RQQysJdEwRP0tmCbgxNhY=;
  b=mPZzqnKbiOHxugnL8HS+q6cxOK29wNSzmW/Kpoin0bNzpS3dh2+TqkN3
   TgqQbsvclzS+osK7JX3cR6IH767nEISjabpQvNkAfnxBxteobm75JpKxo
   DEuqCseomMPa2cCgJkCvoZMT/OlFUuUzeHsZt59LxH6zBalV33Jh4FN35
   6Q3UVdRbxH63NQA30Jq/HoaG4AA5wtKXh86vXrsv6XhyYASpLM+1CVPs2
   YS6T0Tj/9saStWKyF/Wnj5oEAYc2sg+g9H3SoOqmWlvhH4y6rGmNuxDA7
   n9kj6HKWdkgSYzmB4klbr3qaXqHNgmHShyr37vp0sHLe4cZS0C7MivE74
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="379694319"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200";
   d="scan'208";a="379694319"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 08:43:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="701391896"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200";
   d="scan'208";a="701391896"
Received: from aboonloe-mobl.amr.corp.intel.com (HELO [10.212.186.99])
 ([10.212.186.99])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 08:43:40 -0700
Message-ID: <bc58e1b1-8bce-3894-f840-57dd2d802932@linux.intel.com>
Date: Tue, 16 May 2023 09:39:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH 2/9] ASoC: amd: ps: handle soundwire interrupts in acp pci
 driver
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, --to=broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230516103543.2515097-1-Vijendar.Mukunda@amd.com>
 <20230516103543.2515097-3-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230516103543.2515097-3-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MGDZCEIDECUFZWXHNAA5VSAI32PY6KOI
X-Message-ID-Hash: MGDZCEIDECUFZWXHNAA5VSAI32PY6KOI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MGDZCEIDECUFZWXHNAA5VSAI32PY6KOI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/16/23 05:35, Vijendar Mukunda wrote:
> Handle soundwire manager related interrupts in ACP PCI driver
> interrupt handler and schedule soundwire manager work queue for
> further processing.

"SoundWire" please

> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>  sound/soc/amd/ps/acp63.h  |  4 ++++
>  sound/soc/amd/ps/pci-ps.c | 42 ++++++++++++++++++++++++++++++++++-----
>  2 files changed, 41 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
> index f27f71116598..faf7be4d77c2 100644
> --- a/sound/soc/amd/ps/acp63.h
> +++ b/sound/soc/amd/ps/acp63.h
> @@ -67,6 +67,10 @@
>  /* time in ms for acp timeout */
>  #define ACP_TIMEOUT		500
>  
> +#define ACP_SDW0_IRQ_MASK		21
> +#define ACP_SDW1_IRQ_MASK		2
> +#define ACP_ERROR_IRQ_MASK		29

Shouldn't this be in 0x representation or BIT/GENMASK?

> +
>  enum acp_config {
>  	ACP_CONFIG_0 = 0,
>  	ACP_CONFIG_1,
> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
> index f3aa08dc05b2..6566ee14d300 100644
> --- a/sound/soc/amd/ps/pci-ps.c
> +++ b/sound/soc/amd/ps/pci-ps.c
> @@ -56,6 +56,7 @@ static int acp63_reset(void __iomem *acp_base)
>  static void acp63_enable_interrupts(void __iomem *acp_base)
>  {
>  	writel(1, acp_base + ACP_EXTERNAL_INTR_ENB);
> +	writel(BIT(ACP_ERROR_IRQ_MASK), acp_base + ACP_EXTERNAL_INTR_CNTL);

BIT(FOO_MASK) is very odd.

BIT(ACP_ERROR_IRQ) or ACP_ERROR_IRQ_MASK?

>  }
>  
>  static void acp63_disable_interrupts(void __iomem *acp_base)
> @@ -102,23 +103,54 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
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
> +	ext_intr_stat = readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> +	if (ext_intr_stat & BIT(ACP_SDW0_IRQ_MASK)) {
> +		writel(BIT(ACP_SDW0_IRQ_MASK), adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> +		pdev_index = adata->sdw0_dev_index;
> +		amd_manager = dev_get_drvdata(&adata->pdev[pdev_index]->dev);
> +		if (amd_manager)
> +			schedule_work(&amd_manager->amd_sdw_irq_thread);
> +		irq_flag = 1;
> +	}
>  
> -	val = readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> -	if (val & BIT(PDM_DMA_STAT)) {
> +	ext_intr_stat1 = readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
> +	if (ext_intr_stat1 & BIT(ACP_SDW1_IRQ_MASK)) {
> +		writel(BIT(ACP_SDW1_IRQ_MASK), adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
> +		pdev_index = adata->sdw1_dev_index;
> +		amd_manager = dev_get_drvdata(&adata->pdev[pdev_index]->dev);
> +		if (amd_manager)
> +			schedule_work(&amd_manager->amd_sdw_irq_thread);
> +		irq_flag = 1;
> +	}
> +
> +	if (ext_intr_stat & BIT(ACP_ERROR_IRQ_MASK)) {
> +		writel(BIT(ACP_ERROR_IRQ_MASK), adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
> +		writel(0, adata->acp63_base + ACP_SW0_I2S_ERROR_REASON);
> +		writel(0, adata->acp63_base + ACP_SW1_I2S_ERROR_REASON);
> +		writel(0, adata->acp63_base + ACP_ERROR_STATUS);
> +		irq_flag = 1;

it's not clear what this does? Looks like just filtering out interrupts
without doing anything about the interrupt source?

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
