Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0AB4FE231
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 15:19:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6783918AC;
	Tue, 12 Apr 2022 15:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6783918AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649769573;
	bh=sGecl7M9oV7mmKQCqQ/c7mJW9Ss7zMn5IsTz1JTKcs8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LhqrCDNgg+HSkxkDzJXxP/0+ryKy++aPZuv8658OJy/ImEnks31WC6STdELsAcsB2
	 1tVV0RjBWCDJN6dLvDzHidIkXfTlZO3Z4UI1GlPmmvYKNkLZCpD9IsowcDFaKwHT2k
	 FmkAsrE2pNVYVqY0kiVr76lMGChQDg/WG1mMt19A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0ECAF80109;
	Tue, 12 Apr 2022 15:18:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92AC1F80154; Tue, 12 Apr 2022 15:18:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00E4BF80109
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 15:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00E4BF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EtQUdqjI"
Received: by mail-qk1-x733.google.com with SMTP id s4so13635841qkh.0
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 06:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=49ZIzrmqMQsBvLmXcrtse5TiCoWuEpgd/EgcWS+mVdU=;
 b=EtQUdqjIvSJ7MoA9I6kmx49vmK7m0wQ5tXDLD5yaOYYTSB4MVvwHkDKVGbZdiMomBb
 REXvC+UoaVWgUSpKP59d4Yn2S0/rLwGX1f893JZ0QukzKtEHhZ/SIp/rMyrolBsmNNqy
 mAfgYv2jenumftgk1uMsl+s3ae4mGzPW3wdPnH8fGIICjS620iOdm1wZXuS1TJOQ2uwr
 u6+8XzOqWu/TqUPVOYh9+NgzuTsE/3iUem6YVRKQwQMK6S60W95O0rPSFXET7GE/F0Uo
 RQeh3COGctzNCFrGwW++3XA8CnPKq4GOASbX36uCENVbz2z6HP17Fg0bczRR89jqPEw8
 9MRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=49ZIzrmqMQsBvLmXcrtse5TiCoWuEpgd/EgcWS+mVdU=;
 b=ACawczHUOcdZH/D8rNzo0YyUo5YbqBNOKcVqfTHYhYMwQ1QsqVzLfMUI+3f8/QtYi9
 cFdMpIuY1S/CDUDvFCSFOeVAfsmWXfRSFJtYwDFjBgoGzdGjQnlw4K3KONBDgQrBMMaX
 ct4xurukwqEqUA9b+SyjGThm7qV3IXHmo787b/nVwsEAkVWLSiZTZa3PN/CLUw2mCP+F
 gaSyZUrvXqdjgeE4l5zkVaLKn3lqKbNRk267HT+v3VCG9jzFs/Atz8d2nRUxPegSCWVo
 m2UnTHB5KZ4o9e0f6jawGE+cOfk940FHKQbpkYvlfhLOQIdQCAqVIlpFmFjHvqhKSOrl
 NU3g==
X-Gm-Message-State: AOAM531gQX7qvG8EnBgKoNMAYpN5ZrjE4o0WTuLMcVJ9BXxeZC8H78qQ
 2gtl+36+gi6/u1clflrdN7Fnom8DM6Gs44Fp7AA=
X-Google-Smtp-Source: ABdhPJxYURYh+3IUYEs1SrBG9EuTtGPbzzolSMUHZPf3XIM00NLXUOATHQbvJ3VH3TlnQUthyDHFe7yMXBhlKOTPIgQ=
X-Received: by 2002:a37:5f87:0:b0:69c:4dff:ba77 with SMTP id
 t129-20020a375f87000000b0069c4dffba77mr155406qkb.80.1649769506832; Tue, 12
 Apr 2022 06:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <1649754826-2651-1-git-send-email-shengjiu.wang@nxp.com>
 <YlVy6tAPMw+MHq/f@sirena.org.uk>
In-Reply-To: <YlVy6tAPMw+MHq/f@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 12 Apr 2022 21:18:16 +0800
Message-ID: <CAA+D8AP=ydd6f9su=JR1q9NVWTg2tHoTF1OGHQGmFN+gZhAcHQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: wm8524: remove rate constraint for FE-BE case
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Tue, Apr 12, 2022 at 8:39 PM Mark Brown <broonie@kernel.org> wrote:

> On Tue, Apr 12, 2022 at 05:13:46PM +0800, Shengjiu Wang wrote:
> > The constraint is propagate to Front End Bitstream
> > for Front End and Back End share same snd_soc_pcm_runtime.
>
> > The constraint is not needed for Back End Bitstream
> > when there is be_hw_params_fixup() defined.
>
> > -     snd_pcm_hw_constraint_list(substream->runtime, 0,
> > -                                SNDRV_PCM_HW_PARAM_RATE,
> > -                                &wm8524->rate_constraint);
> > +     if (!rtd->dai_link->be_hw_params_fixup)
> > +             snd_pcm_hw_constraint_list(substream->runtime, 0,
> > +                                        SNDRV_PCM_HW_PARAM_RATE,
> > +                                        &wm8524->rate_constraint);
>
> This applies in general to constraints set by the CODEC, it's not
> something that should be fixed at the driver level.  Peering into the
> runtime to see if DPCM is doing anything isn't a great solution here,
> nor is having to open code it into the driver.  I already had it in the
> back of my head to generalise the set constraints based on sysclk
> pattern into the core, that might be productive here.
>

I also hesitate to add this in the codec driver. I agree that it is better
to be put in the core.

When will you have a patch for this?

Best regards
Wang Shengjiu
