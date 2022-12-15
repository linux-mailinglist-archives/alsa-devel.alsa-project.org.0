Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 438D164DAE7
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 13:12:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C49C8224E;
	Thu, 15 Dec 2022 13:11:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C49C8224E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671106319;
	bh=BljVP39IU0CfiV/bykxHVSzXf5fJr/iyYiwqEqu7aSg=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cGEUVwGNXQ66YPk4A25Ov6ynwlPIBHsKZCF0/XaLRMBQKYRcOR2MeEzxedDWMHpyA
	 V0n6M9Q4FfB9Bc9UFDo13+VChjn0dzK5PYC6SVkUvHJTe/09nbRn08TZauZlJMUnog
	 nuBSgXL1Oz+0zDmA5oZfuueSMiJvsHqvCUnNuu34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7791FF80141;
	Thu, 15 Dec 2022 13:11:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B743F804E7; Thu, 15 Dec 2022 13:11:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAB1AF80141
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 13:10:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAB1AF80141
Received: by mail-vk1-f180.google.com with SMTP id v81so4604253vkv.5
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 04:10:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P/OeO6ueKYZuyqeE/c8Fq+ZWrr/NvMBspPnEdXrqTO8=;
 b=Fs2boKDpakUP3TwKyc/QO4zwnE2CA6R2H8CT4Ov4twRkfJ0rmeliG0U2a0Cu1h1wfd
 /FiNWBwHPZbexcUWcnsw60J5wpcBudnVJH1kVh8qRgaFNQPue9XWSuF+9psmaeeJiSdg
 xV+0d4xGjUSis8qQBqDsxpJNgC9naCgn+VOw2am2zBDGlJ6gmx+PQMGyM7s6+b7rz25B
 C3V+/223rfXVEGQTqkEbO7TdFg8Ah1Xrzohl2DcGvNxBai1y4kYv9zjEcxuJsHYWLb0x
 k/lgpNINqSTm07DdwraQB9vinLu0FSCfDe8HpbizZtFicvwqpp82q459u8pepnFgwewi
 Hazg==
X-Gm-Message-State: AFqh2kp86wKBFwPrid5QqvbUMkiiz3m2zVDirPdcBVP+AL2UL374hU0m
 tzXx6lVgKJH0wv9MfjEkWScrJyA+YgDNbw==
X-Google-Smtp-Source: AMrXdXtXxKdG0U6WMt7x/5lg8d0DUBR2PwVEjcddWdBeJMVUYHaeDnxO8HvombYYZIyC7RbVDMSsjg==
X-Received: by 2002:a05:6122:17aa:b0:3c4:eeaa:b43f with SMTP id
 o42-20020a05612217aa00b003c4eeaab43fmr5031329vkf.14.1671106256992; 
 Thu, 15 Dec 2022 04:10:56 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 v5-20020a05620a440500b006fc2cee4486sm12255244qkp.62.2022.12.15.04.10.55
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 04:10:56 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-3bf4ade3364so38431057b3.3
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 04:10:55 -0800 (PST)
X-Received: by 2002:a0d:cb4c:0:b0:38e:e541:d8ca with SMTP id
 n73-20020a0dcb4c000000b0038ee541d8camr23952529ywd.283.1671106255188; Thu, 15
 Dec 2022 04:10:55 -0800 (PST)
MIME-Version: 1.0
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
 <87mt7qpylw.wl-kuninori.morimoto.gx@renesas.com>
 <CAMuHMdW=_-MyqAjRqaoPyWkoUmdB2VOE1t+wpym7eyOxkzc_7g@mail.gmail.com>
 <Y5sJV2KfX98KoMYZ@sirena.org.uk>
In-Reply-To: <Y5sJV2KfX98KoMYZ@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Dec 2022 13:10:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWwP6QDUux62GZtCT7tsFhAhex=Fns5e=n_KTjGXHRy0Q@mail.gmail.com>
Message-ID: <CAMuHMdWwP6QDUux62GZtCT7tsFhAhex=Fns5e=n_KTjGXHRy0Q@mail.gmail.com>
Subject: Re: [PATCH 06/11] ASoC: dt-bindings: ti,
 pcm3168a: Convert to json-schema
To: Mark Brown <broonie@kernel.org>
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
Cc: Rob Herring <robh@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mohan Kumar <mkumard@nvidia.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Mark,

On Thu, Dec 15, 2022 at 12:47 PM Mark Brown <broonie@kernel.org> wrote:
> On Thu, Dec 15, 2022 at 12:03:02PM +0100, Geert Uytterhoeven wrote:
> > On Wed, Dec 14, 2022 at 2:23 AM Kuninori Morimoto
> > > +maintainers:
> > > +  - Damien Horsley <Damien.Horsley@imgtec.com>
>
> > For v2, I had planned
>
> >     -+  - Damien Horsley <Damien.Horsley@imgtec.com>
> >     ++  - Jaroslav Kysela <perex@perex.cz>
> >     ++  - Takashi Iwai <tiwai@suse.com>
>
> > as Damien's address bounces.
>
> I wouldn't do that, I gather the maintainers for DT bindings are
> supposed to be people who know and care about the specific binding in
> particular.

Sure.  But how can they (still) care, if we cannot reach them?
There's no email message from Damien to be found during the past
7 years.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
