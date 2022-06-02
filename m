Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C2253B0E7
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 03:14:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3BDD1742;
	Thu,  2 Jun 2022 03:13:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3BDD1742
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654132488;
	bh=x6I/YcnTZrzE2wRONymaNEL4lnGh1OjK0huds9FMF1A=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R57RqrMfT0l78lckxshEnDfozbpQfPFRFhXSt21oaOC1tMDtpcJvu4C0c0KmYRcui
	 4IfgT4I1Q01mqe0IRecFJGR0DvxKBkWKOXeIvvC1yUh7qx1KTQ6szSPOYTr2Bj/isx
	 LkWyKGzQrq+JgrpSKFDQMzT2DoOKoh5IfKUqdaAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E13CF800BD;
	Thu,  2 Jun 2022 03:13:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AF2AF800BD; Thu,  2 Jun 2022 03:13:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7CCFF800BD
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 03:13:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7CCFF800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="hz8L42GZ"
Received: by mail-ot1-x335.google.com with SMTP id
 e11-20020a9d6e0b000000b0060afcbafa80so2453009otr.3
 for <alsa-devel@alsa-project.org>; Wed, 01 Jun 2022 18:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Rm+nlWHmtK3hCgXCMXiJ7jm13/nhGeNK572RFA6RE68=;
 b=hz8L42GZ3MjrJT8zQvbU0Gjdz6YpJMtgCtl4dpGSC964xc2evT/CnKhIY1JHh4LWjp
 +LM+FyszkciMtKhP7Zam1U3H6f3j/LPYW7SODR25bKL72QneSpkZ1S1ScDH1mE8dYPw8
 w3fwww6eOnrGvo4dZ5RvKgo8dO+U0i5wU5/Ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Rm+nlWHmtK3hCgXCMXiJ7jm13/nhGeNK572RFA6RE68=;
 b=2yPyceuURcipIqcYANlmsdBn+rfRplV7yzJi7+VZ/CprCZUmdrEiCPB4Q9FbWHUGD0
 3mdaq8NuhSeejgmUGAjdFvzvBAZ9aibD3Vu8dns+cl7nDSWQA6LO08h6A0o294HOmF7+
 UDROlEi9F+CLOvsHSd4P4ZxLOojacgYPjnMP/USvgon04bJyL4vuv4WBjCRa8YLHk2Md
 Jk96yu0Im90Gcz6nKAdVhj59ySB8ItyzY0S8IXORTYauv1W3/ztGsR3I9eq66XfqqSDq
 tpQdFFiLdcu5wdh+AFFiapaL8mlRp2NTOGkBhaQ7tuOu7a2kNmZ4TZvx9oRWOFVhzbIi
 aBYg==
X-Gm-Message-State: AOAM531sM+AfbqE/0LG9pY8X1ehabWn8pdua9sIDEvJFsoNjGXK2c7kE
 YR7DWOxt+9xtLof8Uao7+4MXDKz9mXtDcwtULOUrfQ==
X-Google-Smtp-Source: ABdhPJy3LJfihXvgizpO9YOYl97KB0keIbmS8UgdFCl7rKBWuosnrAafB55EO8lfmUfiw5usvkSZMT4lK7UtFaOPPIg=
X-Received: by 2002:a9d:63cd:0:b0:606:9e7f:79f8 with SMTP id
 e13-20020a9d63cd000000b006069e7f79f8mr1153603otl.77.1654132421005; Wed, 01
 Jun 2022 18:13:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 1 Jun 2022 18:13:40 -0700
MIME-Version: 1.0
In-Reply-To: <1654079415-26217-2-git-send-email-quic_srivasam@quicinc.com>
References: <1654079415-26217-1-git-send-email-quic_srivasam@quicinc.com>
 <1654079415-26217-2-git-send-email-quic_srivasam@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 1 Jun 2022 18:13:40 -0700
Message-ID: <CAE-0n50nfwZPdSS7Vw9FiV+Shfn9-bX44hfLq5ey9DBsAy0y4g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: sc7280: Add compatible
 string for adsp based platforms
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
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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

Quoting Srinivasa Rao Mandadapu (2022-06-01 03:30:14)
> Add compatible string to support adsp enabled sc7280 platforms.
>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml    | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> index d32ee32..53c2c59 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml
> @@ -17,7 +17,9 @@ description: |
>
>  properties:
>    compatible:
> -    const: qcom,sc7280-lpass-lpi-pinctrl
> +    enum:
> +      - qcom,sc7280-lpass-lpi-pinctrl
> +      - qcom,sc7280-lpass-adsp-lpi-pinctrl

Can you confirm that this is the same hardware (i.e. same reg property)
but just a different compatible string used to convey that the device is
using "adsp" mode or not? If so, this looks to be a common pattern for
the audio hardware here, where we have two "views" of the hardware, one
for adsp mode and one for not adsp mode. I guess the not adsp mode is
called "adsp bypass"?

Is that right? Why are we conveying this information via the compatible
string?
