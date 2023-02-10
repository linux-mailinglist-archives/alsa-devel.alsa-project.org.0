Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43117691E23
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 12:24:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36A6B846;
	Fri, 10 Feb 2023 12:23:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36A6B846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676028262;
	bh=l6fSPS/d0q9u2BMvcD/tL8ewWPXyVXaho3M5CVp/u8E=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ROeKxXfXtS0gHhcSybLlDlxLd1XllbW3oK96TQGLaHHfQG/+H6FtUQshEm1U7nGfi
	 2OQMweM2szBwFpdoUQZRr5zBiZK8OblbqS/U0pGFd5Mm9Q/deMuFQsetylbgQvot2T
	 /IeQWBhgIQ9pTm/Y6JuLlH8Te17zV6leq+QItmIM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 973B8F800B8;
	Fri, 10 Feb 2023 12:23:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92844F800E4; Fri, 10 Feb 2023 12:23:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DC74F80094
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 12:23:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DC74F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NRHJCgKQ
Received: by mail-wm1-x333.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so3806026wmb.5
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Feb 2023 03:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xI9gYztVh8CUauySkPThsaIJ2I1/Wnh8PrWXbxjNzZ0=;
        b=NRHJCgKQ2tlzZWl8sU4Ssukk4rUijhHHujOK7KFzcVRGnkKk/4V/UhLudq5HHKstUS
         219eo6DzkvmGzmoQuv4mjeip6BcEcBe8Y97VSeJ+/OHpofacv4dXl6scozKw3Xag6IXG
         sKF4y1hbrbQlG2V+P9uVn0Q2DWddNC94dwi70kmO6LGp87Fvysh/RWzZQMFe1TD+203C
         0jHwbB4fgeMueG/VLFiur5ERomy/zCIUoHQbjcMVfcBD4ljzcO5yXE8MMl7Eo7NyuPRQ
         jFUwF2GlprRII38nIlnalovb4+dKRzBQaOOoh8mbbipqcpkghTb87HG+jPq6E16dZQWQ
         EXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xI9gYztVh8CUauySkPThsaIJ2I1/Wnh8PrWXbxjNzZ0=;
        b=HAGsIb6qJITAmK8JxZjSJJKvQ64xJw2mNGeVVCPRl4bBG6t/jZZc9XHHwppgsci+PH
         OVjGY42CZ2I8C1FoQiHbrkevdyrtsKntTJVUrPk9xaQXQwlVDeowQU9t/95LvT+fQzqZ
         4w2FgLFwv58mimP0xwSTcvC20nyHRe4d5Ns2nvaHJQczY13f2o6yJn8bNCXQOaKVzhC3
         UJtjhcXN9NDNWmS/Mcn65R/tzQuctPDGYIhBd4bhCMl4mdBAd19J7eLJ4zfDlU5aViTb
         8EXZ2Yi9naRnwEwcYL9Co3q1xdUkxEG+wG8WEU4cqm9o7E0Zl7y07sJxUS8MulYCGCKh
         qz6Q==
X-Gm-Message-State: AO0yUKX9gaoQe9phMpK67bxyXbV5jVf8SM8fV2oV0nSoPUhC/U3I/Zk7
	xal0krxC5JhTDUizkUnuZCE1Ow==
X-Google-Smtp-Source: 
 AK7set+legodxv6KBlkbkD44DJSD+6EChFSzBsO0IZtYTmpH0QN9n6LRbkTpKJ8iSAhd7hSblH2b8A==
X-Received: by 2002:a05:600c:4393:b0:3de:1d31:1043 with SMTP id
 e19-20020a05600c439300b003de1d311043mr12023706wmn.21.1676028198740;
        Fri, 10 Feb 2023 03:23:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 o5-20020a1c7505000000b003dc48a2f997sm7816142wmc.17.2023.02.10.03.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:23:18 -0800 (PST)
Message-ID: <f8727f1c-c0e3-f14a-8d4d-8d0f294e480a@linaro.org>
Date: Fri, 10 Feb 2023 12:23:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 8/8] dt-bindings: remoteproc: qcom: sc7280-adsp-pil:
 Add missing properties
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, konrad.dybcio@somainline.org, mka@chromium.org,
 quic_mohs@quicinc.com
References: <1675700201-12890-1-git-send-email-quic_srivasam@quicinc.com>
 <1675700201-12890-9-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1675700201-12890-9-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5HUMVD4EOUQR4D2YTH6LMG3BUGKPPDAJ
X-Message-ID-Hash: 5HUMVD4EOUQR4D2YTH6LMG3BUGKPPDAJ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5HUMVD4EOUQR4D2YTH6LMG3BUGKPPDAJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 06/02/2023 17:16, Srinivasa Rao Mandadapu wrote:
> Add reg-names and power-domain-names for remoteproc ADSP pheripheral

typo: peripheral

> loader. Add firmware-name property to distinguish and load different
> firmware binaries of various vendors.
> Change qcom,halt-regs property phandle to tcsr_1 from tcsr_mutex.
> Also add required-opps property and change power domain from LCX to CX,
> which is actual PD to be controlled, for setting appropriate
> performance state.
> This is to make compatible with remoteproc ADSP PIL driver and
> latest device tree changes.
> 
> Fixes: 8490a99586ab ("dt-bindings: remoteproc: qcom: Add SC7280 ADSP support")
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/remoteproc/qcom,sc7280-adsp-pil.yaml  | 30 +++++++++++++++++++---
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml
> index 94ca7a0..7addc7d 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-adsp-pil.yaml
> @@ -23,6 +23,11 @@ properties:
>        - description: qdsp6ss register
>        - description: efuse q6ss register
>  
> +  reg-names:
> +    items:
> +      - const: qdsp6ss_base
> +      - const: lpass_efuse

So your commit adding the bindings:
https://lore.kernel.org/all/1664368073-13659-2-git-send-email-quic_srivasam@quicinc.com/

was already incomplete because the same patchset added undocumented
properties.

I have no clue what is happening with AudioReach sound/ADSP code - it's
like random set of changes here and there, without coordination. Drivers
come without bindings, DTS comes before bindings...

Is your DTS in this patches matching this binding? If so, usage cannot
be before the binding is introduced.

Best regards,
Krzysztof

