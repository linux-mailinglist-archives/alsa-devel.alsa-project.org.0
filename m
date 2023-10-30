Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3D07DB8FC
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 12:31:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA0C8DE5;
	Mon, 30 Oct 2023 12:30:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA0C8DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698665490;
	bh=9KW1ryeBCpESKKmbGR2EzdR09efOy6RrSVRolR3kwW0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r1EumANFAI+MXPYMHYzR21bxiQuWujy3x9Hd/HKbGXnUy/EHtYRW8DJzwqNzC63In
	 gqZY3zLDHqrFGjB1vEx8Id1fHjn7pemE0ra3SiWtPhK8NvZ6ECm//EGQhJ74PcysXt
	 +Y5aNNwsTMEn0qzk8aC5fAk6TD/M+hS2xeWc0QpE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57393F80494; Mon, 30 Oct 2023 12:30:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D229F80166;
	Mon, 30 Oct 2023 12:30:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAF83F8016D; Mon, 30 Oct 2023 12:30:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A126F800FA
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 12:29:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A126F800FA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YIi/Ysdf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698665398; x=1730201398;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9KW1ryeBCpESKKmbGR2EzdR09efOy6RrSVRolR3kwW0=;
  b=YIi/YsdfVUOVDa1An8k4dtYqkwcadVf/g0x/iduvarZ3Ffbr5Evp8Nu8
   8CIPyynfkikc9e2c/P9X/JlyjfvaJcOLH5hHWP7KgX8Y8pK1obtBScPy4
   o5/jQGdQuDu3sl3DSPijOXKpJwVdZUmLVq4dRWQinPcF7PVmsJ4kbGYnH
   B2ci+a4ppUnsM/XyJDwmEpuxQsDBHZLO6cteYhwuu9PGZdcMmP+9Xe8AQ
   zdIPaSMCEYkl2UmYs75GK5d8a599cMkWh9RNW0T5BN2VpciuCjbJ8jWwY
   lwqfUh1BegkevJZPRzna4x5hmdYWZui3jmUiiOswNQuEB9nJaDOTyGxK/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="918725"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200";
   d="scan'208";a="918725"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 04:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="883835297"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200";
   d="scan'208";a="883835297"
Received: from yungchua-mobl2.ccr.corp.intel.com (HELO [10.92.2.114])
 ([10.92.2.114])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 04:29:45 -0700
Message-ID: <610122ec-0b4b-46c4-a768-23cf07b0e48f@linux.intel.com>
Date: Mon, 30 Oct 2023 19:29:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: rt712-sdca: fix speaker route missing issue
Content-Language: en-US
To: shumingf@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com,
 bard.liao@intel.com
References: <20231030103644.1787948-1-shumingf@realtek.com>
From: "Liao, Bard" <yung-chuan.liao@linux.intel.com>
In-Reply-To: <20231030103644.1787948-1-shumingf@realtek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YJJ73ZYDY24TOS7P4P7FIHSCFAF4SDPV
X-Message-ID-Hash: YJJ73ZYDY24TOS7P4P7FIHSCFAF4SDPV
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YJJ73ZYDY24TOS7P4P7FIHSCFAF4SDPV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 2023/10/30 下午 06:36, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
>
> Sometimes the codec probe would be called earlier than the hardware initialization.
> Therefore, the speaker route should be added before the the first_hw_init check.
>
> Signed-off-by: Shuming Fan <shumingf@realtek.com>

Do we need

Fixes: f3da2ed110e2 ("ASoC: rt1712-sdca: enable pm_runtime in probe, 
keep status as 'suspended'")?

> ---
>   sound/soc/codecs/rt712-sdca.c | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
> index 7077ff6ba1f4..6954fbe7ec5f 100644
> --- a/sound/soc/codecs/rt712-sdca.c
> +++ b/sound/soc/codecs/rt712-sdca.c
> @@ -963,13 +963,6 @@ static int rt712_sdca_probe(struct snd_soc_component *component)
>   	rt712_sdca_parse_dt(rt712, &rt712->slave->dev);
>   	rt712->component = component;
>   
> -	if (!rt712->first_hw_init)
> -		return 0;
> -
> -	ret = pm_runtime_resume(component->dev);
> -	if (ret < 0 && ret != -EACCES)
> -		return ret;
> -
>   	/* add SPK route */
>   	if (rt712->hw_id != RT712_DEV_ID_713) {
>   		snd_soc_add_component_controls(component,
> @@ -980,6 +973,13 @@ static int rt712_sdca_probe(struct snd_soc_component *component)
>   			rt712_sdca_spk_dapm_routes, ARRAY_SIZE(rt712_sdca_spk_dapm_routes));
>   	}
>   
> +	if (!rt712->first_hw_init)
> +		return 0;
> +
> +	ret = pm_runtime_resume(component->dev);
> +	if (ret < 0 && ret != -EACCES)
> +		return ret;
> +
>   	return 0;
>   }
>   
