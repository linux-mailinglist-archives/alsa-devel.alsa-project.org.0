Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CAD95E97
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 14:32:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CB6C1672;
	Tue, 20 Aug 2019 14:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CB6C1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566304346;
	bh=clkGJQ3GR9fXDWXL0AWAepmJKzjWvLyIr+h0arhYc/s=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OiTEpNUAW1KTUNoLNtLb7RvX6zBNUjU3RnRUvvXnqeEdDW0H3CjV/AqhU00NcMKOZ
	 2IjyhxZUPoT8EnlS2dbgB3emhJuLdIosKPXvXZBCkMR4CS5sZYteqFya81UUiRKGa4
	 IxbIwpiLVoIaxG1wLX5+arqPbxP8PqjG7IbHEqtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6F54F803D5;
	Tue, 20 Aug 2019 14:30:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45109F8036E; Tue, 20 Aug 2019 14:30:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 409AEF800D3
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 14:30:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 409AEF800D3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 05:30:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="329694696"
Received: from jlisowie-mobl.ger.corp.intel.com (HELO [10.251.134.21])
 ([10.251.134.21])
 by orsmga004.jf.intel.com with ESMTP; 20 Aug 2019 05:30:25 -0700
To: Jaska Uimonen <jaska.uimonen@intel.com>, alsa-devel@alsa-project.org
References: <20190820034331.38171-1-jaska.uimonen@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2dc34431-7302-85c7-8215-472c7d994f7f@linux.intel.com>
Date: Tue, 20 Aug 2019 07:30:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820034331.38171-1-jaska.uimonen@intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: topology: fix get control data
 return type and arguments
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

Added Mark and Takashi in Cc.

On 8/19/19 10:43 PM, Jaska Uimonen wrote:
> sof_get_control_data returns negative values even though the return
> value is defined unsigned (size_t). So change the return value type
> to int.
> 
> Add the data size as pointer argument to sof_get_control_data to
> avoid ambiquity in the meaning of the return type. Also make the
> sof_get_control_data to return -EINVAL if data pointer is valid
> but the size is for some reason zero.
> 
> Fixes: cac974a51ebb ("ASoC: SOF: topology: use set_get_data in process load")
> Reported by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Jaska Uimonen <jaska.uimonen@intel.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/sof/topology.c | 23 +++++++++++++----------
>   1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> index 28a7a6e06a53..8288b1758542 100644
> --- a/sound/soc/sof/topology.c
> +++ b/sound/soc/sof/topology.c
> @@ -1752,15 +1752,15 @@ static int sof_widget_load_siggen(struct snd_soc_component *scomp, int index,
>   	return ret;
>   }
>   
> -static size_t sof_get_control_data(struct snd_sof_dev *sdev,
> -				   struct snd_soc_dapm_widget *widget,
> -				   struct sof_widget_data *wdata)
> +static int sof_get_control_data(struct snd_sof_dev *sdev,
> +				struct snd_soc_dapm_widget *widget,
> +				struct sof_widget_data *wdata,
> +				size_t *size)
>   {
>   	const struct snd_kcontrol_new *kc;
>   	struct soc_mixer_control *sm;
>   	struct soc_bytes_ext *sbe;
>   	struct soc_enum *se;
> -	size_t size = 0;
>   	int i;
>   
>   	for (i = 0; i < widget->num_kcontrols; i++) {
> @@ -1800,7 +1800,11 @@ static size_t sof_get_control_data(struct snd_sof_dev *sdev,
>   		if (wdata[i].pdata->magic != SOF_ABI_MAGIC)
>   			return -EINVAL;
>   
> -		size += wdata[i].pdata->size;
> +		/* don't accept 0 size for data */
> +		if (!wdata[i].pdata->size)
> +			return -EINVAL;
> +
> +		*size += wdata[i].pdata->size;
>   
>   		/* get data type */
>   		switch (wdata[i].control->cmd) {
> @@ -1819,7 +1823,7 @@ static size_t sof_get_control_data(struct snd_sof_dev *sdev,
>   		}
>   	}
>   
> -	return size;
> +	return 0;
>   }
>   
>   static int sof_process_load(struct snd_soc_component *scomp, int index,
> @@ -1855,12 +1859,11 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
>   			return -ENOMEM;
>   
>   		/* get possible component controls and get size of all pdata */
> -		ipc_data_size = sof_get_control_data(sdev, widget, wdata);
> +		ret = sof_get_control_data(sdev, widget, wdata,
> +					   &ipc_data_size);
>   
> -		if (ipc_data_size <= 0) {
> -			ret = ipc_data_size;
> +		if (ret < 0)
>   			goto out;
> -		}
>   	}
>   
>   	ipc_size = sizeof(struct sof_ipc_comp_process) +
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
