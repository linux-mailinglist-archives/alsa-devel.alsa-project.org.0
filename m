Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5B1AEF5B
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 18:16:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E60AB1690;
	Tue, 10 Sep 2019 18:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E60AB1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568132210;
	bh=xwjGNG2jIue34S3VQZFmWYtLq6qO/jsLnrzkv6U67pY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E4wt5zH2MkKAqbliqJEEykFuNNgnLaxaqWYIp2+t2n+MInkMzX9vxOKIc2KOvP80q
	 /DnwDMj4VD7LCuLzcRN4ziQSeXScVbvSFPdYZCzryY3guUe1tVO+uV85GTlnhiuqkp
	 DnGUp2zvsh/qElcmpVLyZC92BLn9OHIjK9p6XBA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80DC2F80321;
	Tue, 10 Sep 2019 18:15:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8C50F80368; Tue, 10 Sep 2019 18:15:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-yw1-xc44.google.com (mail-yw1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2709EF800A9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 18:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2709EF800A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="nrNMzvDS"
Received: by mail-yw1-xc44.google.com with SMTP id n11so6635080ywn.6
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 09:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/8y8mjhh6GilXwhI4VIb7Gx980fX9VjbdrPj4O0xvOk=;
 b=nrNMzvDS+VexipvyLfeDqoYmGjpnHqba9WBVK9NdwwD5SXmpFUtCPvQs9JjCJc7TBM
 3HrxPpwHW1mymnf8WiifNxYofM3K4TCBRtsPzF7qapCjULWgZsFtGBLXfT5NBUQ2J40S
 4v6Hme9wY9mF0m/r0RcRR914hF/8zMa5cmjcLOJdoHz/7UjxqEQ0dHBmb1ktFh2CFKjK
 2XOY68ZOWWb2PNyjQvTxKiNKEppTaEPp7DkWmlR6p0gEiLv2cQhBMnBp+yjqgPUWBXSk
 C8R1y8dNSuTxTvn2o3SUk/fHFNRdFI6xt/kUIvVkJZ0saeTfdaY/p2DIKO3Kwz175353
 /iHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/8y8mjhh6GilXwhI4VIb7Gx980fX9VjbdrPj4O0xvOk=;
 b=kHWuMirxsYtkFqxFEY8JaH3JFhMdeKYh1qAsRT9cTZP7RC29lier2HMbEmb6qcrs4f
 8ZBIn50fO6GMW9FWxr0qL4MgFWDhuu2+/F3CybNBibbL4jLLj8yzXlf48FLkD7NiNpn6
 tFLeBisVFsNBRE8Dm+iHuDEPuVtznp2muuYdLP1bcthV8GAAo23pj7efahXDsB/nBVeD
 AXcOv633QnJUnvtDkY5Id+b6HzhC8WF2RMfEzfyFwlgv6e9yXh5/QDMZybt0n37+Dz4b
 1shjviTHY8VxlBoCS0Sob33ZndPj90swZq24TChRh5smhEwDcsMm90rwxsAHZAmakRJ3
 l1HQ==
X-Gm-Message-State: APjAAAXWfDREeMGZeJH5TAMMFOtJXRTNwDOr0ItDAHhPIFa0BgrUdhLb
 UynQ6R4RzUzstXhL1cJy8ezUJB6qjaki2spVZ/5l+g==
X-Google-Smtp-Source: APXvYqyotKDkNkrBZAecwdWk4/at1fbQZF6ZBaVAnPGa1Sg3eXOdOojuznx3eLARXgSfr6bq25eqyAaqUhXWYUg2ZS8=
X-Received: by 2002:a81:5389:: with SMTP id
 h131mr20792551ywb.491.1568132098275; 
 Tue, 10 Sep 2019 09:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <8736h4nby1.wl-kuninori.morimoto.gx@renesas.com>
 <87k1aglxb4.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87k1aglxb4.wl-kuninori.morimoto.gx@renesas.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Tue, 10 Sep 2019 09:14:47 -0700
Message-ID: <CAFQqKeVw3wzdPM7haWA0H4nd6EdqptsJbiD=oOaKyZFpakc1Ag@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 13/13] ASoC: soc-core: setup card->rtd_num
	at snd_soc_instantiate_card()
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

On Mon, Sep 9, 2019 at 7:15 PM Kuninori Morimoto <
kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> card->rtd_num is used to count rtd. Initialize it at
> snd_soc_instantiate_card() is very natural and less confusion.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
Thanks for this clean-up, Morimoto-san. Just a couple of minor comments for
the series that I have replied on the relevant patches. But overall the
series looks good.

Thanks,
Ranjani

> ---
>  sound/soc/soc-core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index bde885f..a5683da 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -451,8 +451,6 @@ static void soc_remove_pcm_runtimes(struct
> snd_soc_card *card)
>
>         for_each_card_rtds_safe(card, rtd, _rtd)
>                 soc_free_pcm_runtime(rtd);
> -
> -       card->num_rtd = 0;
>  }
>
>  struct snd_soc_pcm_runtime *snd_soc_get_pcm_runtime(struct snd_soc_card
> *card,
> @@ -1997,6 +1995,7 @@ static int snd_soc_instantiate_card(struct
> snd_soc_card *card)
>                 goto probe_end;
>
>         /* add predefined DAI links to the list */
> +       card->num_rtd = 0;
>         for_each_card_prelinks(card, i, dai_link) {
>                 ret = snd_soc_add_dai_link(card, dai_link);
>                 if (ret < 0)
> @@ -2407,7 +2406,6 @@ int snd_soc_register_card(struct snd_soc_card *card)
>         INIT_LIST_HEAD(&card->dapm_dirty);
>         INIT_LIST_HEAD(&card->dobj_list);
>
> -       card->num_rtd = 0;
>         card->instantiated = 0;
>         mutex_init(&card->mutex);
>         mutex_init(&card->dapm_mutex);
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
