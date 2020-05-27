Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5592C1E3406
	for <lists+alsa-devel@lfdr.de>; Wed, 27 May 2020 02:25:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6397176B;
	Wed, 27 May 2020 02:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6397176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590539118;
	bh=0rU4LKI0/Zz74EHgWgAWLRYcnQ+AXhmOdQtSzi8QwH4=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lbWof98WfppBbwHW+aOpbWiolmS+9QLIhDdzp7s0hiiKXfuTaJ5Mh73HAQnI+SeUM
	 mh0mUBSZr+SIU1ha7W+G6Y3S0Jz9jlSUekDqRgxVk1bTIAZ0cRHW2FTo+OoxHBbMDk
	 xgzQOgizrviiamhLfi+Um94XW5jCmkP4fDeNoCfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9DD6F80131;
	Wed, 27 May 2020 02:23:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11E5BF80150; Wed, 27 May 2020 02:23:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79717F80100
 for <alsa-devel@alsa-project.org>; Wed, 27 May 2020 02:23:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79717F80100
IronPort-SDR: X8AiatOnhCcTiD1uUCRDjsz9xhilnWTg3iqzw5CBz3p10JFBhL6c4WE4ZjfvwD94NOgl+vyzb8
 OzFJ4UaCTK6A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2020 17:23:17 -0700
IronPort-SDR: CDA5oRJmjMg8z9fX+ahJSq+wtEvnVp4nX0jMyXwYQhU1wd319NyWMPz9KY4uA2CSnStscNsZRd
 cj+qo85wQxqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,439,1583222400"; d="scan'208";a="301908094"
Received: from vivienne-mobl.ger.corp.intel.com ([10.251.132.190])
 by fmsmga002.fm.intel.com with ESMTP; 26 May 2020 17:23:17 -0700
Message-ID: <433bd81e65c32202372b2cd4052f1fba0463bb30.camel@linux.intel.com>
Subject: Re: [PATCH 16/19] ASoC: soc-card: add snd_soc_card_set_bias_level()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Tue, 26 May 2020 17:23:16 -0700
In-Reply-To: <87tv031ojg.wl-kuninori.morimoto.gx@renesas.com>
References: <87h7w3339l.wl-kuninori.morimoto.gx@renesas.com>
 <87tv031ojg.wl-kuninori.morimoto.gx@renesas.com>
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

On Tue, 2020-05-26 at 10:18 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Card related function should be implemented at soc-card now.
> This patch adds it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-card.h |  4 ++++
>  sound/soc/soc-card.c     | 12 ++++++++++++
>  sound/soc/soc-dapm.c     |  4 ++--
>  3 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sound/soc-card.h b/include/sound/soc-card.h
> index b338bbd08219..4bcdc1d382bf 100644
> --- a/include/sound/soc-card.h
> +++ b/include/sound/soc-card.h
> @@ -28,6 +28,10 @@ int snd_soc_card_probe(struct snd_soc_card *card);
>  int snd_soc_card_late_probe(struct snd_soc_card *card);
>  int snd_soc_card_remove(struct snd_soc_card *card);
>  
> +int snd_soc_card_set_bias_level(struct snd_soc_card *card,
> +				struct snd_soc_dapm_context *dapm,
> +				enum snd_soc_bias_level level);
> +
>  /* device driver data */
>  static inline void snd_soc_card_set_drvdata(struct snd_soc_card
> *card,
>  					    void *data)
> diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
> index 449f6cc86859..a9f25b6a4c67 100644
> --- a/sound/soc/soc-card.c
> +++ b/sound/soc/soc-card.c
> @@ -172,3 +172,15 @@ int snd_soc_card_remove(struct snd_soc_card
> *card)
>  
>  	return soc_card_ret(card, ret);
>  }
> +
> +int snd_soc_card_set_bias_level(struct snd_soc_card *card,
> +				struct snd_soc_dapm_context *dapm,
> +				enum snd_soc_bias_level level)
> +{
> +	int ret = 0;
> +
> +	if (card->set_bias_level)
> +		ret = card->set_bias_level(card, dapm, level);
> +
> +	return soc_card_ret(card, ret);
> +}
> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index a4de3e4bc2ef..add39d24a583 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -725,8 +725,8 @@ static int snd_soc_dapm_set_bias_level(struct
> snd_soc_dapm_context *dapm,
>  
>  	trace_snd_soc_bias_level_start(card, level);
>  
> -	if (card && card->set_bias_level)
> -		ret = card->set_bias_level(card, dapm, level);
> +	if (card)
Morimoto-san,

Why not move this check inside snd_soc_card_set_bias_level() and remove
the first parameter from the function?

Thanks,
Ranjani

