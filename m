Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F3C425A34
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 20:01:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5304F822;
	Thu,  7 Oct 2021 20:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5304F822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633629689;
	bh=BPMvcvQ5pgSVVs6Bd4rDhVjBhzyGrJL+JTFIv2RkiRs=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XtNzD76epNH16Qajh9usdTyNt14Yh2D4BjB02tDs8NyI01e0X13icNghDdHqe8bPa
	 BzzHeFLKzp+IjXKcC0u7eIEeNJQdkfd2Znc5M/qoLjS8EQ0sRG1B2HzOXYiUoYjYpe
	 xttMcAlFA0mfjmj6iCnwZC0bLeaKIXKi95wTQRvg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D51E5F8028B;
	Thu,  7 Oct 2021 20:00:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E61FF8027D; Thu,  7 Oct 2021 20:00:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67BF5F80130
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 20:00:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67BF5F80130
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="JvGo9D9x"
Received: by mail-ot1-x32e.google.com with SMTP id
 g62-20020a9d2dc4000000b0054752cfbc59so8583262otb.1
 for <alsa-devel@alsa-project.org>; Thu, 07 Oct 2021 10:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=R7oz/IASrAb/4S/A1hee4Ri/gQz0oKdB3ob6dMUeA4I=;
 b=JvGo9D9xRiy8w/STgotFKvcJot6b4pk0BA8Kl5UxeFRlGy7KLQTPBd9FMo2O8BkKmI
 YkjaEgVWvN6bFfcd9vjw5/fZfb3GH2zaXJVZ2GlrBILlTcAV2eJlZJpqbosYgNqQAsoR
 9LiTE2MTlB2FBiwHuPUVl9VEPQk9DV03+XJzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=R7oz/IASrAb/4S/A1hee4Ri/gQz0oKdB3ob6dMUeA4I=;
 b=xtsXs8im1P6QgsGgBr9p0sdgDSU1yee3FhVPdnJ89IlcxvxLHMozWwakmKEBa8oOgM
 UE6HrhnazTKbv6ju/52ODIdAdlympqCfDUZYvyrhnjelJE+8HBougH/JQzd3oyoKdRr4
 kgfycPt/2i91j6WAt8NRY+O/nYr2eMTPUU5FwgXwAG7et9dItimURsKjMB3xRcyIIQqg
 kT88/TvsXdwtbHzqVRLxEjvTDGyMsNScohGM3fM1HXZ9XHYYfD+G08e4vFf/RotXoXNU
 cjwLD26vNT0mkej1yJ5y7uUlOwhc93QYgp9jzRfRzS/570vnsnn85nH247piDwkCuLaN
 Woug==
X-Gm-Message-State: AOAM5329M9m9u3zTkF7Q2iwLoAPViCc++aOhJ9f0utiTLpwkKH/0ESQ/
 LcERRM4tuRmleDLTroDzTf5vr4RX4KumiflRaopHrQ==
X-Google-Smtp-Source: ABdhPJyShabx+Bv1Ts3hPeR1WVsMR/XNDLbLDJ40g/qGwpZoSFC/DiaaGOf5FZHOhggTg5HxhlGAhw7oD3ncFoWjMX0=
X-Received: by 2002:a05:6830:1c2e:: with SMTP id
 f14mr4647448ote.159.1633629593547; 
 Thu, 07 Oct 2021 10:59:53 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Oct 2021 13:59:53 -0400
MIME-Version: 1.0
In-Reply-To: <1633614519-26680-3-git-send-email-srivasam@codeaurora.org>
References: <1633614519-26680-1-git-send-email-srivasam@codeaurora.org>
 <1633614519-26680-3-git-send-email-srivasam@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 7 Oct 2021 13:59:53 -0400
Message-ID: <CAE-0n51qO1q5ZF-fAf2Gma9a2B+iSyoQnJdJ8Fnmsz+DG0rwPg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom: Add sc7280 lpass lpi
 pinctrl compatible
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@codeaurora.org, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
 plai@codeaurora.org, robh+dt@kernel.org, rohitkr@codeaurora.org, 
 srinivas.kandagatla@linaro.org, tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>
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

Quoting Srinivasa Rao Mandadapu (2021-10-07 06:48:38)
> Add device tree binding compatible name for Qualcomm SC7280 LPASS LPI pinctrl driver.
>
> Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> index e47ebf9..578b283 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-pinctrl.yaml
> @@ -16,7 +16,9 @@ description: |
>
>  properties:
>    compatible:
> -    const: qcom,sm8250-lpass-lpi-pinctrl
> +    enum:
> +      - qcom,sc7280-lpass-lpi-pinctrl
> +      - qcom,sm8250-lpass-lpi-pinctrl

I suspect we need to split the binding because the function list needs
to change. Can you make a whole new file that's probably largely a copy
of this file and/or extract the common bits into a meta schema and
include that in both the files? Then the function list can be different
and the clock property can be omitted in the sc7280 file.
