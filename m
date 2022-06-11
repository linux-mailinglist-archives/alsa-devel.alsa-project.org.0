Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7284E547252
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jun 2022 08:17:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5B3E1AC6;
	Sat, 11 Jun 2022 08:16:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5B3E1AC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654928222;
	bh=SQgcLmlMIsTNQEyPzC+TDbwB04w9UbPFBZGm5xhoZlg=;
	h=In-Reply-To:References:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YISBMEZwJIRTOBaxazXBH8hOAchw1DXTquMqSPSrOw2wxNWGQL6i2whD/v8v1/Mg4
	 9h88aUAn3P2rjhPK2HLr8du2cHGaFSVfWsU/vFaMGEAxCY4A6bD4VURoGENUA3zGmK
	 nh/PIgLcYBMDi/fD+PcN8Z1v+qhM48XUc9U9QvvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EC84F80271;
	Sat, 11 Jun 2022 08:16:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 931ECF8025A; Sat, 11 Jun 2022 08:16:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E334F800EC
 for <alsa-devel@alsa-project.org>; Sat, 11 Jun 2022 08:15:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E334F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="AnUXfulX"
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-fe4ac3b87fso1874896fac.3
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 23:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=VTKjR9J4dzoae+YBRke5SnGRPApYN87UxusBPdbF2KE=;
 b=AnUXfulXmU8MEv3PEde7hHyZIHBZMs7O2D5TI9BR3ZytKSqULoVY2tB2B/G/cSaRuh
 d25qEB69gWtDjyWLoPWKupuqsX9GEuT26cLSqiZS+nATU15Yy6mfK3bzUK5DkFoDlKTV
 GWWsHUpvRkIK6WxmiZiTF07JFDFKQxcmxOqlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=VTKjR9J4dzoae+YBRke5SnGRPApYN87UxusBPdbF2KE=;
 b=Igz0eZM+/PYsS8FHW2cQsG1pTlW+7gNvpcBkrOjD6NnObLO7B7U+SB4Uwk5YMSmVv7
 Oql6LBn+vTwdazYA4Jhzizo/vWP4RHhnkkkX3Q5w2tg/yy0Z6vqm2uavm2Lhp+uvdk8s
 1iqCwJE5PhE6AiDDIB97tlA/knN1vkIf/xSc+q6o1ezaYYUgI8r6GeJ8IeaKS3RMmQxc
 vyg57V3d7vB2BfapMNgDSyF++ulfX4yiRg4urRdAMhyNtGUbdtNSESfeszyMe30SOhHo
 PSiTdEU/0fPLNm8dt99yPTa5Up8HVu1KBJkqSBxyK8PCT3XqCIbGcx1ZFm7ypi9iYeet
 X2mQ==
X-Gm-Message-State: AOAM531Tr2lubhRvIUDdjVFwmpaVIbXz135o4Ky3BDf/Bf2yUxoCRTr9
 EGud0M6g2L+ZA2tLYxlupdXEVkbDK43rd/yrCLzwxw==
X-Google-Smtp-Source: ABdhPJzbNfqQrErnPRd5zH8RtCVRU6bbLe/df5ml8E2KvzxEVk7l2sxNN9+pKPB5imCFCS9iZUpgVfe3ss32nRzIhGo=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr1882765oap.63.1654928151857; Fri, 10 Jun
 2022 23:15:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 10 Jun 2022 23:15:51 -0700
MIME-Version: 1.0
In-Reply-To: <1654921357-16400-2-git-send-email-quic_srivasam@quicinc.com>
References: <1654921357-16400-1-git-send-email-quic_srivasam@quicinc.com>
 <1654921357-16400-2-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 10 Jun 2022 23:15:51 -0700
Message-ID: <CAE-0n50k1TeE_JaZ7jT7n3QzHsF9f+pE57mRC9PeBgsNPtOtbw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: qcom: sc7280: Add boolean
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

Quoting Srinivasa Rao Mandadapu (2022-06-10 21:22:36)
> Add boolean param qcom,adsp-bypass-mode to support adsp bypassed sc7280
> platforms. Which is required to make clock voting as optional for ADSP
> bypass platforms.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> index d32ee32..33d1d37 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> @@ -19,6 +19,11 @@ properties:
>    compatible:
>      const: qcom,sc7280-lpass-lpi-pinctrl
>
> +  qcom,adsp-bypass-mode:
> +    description:
> +      Tells ADSP is in bypass mode.

Doubt "Tells" is required, but OK.
