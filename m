Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 531BB1ED526
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 19:42:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 680CB1674;
	Wed,  3 Jun 2020 19:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 680CB1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591206157;
	bh=6d/lNrYXZkGUZSdAiwjscDZMsCe6/imtXMFsoRTufmg=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QeFPNIml7p8Du09FUz6ViawnFTuVr3ErKDxldbeA/HCS9iHHflIbLu+3HBun3oTjQ
	 l7DC4HUXcj4DhbiwcQ1ne17KtOpmOxssxsTA5HgPksluQ95+lbu6r7U0ABZOSYwP38
	 OdLJkakTo83I9kmSEnQ/OBUCLcoehoqOXGBQ5Xo4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF774F80227;
	Wed,  3 Jun 2020 19:41:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F038AF8013D; Wed,  3 Jun 2020 19:41:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36547F8013D
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 19:41:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36547F8013D
IronPort-SDR: 8oaJ/cjzUoOS7FPSclswy6NhcZ8vgpgvqjhvxTB69dWQU/rNy5EJUOPZ7Mv1TgiRYiiceOg+61
 WfYcZJe7dc4A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 10:41:33 -0700
IronPort-SDR: CbkUBWrtGsFY5AxrwI/2z+SdUhtKgh63u9hZZQwmvTcZ9o1qzRFD1wyA+gUqTo/+cgdp6jm8pb
 hRC6vENNX0rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,468,1583222400"; d="scan'208";a="294048649"
Received: from unknown (HELO ranjani-desktop) ([10.254.43.45])
 by fmsmga004.fm.intel.com with ESMTP; 03 Jun 2020 10:41:32 -0700
Message-ID: <9a80e33f7dfac76becb4ee306e60ff9a20669f96.camel@linux.intel.com>
Subject: Re: [PATCH 20/24] ASoC: soc-component: add
 snd_soc_component_compr_get_metadata()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Wed, 03 Jun 2020 10:41:32 -0700
In-Reply-To: <87h7vvy3ag.wl-kuninori.morimoto.gx@renesas.com>
References: <87a71nzhy2.wl-kuninori.morimoto.gx@renesas.com>
 <87h7vvy3ag.wl-kuninori.morimoto.gx@renesas.com>
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

On Mon, 2020-06-01 at 10:37 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> component related function should be implemented at
> soc-component.c.
> This patch adds snd_soc_component_compr_get_metadata().
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-component.h |  2 ++
>  sound/soc/soc-component.c     | 18 ++++++++++++++++++
>  sound/soc/soc-compress.c      | 14 +++-----------
>  3 files changed, 23 insertions(+), 11 deletions(-)
> 
> diff --git a/include/sound/soc-component.h b/include/sound/soc-
> component.h
> index ce1df96bb274..5b8a4d847089 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -456,6 +456,8 @@ int snd_soc_component_compr_copy(struct
> snd_compr_stream *cstream,
>  				 char __user *buf, size_t count);
>  int snd_soc_component_compr_set_metadata(struct snd_compr_stream
> *cstream,
>  					 struct snd_compr_metadata
> *metadata);
> +int snd_soc_component_compr_get_metadata(struct snd_compr_stream
> *cstream,
> +					 struct snd_compr_metadata
> *metadata);
>  
>  int snd_soc_pcm_component_pointer(struct snd_pcm_substream
> *substream);
>  int snd_soc_pcm_component_ioctl(struct snd_pcm_substream *substream,
> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index 1ac353cf48c5..45a5c496454a 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -612,6 +612,24 @@ int snd_soc_component_compr_set_metadata(struct
> snd_compr_stream *cstream,
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_component_compr_set_metadata);
>  
> +int snd_soc_component_compr_get_metadata(struct snd_compr_stream
> *cstream,
> +					 struct snd_compr_metadata
> *metadata)
> +{
> +	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
> +	struct snd_soc_component *component;
> +	int i;
> +
> +	for_each_rtd_components(rtd, i, component) {
> +		if (component->driver->compress_ops &&
> +		    component->driver->compress_ops->get_metadata)
> +			return component->driver->compress_ops-
> >get_metadata(
> +				component, cstream, metadata);
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_component_compr_get_metadata);
> +
>  int snd_soc_pcm_component_pointer(struct snd_pcm_substream
> *substream)
>  {
>  	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
> index 62925adb1042..475722adb2a5 100644
> --- a/sound/soc/soc-compress.c
> +++ b/sound/soc/soc-compress.c
> @@ -546,24 +546,16 @@ static int soc_compr_get_metadata(struct
> snd_compr_stream *cstream,
>  				  struct snd_compr_metadata *metadata)
>  {
>  	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
> -	struct snd_soc_component *component;
>  	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> -	int i, ret;
> +	int ret;
>  
>  	ret = snd_soc_dai_compr_get_metadata(cpu_dai, cstream,
> metadata);
>  	if (ret < 0)
>  		return ret;
>  
> -	for_each_rtd_components(rtd, i, component) {
> -		if (!component->driver->compress_ops ||
> -		    !component->driver->compress_ops->get_metadata)
> -			continue;
> +	ret = snd_soc_component_compr_get_metadata(cstream, metadata);
>  
> -		return component->driver->compress_ops->get_metadata(
> -			component, cstream, metadata);
> -	}
> -
> -	return 0;
> +	return ret;
same here.
return snd_soc_component_compr_get_metadata(cstream, metadata);?

Thanks,
Ranjani

