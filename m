Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E9B485644
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jan 2022 16:55:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17D14193B;
	Wed,  5 Jan 2022 16:54:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17D14193B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641398126;
	bh=OWhV6Jgg7HfEzXz/k7f3Jth3jDeqXM9fjGVlDvKt7ro=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qmFuNpgZDHXZDkMJPj8wJq+TMpl2WKQNHNkphZBqQ+Ag99TPZ8DI1h9dLWa/SmV1e
	 PcdPK3VYLpdPgeRNm82bVSyund4CrbSuD0PxLO7UraHwqR8LVBnPn5p7ZpP6WktIpG
	 x1eIVaA8p4x71gE2t0PQDW19XKjXlumf0KA85csw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75CD6F8020C;
	Wed,  5 Jan 2022 16:54:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E84D7F801D8; Wed,  5 Jan 2022 16:54:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF7E8F8007E
 for <alsa-devel@alsa-project.org>; Wed,  5 Jan 2022 16:54:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF7E8F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aAiyTBoL"
Received: by mail-wr1-x432.google.com with SMTP id e5so83948951wrc.5
 for <alsa-devel@alsa-project.org>; Wed, 05 Jan 2022 07:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W1hSBC1/w98Pw768lmJjpnN6pQZfQzImMpHnsNTHwes=;
 b=aAiyTBoLIFSGF30KgT0PoBOWB4sG/qXliIZcz23iLomVGGocLLPuR1fElE6eX0aaxk
 AfXUTEyJztGRVD+nYfZHV2NU1uNLuHTAenWQI1N5S4XkcxtOzcqytWp3XskMVruBxFlx
 +nPKlamtrLk0fHpxCzxeYxI/xs6Y0Gl2cqAVTieXr3VQ55JOsIXzoJzXdz+b7aL5GJdx
 /v7204V4P1OuvP2qpR1Fg20Gi0r8w9NSt+gMN5Ewi6HdCEbmCyr97h6EUV6dv3bBwWWD
 3MgTjziPQYPaTlSpqQKNlv6GJG5zPFiBqiHgRk5Fs/QsaVwbgLgcRzv7LFKC16C7IRWr
 /YvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W1hSBC1/w98Pw768lmJjpnN6pQZfQzImMpHnsNTHwes=;
 b=f5CgNxffdFm19griXdCK0zhejj2otsx+TIPjkb6T6hdwYuVNafhTnudfyEvbr6CA9r
 iMi4j6SsUZ4hkQHsjl2LAeZsYrmr3+GIxLi9wgtbGD7EkNPZ4bn5CmNuvDucKU6uI9uY
 nNKffrIgwXwJDKeBZvnk8Cu4+hfPyKJQ+2yOdd5eS8pXkb/RKi3mFWfd3iReHEOUSPGt
 jU6ivGrLs7msr24TZt550wCSD2A2exLTEAWWR465vvtuoZsJzp4F0p3V3wX68yLyCQlx
 Z3FrOkMCT6OBwoCQ0JWyL/cMFU2fxXvnU9HUU93hAGpoWybN+4Hg9LIO/u8jZr16u5qq
 DSAw==
X-Gm-Message-State: AOAM532YdWsrHugzDzh+lCTYN+juwHvCZW1J/hG1NxThVM9QBxVujyvg
 G3xs+m7t2Qb4GNxgq8BYx+AsUD9MoikAWUDXzTs=
X-Google-Smtp-Source: ABdhPJywwb5ns/ANiBJIsaCUkgHG7AuBBdGtP/ATxIr7g1Fxp2Z03sxOoIvq9UzjMTvcJuZA3W7w5GMldnEqkblZNPA=
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr47690277wrd.81.1641398042839; 
 Wed, 05 Jan 2022 07:54:02 -0800 (PST)
MIME-Version: 1.0
References: <20220103043202.6524-1-yc.hung@mediatek.com>
In-Reply-To: <20220103043202.6524-1-yc.hung@mediatek.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 5 Jan 2022 17:53:51 +0200
Message-ID: <CAEnQRZBH4uwMmyBLY2bCtY9QZooBiK5PqF3T+4K8WAtQV1QN-Q@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: dsp: mediatek: add mt8195 dsp document
To: YC Hung <yc.hung@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, allen-kh.cheng@mediatek.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, matthias.bgg@gmail.com,
 Daniel Baluta <daniel.baluta@nxp.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Mon, Jan 3, 2022 at 1:00 PM YC Hung <yc.hung@mediatek.com> wrote:
>
> From: "YC Hung" <yc.hung@mediatek.com>
>
> This patch adds mt8195 dsp document. The dsp is used for Sound Open
> Firmware driver node. It includes registers,  clocks, memory regions,
> and mailbox for dsp.
>
> Signed-off-by: yc.hung <yc.hung@mediatek.com>

The code patch should be created against original source code from
Rob's tree. Here it seems the patch is against v2.

This isn't going to work! Because when Rob will try to apply the patch
it will fail since he doesn't have (and doesnt need to have)
your previous versions.

So, please keep the changes history (that's a good thing!) but always
rebase your patch on maintainer's tree.


> ---
> Changes since v2:
>   Remove useless watchdog interrupt.
>   Add commit message more detail description.
>
> Changes since v1:
>   Rename yaml file name as mediatek,mt8195-dsp.yaml
>   Refine descriptions for mailbox, memory-region and drop unused labels
>   in examples.
> ---
> ---
>  .../devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> index bde763191d86..779daa786739 100644
> --- a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> +++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
> @@ -27,14 +27,6 @@ properties:
>        - const: cfg
>        - const: sram
>
> -  interrupts:
> -    items:
> -      - description: watchdog interrupt
> -
> -  interrupt-names:
> -    items:
> -      - const: wdt
> -
>    clocks:
>      items:
>        - description: mux for audio dsp clock
> @@ -75,8 +67,6 @@ required:
>    - compatible
>    - reg
>    - reg-names
> -  - interrupts
> -  - interrupt-names
>    - clocks
>    - clock-names
>    - memory-region
> @@ -95,8 +85,6 @@ examples:
>         reg = <0x10803000  0x1000>,
>               <0x10840000  0x40000>;
>         reg-names = "cfg", "sram";
> -       interrupts = <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH 0>;
> -       interrupt-names = "wdt";
>         clocks = <&topckgen 10>, //CLK_TOP_ADSP
>                  <&clk26m>,
>                  <&topckgen 107>, //CLK_TOP_AUDIO_LOCAL_BUS
> --
> 2.18.0
>
