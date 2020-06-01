Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6971EABE8
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jun 2020 20:23:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3A4E16D4;
	Mon,  1 Jun 2020 20:23:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3A4E16D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591035836;
	bh=Z6XBI/I1zuqA5rVUuroBgRx8vvobh+FcSrPDrjle+W4=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EiJ29yOwgeajCP2Q9a7spxCxpG6xKNrR6ZehzAIN+cqTLeWTKfM9OrH679snXrOKs
	 WeJl4uK7OVy4dRB7PasV1VQ6ZjRxyZ9P5wQwTq5oZBAinUntkWP/qxeeiPkXdHLV2r
	 aXdR32huzVlP9TSIZFNQge5T+Dv1S7YQNckmtmso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83672F80159;
	Mon,  1 Jun 2020 20:22:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23BB4F801ED; Mon,  1 Jun 2020 20:22:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 109EEF80159
 for <alsa-devel@alsa-project.org>; Mon,  1 Jun 2020 20:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 109EEF80159
IronPort-SDR: W2Vt8fL/idalj+7kLuQv4l6OS8pbB9SOBoY5NrqDShcODkMwAiRvBg8m8GhoO2kqn1O7qDHLBm
 m4cQzXDtf48w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2020 11:22:00 -0700
IronPort-SDR: 4mVUp9aTuXPy6uB49h1fuLtZmfgOX6S0p2gY4ITWXZKUdyFiorWDj9S0zqFunq3v+jP2dbwaJb
 N+AfdlSJ3DYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,461,1583222400"; d="scan'208";a="303972990"
Received: from wisniew1-desk.ger.corp.intel.com ([10.254.183.35])
 by orsmga008.jf.intel.com with ESMTP; 01 Jun 2020 11:22:00 -0700
Message-ID: <b5420b0e0f33a8bfa1b9b625afa0b429d97fa9c5.camel@linux.intel.com>
Subject: Re: [PATCH 05/24] ASoC: soc-component: add
 snd_soc_pcm_component_prepare()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Mon, 01 Jun 2020 11:22:00 -0700
In-Reply-To: <87367fzhwx.wl-kuninori.morimoto.gx@renesas.com>
References: <87a71nzhy2.wl-kuninori.morimoto.gx@renesas.com>
 <87367fzhwx.wl-kuninori.morimoto.gx@renesas.com>
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

On Mon, 2020-06-01 at 10:36 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> We have 2 type of component functions
> snd_soc_component_xxx()     is focusing to component itself,
> snd_soc_pcm_component_xxx() is focusing to rtd related component.
> 
> Now we can update snd_soc_component_prepare() to
> snd_soc_pcm_component_prepare(). This patch do it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-component.h |  3 +--
>  sound/soc/soc-component.c     | 28 +++++++++++++++++-----------
>  sound/soc/soc-pcm.c           | 13 +++++--------
>  3 files changed, 23 insertions(+), 21 deletions(-)
> 
> diff --git a/include/sound/soc-component.h b/include/sound/soc-
> component.h
> index cb0d34fa77c6..fc287e910240 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -426,8 +426,6 @@ int snd_soc_component_open(struct
> snd_soc_component *component,
>  			   struct snd_pcm_substream *substream);
>  int snd_soc_component_close(struct snd_soc_component *component,
>  			    struct snd_pcm_substream *substream);
> -int snd_soc_component_prepare(struct snd_soc_component *component,
> -			      struct snd_pcm_substream *substream);
>  int snd_soc_component_hw_params(struct snd_soc_component *component,
>  				struct snd_pcm_substream *substream,
>  				struct snd_pcm_hw_params *params);
> @@ -460,5 +458,6 @@ int snd_soc_pcm_component_mmap(struct
> snd_pcm_substream *substream,
>  			       struct vm_area_struct *vma);
>  int snd_soc_pcm_component_new(struct snd_soc_pcm_runtime *rtd);
>  void snd_soc_pcm_component_free(struct snd_soc_pcm_runtime *rtd);
> +int snd_soc_pcm_component_prepare(struct snd_pcm_substream
> *substream);
>  
>  #endif /* __SOC_COMPONENT_H */
> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index 6d29c2de3b24..1bc155bc8e5e 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -275,17 +275,6 @@ int snd_soc_component_close(struct
> snd_soc_component *component,
>  	return soc_component_ret(component, ret);
>  }
>  
> -int snd_soc_component_prepare(struct snd_soc_component *component,
> -			      struct snd_pcm_substream *substream)
> -{
> -	int ret = 0;
> -
> -	if (component->driver->prepare)
> -		ret = component->driver->prepare(component, substream);
> -
> -	return soc_component_ret(component, ret);
> -}
> -
>  int snd_soc_component_hw_params(struct snd_soc_component *component,
>  				struct snd_pcm_substream *substream,
>  				struct snd_pcm_hw_params *params)
> @@ -569,3 +558,20 @@ void snd_soc_pcm_component_free(struct
> snd_soc_pcm_runtime *rtd)
>  		if (component->driver->pcm_destruct)
>  			component->driver->pcm_destruct(component, rtd-
> >pcm);
>  }
> +
> +int snd_soc_pcm_component_prepare(struct snd_pcm_substream
> *substream)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_component *component;
> +	int i, ret;
> +
> +	for_each_rtd_components(rtd, i, component) {
> +		if (component->driver->prepare) {
> +			ret = component->driver->prepare(component,
> substream);
> +			if (ret < 0)
> +				return soc_component_ret(component,
> ret);
> +		}
> +	}
> +
> +	return 0;
> +}
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 276505fb9d50..e61e7a56d95e 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -850,7 +850,6 @@ static void codec2codec_close_delayed_work(struct
> snd_soc_pcm_runtime *rtd)
>  static int soc_pcm_prepare(struct snd_pcm_substream *substream)
>  {
>  	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> -	struct snd_soc_component *component;
>  	struct snd_soc_dai *dai;
>  	int i, ret = 0;
>  
> @@ -860,13 +859,11 @@ static int soc_pcm_prepare(struct
> snd_pcm_substream *substream)
>  	if (ret < 0)
>  		goto out;
>  
> -	for_each_rtd_components(rtd, i, component) {
> -		ret = snd_soc_component_prepare(component, substream);
> -		if (ret < 0) {
> -			dev_err(component->dev,
> -				"ASoC: platform prepare error: %d\n",
> ret);
> -			goto out;
> -		}
> +	ret = snd_soc_pcm_component_prepare(substream);
> +	if (ret < 0) {
> +		dev_err(rtd->dev,
> +			"ASoC: platform prepare error: %d\n", ret);
Morimoto-san,
We should remove this. This will be a duplicate error message as
snd_soc_pcm_component_prepare() would already print the error before
returning.

Thanks,
Ranjani

