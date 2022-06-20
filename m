Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D69B7552159
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:40:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76C002959;
	Mon, 20 Jun 2022 17:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76C002959
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655739637;
	bh=yRfgMFLNS25yAYInEmnhTX2o/3NHuxycgfLSO6DobOo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mnw6esEf+Os0tdUDjhWG4pnR5z3DT+hfqi+PZyVv8bPwEvrpqOxcbi0ujvPuAUTiE
	 LTRPTNGknebeCq/3/oqQqJohcih+mFqKnNGwq6ygexc3wpOVT/pJRni3hj01V9SlfL
	 DMNk5ns+Ri4LSOEWlzVjA1J6OS9Y0cgzN8J7G6ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E00AF896CE;
	Mon, 20 Jun 2022 17:08:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACC00F800E3; Mon, 20 Jun 2022 10:07:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_135,SPF_HELO_NONE,
 SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF54CF800E3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 10:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF54CF800E3
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-101ec2d6087so2859522fac.3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 01:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U6iOgcYMqJ9zOwx1P0bKGX4G545U6AIxu9kHxZeyUd0=;
 b=DGsz6RGiTEyGNe1N2bWUNtpJzTbsdlYoi36NQep2pRpTtYQ6IeN8SCMuUooT13/DX+
 8U2xQ5dgK1enxyO4FTcOg3ko1+/Ya1/GO5Imc98wAc/yOpMvz4u8NSuf1DC2ODUSVD5G
 SrQXpm/ZBFL18pUn6HmMaKo8As35eZql1Nwad7RtSRKnlcaQc3tZm1Ox+CYvy81mm+nG
 ao4oWHUX/yY7KDfWnyW4efK2FTumusT6/0mMXSiZiNbDlG6ukWoPlXe5Cn4IsDYPCtye
 O9dSjkMlomeu0rqneWjQOLd1MPU39ExXcR2P3OlLmVgXVODSFwe34koTicC/6+JLglhg
 7iDA==
X-Gm-Message-State: AJIora8m6HYmZMUoPjp32gl6xjGKggw/qbjZ6B5AS68Gb6dw7xRobwHM
 0DAI6R4lR8NMYCqieK3VETAW0ZHb1XHTFQ==
X-Google-Smtp-Source: AGRyM1tmHrn6StCrZYkSTPLJM7A/tcBW83YSrqdIbkYo4nRZ3OI0/rhEqhIhG+Oi5r7Cq12EfRdIyw==
X-Received: by 2002:a05:6870:3102:b0:101:15a2:9d7f with SMTP id
 v2-20020a056870310200b0010115a29d7fmr12080443oaa.36.1655712470144; 
 Mon, 20 Jun 2022 01:07:50 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com.
 [209.85.210.44]) by smtp.gmail.com with ESMTPSA id
 v186-20020acadec3000000b0032e73b538dasm6940979oig.52.2022.06.20.01.07.49
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 01:07:50 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id
 l24-20020a0568301d7800b0060c1ebc6438so7814305oti.9
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 01:07:49 -0700 (PDT)
X-Received: by 2002:a25:bd41:0:b0:668:c259:f6c2 with SMTP id
 p1-20020a25bd41000000b00668c259f6c2mr15091616ybm.365.1655712136748; Mon, 20
 Jun 2022 01:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
In-Reply-To: <20220618123035.563070-7-mail@conchuod.ie>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Jun 2022 10:02:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtjZVvy-gGTksVRYa+dS7-1ngQf9_kfp6k29nkfizKbA@mail.gmail.com>
Message-ID: <CAMuHMdXtjZVvy-gGTksVRYa+dS7-1ngQf9_kfp6k29nkfizKbA@mail.gmail.com>
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
To: Conor Dooley <mail@conchuod.ie>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 20 Jun 2022 17:06:44 +0200
Cc: Niklas Cassel <niklas.cassel@wdc.com>, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>, Heng Sia <jee.heng.sia@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Vetter <daniel@ffwll.ch>, dmaengine@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>
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

Hi Conor,

On Sat, Jun 18, 2022 at 2:32 PM Conor Dooley <mail@conchuod.ie> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
> width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
> this.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -135,19 +135,41 @@ properties:
>        of the designware controller, and the upper limit is also subject to
>        controller configuration.
>
> -patternProperties:
> -  "^.*@[0-9a-f]+$":
> -    type: object
> -    properties:
> -      reg:
> -        minimum: 0
> -        maximum: 3
> -
> -      spi-rx-bus-width:
> -        const: 1
> -
> -      spi-tx-bus-width:
> -        const: 1
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: snps,dwc-ssi-1.01a
> +
> +then:
> +  patternProperties:
> +    "^.*@[0-9a-f]+$":
> +      type: object
> +      properties:
> +        reg:
> +          minimum: 0
> +          maximum: 3
> +
> +        spi-rx-bus-width:
> +          const: 4
> +
> +        spi-tx-bus-width:
> +          const: 4

These two also depend on the board (SPI device + wiring).
So all of [1, 2, 4] are valid values.

> +
> +else:
> +  patternProperties:
> +    "^.*@[0-9a-f]+$":
> +      type: object
> +      properties:
> +        reg:
> +          minimum: 0
> +          maximum: 3
> +
> +        spi-rx-bus-width:
> +          const: 1
> +
> +        spi-tx-bus-width:
> +          const: 1
>
>  unevaluatedProperties: false

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
