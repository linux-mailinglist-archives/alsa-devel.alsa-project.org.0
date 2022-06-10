Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82397546E00
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 22:05:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EE471925;
	Fri, 10 Jun 2022 22:04:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EE471925
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654891547;
	bh=KFz+xiIKNZsoyskzrLLrg36klPP7X8JWEdmEwMz+UH8=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oQs8NVIqEB60QpGwkdNgRO0dxMUz9mS2Fx0dL6+Pdm+qaNdg3rsknM0cfYlfNiLw1
	 E7PJy+D4II6naf82Ju4M6RY8UXOilGQn+z8fBswccLZkSUUIHNGI6zBlQ8jvDttv2n
	 sOKjK4sFBCP41jkekx/ADZXhKLfSFiL7u0Rsb/mw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EDC6F804D8;
	Fri, 10 Jun 2022 22:04:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CFF8F804D2; Fri, 10 Jun 2022 22:04:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E839F800E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 22:04:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E839F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="L2f6GdlZ"
Received: by mail-oi1-x22f.google.com with SMTP id r206so489551oib.8
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 13:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=W6khq/CJ/jK9xDdyCa3D6opio63P/2KRxReDZd/cxiU=;
 b=L2f6GdlZB9hiNU8S/GkGCil7hfYiQF4xIu0hJbUyR36m4jSLP7Jz9XQMVdA+Bq0rgD
 JtKfbtpayzVcDX3CtE2Gzr5jVUkCmBFzZJG5rH0xB8/hbZbsAli8Zm9flefmXwV4kxc8
 9uH40PA3iZzLPO2GepIiin0N8bXwZJIvC1meE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=W6khq/CJ/jK9xDdyCa3D6opio63P/2KRxReDZd/cxiU=;
 b=ZhxvzoQYXFqlSVQ4/GxbU46fkfhybphc6mgk5JVYY9jp1UtD0MiQlL9+x0+R6Z3qqv
 WT7sazWN9Z9Q2zd+lPQyHkudccGDYSuv+odoghnGswv1sFt9z+1l9FhrY89rWPkELNE6
 W3Pw0eS034LN878PaQ0VigczjZtscK73ifAQbBwDjA5CbqbWS2WtaYQhRiH56xQVT1UY
 AjWAJ78zeC42x4tMBjwWEh5CSou/l3rMT1AQ/TYfBPPnwgSl215cpGacqWq+aD1prxJj
 3Km5FjCeOM3zo7KaR8roAG9zQ+nF+eTjls5TsvZedTPSLD2NBvP8Mbuq5DSu2kreLPYp
 Pf1g==
X-Gm-Message-State: AOAM530nFKvT6olC9oiTGYwtNqvDpoXrQWihctTJyAr2Z+ig2+sc6M7O
 olWr24FNXPvzYNorCDZTUCl4hjlXDD93RPx4QLkEdg==
X-Google-Smtp-Source: ABdhPJwSTDK+pBxm//5P5qx/CDLFe4k+ZU2smS4RLMyknqIy9EX3kH8/LMzqdWgLhly1FkW9ePNj8azaOd9duk3Y/ZE=
X-Received: by 2002:a05:6808:e87:b0:32e:4789:d2c with SMTP id
 k7-20020a0568080e8700b0032e47890d2cmr743744oil.193.1654891470062; Fri, 10 Jun
 2022 13:04:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Jun 2022 13:04:29 -0700
MIME-Version: 1.0
In-Reply-To: <1654872335-4993-2-git-send-email-quic_srivasam@quicinc.com>
References: <1654872335-4993-1-git-send-email-quic_srivasam@quicinc.com>
 <1654872335-4993-2-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 10 Jun 2022 13:04:29 -0700
Message-ID: <CAE-0n53NdTwAO4DY0x7Fy9h4eRVR-3iKnGfqfZ-ggyghfsC9UA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: pinctrl: qcom: sc7280: Add boolean
 param for ADSP bypass platforms
To: Linus Walleij <linus.walleij@linaro.org>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 alsa-devel@alsa-project.org, 
 bgoswami@quicinc.com, bjorn.andersson@linaro.org, broonie@kernel.org, 
 devicetree@vger.kernel.org, judyhsiao@chromium.org, lgirdwood@gmail.com, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, perex@perex.cz, quic_plai@quicinc.com, 
 quic_rohkumar@quicinc.com, robh+dt@kernel.org, srinivas.kandagatla@linaro.org, 
 tiwai@suse.com
Content-Type: text/plain; charset="UTF-8"
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

Quoting Srinivasa Rao Mandadapu (2022-06-10 07:45:34)
> Add boolean param qcom,adsp-bypass-mode to support adsp bypassed sc7280
> platforms. Which is required to make clock voting as optional for ADSP
> bypass platforms.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
>  .../bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml          | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> index d32ee32..ea9920c 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> @@ -17,7 +17,14 @@ description: |
>
>  properties:
>    compatible:
> -    const: qcom,sc7280-lpass-lpi-pinctrl
> +    enum:
> +      - qcom,sc7280-lpass-lpi-pinctrl

Drop this part.

> +
> +  qcom,adsp-bypass-mode:
> +    description:
> +      Tells pin controllers want to make clocks optional for ADSP bypass
> +      targets.

How about "ADSP is in bypass mode"?
