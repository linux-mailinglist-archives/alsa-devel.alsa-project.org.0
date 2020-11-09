Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BE52ABDF4
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Nov 2020 14:57:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37566167E;
	Mon,  9 Nov 2020 14:56:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37566167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604930228;
	bh=afFCMlVVf24hQPUhUZ5lsdkqv9aNPzmv8lddYk/wGCo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VV1IC8PPicLAhxg67dCHn3VDE6D9uBgmrsqO3GZ15sGK/fInDfJ1QS2qF/HSlawYb
	 Iz2g1zEp5PbCGXjvjtBAF2g39JwL8Qv/sP2TQv8LF6rF+QmqxlO1YaIcMXqG4EXeUk
	 lKrT3KtY0YtNWcNNxsibV1kF4hYrnMKyQ0jOhBcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABFB5F801F5;
	Mon,  9 Nov 2020 14:55:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9102CF8020C; Mon,  9 Nov 2020 14:55:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A526F80059
 for <alsa-devel@alsa-project.org>; Mon,  9 Nov 2020 14:55:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A526F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="N94TB+YL"
Received: by mail-lj1-x242.google.com with SMTP id l10so10410166lji.4
 for <alsa-devel@alsa-project.org>; Mon, 09 Nov 2020 05:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lqe5HrIHoZLKJYdgktbLvnJ7WzCQkZi69agPba5hbSs=;
 b=N94TB+YLkY2zbd2qs/JZiN2GasG9bvVVY4+qr0qm28m37JUwCxHLgcQhFLqdiwG6wP
 36p80N800qtZO5Y5/54aZ3Ds3GAdrT9imWS8aZb8ep4LsnRqxn28rWQ0L4kka52r8KUG
 Y2WqlS12ZqNcQ/DS/XYF4A0rpu58FzeiaQhUG5lkWFp1nZDw4XW7skWOaX2w4Q67UGUV
 s40AMt4lrMVcsuOScsZYctM2DZ32eM3D7zQHgRHReNxiC06jnVgWx6g3kZ4JP9zfkx+S
 5/PrEpERodbnK0pJW7+SRxRRp4I/b2YxzIp3RZBBGl+I+yAbWCR+Um/ECXQr4LTJ/X/9
 eI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lqe5HrIHoZLKJYdgktbLvnJ7WzCQkZi69agPba5hbSs=;
 b=eDS8NC+bKcW5ULir3ij9b5k04hH8hTHd01poRdrTXf8Jq36xUspyEP+wWvttRtYWA1
 1sreeNXLlMV+/dKVfM8e+1I5Eo4obDwkJZTfv08y3k7EpJ37x48tQprHU5B90ZA4yvhZ
 hKDZ4WzdWX7T8cxJwAML9+DHGPSaP9Q4VETfin9pygFuIg/xtbieSd24ByJXBqD4N+O6
 EkTKybDyAH4UVpIqKjVuA3jFm036Nt79oVuTjnrZ66RVVMdeUvunxdgevhqL0rqhaCtP
 wF7/hE0byhJfcaSLE/+Zjsd+ZnkKkaC1pagxtVXaDQ2IoivW+s8q7RW4zECZZWwH2Cdf
 mpDA==
X-Gm-Message-State: AOAM531jUTc4swJ7PM5tCGtNAmRbG0OVnn8qS0FvPhjMAy6Ja4v1LkE4
 c2OIOHKkhQFPQygjIqgiJIkHyy8FTo92Ya7jxy6aPg==
X-Google-Smtp-Source: ABdhPJz3iQtflkEPiWk1FMPU1/Pd2p7uJeOvrzUebarKW+NuNnCZ6Uh/UONYKo/x7LVUoyml/JF+BdvydSLnid3qOuA=
X-Received: by 2002:a2e:b54a:: with SMTP id a10mr5875868ljn.139.1604930125511; 
 Mon, 09 Nov 2020 05:55:25 -0800 (PST)
MIME-Version: 1.0
References: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
 <20201106061433.1483129-2-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20201106061433.1483129-2-ajye_huang@compal.corp-partner.google.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Mon, 9 Nov 2020 21:55:14 +0800
Message-ID: <CALprXBZmC=Qxk5fkGn=QJ4xW4tSGMZxb9LFUbqfMge0vLcP-dQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] ASoC: google: dt-bindings: modify machine bindings
 for two MICs case
To: Ajye Huang <ajye.huang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>,
 ALSA development <alsa-devel@alsa-project.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Patrick Lai <plai@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Andy Gross <agross@kernel.org>,
 Tzung-Bi Shih <tzungbi@chromium.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Cheng-yi Chiang <cychiang@chromium.org>
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

Hi, Rob

I follow your suggests that adding (maxItems: 1) for dmic-gpis property,
and keep one example of adding dmic-gpios property in it

Could you please kindly review it ?

Thank you so much
Ajye

On Fri, Nov 6, 2020 at 2:14 PM Ajye Huang <ajye.huang@gmail.com> wrote:
>
> Add a property "dmic-gpios" for switching between two MICs.
>
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  .../devicetree/bindings/sound/google,sc7180-trogdor.yaml  | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> index efc34689d6b5..ce050a9dec94 100644
> --- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> +++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> @@ -34,6 +34,10 @@ properties:
>    "#size-cells":
>      const: 0
>
> +  dmic-gpios:
> +    maxItems: 1
> +    description: GPIO for switching between DMICs
> +
>  patternProperties:
>    "^dai-link(@[0-9])?$":
>      description:
> @@ -83,7 +87,7 @@ examples:
>    - |
>      sound {
>          compatible = "google,sc7180-trogdor";
> -        model = "sc7180-rt5682-max98357a-1mic";
> +        model = "sc7180-rt5682-max98357a-2mic";
>
>          audio-routing =
>                      "Headphone Jack", "HPOL",
> @@ -92,6 +96,8 @@ examples:
>          #address-cells = <1>;
>          #size-cells = <0>;
>
> +        dmic-gpios = <&tlmm 86 0>;
> +
>          dai-link@0 {
>              link-name = "MultiMedia0";
>              reg = <0>;
> --
> 2.25.1
>
