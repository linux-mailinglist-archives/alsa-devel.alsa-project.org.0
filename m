Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6061C7D2BE8
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Oct 2023 09:52:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A6B8828;
	Mon, 23 Oct 2023 09:51:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A6B8828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698047534;
	bh=W64Rt+rnod+gmqnyOQdn0ij+theDjkJ3D8rzwNAejhg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UduQ7eUvQqxsUzQ0hkfBIQ2u4rKh1boXYjN96dWKKWQtvn76lYg1eN+GyEh9meuOW
	 amTmMvR0XGEWMVxnmwuMEUVDzCa0Yrkv3jInyWEtaTHdwG/dRyAQYm53RDeZpA3BZW
	 354DGNQ44klHeiGR6FYiBI5QL90K3TYxgs0KYiMI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B78D9F80527; Mon, 23 Oct 2023 09:51:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 784EEF8032D;
	Mon, 23 Oct 2023 09:51:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24B0CF804F3; Mon, 23 Oct 2023 09:51:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3FD4AF8024E
	for <alsa-devel@alsa-project.org>; Mon, 23 Oct 2023 09:51:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FD4AF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=I0/5DnpG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698047475; x=1729583475;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=W64Rt+rnod+gmqnyOQdn0ij+theDjkJ3D8rzwNAejhg=;
  b=I0/5DnpGtK2jedxlimKHNZ5rNChtYieuSNEBKgisxyKs1z/xJVys49ly
   3/ngySc2JAMRc3aa63L5Fe4FW2x1fwQ7ldCL8FDs4VB3GBOz7q6RD6Iqy
   1ZcUaQYUG25PpEPrd934tc8JtJk+jfaVGKfHkpFDX31t6OoKkzCB0Pi5b
   4ooS7z5J8B4EWquGdpIbuRJ4f8aLZlSqWwCCZvPCmHfnIGdnFfHRsLE3Y
   W7WU2VNd/itZ+lBV/Mnz2UHPMlssZoAx+PRfCLBmw5Zu0aoY+Npc5RhZI
   tRxAqH2SlFpXA+JrVQHJs9ozKsj/aWsn1kCmnDRLPCeghaDpl4fpkSre3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="385670373"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200";
   d="scan'208";a="385670373"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 00:50:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="734588327"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200";
   d="scan'208";a="734588327"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91])
 ([10.94.0.91])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 00:50:44 -0700
Message-ID: <d5fba90c-24ab-4aff-8d6f-6d1443f4c10a@linux.intel.com>
Date: Mon, 23 Oct 2023 09:50:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] ASoC: amd: acp: Add pci legacy driver support for
 acp7.0 platform
Content-Language: en-US
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com,
 venkataprasad.potturu@amd.com, arungopal.kondaveeti@amd.com,
 mastan.katragadda@amd.com, juan.martinez@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 V Sujith Kumar Reddy <vsujithkumar.reddy@amd.com>,
 Marian Postevca <posteuca@mutex.one>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Yang Li <yang.lee@linux.alibaba.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
 <20231021145110.478744-12-Syed.SabaKareem@amd.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20231021145110.478744-12-Syed.SabaKareem@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EAFAVZ5DBEGNE73XIBUKRNSKODXHV3W3
X-Message-ID-Hash: EAFAVZ5DBEGNE73XIBUKRNSKODXHV3W3
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EAFAVZ5DBEGNE73XIBUKRNSKODXHV3W3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/21/2023 4:50 PM, Syed Saba Kareem wrote:
> Add pci legacy driver support and create platform driver for
> acp7.0 platform.
> 
> Signed-off-by: Syed Saba Kareem <Syed.SabaKareem@amd.com>
> ---

...

> +
> +static struct snd_soc_dai_driver acp70_dai[] = {
> +{
> +	.name = "acp-i2s-sp",
> +	.id = I2S_SP_INSTANCE,
> +	.playback = {
> +		.stream_name = "I2S SP Playback",
> +		.rates = SNDRV_PCM_RATE_8000_96000,
> +		.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S8 |
> +			   SNDRV_PCM_FMTBIT_U8 | SNDRV_PCM_FMTBIT_S32_LE,

Any reason to not go from lowest bit width to higher? Similarly in 
further definitions.

> +		.channels_min = 2,
> +		.channels_max = 8,
> +		.rate_min = 8000,
> +		.rate_max = 96000,
> +	},

...

> +
> +static int __maybe_unused acp70_pcm_resume(struct device *dev)
> +{
> +	struct acp_dev_data *adata = dev_get_drvdata(dev);
> +	struct acp_stream *stream;
> +	struct snd_pcm_substream *substream;
> +	snd_pcm_uframes_t buf_in_frames;
> +	u64 buf_size;
> +
> +	spin_lock(&adata->acp_lock);
> +	list_for_each_entry(stream, &adata->stream_list, list) {
> +		if (stream) {
> +			substream = stream->substream;
> +			if (substream && substream->runtime) {
> +				buf_in_frames = (substream->runtime->buffer_size);
> +				buf_size = frames_to_bytes(substream->runtime, buf_in_frames);
> +				config_pte_for_stream(adata, stream);
> +				config_acp_dma(adata, stream, buf_size);
> +				if (stream->dai_id)
> +					restore_acp_i2s_params(substream, adata, stream);
> +				else
> +					restore_acp_pdm_params(substream, adata);
> +			}
> +		}
> +	}
> +		spin_unlock(&adata->acp_lock);
> +		return 0;

Indentation is wrong in above two lines.

> +}
> +
> +static const struct dev_pm_ops acp70_dma_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(NULL, acp70_pcm_resume)
> +};
> +


