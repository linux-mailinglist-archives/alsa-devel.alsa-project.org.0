Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC30C3FE08B
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 19:00:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 506871789;
	Wed,  1 Sep 2021 18:59:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 506871789
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630515624;
	bh=hvxpfj8K8oct4hHwvU35wB0MGQTZZG6Lx6u8g6TYyo8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KzC6MkbyhP7+djXl2gyb6Cr2EjOoDqzJR5b1RKw8QLWMmkVZf1traGO/JT9Y6gzm8
	 NEYg13bFXfcTiMd+IFdBqnZBpEIDgYRdMsVucbPpnjUSLnQYc14yFpdWDBVO26akiH
	 1wl7/9P5SlRa/uWbokP27IbjYFoqNSoXG1hW83hM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A330BF80256;
	Wed,  1 Sep 2021 18:59:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA607F80254; Wed,  1 Sep 2021 18:59:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79FE3F8020D
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 18:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79FE3F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lRvPzTZ8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C223961058
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 16:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630515533;
 bh=hvxpfj8K8oct4hHwvU35wB0MGQTZZG6Lx6u8g6TYyo8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lRvPzTZ8rfA8UXrvVH3KTTo8Coj5LAm9WZfT4fkAmF+m5/Wa341gheXCwuUxg1iQg
 YHGZTr77EG9jPHqSU3NKYAV7q5PfZjf3kcA2C3Rdztq9yAVK6q8YQX6Vt9Jf5vc16/
 eQI6ljjizik4nULsXp7uGppOgh0Nf3AJxHfIpDQ5JWRTlSr5egSfrPmtTRhjd5e6tI
 BvbVZldCtdnSiyp8teXIg2m84//KcjuDCFrhdGetIwmn57YrDZaLwRTWpAnFu6bX//
 bAvOuARCDc0nrswNoINhLOhFxOtfybdKXAUq6brN+slIx4D1/VZXZ8Fu8tLDr6a/VS
 sQSJBrxbzQl3w==
Received: by mail-ed1-f41.google.com with SMTP id z19so4757372edi.9
 for <alsa-devel@alsa-project.org>; Wed, 01 Sep 2021 09:58:53 -0700 (PDT)
X-Gm-Message-State: AOAM5310UgiiJ9bnQKicWzNRq0jhg7S30TeMbaDUANal84cxYhYunTtp
 YOt7sUqa/dn+1Fsybr7PDadgCjF/UsLegZuyEA==
X-Google-Smtp-Source: ABdhPJw+f2KQ5R6JUA/hgi2itUMiAS3Pn+3IPU4x3548Cx5FAXWQRC4/KD7oKtjgu2MJ56cCQ3kADyiGbui9s2wZbEQ=
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr601401edt.194.1630515532404; 
 Wed, 01 Sep 2021 09:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <1630513111-18776-1-git-send-email-spujar@nvidia.com>
 <1630513111-18776-3-git-send-email-spujar@nvidia.com>
In-Reply-To: <1630513111-18776-3-git-send-email-spujar@nvidia.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 1 Sep 2021 11:58:40 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJgqyGGF=SwEox6LkR_P8AR+c30AWNejA6UiCCh+U55Pg@mail.gmail.com>
Message-ID: <CAL_JsqJgqyGGF=SwEox6LkR_P8AR+c30AWNejA6UiCCh+U55Pg@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: Use schema reference for sound-name-prefix
To: Sameer Pujar <spujar@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jon Hunter <jonathanh@nvidia.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra <linux-tegra@vger.kernel.org>, Bard Liao <bardliao@realtek.com>,
 aleandre.belloni@bootlin.com, Jerome Brunet <jbrunet@baylibre.com>
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

On Wed, Sep 1, 2021 at 11:19 AM Sameer Pujar <spujar@nvidia.com> wrote:
>
> Use schema reference for 'sound-name-prefix' property wherever
> necessary.
>
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: bardliao@realtek.com
> Cc: Alexandre Belloni <aleandre.belloni@bootlin.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> ---
>  Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml | 7 +------
>  Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml | 7 +------
>  Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml  | 7 +------
>  Documentation/devicetree/bindings/sound/nxp,tfa989x.yaml          | 5 +----
>  Documentation/devicetree/bindings/sound/rt5659.txt                | 2 +-
>  Documentation/devicetree/bindings/sound/simple-audio-mux.yaml     | 5 +----
>  6 files changed, 6 insertions(+), 27 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> index 5f6b37c..ae04a11 100644
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> @@ -48,12 +48,7 @@ properties:
>
>    sound-name-prefix:
>      pattern: "^DSPK[1-9]$"
> -    $ref: /schemas/types.yaml#/definitions/string
> -    description:
> -      Used as prefix for sink/source names of the component. Must be a
> -      unique string among multiple instances of the same component.
> -      The name can be "DSPK1" or "DSPKx", where x depends on the maximum
> -      available instances on a Tegra SoC.
> +    $ref: "name-prefix.yaml#/properties/sound-name-prefix"

This is generally not how we reference common properties.

Either you add a $ref to the whole schema document at the top level of
this one or add a 'select: true' in name-prefix.yaml.

Rob
