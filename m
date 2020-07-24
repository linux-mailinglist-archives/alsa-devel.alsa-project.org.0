Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A237522C45C
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 13:26:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40908168C;
	Fri, 24 Jul 2020 13:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40908168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595589961;
	bh=/xrsHQKw6cztSundw4jEV3AR9VhyM4xBU6ZE0b7rjLM=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eTwg0abCHJ+7aDLktDtWl1u7K5eHCUMiIkUNSIV2F+FoFF9F9jAuADObzelqJk+sh
	 STyS/CouNvK9JIiP/mc7fB82vlV2QLJGsEuNzG0XNXlaRk5nZkydRF86XL2fjWYlp7
	 0xSvLGp0TNa/TIKhy0e031KwVmh6XljXOo1zZoEo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 212FEF800DF;
	Fri, 24 Jul 2020 13:22:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1128BF80141; Fri, 24 Jul 2020 13:22:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 197E4F802E0
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 13:22:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 197E4F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="dkXWHWOO"
Received: by mail-wr1-x441.google.com with SMTP id r2so2884076wrs.8
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 04:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=j3TiABU4YuyYeNKrOelGmkwg1BeSirg/J0P8Tu+QTf0=;
 b=dkXWHWOOWMb8eHYcmzpjB3sEbqJzwpgXN1Z1yQXFSl91hmPZH/QYYnX+yF6sUVqrsp
 VT/YaS0mAQikyAiLbPv4Una6PBi6aguSKM/RthldXb0+X594+o4sbHxXcXmT+Oe0GK9h
 vO2pglNCt4zr/+n3lPTZtb30iKibnEbva3oBIX+q3XR6zbIifa2FzXLbawQG116bpXvN
 MtOISIP7vHDtWV4OZahSf1AoarVh9dE/B8wIePtstXEkcQMRJwcxKuJH11oPtUiF5FgC
 Uqiw97oolglLdvTCaI1CokjzOMzsDcEUiCY0DG3UliMCvGaKYaqvFrJp3W7QwGYjfhd4
 AdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j3TiABU4YuyYeNKrOelGmkwg1BeSirg/J0P8Tu+QTf0=;
 b=uHIem6z/xr8/h4Y9zvWtxWXexIA47w4czoTdNK+5G9HxQrqSX/PEM3LBaG+sO/qVHZ
 C015ttKgufV/DtBdfO6V1/CHN1YyKAVk4UL+7RXae/lmG6InhM5pKhNmRUh0Mlvnntjz
 7V1wfFXrGMskj0rN4r7sr0cm62Lcvs1isdiXAh0FWajcSVuYt8ZjwubMF40Zozltf1TO
 THIDP9pSotd5BQhIZlHjQTc2CFr4BQWqgrstC3Mz9GhlllG3Rp27Vjv+4Ic1J3q97Ax1
 8EjyVHmlLhq9mr2+DHqcllSOzy7wVEabiSxBSz1Umu1wuhDLojszy1pOW+GlG81/0mrF
 ftnQ==
X-Gm-Message-State: AOAM532bPeMOPRczrGoLI6qNdvj/QOIN0bilUQWCTdm6dsm7iMj1lgun
 NNqPhT+ezTYVGRz7AIn3YOZvpA==
X-Google-Smtp-Source: ABdhPJx+JCHu39HcLo1ayDmJtm5ehJ3SrPKS1CL4dDAtwBX9f1TUc3Ogbt/Vj+aMmITJ4Q1mOcrGUQ==
X-Received: by 2002:adf:f247:: with SMTP id b7mr8705570wrp.128.1595589754114; 
 Fri, 24 Jul 2020 04:22:34 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id x204sm11429590wmg.2.2020.07.24.04.22.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jul 2020 04:22:33 -0700 (PDT)
Subject: Re: [PATCH v4 00/12] ASoC: qcom: Add support for SC7180 lpass variant
To: Rohit kumar <rohitkr@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d1e6d60b-9f00-266d-74ad-8c18bbf8d142@linaro.org>
Date: Fri, 24 Jul 2020 12:22:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 22/07/2020 11:31, Rohit kumar wrote:
> This patch chain add audio support for SC7180 soc by doing the required
> modification in existing common lpass-cpu/lpass-platform driver.
> This also fixes some concurrency issue.
> 
> Changes since v3:
> 	- Fixed yaml documentation comments and make dt_binding_check issues.
> 	- Moved general fixes out of sc7180 specific patches as suggested by Srinivas.
> 	- Update clock-names to make it same as existing platforms.
> 
> Ajit Pandey (4):
>    ASoC: qcom: Add common array to initialize soc based core clocks
>    ASoC: qcom: lpass-platform: Replace card->dev with component->dev
>    include: dt-bindings: sound: Add sc7180-lpass bindings header
>    ASoC: qcom: lpass-sc7180: Add platform driver for lpass audio
> 
> Rohit kumar (8):
>    ASoC: qcom: lpass-cpu: Move ahbix clk to platform specific function
>    ASoC: qcom: lpass-platform: fix memory leak
>    ASoC: qcom: lpass: Use regmap_field for i2sctl and dmactl registers
>    ASoC: qcom: lpass-cpu: fix concurrency issue
>    dt-bindings: sound: lpass-cpu: Add sc7180 lpass cpu node
>    ASoC: qcom: lpass-cpu: Use platform_get_resource
>    ASoC: qcom: lpass-platform: Use platform_get_irq
>    dt-bindings: sound: lpass-cpu: Move to yaml format


Tested this on Dragon Board 410c!

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

--srini
> 
>   .../devicetree/bindings/sound/qcom,lpass-cpu.txt   |  79 --------
>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 185 ++++++++++++++++++
>   include/dt-bindings/sound/sc7180-lpass.h           |  10 +
>   sound/soc/qcom/Kconfig                             |   5 +
>   sound/soc/qcom/Makefile                            |   2 +
>   sound/soc/qcom/lpass-apq8016.c                     |  86 ++++++--
>   sound/soc/qcom/lpass-cpu.c                         | 204 ++++++++++---------
>   sound/soc/qcom/lpass-ipq806x.c                     |  67 +++++++
>   sound/soc/qcom/lpass-lpaif-reg.h                   | 157 ++++++++-------
>   sound/soc/qcom/lpass-platform.c                    | 155 +++++++++++----
>   sound/soc/qcom/lpass-sc7180.c                      | 216 +++++++++++++++++++++
>   sound/soc/qcom/lpass.h                             |  63 +++++-
>   12 files changed, 930 insertions(+), 299 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
>   create mode 100644 include/dt-bindings/sound/sc7180-lpass.h
>   create mode 100644 sound/soc/qcom/lpass-sc7180.c
> 
