Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D465231288
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 21:29:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 079EF173A;
	Tue, 28 Jul 2020 21:28:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 079EF173A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595964549;
	bh=HBkf6Oqs2cqIL4CVx43zgP9E1OW8xMvjhRsKn4qNMP0=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PN/9BN5n77z+CK7gyRVQ9XI4wIkiYgHIMkvDRm/T/wD4G13KRrrmnc2tEWIOEUqcG
	 GzuyKwI7X0DQ3LwWRY3Tex85PDLpVBBeUW37upcC0kplqIaxHSrDfAIrMsxTpWSna4
	 Ry1KT9JvcFUztwbunYDk5hMS+b4qkUyLiaiz+QQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17B42F800DE;
	Tue, 28 Jul 2020 21:27:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52A0AF8021E; Tue, 28 Jul 2020 21:27:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BEA1F8012F
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 21:27:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BEA1F8012F
IronPort-SDR: mb2L2Tb7uRU4LfMEZn5d7ZgZZVkCEOyAxyC1kQZF6UkSn/blRpo/mLjoXPlwl/GwiBa04DF4t/
 NXCFEiRRVUuQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9696"; a="150465489"
X-IronPort-AV: E=Sophos;i="5.75,407,1589266800"; d="scan'208";a="150465489"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2020 12:27:15 -0700
IronPort-SDR: A6vCh40HSX//jWzqqd5vptHaPdHPBY1F0mxO6zq3n4Ua9pN9VV6KhMO/Bxm102dfcG36AgqHSM
 OGfTQWnIM5Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,407,1589266800"; d="scan'208";a="290285172"
Received: from hfranco-mobl1.amr.corp.intel.com ([10.254.52.60])
 by orsmga006.jf.intel.com with ESMTP; 28 Jul 2020 12:27:15 -0700
Message-ID: <3ec084ee58b6e3490c668295370b58a9eeb986e8.camel@linux.intel.com>
Subject: Re: [PATCH 1/7] ASoC: soc-dai: add mark for
 snd_soc_dai_startup/shutdown()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Tue, 28 Jul 2020 12:27:14 -0700
In-Reply-To: <87v9i8ku04.wl-kuninori.morimoto.gx@renesas.com>
References: <87wo2oku0m.wl-kuninori.morimoto.gx@renesas.com>
 <87v9i8ku04.wl-kuninori.morimoto.gx@renesas.com>
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

On Tue, 2020-07-28 at 15:57 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> soc_pcm_open() does rollback when failed (A),
> but, it is almost same as soc_pcm_close().
> 
> 	static int soc_pcm_open(xxx)
> 	{
> 		...
> 		if (ret < 0)
> 			goto xxx_err;
> 		...
> 		return 0;
> 
>  ^	config_err:
>  |		...
>  |	rtd_startup_err:
> (A)		...
>  |	component_err:
>  |		...
>  v		return ret;
> 	}
> 
> The difference is
> soc_pcm_close() is for all dai/component/substream,
> rollback        is for succeeded part only.
> 
> This kind of duplicated code can be a hotbed of bugs,
> thus, we want to share soc_pcm_close() and rollback.
> 
> Now, soc_pcm_open/close() are handling
> =>	1) snd_soc_dai_startup/shutdown()
> 	2) snd_soc_link_startup/shutdown()
> 	3) snd_soc_component_module_get/put()
> 	4) snd_soc_component_open/close()
> 	5) pm_runtime_put/get()
> 
> This patch is for 1) snd_soc_dai_startup/shutdown(),
> and adds new substream mark.
> It will mark substream when startup was suceeded.
> If rollback happen *after* that, it will check rollback flag
> and marked substream.
> 
> It cares *previous* startup() only now,
> but we might want to check *whole* marked substream in the future.
> This patch is using macro so that it can be easily adjust to it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-dai.h |  5 ++++-
>  sound/soc/soc-dai.c     | 21 ++++++++++++++++++++-
>  sound/soc/soc-dapm.c    |  4 ++--
>  sound/soc/soc-pcm.c     |  4 ++--
>  4 files changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
> index 776a60529e70..86411f503c1c 100644
> --- a/include/sound/soc-dai.h
> +++ b/include/sound/soc-dai.h
> @@ -153,7 +153,7 @@ void snd_soc_dai_hw_free(struct snd_soc_dai *dai,
>  int snd_soc_dai_startup(struct snd_soc_dai *dai,
>  			struct snd_pcm_substream *substream);
>  void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
> -			  struct snd_pcm_substream *substream);
> +			  struct snd_pcm_substream *substream, int
> rollback);
>  snd_pcm_sframes_t snd_soc_dai_delay(struct snd_soc_dai *dai,
>  				    struct snd_pcm_substream
> *substream);
>  void snd_soc_dai_suspend(struct snd_soc_dai *dai);
> @@ -388,6 +388,9 @@ struct snd_soc_dai {
>  
>  	struct list_head list;
>  
> +	/* function mark */
> +	struct snd_pcm_substream *mark_startup;
> +
>  	/* bit field */
>  	unsigned int probed:1;
>  };
> diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
> index 693893420bf0..4f9f73800ab0 100644
> --- a/sound/soc/soc-dai.c
> +++ b/sound/soc/soc-dai.c
> @@ -32,6 +32,14 @@ static inline int _soc_dai_ret(struct snd_soc_dai
> *dai,
>  	return ret;
>  }
>  
> +/*
> + * We might want to check substream by using list.
> + * In such case, we can update these macros.
> + */
> +#define soc_dai_mark_push(dai, substream, tgt)	((dai)-
> >mark_##tgt = substream)
> +#define soc_dai_mark_pop(dai, substream, tgt)	((dai)-
> >mark_##tgt = NULL)
> +#define soc_dai_mark_match(dai, substream, tgt)	((dai)-
> >mark_##tgt == substream)
> +
>  /**
>   * snd_soc_dai_set_sysclk - configure DAI system or master clock.
>   * @dai: DAI
> @@ -348,15 +356,26 @@ int snd_soc_dai_startup(struct snd_soc_dai
> *dai,
>  	    dai->driver->ops->startup)
>  		ret = dai->driver->ops->startup(substream, dai);
>  
> +	/* mark substream if succeeded */
> +	if (ret == 0)
> +		soc_dai_mark_push(dai, substream, startup);
> +
>  	return soc_dai_ret(dai, ret);
>  }
>  
>  void snd_soc_dai_shutdown(struct snd_soc_dai *dai,
> -			 struct snd_pcm_substream *substream)
> +			  struct snd_pcm_substream *substream,
> +			  int rollback)
>  {
> +	if (rollback && !soc_dai_mark_match(dai, substream, startup))
> +		return;
Morimoto-san,
Im having a hard time undersdtanding why we need the second check? When
will it ever be the case that this match will fail? 

I think if we want to roll-back in case of errors , we could simply
have a bool in snd_soc_dai to indicate that the dai has been started up
already and check that here to decide whether we should shut it down or
not. Ideally, a helper function like snd_soc_dai_shutdown_all() which
iterates through all the rtd dai's and shuts all of them that are
marked as started up should suffice and will be more intuitive.

Also, push/pop are associated with stacks and we're only really dealing
with one object here. So it is a bit misleading nomemclature-wise. 

What do you think?

Thanks,
Ranjani

