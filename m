Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD616AEE9A
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 17:35:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C7DF16A3;
	Tue, 10 Sep 2019 17:35:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C7DF16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568129751;
	bh=qF9Sn2LoTskxa1AB18gq4ACUGpbZrYXTQAT5iJmz0j4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a+cPZSKSJ+/cDbrtAu4aGDmbxg3WAr/sLXEM/Xf/cJy2mhRMivO+cpB/2SaNRb7fJ
	 eeAdUzJui9EgmukKtGgcHcgTFIMrnM3+X91y+T79tvSH4iX7dE2KlsbI9AkBBp4bek
	 QZ4Yh14mPLPhRbjXrpVpjU8t+O6mUymAovwerqdA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6984EF80368;
	Tue, 10 Sep 2019 17:34:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C5D8F80368; Tue, 10 Sep 2019 17:34:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D007AF800A9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 17:33:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D007AF800A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="zegIU9Sf"
Received: by mail-yw1-xc41.google.com with SMTP id n126so6584424ywf.1
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 08:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oigsx6hO4NVxD7HhndXunraWAIAFbla8jbtSU19X1HU=;
 b=zegIU9Sfk+UDsvLhrJSPpzieLiPemsuxcQ/OSGxb3M4DcqXaxf7NEUSAEhN0HOoE2H
 SsRVfmexCmG7Gr/Xzx7RGMqkAXECew2prgchxIcvLnsQhG/XnA9UiI6E8Z6a9tFQ3E43
 Bf3aEAuSWFpXnjmhT2iJ/i9+fUgO8imz8QXgOTaQ+bIhxJagvHq8byMKMO9JhSEIH0ZN
 Feb2jGQVPJ1miWuxdDAYBCuUiu83hXvG9L1f+lFwVcsKZZHr1vWGHZk3+37JPhvqOqb4
 QG4eABcwLtGAYmRUzKOioA6pBVrdu7t5tFlJzYJvVLjNRpoz0HSutsKJi1V/cukh68P1
 F8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oigsx6hO4NVxD7HhndXunraWAIAFbla8jbtSU19X1HU=;
 b=U7iv2BchpQHG5uS2wMnj/uGZwIATw2Ds8wBLKwXVtdOx0jzUGqYm8e4HaYhnbXSKc7
 2jcub1AfuxYoccMbz5X9o6SyjVidpYd72WyThptlPXkArjfyxhahU0CW27cmFHRFmA4G
 CTgnX78ynncPE3b+dQ3PRAVYrDkpideLpq0uGU0Uuhdm4eIVaE9bk+S/2VTPmM+E2KIT
 5DMfKg1KTNgLsUnN4gbMCL+NfsB2LGRhSgKshv4M0xVtheGg7kCRCA5f2aVlD6gQ5L9V
 gyHx2f2h3dKN9QHhKZVcRMNALMmtHlfSzgIh+WZZMk2R2hGXPrdh12jfzXlOFoMexici
 qugQ==
X-Gm-Message-State: APjAAAUjrZQdk6RPJDU+Hv/pvwgeeMOTPsjdGQNhVemSTR63xT5ddA/y
 aI/Rq7NrezYOERAGaM8Jn57sXR6O4HTl7y75wkVhNg==
X-Google-Smtp-Source: APXvYqzMXzyiHhUN8LVWxwQYQO2iGamqQHoGgiNAWVtqYqDAg1nbuCAobi65Qd7DId9mpAcuzkDjYYWdCw65mTaN7cQ=
X-Received: by 2002:a81:4cc8:: with SMTP id
 z191mr21165062ywa.137.1568129636288; 
 Tue, 10 Sep 2019 08:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <8736h4nby1.wl-kuninori.morimoto.gx@renesas.com>
 <87tv9klxca.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tv9klxca.wl-kuninori.morimoto.gx@renesas.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Tue, 10 Sep 2019 08:33:45 -0700
Message-ID: <CAFQqKeWkQsOCVf=R+KN1NawmteEyak_PCxQzkR5Hk10Z_0Ao8Q@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 06/13] ASoC: soc-core: merge
 soc_free_pcm_runtime() and soc_rtd_free()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Sep 9, 2019 at 7:10 PM Kuninori Morimoto <
kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> "rtd"      is handled by soc_xxx_pcm_runtime(), and
> "rtd->dev" is handled by soc_rtd_xxx().
>
> There is no reason to separate these, and it makes code complex.
> We can free these in the same time.
>
> Here soc_rtd_free() (A) which frees rtd->dev is called from
> soc_remove_link_dais() many times (1).
> Then, it is using dev_registered flags to avoid multi kfree() (2).
> This is no longer needed if we can merge these functions.
>
>         static void soc_remove_link_dais(...)
>         {
>                 ...
> (1)             for_each_comp_order(order) {
> (1)                     for_each_card_rtds(card, rtd) {
>
> (A)                             soc_rtd_free(rtd);
>                                 ...
>                         }
>                 }
>         }
>
> (A)     static void soc_rtd_free(...)
>         {
> (2)             if (rtd->dev_registered) {
>                         /* we don't need to call kfree() for rtd->dev */
>                         device_unregister(rtd->dev);
> (2)                     rtd->dev_registered = 0;
>                 }
>         }
>
> This patch merges soc_rtd_free() into soc_free_pcm_runtime().
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc.h  |  1 -
>  sound/soc/soc-core.c | 18 ++----------------
>  2 files changed, 2 insertions(+), 17 deletions(-)
>
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index f264c65..d93cb46 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -1148,7 +1148,6 @@ struct snd_soc_pcm_runtime {
>         struct list_head component_list; /* list of connected components */
>
>         /* bit field */
> -       unsigned int dev_registered:1;
>         unsigned int pop_wait:1;
>         unsigned int fe_compr:1; /* for Dynamic PCM */
>  };
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index b550fa9..552f460 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -368,6 +368,8 @@ static void soc_free_pcm_runtime(struct
> snd_soc_pcm_runtime *rtd)
>
>         kfree(rtd->codec_dais);
>         snd_soc_rtdcom_del_all(rtd);
> +       if (rtd->dev)
> +               device_unregister(rtd->dev); /* soc_release_rtd_dev */
>         list_del(&rtd->list);
>         kfree(rtd);
>  }
> @@ -434,8 +436,6 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
>         rtd->num = card->num_rtd;
>         card->num_rtd++;
>
> -       rtd->dev_registered = 1;
> -
>         return rtd;
>
>  free_rtd:
> @@ -1169,7 +1169,6 @@ static int soc_probe_dai(struct snd_soc_dai *dai,
> int order)
>         return 0;
>  }
>
> -static void soc_rtd_free(struct snd_soc_pcm_runtime *rtd); /* remove me */
>  static void soc_remove_link_dais(struct snd_soc_card *card)
>  {
>         int i;
> @@ -1179,10 +1178,6 @@ static void soc_remove_link_dais(struct
> snd_soc_card *card)
>
>         for_each_comp_order(order) {
>                 for_each_card_rtds(card, rtd) {
> -
> -                       /* finalize rtd device */
> -                       soc_rtd_free(rtd);
> -
>                         /* remove the CODEC DAI */
>                         for_each_rtd_codec_dai(rtd, i, codec_dai)
>                                 soc_remove_dai(codec_dai, order);
> @@ -1460,15 +1455,6 @@ void snd_soc_remove_dai_link(struct snd_soc_card
> *card,
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_remove_dai_link);
>
> -static void soc_rtd_free(struct snd_soc_pcm_runtime *rtd)
> -{
> -       if (rtd->dev_registered) {
> -               /* we don't need to call kfree() for rtd->dev */
>
Morimoto-san,

I think it is useful to keep this comment when you move soc_rtd_free() to
soc_free_pcm_runtime().

Thanks,
Ranjani

> -               device_unregister(rtd->dev);
> -               rtd->dev_registered = 0;
> -       }
> -}
> -
>  static int soc_link_dai_pcm_new(struct snd_soc_dai **dais, int num_dais,
>                                 struct snd_soc_pcm_runtime *rtd)
>  {
> --
> 2.7.4
>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
