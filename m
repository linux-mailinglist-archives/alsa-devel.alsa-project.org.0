Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3DF2B0AAE
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 17:47:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 082DC184A;
	Thu, 12 Nov 2020 17:46:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 082DC184A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605199641;
	bh=+OD1H+PQL0+julAcOmqfl0YvGeLkkGqI5h5kzpkWBq4=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g6vR2BtDji+Cl/yYw7V2W6fKbTyflHHRr6cb4lNUs9kng4e1j7HhMYdvmOb1MWbt9
	 MEG3Zd5gFEqEAagpWzkBYQtjGMAXkqlRF5WHSkCCwZIVwE0RA52Dz/Rttb5Ci19Aso
	 rkWZKt8dmntb3aFuTRLYiOEoZ5KuLEAJ/Rv9bYB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A0ABF804D8;
	Thu, 12 Nov 2020 17:45:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3213AF804D6; Thu, 12 Nov 2020 17:45:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1954F804C3
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 17:44:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1954F804C3
IronPort-SDR: BRc0Ir94r8mE/y2gDYZEOugSBgf++bV5L5naBbsPiXQJLR2Z08IO128wl1APQBKq8VfNUHfKq5
 U1DiEjjPu66w==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="255048497"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="255048497"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:44:21 -0800
IronPort-SDR: Aja4qnK+Ky7te7O1hSqpqRH+mgOdOHtxm/zx9ijqIydsn1M1aIU3DR85u+Luvt3+6sOCJ+YBX1
 aVQoWcVeGEUQ==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="532232049"
Received: from rtrevino-mobl2.amr.corp.intel.com ([10.212.195.40])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:44:20 -0800
Message-ID: <ea26b6dfe07cf5faefa21fde0b90698aaa5506fb.camel@linux.intel.com>
Subject: Re: [PATCH 07/12] ASoC: soc-component: add
 snd_soc_component_compr_get_codec_caps()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Thu, 12 Nov 2020 08:44:19 -0800
In-Reply-To: <87y2j76vq3.wl-kuninori.morimoto.gx@renesas.com>
References: <878sb78ac4.wl-kuninori.morimoto.gx@renesas.com>
 <87y2j76vq3.wl-kuninori.morimoto.gx@renesas.com>
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
> This patch adds snd_soc_component_compr_get_codec_caps().
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
> index 7fd45462963e..d91e0eb1546d 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -455,6 +455,8 @@ int snd_soc_component_compr_get_params(struct
> snd_compr_stream *cstream,
>  				       struct snd_codec *params);
>  int snd_soc_component_compr_get_caps(struct snd_compr_stream
> *cstream,
>  				     struct snd_compr_caps *caps);
> +int snd_soc_component_compr_get_codec_caps(struct snd_compr_stream
> *cstream,
> +					   struct snd_compr_codec_caps
> *codec);
>  
>  int snd_soc_pcm_component_pointer(struct snd_pcm_substream
> *substream);
>  int snd_soc_pcm_component_ioctl(struct snd_pcm_substream *substream,
> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index 6f560238e2f9..2f1628100208 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -545,6 +545,27 @@ int snd_soc_component_compr_get_caps(struct
> snd_compr_stream *cstream,
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_component_compr_get_caps);
>  
> +int snd_soc_component_compr_get_codec_caps(struct snd_compr_stream
> *cstream,
> +					   struct snd_compr_codec_caps
> *codec)
> +{
> +	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
> +	struct snd_soc_component *component;
> +	int i, ret;
> +
> +	for_each_rtd_components(rtd, i, component) {
> +		if (component->driver->compress_ops &&
> +		    component->driver->compress_ops->get_codec_caps) {
> +			ret = component->driver->compress_ops-
> >get_codec_caps(
> +				component, cstream, codec);
> +			if (ret < 0)
> +				return soc_component_ret(component,
> ret);
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_component_compr_get_codec_caps);
same comment for get_codec_caps() as well. We can maybe use this
directly instead of soc_compr_get_codec_caps()?

Thanks,Ranjani

