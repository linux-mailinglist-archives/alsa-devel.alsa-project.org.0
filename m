Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C40C30106D
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 23:58:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E563C1EDE;
	Fri, 22 Jan 2021 23:57:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E563C1EDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611356297;
	bh=uGd3PWn15unPlgu6tfq4tRHvl+FprYH3U8GFKP8liTw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bnh/BLqMkNIHkqc8akJodXeH8ZGfInYyYIIc6TLB6lICbZe0ZGUqR4wB0jWa4MA30
	 XDNyJw3RQAGf6FJm4sxMJ4b/GjloMpqyI1tpfyPGvURNvh3cFwTx3Ig0Qbn62PBGyp
	 bFSvk4eEAbMdtm+qgCIV2oKp7Rd/2DfhdQ4rDIAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36346F80166;
	Fri, 22 Jan 2021 23:56:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02B2EF8016E; Fri, 22 Jan 2021 23:56:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C73A9F80164
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 23:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C73A9F80164
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uReFAt2h"
Received: by mail-lj1-x230.google.com with SMTP id f11so8344107ljm.8
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 14:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uGd3PWn15unPlgu6tfq4tRHvl+FprYH3U8GFKP8liTw=;
 b=uReFAt2hGePklsWA8YCuVX9u/eP4T0v8idfMb7Fu9gS2UqhxUiKFFLY8ZWV7mDbT1S
 5f6R5zaUj6Gus0nX7zyoHL/FlONxbnYbH1AzgXy54c7WuA+/f1wXV/q5P1clgFvG0h69
 0jW+v5Y1MepfmyI3wq5um2kHqn5SjUFQgZRwxLfYd+hpWluKbEARNgY5bLWMeM7xQBhl
 ENV2kSY/1R27WKc7yaJ7RKC+vtgogsaIufFxdym8N6v2t08w7hVdjgmztdeM80Mc4DmQ
 HUtm3vK40e45DRRIt07aVGbgfDiiNeepYIq/yd1fOtHFD8hZ5b2GFYpqsLYw4kQwD8pU
 qJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uGd3PWn15unPlgu6tfq4tRHvl+FprYH3U8GFKP8liTw=;
 b=BXN5xsaXQ+OyW2+hyxlSSCCkdv/RC1x4h8CSqSMO2w5XgQkPDKFG8/wRvj4IzV4uV0
 KnxWN++ESF87Y1YAaRBx9JVtdhbl6MHvqPm8Sry6ec20CSC0F5C8xg53NIDkq0BDAXPj
 j8R0c5nuCtcfJnvhStFPMUt7CNn4sZqQT+50uIYnoGHgZdzJDkEqhxfwJp4KxV0VlKdA
 8Qxf8gczpVs7u1V5pacXNdK7MHO9GVrGdglWFw+HiNpXW6XeAJ3/Zi5tFlq4masDnV8L
 aC8kDntSaph7sBCLHaWOKHYpXCn/acfkHETd+NQkoh1btKZIVpyE3jqIxDhTdZ6WO1xZ
 WH2g==
X-Gm-Message-State: AOAM5305XlpH7H7CTiibbl4Lju96iiFGFhOaPnbS0V/JwjG6OhpUgICE
 Z2GHBcKyIVL2Pkrev5GqdFxe6TQiI6AXVBGfhYKrjQ==
X-Google-Smtp-Source: ABdhPJyWfSh8zbaHqlyvAcAHY25IB/ZvmVumzw480q8g+aLpCT9OU3Syk5Cj9WmF+C3UaSQwUm6FCMB0qjr7Vf0cItI=
X-Received: by 2002:a2e:b4cd:: with SMTP id r13mr129942ljm.273.1611356192476; 
 Fri, 22 Jan 2021 14:56:32 -0800 (PST)
MIME-Version: 1.0
References: <935820c1-0c96-6c85-26e7-ce0b741737dc@blennerhassett.gen.nz>
 <20210120190759.GH6794@sirena.org.uk>
 <84e36db4-b78d-de1b-3575-62b19035ea43@blennerhassett.gen.nz>
 <ce650f47-4ff6-e486-7846-cc3d033f3601@blennerhassett.gen.nz>
In-Reply-To: <ce650f47-4ff6-e486-7846-cc3d033f3601@blennerhassett.gen.nz>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Jan 2021 23:56:21 +0100
Message-ID: <CACRpkdaMRSnpZo1=dHceusoFxft=nctQYG8mitpR3aMf8WnftQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: ak4458: correct reset polarity
To: Eliot Blennerhassett <eliot@blennerhassett.gen.nz>
Content-Type: text/plain; charset="UTF-8"
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, daniel.baluta@nxp.com
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

Hi Eliot,

thanks for your patch!

On Fri, Jan 22, 2021 at 9:27 AM Eliot Blennerhassett
<eliot@blennerhassett.gen.nz> wrote:

> Reset (aka power off) happens when the reset gpio is made active.
> Change function name to ak4458_reset to match devicetree property "reset-gpios"
>
> Signed-off-by: Eliot Blennerhassett <eliot@blennerhassett.gen.nz>

(...)
> -static void ak4458_power_off(struct ak4458_priv *ak4458)
> +static void ak4458_reset(struct ak4458_priv *ak4458, bool active)

I usually use the variable name "asserted" to be crystal clear as to
what this is about.

With that change:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
