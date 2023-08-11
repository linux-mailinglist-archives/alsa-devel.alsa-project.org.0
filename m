Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 391D3779704
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 20:23:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C53F822;
	Fri, 11 Aug 2023 20:22:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C53F822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691778179;
	bh=+VACEVAzwf0iG0sJT6B6M3BvOx5qyJ33p/W3w3FAFnQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BOivSM5/3zimcQlkyx5gLHJD2M2Z90VQYG1uGhyLiJDY07szFlGvHLP9TFDiJXMh8
	 xRbkjy2Bde46A4+rbgvw7w90Z3+lHw/OfprfTPd78ZxyevDn8+QpFXPu7S1xje60/n
	 Z6xNKnEcZDolzee3XHJjJ9JquvQElRG76TQr1Kco=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AAF9F801EB; Fri, 11 Aug 2023 20:22:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81C1BF80134;
	Fri, 11 Aug 2023 20:22:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DDB0F80166; Fri, 11 Aug 2023 20:22:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BDA4F800F4
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 20:21:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BDA4F800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RCdH28Je
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691778116; x=1723314116;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+VACEVAzwf0iG0sJT6B6M3BvOx5qyJ33p/W3w3FAFnQ=;
  b=RCdH28JetaG/km2ZG/BtgqMIS+zrTY+d9Tkm27A7l51GA8lYh3Y9k5DY
   IHr86Fn77sOXy2R9U2XklCh8n8CEFzimN1bQT1A9D9qkklI6ZfDT3q/hv
   HFSAbS19vxl8xCVO/S9t90y2FbfdqqKKpRyO4DWpXuF9e9EQk59YBH5dh
   fGI06QYDz1RXhWfVvCfUaJKPmszIo+2WiHPXYikb48IMJSrbQzrxPJvoJ
   A6Mmdfx33aMkCN02A7CEG7HNOZaIkLt27wjNvzT7NjrY6SoWi6POsHMXQ
   q+E52bbnDyXFYW6GiDHE+BJtyYunK3/gsEUHiO0u7nW0GF8Z3KAJKVIdY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="371744145"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="371744145"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 11:21:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="735859789"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200";
   d="scan'208";a="735859789"
Received: from kgosse-mobl.amr.corp.intel.com (HELO [10.209.181.160])
 ([10.209.181.160])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2023 11:21:45 -0700
Message-ID: <0474e41a-0e69-d739-1e4a-cdc555e6fbd0@linux.intel.com>
Date: Fri, 11 Aug 2023 13:21:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 13/17] ASoC: SOF: Intel: Switch to new stream-format
 interface
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com, perex@perex.cz
Cc: alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
 hdegoede@redhat.com
References: <20230811164853.1797547-1-cezary.rojewski@intel.com>
 <20230811164853.1797547-14-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230811164853.1797547-14-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: M3MDW6SHZUJHPJAICQLLH3DVWTDQVSJ5
X-Message-ID-Hash: M3MDW6SHZUJHPJAICQLLH3DVWTDQVSJ5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M3MDW6SHZUJHPJAICQLLH3DVWTDQVSJ5/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/11/23 11:48, Cezary Rojewski wrote:
> To provide option for selecting different bit-per-sample than just the
> maximum one, use the new format calculation mechanism.

Can you remind me what the issue is in selecting the maximum resolution?

Isn't it a good thing to select the maximum resolution when possible so
as to provide more headroom and prevent clipping? Usually we try to make
sure the resolution becomes limited when we reach the analog parts. I am
not sure I see a compelling reason to reduce the resolution on the host
side.

I am also not sure what this patch actually changes, given that the
firmware actually converts everything to the full 32-bit resolution.

I must be missing something on the problem statement.

> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/sof/intel/hda-dai-ops.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
> index f3513796c189..00703999e91b 100644
> --- a/sound/soc/sof/intel/hda-dai-ops.c
> +++ b/sound/soc/sof/intel/hda-dai-ops.c
> @@ -194,14 +194,15 @@ static unsigned int hda_calc_stream_format(struct snd_sof_dev *sdev,
>  	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
>  	unsigned int link_bps;
>  	unsigned int format_val;
> +	unsigned int bps;
>  
>  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
>  		link_bps = codec_dai->driver->playback.sig_bits;
>  	else
>  		link_bps = codec_dai->driver->capture.sig_bits;
> +	bps = snd_hdac_stream_format_bps(params_format(params), SNDRV_PCM_SUBFORMAT_STD, link_bps);

I can't say I fully understand the difference between 'bps' and
'link_bps'. The naming is far from self-explanatory just by looking at
the code.

> -	format_val = snd_hdac_calc_stream_format(params_rate(params), params_channels(params),
> -						 params_format(params), link_bps, 0);
> +	format_val = snd_hdac_stream_format(params_channels(params), bps, params_rate(params));
>  
>  	dev_dbg(sdev->dev, "format_val=%#x, rate=%d, ch=%d, format=%d\n", format_val,
>  		params_rate(params), params_channels(params), params_format(params));
