Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 078FD7EF22B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 12:57:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE18B86F;
	Fri, 17 Nov 2023 12:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE18B86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700222243;
	bh=EhCA4GJwxiNKWqsuH7RYsQMFdgVadlUGf41PRxfDlzs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TpHzGFQgY2ZrmlOd1TtnDyLK6+H6N8qDW3U7NuuydSnte4j8nnELEQ2a2sz4J5Fnf
	 LizUlh736VKJDiG6etLJ7MJ0YTjfEIOEe+2OjK0M+OQ9TpDqshN/z7w/VxN+LLgvQA
	 DNyQTZ20HN6TCaBbnsV8s4sL4xlVHWciKmfhvD4g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 428D9F80557; Fri, 17 Nov 2023 12:56:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BA55F8016E;
	Fri, 17 Nov 2023 12:56:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 722DBF801D5; Fri, 17 Nov 2023 12:56:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93DA7F80166
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 12:56:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93DA7F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZwTldVbf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222187; x=1731758187;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EhCA4GJwxiNKWqsuH7RYsQMFdgVadlUGf41PRxfDlzs=;
  b=ZwTldVbfXAm+ixBlxNj39LekQiHc3cpUdxCDFdNCUup6ZBthvK3PlFLd
   oKJht5vErRpeyBqgtlklDJEv4gThazpmaADG2f2G5Vels57JaEN0apeEe
   dfzA8qHaJ/5mSguH0etPFMTmc3zb6ifFddkMuq5ZYgtjpx78EJvkFg+JU
   i7ogWBabcVXNlbpJT7wc1pNi8jd2xMo7QZ0X8/lEoxXfW173BZ6d3/k3Y
   mIVwtjAfiZApoXBzz8awzD0htVtxsjNAcRg53/r2tGhzBOEPOhstLtkVE
   M3COIEeqAYheLPEap2rmOe+cZrU+xplmZHell/WapyM+p3lm+jYfUs+Vp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="376334763"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="376334763"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 03:56:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="831597672"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="831597672"
Received: from mwevers-mobl1.ger.corp.intel.com (HELO [10.249.44.74])
 ([10.249.44.74])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 03:56:21 -0800
Message-ID: <ad838263-dd08-461f-87cd-36e95f9e433c@linux.intel.com>
Date: Fri, 17 Nov 2023 13:56:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: SOF: topology: Fix mem leak in sof_dai_load()
To: Kamil Duljas <kamil.duljas@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
References: <20231116213926.2034-2-kamil.duljas@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20231116213926.2034-2-kamil.duljas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NIQUUXXCJVSKNA3Y6K4B3UZ7TRZDHLEM
X-Message-ID-Hash: NIQUUXXCJVSKNA3Y6K4B3UZ7TRZDHLEM
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NIQUUXXCJVSKNA3Y6K4B3UZ7TRZDHLEM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/11/2023 23:39, Kamil Duljas wrote:
> The function has multiple return points at which it is not released
> previously allocated memory.

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
> ---
> Changes in v2: removed wrong usages of kfree
> ---
>  sound/soc/sof/topology.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> index a3a3af252259..37ec671a2d76 100644
> --- a/sound/soc/sof/topology.c
> +++ b/sound/soc/sof/topology.c
> @@ -1736,8 +1736,10 @@ static int sof_dai_load(struct snd_soc_component *scomp, int index,
>  	/* perform pcm set op */
>  	if (ipc_pcm_ops && ipc_pcm_ops->pcm_setup) {
>  		ret = ipc_pcm_ops->pcm_setup(sdev, spcm);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			kfree(spcm);
>  			return ret;
> +		}
>  	}
>  
>  	dai_drv->dobj.private = spcm;

-- 
Péter
