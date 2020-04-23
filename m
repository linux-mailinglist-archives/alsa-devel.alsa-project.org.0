Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C3A1B51BB
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 03:18:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C26EF16E4;
	Thu, 23 Apr 2020 03:17:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C26EF16E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587604707;
	bh=Tm4eHEcBJcd3PWKfjjeTZJ20jSSuW47k0jJ7oVync7c=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pBs6PmKiF2BMz35Do0G/grMmxSjf6hEFsAwWgMEQ5y3G5lbHUayQZiXTGCjuLcIxT
	 LywbcvEWrbcllEiEj72Fp5KdDR5KM9KAYolXJyEZP0hvVneOWPAtHI/EDKGafmOz1Q
	 gLuoiUZIypd9jWbYtx6CZogOhICJAshAuS/XzzeA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F11D6F8020C;
	Thu, 23 Apr 2020 03:16:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01B47F801D9; Thu, 23 Apr 2020 03:16:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EAEEF80108
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 03:16:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EAEEF80108
IronPort-SDR: 0FbgapxZigHwQh8j+TvzWLdZW2r2gJtUobY1dvXgFG+kBDo1Ge1dW8Ibr16pnDmlalpuQF2w5U
 Zru313LRcL9g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 18:16:33 -0700
IronPort-SDR: mRMtJTV89zcFEq0yiFcXvF+saCXATwhtPjtqwa8FpbdeBB3Mvm9FLLPQX/WSkRlb/EDFT5hL40
 FGmvouqUkNGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,305,1583222400"; d="scan'208";a="280221717"
Received: from aacostaz-mobl.amr.corp.intel.com ([10.255.74.8])
 by fmsmga004.fm.intel.com with ESMTP; 22 Apr 2020 18:16:33 -0700
Message-ID: <96824f434b84853c189da5abd906421c59ea3727.camel@linux.intel.com>
Subject: Re: [PATCH 05/17] ASoC: soc-dai: add snd_soc_pcm_dai_trigger()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Wed, 22 Apr 2020 18:16:32 -0700
In-Reply-To: <87tv1bt8oh.wl-kuninori.morimoto.gx@renesas.com>
References: <871rofunaq.wl-kuninori.morimoto.gx@renesas.com>
 <87tv1bt8oh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On Thu, 2020-04-23 at 08:14 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> We have 2 type of component functions
> snd_soc_dai_xxx()     is focusing to dai itself,
> snd_soc_pcm_dai_xxx() is focusing to rtd related dai.
> 
> Now we can update snd_soc_dai_trigger() to
> snd_soc_pcm_dai_trigger(). This patch do it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-dai.h |  3 +--
>  sound/soc/soc-dai.c     | 32 +++++++++++++++++++-------------
>  sound/soc/soc-pcm.c     | 18 ++++++------------
>  3 files changed, 26 insertions(+), 27 deletions(-)
> 
> diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
> index 1b25318b6325..3da850b4aefe 100644
> --- a/include/sound/soc-dai.h
> +++ b/include/sound/soc-dai.h
> @@ -154,8 +154,6 @@ int snd_soc_dai_startup(struct snd_soc_dai *dai,
>  			struct snd_pcm_substream *substream);
>  void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
>  			  struct snd_pcm_substream *substream);
> -int snd_soc_dai_trigger(struct snd_soc_dai *dai,
> -			struct snd_pcm_substream *substream, int cmd);
>  int snd_soc_dai_bespoke_trigger(struct snd_soc_dai *dai,
>  			struct snd_pcm_substream *substream, int cmd);
>  snd_pcm_sframes_t snd_soc_dai_delay(struct snd_soc_dai *dai,
> @@ -170,6 +168,7 @@ bool snd_soc_dai_stream_valid(struct snd_soc_dai
> *dai, int stream);
>  
>  int snd_soc_pcm_dai_new(struct snd_soc_pcm_runtime *rtd);
>  int snd_soc_pcm_dai_prepare(struct snd_pcm_substream *substream);
> +int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream, int
> cmd);
>  
>  struct snd_soc_dai_ops {
>  	/*
> diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
> index 1a9cfdcfc736..29587d7e75ca 100644
> --- a/sound/soc/soc-dai.c
> +++ b/sound/soc/soc-dai.c
> @@ -354,19 +354,6 @@ void snd_soc_dai_shutdown(struct snd_soc_dai
> *dai,
>  		dai->driver->ops->shutdown(substream, dai);
>  }
>  
> -int snd_soc_dai_trigger(struct snd_soc_dai *dai,
> -			struct snd_pcm_substream *substream,
> -			int cmd)
> -{
> -	int ret = 0;
> -
> -	if (dai->driver->ops &&
> -	    dai->driver->ops->trigger)
> -		ret = dai->driver->ops->trigger(substream, cmd, dai);
> -
> -	return ret;
> -}
> -
>  int snd_soc_dai_bespoke_trigger(struct snd_soc_dai *dai,
>  				struct snd_pcm_substream *substream,
>  				int cmd)
> @@ -467,3 +454,22 @@ int snd_soc_pcm_dai_prepare(struct
> snd_pcm_substream *substream)
>  
>  	return 0;
>  }
> +
> +int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream,
> +			    int cmd)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_dai *dai;
> +	int i, ret;
> +
> +	for_each_rtd_dais(rtd, i, dai) {
> +		if (dai->driver->ops &&
> +		    dai->driver->ops->trigger) {
> +			ret = dai->driver->ops->trigger(substream, cmd,
> dai);
> +			if (ret < 0)
> +				return soc_dai_ret(dai, ret);
> +		}
> +	}
> +
> +	return 0;
> +}
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index f7b3dca1d152..bc55a249aa61 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1192,7 +1192,6 @@ static int soc_pcm_trigger_start(struct
> snd_pcm_substream *substream, int cmd)
>  {
>  	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>  	struct snd_soc_component *component;
> -	struct snd_soc_dai *dai;
>  	int i, ret;
>  
>  	ret = soc_rtd_trigger(rtd, substream, cmd);
> @@ -1205,11 +1204,9 @@ static int soc_pcm_trigger_start(struct
> snd_pcm_substream *substream, int cmd)
>  			return ret;
>  	}
>  
> -	for_each_rtd_dais(rtd, i, dai) {
> -		ret = snd_soc_dai_trigger(dai, substream, cmd);
> -		if (ret < 0)
> -			return ret;
> -	}
> +	ret = snd_soc_pcm_dai_trigger(substream, cmd);
> +	if (ret < 0)
> +		return ret;
>  
>  	return 0;
Maybe just "return snd_soc_pcm_dai_trigger(substream, cmd);" here?

Thanks,
Ranjani

