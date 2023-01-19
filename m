Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1A56738A7
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Jan 2023 13:34:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9FF0377C;
	Thu, 19 Jan 2023 13:33:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9FF0377C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674131677;
	bh=5x0SvKJqvjuZbR/iEndWuXxT6RFHpx58XowNytiWCDA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eC7j9nRp/gheyxblX9GVe27YOWbqWOcXTPX5XLYnAy2wDuf1I+WdIeid529LvlsTm
	 k10yWuncQib4Y2orCvtPFixCtnDwqEm+6vBbDRgDsTIHhXFbeT208dzAeL55qFIiqh
	 wH46bQJzK3HViHbm/IGWj3ym4YalEtFuLtJUvooY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 102DDF80083;
	Thu, 19 Jan 2023 13:33:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DDC4F8047B; Thu, 19 Jan 2023 13:33:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9CC1F8024D
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 13:33:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9CC1F8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uVzH5ljA
Received: by mail-wr1-x432.google.com with SMTP id r2so1706523wrv.7
 for <alsa-devel@alsa-project.org>; Thu, 19 Jan 2023 04:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n8rfEMuDyZxUr/lsXYzAmRQq2T1KGzsa28lJ/dp8Na0=;
 b=uVzH5ljAauUiCFlvukItmwkf22rMDfOGSirz90QzPyVNy9A1Nzas9Lyh/1l3ZKigGm
 GNjswLxOXkN+FBh33Od9dmamLU2yf5gapgJrgg7P1DQezLfU9ccHz/scMB/zgSE/tegV
 6rjLDrbdb7HUVuWw9l0uOuJionnr7wMgKfN4XGOIC4DFLp+eLEBeUXB0POsZZMWakV08
 eCzrf8Vqtci0edsFH9/Vi13Xb/vSVSBJtGY4C0n3OUYwq0xZQDG6XctrNKEcJd+r3SAT
 adWb1ZLX8Fbq6ftdt2xQ94VojSKVYw40WY/GYz1l9OuALzdFR0IKc+PdSf++RVQ7pOJ6
 GCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n8rfEMuDyZxUr/lsXYzAmRQq2T1KGzsa28lJ/dp8Na0=;
 b=dykFiGnOKklwzp8Gby9oaxcn68CBaAq5xfzN5eV/otNfRX7N5M5/Lr+dI7/NmTho+Y
 CUwYXqV7VFDD8B5wdX3T7fViDbEehW5IsAJXQ5vSeeOclig4py+BIYNc8dqllWA0qzyl
 Sg0681xh0WvOxrMn8kuqP0BHknjhmMy+bEnlUot9zGYdd+vomGhwwBqvDiV/2wDE1oU1
 DSRnlu0Xc1UAqAcbDieR2n9HzYT13ou1C5uQN9vpYZ30j4WApgkObRJFs4JanT2JBd2R
 qxJeHNEmrdyD5JhfMtLeRoSEDofC2kMNWOaCi8x6LmCzeLrUWfKf++klEMdZtv8xHT6B
 2emg==
X-Gm-Message-State: AFqh2kpC5GU5Td+S8Kd1qsI0pB77p9znizetUxk2lzSGrhwp1Ge6JtjO
 f6z4fDegeHSPxaMDttO44OJEDA==
X-Google-Smtp-Source: AMrXdXvzVVbesAd0ZmGM9ysqilbbXkk1wRoX+XB1+gxFbmc3m9tTTSqEwRqVqqLxwV35oAz7m3k7/w==
X-Received: by 2002:a05:6000:1b85:b0:2be:f21:6af6 with SMTP id
 r5-20020a0560001b8500b002be0f216af6mr9229691wru.23.1674131612583; 
 Thu, 19 Jan 2023 04:33:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b00241fde8fe04sm33247124wrr.7.2023.01.19.04.33.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 04:33:32 -0800 (PST)
Message-ID: <af7824c3-ebdf-5913-1fa8-1c167911d06a@linaro.org>
Date: Thu, 19 Jan 2023 13:33:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 7/7] dt-bindings: remoteproc: qcom: sc7280-adsp-pil:
 Add missing properties
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, vkoul@kernel.org,
 agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com,
 srinivas.kandagatla@linaro.org, dianders@chromium.org, swboyd@chromium.org,
 judyhsiao@chromium.org, alsa-devel@alsa-project.org,
 quic_rjendra@quicinc.com, konrad.dybcio@somainline.org, mka@chromium.org
References: <1674131227-26456-1-git-send-email-quic_srivasam@quicinc.com>
 <1674131227-26456-8-git-send-email-quic_srivasam@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1674131227-26456-8-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

On 19/01/2023 13:27, Srinivasa Rao Mandadapu wrote:
> Add reg-names and power-domain-names for remoteproc ADSP pheripheral
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
> 

Here and in all other patches you sent recently - no blank lines between
the tags.

> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> ---
>  .../bindings/remoteproc/qcom,sc7280-adsp-pil.yaml  | 30 +++++++++++++++++++---
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

