Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3043694026
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 09:58:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3452B83E;
	Mon, 13 Feb 2023 09:57:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3452B83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676278685;
	bh=NKJljpwg+Iy5MdDi4GskbjAZ0+PbQkUu9JYzrAZhLRk=;
	h=References:In-Reply-To:From:Date:Subject:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pvKQxBdZ08CkJghCv1zKYLJzOs8+ws1EPNqOy1xJmmt+mTSH+mbLF0eFSFIxgm3UX
	 b1PTq4+tPZNsErD82soB1BG5i55tyrV4m6oiK2bldwXuJ+hLXwWDMFlqqhPwc0q2Y0
	 nYuEmh7bz4qiJgTLyDMeeC8aAYw2opMce/5Hv0ho=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51CD7F8051F;
	Mon, 13 Feb 2023 09:56:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC45AF8051F; Mon, 13 Feb 2023 09:56:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FC3EF80038
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 09:56:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FC3EF80038
Received: by mail-qv1-f41.google.com with SMTP id d13so7925739qvj.8
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Feb 2023 00:56:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sM0WJjLf09bIi4cOcTK2bHZSg+aTB9RBwAec2ehjcEA=;
        b=PgGkfUX075IOYQi6s1GwyCiYyt8WfNv+AkRbcS9/mTsWm4ksezLTWBuYZ5nyhT53ze
         9ZJhJ1D89hDR1YsBG8hBarUwlfR3QiUQRm6+Pi8BHCVxpQHqfqLLzhD43lyZk/uOkeA9
         XTwQJgxL85Q8qSO3tU0Pnk5Ghlp0fqDTQ8rzlODv7xq+1FQ8qLACQ/AImjGHvlOPj8hI
         ewV65iZmpTER8yihAR4wNv1E/Wv1yjNeQod9iex0WY+Ca6bcE7yFX+fkRwYm5KdZema6
         oP+H119p3hksLyZjkeZqxNm7pErUz1DUl4o8tPYpOmxpL3DYQCHmaWiaxqvMPvctovo7
         U9eA==
X-Gm-Message-State: AO0yUKUsLHXZ4giGAJGd5+T8JhINY5HSOVu++Zbs5NofWuyZEwRYgWkr
	Syp14E1onBz9+Ha8PB9kRwFhg5MgyjBzlw==
X-Google-Smtp-Source: 
 AK7set+oiJyKdP1Cj1ufNy6g87MEKzenbe9DO5dhntJOZy3vaQirmTEdlEai2Pi3jiX6uncgTzlPwQ==
X-Received: by 2002:a05:6214:21e1:b0:54f:b7e9:182 with SMTP id
 p1-20020a05621421e100b0054fb7e90182mr45944757qvj.45.1676278577895;
        Mon, 13 Feb 2023 00:56:17 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id
 e16-20020a05620a015000b0073b399700adsm2230184qkn.3.2023.02.13.00.56.17
        for <alsa-devel@alsa-project.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 00:56:17 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id i137so4677249ybg.4
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Feb 2023 00:56:17 -0800 (PST)
X-Received: by 2002:a25:9e86:0:b0:8c2:240e:bd05 with SMTP id
 p6-20020a259e86000000b008c2240ebd05mr1013174ybq.359.1676278577138; Mon, 13
 Feb 2023 00:56:17 -0800 (PST)
MIME-Version: 1.0
References: <87ttzq8ga4.wl-kuninori.morimoto.gx@renesas.com>
 <87r0uu8g8x.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87r0uu8g8x.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Feb 2023 09:56:05 +0100
X-Gmail-Original-Message-ID: 
 <CAMuHMdU2_5SO53qs1KVcv7p5O1QP-DWpxVpUhmpFT3MQFKVO5A@mail.gmail.com>
Message-ID: 
 <CAMuHMdU2_5SO53qs1KVcv7p5O1QP-DWpxVpUhmpFT3MQFKVO5A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: renesas,rsnd.yaml: drop
 "dmas/dma-names" from "rcar_sound,ssi"
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: NEZ37ZWI2A7LVMBVPLAS4HTDJG56AEE3
X-Message-ID-Hash: NEZ37ZWI2A7LVMBVPLAS4HTDJG56AEE3
X-MailFrom: geert.uytterhoeven@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Linux-DT <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NEZ37ZWI2A7LVMBVPLAS4HTDJG56AEE3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Morimoto-san,

Thanks for your patch!

On Mon, Feb 13, 2023 at 3:13 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> SSI is supporting both "PIO mode" and "DMA mode", thus "dmas/dma-names"
> are not mandatory property. Drop these from rcar_sound,ssi's required:.

BTW, do SSIU and DVC support PIO mode?

> This is prepare for Gen4 support. See more details on Link

"This is preparation" or "This prepares"?

> Link: https://lore.kernel.org/all/87zg9vk0ex.wl-kuninori.morimoto.gx@renesas.com/#r
> Link: https://lore.kernel.org/all/87r0v2uvm7.wl-kuninori.morimoto.gx@renesas.com/#r
> Link: https://lore.kernel.org/all/87r0v1t02h.wl-kuninori.morimoto.gx@renesas.com/#r
> Link: https://lore.kernel.org/all/87y1p7bpma.wl-kuninori.morimoto.gx@renesas.com/#r
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
