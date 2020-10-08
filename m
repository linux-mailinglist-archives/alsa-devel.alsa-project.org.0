Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17660286E30
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Oct 2020 07:39:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4186716AD;
	Thu,  8 Oct 2020 07:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4186716AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602135576;
	bh=tNlgB3i2ENli3TsCdpwtNRBzop+/lki/1X9spIxYE0g=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ly1cQPnk8eUCEVJ+lzwbjllNVnZPQVQQR9gu8p+QsPk3mDmZmO2Hz3sSE8OS2Euqp
	 VquNO1WDUCUwhDZKC1iA7ksW65tY2puiFRLWEl8XajU43BDvVLAT8Wq3NwVuvzeyE2
	 N71YUBy+rDJGTjVLpG1vWuocw4NxiJLy0VFA8eH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BD45F80168;
	Thu,  8 Oct 2020 07:37:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3508F80164; Thu,  8 Oct 2020 07:37:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80AB9F80090
 for <alsa-devel@alsa-project.org>; Thu,  8 Oct 2020 07:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80AB9F80090
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Wna3U3JA"
Received: by mail-wm1-x341.google.com with SMTP id k18so5137631wmj.5
 for <alsa-devel@alsa-project.org>; Wed, 07 Oct 2020 22:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=A6XCjatiL9NzFQM+NdxMv/RvtW9AfjiLEaWTMjp5zoI=;
 b=Wna3U3JA7eZqXSqKp499zxZzQziRQTdFekU1KZnuA6WKKgK/lB3nSJ1rF6+N9OdRe7
 bXz7WhEajXOoS4rqh4OJ8thr4zXSjvN+GMkCY2QINEqp1wyyJb0bUnvP0QCK1FMGCXi4
 /45h0GsDXzfft8Uue82SmspgY02SLP7aRoke9jM0Dn/CF7RlKsYIhZqmPOic+3dPbEYa
 dPjLgLpyj6o1kwjIX5M2VWCU9UoBvsOGtOsvYFLNn81ukB00VIov0k++l/CWTcGqP6nh
 2l6SDIOI2g4XQbqLoyvqy3DVnWbZ/nl9qHRPvImp6nIdwhA04AlRIScXaIeoiBwBH4QY
 kmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=A6XCjatiL9NzFQM+NdxMv/RvtW9AfjiLEaWTMjp5zoI=;
 b=PHapds762qFzoFFA906jTS0dME500OUOdAFPgQPPEsBh/hUeK0VQBIuCP8lmDHzhn8
 gLQKZUGNHRFC6oi91Yo4t8Ef7gujbouuaKk2zmuZVE5URfUQao5j/EgggBPliqQiVTCZ
 Mc3kxejUB1cfOTRM7TPySZT7B4lto4a3bpr7NvBD5Lm9gAsXXM7OUAX8ExyceESZzpBj
 M6nqz6Tla8IezETodLHntO5ufeN0hYPDHwqhy0ncIB04EYHeexMrZx2Prg7XDci2njTq
 TxLNVCa33tW9YWJeRQbzQj/iwHBuLqjnQ0gCTcqtKLSkO3K+hr26O6dde5fhOmSZCH/7
 gv6g==
X-Gm-Message-State: AOAM530aFs4EknsTICd8SvGUE65Fx3NGX+hy5ifYHFfwwr1INsXycqEb
 +zbhMwHexHX6ekVY/1kv1GW2dg==
X-Google-Smtp-Source: ABdhPJzqouWaKGAaiL8Srtog8oaCNxGNm6BRRyanUcbWr+H31MrZoIhMQp7sQKJcjsJATK+qh1xmuw==
X-Received: by 2002:a1c:7ed5:: with SMTP id z204mr6752967wmc.177.1602135462857; 
 Wed, 07 Oct 2020 22:37:42 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id a3sm5165998wmb.46.2020.10.07.22.37.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Oct 2020 22:37:42 -0700 (PDT)
Subject: Re: [PATCH v11 0/7] Qualcomm's lpass-hdmi ASoC driver to support
 audio over dp port
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1602134223-2562-1-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <244e74f6-fa8c-692a-aa84-4677a0fd815b@linaro.org>
Date: Thu, 8 Oct 2020 06:37:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1602134223-2562-1-git-send-email-srivasam@codeaurora.org>
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



On 08/10/2020 06:16, Srinivasa Rao Mandadapu wrote:
> These patches are to support audio over DP port on Qualcomm's SC7180 LPASS
> Asoc. It includes machine driver, cpu driver, platform driver updates for
> HDMI path support, device tree documention, lpass variant structure
> optimization and configuration changes.
> These patches depends on the DP patch series
> https://patchwork.kernel.org/project/dri-devel/list/?series=332029
> https://lore.kernel.org/patchwork/project/lkml/list/?series=464856
> 
> changes since V10:
>      -- Moved hdmi regmap functions from lpass-hdmi.c to lpass-cpu.c
>      -- Moved QCOM_REGMAP_FIELD_ALLOC macro from lpass-hdmi.c to lpass.h
> changes since V9:
>      -- Removed unused structures lpass_hdmi.h
> changes since V8:
>      -- Removed redundant structure wrapper for reg map field memebrs
>      -- Updated lpass_hdmi_regmap_volatile API with appropriate registers as true
>         and others as false.
> changes since V7:
>      -- Fixed typo errors
>      -- Created Separate patch for buffer size change
> changes since V6:
>      -- Removed compile time define flag, which used for enabling
>       HDMI code, based on corresponding config param is included.
>      -- Updated reg map alloc API with reg map bulk API.
>      -- Removed unnecessary line splits
> changes since V5:
>      -- Removed unused struct regmap *map in lpass_platform_alloc_hdmidmactl_fields.
>      -- DMA alloc and free API signature change in lpass-apq8016.c, lpass-ipq806x.c
>      -- Keeping API "irqreturn_t lpass_platform_hdmiif_irq" under ifdef macro
> Changes Since v4:
>      -- Updated with single compatible node for both I2S and HDMI.
> Changes Since v3:
>      -- Removed id in lpass variant structure and used snd_soc_dai_driver id.
> Changes Since v2:
>      -- Audio buffer size(i.e. LPASS_PLATFORM_BUFFER_SIZE) in lpass-platform.c increased.
> Changes Since v1:
>      -- Commit messages are updated
>      -- Addressed Rob Herring review comments
> 
> V Sujith Kumar Reddy (7):
>    ASoC: Add sc7180-lpass binding header hdmi define
>    ASoC: dt-bindings: Add dt binding for lpass hdmi
>    Asoc:qcom:lpass-cpu:Update dts property read API
>    Asoc: qcom: lpass:Update lpaif_dmactl members order
>    ASoC: qcom: Add support for lpass hdmi driver
>    Asoc: qcom: lpass-platform : Increase buffer size
>    ASoC: qcom: sc7180: Add support for audio over DP
> 
>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  74 ++--
>   include/dt-bindings/sound/sc7180-lpass.h           |   1 +
>   sound/soc/qcom/Kconfig                             |   5 +
>   sound/soc/qcom/Makefile                            |   2 +
>   sound/soc/qcom/lpass-apq8016.c                     |   4 +-
>   sound/soc/qcom/lpass-cpu.c                         | 249 ++++++++++++-
>   sound/soc/qcom/lpass-hdmi.c                        | 258 ++++++++++++++
>   sound/soc/qcom/lpass-hdmi.h                        | 102 ++++++
>   sound/soc/qcom/lpass-ipq806x.c                     |   4 +-
>   sound/soc/qcom/lpass-lpaif-reg.h                   |  49 ++-
>   sound/soc/qcom/lpass-platform.c                    | 395 +++++++++++++++++----
>   sound/soc/qcom/lpass-sc7180.c                      | 116 +++++-
>   sound/soc/qcom/lpass.h                             | 124 ++++++-
>   13 files changed, 1240 insertions(+), 143 deletions(-)
>   create mode 100644 sound/soc/qcom/lpass-hdmi.c
>   create mode 100644 sound/soc/qcom/lpass-hdmi.h
> 

Tested this series on DragonBoard 410c

Tested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
