Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E236228CBDF
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Oct 2020 12:38:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 103001671;
	Tue, 13 Oct 2020 12:37:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 103001671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602585507;
	bh=7CxOrC8iZZeOojS+ldrH51PV2erlc7em4A8mfveEmyI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gzpcoivoeXk/+JMhxULuCG/cj6tRgZMpHpmeckWMoAv/BQlgWOZQdYAJrAIvUFGQ9
	 HOek2mVwRREqLlO37OxxrZBKU3bgcHRbZ+ikI+IIPGfwUdJDSjPrhtnKbAPBZQJgcV
	 q/HMhVcxsDTcOs6u2IT2p/zY8Kv7pBVqli18BDHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BBF7F801D9;
	Tue, 13 Oct 2020 12:36:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49C79F801A3; Tue, 13 Oct 2020 12:36:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4472F800CE
 for <alsa-devel@alsa-project.org>; Tue, 13 Oct 2020 12:36:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4472F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="rrHdIIkH"
Received: by mail-wm1-x32f.google.com with SMTP id a72so9842126wme.5
 for <alsa-devel@alsa-project.org>; Tue, 13 Oct 2020 03:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CiWCv3BMnudQFt/Kh0EA1mCHFgkrHwPIFYjOeIiiAgM=;
 b=rrHdIIkHJ4RWluKR74GDVBCXZ3fHa+2GckpSDJAnPQr3LIihHVRnyUP0B3Pyy3ZhiX
 8rSJA7CHd4bBwm+paLicw3yVKCUd7p47cqxTVZOMI8KQTToQQIRbcEkKYaCAJv5rCfEc
 1bgA/vc4KEWcOYZ4uNSULZ7vzptJAjV8I6Yt5FQdZdfVDCfUWFaaYLymlxMbvCLnuB5g
 k4Q1OxKAiRD5UMQFq/jNfia58Icqaqxjn9Zw637CxWxICuvMpdldIxOsG31VbTFTfcjx
 fcwjAwQt64YG5s9nbZkfQG7kDKS53uzrSfQJevNyaAgzQJP/OvC7fnfI1m0PztItBYpx
 0bKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CiWCv3BMnudQFt/Kh0EA1mCHFgkrHwPIFYjOeIiiAgM=;
 b=AjGojbrAVnYgPShyxNV2niNluW4+EnvIpALi99ItQUck79WQtiDR0gJXx88ldAay9A
 CZf+vMI46gdW3VG689QyQJDy/bgmYUIt8yzSzmE9ibQh/qmVnPWoCuRnfomURFYh6zI5
 yVllUdDfROIP2CzYkcMpNiJVXe5eSDArlVbP29+ZSGQyY1PMq1WJ/WUM34n3QPDROOcE
 u4jvnUDQlX+o3m5DB6Coz5wzs7ziLKu74t2lzYT3NOMXuC5tA79CmoK+JyWyHSPrb8kt
 LomTD1dVgYMVel9erF/oBmEy+6tgs23z6CQbSzmfMdvKKhfgH0bffCi2+2JWxVSSPjlA
 5yPg==
X-Gm-Message-State: AOAM530bp4romaJdoGqDOHlUUov+FzOvfC44fzp+YNsrK20LJRUEKcub
 m5kNxpU0SIYW2QGFrXGLhQ8YpA==
X-Google-Smtp-Source: ABdhPJxiYcDKpnTqq5SWY21dPvFP7GNAu3f5Em/slUL6EOVBNEG9+t+pGtCNV4M0EgkRnYKNBcGB0w==
X-Received: by 2002:a1c:1905:: with SMTP id 5mr15466149wmz.32.1602585396171;
 Tue, 13 Oct 2020 03:36:36 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id t6sm31809439wre.30.2020.10.13.03.36.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Oct 2020 03:36:35 -0700 (PDT)
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Cheng-Yi Chiang <cychiang@chromium.org>, linux-kernel@vger.kernel.org
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
Date: Tue, 13 Oct 2020 11:36:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200914080619.4178587-3-cychiang@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, dgreid@chromium.org,
 devicetree@vger.kernel.org, tzungbi@chromium.org,
 Srinivasa Rao <srivasam@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
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

Hi Cheng,

Sorry for such late review w.r.t compatibles,

On 14/09/2020 09:06, Cheng-Yi Chiang wrote:
> +---
> +$id:http://devicetree.org/schemas/sound/qcom,sc7180.yaml#
> +$schema:http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies Inc. SC7180 ASoC sound card driver
> +
> +maintainers:
> +  - Rohit kumar<rohitkr@codeaurora.org>
> +  - Cheng-Yi Chiang<cychiang@chromium.org>
> +
> +description:
> +  This binding describes the SC7180 sound card which uses LPASS for audio.
> +
> +properties:
> +  compatible:
> +    const: qcom,sc7180-sndcard-rt5682-m98357-1mic

This information can come from the dai link description itself, why 
should compatible string have this information?

Can't we have better compatible string with actual board name or use the 
same compatible name as used by other boards?

Can you give us some details on the advantages of doing this way?

Or am I missing something?

AFAIU, you should add proper board name / model name to the compatible 
string rather than describe how its connected. Connection is already 
part of dai link definition.

On the other hand model property can include variant information.
This can also be used to set card long name which will help in UCM2.

The reason I had to bring this up is because the use-space (ucm in this 
case) will not be in a position to differentiate between different board 
variants to select correct mixer controls, so its going to be a pain!


Thanks,
srini
