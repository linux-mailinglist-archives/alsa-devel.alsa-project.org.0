Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F10D364DA00
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 12:04:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8783C228A;
	Thu, 15 Dec 2022 12:03:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8783C228A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671102257;
	bh=b3UsTHbPJQMG2DfX/FJtHgyQ9pSr66NvVHhXgWiJoGA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ez2HPbWO27Z/WwovtF6aXCewqspX4AnknnRaUCCuYEWTvh8tUrIpJRqCTc4PgPg3P
	 ZH8h+HYnhVoV73oWw8CZGXLrOFh91ZY+HpN4lo+B30AKvrgdgjSYP545kMtvGdXBz4
	 qM5ehS4MP9+T+YzoKyPSF03tX62UG+4Id7CBwcRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D173F801D5;
	Thu, 15 Dec 2022 12:03:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85C03F804ED; Thu, 15 Dec 2022 12:03:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1730F804CB
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 12:03:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1730F804CB
Received: by mail-qt1-f174.google.com with SMTP id fu10so4896667qtb.0
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 03:03:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W1J3eIm7gN+a7l7I5FPtNe9iMuDw4N0S5iQn7zeIcKY=;
 b=pMQpqLmMcMeyGMg/9JX7k16uIKBQ2Mc0t3CrsK63/lQ3SNH1fLnMY78sRLWhDC/73U
 S77VCSOTDHQlrbu1bwIH+rmuEK+1RZVrUYUv9xvZra1ID3j3aZuudZ8xHMnWeWMs8MWw
 H8zoahh+YwngRLjgV70iJpHd/1OtWlfV6lOlBrAkh2PdK3CaeJoHbpfrvHxUe18qeE9v
 fseGe1dn+O4ROHvmccNOx6kWAXZiU1tMApLkwJWqhsVg+T+Upuf7Kw3EQ8ue1HO1+daP
 09CEFb979SttaQmleGFMusmlTubujmbGdt7EHJNV9RllJxvmEaOAmCqSDs/+VCla+W2Z
 /+rA==
X-Gm-Message-State: ANoB5pnDfYyqlA9U+ebomqdqaimN+qF7re+u81e5rnAReKy3Jl55um+K
 8G/oROwS/K290kWieeVaKuLoNG5af7tQ+g==
X-Google-Smtp-Source: AA0mqf7xhz/7voA6dYa0H8SejaYoxv89b1az2BD5EVnn4ZdT2bomu9FjUNeka0kHHm5NHBm7XGkAhA==
X-Received: by 2002:ac8:1198:0:b0:39c:da1f:f7f8 with SMTP id
 d24-20020ac81198000000b0039cda1ff7f8mr35978969qtj.30.1671102194594; 
 Thu, 15 Dec 2022 03:03:14 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
 [209.85.219.179]) by smtp.gmail.com with ESMTPSA id
 z12-20020ac8100c000000b003996aa171b9sm3175656qti.97.2022.12.15.03.03.14
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 03:03:14 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id i186so3014042ybc.9
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 03:03:14 -0800 (PST)
X-Received: by 2002:a25:9:0:b0:6f9:29ef:a5ee with SMTP id
 9-20020a250009000000b006f929efa5eemr39090062yba.380.1671102193696; 
 Thu, 15 Dec 2022 03:03:13 -0800 (PST)
MIME-Version: 1.0
References: <87v8mepyoy.wl-kuninori.morimoto.gx@renesas.com>
 <87mt7qpylw.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mt7qpylw.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Dec 2022 12:03:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=_-MyqAjRqaoPyWkoUmdB2VOE1t+wpym7eyOxkzc_7g@mail.gmail.com>
Message-ID: <CAMuHMdW=_-MyqAjRqaoPyWkoUmdB2VOE1t+wpym7eyOxkzc_7g@mail.gmail.com>
Subject: Re: [PATCH 06/11] ASoC: dt-bindings: ti,
 pcm3168a: Convert to json-schema
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
Cc: Rob Herring <robh@kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mohan Kumar <mkumard@nvidia.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Morimoto-san,

On Wed, Dec 14, 2022 at 2:23 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Convert the Texas Instruments PCM3168A Audio Codec Device Tree binding
> documentation to json-schema.
>
> Add missing properties.
> Drop unneeded pinctrl properties from example.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch!

You forgot to list the changes you made to my patch:
  - Refer to audio-graph-port.yaml instead of describing ports and
    port@[01] subnodes explicitly.

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/ti,pcm3168a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments PCM3168A Audio Codec
> +
> +maintainers:
> +  - Damien Horsley <Damien.Horsley@imgtec.com>

For v2, I had planned

    -+  - Damien Horsley <Damien.Horsley@imgtec.com>
    ++  - Jaroslav Kysela <perex@perex.cz>
    ++  - Takashi Iwai <tiwai@suse.com>

as Damien's address bounces.

Or perhaps you want to become the maintainer?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
