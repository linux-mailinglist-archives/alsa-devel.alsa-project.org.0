Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 095516877F5
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 09:54:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B7127F4;
	Thu,  2 Feb 2023 09:54:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B7127F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675328094;
	bh=bHBwKJov+zpEosLImKBwe8LeNRSHZ/RCA3ZQ7i9sDF4=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gDj4YLBJIr3oWojvloQFdFZOPStW4QyTZ3Pet7ESeNSoXYCYgqrv7U7wKfbliYvt0
	 SsIExZo8hfXo77SvlFtJ9Laa4RMyZd1JSGgbV8w34EBtTDXWpH2GZyibVC+CFvZ+fb
	 hvfDbTZcYQvdtqk6J0mtiA7aQZ9BmCCGcWIzjTeo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CDD6F80271;
	Thu,  2 Feb 2023 09:53:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64E6CF80169; Thu,  2 Feb 2023 09:53:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADEECF80169
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 09:53:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADEECF80169
Received: by mail-qv1-f41.google.com with SMTP id ll10so619666qvb.6
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 00:53:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RbRNzSOCTkb85xcFH4UljrdPnfMc38Sjfdj2ACsM8nw=;
 b=ibjQJmq0LhFukRdO0CrVECaTzoWvtkm2l/iGzjPPaTDZuGnzy8IiP85jJtcFsGTKvy
 N5gAeOupaw6c5XOkwTuo4QzCatBPsajVoH7BSSxhjCZxSk2Xm44UVpso03IoAhp8zH/O
 K9Y1DkO/ulf629L3RoYgMw1huin7SQQTj6Ni/eouorXKFFu9czEpOBRenPMFDwZR1S4o
 03WNiMFi7VFTtHE7Szc6WDxJcfeqPUzMFsvqVqglsXYKmXi9Qi0PcLlAS0rcnQKryP3C
 osnHay++MmibpLHPeGOJ2WFVYfeGsUuLoHg9uwfZptgaG/vWCculnYn8wjOqGSPncNbe
 Ym4w==
X-Gm-Message-State: AO0yUKX9JuboQBvLVPjdGCCZyC1/RlLjioKfFLDWfPPqmhgRs9r83Yqo
 KHvoFJ7kTjkhenDF5E6SHgyDfmTLyTOiRw==
X-Google-Smtp-Source: AK7set9r8MQog0KKnYaZ/DOe3cqmgf4u5tiAiO4oXVsjK9PomdgfhfhvdwRxLo5oB0NEEFGkeSvQcQ==
X-Received: by 2002:a0c:ff07:0:b0:537:6509:b810 with SMTP id
 w7-20020a0cff07000000b005376509b810mr7698342qvt.41.1675328021355; 
 Thu, 02 Feb 2023 00:53:41 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 dy31-20020a05620a60df00b0070531c5d655sm13817537qkb.90.2023.02.02.00.53.40
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 00:53:41 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-5217ecc51d5so17036607b3.13
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 00:53:40 -0800 (PST)
X-Received: by 2002:a81:ac17:0:b0:51d:f0a4:64dc with SMTP id
 k23-20020a81ac17000000b0051df0a464dcmr558493ywh.384.1675328020617; Thu, 02
 Feb 2023 00:53:40 -0800 (PST)
MIME-Version: 1.0
References: <87a61y6t8e.wl-kuninori.morimoto.gx@renesas.com>
 <87pmau5ejk.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pmau5ejk.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Feb 2023 09:53:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW_QHmODAKvn_GwHHUWw-=z4Tdq0NkhdK2u2piG_YgB-Q@mail.gmail.com>
Message-ID: <CAMuHMdW_QHmODAKvn_GwHHUWw-=z4Tdq0NkhdK2u2piG_YgB-Q@mail.gmail.com>
Subject: Re: [PATCH 14/15] ASoC: dt-bindings: renesas: add R8A779G0 V4H
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

On Wed, Feb 1, 2023 at 3:11 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Document R-Car V4H (R8A779G0), and R-Car Gen4 SoC bindings.
>
> Link: https://lore.kernel.org/r/87zga6t5r4.wl-kuninori.morimoto.gx@renesas.com
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thanks for your patch, which is now commit f76fec606d07b43d ("ASoC:
dt-bindings: renesas: add R8A779G0 V4H") in sound-asoc/for-next

> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -46,6 +46,10 @@ properties:
>                - renesas,rcar_sound-r8a77990  # R-Car E3
>                - renesas,rcar_sound-r8a77995  # R-Car D3
>            - const: renesas,rcar_sound-gen3
> +      # for Gen4 SoC
> +      - items:
> +          - const: renesas,rcar_sound-r8a779g0  # R-Car V4H
> +          - const: renesas,rcar_sound-gen4
>        # for Generic
>        - enum:
>            - renesas,rcar_sound-gen1

I think you forgot to update the reg-names section below, as it
doesn't match its user in
https://lore.kernel.org/all/877cx0anfe.wl-kuninori.morimoto.gx@renesas.com

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
