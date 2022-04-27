Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2891E51168C
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 14:09:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6A87836;
	Wed, 27 Apr 2022 14:08:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6A87836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651061360;
	bh=SHNBJgdtCr1Gztf4MznippaAIINv7JoIVFoMyEkI8PI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PLOZYT3kENK5YEULJESkMThOqN237kkXQM1/ImEn6gf7eoCNYyXcYKz+lCMXbXETD
	 ezQyJn9dRChtONPLpI5AHUW+OIcq54XYbjc5HH30Guq915W5trxqPRCuTc61hFctdd
	 ioMTJ1ft8WfmnrxMi5VEPUagiOiQqNy5I/n7jJ+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20784F80152;
	Wed, 27 Apr 2022 14:08:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAF17F8016E; Wed, 27 Apr 2022 14:08:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A2DBF80100
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 14:08:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A2DBF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GPiBXeMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651061297; x=1682597297;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SHNBJgdtCr1Gztf4MznippaAIINv7JoIVFoMyEkI8PI=;
 b=GPiBXeMOVWAfp1dZeTxRVtJd4CwLSInvdo2oGZ+KReL/c0ypaXlO/RWO
 4UnSl1LO2FtgkDEnEH/yQ1XlyP4mNUl7Ms0WGrwQzm6XtMTTuYrjGjxbp
 4NluCeKdrE/dhUU7dcA1/aBaRYPXWgVJn9ed8m2hBZb1zZKDQ1fQx1Vnr
 OSnSzxjrBWpEuIbqgtzAwZXDf9yf4aZ1IemA70WLJ6MbKpIVq2g7w+o+R
 snud/wB2scHcbhI/O/3r8l6N9o7vAemvndzT1z/LOObtFy58nH51N8qvD
 b13Wl77Ya0UQzamE5UCZ0mj1INwBZUdLei7N2ZECfpWzZNIA/yCaGcrXF g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="245827844"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="245827844"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 05:08:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="580560772"
Received: from rdegreef-mobl1.ger.corp.intel.com (HELO [10.252.32.27])
 ([10.252.32.27])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2022 05:08:08 -0700
Message-ID: <03a5d9ee-90ef-e4b9-5117-e59e81407453@linux.intel.com>
Date: Wed, 27 Apr 2022 15:08:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] ASoC: SOF: ipc3-topology: Correct get_control_data for
 non bytes payload
Content-Language: en-US
To: Sergey Senozhatsky <senozhatsky@chromium.org>
References: <20220427105253.16640-1-peter.ujfalusi@linux.intel.com>
 <YmknCrJKihRkpyTq@google.com>
 <83698b90-855a-f5e0-11ba-94aba393a7b1@linux.intel.com>
 <YmkvBAgBrxRAMUcO@google.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <YmkvBAgBrxRAMUcO@google.com>
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



On 27/04/2022 14:54, Sergey Senozhatsky wrote:
> On (22/04/27 14:33), Péter Ujfalusi wrote:
>>> @@ -2100,6 +2101,7 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
>>>  				size_t *size)
>>>  {
>>>  	const struct snd_kcontrol_new *kc;
>>> +	struct sof_ipc_ctrl_data *cdata;
>>>  	struct soc_mixer_control *sm;
>>>  	struct soc_bytes_ext *sbe;
>>>  	struct soc_enum *se;
>>> @@ -2136,16 +2138,28 @@ static int sof_get_control_data(struct snd_soc_component *scomp,
>>>  			return -EINVAL;
>>>  		}
>>>  
>>> -		wdata[i].pdata = wdata[i].control->control_data->data;
>>> -		if (!wdata[i].pdata)
>>> -			return -EINVAL;
>>> +		cdata = wdata[i].control->control_data;
>>> +		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES) {
>>> +			if ((void *)cdata->data == NULL)
>>
>> Is there a need for casting it to void*?
> 
> clang appears to be unhappy otherwise.
> 
> 	error: comparison of array 'cdata->data' equal to a null pointer is always false
> 
> Changing this into `if (!cdata->data)` is a little bit better as now
> 'always false' becomes 'always true'
> 
> 	error: address of array 'cdata->data' will always evaluate to 'true'

Hrm, uhm. clang is right. The check is (and was) bogus...

cdata->data is a pointer (to cdata->data[0]) which is always:
cdata + sizeof(struct sof_ipc_ctrl_data).
Checking if it is NULL or not is irrelevant and wrong. If we do not have
additional data then cdata->data points to memory which is outside of
the struct and it can be random data (might be 0, might not be).

I think we can just drop this check as we would not be here if
additional data was not allocated for the payload prior?

> 
>>> +				return -EINVAL;
>>>  
>>> -		/* make sure data is valid - data can be updated at runtime */
>>> -		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES &&
>>> -		    wdata[i].pdata->magic != SOF_ABI_MAGIC)
>>> -			return -EINVAL;
>>> +			if (cdata->data->magic != SOF_ABI_MAGIC)
>>> +				return -EINVAL;
>>> +
>>> +			wdata[i].pdata = cdata->data;
>>
>> you want to save the cdata->data->data, so w/o the abi header stuff.
> 
> Oh... good catch!
> 
> I used `wdata[i].control->control_data->data` for tests, converted this
> to cdata the very last moment.
> 
> So something like this then
> 
> ---
>  sound/soc/sof/topology.c | 42 +++++++++++++++++++++++++++-------------
>  1 file changed, 29 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> index c1fc7bcf4eb5..60b4b0053e98 100644
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
> +				return -EINVAL;
>  
> -		/* make sure data is valid - data can be updated at runtime */
> -		if (widget->dobj.widget.kcontrol_type[i] == SND_SOC_TPLG_TYPE_BYTES &&
> -		    wdata[i].pdata->magic != SOF_ABI_MAGIC)
> -			return -EINVAL;
> +			if (cdata->data->magic != SOF_ABI_MAGIC)
> +				return -EINVAL;
> +
> +			wdata[i].pdata = cdata->data->data;
> +			wdata[i].pdata_size = cdata->data->size;
> +		} else {
> +			/* points to the control data union */
> +			wdata[i].pdata = cdata->chanv;
> +			/*
> +			 * wdata[i].control->size is calculated with struct_size
> +			 * and includes the size of struct sof_ipc_ctrl_data
> +			 */
> +			wdata[i].pdata_size = wdata[i].control->size -
> +					      sizeof(struct sof_ipc_ctrl_data);
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
