Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D86A9510C05
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 00:25:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A6AD1752;
	Wed, 27 Apr 2022 00:24:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A6AD1752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651011923;
	bh=ZC+rWVco4h1TUebSuX8goG46kPfzxg8n4ok5yfFgCZY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n3uemaakW+Ja8EhiZdSWTrss+/jjl2Ot1OoveNscWcI/hQsOIUJW/hiiZW8yWc64z
	 RbmfboO4FPe+h4+LOZJ1McpMpQp3ULADg6kc+XerxVm+8bsTHi80ws1eH/h1In1VOh
	 wT+JCKQOjfE0PNaIlrC/H2BPsFL2XirKyLb/EBbk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF5D5F80511;
	Wed, 27 Apr 2022 00:23:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1BDBF804AC; Wed, 27 Apr 2022 00:23:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6811FF80152
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 00:23:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6811FF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mA582/FX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651011802; x=1682547802;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZC+rWVco4h1TUebSuX8goG46kPfzxg8n4ok5yfFgCZY=;
 b=mA582/FX4Nuj/pNPF2ROW833cIii3nRgl3bpNm/1C8ngecDiGgjKAazA
 xJM0IS/r4nWC4aMIxrf18akObrFRBUNisYjMrTjSkzU7uoDPsCFJ8I131
 a/hyYrRDwoHCTDVDmlWx4lw+oCInq+/yIG08KZJhVMsY39RSObkWGcdy4
 4B4sC327DkOFI4YJtsCUav5jX+2uxIPBGiXvV2kdpCZ6JP38zXeEX2+Kt
 eZQFMRvFDBcDKOSkV41z+UFUi9LlLMQ18DhUUKqq5Pa+V8VCm0vKTj1SK
 mmZ2cCEUtdbGDv2bas1OHkY2n05+AWFs/JWAo6s8Me0JBsuXmQwudnWIO w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="245660717"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="245660717"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 15:23:15 -0700
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; d="scan'208";a="532888605"
Received: from gkanakas-mobl.amr.corp.intel.com (HELO [10.212.152.229])
 ([10.212.152.229])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 15:23:14 -0700
Message-ID: <6331fe1d-3bbf-8ba9-bb81-c670093d41c9@linux.intel.com>
Date: Tue, 26 Apr 2022 16:45:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 05/14] ASoC: Intel: avs: HDA PCM BE operations
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-6-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220426172346.3508411-6-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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



> +static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
> +{
> +	struct avs_dma_data *data;
> +	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
> +	struct hdac_ext_stream *estream;

host_stream, estream, there seems to be multiple naming conventions for the same thing?

> +	struct hdac_ext_link *link;
> +	struct hda_codec *codec;
> +
> +	dev_dbg(dai->dev, "%s: %s\n", __func__, dai->name);
> +
> +	data = snd_soc_dai_get_dma_data(dai, substream);
> +	if (!data->path)
> +		return 0;
> +
> +	estream = substream->runtime->private_data;
> +	estream->link_prepared = false;
> +	avs_path_free(data->path);
> +	data->path = NULL;
> +
> +	/* clear link <-> stream mapping */
> +	codec = dev_to_hda_codec(asoc_rtd_to_codec(rtd, 0)->dev);
> +	link = snd_hdac_ext_bus_link_at(&codec->bus->core, codec->core.addr);
> +	if (!link)
> +		return -EINVAL;
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		snd_hdac_ext_link_clear_stream_id(link, estream->hstream.stream_tag);
> +
> +	return 0;
> +}

> +static int avs_dai_hda_be_trigger(struct snd_pcm_substream *substream, int cmd,
> +				  struct snd_soc_dai *dai)
> +{
> +	struct hdac_ext_stream *estream;
> +	struct avs_dma_data *data;
> +	int ret = 0;
> +
> +	dev_dbg(dai->dev, "entry %s cmd=%d\n", __func__, cmd);
> +
> +	data = snd_soc_dai_get_dma_data(dai, substream);
> +	estream = substream->runtime->private_data;
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		snd_hdac_ext_link_stream_start(estream);
> +
> +		ret = avs_path_run(data->path, AVS_TPLG_TRIGGER_AUTO);
> +		if (ret < 0)
> +			dev_err(dai->dev, "run BE path failed: %d\n", ret);
> +		break;
> +
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +	case SNDRV_PCM_TRIGGER_STOP:
> +		ret = avs_path_pause(data->path);
> +		if (ret < 0)
> +			dev_err(dai->dev, "pause BE path failed: %d\n", ret);
> +
> +		snd_hdac_ext_link_stream_clear(estream);
> +
> +		if (cmd == SNDRV_PCM_TRIGGER_STOP) {
> +			ret = avs_path_reset(data->path);
> +			if (ret < 0)
> +				dev_err(dai->dev, "reset BE path failed: %d\n", ret);
> +		}
> +		break;
> +
> +	default:
> +		ret = -EINVAL;

TRIGGER_SUSPEND?

> +		break;
> +	}
> +
> +	return ret;
> +}

> +static const struct snd_soc_component_driver avs_hda_component_driver = {
> +	.name			= "avs-hda-pcm",
> +	.probe			= avs_component_hda_probe,
> +	.remove			= avs_component_hda_remove,
> +	.open			= avs_component_hda_open,
> +	.close			= avs_component_hda_close,
> +	.pointer		= avs_component_pointer,
> +	.mmap			= avs_component_mmap,
> +	.pcm_construct		= avs_component_construct,
> +	/*
> +	 * hda platform component's probe() is dependent on
> +	 * codec->pcm_list_head, it needs to be initialized after codec
> +	 * component. remove_order is here for completeness sake
> +	 */
> +	.probe_order		= SND_SOC_COMP_ORDER_LATE,
> +	.remove_order		= SND_SOC_COMP_ORDER_EARLY,
> +	.module_get_upon_open	= 1,
> +	.topology_name_prefix	= "intel/avs",
> +	.non_legacy_dai_naming	= true,

needed?

> +};
> +
> +int avs_hda_platform_register(struct avs_dev *adev, const char *name)
> +{
> +	return avs_soc_component_register(adev->dev, name,
> +					  &avs_hda_component_driver, NULL, 0);
> +}
