Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 898EC3CF751
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 11:59:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07A1D1670;
	Tue, 20 Jul 2021 11:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07A1D1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626775167;
	bh=+yZYeX2YKlpFOes9sbdT8KFERxR8SN8gSfWl7kajpj8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hm11xkjqDQb2aMSLzACy1f6k7clB3e0ea5s4vtJ/3kzVbBamBQYPx0Bba45E0jS1J
	 2mWR2oTls759lFxnqIK6OtKU6m3m5Xu8719m1YkEnpRfiVFD01WW/Vf71erfUZZSde
	 vegB0iHgv1VvC6NaSBfMpyhJuF5clUKUJjnBkcCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6659EF80227;
	Tue, 20 Jul 2021 11:58:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBB5EF80218; Tue, 20 Jul 2021 11:57:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4697F80104
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 11:57:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4697F80104
Received: by mail-ua1-f41.google.com with SMTP id 109so7868925uar.10
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 02:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eJGM0RL5AN+h+vqFmyVhrYwvPstbguOVmw1vvv/X9nQ=;
 b=RIfFMR24cEFvJe+Ke9XiliO6azbCgqZdMXWmAuwn2T/8kX0B4R8Cdu78KwLbb3vLj3
 j65bfwApn01FqJNXFgAGnFsSualvAgpVKfyfNv+dPN7hw4nq1RAl+efV+OtRLCmfAL93
 uSKNTTNxEs9WzsWM6foayZPqNVdeoYMwYWS5fRLom/xj/7g6c+gnmjOh5gt5E3KeRytj
 n7l08RVDU2rS6FDX5ijk4qmAr2zPufzdafZMd5DjuogWGnzBQ/8Cg7VvfMKckk14CThO
 y/s+TP2SeVp1mW4zIzHpbIDSE5B5zw0l9wcz/xVTwi5HLXBqAcS0rUf18UNIz8vFJRqs
 OzlQ==
X-Gm-Message-State: AOAM530zK5tkhRHHqCyet+opHU73YxCcl0nL0XafnJyVGZoh/nutqnGo
 JkvvSPfwVLnEMT2+BusPzvzvUjtJp+YxM/dVEmI=
X-Google-Smtp-Source: ABdhPJyxjSTjcCC3q1+chNBc2dgfFtqHNKvgcywOC8BfkjjlY3Gzjn8/vT6Xz9Pg5lWgRXNjTgN320Zq5LydgfkuFlI=
X-Received: by 2002:ab0:6710:: with SMTP id q16mr7224714uam.106.1626775070742; 
 Tue, 20 Jul 2021 02:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
 <20210719134040.7964-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210719134040.7964-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jul 2021 11:57:39 +0200
Message-ID: <CAMuHMdV1f3TM3pKsftNkaOrFifAMdLkEcKdWs=wL54uFhEKoZg@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] sound: soc: sh: Add RZ/G2L SSIF-2 driver
To: Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <chris.brandt@renesas.com>, Mark Brown <broonie@kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Biju Das <biju.das@bp.renesas.com>
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

Hi Biju,

On Mon, Jul 19, 2021 at 3:40 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add serial sound interface(SSIF-2) driver support for
> RZ/G2L SoC.
>
> Based on the work done by Chris Brandt for RZ/A SSI driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/sound/soc/sh/Kconfig
> +++ b/sound/soc/sh/Kconfig
> @@ -45,6 +45,16 @@ config SND_SOC_RCAR
>         help
>           This option enables R-Car SRU/SCU/SSIU/SSI sound support
>
> +config SND_SOC_RZ
> +       tristate "RZ/G2L series SSIF-2 support"
> +       depends on OF || COMPILE_TEST

ARCH_R9A07G044 implies OF

> +       depends on ARCH_R9A07G044

Is there any hard compile-time dependency on ARCH_R9A07G044?

Perhaps you meant

    depends on ARCH_R9A07G044 || COMPILE_TEST

?

> +       select SND_SIMPLE_CARD
> +       help
> +         This option enables ASoC sound support for the RZ/G2L MPUs.
> +         The simple-audio-card driver and the RZ/G2L built-in serial
> +         sound interface (SSIF-2) driver are used.
> +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
