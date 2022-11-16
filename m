Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2281C62C64A
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Nov 2022 18:23:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C4D51691;
	Wed, 16 Nov 2022 18:22:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C4D51691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668619386;
	bh=3n6Vrcw8v6mwbVQwP/1994XQ+nW+xiwonXrpYoe3/Bc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ipyqaXaE+SuVtHHtWmIPzruGpi1pxQKiJWFIi5eW16kof3kfIAYCRaBg55FwWE4Pt
	 XeSYxJqmC5SFWy2A8dZfioZOf27f2yV7Rqjii4lsEEblU75cyAN16pVfrmRkTAd8wE
	 p8Mg09YFTE/S2WXMoTCodkiIcgivpAhWj6/dXiHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DB15F800B5;
	Wed, 16 Nov 2022 18:22:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DE63F80163; Wed, 16 Nov 2022 18:22:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E75C1F800B8
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 18:22:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E75C1F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="VhC2ELA7"
Received: by mail-lf1-x12a.google.com with SMTP id j16so30549829lfe.12
 for <alsa-devel@alsa-project.org>; Wed, 16 Nov 2022 09:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kOMV24mvT6Z+gChaVzQ2FKjnamE1RqSiBkM5c6Q63Ew=;
 b=VhC2ELA7YYwkUZb3bqvYlfuPX+1ULotkPGoE39eo+LnfGVW7aZ8ljsvZE+z0Vpmi7F
 b1KPQ+MrZ46lUHBr0s8t8z4SWSgod9aMHBfYI3VA5/ES2GgKDuWV4nGV4sLoPpQVY4Wc
 kJvjktAmoH2Ot9PNLco7SBm+dJbX+EcejjFR/UTsst0qCIwt6W4XtTDFp9ktv3bOO4FT
 CWhfZNm/DFDTbLH6X4+rT9UfZ39SCBOdq1SWE2VP2x6SI/Rundva8d/OFdeoKXCxTcQg
 QqLIl0ac8Y780hl/qi9f1f5mIXblSuLsUWef1q4XyKpriHxBlKPwhbwxIR25EmwdEiFc
 bWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kOMV24mvT6Z+gChaVzQ2FKjnamE1RqSiBkM5c6Q63Ew=;
 b=GR9eztATEWbfqkviT3WVenCiS9jgJtIqo0tmOegUASRgqmH7rkpfYxpF5PQqmbswLp
 ailxS10BMPLlLNaiOoFxhyj+kMtDKJSOMuPAquwVCV33qwPxSPa+kNC/0+xpoUKy4WWL
 +10tda6eIos+/8DiyI2QXU2sX3X6pp+Qo++HRunnuz/3ksfgtrywJL8OsIzqXmzf5UYr
 jz7ZC8Zxq50MVv66165LD1MRskcUybnLDG1MhBSomjj+oMLqHVZygl/jrdbKhRVgrWGC
 ZgDQ6sCg6JqivHZfG7n1rJ0NKR20zrBXXRi3L5nLpDWqkXp7LyUhZIvXYfKA/C7ElQsZ
 O93A==
X-Gm-Message-State: ANoB5pnKNGcEkWofZvqFDbi1xjY75owpMozTR4r2h0P/fy+GCqiE2cDy
 cje8fHNvSNFYhY8emfKsEXebIw==
X-Google-Smtp-Source: AA0mqf7ZXR3rHAMssv+XBEoFFz7RGw+jMe1K+n1jByylzWyEXI9ntbh5qO3dWE1n3vDXUPNbpNKRfQ==
X-Received: by 2002:a05:6512:252b:b0:4b4:b20c:4b7 with SMTP id
 be43-20020a056512252b00b004b4b20c04b7mr990804lfb.201.1668619320495; 
 Wed, 16 Nov 2022 09:22:00 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a05651c10b000b0026bf43a4d72sm3085645ljn.115.2022.11.16.09.21.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Nov 2022 09:21:59 -0800 (PST)
Message-ID: <b0fdd995-85c8-0833-9d94-918812005d3a@linaro.org>
Date: Wed, 16 Nov 2022 18:21:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Remove unused sleep pin
 control nodes
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
References: <1668591184-21099-1-git-send-email-quic_srivasam@quicinc.com>
 <CAD=FV=Uzky4uxs+qwSH9d7MBBWbXe8sMdvB_-Lqkq+6jbTCciQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=Uzky4uxs+qwSH9d7MBBWbXe8sMdvB_-Lqkq+6jbTCciQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org, broonie@kernel.org,
 konrad.dybcio@somainline.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 swboyd@chromium.org, vkoul@kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 quic_rjendra@quicinc.com, mka@chromium.org, judyhsiao@chromium.org,
 andersson@kernel.org
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

On 16/11/2022 17:51, Doug Anderson wrote:
> Hi,
> 
> On Wed, Nov 16, 2022 at 1:33 AM Srinivasa Rao Mandadapu
> <quic_srivasam@quicinc.com> wrote:
>>
>> Remove unused and redundant sleep pin control entries as they are
>> not referenced anywhere in sc7280 based platform's device tree variants.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> ---
>> Chnges Since v1:
>>     -- Update subject prefixes and commit message.
>>
>>  .../qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi   |  8 -----
>>  .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   | 20 -----------
>>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           | 20 -----------
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi               | 40 ----------------------
>>  4 files changed, 88 deletions(-)
> 
> Reported-by: Douglas Anderson <dianders@chromium.org>

I guess rather:
Suggested-by: Douglas Anderson <dianders@chromium.org>

It's not a bug, no Fixes tag.

> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Best regards,
Krzysztof

