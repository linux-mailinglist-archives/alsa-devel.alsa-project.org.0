Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4135DF10
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 09:41:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD41616A2;
	Wed,  3 Jul 2019 09:40:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD41616A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562139682;
	bh=YIDBggrpOgQVWjgFUCQlA+UnIQy9U3I2Msg/5yadOZE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EQgyuT0BqBGWGdq2i4/jM/KVl+hxgOYYf0Ed++YQ9IzdHn8PFJRYWngiO48h8dL/1
	 RnHbl43nv00M/m17SvRc4SvOaTvr/qwRv1dgz3l1d1reh3Yda1H28H1yeiLmnBiAEA
	 e4BhdvrDgjy5jtQ5crhJjNs5AC+P4dItD8WCQnmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C99B8F800E8;
	Wed,  3 Jul 2019 09:39:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FCF0F800EA; Wed,  3 Jul 2019 09:39:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21558F800E8
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 09:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21558F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="rv8/eydR"
Received: by mail-oi1-x243.google.com with SMTP id u15so1298882oiv.0
 for <alsa-devel@alsa-project.org>; Wed, 03 Jul 2019 00:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w+ONtwKrr9MoAxJy3nzYyZYaZtN7tZSEZElIWhYkH6s=;
 b=rv8/eydRATgo4XLG7QYMsUNM6tIoAfjMBeIEw526lP66oRfS1YEvpduOSz0u7nibUl
 nb76zfYHzWEFwMrqiGxJbb+vcHmiIHpS7tFjZ2ltXqaYUkFhKztC9otdCyajFbmp/N/u
 VMJK38E3H+WyuHIeRFz7e3AmhIHOJr6kz2xOYRbsaMFVBGxPXF1Lys2N4W6Z70E8i8/C
 MuzeQrOzkxXI/3PPnh42oDJmnOXbrx8nT/8lVQLr3qTTlR6i2SN2J59cRwl6JJmgamuw
 loUICPT9wT9KTrXh97PDSBDor1LhPYL9aH+2dXN/tcH4XWDVKf9Ish5qOZvC3rqpl4n7
 KlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w+ONtwKrr9MoAxJy3nzYyZYaZtN7tZSEZElIWhYkH6s=;
 b=Tio2NSj2MWzhblbapOOTUXHVIr4fhJO1e66TAYXl8AmbfF4fJqs/pRHLLqN98r7IF5
 qUHhM27zhciwe/aCMTcy/hscj6ZbVq7xvCAA6kc/b/VqMRQ2URG0cNWwUSsZViPoIUcg
 O+LB8GTBNsKKawAwYpsvZ/nXVkTLX496Rx5S9Agkc6EmVKKDwrY1ZxY4oJQD9MMEMpeE
 7WxfkKX2Oewj2CiJk70JB6F2N/X0Vyw+KY4HhAt/Jpyzvm1rIGPhu70FNYjfV6mhSTB9
 jNufe4d0u6wBeyIC3232RctWsGhwopk7P+8atOjcMJEjXSlRffKp0S6928ruxP4StMyu
 3MBg==
X-Gm-Message-State: APjAAAUzBI11pllmtv02DGTyqsPY0DCLhb4wKnz+WNaOMVjFRsIH9f0w
 zDsQ69G2Q2rjj/OMjwMch3xM7ZH374In7kO6jm3cUg==
X-Google-Smtp-Source: APXvYqxN4JBehPtSNVFvMgeIctFw8U6GM1tPTFUqjq+7Uz2D6J3GcSi6Tcqvx53ETCvfY/YyDqrTPsjGLQzG92y6q3s=
X-Received: by 2002:aca:574e:: with SMTP id l75mr5705600oib.2.1562139570860;
 Wed, 03 Jul 2019 00:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190627120208.4661-1-codrin.ciubotariu@microchip.com>
In-Reply-To: <20190627120208.4661-1-codrin.ciubotariu@microchip.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 3 Jul 2019 15:39:19 +0800
Message-ID: <CA+Px+wXBBgeWbjZ5uQmwJgn+d=ZE-N0aehitog7==ak3GDxMsQ@mail.gmail.com>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc: ALSA development <alsa-devel@alsa-project.org>, lars@metafoo.de,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: codecs: ad193x: Group register
 initialization at probe
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jun 27, 2019 at 8:05 PM Codrin Ciubotariu
<codrin.ciubotariu@microchip.com> wrote:
> +struct ad193x_reg_default {
> +       unsigned int reg;
> +       unsigned int val;
> +};
You probably don't need to define this.  There is a struct
reg_sequence in regmap.h.

> +
> +/* codec register values to set after reset */
> +static void ad193x_reg_default_init(struct ad193x_priv *ad193x)
> +{
> +       const struct ad193x_reg_default reg_init[] = {
> +               {  0, 0x99 },   /* PLL_CLK_CTRL0: pll input: mclki/xi 12.288Mhz */
> +               {  1, 0x04 },   /* PLL_CLK_CTRL1: no on-chip Vref */
> +               {  2, 0x40 },   /* DAC_CTRL0: TDM mode */
> +               {  4, 0x1A },   /* DAC_CTRL2: 48kHz de-emphasis, unmute dac */
> +               {  5, 0x00 },   /* DAC_CHNL_MUTE: unmute DAC channels */
> +       };
> +       const struct ad193x_reg_default reg_adc_init[] = {
> +               { 14, 0x03 },   /* ADC_CTRL0: high-pass filter enable */
> +               { 15, 0x43 },   /* ADC_CTRL1: sata delay=1, adc aux mode */
> +       };
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(reg_init); i++)
> +               regmap_write(ad193x->regmap, reg_init[i].reg, reg_init[i].val);
> +
> +       if (ad193x_has_adc(ad193x)) {
> +               for (i = 0; i < ARRAY_SIZE(reg_adc_init); i++) {
> +                       regmap_write(ad193x->regmap, reg_adc_init[i].reg,
> +                                    reg_adc_init[i].val);
> +               }
> +       }
And you could use regmap_multi_reg_write( ) to substitute the two for-loops.

See https://mailman.alsa-project.org/pipermail/alsa-devel/2019-June/151090.html
as an example.  It also has some reg initializations in component
probe( ).
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
