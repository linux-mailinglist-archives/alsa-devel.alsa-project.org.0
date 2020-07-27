Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8418022EEDF
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jul 2020 16:11:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15DA41698;
	Mon, 27 Jul 2020 16:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15DA41698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595859095;
	bh=kk1hwjHLEw3qP9owDur/4FOdzF/zH5ZqhhOJSNsJB18=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WDE9uUeMfGkQkZD5Nx8rtDbaEqnOK2gWdl0pVHqbTmIYlBKtpRCNffknqoK7giE+z
	 lSayKTtK002OcixzabuHTgzP2c2SA6UFX8OVrFF7Aj7ob2JL2et0OnpcX6G+GV8W4L
	 mBkYPNGOheqKNCxwLSsiDL6tOBr2SdZQfknEsvII=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D1D2F80171;
	Mon, 27 Jul 2020 16:09:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65ED5F801D9; Mon, 27 Jul 2020 16:09:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD07FF800DE
 for <alsa-devel@alsa-project.org>; Mon, 27 Jul 2020 16:09:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD07FF800DE
IronPort-SDR: L3xRdoHWCPdUtc0rX7rDOA+VtNFW2/DPvFViJkACfcju5deQPlIdfrShILlAlOOpMdyweWra6o
 T5y2MQ3sk84g==
X-IronPort-AV: E=McAfee;i="6000,8403,9694"; a="131080674"
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; d="scan'208";a="131080674"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 07:09:36 -0700
IronPort-SDR: TteHECRx2z8pElXEkov08M+PbVBtWngjBskOFUpL4BVnmJcFp1UnVeZf4MHtlf6s5hX1B1yDBG
 F8P+M2f4mb7Q==
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; d="scan'208";a="464070925"
Received: from pdewan-mobl1.amr.corp.intel.com (HELO [10.255.228.220])
 ([10.255.228.220])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2020 07:09:34 -0700
Subject: Re: [PATCH] ASoC: Intel: Atom: use hardware counter to update hw_ptr
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <1595779727-31404-1-git-send-email-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7dec7fcd-0381-d279-4dac-77c27ea5f6fe@linux.intel.com>
Date: Mon, 27 Jul 2020 09:09:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595779727-31404-1-git-send-email-brent.lu@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, linux-kernel@vger.kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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



On 7/26/20 11:08 AM, Brent Lu wrote:
> The ring buffer counter runs faster than hardware counter if the
> period size in hw_param is larger than 240. Although the differce is
> not much (around 2k frames), it causes false underrun in CRAS
> sometimes because it's using 256 frames as period size in hw_param.

All the Atom firmware assumes data chunks in multiples of 1ms (typically 
5, 10 or 20ms). I have never seen anyone use 256 frames, that's asking 
for trouble really.

it's actually the same with Skylake and SOF in most cases.

Is this a 'real' problem or a problem detected by the Chrome ALSA 
compliance tests, in the latter case that would hint at a too generic 
value of min_period.

> Using the hardware counter could provide precise hw_ptr to user space
> and avoid the false underrun in CRAS.
> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>   sound/soc/intel/atom/sst/sst_drv_interface.c | 15 +++------------
>   1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/sound/soc/intel/atom/sst/sst_drv_interface.c b/sound/soc/intel/atom/sst/sst_drv_interface.c
> index 7624953..1949ad9 100644
> --- a/sound/soc/intel/atom/sst/sst_drv_interface.c
> +++ b/sound/soc/intel/atom/sst/sst_drv_interface.c
> @@ -485,7 +485,6 @@ static inline int sst_calc_tstamp(struct intel_sst_drv *ctx,
>   		struct snd_pcm_substream *substream,
>   		struct snd_sst_tstamp *fw_tstamp)
>   {
> -	size_t delay_bytes, delay_frames;
>   	size_t buffer_sz;
>   	u32 pointer_bytes, pointer_samples;
>   
> @@ -493,22 +492,14 @@ static inline int sst_calc_tstamp(struct intel_sst_drv *ctx,
>   			fw_tstamp->ring_buffer_counter);
>   	dev_dbg(ctx->dev, "mrfld hardware_counter %llu in bytes\n",
>   			 fw_tstamp->hardware_counter);
> -	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> -		delay_bytes = (size_t) (fw_tstamp->ring_buffer_counter -
> -					fw_tstamp->hardware_counter);
> -	else
> -		delay_bytes = (size_t) (fw_tstamp->hardware_counter -
> -					fw_tstamp->ring_buffer_counter);
> -	delay_frames = bytes_to_frames(substream->runtime, delay_bytes);
> +
>   	buffer_sz = snd_pcm_lib_buffer_bytes(substream);
> -	div_u64_rem(fw_tstamp->ring_buffer_counter, buffer_sz, &pointer_bytes);
> +	div_u64_rem(fw_tstamp->hardware_counter, buffer_sz, &pointer_bytes);
>   	pointer_samples = bytes_to_samples(substream->runtime, pointer_bytes);
>   
> -	dev_dbg(ctx->dev, "pcm delay %zu in bytes\n", delay_bytes);
> -
>   	info->buffer_ptr = pointer_samples / substream->runtime->channels;
> +	info->pcm_delay = 0;

and that seems also wrong? Why would the delay be zero?

> -	info->pcm_delay = delay_frames;
>   	dev_dbg(ctx->dev, "buffer ptr %llu pcm_delay rep: %llu\n",
>   			info->buffer_ptr, info->pcm_delay);
>   	return 0;
> 
