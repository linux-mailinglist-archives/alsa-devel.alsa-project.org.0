Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8B118DC74
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Mar 2020 01:20:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D979F83D;
	Sat, 21 Mar 2020 01:19:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D979F83D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584750049;
	bh=bx0au7f43rNsVwLkRmMdlGB32ABKEhFBUmzsFRCZERo=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bVpjJMaAh6A4jWF9xOLqV1M8eY2MuGse2ysZCbb3jdPUQwTdX101CardodHSm2tCw
	 OqxLgRdJagYA9fzLr0kCcSp19983tV1MJHXHulYUrhlCzxfHJUkG9QaH0Wpybf6kkY
	 7uCanygY3wk1nZX6cKCMW5CeUOb4vBMw7OhAi70I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D38C9F80126;
	Sat, 21 Mar 2020 01:19:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47F2DF8015B; Sat, 21 Mar 2020 01:19:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 209F6F80126
 for <alsa-devel@alsa-project.org>; Sat, 21 Mar 2020 01:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 209F6F80126
IronPort-SDR: v7GaY47Rupcx6O4e5geXHH+SJBXN2BjN0sQgHCR1pBwHvhhAWiGEVM6ZYVubW9/ZQ4EZS8nnv0
 nCOPwVaJTs7g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 17:18:57 -0700
IronPort-SDR: zZIq+qIZOrh4Mtazb6kYGhvkenIzpXKr1KnDjeEFgwWiA2F3L5xHu4W+GHOXX4qaQiO3RODYRl
 g6M3D56NsbzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,286,1580803200"; d="scan'208";a="238905029"
Received: from ksmith5-mobl1.amr.corp.intel.com ([10.254.176.146])
 by fmsmga008.fm.intel.com with ESMTP; 20 Mar 2020 17:18:57 -0700
Message-ID: <4634e6654473722fca5f509ffb535535c4f6fbac.camel@linux.intel.com>
Subject: Re: [PATCH] ASoC: topology: Add missing memory checks
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Amadeusz =?UTF-8?Q?S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Date: Fri, 20 Mar 2020 17:18:56 -0700
In-Reply-To: <20200320181345.31565-1-amadeuszx.slawinski@linux.intel.com>
References: <20200320181345.31565-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Fri, 2020-03-20 at 14:13 -0400, Amadeusz Sławiński wrote:
> kstrdup is an allocation function and it can fail, so its return
> value
> should be checked and handled appropriately.
> 
> In order to check all cases, we need to modify set_stream_info to
> return
> a value, so check that everything went correctly when doing
> kstrdup().
> Later add proper checks and error handlers.
> 
> Signed-off-by: Amadeusz Sławiński <
> amadeuszx.slawinski@linux.intel.com>
> ---
>  sound/soc/soc-topology.c | 65 +++++++++++++++++++++++++++++++-------
> --
>  1 file changed, 51 insertions(+), 14 deletions(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 575da6aba807..0bec3ff782c1 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -1766,10 +1766,13 @@ static int soc_tplg_dapm_complete(struct
> soc_tplg *tplg)
>  	return 0;
>  }
>  
> -static void set_stream_info(struct snd_soc_pcm_stream *stream,
> +static int set_stream_info(struct snd_soc_pcm_stream *stream,
>  	struct snd_soc_tplg_stream_caps *caps)
>  {
>  	stream->stream_name = kstrdup(caps->name, GFP_KERNEL);
> +	if (!stream->stream_name)
> +		return -ENOMEM;
> +
>  	stream->channels_min = le32_to_cpu(caps->channels_min);
>  	stream->channels_max = le32_to_cpu(caps->channels_max);
>  	stream->rates = le32_to_cpu(caps->rates);
> @@ -1777,6 +1780,8 @@ static void set_stream_info(struct
> snd_soc_pcm_stream *stream,
>  	stream->rate_max = le32_to_cpu(caps->rate_max);
>  	stream->formats = le64_to_cpu(caps->formats);
>  	stream->sig_bits = le32_to_cpu(caps->sig_bits);
> +
> +	return 0;
>  }
>  
>  static void set_dai_flags(struct snd_soc_dai_driver *dai_drv,
> @@ -1812,20 +1817,29 @@ static int soc_tplg_dai_create(struct
> soc_tplg *tplg,
>  	if (dai_drv == NULL)
>  		return -ENOMEM;
>  
> -	if (strlen(pcm->dai_name))
> +	if (strlen(pcm->dai_name)) {
>  		dai_drv->name = kstrdup(pcm->dai_name, GFP_KERNEL);
> +		if (!dai_drv->name) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
> +	}
>  	dai_drv->id = le32_to_cpu(pcm->dai_id);
>  
>  	if (pcm->playback) {
>  		stream = &dai_drv->playback;
>  		caps = &pcm->caps[SND_SOC_TPLG_STREAM_PLAYBACK];
> -		set_stream_info(stream, caps);
> +		ret = set_stream_info(stream, caps);
> +		if (ret < 0)
> +			goto err;
>  	}
>  
>  	if (pcm->capture) {
>  		stream = &dai_drv->capture;
>  		caps = &pcm->caps[SND_SOC_TPLG_STREAM_CAPTURE];
> -		set_stream_info(stream, caps);
> +		ret = set_stream_info(stream, caps);
> +		if (ret < 0)
> +			goto err;
>  	}
>  
>  	if (pcm->compress)
> @@ -1835,11 +1849,7 @@ static int soc_tplg_dai_create(struct soc_tplg
> *tplg,
>  	ret = soc_tplg_dai_load(tplg, dai_drv, pcm, NULL);
>  	if (ret < 0) {
>  		dev_err(tplg->comp->dev, "ASoC: DAI loading failed\n");
> -		kfree(dai_drv->playback.stream_name);
> -		kfree(dai_drv->capture.stream_name);
> -		kfree(dai_drv->name);
> -		kfree(dai_drv);
> -		return ret;
> +		goto err;
>  	}
>  
>  	dai_drv->dobj.index = tplg->index;
> @@ -1857,9 +1867,17 @@ static int soc_tplg_dai_create(struct soc_tplg
> *tplg,
>  	if (ret != 0) {
>  		dev_err(dai->dev, "Failed to create DAI widgets %d\n",
> ret);
>  		snd_soc_unregister_dai(dai);
> -		return ret;
> +		goto err;
Hi Amadeusz,

I think this is not needed. Once the dai_drv is added to the dobj_list,
upon a failure here, the tplg components will be removed and this will
be taken care of. So it is safe to just return ret here.
>  	}
>  
> +	return 0;
> +
> +err:
> +	kfree(dai_drv->playback.stream_name);
> +	kfree(dai_drv->capture.stream_name);
> +	kfree(dai_drv->name);
> +	kfree(dai_drv);
> +
>  	return ret;
>  }
>  
> @@ -1916,11 +1934,20 @@ static int soc_tplg_fe_link_create(struct
> soc_tplg *tplg,
>  	if (strlen(pcm->pcm_name)) {
>  		link->name = kstrdup(pcm->pcm_name, GFP_KERNEL);
>  		link->stream_name = kstrdup(pcm->pcm_name, GFP_KERNEL);
> +		if (!link->name || !link->stream_name) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
>  	}
>  	link->id = le32_to_cpu(pcm->pcm_id);
>  
> -	if (strlen(pcm->dai_name))
> +	if (strlen(pcm->dai_name)) {
>  		link->cpus->dai_name = kstrdup(pcm->dai_name,
> GFP_KERNEL);
> +		if (!link->cpus->dai_name) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
> +	}
>  
>  	link->codecs->name = "snd-soc-dummy";
>  	link->codecs->dai_name = "snd-soc-dummy-dai";
> @@ -2436,13 +2463,17 @@ static int soc_tplg_dai_config(struct
> soc_tplg *tplg,
>  	if (d->playback) {
>  		stream = &dai_drv->playback;
>  		caps = &d->caps[SND_SOC_TPLG_STREAM_PLAYBACK];
> -		set_stream_info(stream, caps);
> +		ret = set_stream_info(stream, caps);
> +		if (ret < 0)
> +			goto err;
>  	}
>  
>  	if (d->capture) {
>  		stream = &dai_drv->capture;
>  		caps = &d->caps[SND_SOC_TPLG_STREAM_CAPTURE];
> -		set_stream_info(stream, caps);
> +		ret = set_stream_info(stream, caps);
> +		if (ret < 0)
> +			goto err;
>  	}
>  
>  	if (d->flag_mask)
> @@ -2454,10 +2485,16 @@ static int soc_tplg_dai_config(struct
> soc_tplg *tplg,
The return value of soc_tplg_dai_config() in soc_tplg_dai_elems_load()
is never checked. So maybe we need a follow-up patch to fix that too?

Thanks,
Ranjani

