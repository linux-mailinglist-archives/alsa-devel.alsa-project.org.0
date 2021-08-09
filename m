Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4543E45F8
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 14:59:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E2AC84C;
	Mon,  9 Aug 2021 14:58:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E2AC84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628513964;
	bh=ueBx1XiTTSoX2V8nAwCAcCjOSy+RD7PTqFtRmtso9rM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MHW2f49OqyFyfjkaSXGdICLYlNoc/8vJ2ZX6+3x61qI9WOc6UZ8iZVLHRscrcSsec
	 G3y8ZCHAH+r0cR8AGGrNaChMoHZ2H6joTHTLex1gV++YNnouYtMpWKzydIGl9WsyoV
	 8E4/oFUYlakOgepieut2RCPGW+gseTXSN/vYljzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6FB8F8032D;
	Mon,  9 Aug 2021 14:57:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 378B1F802D2; Mon,  9 Aug 2021 14:57:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com
 [209.85.221.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ABF2F800FD
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 14:57:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ABF2F800FD
Received: by mail-vk1-f179.google.com with SMTP id q3so3892407vkd.2
 for <alsa-devel@alsa-project.org>; Mon, 09 Aug 2021 05:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8YyANyuZR7fYPTEivb2A77rPthj74HCMJFLYlpLjhb4=;
 b=O1XAJnFTSVmdK38IvLrP3TX61Od+t2gh5weesoyY4jfXyF/6lza0Gasfy/gDS5EL6n
 GJYYtHQgDicYYS5k6oU5sl/oZ05688XyhF3dmeg0j/X2w/BwZ4ThLSWUFB5jJrVc3HJ3
 BoEt97pAJTR8hkyIog7NvNGThupN+TrrXoAuP5Wl7i8gmzr59ijbSHW72ZTvnhgKItVW
 SR0bb/i3mu23kJRp068cZ0OCf6FhZBslXeEdt3wmEOgzAwQ76olAag0ApTSrBv2lCNOc
 d+UV1ZvlVFZRLCLwsIkM8fRvZJa+5Ta9CZPsuY5jRngYGK1Oa5qNfEZOuNd7PF1YnMuU
 A/Qw==
X-Gm-Message-State: AOAM533qtIisJTKVKxxmHNdSOy0QWreWcmXW+7DvZHgjv4VasaaLafVJ
 ctlhjviDTfl9JG+3g5gt9tKo/+b1Ld2MHcYNmTs=
X-Google-Smtp-Source: ABdhPJy3oD8kwL2fKgjd1+x6oD9DrDy3lnCulPeZeuWofPVdmbjqf9lmI9L+WnkYPGr3ewE9j3BxXIRigNiej0QJHFk=
X-Received: by 2002:a1f:fc03:: with SMTP id a3mr13722921vki.1.1628513864509;
 Mon, 09 Aug 2021 05:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210806102930.3024-1-biju.das.jz@bp.renesas.com>
 <20210806102930.3024-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210806102930.3024-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Aug 2021 14:57:33 +0200
Message-ID: <CAMuHMdVnU4HSXCr08WEiVmYCNoRBcdZGOfS7mwmS_euo2RZaEA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] ASoC: dt-bindings: sound: renesas,rz-ssi: Update
 slave dma channel configuration parameters
To: Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Chris Brandt <chris.brandt@renesas.com>
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

On Fri, Aug 6, 2021 at 12:29 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The DMAC driver on RZ/G2L expects the slave channel configuration
> to be passed in dmas property.
> This patch updates the example node to include the encoded slave
> channel configuration.
>
> Fixes: 5df6dfbb6de815ba3a("ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> v3->v4:
>  * Updated bindings as the DMAC driver on RZ/G2L expects the
>    slave channel configuration to be passed in dmas property.

Thanks for the update!

> --- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
> @@ -93,8 +93,8 @@ examples:
>              clock-names = "ssi", "ssi_sfr", "audio_clk1", "audio_clk2";
>              power-domains = <&cpg>;
>              resets = <&cpg R9A07G044_SSI0_RST_M2_REG>;
> -            dmas = <&dmac 0x255>,
> -                   <&dmac 0x256>;
> +            dmas = <&dmac 0x2655>,
> +                   <&dmac 0x2656>;
>              dma-names = "tx", "rx";
>              #sound-dai-cells = <0>;
>      };

I think it would be good to describe the expected format in the description
for the dmas property, so the DTS writer knows what the numerical
values in the example really mean.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
