Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A88C7391120
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 09:00:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C48E174C;
	Wed, 26 May 2021 08:59:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C48E174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622012444;
	bh=zA2QvNgjZP15jecdx8Pd4tTv8kapxnzLhNsLgp4t18s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QiD/C2EybPRpsmuk55J+82rN7tSy6dBvenOgDm+Os5SM77hDdbIjthPxq8QtGip72
	 NUKMgRYXigdnLRfX8Sua/cwrvZzIGY4YSWspVRePXoDHUnh+pWEaY8dDMPcq12NtBZ
	 v01RONlNl1E+B3zxDPnDf5ISaBGW1GgaTTeJX87o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65DCFF80158;
	Wed, 26 May 2021 08:59:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95231F80157; Wed, 26 May 2021 08:59:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF09CF8011B
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 08:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF09CF8011B
Received: by mail-ua1-f42.google.com with SMTP id w5so204813uaq.9
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 23:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rbIgMpemtTHbO3qkKfLpmSkVH9ZxGhJc4CNxNEzF53c=;
 b=SqMfuirUvwdCUqbYXUtDms8P/bZzbTX0+SCcuthUbd4HSS8zGV5dcfsllzbCnLdTwG
 t9NUDndyI2igRnEvJkhwcrq1aqzIeVk/1mY/f3Y9kePksDujbAHrknqbAledtW6ybKaH
 wGeZkjAM526/NnT2UKOt2YC+b+tfrWqxaS6l1ZyeBEdmkz4IGmY9Thn4ieUEeVNPAZhK
 NCh9Q5xwZnk3pR1Ccw3lKzKOfhBzIwxhQz29LoioNqWc+nlXgfVsL3cbEIWnJiy9s1sK
 WAp1eXIr+3LvCt9fvBfMFBl++9mMA7TXUdQeHIAIEQp+CqV7Z/ZR4WQIhYRITEGh3KXL
 Najw==
X-Gm-Message-State: AOAM533l3MnW+YQGwXedEQSbQlLgEVUy/i0nOqEunn3dhIQF9CIAKMtj
 1uZDyEVb57y9NsvGH3lECwOZOfVvZUo8Bws5F20=
X-Google-Smtp-Source: ABdhPJyr2DwGlAerbBy+44CDrneQvQVFvTmw9Cq5QMkNCZYkuk62lkiswIekqmvB9MCX0AIWQ4asPIizvWD4iBpX3nw=
X-Received: by 2002:ab0:6584:: with SMTP id v4mr3714762uam.100.1622012345211; 
 Tue, 25 May 2021 23:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <87y2c4oe3y.wl-kuninori.morimoto.gx@renesas.com>
 <87tumsoe2p.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdXLYvEBE0bVk=8D+GkuaHRUvdTayCQPqTYAkPJEaW8MDQ@mail.gmail.com>
 <87zgwimnuu.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zgwimnuu.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 May 2021 08:58:53 +0200
Message-ID: <CAMuHMdVhnKeztftOJEZhSg8bXArzUDXAmHSMPVfbMamV3ihw+g@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: rsnd: add null CLOCKIN support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>
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

Hi Morimoto-san,

On Wed, May 26, 2021 at 12:48 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > I'm not such a big fan of creating dummy clocks.
> > And what if a future SoC lacks two CLOCKIN pins? Then you'll try to
> > register a second dummy clock with the same name, which will fail,
> > presumably?
>
> I think current code will reuse same null_clk for these.

Oh right, I missed the static clk_hw pointer.
What if you unload the snd-soc-rcar.ko module?

> > This should only be done when the clock does not exist, not in case
> > of other errors (e.g. -EPROBE_DEFER, which isn't handled yet)?
> >
> > As devm_clk_get_optional() already checks for existence, you could use:
> >
> >     struct clk *clk = devm_clk_get_optional(dev, clk_name[i]);
> >     if (!clk)
> >             clk = rsnd_adg_null_clk_get(priv);
>
> Ah, indeed.
> Thanks. I will fix it.
>
> > But in light of the above (avoiding dummy clocks), it might be more
> > robust to make sure all code can handle adg->clk[i] = NULL?
>
> The reason why I don't use adg->clk[i] = NULL is it is using this macro
>
>         #define for_each_rsnd_clk(pos, adg, i)          \
>                 for (i = 0;                             \
>                      (i < CLKMAX) &&                    \
>                      ((pos) = adg->clk[i]);             \
>                      i++)
>
> The loop will stop at (A) if it was
>
>         adg->clk[0] = audio_clk_a;
>         adg->clk[1] = audio_clk_b;
> (A)     adg->clk[2] = NULL
>         adg->clk[3] = audio_clk_i;

If you use this macro everywhere, that is easily handled by the
following variant:

    #define for_each_rsnd_clk(pos, adg, i)          \
            for (i = 0; (pos) = adg->clk[i], i < CLKMAX; i++)            \
                    if (pos) {                      \
                            continue;               \
                    } else

There are several existing examples of such a construct.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
