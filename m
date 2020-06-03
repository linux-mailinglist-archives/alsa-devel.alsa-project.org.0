Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3B61ED49A
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jun 2020 18:57:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C77701664;
	Wed,  3 Jun 2020 18:56:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C77701664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591203466;
	bh=Ttn9hgjcpTRzYSdTVbKH9PW3tS6WUW0z+ZBBzTvqYac=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pK0GDgXUtRJ6519iA/gXXsgNC7xpEKVnBQOt34c++y3YXPEBncNvDjrnGY+b+IsV9
	 n2zH4uYkrGRtWUNHdeiuzVgKxWkBZxP2I0O4aYKUW5hUCZidmPf9Bj+Zo2O/XoX1Eo
	 6fIRiFnLWzjsuKxU2dRp6/lVUQYvvMydtZtTcMg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 021C3F800BC;
	Wed,  3 Jun 2020 18:56:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2678EF801ED; Wed,  3 Jun 2020 18:56:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7348FF800D0
 for <alsa-devel@alsa-project.org>; Wed,  3 Jun 2020 18:55:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7348FF800D0
IronPort-SDR: uM4lm53Au4fnljRA1CpdSZy+MAnCUA9D6feot3t0V/i1tCSVzM4jh9cJPNZcwX0sgLfn+vPc1Q
 pSI6L4o0XbDg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 09:55:52 -0700
IronPort-SDR: wgQaeNhJaUc68GmLFF+DBGvVOkFIW2CLn41MPYdHJoxaC73zKXrEYdka66Ez773o2yJlEwpE7r
 4q/lH2r7cP5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,468,1583222400"; d="scan'208";a="471202298"
Received: from unknown (HELO ranjani-desktop) ([10.254.43.45])
 by fmsmga005.fm.intel.com with ESMTP; 03 Jun 2020 09:55:52 -0700
Message-ID: <86ef3a145dec2c08bce4fa0218e25af56b94fda3.camel@linux.intel.com>
Subject: Re: [PATCH 09/24] ASoC: soc-component: add
 snd_soc_component_compr_open()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Wed, 03 Jun 2020 09:55:52 -0700
In-Reply-To: <87wo4ry3bz.wl-kuninori.morimoto.gx@renesas.com>
References: <87a71nzhy2.wl-kuninori.morimoto.gx@renesas.com>
 <87wo4ry3bz.wl-kuninori.morimoto.gx@renesas.com>
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
> component related function should be implemented at
> soc-component.c.
> This patch moves soc-compress soc_compr_components_open()
> to soc-component as snd_soc_component_compr_open().
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-component.h |  2 ++
>  sound/soc/soc-component.c     | 23 +++++++++++++++++++++++
>  sound/soc/soc-compress.c      | 31 ++-----------------------------
>  3 files changed, 27 insertions(+), 29 deletions(-)
> 
> diff --git a/include/sound/soc-component.h b/include/sound/soc-
> component.h
> index bb26d55a9289..4f82839948d6 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -436,6 +436,8 @@ int snd_soc_component_of_xlate_dai_id(struct
> snd_soc_component *component,
>  int snd_soc_component_of_xlate_dai_name(struct snd_soc_component
> *component,
>  					struct of_phandle_args *args,
>  					const char **dai_name);
> +int snd_soc_component_compr_open(struct snd_compr_stream *cstream,
> +				 struct snd_soc_component **last);
>  
>  int snd_soc_pcm_component_pointer(struct snd_pcm_substream
> *substream);
>  int snd_soc_pcm_component_ioctl(struct snd_pcm_substream *substream,
> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index 150b02be0219..c2a6046a6380 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -384,6 +384,29 @@
> EXPORT_SYMBOL_GPL(snd_soc_component_exit_regmap);
>  
>  #endif
>  
> +int snd_soc_component_compr_open(struct snd_compr_stream *cstream,
> +				 struct snd_soc_component **last)
> +{
> +	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
> +	struct snd_soc_component *component;
> +	int i, ret;
> +
> +	for_each_rtd_components(rtd, i, component) {
> +		if (component->driver->compress_ops &&
> +		    component->driver->compress_ops->open) {
> +			ret = component->driver->compress_ops-
> >open(component, cstream);
> +			if (ret < 0) {
> +				*last = component;
> +				return soc_component_ret(component,
> ret);
> +			}
> +		}
> +	}
> +
> +	*last = NULL;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_component_compr_open);
> +
>  int snd_soc_pcm_component_pointer(struct snd_pcm_substream
> *substream)
>  {
>  	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
> index 4984b6a2c370..2a0d554013a4 100644
> --- a/sound/soc/soc-compress.c
> +++ b/sound/soc/soc-compress.c
> @@ -22,33 +22,6 @@
>  #include <sound/soc-link.h>
>  #include <linux/pm_runtime.h>
>  
> -static int soc_compr_components_open(struct snd_compr_stream
> *cstream,
> -				     struct snd_soc_component **last)
> -{
> -	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
> -	struct snd_soc_component *component;
> -	int i, ret;
> -
> -	for_each_rtd_components(rtd, i, component) {
> -		if (!component->driver->compress_ops ||
> -		    !component->driver->compress_ops->open)
> -			continue;
> -
> -		ret = component->driver->compress_ops->open(component,
> cstream);
> -		if (ret < 0) {
> -			dev_err(component->dev,
> -				"Compress ASoC: can't open platform %s:
> %d\n",
> -				component->name, ret);
> -
> -			*last = component;
> -			return ret;
> -		}
> -	}
> -
> -	*last = NULL;
> -	return 0;
> -}
> -
>  static int soc_compr_components_free(struct snd_compr_stream
> *cstream,
>  				     struct snd_soc_component *last)
>  {
> @@ -92,7 +65,7 @@ static int soc_compr_open(struct snd_compr_stream
> *cstream)
>  	if (ret < 0)
>  		goto out;
>  
> -	ret = soc_compr_components_open(cstream, &component);
> +	ret = snd_soc_component_compr_open(cstream, &component);
If you do decide to keep your changes to move all these functions to
soc-component.c, we need to include soc-component.h in soc-compress.c
isnt it?

Thanks,
Ranjani

