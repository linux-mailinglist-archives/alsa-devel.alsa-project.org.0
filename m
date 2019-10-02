Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74439C48BB
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 09:44:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCD4A166F;
	Wed,  2 Oct 2019 09:43:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCD4A166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570002267;
	bh=LKipKQdeZzxD5KjypqRR1gVKlNmvAcPAUHt4/9e7uk4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RRaWz3BmBZDx/kG6Ff5HmhQcW9G/zXsZ+v6ca/rCj7ROxhm9xpk+ZmUrwWC66TDPq
	 m4O1wL1c/K9wMgqUZOMnLWsi7sIBJ7Xq5B1P5bjhKyj8oRPUU1Ybyfob/1qc6R3Rty
	 7z9fE+J3O0HHljZbXfr3blSavPcyTzlUDZI6TMyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0276FF80377;
	Wed,  2 Oct 2019 09:42:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5434CF80391; Wed,  2 Oct 2019 09:42:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0BE4F8016F
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 09:42:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0BE4F8016F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="paiZW6t0"
Received: by mail-wm1-x342.google.com with SMTP id 7so5998800wme.1
 for <alsa-devel@alsa-project.org>; Wed, 02 Oct 2019 00:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SwfDj2wPN7DcDgJx2FxKI/ZpgkJjgFUYW3YPld3Bc+A=;
 b=paiZW6t0J+bS7f+gsu0FDsP4bMkq0sAQNtfCtkPPCeZFR8yjhrr8K7j9SMHWEQ/G1m
 v+oyfdlUnZLO4oIPJkpxq3WmvSeUFuCMPZ6ODzj/qIXgolRm2S1VYE7JoSnjGXbLbocu
 NbhLX9wj9SBx9kRFqguqDM7kDU8vDrAWbTsDpNrvYd8+YlgVAjC8FhCCicPH5ukt8bKG
 NsnIowJfTFfUlPJQfhE9+ELG4QuoLZjoMsAw5NyOg7vOW5fIoubvISBlCLDMvVRFyycC
 V7cmyuNU5UBcVMUqkWbUxvbOcGCRrNFRt6iB47tAoTt8cC3XyrJO68zpd284FbHVsftf
 dRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SwfDj2wPN7DcDgJx2FxKI/ZpgkJjgFUYW3YPld3Bc+A=;
 b=NcAWqnijH5QpuvTQyIU7Jp24BtBYOpyDXN46VlDD3PYGCOd3jKD94IuQWq6mYKJ+6y
 V02YHI04nl5+wE6HWm/ciUrUT8UkVbqHAUcdlHaLjZwjaWqLMfG/ZcTrhdSwxIgKvL5r
 ujRhPAfW566LJAfnDN0Ti9Heg0SCKaDp8jb7u7o0dEk09u2NbalPSBSUinK2eO5hquIy
 /XKb8d9E8GIEdYJYmcAa7w8xvAz6yzuOsiLwuw2hDPRJGIdzVF6YdQ3LZt60DYHr3bUA
 0QSd5YrfoSaYZ7pbVKBDZxvPxYvz3swz8ALLDmkGb7iv7h6Y3rnUcH3ZdY+1T6ybXZOL
 z/mA==
X-Gm-Message-State: APjAAAW3p1ZbB2CRXBFxZQrndK3EBCv7+lr1ttk2xvBuy2tNmF8urEr2
 +YEIB7QF8pJfUctY4uSgznF51tllGeMNb2fQ5JA=
X-Google-Smtp-Source: APXvYqx/eh2XpI446XdjwOxkeROR6/vFAPYJ4gocB/0+FghMLb4YvHpikvCyxv1KOtm7bYprTxOQZgt7t7zCVcEZtFI=
X-Received: by 2002:a7b:c44d:: with SMTP id l13mr1644016wmi.171.1570002157660; 
 Wed, 02 Oct 2019 00:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <878sq3bu2t.wl-kuninori.morimoto.gx@renesas.com>
 <87zhijafgk.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zhijafgk.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 2 Oct 2019 10:42:25 +0300
Message-ID: <CAEnQRZBg_YNL2bEVtuLDeazheZV3zKpsfZ0xn0f47hrsJGyKkQ@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 5/6] ASoC: soc-core: setup card->rtd_num at
	snd_soc_instantiate_card()
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

On Wed, Oct 2, 2019 at 8:27 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> card->rtd_num is used to count rtd. Initialize it at
> snd_soc_instantiate_card() is very natural and less confusion.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-core.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 2c2803e..d39d908 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -462,8 +462,6 @@ static void soc_remove_pcm_runtimes(struct snd_soc_card *card)
>
>         for_each_card_rtds_safe(card, rtd, _rtd)
>                 soc_free_pcm_runtime(rtd);
> -
> -       card->num_rtd = 0;
>  }
>
>  struct snd_soc_pcm_runtime *snd_soc_get_pcm_runtime(struct snd_soc_card *card,
> @@ -2008,6 +2006,7 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
>                 goto probe_end;
>
>         /* add predefined DAI links to the list */
> +       card->num_rtd = 0;

Shouldn't this be placed before the comment above?

>         for_each_card_prelinks(card, i, dai_link) {
>                 ret = snd_soc_add_dai_link(card, dai_link);
>                 if (ret < 0)
> @@ -2418,7 +2417,6 @@ int snd_soc_register_card(struct snd_soc_card *card)
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
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
