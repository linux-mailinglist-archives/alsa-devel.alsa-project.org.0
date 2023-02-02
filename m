Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DF8687DD3
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 13:47:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8E9D1DB;
	Thu,  2 Feb 2023 13:47:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8E9D1DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675342077;
	bh=6izubcMgg/kugVDUTtRIJy0rdH8mjee8Gdhn/HyyNJk=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=beo1wZqHLoyNgDIKtpKfZzpFufYr/eQl5HWNqI2W//EdsF1zmb13tbNQ0qGZenSpV
	 VxCgRfX1mpwB/qpuZlSMIlKBy6bfmBVcHtpv5o08WfqrBXFXBvXoowQ8RG0oRDyN1Q
	 NSKG5VREnI3yFsnivMjBT3BMb5dytxfnBKxHVTfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7784F804DF;
	Thu,  2 Feb 2023 13:46:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E382F804C2; Thu,  2 Feb 2023 13:46:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61340F800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 13:46:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61340F800ED
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gZxFG3yj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675342007; x=1706878007;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=6izubcMgg/kugVDUTtRIJy0rdH8mjee8Gdhn/HyyNJk=;
 b=gZxFG3yjnF+4PskDDWaEXsGbNWdGx9OzSeQHEo5CL4x5l0g/ObmO90GI
 Y6LidASXT1AEyDF5iCCMbqBrkSVz068I42llx3RnOXJJ7A3eN9W4lYnus
 Hj9b4gzxZdeBWwy4MIQZedqgcMF971S0w8kZ5ZG/MBNndOmwKA6JcSagT
 3BAY8XK4S1Or89lUzK3ZYxy81ITXNEPcM4ERk5DacTsRY9xBVrUEts6tx
 Dgb1g3JQEhRufVAVAi9zrgWC66ecKCIkwpGtqqE3S1lbcoIX5OU9IbPyn
 9prw8aOpjhuNmxfnguKRwS4h5ZosLpCdbA2636wt0n05WAI7ps4CRpqt3 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="390825675"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="390825675"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 04:46:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="615270260"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="615270260"
Received: from jpdamery-mobl.ger.corp.intel.com (HELO [10.252.1.104])
 ([10.252.1.104])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 04:46:38 -0800
Message-ID: <6d0845f5-c100-905a-96e2-44aebe5e806e@linux.intel.com>
Date: Thu, 2 Feb 2023 14:46:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v2 9/9] ASoC: SOF: ipc4-pcm: add delay function support
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz
References: <20230202111123.25231-1-peter.ujfalusi@linux.intel.com>
 <20230202111123.25231-10-peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230202111123.25231-10-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 02/02/2023 13:11, Peter Ujfalusi wrote:
> From: Rander Wang <rander.wang@intel.com>
> 
> The delay function is used to calculate the difference
> between hw_ptr and dai dma position. I2S, DMIC and SDW will
> use dai dma position in shared SRAM window to calculate the
> delay. HDaudio will retrieve dai dma position from host mmio memory
> space since it doesn't support LLP counter reported by firmware.
> 
> In two cases dai dma position is inaccurate for delay calculation
> (1) dai pipeline is started before host pipeline
> (2) multiple streams mixed into one. Each stream has the same dai
>     dma position
> Firmware calculates correct stream_start_offset for all cases including
> above two. Driver subtracts stream_start_offset from dai dma position to
> get accurate one.
> 
> Signed-off-by: Rander Wang <rander.wang@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
>  sound/soc/sof/ipc4-pcm.c | 109 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 109 insertions(+)
> 
> diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
> index a457d4d479d8..c9c0f0888d9c 100644
> --- a/sound/soc/sof/ipc4-pcm.c
> +++ b/sound/soc/sof/ipc4-pcm.c
> @@ -10,6 +10,7 @@
>  #include <sound/sof/ipc4/header.h>
>  #include "sof-audio.h"
>  #include "sof-priv.h"
> +#include "ops.h"
>  #include "ipc4-priv.h"
>  #include "ipc4-topology.h"
>  #include "ipc4-fw-reg.h"
> @@ -556,6 +557,113 @@ static int sof_ipc4_pcm_hw_params(struct snd_soc_component *component,
>  	return 0;
>  }
>  
> +static int sof_ipc4_get_stream_start_offset(struct snd_sof_dev *sdev,
> +					    struct snd_pcm_substream *substream,
> +					    struct snd_sof_pcm_stream *stream,
> +					    struct sof_ipc4_timestamp_info *time_info)
> +{
> +	struct sof_ipc4_copier *host_copier = time_info->host_copier;
> +	struct sof_ipc4_copier *dai_copier = time_info->dai_copier;
> +	struct sof_ipc4_pipeline_registers ppl_reg;
> +	u64 stream_start_position;
> +	u32 dai_sample_size;
> +	u32 ch, node_index;
> +	u32 offset;
> +
> +	if (!host_copier || !dai_copier)
> +		return -EINVAL;
> +
> +	if (host_copier->data.gtw_cfg.node_id == SOF_IPC4_INVALID_NODE_ID)
> +		return -EINVAL;
> +
> +	node_index = SOF_IPC4_NODE_INDEX(host_copier->data.gtw_cfg.node_id);
> +	offset = offsetof(struct sof_ipc4_fw_registers, pipeline_regs) + node_index * sizeof(ppl_reg);
> +	sof_mailbox_read(sdev, sdev->fw_info_box.offset + offset, &ppl_reg, sizeof(ppl_reg));
> +	if (ppl_reg.stream_start_offset == SOF_IPC4_INVALID_STREAM_POSITION)
> +		return -EINVAL;
> +
> +	stream_start_position = ppl_reg.stream_start_offset;
> +	ch = dai_copier->data.out_format.fmt_cfg;
> +	ch = SOF_IPC4_AUDIO_FORMAT_CFG_CHANNELS_COUNT(ch);
> +	dai_sample_size = (dai_copier->data.out_format.bit_depth >> 3) * ch;
> +	/* convert offset to sample count */
> +	do_div(stream_start_position, dai_sample_size);
> +	time_info->stream_start_offset = stream_start_position;
> +
> +	return 0;
> +}
> +
> +static snd_pcm_sframes_t sof_ipc4_pcm_delay(struct snd_soc_component *component,
> +					    struct snd_pcm_substream *substream)
> +{
> +	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
> +	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +	struct sof_ipc4_timestamp_info *time_info;
> +	struct sof_ipc4_llp_reading_slot llp;
> +	snd_pcm_uframes_t head_ptr, tail_ptr;
> +	struct snd_sof_pcm_stream *stream;
> +	struct snd_sof_pcm *spcm;
> +	u64 tmp_ptr;
> +	int ret;
> +
> +	spcm = snd_sof_find_spcm_dai(component, rtd);
> +	if (!spcm)
> +		return 0;
> +
> +	stream = &spcm->stream[substream->stream];
> +	time_info = stream->private;
> +	if (!time_info)
> +		return 0;
> +
> +	/*
> +	 * stream_start_offset is updated to memory window by FW based on
> +	 * pipeline statistics and it may be invalid if host query happens before
> +	 * the statistics is complete. And it will not change after the first initiailization.
> +	 */
> +	if (time_info->stream_start_offset == SOF_IPC4_INVALID_STREAM_POSITION) {
> +		ret = sof_ipc4_get_stream_start_offset(sdev, substream, stream, time_info);
> +		if (ret < 0)
> +			return 0;
> +	}
> +
> +	/*
> +	 * HDaudio links don't support the LLP counter reported by firmware
> +	 * the link position is read directly from hardware registers.
> +	 */
> +	if (!time_info->llp_offset) {
> +		tmp_ptr = snd_sof_pcm_get_stream_position(sdev, component, substream);
> +		if (!tmp_ptr)
> +			return 0;
> +	} else {
> +		sof_mailbox_read(sdev, time_info->llp_offset, &llp, sizeof(llp));
> +		tmp_ptr = ((u64)llp.reading.llp_u << 32) | llp.reading.llp_l;
> +	}
> +
> +	/* In two cases dai dma position is not accurate
> +	 * (1) dai pipeline is started before host pipeline
> +	 * (2) multiple streams mixed into one. Each stream has the same dai dma position
> +	 *
> +	 * Firmware calculates correct stream_start_offset for all cases including above two.
> +	 * Driver subtracts stream_start_offset from dai dma position to get accurate one
> +	 */
> +	tmp_ptr -= time_info->stream_start_offset;
> +
> +	/* Calculate the delay taking into account that both pointer can wrap */
> +	tmp_ptr %= substream->runtime->boundary;
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		head_ptr = substream->runtime->status->hw_ptr;
> +		tail_ptr = tmp_ptr;
> +	} else {
> +		head_ptr = tmp_ptr;
> +		tail_ptr = substream->runtime->status->hw_ptr;
> +	}
> +
> +	if (head_ptr < tail_ptr)
> +		return substream->runtime->boundary - tail_ptr + head_ptr;
> +
> +	return head_ptr - tail_ptr;

This causes error on i386 build (reported by a CI build)?

ERROR: modpost: "__umoddi3" [sound/soc/sof/snd-sof.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:137: Module.symvers] Error 1
make: *** [Makefile:1960: modpost] Error 2
Error: Process completed with exit code 2.

I need to see it locally to fix this if ti is real.

> +}
> +
>  const struct sof_ipc_pcm_ops ipc4_pcm_ops = {
>  	.hw_params = sof_ipc4_pcm_hw_params,
>  	.trigger = sof_ipc4_pcm_trigger,
> @@ -563,4 +671,5 @@ const struct sof_ipc_pcm_ops ipc4_pcm_ops = {
>  	.dai_link_fixup = sof_ipc4_pcm_dai_link_fixup,
>  	.pcm_setup = sof_ipc4_pcm_setup,
>  	.pcm_free = sof_ipc4_pcm_free,
> +	.delay = sof_ipc4_pcm_delay
>  };

-- 
Péter
