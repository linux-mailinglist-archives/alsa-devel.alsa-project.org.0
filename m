Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF74511650
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 13:34:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B2BB1779;
	Wed, 27 Apr 2022 13:33:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B2BB1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651059250;
	bh=H2soGrJ7IEs95BnjX2SMXEQ4q7L9IO39T7vpuLtR0wU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X8ZSEoNgbAmGwOMIa+tXh8BxPBqzolPMds+8SrOSK1/OiSsZESB9J0BI9HZYhS+Os
	 aKLWHrWz93WjzKvoYivwsIGRVilarXguFWZVjtjsmGFYloPFJ51WT9HbyaQnfD1/86
	 qcpGUA/AN3adOTbkxq3QCHNkw3l2+cAAt4tC4VWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B082BF80253;
	Wed, 27 Apr 2022 13:33:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 241E9F8016E; Wed, 27 Apr 2022 13:33:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89B66F80100
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 13:32:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89B66F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lvMd9+IU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651059183; x=1682595183;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=H2soGrJ7IEs95BnjX2SMXEQ4q7L9IO39T7vpuLtR0wU=;
 b=lvMd9+IU7TBfVD/+wPcdcD+hzBncSNo1tg0OhSEXvToaaxv3VotlzN/e
 kI3t5AG22NRhO0jvjVEXzP6MVbGkTntRuDwr9IASOGSg2YCrgSpZKbObt
 edx1Nd3H6tLFp285uXugO8L2vuTpPMYX3BPPP6eeB+9TPaJOKKKp7awAC
 4+96r2uFbOCUupV9mzgVJpOoz8sdwHnglhMZnLHmJAHeUmK1OiIn+606l
 jubtx8jWFZoajFMhCLUBD/XwVP+CH3ryvlt4k1WGGhL1Ot/ybCO5rCzcN
 tzguv1YEz5UX3iLv1Joc2H8ToBxZCowx4odqtvxGKfxlloRBTd5ac/NLm g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="253280076"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="253280076"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 04:32:46 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="705503985"
Received: from rdegreef-mobl1.ger.corp.intel.com (HELO [10.252.32.27])
 ([10.252.32.27])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 04:32:43 -0700
Message-ID: <83698b90-855a-f5e0-11ba-94aba393a7b1@linux.intel.com>
Date: Wed, 27 Apr 2022 14:33:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] ASoC: SOF: ipc3-topology: Correct get_control_data for
 non bytes payload
Content-Language: en-US
To: Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20220427105253.16640-1-peter.ujfalusi@linux.intel.com>
 <YmknCrJKihRkpyTq@google.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <YmknCrJKihRkpyTq@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, cujomalainey@google.com,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org
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



On 27/04/2022 14:20, Sergey Senozhatsky wrote:
> On (22/04/27 13:52), Peter Ujfalusi wrote:
>> It is possible to craft a topology where sof_get_control_data() would do
>> out of bounds access because it expects that it is only called when the
>> payload is bytes type.
>> Confusingly it also handles other types of controls, but the payload
>> parsing implementation is only valid for bytes.
>>
>> Fix the code to count the non bytes controls and instead of storing a
>> pointer to sof_abi_hdr in sof_widget_data (which is only valid for bytes),
>> store the pointer to the data itself and add a new member to save the size
>> of the data.
>>
>> In case of non bytes controls we store the pointer to the chanv itself,
>> which is just an array of values at the end.
>>
>> Reported-by: Sergey Senozhatsky <senozhatsky@chromium.org>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> 
> Looks good to me. Thank you.
> FWIW,
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> Tested-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> 
> 
> So below is what I ended up with for 5.10. The original patch does not
> apply cleanly because -stable is missing a number of patches, so I crafted
> a backport. If it looks OK to you then we probably can send it to stable
> folks.
> 
> ---
>  sound/soc/sof/topology.c | 42 +++++++++++++++++++++++++++-------------
>  1 file changed, 29 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> index c1fc7bcf4eb5..2b80dbe427c1 100644
> --- a/sound/soc/sof/topology.c
> +++ b/sound/soc/sof/topology.c
> @@ -50,7 +50,8 @@
>  struct sof_widget_data {
>  	int ctrl_type;
>  	int ipc_cmd;
> -	struct sof_abi_hdr *pdata;
> +	void *pdata;
> +	size_t pdata_size;
>  	struct snd_sof_control *control;
>  };
>  
> @@ -2100,6 +2101,7 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
>  				size_t *size)
>  {
>  	const struct snd_kcontrol_new *kc;
> +	struct sof_ipc_ctrl_data *cdata;
>  	struct soc_mixer_control *sm;
>  	struct soc_bytes_ext *sbe;
>  	struct soc_enum *se;
> @@ -2136,16 +2138,28 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
>  			return -EINVAL;
>  		}
>  
> -		wdata[i].pdata = wdata[i].control->control_data->data;
> -		if (!wdata[i].pdata)
> -			return -EINVAL;
> +		cdata = wdata[i].control->control_data;
> +		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES) {
> +			if ((void *)cdata->data == NULL)

Is there a need for casting it to void*?

> +				return -EINVAL;
>  
> -		/* make sure data is valid - data can be updated at runtime */
> -		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES &&
> -		    wdata[i].pdata->magic != SOF_ABI_MAGIC)
> -			return -EINVAL;
> +			if (cdata->data->magic != SOF_ABI_MAGIC)
> +				return -EINVAL;
> +
> +			wdata[i].pdata = cdata->data;

you want to save the cdata->data->data, so w/o the abi header stuff.

> +			wdata[i].pdata_size = cdata->data->size;
> +		} else {
> +			/* points to the control data union */
> +			wdata[i].pdata = cdata->chanv;
> +			/*
> +			 * wdata[i].control->size is calculated with struct_size
> +			 * and includes the size of struct sof_ipc_ctrl_data
> +			 */
> +			wdata[i].pdata_size = wdata[i].control->size -
> +				sizeof(struct sof_ipc_ctrl_data);
> +		}
>  
> -		*size += wdata[i].pdata->size;
> +		*size += wdata[i].pdata_size;
>  
>  		/* get data type */
>  		switch (wdata[i].control->cmd) {
> @@ -2236,10 +2250,12 @@ static int sof_process_load(struct snd_soc_component *scomp, int index,
>  	 */
>  	if (ipc_data_size) {
>  		for (i = 0; i < widget->num_kcontrols; i++) {
> -			memcpy(&process->data + offset,
> -			       wdata[i].pdata->data,
> -			       wdata[i].pdata->size);
> -			offset += wdata[i].pdata->size;
> +			if (!wdata[i].pdata_size)
> +				continue;
> +
> +			memcpy(&process->data[offset], wdata[i].pdata,
> +			       wdata[i].pdata_size);
> +			offset += wdata[i].pdata_size;
>  		}
>  	}
>  

-- 
Péter
