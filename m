Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 395F07EA019
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 16:35:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D3AA829;
	Mon, 13 Nov 2023 16:34:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D3AA829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699889749;
	bh=HMywEqsO2ghezpmZYFMkJcktVwdVXA5iB3QMF0BziY4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JoWn55pE8vwuGzeKHwtCkEK0W6cJ4+dZX1g4dupF13W4UP54fdgldUKA7rhSomE3+
	 XEIxkDwM+iDRymbzCQGnDm5UEOb6eD6r2m1ASXjQOhcoNgXQYuYLypguTitXxI/q6S
	 DwPrGhZ1pXaBOzu0ie6WNfJ1ux7MvtYOtxu3ItxM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D52C7F80567; Mon, 13 Nov 2023 16:34:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B5B3F80558;
	Mon, 13 Nov 2023 16:34:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E142BF801D5; Mon, 13 Nov 2023 16:34:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B52C3F8016E
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 16:34:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B52C3F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VWY8Z3OT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699889645; x=1731425645;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HMywEqsO2ghezpmZYFMkJcktVwdVXA5iB3QMF0BziY4=;
  b=VWY8Z3OTQELfoQ7hGwS6piGTQd0B9p9vmm3NWvKxOUfabHPTa5dWrwa2
   vNm6OPsR4KWzLyjvbrby6jxPNfmHr+gsG7iTX8rPSpEFKUE+esQb3xa0b
   mKk67QLXLo1K946lRIrm8V/htIUC9jpeCM6Rrmh6RPzl9uCSsgm/SE4Bm
   F3zp8Z1P6jcvTFqgIu8zlkiSTGWdWYTVgCn15GJwuDEEVqLyIEKgn7xIU
   PTIV9BVgtbAAphHTkO39Cl81DD9LCsIyNHcPn6dZwMc+buhaA/8FqZPrb
   Rbv7RRK9nEH/AnrgQ2kxbDDFUlRflknZwlaL3ZMfFR8F/97xRg+XjSEzk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375480762"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200";
   d="scan'208";a="375480762"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 07:33:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="1011570185"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200";
   d="scan'208";a="1011570185"
Received: from renliang-mobl.amr.corp.intel.com (HELO [10.251.10.75])
 ([10.251.10.75])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2023 07:33:54 -0800
Message-ID: <1569460d-30bc-47f5-a224-b14618e4eaf2@linux.intel.com>
Date: Mon, 13 Nov 2023 08:45:03 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] ASoC: amd: acp: add pm ops support for renoir
 platform
Content-Language: en-US
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, mario.limonciello@amd.com, richgong@amd.com,
 posteuca@mutex.one, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 open list <linux-kernel@vger.kernel.org>
References: <20231113123345.2196504-1-Syed.SabaKareem@amd.com>
 <20231113123345.2196504-2-Syed.SabaKareem@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231113123345.2196504-2-Syed.SabaKareem@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZSTOJP44FB5BTDO5I6NBDRQOULCP7O4K
X-Message-ID-Hash: ZSTOJP44FB5BTDO5I6NBDRQOULCP7O4K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZSTOJP44FB5BTDO5I6NBDRQOULCP7O4K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> @@ -195,7 +196,11 @@ static int renoir_audio_probe(struct platform_device *pdev)
>  	dev_set_drvdata(dev, adata);
>  	acp_enable_interrupts(adata);
>  	acp_platform_register(dev);
> -
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_mark_last_busy(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
>  	return 0;
>  }
>  
> @@ -208,11 +213,42 @@ static void renoir_audio_remove(struct platform_device *pdev)
>  	acp_platform_unregister(dev);
>  }
>  
> +static int __maybe_unused rn_pcm_resume(struct device *dev)
> +{
> +	struct acp_dev_data *adata = dev_get_drvdata(dev);
> +	struct acp_stream *stream;
> +	struct snd_pcm_substream *substream;
> +	snd_pcm_uframes_t buf_in_frames;
> +	u64 buf_size;
> +
> +	spin_lock(&adata->acp_lock);
> +	list_for_each_entry(stream, &adata->stream_list, list) {
> +		substream = stream->substream;
> +		if (substream && substream->runtime) {
> +			buf_in_frames = (substream->runtime->buffer_size);
> +			buf_size = frames_to_bytes(substream->runtime, buf_in_frames);
> +			config_pte_for_stream(adata, stream);
> +			config_acp_dma(adata, stream, buf_size);
> +			if (stream->dai_id)
> +				restore_acp_i2s_params(substream, adata, stream);
> +			else
> +				restore_acp_pdm_params(substream, adata);

when are those parameters saved...

> +		}
> +	}
> +	spin_unlock(&adata->acp_lock);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops rn_dma_pm_ops = {> +	SET_SYSTEM_SLEEP_PM_OPS(NULL, rn_pcm_resume)

... since there's nothing done on suspend?

Also there's something weird here since the patch enables pm_runtime but
there's nothing related to pm_runtime here, i.e. SET_RUNTIME_PM_OPS()
is missing.

> +};
> +
>  static struct platform_driver renoir_driver = {
>  	.probe = renoir_audio_probe,
>  	.remove_new = renoir_audio_remove,
>  	.driver = {
>  		.name = "acp_asoc_renoir",
> +		.pm = &rn_dma_pm_ops,
>  	},
>  };
>  
