Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C27451AD5B9
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 07:41:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AC931663;
	Fri, 17 Apr 2020 07:40:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AC931663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587102083;
	bh=woSlDmlzf1jA/qkMPVbVyolL0thaFa9NKS8WE3P/+cA=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f65+zIM2E730DwQyqIv5DBP8VJEcGK3+TU8egkx4vZtjZFgoLVe3Pa5lLKKDtp15z
	 +lq4quFKhBA8p8dDs+qShxgpV/qUak5t94INqGNYBCjX7ySOtCm1EHbg+kpskGVZBr
	 3ROZ4CaF4KI9KFHrX6wgLKyCzj2tXgLfh8bCS1sA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66F4DF80229;
	Fri, 17 Apr 2020 07:39:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E19BF80229; Fri, 17 Apr 2020 07:39:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC0EFF800DE
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 07:39:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC0EFF800DE
IronPort-SDR: Xj8xGkMHPmk+5PUVnyRzDRgUJs3JlGa9NKcxBea03wYCCu8426+uCXigxDc5OghitoNqd5/vzA
 3IckUL0f4ybA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 22:39:22 -0700
IronPort-SDR: +QpNRraDP65NXho9pExymThFg0H2a9AQh22+f+Nkwd7qr4r6M1gyNvwk3tbcfNbhrLaqtlN3Pl
 zo6iKAxbZeKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,393,1580803200"; d="scan'208";a="242899356"
Received: from suem-mobl1.amr.corp.intel.com ([10.251.128.210])
 by orsmga007.jf.intel.com with ESMTP; 16 Apr 2020 22:39:22 -0700
Message-ID: <9401d09f060ea3143c4304fd2944dafe738f1643.camel@linux.intel.com>
Subject: Re: [PATCH 6/8] ASoC: sof: use snd_compress_ops
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Thu, 16 Apr 2020 22:39:20 -0700
In-Reply-To: <873692puof.wl-kuninori.morimoto.gx@renesas.com>
References: <87blnqpuqp.wl-kuninori.morimoto.gx@renesas.com>
 <873692puof.wl-kuninori.morimoto.gx@renesas.com>
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

On Fri, 2020-04-17 at 14:06 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> We can use snd_compress_ops.
> Let's switch to use it.
> 
> Upstream code doesn't have sof_compressed_ops.
> This patch assume it is implemented at out-of-tree.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/sof/compress.c | 34 +++++++++++++++++++++-------------
>  sound/soc/sof/compress.h | 34 +++++++++++++++++++++-------------
>  sound/soc/sof/pcm.c      |  4 ++--
>  sound/soc/sof/sof-priv.h |  2 +-
>  4 files changed, 45 insertions(+), 29 deletions(-)
> 
> diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
> index 7354dc6a49cf..52a1d7ed97a5 100644
> --- a/sound/soc/sof/compress.c
> +++ b/sound/soc/sof/compress.c
> @@ -13,13 +13,14 @@
>  #include "ops.h"
>  #include "probe.h"
>  
> -struct snd_compr_ops sof_probe_compressed_ops = {
> +struct snd_compress_ops sof_probe_compressed_ops = {
>  	.copy		= sof_probe_compr_copy,
>  };
>  EXPORT_SYMBOL(sof_probe_compressed_ops);
Morimoto-san,

This change is correct based on your new snd_compress_ops. And the only
change we need is for the copy op in sof_probe_compressed_ops.

>  
> -int sof_probe_compr_open(struct snd_compr_stream *cstream,
> -		struct snd_soc_dai *dai)
> +int sof_probe_compr_open(struct snd_soc_component *component,
> +			 struct snd_compr_stream *cstream,
> +			 struct snd_soc_dai *dai)

But this one seems incorrect? This op (and the ones below except for
copy) is actually the startup op in struct snd_soc_cdai_ops. 
>  {
>  	struct snd_sof_dev *sdev =
>  				snd_soc_component_get_drvdata(dai-
> >component);
> @@ -36,8 +37,9 @@ int sof_probe_compr_open(struct snd_compr_stream
> *cstream,
>  }
>  EXPORT_SYMBOL(sof_probe_compr_open);
>  
> -int sof_probe_compr_free(struct snd_compr_stream *cstream,
> -		struct snd_soc_dai *dai)
> +int sof_probe_compr_free(struct snd_soc_component
> *componsnd_soc_cdai_opsent,
> +			 struct snd_compr_stream *cstream,
> +		 struct snd_soc_dai *dai)
ditto
> > 
>  {
>  	struct snd_sof_dev *sdev =
>  				snd_soc_component_get_drvdata(dai-
> >component);
> @@ -68,8 +70,10 @@ int sof_probe_compr_free(struct snd_compr_stream
> *cstream,
>  }
>  EXPORT_SYMBOL(sof_probe_compr_free);
>  
> -int sof_probe_compr_set_params(struct snd_compr_stream *cstream,
> -		struct snd_compr_params *params, struct snd_soc_dai
> *dai)
> +int sof_probe_compr_set_params(struct snd_soc_component *component,
> +			       struct snd_compr_stream *cstream,
> +			       struct snd_compr_params *params,
> +			       struct snd_soc_dai *dai)
ditto
> >  {
>  	struct snd_compr_runtime *rtd = cstream->runtime;
>  	struct snd_sof_dev *sdev =
> @@ -97,8 +101,9 @@ int sof_probe_compr_set_params(struct
> snd_compr_stream *cstream,
>  }
>  EXPORT_SYMBOL(sof_probe_compr_set_params);
>  
> -int sof_probe_compr_trigger(struct snd_compr_stream *cstream, int
> cmd,
> -		struct snd_soc_dai *dai)
> +int sof_probe_compr_trigger(struct snd_soc_component *component,
> +			    struct snd_compr_stream *cstream, int cmd,
> +			    struct snd_soc_dai *dai)
ditto
>  {
>  	struct snd_sof_dev *sdev =
>  				snd_soc_component_get_drvdata(dai-
> >component);
> @@ -107,8 +112,10 @@ int sof_probe_compr_trigger(struct
> snd_compr_stream *cstream, int cmd,
>  }
>  EXPORT_SYMBOL(sof_probe_compr_trigger);
>  
> -int sof_probe_compr_pointer(struct snd_compr_stream *cstream,
> -		struct snd_compr_tstamp *tstamp, struct snd_soc_dai
> *dai)
> +int sof_probe_compr_pointer(struct snd_soc_component *component,
> +			    struct snd_compr_stream *cstream,
> +			    struct snd_compr_tstamp *tstamp,
> +			    struct snd_soc_dai *dai)
ditto
>  {
>  	struct snd_sof_dev *sdev =
>  				snd_soc_component_get_drvdata(dai-
> >component);
> @@ -117,8 +124,9 @@ int sof_probe_compr_pointer(struct
> snd_compr_stream *cstream,
>  }
>  EXPORT_SYMBOL(sof_probe_compr_pointer);
>  
> -int sof_probe_compr_copy(struct snd_compr_stream *cstream,
> -		char __user *buf, size_t count)
> +int sof_probe_compr_copy(struct snd_soc_component *component,
> +			 struct snd_compr_stream *cstream,
> +			 char __user *buf, size_t count)
This one is correct.

>  {
>  	struct snd_compr_runtime *rtd = cstream->runtime;
>  	unsigned int offset, n;
> diff --git a/sound/soc/sof/compress.h b/sound/soc/sof/compress.h
> index 800f163603e1..afc7ab9bc3c9 100644
> --- a/sound/soc/sof/compress.h
> +++ b/sound/soc/sof/compress.h
> @@ -13,19 +13,27 @@
>  
>  #include <sound/compress_driver.h>
>  
> -extern struct snd_compr_ops sof_probe_compressed_ops;
> +extern struct snd_compress_ops sof_probe_compressed_ops;
>  
> -int sof_probe_compr_open(struct snd_compr_stream *cstream,
> -		struct snd_soc_dai *dai);
> -int sof_probe_compr_free(struct snd_compr_stream *cstream,
> -		struct snd_soc_dai *dai);
> -int sof_probe_compr_set_params(struct snd_compr_stream *cstream,
> -		struct snd_compr_params *params, struct snd_soc_dai
> *dai);
> -int sof_probe_compr_trigger(struct snd_compr_stream *cstream, int
> cmd,
> -		struct snd_soc_dai *dai);
> -int sof_probe_compr_pointer(struct snd_compr_stream *cstream,
> -		struct snd_compr_tstamp *tstamp, struct snd_soc_dai
> *dai);
> -int sof_probe_compr_copy(struct snd_compr_stream *cstream,
> -		char __user *buf, size_t count);
> +int sof_probe_compr_open(struct snd_soc_component *component,
> +			 struct snd_compr_stream *cstream,
> +			 struct snd_soc_dai *dai);
> +int sof_probe_compr_free(struct snd_soc_component *component,
> +			 struct snd_compr_stream *cstream,
> +			 struct snd_soc_dai *dai);
> +int sof_probe_compr_set_params(struct snd_soc_component *component,
> +			       struct snd_compr_stream *cstream,
> +			       struct snd_compr_params *params,
> +			       struct snd_soc_dai *dai);
> +int sof_probe_compr_trigger(struct snd_soc_component *component,
> +			    struct snd_compr_stream *cstream, int cmd,
> +			    struct snd_soc_dai *dai);
> +int sof_probe_compr_pointer(struct snd_soc_component *component,
> +			    struct snd_compr_stream *cstream,
> +			    struct snd_compr_tstamp *tstamp,
> +			    struct snd_soc_dai *dai);
All of the above are part of struct snd_soc_cdai_ops.

Thanks,
Ranjani

