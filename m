Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B2A7CFDF9
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 17:34:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57BB484A;
	Thu, 19 Oct 2023 17:33:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57BB484A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697729681;
	bh=lAXEsiNfFv5qCpsZ+UzdFKERp6Sg56PDkraULpTuRe0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nkAgMooQjxqTD4YiMnZK2nsqIrr6WMupTCvwS3RRCoM3wVHKblew2iotfRveY1qrW
	 7Mqxqkd7ehEr3QKdfo6kC1WENDjkK5dsIilXi6SAUlRSe+AwCtlsOlvO1EPkt+UWEt
	 1Rxiq991ECZv2GXTlmoXC4Q/qAVhS2uxO3PXWa3g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F6D5F8019B; Thu, 19 Oct 2023 17:33:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5C0EF8019B;
	Thu, 19 Oct 2023 17:33:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28491F8025F; Thu, 19 Oct 2023 17:32:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 61029F8019B
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 17:32:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61029F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=X2EVSuKb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697729539; x=1729265539;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lAXEsiNfFv5qCpsZ+UzdFKERp6Sg56PDkraULpTuRe0=;
  b=X2EVSuKbQAJPDVocRumfqBX8vZcI4HJW2+ala5wV4WlPoArqOXqH02Yi
   MpXVe1kZgzOzhvMJ/6h1a+ME1AE0JJ+jlRIlreIwH3V5nWwgbFCwWJyrA
   Ey4l4yzx0glBDGu7jR+6mjcVkkTsk8n67y6QKjUYI41IdSrNiiwliBdo1
   NAtjdH1oBykQyFALKjDzJWgP4idhhgkehZq8ngnNhiOWdy/3G9N6pDuSD
   gF8ynK+u9++7zD5bOjWqHOG2XdZaULFosurgwsclnQvAGW4ozRrmaEpvb
   Mfgs+hUeTM5JUCLeAGw1e7/qxyOxO7mJZGXiYngWl2dTI5n0gqrykdh0D
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="365630929"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="365630929"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 08:32:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="847729709"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200";
   d="scan'208";a="847729709"
Received: from mttran4-mobl2.amr.corp.intel.com (HELO [10.213.160.204])
 ([10.213.160.204])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 08:32:13 -0700
Message-ID: <246c670b-1d98-454e-b0d3-0fa40f7c5e03@linux.intel.com>
Date: Thu, 19 Oct 2023 10:32:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][TEST-REQUEST] ASoC: makes CPU/Codec channel connection
 map more generic
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, bard.liao@intel.com
Cc: Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <87zg0jwdnz.wl-kuninori.morimoto.gx@renesas.com>
 <87y1g3wdng.wl-kuninori.morimoto.gx@renesas.com>
 <d3c97c54-d149-4bed-9013-3f07bc6a7f52@linux.intel.com>
 <874jiokg1r.wl-kuninori.morimoto.gx@renesas.com>
 <5667241d-6976-4b44-8edd-79ee426415eb@linux.intel.com>
 <8734y8kd1a.wl-kuninori.morimoto.gx@renesas.com>
 <87y1fzpdxe.wl-kuninori.morimoto.gx@renesas.com>
 <87wmvjpdut.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87wmvjpdut.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QKVBZ7WHGE7JXVNPKU4IGMFJYKMV26DM
X-Message-ID-Hash: QKVBZ7WHGE7JXVNPKU4IGMFJYKMV26DM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKVBZ7WHGE7JXVNPKU4IGMFJYKMV26DM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/18/23 21:04, Kuninori Morimoto wrote:
> Current ASoC CPU:Codec = N:M connection is using connection mapping idea,
> but it is used for CPU < Codec case only. We want to use it for any case.
> 
> By this patch, not only N:M connection, but all existing connection
> (1:1, 1:N, N:N) will use same connection mapping.
> Because it will use default mapping, no conversion patch is needed
> to exising CPU/Codec drivers.
> 
> More over, CPU:Codec = M:N (M > N) also supported in the same time.
> 
> Link: https://lore.kernel.org/r/87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

No issues detected with this patch by the Intel CI (other than the usual
suspend-resume timeouts that have nothing to do with this patch), see
https://github.com/thesofproject/linux/pull/4632

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Morimoto-san!


> +				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
> +				    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
> +					has_playback = 1;
> +				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
> +				    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
> +					has_capture = 1;
>  			}
> +		}
> +		/* .ch_map is from Codec */
> +		else {
> +			for_each_rtd_codec_dais(rtd, i, codec_dai) {
> +				cpu_dai = snd_soc_rtd_to_cpu(rtd, dai_link->ch_maps[i].connected_node);
> +
> +				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
> +				    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
> +					has_playback = 1;
> +				if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
> +				    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))

while we're at it, can we also clean-up the weird extra spaces - unless
they were intentional?

> +					has_capture = 1;
>  
> -			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
> -			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
> -				has_playback = 1;
> -			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
> -			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
> -				has_capture = 1;
> +			}
>  		}
>  	}
>  
