Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D53C665E9A
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 16:00:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58FA7E8C0;
	Wed, 11 Jan 2023 15:59:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58FA7E8C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673449231;
	bh=6uBzO+A42kjsB9M6kqGtA0XHS7zpg3L5miYdlRwNzaY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jaXbPf+3+3mH6XXJxf7Jm4MdLIaeJQNMaPa3imWaHevhMLbYyeKfqtq3uVNQb2XVj
	 0Dpu7SuQTbKduc8UpXtyE8gzImYD1YfzxWbWgruC7WvnX7TWUBmJntpfECY0bjlA2w
	 RYjebwmoRpSt8Fs3BnywmeZd6qoQdWQeq+plMJXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1630AF8016E;
	Wed, 11 Jan 2023 15:59:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8ED0F8016E; Wed, 11 Jan 2023 15:59:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19568F8016E
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 15:59:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19568F8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FdhAawp7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673449169; x=1704985169;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6uBzO+A42kjsB9M6kqGtA0XHS7zpg3L5miYdlRwNzaY=;
 b=FdhAawp7ZgjqtVIJagANpQR6aigV0nkw2PpD52LVjMYSgIACRxkt6WyI
 K+j4H+swUy7yXCBrQ+BmHEmTQzDEjpptKjwpNEqzf4mpgADkiTqFyKlGH
 dQa0I0TnlYkB+1t4srFyvHYpmKiTRhOcHWjz9BnDZu+xPAofTYj/+Re0Q
 GOiXDLAwNhty6/bwd/2aqRBKGtDt3zGU7qIw5sUvQdEQ/IQD+GMnMEnov
 SJDzH8ovRSd1bQcNUtSb65QPPMb1UU9wIvXJb5mL+F+GaCcLW4xyqpjMH
 trr8hOHXO5E45rYOaNrnB50YdwMtgOLwrYUzM4T87OGIto033UfJDiyM+ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="322129508"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="322129508"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 06:59:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="765176022"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="765176022"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 06:59:22 -0800
Message-ID: <67ed911d-0a01-7f71-9258-495e2e143664@linux.intel.com>
Date: Wed, 11 Jan 2023 15:59:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 03/19] soundwire: amd: register sdw controller dai ops
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
 <20230111090222.2016499-4-Vijendar.Mukunda@amd.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230111090222.2016499-4-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mario.Limonciello@amd.com, arungopal.kondaveeti@amd.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 1/11/2023 10:02 AM, Vijendar Mukunda wrote:
> Register dai ops for two controller instances.
> 
> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---

> +static int amd_sdwc_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
> +{
> +	struct amd_sdwc_ctrl *ctrl = snd_soc_dai_get_drvdata(dai);
> +	struct sdw_amd_dma_data *dma;
> +	int ret;
> +
> +	dma = snd_soc_dai_get_dma_data(dai, substream);
> +	if (!dma)
> +		return -EIO;
> +
> +	ret = sdw_stream_remove_master(&ctrl->bus, dma->stream);
> +	if (ret < 0) {
> +		dev_err(dai->dev, "remove master from stream %s failed: %d\n",
> +			dma->stream->name, ret);
> +		return ret;
> +	}
> +	dma->hw_params = NULL;
> +	return 0;
> +}
> +
> +static int amd_set_sdw_stream(struct snd_soc_dai *dai, void *stream, int direction)
> +{
> +	struct amd_sdwc_ctrl *ctrl = snd_soc_dai_get_drvdata(dai);
> +	struct sdw_amd_dma_data *dma;
> +
> +	if (stream) {
> +		if (direction == SNDRV_PCM_STREAM_PLAYBACK)
> +			dma = dai->playback_dma_data;
> +		else
> +			dma = dai->capture_dma_data;
> +

The patch itself looks ok, but I have generic ASoC API question. Could 
we perhaps change snd_soc_dai_get_dma_data() definition, so that instead 
of it being:
static inline void *snd_soc_dai_get_dma_data(const struct snd_soc_dai 
*dai, const struct snd_pcm_substream *ss)
it would be something like:
static inline void *snd_soc_dai_get_dma_data(const struct snd_soc_dai 
*dai, int direction)

it would require converting current calls from something like
dma = snd_soc_dai_get_dma_data(dai, substream);
to
dma = snd_soc_dai_get_dma_data(dai, substream->stream);
but would also allow for use in code like above?
It would become just:
dma = snd_soc_dai_get_dma_data(dai, direction);

The more I'm looking at the soc-dai.h header the more I like this idea, 
as other functions in the area seem to pass stream/direction explicitly 
instead of substream.

Mark, what do you think?
