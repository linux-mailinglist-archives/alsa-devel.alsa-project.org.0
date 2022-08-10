Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D6658F3C0
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Aug 2022 23:15:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7AE5822;
	Wed, 10 Aug 2022 23:14:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7AE5822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660166134;
	bh=Ts/d+cRmtNwBeSqjjFS8WsqAprXaB6Sww8TLdHP7LJw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I/sJnLdfYm1WZtpFUJHfCxoNFg3GVC9pLLdoXAL1RF+KVvaanNyLEEvBTeELZWYiw
	 5WxEUJ0gZq5zaeBrYoZReG9UlcLooKUgAEBfA/NZFnsjxMAAsYtJJgrnv7DXqYUoHw
	 6K//bYDps4vlzqCEuuDzy4yMlF4CIN56U8ZYIdd8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F616F80240;
	Wed, 10 Aug 2022 23:14:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27345F80132; Wed, 10 Aug 2022 23:14:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, SPF_HELO_NONE, SPF_NONE, T_SCC_BODY_TEXT_LINE,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C338F80132
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 23:14:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C338F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="mJ2qrO5M"
Received: by mail-lf1-x134.google.com with SMTP id bq11so22968644lfb.5
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 14:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=KstM2C1nqWzbgiq4lXjESSIV1F+sGBJqXZBKfIDDeII=;
 b=mJ2qrO5MX6fYku8PgLw5AnOtIoBprrurL+nSadvPZ/nI6zBSOd74G8iKYlHjlxhSGK
 USn07FxYrgyBuEIA+f2Mxh4Oa/e+iiBOCs19euWtk22Fu/Z9qw8oaRo30nQiHAkryS6Y
 OkGFpD8kk5juBZ0pa8b2rWt/+dgD8gCXmdnRvQK+0MF8N9K8OaD4UraP7imW+XgEtrf+
 eVDcIqCbW5EuGYwj2bh4+gx/7LwAiCviv4k3pi6iA8Z/WIOSMsyBb/O9EBsYHE7ukUS8
 xokR0vi2c3FQE9t2Udn3bU0+uZ3i4ejbYLZGKdMm/LrvNqJ66BM5i1pvxlXY91KPTSBE
 Nynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=KstM2C1nqWzbgiq4lXjESSIV1F+sGBJqXZBKfIDDeII=;
 b=41rnsoObz8KX6fnAlYeqCpiLAJ0l+APn6zEP4ShJpLWU3JasX9Q0GMq1IOP7krNkXb
 /zeouX+LR1TfJ3JZbrLmz4adD5gtuUxJltxAf7ioP6lGx6mQW0NF7QwWQgaWLgF32FaY
 StmuWCNehH9Q+jFzCWmhUZlaqKlazQnbjKbBVv5oaXUB+4VMgV56g1kRtfRSmgnuM0ei
 /CkeijLQ/mUOXG1Rayae/D9XZwrWfAQecnxPpFoD5k+pRmaCqrIfsBMI5k0sFpMb/9Xj
 UlsPjlHbhwAVq+QgsDpIZvUmVAI4lGjEXR9uJ4CioFVXjwlpESrOAiNTWDCk6YkkAWUP
 dY6w==
X-Gm-Message-State: ACgBeo1k2RkG9k9JTmGQZumblsW70RoJnNlao1IrRnf+WVuHf1/zokAK
 P4Ime0PPPYt8Fy02Cv5qN39CaGPt/xh+7rD4p1iLJw==
X-Google-Smtp-Source: AA6agR7XAy8+dRFXr1tYRU78D2cRU1qIJone22+JuKdzodOZmAEH3tkfVSaACFucoUikH/AMCJJ0BTbB6CoPorjLq5E=
X-Received: by 2002:ac2:4f03:0:b0:48a:6061:bd8e with SMTP id
 k3-20020ac24f03000000b0048a6061bd8emr11290623lfr.647.1660166068361; Wed, 10
 Aug 2022 14:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220810010809.2024482-1-nathan@kernel.org>
In-Reply-To: <20220810010809.2024482-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 10 Aug 2022 14:14:16 -0700
Message-ID: <CAKwvOdmZvB_=JTeLg08uMFhEMpWga4FJey50QHjzCv_jMVpwkg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mchp-spdiftx: Fix clang
 -Wbitfield-constant-conversion
To: Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Mark Brown <broonie@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
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

On Tue, Aug 9, 2022 at 6:08 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> A recent change in clang strengthened its -Wbitfield-constant-conversion
> to warn when 1 is assigned to a 1-bit signed integer bitfield, as it can
> only be 0 or -1, not 1:
>
>   sound/soc/atmel/mchp-spdiftx.c:505:20: error: implicit truncation from 'int' to bit-field changes value from 1 to -1 [-Werror,-Wbitfield-constant-conversion]
>           dev->gclk_enabled = 1;
>                             ^ ~
>   1 error generated.
>
> The actual value of the field is never checked, just that it is not
> zero, so there is not a real bug here. However, it is simple enough to
> silence the warning by making the bitfield unsigned, which matches the
> mchp-spdifrx driver.
>
> Fixes: 06ca24e98e6b ("ASoC: mchp-spdiftx: add driver for S/PDIF TX Controller")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1686
> Link: https://github.com/llvm/llvm-project/commit/82afc9b169a67e8b8a1862fb9c41a2cd974d6691
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Ah yes, my favorite, signed one bit integers...thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

grepping for `gclk_enabled`, we see three drivers with similar
duplication (single bit bitfields):

sound/soc/atmel/mchp-spdifrx.c
241: unsigned int gclk_enabled:1;

sound/soc/atmel/mchp-pdmc.c
118: u8 gclk_enabled:1;

sound/soc/atmel/mchp-spdiftx.c
200: int gclk_enabled:1;

> ---
>  sound/soc/atmel/mchp-spdiftx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
> index 4850a177803d..ab2d7a791f39 100644
> --- a/sound/soc/atmel/mchp-spdiftx.c
> +++ b/sound/soc/atmel/mchp-spdiftx.c
> @@ -196,7 +196,7 @@ struct mchp_spdiftx_dev {
>         struct clk                              *pclk;
>         struct clk                              *gclk;
>         unsigned int                            fmt;
> -       int                                     gclk_enabled:1;
> +       unsigned int                            gclk_enabled:1;
>  };
>
>  static inline int mchp_spdiftx_is_running(struct mchp_spdiftx_dev *dev)
>
> base-commit: 15205c2829ca2cbb5ece5ceaafe1171a8470e62b
> --
> 2.37.1
>


-- 
Thanks,
~Nick Desaulniers
