Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C896A160F41
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 10:51:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 694ED1616;
	Mon, 17 Feb 2020 10:50:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 694ED1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581933085;
	bh=KNqX6FLgJtUvypCsBAQ3XwMsZBT1PRRmihAOKsPRxi0=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QH+1Jh7bNwDpk/sFaTgCNWZDyaTd6pteR05MghG3AS2HCCQfb+1VPzdytWCwKdVZL
	 pBcudVk5U0lFX/61j0HCbG5EJ1sSIbKDlksyvAOMJHH0a4cxqgtpCnHHFkJlDFsKpv
	 APx+VSluWm4YlkL3YdlUW7OpXcLgnEhWBGdVle2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48818F8015E;
	Mon, 17 Feb 2020 10:49:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80F25F80172; Mon, 17 Feb 2020 10:49:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_26,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAEE0F80096
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 10:49:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAEE0F80096
Received: by mail-ed1-f65.google.com with SMTP id p3so19940552edx.7
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 01:49:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hYpNZkgMugd7lxhUSqCjHE99UAOTKhfYi8V45j1F/S4=;
 b=rijIc84NtNE7w7TEhAfRWxl/bTPfOUfOxaohF9/T2zL4c4F+Uy5ImoVT+gBOnK9Ypd
 1AhPC4iwE1hFQZjMZ1+wPoxirnmgVRjfCHZJfHVKcPYpbfIS2lOewod41gcjsRTNH61i
 u6vDPjZLdb9QB4w03139tl6bM6GY0810zKD5WTbqTTjFlGdgOtKBeagtjZq36iRjbb6i
 WCoU8f/CryZCcf9GqvAzZMPX0khZMR4uuqnXpK2mjC1PA13pfMqqTmylNO9Sk4Ut+b4P
 te7xG3SSwn3kTMyfBMaxpV/VKF7pL2/LU2ncGA8M3h4ikpfD2q3wT4R7EFUvrj5PaZWh
 91EA==
X-Gm-Message-State: APjAAAVpVrSO9a7h1ZpS6KaHsyDZZxb2rJCY5GvJ7Kd7Znr5vmlJZuIt
 pH04rUate8ZLthbV0tqf0d4Og/Gh/kM=
X-Google-Smtp-Source: APXvYqxJMyUFRzXLTKPX7eWfNn1nwMNLqedinXdYl8jXccApgXXJ4nkxJbSN5wV0hx0U9CHcaEsC3A==
X-Received: by 2002:a17:906:3449:: with SMTP id
 d9mr14717511ejb.163.1581932969228; 
 Mon, 17 Feb 2020 01:49:29 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com.
 [209.85.128.51])
 by smtp.gmail.com with ESMTPSA id oe20sm824240ejb.2.2020.02.17.01.49.28
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 01:49:28 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id a5so16420779wmb.0
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 01:49:28 -0800 (PST)
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr22802965wmg.16.1581932968319; 
 Mon, 17 Feb 2020 01:49:28 -0800 (PST)
MIME-Version: 1.0
References: <20200217064250.15516-1-samuel@sholland.org>
 <20200217064250.15516-2-samuel@sholland.org>
In-Reply-To: <20200217064250.15516-2-samuel@sholland.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 17 Feb 2020 17:49:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v670SH1Ra26eKgOhLYAeRTV719a3TDAfCyMr49bKU8Z=PA@mail.gmail.com>
Message-ID: <CAGb2v670SH1Ra26eKgOhLYAeRTV719a3TDAfCyMr49bKU8Z=PA@mail.gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@free-electrons.com>,
 stable@kernel.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [RFC PATCH 01/34] ASoC: dt-bindings: Add a
 separate compatible for the A64 codec
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

On Mon, Feb 17, 2020 at 2:42 PM Samuel Holland <samuel@sholland.org> wrote:
>
> The digital codec in the A64 is largely compatible with the one in the
> A33, with two changes:
>  - It is missing some muxing options for AIF1/2/3 (not currently
>    supported by the driver)

Is this at the pinctrl level or mixer level? If it's at the pinctrl level
then it's out of the scope of this driver/binding. It could very well have
those signals, just that they aren't routed outside the SoC.


ChenYu

>  - It does not have the LRCK inversion issue that A33 has
>
> To fix the Left/Right channel inversion on the A64 caused by the A33
> LRCK fix, we need to introduce a new compatible for the codec in the
> A64.
>
> Cc: stable@kernel.org
> Fixes: ec4a95409d5c ("arm64: dts: allwinner: a64: add nodes necessary for analog sound support")
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml  | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
> index 55d28268d2f4..7c66409f13ea 100644
> --- a/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/allwinner,sun8i-a33-codec.yaml
> @@ -15,7 +15,9 @@ properties:
>      const: 0
>
>    compatible:
> -    const: allwinner,sun8i-a33-codec
> +    enum:
> +      - allwinner,sun8i-a33-codec
> +      - allwinner,sun50i-a64-codec
>
>    reg:
>      maxItems: 1
> --
> 2.24.1
>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
