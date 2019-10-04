Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5E6CC4D7
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Oct 2019 23:34:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C9951684;
	Fri,  4 Oct 2019 23:33:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C9951684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570224870;
	bh=eLMoizODRVknhu2ULbh81PZzYwZm2Oime7vvZ8O8JAM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=raHx0tVX+Zc6w9NNIv4WXKvk53hVmnm6DJ9dzawJZghM+mMttXyj27mQtlpu0V4y9
	 tZipIyWxRbg6/3ZLKA2h4W28EtE6KldwULndRa2x0gOqulGssVc01ClwAz3L92iy4Y
	 Xkq85vTe6b943zTcVYClO+Q8zr0eXYHfI8JSXBqs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7B22F80377;
	Fri,  4 Oct 2019 23:32:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E1D1F80391; Fri,  4 Oct 2019 23:32:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69E49F800C2
 for <alsa-devel@alsa-project.org>; Fri,  4 Oct 2019 23:32:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69E49F800C2
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Oct 2019 14:32:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,257,1566889200"; d="scan'208";a="204438288"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga002.jf.intel.com with ESMTP; 04 Oct 2019 14:32:35 -0700
Received: from omukherj-mobl4.amr.corp.intel.com (unknown [10.251.29.2])
 by linux.intel.com (Postfix) with ESMTP id 628CF580332;
 Fri,  4 Oct 2019 14:32:35 -0700 (PDT)
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20191004154127.28459-1-ranjani.sridharan@linux.intel.com>
 <20191004154127.28459-2-ranjani.sridharan@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ec51107d-f765-9308-cb02-11fd32817fc7@linux.intel.com>
Date: Fri, 4 Oct 2019 16:32:34 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191004154127.28459-2-ranjani.sridharan@linux.intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com
Subject: Re: [alsa-devel] [RFC PATCH 1/2] ASoC: pcm: update FE/BE trigger
 order based on the command
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

On 10/4/19 8:41 AM, Ranjani Sridharan wrote:
> Currently, the trigger orders SND_SOC_DPCM_TRIGGER_PRE/POST
> determine the order in which FE DAI and BE DAI are triggered.
> In the case of SND_SOC_DPCM_TRIGGER_PRE, the FE DAI is
> triggered before the BE DAI and in the case of
> SND_SOC_DPCM_TRIGGER_POST, the BE DAI is triggered before
> the FE DAI. And this order remains the same irrespective of the
> trigger command.
> 
> In the case of the SOF driver, during playback, the FW
> expects the BE DAI to be triggered before the FE DAI during
> the START trigger. The BE DAI trigger handles the starting of
> Link DMA and so it must be started before the FE DAI is started
> to prevent xruns during pause/release. This can be addressed
> by setting the trigger order for the FE dai link to
> SND_SOC_DPCM_TRIGGER_POST. But during the STOP trigger,
> the FW expects the FE DAI to be triggered before the BE DAI.
> Retaining the same order during the START and STOP commands,
> results in FW error as the DAI component in the FW is still
> active.
> 
> The issue can be fixed by mirroring the trigger order of
> FE and BE DAI's during the START and STOP trigger. So, with the
> trigger order set to SND_SOC_DPCM_TRIGGER_PRE, the FE DAI will be
> trigger first during SNDRV_PCM_TRIGGER_START/STOP/RESUME
> and the BE DAI will be triggered first during the
> STOP/SUSPEND/PAUSE commands. Conversely, with the trigger order
> set to SND_SOC_DPCM_TRIGGER_POST, the BE DAI will be triggered
> first during the SNDRV_PCM_TRIGGER_START/STOP/RESUME commands
> and the FE DAI will be triggered first during the
> SNDRV_PCM_TRIGGER_STOP/SUSPEND/PAUSE commands.
> 
> Github Issue: https://github.com/thesofproject/linux/issues/1160
> Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> ---
>   sound/soc/soc-pcm.c | 99 ++++++++++++++++++++++++++++++++-------------
>   1 file changed, 72 insertions(+), 27 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 66910500e3b6..8e5097eead27 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2340,42 +2340,85 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
>   }
>   EXPORT_SYMBOL_GPL(dpcm_be_dai_trigger);
>   
> +static int dpcm_dai_trigger_fe_first(struct snd_pcm_substream *substream,
> +				     int cmd, bool fe_first)

the function name is odd with the fe_first repeat

maybe 'dpcm_dai_trigger_fe_be' ?

> +{
> +	struct snd_soc_pcm_runtime *fe = substream->private_data;
> +	int ret;
> +
> +	/* call trigger on the frontend before the backend. */
> +	if (fe_first) {
> +		dev_dbg(fe->dev, "ASoC: pre trigger FE %s cmd %d\n",
> +			fe->dai_link->name, cmd);
> +
> +		ret = soc_pcm_trigger(substream, cmd);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
> +		return ret;
> +	}
> +
> +	/* call trigger on the frontend after the backend. */
> +	ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
> +	if (ret < 0)
> +		return ret;
> +
> +	dev_dbg(fe->dev, "ASoC: post trigger FE %s cmd %d\n",
> +		fe->dai_link->name, cmd);
> +
> +	ret = soc_pcm_trigger(substream, cmd);
> +
> +	return ret;
> +}
> +
>   static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
>   {
>   	struct snd_soc_pcm_runtime *fe = substream->private_data;
> -	int stream = substream->stream, ret;
> +	int stream = substream->stream;
> +	int ret = 0;
>   	enum snd_soc_dpcm_trigger trigger = fe->dai_link->trigger[stream];
>   
>   	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
>   
>   	switch (trigger) {
>   	case SND_SOC_DPCM_TRIGGER_PRE:
> -		/* call trigger on the frontend before the backend. */
> -
> -		dev_dbg(fe->dev, "ASoC: pre trigger FE %s cmd %d\n",
> -				fe->dai_link->name, cmd);
> -
> -		ret = soc_pcm_trigger(substream, cmd);
> -		if (ret < 0) {
> -			dev_err(fe->dev,"ASoC: trigger FE failed %d\n", ret);
> -			goto out;
> +		switch (cmd) {
> +		case SNDRV_PCM_TRIGGER_START:
> +		case SNDRV_PCM_TRIGGER_RESUME:
> +		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +			ret = dpcm_dai_trigger_fe_first(substream, cmd, true);
> +			break;
> +		case SNDRV_PCM_TRIGGER_STOP:
> +		case SNDRV_PCM_TRIGGER_SUSPEND:
> +			ret = dpcm_dai_trigger_fe_first(substream, cmd, false);
> +			break;
> +		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +			ret = dpcm_dai_trigger_fe_first(substream, cmd, false);
> +			break;

can we group these 3 cases together? The last two are identical.

> +		default:
> +			ret = -EINVAL;
> +			break;
>   		}
> -
> -		ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
>   		break;
>   	case SND_SOC_DPCM_TRIGGER_POST:
> -		/* call trigger on the frontend after the backend. */
> -
> -		ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
> -		if (ret < 0) {
> -			dev_err(fe->dev,"ASoC: trigger FE failed %d\n", ret);
> -			goto out;
> +		switch (cmd) {
> +		case SNDRV_PCM_TRIGGER_START:
> +		case SNDRV_PCM_TRIGGER_RESUME:
> +		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +			ret = dpcm_dai_trigger_fe_first(substream, cmd, false);
> +			break;
> +		case SNDRV_PCM_TRIGGER_STOP:
> +		case SNDRV_PCM_TRIGGER_SUSPEND:
> +			ret = dpcm_dai_trigger_fe_first(substream, cmd, true);
> +			break;
> +		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +			ret = dpcm_dai_trigger_fe_first(substream, cmd, true);
> +			break;

can we group these 3 cases together? The last two are identical.

> +		default:
> +			ret = -EINVAL;
> +			break;
>   		}
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
