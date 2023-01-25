Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E0F67B5AF
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jan 2023 16:17:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 405C3E78;
	Wed, 25 Jan 2023 16:16:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 405C3E78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674659843;
	bh=gcqbyw6ayk+85NAonOLvH++dgsc2K8VZLBwjvG3k21Q=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=dZAcwDs5UMymz3DDsXYZhycjpJQRunThfjxVcmatAd9BVHY9whIG69qn+6qIvn3OK
	 m/UEaBASFAdEvxo9xu4DVIl9MXNHvhdYNon5ZvNgXKryfDdx3RjfckcUWFnowI+wiX
	 JflpINl/t9DVEzkNR4ZYQD6OJEKEytvKX4eex81I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4722BF80424;
	Wed, 25 Jan 2023 16:16:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C137F800FB; Wed, 25 Jan 2023 16:16:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95DABF800FB
 for <alsa-devel@alsa-project.org>; Wed, 25 Jan 2023 16:16:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95DABF800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=naNueao7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674659780; x=1706195780;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gcqbyw6ayk+85NAonOLvH++dgsc2K8VZLBwjvG3k21Q=;
 b=naNueao7f6yURfSA70C7aVGHyOTJSvQo0Mh+g5g0IQECeoinDGXUP1b/
 KDIA/w0+1Pq+fikpiwCIzUVlmy9iZ6AYnzCn4HaaU9eYQFAsi6W+SLzv7
 sH34Ah+su/J0LFKHm1093DCRvvkqNmEf2kc0+feYy1TRw69IfDP1cd+Tw
 Q/5K6aOprlSGoaFlsFbWtlix8nB/48xnnjfaRzkpixaJxQO5dulQSnQiN
 6cYaFCkc2FcmTXRHy3kZ+iG4dFH5JZ44MCL7BfN3j1oV1ta26VSDI8Mbd
 zIlb5A6QRCmuHIGs3+50q28Nq8PCm+Nv8XV3mG3cfgB3RLNgX0/mTk8Eh g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="327832043"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="327832043"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 07:16:09 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="786449072"
X-IronPort-AV: E=Sophos;i="5.97,245,1669104000"; d="scan'208";a="786449072"
Received: from bshunt-mobl.amr.corp.intel.com (HELO [10.212.37.80])
 ([10.212.37.80])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 07:16:09 -0800
Message-ID: <b736f2f5-eb20-78ff-0344-3263e13aefc2@linux.intel.com>
Date: Wed, 25 Jan 2023 09:05:30 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 07/11] ASoC: topology: Pass correct pointer instead of
 casting
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>
References: <20230125194649.3485731-1-amadeuszx.slawinski@linux.intel.com>
 <20230125194649.3485731-8-amadeuszx.slawinski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230125194649.3485731-8-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/25/23 13:46, Amadeusz Sławiński wrote:
> Instead of passing address of structure, the containg structure is

containing?

> casted to target structure. While it works - the expected structure is

cast?

> the first field of containing one - it is bad practice, fix this by
> passing pointer to structure field.
> 
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> ---
>  sound/soc/soc-topology.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 766de161aa4a..c35c0c53a184 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -721,7 +721,7 @@ static int soc_tplg_dbytes_create(struct soc_tplg *tplg, size_t size)
>  	}
>  
>  	/* pass control to driver for optional further init */
> -	ret = soc_tplg_control_load(tplg, &kc, (struct snd_soc_tplg_ctl_hdr *)be);
> +	ret = soc_tplg_control_load(tplg, &kc, &be->hdr);
>  	if (ret < 0) {
>  		dev_err(tplg->dev, "ASoC: failed to init %s\n", be->hdr.name);
>  		goto err;
> @@ -805,7 +805,7 @@ static int soc_tplg_dmixer_create(struct soc_tplg *tplg, size_t size)
>  	}
>  
>  	/* pass control to driver for optional further init */
> -	ret = soc_tplg_control_load(tplg, &kc, (struct snd_soc_tplg_ctl_hdr *)mc);
> +	ret = soc_tplg_control_load(tplg, &kc, &mc->hdr);
>  	if (ret < 0) {
>  		dev_err(tplg->dev, "ASoC: failed to init %s\n", mc->hdr.name);
>  		goto err;
> @@ -973,7 +973,7 @@ static int soc_tplg_denum_create(struct soc_tplg *tplg, size_t size)
>  	}
>  
>  	/* pass control to driver for optional further init */
> -	ret = soc_tplg_control_load(tplg, &kc, (struct snd_soc_tplg_ctl_hdr *)ec);
> +	ret = soc_tplg_control_load(tplg, &kc, &ec->hdr);
>  	if (ret < 0) {
>  		dev_err(tplg->dev, "ASoC: failed to init %s\n", ec->hdr.name);
>  		goto err;
> @@ -1189,7 +1189,7 @@ static int soc_tplg_dapm_widget_dmixer_create(struct soc_tplg *tplg, struct snd_
>  	}
>  
>  	/* pass control to driver for optional further init */
> -	err = soc_tplg_control_load(tplg, kc, (struct snd_soc_tplg_ctl_hdr *)mc);
> +	err = soc_tplg_control_load(tplg, kc, &mc->hdr);
>  	if (err < 0) {
>  		dev_err(tplg->dev, "ASoC: failed to init %s\n",
>  			mc->hdr.name);
> @@ -1273,7 +1273,7 @@ static int soc_tplg_dapm_widget_denum_create(struct soc_tplg *tplg, struct snd_k
>  	}
>  
>  	/* pass control to driver for optional further init */
> -	err = soc_tplg_control_load(tplg, kc, (struct snd_soc_tplg_ctl_hdr *)ec);
> +	err = soc_tplg_control_load(tplg, kc, &ec->hdr);
>  	if (err < 0) {
>  		dev_err(tplg->dev, "ASoC: failed to init %s\n",
>  			ec->hdr.name);
> @@ -1325,7 +1325,7 @@ static int soc_tplg_dapm_widget_dbytes_create(struct soc_tplg *tplg, struct snd_
>  	}
>  
>  	/* pass control to driver for optional further init */
> -	err = soc_tplg_control_load(tplg, kc, (struct snd_soc_tplg_ctl_hdr *)be);
> +	err = soc_tplg_control_load(tplg, kc, &be->hdr);
>  	if (err < 0) {
>  		dev_err(tplg->dev, "ASoC: failed to init %s\n",
>  			be->hdr.name);
