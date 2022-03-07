Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD1A4D0708
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 19:56:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DBD216B1;
	Mon,  7 Mar 2022 19:56:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DBD216B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646679413;
	bh=rxoAFf/UsBaDwU006xdRViCEGY/3wBIPVLAxH+tsdcg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jt69AiOtMeYZLRf4LuTUxi56cdMs6Tac97L03VYfctxJzKWL3NfJxCXE4wUsCNf6T
	 t+EkWieBZn6iH11FHdMSI5mZzO0AM8ICiXoZzwM9hB934yULfzB8ZwFgnlHrkHALO0
	 hT3Fn6eO6m++ZbHRAFeZ73bIXy9BNXV6kDKjPKQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 138C6F80159;
	Mon,  7 Mar 2022 19:55:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8219F8013F; Mon,  7 Mar 2022 19:55:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99A34F800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 19:55:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99A34F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PMRQ6Xos"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646679342; x=1678215342;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rxoAFf/UsBaDwU006xdRViCEGY/3wBIPVLAxH+tsdcg=;
 b=PMRQ6Xoskm7vIHoGRyfvJHHJVpvAiY8iN1C9Ha3edx/Tg21AZqQ2n7RA
 I2jhlHRxcsX64fOAdvTT5NDN7yTO5XYqjpuF0/otEM9++maQG6t1oLNAH
 WH+H08t4zLFSVcCBtaD8jEe3wr6yk3j4/n8jtcNfjqXFkDRGTEw4MAG4b
 Nsk8LLL2T949/1MSSmmu+d8I9+omXqf2hJtt1U/5PtSn+WzUwG/SQDK5W
 ZOTqeapJTZLxg4BvruZmRynK++q/fgP/LCQBYyMzVcacluMOWdg4kt9kY
 he5M1KkeO/fUC6iyZ3ehFtUXC+sAEx9vPosQU1GLo7fSGUemDJ6Xh18wb g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254202188"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="254202188"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:55:36 -0800
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="553281244"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.205])
 ([10.99.249.205])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:55:34 -0800
Message-ID: <cb8673b3-2306-9582-1434-7b173a5d6c30@linux.intel.com>
Date: Mon, 7 Mar 2022 19:55:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 11/18] ASoC: SOF: make struct snd_sof_widget IPC agnostic
Content-Language: en-US
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
 <20220307181111.49392-12-ranjani.sridharan@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220307181111.49392-12-ranjani.sridharan@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 3/7/2022 7:11 PM, Ranjani Sridharan wrote:
> Parse the UUID token and save it in the new uuid field in struct
> snd_sof_widget. struct sof_ipc_comp_ext is no longer needed. So remove
> it too.
> 
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   include/sound/sof/topology.h |  5 -----
>   sound/soc/sof/sof-audio.h    |  3 +--
>   sound/soc/sof/topology.c     | 20 ++++++++++----------
>   3 files changed, 11 insertions(+), 17 deletions(-)
> 
> diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
> index adee6afd1490..33bd9eaffd50 100644
> --- a/include/sound/sof/topology.h
> +++ b/include/sound/sof/topology.h
> @@ -303,9 +303,4 @@ enum sof_event_types {
>   	SOF_KEYWORD_DETECT_DAPM_EVENT,
>   };
>   
> -/* extended data struct for UUID components */
> -struct sof_ipc_comp_ext {
> -	uint8_t uuid[SOF_UUID_SIZE];
> -}  __packed;
> -
>   #endif
> diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
> index a8eeffc12b24..5c10df500ffb 100644
> --- a/sound/soc/sof/sof-audio.h
> +++ b/sound/soc/sof/sof-audio.h
> @@ -110,8 +110,7 @@ struct snd_sof_widget {
>   	struct list_head list;	/* list in sdev widget list */
>   	struct snd_sof_widget *pipe_widget;
>   
> -	/* extended data for UUID components */
> -	struct sof_ipc_comp_ext comp_ext;
> +	u8 uuid[SOF_UUID_SIZE];

Can this be uuid_t perhaps?

>   
>   	void *private;		/* core does not touch this */
>   };
> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> index 41927e99ace2..45bac1ac9fdd 100644
> --- a/sound/soc/sof/topology.c
> +++ b/sound/soc/sof/topology.c
> @@ -743,7 +743,7 @@ static const struct sof_topology_token core_tokens[] = {
>   static const struct sof_topology_token comp_ext_tokens[] = {
>   	{SOF_TKN_COMP_UUID,
>   		SND_SOC_TPLG_TUPLE_TYPE_UUID, get_token_uuid,
> -		offsetof(struct sof_ipc_comp_ext, uuid)},
> +		offsetof(struct snd_sof_widget, uuid)},
>   };
>   
>   /*
> @@ -1419,16 +1419,17 @@ static int sof_connect_dai_widget(struct snd_soc_component *scomp,
>    *
>    * Return: The pointer to the new allocated component, NULL if failed.
>    */
> -static struct sof_ipc_comp *sof_comp_alloc(struct snd_sof_widget *swidget,
> -					   size_t *ipc_size, int index)
> +static struct sof_ipc_comp *sof_comp_alloc(struct snd_sof_widget *swidget, size_t *ipc_size,
> +					   int index)
>   {
>   	u8 nil_uuid[SOF_UUID_SIZE] = {0};
>   	struct sof_ipc_comp *comp;
>   	size_t total_size = *ipc_size;
> +	size_t ext_size = sizeof(swidget->uuid);
>   
>   	/* only non-zero UUID is valid */
> -	if (memcmp(&swidget->comp_ext, nil_uuid, SOF_UUID_SIZE))
> -		total_size += sizeof(swidget->comp_ext);
> +	if (memcmp(swidget->uuid, nil_uuid, SOF_UUID_SIZE))
> +		total_size += ext_size;

And if you change type above then uuid_is_null(swidget->uuid) here?

>   
>   	comp = kzalloc(total_size, GFP_KERNEL);
>   	if (!comp)
> @@ -1444,8 +1445,8 @@ static struct sof_ipc_comp *sof_comp_alloc(struct snd_sof_widget *swidget,
>   	/* handle the extended data if needed */
>   	if (total_size > *ipc_size) {
>   		/* append extended data to the end of the component */
> -		memcpy((u8 *)comp + *ipc_size, &swidget->comp_ext, sizeof(swidget->comp_ext));
> -		comp->ext_data_length = sizeof(swidget->comp_ext);
> +		memcpy((u8 *)comp + *ipc_size, swidget->uuid, ext_size);
and uuid_copy() here?

> +		comp->ext_data_length = ext_size;
>   	}
>   
>   	/* update ipc_size and return */
> @@ -2276,9 +2277,8 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
>   
>   	swidget->core = comp.core;
>   
> -	ret = sof_parse_tokens(scomp, &swidget->comp_ext, comp_ext_tokens,
> -			       ARRAY_SIZE(comp_ext_tokens), tw->priv.array,
> -			       le32_to_cpu(tw->priv.size));
> +	ret = sof_parse_tokens(scomp, swidget, comp_ext_tokens, ARRAY_SIZE(comp_ext_tokens),
> +			       tw->priv.array, le32_to_cpu(tw->priv.size));
>   	if (ret != 0) {
>   		dev_err(scomp->dev, "error: parsing comp_ext_tokens failed %d\n",
>   			ret);

