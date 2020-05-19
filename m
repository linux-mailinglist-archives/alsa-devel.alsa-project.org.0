Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D3A1D8D43
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 03:50:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3CBB117B7;
	Tue, 19 May 2020 03:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3CBB117B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589853006;
	bh=SBa/OfHb+0XECSQTNg4/pNe7ubfFfbxvfjaTx5s9w0M=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cvp7z8jTNP26jJRLFOdh3HHdlWNAiZDLe3EuohDgo1MfkXTUWWLqjxhSQdeqKriGa
	 u/cmKUpCoDVFda9zFY5g2LjA+jWESWyJeOdeRdfx6r0q8OpANPXMv0aHYvLeOlbej+
	 kUeiFvf2+xB3OHOmsAQiL228P50wJc0uFma1EDxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64817F800C9;
	Tue, 19 May 2020 03:48:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3DEDF801A3; Tue, 19 May 2020 03:48:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A7BEF800C9
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 03:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A7BEF800C9
IronPort-SDR: Uxg6jvFHOLiJXRHw9P8g52c3Ci7FDgIWcF/dffRwkAxYpRaetP2BxGlh1B5lYLtU54l7Txue7+
 BsDoBp3W3iKg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 18:48:13 -0700
IronPort-SDR: rUF6AcriXa3r6DUE3ZHlH1V6QE3GpnjrvVdLC2VtyYk4F6dW4YwEZRDXt742/WMXH/So/GH+LV
 hEaNND0uHC1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,408,1583222400"; d="scan'208";a="342986310"
Received: from kciepluc-mobl.ger.corp.intel.com ([10.254.182.89])
 by orsmga001.jf.intel.com with ESMTP; 18 May 2020 18:48:13 -0700
Message-ID: <820348bcf4956e42fc856bf80db198b9521eb951.camel@linux.intel.com>
Subject: Re: [PATCH 5/7] ASoC: soc-link: add snd_soc_link_compr_startup()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Mon, 18 May 2020 18:47:56 -0700
In-Reply-To: <87zha44u0d.wl-kuninori.morimoto.gx@renesas.com>
References: <877dx868op.wl-kuninori.morimoto.gx@renesas.com>
 <87zha44u0d.wl-kuninori.morimoto.gx@renesas.com>
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

On Tue, 2020-05-19 at 10:02 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> dai_link related function should be implemented at soc-link.c.
> This patch adds snd_soc_link_compr_startup().
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-link.h |  3 +++
>  sound/soc/soc-compress.c | 23 ++++++-----------------
>  sound/soc/soc-link.c     | 13 +++++++++++++
>  3 files changed, 22 insertions(+), 17 deletions(-)
> 
> diff --git a/include/sound/soc-link.h b/include/sound/soc-link.h
> index aae72f668de6..c152576cbd87 100644
> --- a/include/sound/soc-link.h
> +++ b/include/sound/soc-link.h
> @@ -20,4 +20,7 @@ int snd_soc_link_hw_params(struct snd_pcm_substream
> *substream,
>  void snd_soc_link_hw_free(struct snd_pcm_substream *substream);
>  int snd_soc_link_trigger(struct snd_pcm_substream *substream, int
> cmd);
>  
> +int snd_soc_link_compr_startup(struct snd_soc_pcm_runtime *rtd,
> +			       struct snd_compr_stream *cstream);
> +
>  #endif /* __SOC_LINK_H */
> diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
> index 62ece729e425..35b0af86325a 100644
> --- a/sound/soc/soc-compress.c
> +++ b/sound/soc/soc-compress.c
> @@ -95,15 +95,9 @@ static int soc_compr_open(struct snd_compr_stream
> *cstream)
>  	if (ret < 0)
>  		goto machine_err;
>  
> -	if (rtd->dai_link->compr_ops && rtd->dai_link->compr_ops-
> >startup) {
> -		ret = rtd->dai_link->compr_ops->startup(cstream);
> -		if (ret < 0) {
> -			dev_err(rtd->dev,
> -				"Compress ASoC: %s startup failed:
> %d\n",
> -				rtd->dai_link->name, ret);
> -			goto machine_err;
> -		}
> -	}
> +	ret = snd_soc_link_compr_startup(rtd, cstream);
> +	if (ret < 0)
> +		goto machine_err;
>  
>  	snd_soc_runtime_activate(rtd, cstream->direction);
>  
> @@ -179,14 +173,9 @@ static int soc_compr_open_fe(struct
> snd_compr_stream *cstream)
>  	if (ret < 0)
>  		goto open_err;
>  
> -	if (fe->dai_link->compr_ops && fe->dai_link->compr_ops-
> >startup) {
> -		ret = fe->dai_link->compr_ops->startup(cstream);
> -		if (ret < 0) {
> -			pr_err("Compress ASoC: %s startup failed:
> %d\n",
> -			       fe->dai_link->name, ret);
> -			goto machine_err;
> -		}
> -	}
> +	ret = snd_soc_link_compr_startup(fe, cstream);
> +	if (ret < 0)
> +		goto machine_err;
>  
>  	dpcm_clear_pending_state(fe, stream);
>  	dpcm_path_put(&list);
> diff --git a/sound/soc/soc-link.c b/sound/soc/soc-link.c
> index a735b3ba2385..dddc4a35a0ac 100644
> --- a/sound/soc/soc-link.c
> +++ b/sound/soc/soc-link.c
> @@ -112,3 +112,16 @@ int snd_soc_link_trigger(struct
> snd_pcm_substream *substream, int cmd)
>  
>  	return soc_link_ret(rtd, ret);
>  }
> +
> +int snd_soc_link_compr_startup(struct snd_soc_pcm_runtime *rtd,
> +			       struct snd_compr_stream *cstream)
Can we do the same think as for pcm substream and remove the rtd param?

Thanks,
Ranjani

