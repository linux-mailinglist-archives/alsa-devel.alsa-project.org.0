Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2556508B2
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Dec 2022 09:44:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6B7D2BAA;
	Mon, 19 Dec 2022 09:43:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6B7D2BAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671439485;
	bh=EC3jV5ySyInPihbu+UKz4bEElegWqjqu6Mxiznw8QiQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=k2TpEEz32BQiwoos0Nv0j0CVLzpz/N0/k0ZYRCvjqCumSFX7EZkYwsGc0fXfZCyvK
	 RGvY5FsNQYNnOfYcmkrN2qXCyLA9eVOrurztYHl7OR8M7Go/RtUZpXEoqoGwNS0OCD
	 qhU+edb5sFv0K7iIGnQirTePAlWE1ehRnscqZRmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92505F80423;
	Mon, 19 Dec 2022 09:43:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 991F1F80423; Mon, 19 Dec 2022 09:43:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no
 autolearn_force=no version=3.4.6
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09840F8025E
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 09:43:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09840F8025E
Received: by mail-qt1-f175.google.com with SMTP id x11so7650263qtv.13
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 00:43:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vgqr1KQUZIrn8Gn7BfcDzo56u+39PSrAMufxXVva80U=;
 b=4DEb2w7P8xK0FMAxhLKClFGiMK3c/3G6gIXpsr0w92ECWfHf7BDjGmh+mYO2woykmM
 UmQ7mv+Ne1t/623kHHwQQl1D3p8AWcwTnNs7ub+6DCwZAIe3Hqeb4ddvnoicOKhlzPBl
 oku/5Id9K7n72yqv1UrFF9KI5ek9PoWNlz1WAVfAlMDGyt6tQCrQajElcJRq+6Gs2RST
 8j8EmY2lzn1Xuo3Nf80I7h6lOBCOEoBAxa+Ri5RoRiK5L2e1D6hZGI4X23LJaDi+NQlu
 dPxjUTIHcTeUCt1KlOo1sP++QQALkyqUEN6QZsY0RpsvrbVpiJ0WNJNP48dn/gAw7yyr
 QhRQ==
X-Gm-Message-State: AFqh2kovlmaCLFqurl+oPLVvhud6YBfb67v+IUMwqeWcPdR/V47HNwT2
 SDa0OK4RxMRxEfOo7QUf6xM08rkY8yx12w==
X-Google-Smtp-Source: AMrXdXvk+mIgUZfZQeC4ic0AmnUoZZsnsxdcqyNC/FJ6QumJx5y0p7tjhQv3iuZdtsBed/ajYQF9tw==
X-Received: by 2002:ac8:6ec9:0:b0:3a9:2478:2d70 with SMTP id
 f9-20020ac86ec9000000b003a924782d70mr21997317qtv.24.1671439410645; 
 Mon, 19 Dec 2022 00:43:30 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169]) by smtp.gmail.com with ESMTPSA id
 h19-20020ac85693000000b0039c7b9522ecsm5715995qta.35.2022.12.19.00.43.30
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 00:43:30 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id e141so8681673ybh.3
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 00:43:30 -0800 (PST)
X-Received: by 2002:a25:9:0:b0:6f9:29ef:a5ee with SMTP id
 9-20020a250009000000b006f929efa5eemr40115537yba.380.1671439409777; 
 Mon, 19 Dec 2022 00:43:29 -0800 (PST)
MIME-Version: 1.0
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
 <87mt7qpylw.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdW=_-MyqAjRqaoPyWkoUmdB2VOE1t+wpym7eyOxkzc_7g@mail.gmail.com>
 <Y5sJV2KfX98KoMYZ@sirena.org.uk>
 <CAMuHMdWwP6QDUux62GZtCT7tsFhAhex=Fns5e=n_KTjGXHRy0Q@mail.gmail.com>
 <20221216163919.GA2863056-robh@kernel.org>
In-Reply-To: <20221216163919.GA2863056-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Dec 2022 09:43:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEbVqD3z69-nJe9ST35_S4AZSJLrYqC3f=F+VONSPn0Q@mail.gmail.com>
Message-ID: <CAMuHMdWEbVqD3z69-nJe9ST35_S4AZSJLrYqC3f=F+VONSPn0Q@mail.gmail.com>
Subject: Re: [PATCH 06/11] ASoC: dt-bindings: ti,
 pcm3168a: Convert to json-schema
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sameer Pujar <spujar@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mohan Kumar <mkumard@nvidia.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Rob,

CC Peter

On Fri, Dec 16, 2022 at 5:39 PM Rob Herring <robh@kernel.org> wrote:
> On Thu, Dec 15, 2022 at 01:10:44PM +0100, Geert Uytterhoeven wrote:
> > On Thu, Dec 15, 2022 at 12:47 PM Mark Brown <broonie@kernel.org> wrote:
> > > On Thu, Dec 15, 2022 at 12:03:02PM +0100, Geert Uytterhoeven wrote:
> > > > On Wed, Dec 14, 2022 at 2:23 AM Kuninori Morimoto
> > > > > +maintainers:
> > > > > +  - Damien Horsley <Damien.Horsley@imgtec.com>
> > >
> > > > For v2, I had planned
> > >
> > > >     -+  - Damien Horsley <Damien.Horsley@imgtec.com>
> > > >     ++  - Jaroslav Kysela <perex@perex.cz>
> > > >     ++  - Takashi Iwai <tiwai@suse.com>
> > >
> > > > as Damien's address bounces.
> > >
> > > I wouldn't do that, I gather the maintainers for DT bindings are
> > > supposed to be people who know and care about the specific binding in
> > > particular.
> >
> > Sure.  But how can they (still) care, if we cannot reach them?
> > There's no email message from Damien to be found during the past
> > 7 years.
>
> Then put someone that would care if the binding is deleted. As this is
> used on Renesas board(s), I can think of a few candidates.

Or perhaps someone from TI? ;-)
This is a TI component, and also used on a TI K3 board...

/me weaseling out...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
