Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A73ED1B51D2
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 03:33:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 454B716D4;
	Thu, 23 Apr 2020 03:32:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 454B716D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587605589;
	bh=hg4R2rQbZgG0SNuNufogi51/JqB6Cag3PYCU5WcACjk=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gx6PwveUsqYtPZMcmvIEbOACzNb3oQ74tFbT3jDBug3ba8NT8TLCoNEREimpzrzTv
	 B4NueYdMsZAk72S2CZxikt064DLcF7KB06a6h9DbVDnyyv+QNxgLwbzoTFDOkAfRM+
	 A29Qwrc2NkrhJla92p6N7HrxtqKmKGx6v+3v5xt4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5796BF800FF;
	Thu, 23 Apr 2020 03:31:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D48EF801D9; Thu, 23 Apr 2020 03:31:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24183F80108
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 03:31:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24183F80108
IronPort-SDR: FSjc1tK7YyOeEYT3K8VHAKBoSt1rneep06Z6UlTB/colpz7Wp6CHNIgva2JAQBW2WCJB0L9b3k
 pr0KGN9kcoQQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 18:31:14 -0700
IronPort-SDR: 7V5Spp3h68zO7hO6BFfwLW3KWFCuOEBUcuduE0PRtQgM3x7vYEXaZ9nAy178xWHfnf+1tCgTJo
 dc/MVyrWIUhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,305,1583222400"; d="scan'208";a="456725404"
Received: from aacostaz-mobl.amr.corp.intel.com ([10.255.74.8])
 by fmsmga005.fm.intel.com with ESMTP; 22 Apr 2020 18:31:13 -0700
Message-ID: <263fb934bf4808c0ddcc024df32ef1f385dad45b.camel@linux.intel.com>
Subject: Re: [PATCH 10/17] ASoC: soc-dai: add snd_soc_dai_compr_shutdown()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Wed, 22 Apr 2020 18:31:13 -0700
In-Reply-To: <87mu73t8mu.wl-kuninori.morimoto.gx@renesas.com>
References: <871rofunaq.wl-kuninori.morimoto.gx@renesas.com>
 <87mu73t8mu.wl-kuninori.morimoto.gx@renesas.com>
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

On Thu, 2020-04-23 at 08:15 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> dai related function should be implemented at soc-dai.c.
> This patch adds snd_soc_dai_compr_shutdown().
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-dai.h  |  2 ++
>  sound/soc/soc-compress.c | 12 ++++--------
>  sound/soc/soc-dai.c      |  9 +++++++++
>  3 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
> index deb99b1469b4..abf4ad25ce68 100644
> --- a/include/sound/soc-dai.h
> +++ b/include/sound/soc-dai.h
> @@ -172,6 +172,8 @@ int snd_soc_pcm_dai_bespoke_trigger(struct
> snd_pcm_substream *substream,
>  
>  int snd_soc_dai_compr_startup(struct snd_soc_dai *dai,
>  			      struct snd_compr_stream *cstream);
> +void snd_soc_dai_compr_shutdown(struct snd_soc_dai *dai,
> +				struct snd_compr_stream *cstream);
>  
>  struct snd_soc_dai_ops {
>  	/*
> diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
> index 4065e7b4138d..945d1d15e1d2 100644
> --- a/sound/soc/soc-compress.c
> +++ b/sound/soc/soc-compress.c
> @@ -114,8 +114,7 @@ static int soc_compr_open(struct snd_compr_stream
> *cstream)
>  machine_err:
>  	soc_compr_components_free(cstream, component);
>  
> -	if (cpu_dai->driver->cops && cpu_dai->driver->cops->shutdown)
> -		cpu_dai->driver->cops->shutdown(cstream, cpu_dai);
> +	snd_soc_dai_compr_shutdown(cpu_dai, cstream);
>  out:
>  	mutex_unlock(&rtd->card->pcm_mutex);
>  pm_err:
> @@ -204,8 +203,7 @@ static int soc_compr_open_fe(struct
> snd_compr_stream *cstream)
>  machine_err:
>  	soc_compr_components_free(cstream, component);
>  open_err:
> -	if (cpu_dai->driver->cops && cpu_dai->driver->cops->shutdown)
> -		cpu_dai->driver->cops->shutdown(cstream, cpu_dai);
> +	snd_soc_dai_compr_shutdown(cpu_dai, cstream);
>  out:
>  	dpcm_path_put(&list);
>  be_err:
> @@ -244,8 +242,7 @@ static int soc_compr_free(struct snd_compr_stream
> *cstream)
>  
>  	soc_compr_components_free(cstream, NULL);
>  
> -	if (cpu_dai->driver->cops && cpu_dai->driver->cops->shutdown)
> -		cpu_dai->driver->cops->shutdown(cstream, cpu_dai);
> +	snd_soc_dai_compr_shutdown(cpu_dai, cstream);
>  
>  	snd_soc_dapm_stream_stop(rtd, stream);
>  
> @@ -301,8 +298,7 @@ static int soc_compr_free_fe(struct
> snd_compr_stream *cstream)
>  
>  	soc_compr_components_free(cstream, NULL);
>  
> -	if (cpu_dai->driver->cops && cpu_dai->driver->cops->shutdown)
> -		cpu_dai->driver->cops->shutdown(cstream, cpu_dai);
> +	snd_soc_dai_compr_shutdown(cpu_dai, cstream);
>  
>  	mutex_unlock(&fe->card->mutex);
>  	return 0;
> diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
> index 5c88f80b781d..d5cb8b0853a7 100644
> --- a/sound/soc/soc-dai.c
> +++ b/sound/soc/soc-dai.c
> @@ -517,3 +517,12 @@ int snd_soc_dai_compr_startup(struct snd_soc_dai
> *dai,
>  	return soc_dai_ret(dai, ret);
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_dai_compr_startup);
> +
> +void snd_soc_dai_compr_shutdown(struct snd_soc_dai *dai,
> +				struct snd_compr_stream *cstream)
> +{
> +	if (dai->driver->cops &&
> +	    dai->driver->cops->shutdown)
> +		dai->driver->cops->shutdown(cstream, dai);
I see the original code doesnt check the return value. But I think we
should here, no?

Thanks,
Ranjani

