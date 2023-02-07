Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0302268D12C
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Feb 2023 09:01:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63EAB1DE;
	Tue,  7 Feb 2023 09:01:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63EAB1DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675756913;
	bh=/TvDgivwfzXR4eor6oGjM02JabWx1PoviK9AyE7ZjxQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fniiqGfCdFea6l9sjiallE5fnS7O8sZmFNapP1WeIT1Cu3oV/Ra+IGRxtTFzUGoXW
	 YLVBgY3tq4eUumJ81EH4Bjbr6rR2yzPgoiqN9AtO9sSHLI3kKIE4YXnBzoKfwFaof1
	 YSUgV9kafA/3MNYDYVxQMkj+GjVy//WqgqCJytxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2622BF804AA;
	Tue,  7 Feb 2023 09:00:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D324F8045D; Tue,  7 Feb 2023 09:00:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83546F800E3
 for <alsa-devel@alsa-project.org>; Tue,  7 Feb 2023 09:00:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83546F800E3
Received: by mail-qt1-f173.google.com with SMTP id m12so15808478qth.4
 for <alsa-devel@alsa-project.org>; Tue, 07 Feb 2023 00:00:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mex+jfAmaUpIUDmTe8kPqw4pgJV7GY+mCAfjiClmLdg=;
 b=Vx4+wVhMs+kqKhFDdsjTSOsr4Kq8TwbvZupxlLOH1GKNDEP28DuMtcTe/FZe+Xp/QV
 uPKejWIo5MJwY6gPuUUyN8dDng3PbQ6RvQ+xhzfTMIOgB46oIsvHYSsUi6+ENqAmFZ29
 RvtE8zZqtPdHww2aD3v8p4eqxnUk+FZZMwBgBLLkBLbjycPHOnMSX7mqYfEnm2uyIDWk
 kkIx6nIoCQ0ivK9eBGmrMuT0qtrFPRuyYvksOTmzvI9M2CzdDb5ADRDHF8gIgzFMD7JN
 g8OK1Nhdca2qIIz2cxdLHH1gr6hyaSoehCJjRL0uWYmqlPiG001k24Jc/ITnQ1azOYqp
 jdSg==
X-Gm-Message-State: AO0yUKUiBRsFnwJcGta4AdJgJKvMZTHQZAdDV5PEPHvT8lVvXbSCLt6y
 g5nxZzA7YVn5VyQKY4yfk74zpnOVhk4lHQ==
X-Google-Smtp-Source: AK7set/DbPx9/CYWacleXHNv4BV7+Da8G69mXkqzsQCp+iPkHZaMR3WKK9z97cmyjSh2lfTJ0FSdhw==
X-Received: by 2002:a05:622a:1a0c:b0:3b8:ea9b:cbc6 with SMTP id
 f12-20020a05622a1a0c00b003b8ea9bcbc6mr3850126qtb.56.1675756824413; 
 Tue, 07 Feb 2023 00:00:24 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 m15-20020ac85b0f000000b003a591194221sm9147522qtw.7.2023.02.07.00.00.23
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 00:00:24 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id d132so17498986ybb.5
 for <alsa-devel@alsa-project.org>; Tue, 07 Feb 2023 00:00:23 -0800 (PST)
X-Received: by 2002:a25:eb04:0:b0:7b4:6a33:d89f with SMTP id
 d4-20020a25eb04000000b007b46a33d89fmr204752ybs.543.1675756823230; Tue, 07 Feb
 2023 00:00:23 -0800 (PST)
MIME-Version: 1.0
References: <87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Feb 2023 09:00:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXYwW8bk+a+7Fb7DA7kT0DdQyJSGaSnFzdgfWZxpmPHAA@mail.gmail.com>
Message-ID: <CAMuHMdXYwW8bk+a+7Fb7DA7kT0DdQyJSGaSnFzdgfWZxpmPHAA@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] ASoC: dt-bindings: renesas,rsnd.yaml: adjust to
 R-Car Gen4
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
 Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Morimoto-san,

On Tue, Feb 7, 2023 at 2:12 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> This is [RFC] patches.
>
> This patch-set adjust to R-Car Gen4 on renesas,rsnd.yaml.
> It works and no error reported.
> But by this patch, non-Gen4 leaks from "ssi-[0-9]" checking.
> I'm not sure why it happens.

If the logic becomes too complex, you can also split the binding
description in 4 files, one per R-Car generation.
That would lead to lots of duplication, though.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
