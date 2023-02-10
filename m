Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51281691978
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 09:02:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1755846;
	Fri, 10 Feb 2023 09:02:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1755846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676016170;
	bh=P1XnzjGegY61JFSmPV+ffdm9JK/nFL2PE1ZLOy5XOnw=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EQjDaJMAK0MZSHntA5XbwBD3CHC/WXhvAdJu7WqovrY4Vmq1oZqsp8Y9gkPJgkXgC
	 BjkTcInGzyMDrEog+0HAwPJcjU6C6U22n7ejz/2zDodQJ4gOMqDhnWKJVZPcacczlC
	 1PRfwbiJNaYheVN3lvGrXFkyvf22d6rW8Ps+lxAI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 03873F800B8;
	Fri, 10 Feb 2023 09:02:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 783B5F800E4; Fri, 10 Feb 2023 09:01:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1068F80086
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 09:01:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1068F80086
Received: by mail-qt1-f171.google.com with SMTP id m12so4941270qth.4
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 00:01:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kI8PQ2ugfDhm2FkPLEtWMsmZfNCcA7o5O0RvlqX8c74=;
        b=3Vvb7ogeJKcOaDUvIhxZg8VkOo2cWrskZRnDaH+JxMTGj69/LHrVNJbB8sUspTjAkT
         SQ/ih4zX5GkBLTuixnKxIG725PRHA5musqjp4nOyc5CzEC/ykx5WLwKPogb/GA/sApDr
         PZN6ce3a9Dmf+DKU9Hp+Fr9R69j+m9smheKu6DNjTXzS2Z5/u3ZWS2t8D2TsZBXXrh2D
         k+YuN0fB6bdw7iZSRNyv70OMWTpeLBVCvQsBepvuMQfmi7+PQGfBMrOjVPJd1kvU0tOS
         DrVbntvC3A/RsuVt5a3j9bYUHq1yQSWcgUFcn/VXnIpIv01lN0YegF4aQrXpa95YBKJz
         1SqQ==
X-Gm-Message-State: AO0yUKWQf9b0ECSNnsYy94D4PjZ2kxcyBurjPFwr7e6W8r0W1y/8iPsW
	RICTAapohYFF/ptSck+fw54r+2XRiNjG0RsQ
X-Google-Smtp-Source: 
 AK7set/SJqHMjOhtmnND3KjPz4P23Kb0U+wiZQMvUF4SrQ5Us1/B1xSTkzqqTVIqCXKF/P0fOTOq7g==
X-Received: by 2002:a05:622a:1a8d:b0:39c:da21:6bb3 with SMTP id
 s13-20020a05622a1a8d00b0039cda216bb3mr24078540qtc.56.1676016074235;
        Fri, 10 Feb 2023 00:01:14 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id
 128-20020a370586000000b00721b773b40asm3164203qkf.4.2023.02.10.00.01.13
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 00:01:13 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id x71so4515966ybg.6
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 00:01:13 -0800 (PST)
X-Received: by 2002:a5b:24c:0:b0:87a:68fd:181a with SMTP id
 g12-20020a5b024c000000b0087a68fd181amr1746337ybp.36.1676016073446; Fri, 10
 Feb 2023 00:01:13 -0800 (PST)
MIME-Version: 1.0
References: <87y1p7bpma.wl-kuninori.morimoto.gx@renesas.com>
 <87v8kbbpl4.wl-kuninori.morimoto.gx@renesas.com>
 <072724aa-2bf3-32a6-dee8-e74c74b01019@linaro.org>
 <87fsbe1i9e.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87fsbe1i9e.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Feb 2023 09:00:58 +0100
X-Gmail-Original-Message-ID: 
 <CAMuHMdVOgnxSkAyy_3MGYeQyRcsr5aM00qSfhrXTMBLy1aa7yA@mail.gmail.com>
Message-ID: 
 <CAMuHMdVOgnxSkAyy_3MGYeQyRcsr5aM00qSfhrXTMBLy1aa7yA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: dt-bindings: renesas,rsnd.yaml: add R-Car
 Gen4 support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 6QN3BSP6UEAOSCCHEHLM62YQKHDDFNPX
X-Message-ID-Hash: 6QN3BSP6UEAOSCCHEHLM62YQKHDDFNPX
X-MailFrom: geert.uytterhoeven@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6QN3BSP6UEAOSCCHEHLM62YQKHDDFNPX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Morimoto-san,

On Fri, Feb 10, 2023 at 1:22 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > >
> > > There are no compatible for "reg/reg-names" and "clock-name"
> > > between previous R-Car series and R-Car Gen4.
> > >
> > > "reg/reg-names" needs 3 categorize (for Gen1, for Gen2/Gen3, for Gen4),
> > > therefore, use 3 if-then to avoid nested if-then-else.
> > >
> > > Move "clock-name" property to under allOf to use if-then-else.
> (snip)
> > > -  clock-names:
> > > -    description: List of necessary clock names.
> > > -    minItems: 1
> > > -    maxItems: 31
> >
> > No improvements here. Your argument that you need to remove it to
> > customize is not correct.
>
> ???
>
>         Move "clock-name" property to under allOf to use if-then-else.
>         ^^^^
>
> "move", not "remove".

The point is that you did remove the common

      clock-names:
        description: List of necessary clock names.

from the top level, and added two copies of it under if/then/else.

Please keep common stuff as high up in the hierarchy as possible,
to avoid the need for duplication.
In this case, that means:
  - Keep the description at the top level,
  - Put only {min,max}Items and items under if/then/else.

I hope my explanation helps.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
