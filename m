Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E812B0A7A
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 17:44:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6381D177B;
	Thu, 12 Nov 2020 17:43:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6381D177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605199461;
	bh=uZsCJV2SLQSVDU0BPYf6erpZGzl9HMUkbJvzl3Lrcbc=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lyiLHZUwv9EeCCMAHRuQ8g5tsFgfm8RsP8CwrCeGR++f5aY1zryG4gvMD5ACRwrub
	 UDTf56vMlrJ+tc1etmcNIN0YaUNYYP7BB1r9SKtgIboT9kyePzVZlLtX+VBp+GsUKg
	 oKE2ld21tAQp7yIJKSrcpgyoc+bTPas0957+jEm0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 151F1F801EB;
	Thu, 12 Nov 2020 17:42:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEA34F801D5; Thu, 12 Nov 2020 17:42:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4ABE9F800D1
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 17:42:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4ABE9F800D1
IronPort-SDR: DdwxzFSnNNGXIyF5gQxJxCgbPx723kpcMFyw8JL2WVBRNJGCq8nOJe1JfiIgDv8pR6XiULSTLL
 8bahSUrC/UEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="150190031"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="150190031"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:42:31 -0800
IronPort-SDR: XDBggv/lhRhOTabUP8A7mYCwouCxFCqrYI7WSt+5lseoOkdLpmQrAhcmZJx3XMT8/vNSyjLpjI
 s4gEbiCvnSCA==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="357151746"
Received: from rtrevino-mobl2.amr.corp.intel.com ([10.212.195.40])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:42:31 -0800
Message-ID: <e548e12d1fcaeeee2d549ecb33bd0c0d14473e15.camel@linux.intel.com>
Subject: Re: [PATCH 06/12] ASoC: soc-component: add
 snd_soc_component_compr_get_caps()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Thu, 12 Nov 2020 08:42:23 -0800
In-Reply-To: <87zh3n6vq7.wl-kuninori.morimoto.gx@renesas.com>
References: <878sb78ac4.wl-kuninori.morimoto.gx@renesas.com>
 <87zh3n6vq7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
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

On Thu, 2020-11-12 at 13:37 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> component related function should be implemented at
> soc-component.c.
> This patch adds snd_soc_component_compr_get_caps().
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-component.h |  2 ++
>  sound/soc/soc-component.c     | 21 +++++++++++++++++++++
>  sound/soc/soc-compress.c      | 13 ++-----------
>  3 files changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/include/sound/soc-component.h b/include/sound/soc-
> component.h
> index 6841c3037548..7fd45462963e 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -453,6 +453,8 @@ int snd_soc_component_compr_set_params(struct
> snd_compr_stream *cstream,
>  				       struct snd_compr_params
> *params);
>  int snd_soc_component_compr_get_params(struct snd_compr_stream
> *cstream,
>  				       struct snd_codec *params);
> +int snd_soc_component_compr_get_caps(struct snd_compr_stream
> *cstream,
> +				     struct snd_compr_caps *caps);
>  
>  int snd_soc_pcm_component_pointer(struct snd_pcm_substream
> *substream);
>  int snd_soc_pcm_component_ioctl(struct snd_pcm_substream *substream,
> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index 7d2b31948854..6f560238e2f9 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -524,6 +524,27 @@ int snd_soc_component_compr_get_params(struct
> snd_compr_stream *cstream,
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_component_compr_get_params);
>  
> +int snd_soc_component_compr_get_caps(struct snd_compr_stream
> *cstream,
> +				     struct snd_compr_caps *caps)
> +{
> +	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
> +	struct snd_soc_component *component;
> +	int i, ret;
> +
> +	for_each_rtd_components(rtd, i, component) {
> +		if (component->driver->compress_ops &&
> +		    component->driver->compress_ops->get_caps) {
> +			ret = component->driver->compress_ops-
> >get_caps(
> +				component, cstream, caps);
> +			if (ret < 0)
> +				return soc_component_ret(component,
> ret);
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_component_compr_get_caps);
> +
>  static unsigned int soc_component_read_no_lock(
>  	struct snd_soc_component *component,
>  	unsigned int reg)
> diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
> index a98defdecad7..c62aa1a52c28 100644
> --- a/sound/soc/soc-compress.c
> +++ b/sound/soc/soc-compress.c
> @@ -413,20 +413,11 @@ static int soc_compr_get_caps(struct
> snd_compr_stream *cstream,
>  			      struct snd_compr_caps *caps)
>  {
>  	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
> -	struct snd_soc_component *component;
> -	int i, ret = 0;
> +	int ret;
>  
>  	mutex_lock_nested(&rtd->card->pcm_mutex, rtd->card-
> >pcm_subclass);
>  
> -	for_each_rtd_components(rtd, i, component) {
> -		if (!component->driver->compress_ops ||
> -		    !component->driver->compress_ops->get_caps)
> -			continue;
> -
> -		ret = component->driver->compress_ops->get_caps(
> -			component, cstream, caps);
> -		break;
> -	}
> +	ret = snd_soc_component_compr_get_caps(cstream, caps);
Morimoto-san,

Do you think it makes sense to remove soc_compr_get_caps() altogether
after adding snd_soc_component_cpmpr_get_caps() and calling it directly
instead?

Thanks,
Ranjani

