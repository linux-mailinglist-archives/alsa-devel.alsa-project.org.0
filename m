Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B12701C63A7
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 00:08:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 644FA175B;
	Wed,  6 May 2020 00:07:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 644FA175B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588716520;
	bh=6I9fdNKD7QAolFOlKFdlVIhJaa1eSYSHL3Z0G5yxcuk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X16BDsRR3SVRsIgHhHAYp4kTicojJ/A6zw1BJTwsi8topqUIZ+Owei9f200SNJWvx
	 ipaslZvbMutfjsl10MA3O+AIlBuLADMT2G4P6CFcHEB9tyn5T0iFuNwpy69PBCzz3S
	 yDGmRdSkVbTN4vMDvwiI78Vru5qdxa2SKfxm0rkc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4ABBF8029A;
	Wed,  6 May 2020 00:05:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC289F800AD; Wed,  6 May 2020 00:04:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4AFFF8015F
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 00:04:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4AFFF8015F
IronPort-SDR: Re04N8G6PRZLAVS2QSoTtoO4VE+Fz/vdcJQi/B54mocQl8kboGqbbGfEq4GFxuAwa6H5hDFfAi
 0bIG/+jC/hPA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2020 15:04:23 -0700
IronPort-SDR: mHJvBhgc4IQ8ouovqAsrTneBODrs5p7qt/WQEcA44SjmraA39ZuestZRI3x+w10+Brmn7G3rdx
 8ahiAZLb8MXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,356,1583222400"; d="scan'208";a="278022614"
Received: from krogers-mobl1.amr.corp.intel.com (HELO [10.255.229.42])
 ([10.255.229.42])
 by orsmga002.jf.intel.com with ESMTP; 05 May 2020 15:04:23 -0700
Subject: Re: [PATCH 07/14] ASoC: amd: add acp3x pdm driver dma ops
To: Alex Deucher <alexdeucher@gmail.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org, vijendar.mukunda@amd.com, tiwai@suse.de
References: <20200505205327.642282-1-alexander.deucher@amd.com>
 <20200505205327.642282-8-alexander.deucher@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <fa130cbb-412d-768e-db71-15463fa58ab1@linux.intel.com>
Date: Tue, 5 May 2020 16:59:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200505205327.642282-8-alexander.deucher@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Alex Deucher <alexander.deucher@amd.com>
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



On 5/5/20 3:53 PM, Alex Deucher wrote:
> From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> 
> This patch adds PDM driver DMA operations.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> ---
>   sound/soc/amd/renoir/acp3x-pdm-dma.c | 199 +++++++++++++++++++++++++++
>   sound/soc/amd/renoir/rn_acp3x.h      |  29 ++++
>   2 files changed, 228 insertions(+)
> 
> diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
> index 4ee47a85e37e..0b5dc49f42c3 100644
> --- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
> +++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
> @@ -16,6 +16,25 @@
>   
>   #define DRV_NAME "acp_rn_pdm_dma"
>   
> +static const struct snd_pcm_hardware acp_pdm_hardware_capture = {
> +	.info = SNDRV_PCM_INFO_INTERLEAVED |
> +		SNDRV_PCM_INFO_BLOCK_TRANSFER |
> +		SNDRV_PCM_INFO_BATCH | SNDRV_PCM_INFO_MMAP |
> +		SNDRV_PCM_INFO_MMAP_VALID |
> +	    SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,

Can you actually resume from the same position? this seems odd when 
combined with INFO_BATCH which means the position is only precise at 
period boundaries.

> +	.formats = SNDRV_PCM_FMTBIT_S32_LE,
> +	.channels_min = 2,
> +	.channels_max = 2,
> +	.rates = SNDRV_PCM_RATE_48000,
> +	.rate_min = 48000,
> +	.rate_max = 48000,
> +	.buffer_bytes_max = CAPTURE_MAX_NUM_PERIODS * CAPTURE_MAX_PERIOD_SIZE,
> +	.period_bytes_min = CAPTURE_MIN_PERIOD_SIZE,
> +	.period_bytes_max = CAPTURE_MAX_PERIOD_SIZE,
> +	.periods_min = CAPTURE_MIN_NUM_PERIODS,
> +	.periods_max = CAPTURE_MAX_NUM_PERIODS,
> +};
> +

[...]

> +static snd_pcm_uframes_t acp_pdm_dma_pointer(struct snd_soc_component *comp,
> +					     struct snd_pcm_substream *stream)
> +{
> +	struct pdm_stream_instance *rtd;
> +	u32 pos, buffersize;
> +	u64 bytescount;
> +
> +	rtd = stream->runtime->private_data;
> +	pos = 0;
> +	buffersize = 0;
> +	bytescount = 0;

these 3 inits seem unnecessary?
> +
> +	buffersize = frames_to_bytes(stream->runtime,
> +				     stream->runtime->buffer_size);
> +	bytescount = acp_pdm_get_byte_count(rtd, stream->stream);
> +	if (bytescount > rtd->bytescount)
> +		bytescount -= rtd->bytescount;
> +	pos = do_div(bytescount, buffersize);
> +	return bytes_to_frames(stream->runtime, pos);
> +}
> +
