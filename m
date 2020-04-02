Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C910219C5F8
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Apr 2020 17:35:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C1581671;
	Thu,  2 Apr 2020 17:34:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C1581671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585841720;
	bh=daKTjwuqSCmfZx0DtiZH80nk7vFkbcvcaql3/uYR3uI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VIvCm2aHtMlPWJw81ftAs03wXR72IqWkUmxjB9+GVTOhiGLQkEtbz5pEgEBc3aEvw
	 SRVCxkQcEaHsySEhgSuhgwj/8nao+E9Gvsg1qHn42M9XWlZdqXMFjd6eoWLo4NZfT2
	 wIgroyUEZXQ5VZkjg3i0zOcufT+Fge4kV3jnK3Qw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E950F80140;
	Thu,  2 Apr 2020 17:33:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1972F80146; Thu,  2 Apr 2020 17:33:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A25FF80088
 for <alsa-devel@alsa-project.org>; Thu,  2 Apr 2020 17:33:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A25FF80088
IronPort-SDR: 0H/+SLHNj4lw/1huoJOtE+3xvlsYc4Vx2srCHL5kDc5y+6g8gw/6gLWCFqv15P8zxXfflCCpxf
 a8Ds0H1CwaRw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 08:33:26 -0700
IronPort-SDR: G/RqJIy0+YRlIb938MdKHaWwQN7/fiMy/scGARFBISwjLGuSgDSA1CiS0VXXHmuIV3Vwvv+bKP
 Qp+9LcryNr3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,336,1580803200"; d="scan'208";a="284817025"
Received: from unknown (HELO [10.212.235.17]) ([10.212.235.17])
 by fmsmga002.fm.intel.com with ESMTP; 02 Apr 2020 08:33:25 -0700
Subject: Re: [PATCH] ASoC: Intel: Multiple I/O PCM format support for pipe
To: Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200402144139.14966-1-mateusz.gorski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <72ce2849-3209-6855-1224-14a91a7c87fe@linux.intel.com>
Date: Thu, 2 Apr 2020 10:33:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200402144139.14966-1-mateusz.gorski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: cezary.rojewski@intel.com, Pavan K <pavan.k.s@intel.com>, tiwai@suse.com
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



On 4/2/20 9:41 AM, Mateusz Gorski wrote:
> If a pipe supports multiple input/output formats, kcontrol is
> created and selection of pipe input and output configuration
> is done based on control set.
> Effectively allows user to select configuration using amixer settings.

I don't get the direction, sorry.

If a platform has two digital microphones, the user could configure 4-ch 
capture - the NHLT information on number of microphones is ignored?

Or are you expecting user space (e.g. UCM) to retrieve the number of 
microphones from the card component string and program the new control 
accordingly?

> 
> Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
> Signed-off-by: S, Pavan K <pavan.k.s@intel.com>
> ---
>   include/uapi/sound/skl-tplg-interface.h |   1 +
>   sound/soc/intel/skylake/skl-topology.c  | 110 ++++++++++++++++++++++++
>   sound/soc/intel/skylake/skl-topology.h  |   1 +
>   3 files changed, 112 insertions(+)
> 
> diff --git a/include/uapi/sound/skl-tplg-interface.h b/include/uapi/sound/skl-tplg-interface.h
> index 9eee32f5e407..f2711186c81f 100644
> --- a/include/uapi/sound/skl-tplg-interface.h
> +++ b/include/uapi/sound/skl-tplg-interface.h
> @@ -18,6 +18,7 @@
>    */
>   #define SKL_CONTROL_TYPE_BYTE_TLV	0x100
>   #define SKL_CONTROL_TYPE_MIC_SELECT	0x102
> +#define SKL_CONTROL_TYPE_MULTI_IO_SELECT	0x103
>   
>   #define HDA_SST_CFG_MAX	900 /* size of copier cfg*/
>   #define MAX_IN_QUEUE 8
> diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
> index 344b06df0e15..de60b6873666 100644
> --- a/sound/soc/intel/skylake/skl-topology.c
> +++ b/sound/soc/intel/skylake/skl-topology.c
> @@ -578,6 +578,38 @@ static int skl_tplg_unload_pipe_modules(struct skl_dev *skl,
>   	return ret;
>   }
>   
> +static bool skl_tplg_is_multi_fmt(struct skl_dev *skl, struct skl_pipe *pipe)
> +{
> +	int i;
> +	struct skl_pipe_fmt *cur_fmt;
> +	struct skl_pipe_fmt *next_fmt;
> +
> +	if (pipe->nr_cfgs <= 1)
> +		return false;
> +
> +	if (pipe->conn_type != SKL_PIPE_CONN_TYPE_FE)
> +		return true;
> +
> +	for (i = 0; i < pipe->nr_cfgs - 1; i++) {
> +		if (pipe->direction == SNDRV_PCM_STREAM_PLAYBACK) {
> +			cur_fmt = &pipe->configs[i].out_fmt;
> +			next_fmt = &pipe->configs[i+1].out_fmt;
> +		} else {
> +			cur_fmt = &pipe->configs[i].in_fmt;
> +			next_fmt = &pipe->configs[i+1].in_fmt;
> +		}
> +
> +		if (!CHECK_HW_PARAMS(cur_fmt->channels, cur_fmt->freq,
> +				     cur_fmt->bps,
> +				     next_fmt->channels,
> +				     next_fmt->freq,
> +				     next_fmt->bps))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>   /*
>    * Here, we select pipe format based on the pipe type and pipe
>    * direction to determine the current config index for the pipeline.
> @@ -600,6 +632,14 @@ skl_tplg_get_pipe_config(struct skl_dev *skl, struct skl_module_cfg *mconfig)
>   		return 0;
>   	}
>   
> +	if (skl_tplg_is_multi_fmt(skl, pipe)) {
> +		pipe->cur_config_idx = pipe->pipe_config_idx;
> +		pipe->memory_pages = pconfig->mem_pages;
> +		dev_dbg(skl->dev, "found pipe config idx:%d\n",
> +			pipe->cur_config_idx);
> +		return 0;
> +	}
> +
>   	if (pipe->conn_type == SKL_PIPE_CONN_TYPE_NONE) {
>   		dev_dbg(skl->dev, "No conn_type detected, take 0th config\n");
>   		pipe->cur_config_idx = 0;
> @@ -1314,6 +1354,71 @@ static int skl_tplg_pga_event(struct snd_soc_dapm_widget *w,
>   	return 0;
>   }
>   
> +static int skl_tplg_multi_config_get(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct hdac_bus *bus = snd_soc_component_get_drvdata(component);
> +	struct skl_dev *skl = bus_to_skl(bus);
> +	struct skl_pipeline *ppl;
> +	struct skl_pipe *pipe = NULL;
> +	u32 *pipe_id;
> +	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
> +
> +	if (!ec)
> +		return -EINVAL;
> +
> +	pipe_id = ec->dobj.private;
> +
> +	list_for_each_entry(ppl, &skl->ppl_list, node) {
> +		if (ppl->pipe->ppl_id == *pipe_id) {
> +			pipe = ppl->pipe;
> +			break;
> +		}
> +	}
> +	if (!pipe)
> +		return -EIO;
> +
> +	ucontrol->value.enumerated.item[0]  =  pipe->pipe_config_idx;
> +
> +	return 0;
> +}
> +
> +static int skl_tplg_multi_config_set(struct snd_kcontrol *kcontrol,
> +			struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +	       snd_soc_kcontrol_component(kcontrol);
> +	struct hdac_bus *bus = snd_soc_component_get_drvdata(component);
> +	struct skl_dev *skl = bus_to_skl(bus);
> +	struct skl_pipeline *ppl;
> +	struct skl_pipe *pipe = NULL;
> +	struct soc_enum *ec = (struct soc_enum *)kcontrol->private_value;
> +	u32 *pipe_id;
> +
> +	if (!ec)
> +		return -EINVAL;
> +
> +	if (ucontrol->value.enumerated.item[0] > ec->items)
> +		return -EINVAL;
> +
> +	pipe_id = ec->dobj.private;
> +
> +	list_for_each_entry(ppl, &skl->ppl_list, node) {
> +		if (ppl->pipe->ppl_id == *pipe_id) {
> +			pipe = ppl->pipe;
> +			break;
> +		}
> +	}
> +	if (!pipe)
> +		return -EIO;
> +
> +	pipe->pipe_config_idx = ucontrol->value.enumerated.item[0];
> +
> +	return 0;
> +}
> +
>   static int skl_tplg_tlv_control_get(struct snd_kcontrol *kcontrol,
>   			unsigned int __user *data, unsigned int size)
>   {
> @@ -1853,6 +1958,11 @@ static const struct snd_soc_tplg_kcontrol_ops skl_tplg_kcontrol_ops[] = {
>   		.get = skl_tplg_mic_control_get,
>   		.put = skl_tplg_mic_control_set,
>   	},
> +	{
> +		.id = SKL_CONTROL_TYPE_MULTI_IO_SELECT,
> +		.get = skl_tplg_multi_config_get,
> +		.put = skl_tplg_multi_config_set,
> +	},
>   };
>   
>   static int skl_tplg_fill_pipe_cfg(struct device *dev,
> diff --git a/sound/soc/intel/skylake/skl-topology.h b/sound/soc/intel/skylake/skl-topology.h
> index e967800dbb62..06576147cc29 100644
> --- a/sound/soc/intel/skylake/skl-topology.h
> +++ b/sound/soc/intel/skylake/skl-topology.h
> @@ -306,6 +306,7 @@ struct skl_pipe {
>   	struct skl_path_config configs[SKL_MAX_PATH_CONFIGS];
>   	struct list_head w_list;
>   	bool passthru;
> +	u32 pipe_config_idx;
>   };
>   
>   enum skl_module_state {
> 
