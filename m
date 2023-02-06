Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C6668B5C6
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 07:51:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C111A100;
	Mon,  6 Feb 2023 07:50:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C111A100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675666276;
	bh=semdrYwAU9i2lJHD9SckXWMhSKhyejBbUFtpyx92vQs=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=nQL5G6O4sca7+FRKYvE5EpRTce4g1/qXtUNUFA9gzmL1iu+5Rl8+59wrrIBVuH7hI
	 YOWA75rrc8TpXjuiOQVyYa9BC5xWpQiISuz7+VDZRXf5envsUYY2Vmt2Zrk6D/5x77
	 g85bH6sPISD6DEy+xxNr9RpoJFmSgRWgQ/P+j1IU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2D16F800F5;
	Mon,  6 Feb 2023 07:50:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33741F804F1; Mon,  6 Feb 2023 07:50:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FBC0F8014B
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 07:50:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FBC0F8014B
Received: by mail-qt1-f170.google.com with SMTP id g7so11779741qto.11
 for <alsa-devel@alsa-project.org>; Sun, 05 Feb 2023 22:50:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K3CzclB8/eZsMkMoV4mMOQY2qhDIrhVs5iADbEvdkfc=;
 b=zpEiMXY0A3x98tkJo140Zeh1IBfL2vx4HyMy9Q1AedkKnFdyy5JpG5/pg3QPqaljSz
 /0kDfpZQbjn/GBdNAmB0sKZKB9qdXl8UoP6w6WJJp4M/agmGQfJV78PcfaVYbsfGmjxb
 phPHIye9gELOINlshWlDFcdlEs3howfiyyvC0k7xGGDzvY5D1xdx1AOji4NZAxRYixiY
 VZseUji+WYpA0rG6fLX9C/Z43Qs7wpznsEbcWHVgMWrd1F5YG4VULr78deH/W9pJWKMq
 ieJ9N0DjE+rbqxELEXcXdI64Y6B2CTBRxK4vHpHVn615r6UlSi0hliVy/kUB2luib90Y
 faUQ==
X-Gm-Message-State: AO0yUKVpp5b5T+7a+ZZKLAe6XbeFCLeBdODRtqgUm4kqCHytkEoOuOuV
 sJWY4gNdFClLrEamo3mL4jrJM2WKGGmT7g==
X-Google-Smtp-Source: AK7set/iK5ocmfpxS5gN5htNrzfIIiWbnTWLPQoVu/SqWRx4cXPS4mILHm2WTNb0TIoG0RjpaclfSw==
X-Received: by 2002:ac8:578d:0:b0:3a7:ef31:a07b with SMTP id
 v13-20020ac8578d000000b003a7ef31a07bmr35284029qta.11.1675666210012; 
 Sun, 05 Feb 2023 22:50:10 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com.
 [209.85.219.172]) by smtp.gmail.com with ESMTPSA id
 c29-20020ac8009d000000b003b323387c1asm6674534qtg.18.2023.02.05.22.50.09
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 22:50:09 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id cf30so7642367ybb.11
 for <alsa-devel@alsa-project.org>; Sun, 05 Feb 2023 22:50:09 -0800 (PST)
X-Received: by 2002:a5b:2c1:0:b0:89c:b633:73a6 with SMTP id
 h1-20020a5b02c1000000b0089cb63373a6mr126962ybp.365.1675666209120; Sun, 05 Feb
 2023 22:50:09 -0800 (PST)
MIME-Version: 1.0
References: <87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com>
 <46974ae7-5f7f-8fc1-4ea8-fe77b58f5bfb@linaro.org>
 <87k00vqzw2.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87k00vqzw2.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Feb 2023 07:49:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVFy62v8WC3H6f5NggTdJsk=2FmJqUR8L3XkT3jcKUj5A@mail.gmail.com>
Message-ID: <CAMuHMdVFy62v8WC3H6f5NggTdJsk=2FmJqUR8L3XkT3jcKUj5A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas: adjust to R-Car Gen4
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 devicetree@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Morimoto-san,

On Mon, Feb 6, 2023 at 4:03 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > The "required" with if - then - else on "rcar_sound,ssi" is
> > > always match to "then" even though it is checking "renesas,rcar_sound-gen4" or not.
> > > Why ?? Is it my fault ??
>
> I'm not sure why but some "if - then - else" doesn't work correctly for me.
> One concern is that it is under "patternProperties".
> Non "patternProperties" case is works well.
>
> This is just sample case.
> In below case, only gen4 case requires "foo/bar" if my understanding was correct.
> But I get error "foo/bar are required" on *all* compatible.
>
> It is my fault ?
>
> --- sample -----------
>   rcar_sound,ssi:
>     ...
>     patternProperties:
>       "^ssi-[0-9]$":
>         ...
>         allOf:
>           - if:
>               properties:
>                 compatible:
>                   contains:
> =>                  const: renesas,rcar_sound-gen4
>             then:
>               required:
> =>              - foo
> =>              - bar

As it is under patternProperties, the "if: properties" applies to the
properties under the ssi node, where you do not have any compatible
value (and definitely not the "renesas,rcar_sound-gen4" value, which
belongs to the _parent_ of the ssi node).

So I think the only solution is to move the "if" up, and thus duplicate
the ssi node description:

    if:
        properties:
            compatible:
                contains:
                    const: renesas,rcar_sound-gen4
    then:
        patternProperties:
            "^ssi-[0-9]$":
                ...
    else:
        patternProperties:
            "^ssi-[0-9]$":
                ...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
