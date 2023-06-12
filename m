Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 669FA72CEFE
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 21:07:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48466827;
	Mon, 12 Jun 2023 21:06:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48466827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686596821;
	bh=q13GFWCmLm1MudRhPtmwrMPvjYSVl9+NylXtT1ZBIFA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IjN5pOkCGpCkIK4AE0DwEu6nWYYPaaYdQ9ycmZbWKubzaMbvtWScdFq6DJmPE5qG8
	 3Melchpc+WNDgdXl7eZJd5jWPSmxX6EBa/wj9kvPYYHOXN+zyPHaRRaqdRqb/RUMfq
	 tLsgt0SDG5dFhTa0Qub/uMf/UQvdZq5DDOvtsS+A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6796BF80132; Mon, 12 Jun 2023 21:06:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB07FF80132;
	Mon, 12 Jun 2023 21:06:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23EAEF80155; Mon, 12 Jun 2023 21:06:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0DB1CF800ED
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 21:05:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DB1CF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CiLWfAow
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686596761; x=1718132761;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=q13GFWCmLm1MudRhPtmwrMPvjYSVl9+NylXtT1ZBIFA=;
  b=CiLWfAow9dl408bSh8hmt7St0ZQUFbOt1CUJiFEDF5sy5DQd5LaUcEWc
   qdxyJMVx9nSIcaB5imX/YS3jf3attp6YydjD28q80iHHuK3cb01RRKi1X
   vXVNOsgeJx5Hn4n6Zu1jjwaHqihWXG29CPOXhqE+0c5HryR9CKjfKf0QX
   OP6l3TksyY7KpRtr7yxidQBMpgS561yYCs+e3QCprbygVLEJYUfJpMg8a
   OpR4kyXf/eZP10h249+Fh4XwDmzOcFitmA+UwcTEk1i6yX8Yx+npzi/wG
   4RHug5tLvS4Yw7RRfS9mk6ku0+nemHQ2SiFyLfzKYfw2j7ZUyMv5Gx02b
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="338499167"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400";
   d="scan'208";a="338499167"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 12:05:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="776503213"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400";
   d="scan'208";a="776503213"
Received: from atulpuri-mobl1.amr.corp.intel.com (HELO [10.212.234.150])
 ([10.212.234.150])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2023 12:05:56 -0700
Message-ID: <0dbd1c24-0006-7956-9b82-780c7f005927@linux.intel.com>
Date: Mon, 12 Jun 2023 13:06:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH V4 4/9] ASoC: amd: ps: add SoundWire dma driver dma ops
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230612095903.2113464-1-Vijendar.Mukunda@amd.com>
 <20230612095903.2113464-5-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230612095903.2113464-5-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: K45AFB2VBUMBINXYBPLDEV3HEWK5NUQW
X-Message-ID-Hash: K45AFB2VBUMBINXYBPLDEV3HEWK5NUQW
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K45AFB2VBUMBINXYBPLDEV3HEWK5NUQW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +#define SDW_PLAYBACK_MIN_NUM_PERIODS    2
> +#define SDW_PLAYBACK_MAX_NUM_PERIODS    8
> +#define SDW_PLAYBACK_MAX_PERIOD_SIZE    8192

that's a fairly small max period. That's 21ms for 2ch S32_LE 48kHz.

Does this come from specific limitations or is this an arbitrary number?

A comment on this wouldn't hurt.

> +static u32 sdw0_dma_enable_reg[ACP63_SDW0_DMA_MAX_STREAMS] = {
> +	ACP_SW0_AUDIO0_TX_EN,
> +	ACP_SW0_AUDIO1_TX_EN,
> +	ACP_SW0_AUDIO2_TX_EN,
> +	ACP_SW0_AUDIO0_RX_EN,
> +	ACP_SW0_AUDIO1_RX_EN,
> +	ACP_SW0_AUDIO2_RX_EN,
> +};
> +
> +static u32 sdw1_dma_enable_reg[ACP63_SDW1_DMA_MAX_STREAMS] = {
> +	ACP_SW1_AUDIO1_TX_EN,
> +	ACP_SW1_AUDIO1_RX_EN,
> +};

Still no explanation as to why SDW0 indices start at zero and SDW1
indices start at one?

> +
> +static const struct snd_pcm_hardware acp63_sdw_hardware_playback = {
> +	.info = SNDRV_PCM_INFO_INTERLEAVED |
> +		SNDRV_PCM_INFO_BLOCK_TRANSFER |
> +		SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
> +		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
> +	.formats = SNDRV_PCM_FMTBIT_S16_LE |  SNDRV_PCM_FMTBIT_S8 |
> +		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE,
> +	.channels_min = 2,
> +	.channels_max = 2,
> +	.rates = SNDRV_PCM_RATE_48000,
> +	.rate_min = 48000,
> +	.rate_max = 48000,
> +	.buffer_bytes_max = SDW_PLAYBACK_MAX_NUM_PERIODS * SDW_PLAYBACK_MAX_PERIOD_SIZE,
> +	.period_bytes_min = SDW_PLAYBACK_MIN_PERIOD_SIZE,
> +	.period_bytes_max = SDW_PLAYBACK_MAX_PERIOD_SIZE,
> +	.periods_min = SDW_PLAYBACK_MIN_NUM_PERIODS,
> +	.periods_max = SDW_PLAYBACK_MAX_NUM_PERIODS,
> +};
> +
> +static const struct snd_pcm_hardware acp63_sdw_hardware_capture = {
> +	.info = SNDRV_PCM_INFO_INTERLEAVED |
> +		SNDRV_PCM_INFO_BLOCK_TRANSFER |
> +		SNDRV_PCM_INFO_MMAP |
> +		SNDRV_PCM_INFO_MMAP_VALID |
> +		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
> +	.formats = SNDRV_PCM_FMTBIT_S16_LE |  SNDRV_PCM_FMTBIT_S8 |
> +		   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE,
> +	.channels_min = 2,
> +	.channels_max = 2,
> +	.rates = SNDRV_PCM_RATE_48000,
> +	.rate_min = 48000,
> +	.rate_max = 48000,
> +	.buffer_bytes_max = SDW_CAPTURE_MAX_NUM_PERIODS * SDW_CAPTURE_MAX_PERIOD_SIZE,
> +	.period_bytes_min = SDW_CAPTURE_MIN_PERIOD_SIZE,
> +	.period_bytes_max = SDW_CAPTURE_MAX_PERIOD_SIZE,
> +	.periods_min = SDW_CAPTURE_MIN_NUM_PERIODS,
> +	.periods_max = SDW_CAPTURE_MAX_NUM_PERIODS,
> +};

> +static int acp63_sdw_dma_open(struct snd_soc_component *component,
> +			      struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime;
> +	struct acp_sdw_dma_stream *stream;
> +	struct snd_soc_dai *cpu_dai;
> +	struct amd_sdw_manager *amd_manager;
> +	struct snd_soc_pcm_runtime *prtd = substream->private_data;
> +	int ret;
> +
> +	runtime = substream->runtime;
> +	cpu_dai = asoc_rtd_to_cpu(prtd, 0);
> +	amd_manager = snd_soc_dai_get_drvdata(cpu_dai);
> +	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
> +	if (!stream)
> +		return -ENOMEM;
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		runtime->hw = acp63_sdw_hardware_playback;
> +	else
> +		runtime->hw = acp63_sdw_hardware_capture;
> +	ret = snd_pcm_hw_constraint_integer(runtime,
> +					    SNDRV_PCM_HW_PARAM_PERIODS);
> +	if (ret < 0) {
> +		dev_err(component->dev, "set integer constraint failed\n");
> +		kfree(stream);
> +		return ret;
> +	}

it's not clear to me why you have to add this specific constraint, isn't
this checked already with the sdw_hardware_playback information.

> +static u64 acp63_sdw_get_byte_count(struct acp_sdw_dma_stream *stream, void __iomem *acp_base)
> +{
> +	union acp_sdw_dma_count byte_count;
> +	u32 pos_low_reg, pos_high_reg;
> +
> +	byte_count.bytescount = 0;
> +	switch (stream->instance) {
> +	case ACP_SDW0:
> +		pos_low_reg = sdw0_dma_ring_buf_reg[stream->stream_id].pos_low_reg;
> +		pos_high_reg = sdw0_dma_ring_buf_reg[stream->stream_id].pos_high_reg;
> +		break;
> +	case ACP_SDW1:
> +		pos_low_reg = sdw1_dma_ring_buf_reg[stream->stream_id].pos_low_reg;
> +		pos_high_reg = sdw1_dma_ring_buf_reg[stream->stream_id].pos_high_reg;
> +		break;
> +	default:
> +		return -EINVAL;

returning -EINVAL as a u64 doesn't seem quite right to me?

> +	}
> +	if (pos_low_reg) {
> +		byte_count.bcount.high = readl(acp_base + pos_high_reg);
> +		byte_count.bcount.low = readl(acp_base + pos_low_reg);
> +	}
> +	return byte_count.bytescount;
> +}
