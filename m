Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1638A72480E
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 17:42:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02D3F84D;
	Tue,  6 Jun 2023 17:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02D3F84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686066164;
	bh=I2633yDyTf08CYs+GWR0b+lShf5xiYi7UgFoFUgHPII=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UIzeKnnletcIyvF7MK/71v+e2v56GkE+Bky1YZyeC7ACgxPN35K4TInMLaQUzCtxG
	 daoLFhc1RlDrTXGRwOrerlEUUkxHba3HQmPhdH40QBSWyUiwhaUbbCJGAUxLJAUAFm
	 f/Yiri4PFYT6i+cqAUALQF+z+gtYXmGOM3wE1cAA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A944F80589; Tue,  6 Jun 2023 17:40:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D13DCF80587;
	Tue,  6 Jun 2023 17:40:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B719AF8057C; Tue,  6 Jun 2023 17:40:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7F841F80544
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 17:40:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F841F80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=n32ZjRoE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686066041; x=1717602041;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=I2633yDyTf08CYs+GWR0b+lShf5xiYi7UgFoFUgHPII=;
  b=n32ZjRoEmJGnlwFEyBeh2KusrJ9lh3nnA7qNnL0QIg9YvJdaJyh+suy+
   y/PS3q5fy3cMju4eNaUg9xiPqNUFTXoWLxPuiwNICymhcPCrNS1QS+9GW
   cvCMPaIyIbN3j8cPKejhoijRCzVDnawzTGIN8o9jHPZNV0PcjdZDfT/SE
   wXwucxZyyWX35vOzqxHG+PhYrQzco8YsgfFWDeo53PiwR8ycmVvdVqSDx
   1Te7uVZoDSdCcKFlFjIRDrY74NjlLvaxjuOHOOh6OAQ4TQGfx9yI1RxTW
   9+/wWbBZyW9Bne497vLtxIsE6D5JF8Bftt8dJVAQEiPh0tv2/DQ75+Y9f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="422550303"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400";
   d="scan'208";a="422550303"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 08:39:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="955816533"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400";
   d="scan'208";a="955816533"
Received: from pdonvalk-mobl2.amr.corp.intel.com (HELO [10.255.231.168])
 ([10.255.231.168])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 08:39:17 -0700
Message-ID: <7ed3e421-ad04-746a-e252-45bc83f76256@linux.intel.com>
Date: Tue, 6 Jun 2023 10:38:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH V3 4/9] ASoC: amd: ps: add SoundWire dma driver dma ops
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Mastan.Katragadda@amd.com,
 Arungopal.kondaveeti@amd.com, mario.limonciello@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20230606060724.2038680-1-Vijendar.Mukunda@amd.com>
 <20230606060724.2038680-5-Vijendar.Mukunda@amd.com>
Content-Language: en-US
In-Reply-To: <20230606060724.2038680-5-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AVE6YDSN3I5JSPIXOHMKPJRDY2AFB7QX
X-Message-ID-Hash: AVE6YDSN3I5JSPIXOHMKPJRDY2AFB7QX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AVE6YDSN3I5JSPIXOHMKPJRDY2AFB7QX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +static int acp63_sdw_dma_start(struct snd_pcm_substream *substream, void __iomem *acp_base)
> +{
> +	struct acp_sdw_dma_stream *stream;
> +	u32 stream_id;
> +	u32 sdw_dma_en_reg;
> +	u32 sdw_dma_en_stat_reg;
> +	u32 sdw_dma_stat;
> +
> +	stream = substream->runtime->private_data;
> +	stream_id = stream->stream_id;
> +	switch (stream->instance) {
> +	case ACP_SDW0:
> +		sdw_dma_en_reg = sdw0_dma_enable_reg[stream_id];
> +		break;
> +	case ACP_SDW1:
> +		sdw_dma_en_reg = sdw1_dma_enable_reg[stream_id];
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	writel(0x01, acp_base + sdw_dma_en_reg);
> +	sdw_dma_en_stat_reg = sdw_dma_en_reg + 4;
> +	return readl_poll_timeout(acp_base + sdw_dma_en_stat_reg, sdw_dma_stat,
> +				  (sdw_dma_stat & BIT(0)), ACP_DELAY_US, ACP_COUNTER);
> +}
> +
> +static int acp63_sdw_dma_stop(struct snd_pcm_substream *substream, void __iomem *acp_base)
> +{
> +	struct acp_sdw_dma_stream *stream;
> +	u32 stream_id;
> +	u32 sdw_dma_en_reg;
> +	u32 sdw_dma_en_stat_reg;
> +	u32 sdw_dma_stat;
> +
> +	stream = substream->runtime->private_data;
> +	stream_id = stream->stream_id;
> +	switch (stream->instance) {
> +	case ACP_SDW0:
> +		sdw_dma_en_reg = sdw0_dma_enable_reg[stream_id];
> +		break;
> +	case ACP_SDW1:
> +		sdw_dma_en_reg = sdw1_dma_enable_reg[stream_id];
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	writel(0, acp_base + sdw_dma_en_reg);
> +	sdw_dma_en_stat_reg = sdw_dma_en_reg + 4;
> +	return readl_poll_timeout(acp_base + sdw_dma_en_stat_reg, sdw_dma_stat, !sdw_dma_stat,
> +				  ACP_DELAY_US, ACP_COUNTER);
> +}

these start/stop routines look mostly the same, except for the value to
be written in the register. Maybe they can be factored with a common
helper, e.g. acp63_sdw_dma_enable(true/false).
> +
> +static int acp63_sdw_dma_trigger(struct snd_soc_component *comp,
> +				 struct snd_pcm_substream *substream,
> +				 int cmd)
> +{
> +	struct sdw_dma_dev_data *sdw_data;
> +	int ret;
> +
> +	sdw_data = dev_get_drvdata(comp->dev);
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +		ret = acp63_sdw_dma_start(substream, sdw_data->acp_base);
> +		break;
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_STOP:
> +		ret = acp63_sdw_dma_stop(substream, sdw_data->acp_base);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +	}
> +	if (ret)
> +		dev_err(comp->dev, "trigger %d failed: %d", cmd, ret);
> +	return ret;
> +}
