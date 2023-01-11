Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5406660BF
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 17:39:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 037E1762D;
	Wed, 11 Jan 2023 17:38:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 037E1762D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673455166;
	bh=+Tf4fOTtVxxPUIU5o6FffNBYvv8T1/1+ZdmCbPKp6+w=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MsCLSa4GLwv5zr92DmlpRvmyaIWo4QetdqRSjGdLnVscpHctYaGIDYiCD58Dr3uFr
	 OCqr9Edv9YocRiFdQ4cQC3tBeHGvaSYlvW67amS9BzKv0H+j9tqW0Xy3f/WRfHsRjo
	 D291D7fkRD3sek+MQwYw+hRIT7yGanT/9OVjCtYk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0B57F805A9;
	Wed, 11 Jan 2023 17:36:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B070F8057A; Wed, 11 Jan 2023 17:36:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21EDBF80549
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 17:36:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21EDBF80549
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ivrFpAVX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673454968; x=1704990968;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+Tf4fOTtVxxPUIU5o6FffNBYvv8T1/1+ZdmCbPKp6+w=;
 b=ivrFpAVX6iXYWXKRasvJ7qXQ60/VBxgnMrqQ4SWty0i7ooprtEJ53+N7
 veKaPVaGzhhvXmGbjHvMPLkBAAvujhPfbTcvqbU6Ntpvkk1LtOp7aN0PH
 J0dpZZCmcCHkL19Unna//VnQlxDk5MoM3QRBNMw/paHTfoJli8IAFCzm4
 3UzzTB8CNyOsdogZqPEJVlY5r8zRLq8Hfo4bQaSeX/9hGtVjH91Tp1h+R
 d65+Do+64IdpgKey4ppTvoEbsPDVwYDHaZMTWeOQn+96xRt6dYUUm/zZo
 R0RN3BvtTnyG0XqTETtalNVdq+2yU28EvzVzAGXnXa+WgrbmTW+dnwqW8 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="324704146"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="324704146"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 08:32:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607408589"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="607408589"
Received: from flobatol-mobl1.amr.corp.intel.com (HELO [10.212.110.208])
 ([10.212.110.208])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 08:32:29 -0800
Message-ID: <0d2ccd69-63e3-b8c5-396b-b698110cad14@linux.intel.com>
Date: Wed, 11 Jan 2023 09:38:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 09/19] ASoC: amd: ps: add support for Soundwire DMA
 interrupts
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-10-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230111090222.2016499-10-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Mario.Limonciello@amd.com,
 arungopal.kondaveeti@amd.com, Syed Saba Kareem <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>




> @@ -167,9 +167,11 @@ struct acp63_dev_data {
>  	struct platform_device *pdev[ACP63_DEVS];
>  	struct mutex acp_lock; /* protect shared registers */
>  	struct fwnode_handle *sdw_fw_node;
> +	struct work_struct acp_sdw_dma_work;
>  	u16 pdev_mask;
>  	u16 pdev_count;
>  	u16 pdm_dev_index;
> +	u16 dma_intr_stat[ACP63_SDW_MAX_STREAMS];

streams and DMAs are different things in SoundWire. You can have a 1:N
mapping.

>  	u8 sdw_master_count;
>  	u16 sdw0_dev_index;
>  	u16 sdw1_dev_index;
> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
> index 0fbe5e27f3fb..5b82ee8e3ad8 100644
> --- a/sound/soc/amd/ps/pci-ps.c
> +++ b/sound/soc/amd/ps/pci-ps.c
> @@ -113,14 +113,37 @@ static int acp63_deinit(void __iomem *acp_base, struct device *dev)
>  	return 0;
>  }
>  
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
> +	for (stream_index = 0; stream_index < ACP63_SDW_MAX_STREAMS; stream_index++) {
> +		if (adata->dma_intr_stat[stream_index]) {
> +			if (sdw_dma_data->sdw_stream[stream_index])
> +				snd_pcm_period_elapsed(sdw_dma_data->sdw_stream[stream_index]);

is there a reason why you do this in a work thread?

IIRC we did this in SOF because of an issue where during an xrun a stop
IPC would be sent while we were dealing with an IPC.

I don't quite see why it's needed for a DMA?

What am I missing?

> +			adata->dma_intr_stat[stream_index] = 0;
> +		}
> +	}
> +}

