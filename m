Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF9C25D6A8
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 12:43:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B88A1AF5;
	Fri,  4 Sep 2020 12:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B88A1AF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599216219;
	bh=Ab45JV7oI+A8PKOMI/3c97KY+YHFN/rrzno4HDDOwMI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MAefqe4e597E8QoLgfru7FgnfHzJxGCko6mCstaadBXOpesb7yRTJESkWWerCA3jT
	 GkYGF69n3i6olA0zd75XDWlK7UVzDc42ZIFQmPlpW1bAwDp+f1lgqscYUG2jwpciy5
	 kcMebP676IGSdeN5lPNHgsbPvqErdzsY/OwtblZI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B307DF8026F;
	Fri,  4 Sep 2020 12:41:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18171F8025E; Fri,  4 Sep 2020 12:41:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61D02F800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 12:41:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61D02F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="sYm0PXTP"
Received: by mail-wr1-x443.google.com with SMTP id c15so6209022wrs.11
 for <alsa-devel@alsa-project.org>; Fri, 04 Sep 2020 03:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kyJg8idy+PjAE57kGmkS0ZoaAYxlqusadYf8SACjX04=;
 b=sYm0PXTPk5fJ6nKnctZpW0txiiXbd6A6TN9TxriYAGrOs7WULA6uKZ7UH7+eczEnWw
 aDHeYvfvAxsruBMjO2UMYARCy7RE8RFPwhAGzTrJ/hOvDp+kjwCOjsFsWlE/8AycPBmo
 mYiKosDA7Prf8L/E0GGH911LUE33CWluHR8hYYB4RhVXGgQuqKh5yU0TrOTbJCquL1lR
 4cq4H/XEG/3BnJmbOH3AsW7Q54PkO8C6HxY8W4GiPapu7rtxSAq3bUA218a7BlOiENJZ
 yYVTUHFmYhUjSklJ8pl4rEkxH5dHSInIZhEOXTspfcNPJaYqi1yQIc51LbA0G3/QLJHM
 0bAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kyJg8idy+PjAE57kGmkS0ZoaAYxlqusadYf8SACjX04=;
 b=botYwuzuXbWVOX8D6UJgtMKoqFYirSxxZ1DSpbaGsL6JbJJ21+jmYe9wyN1LPV3R5z
 7UocurgvXbypcru2xrW1JOR5vZ8UECqNJHS5frK4/JtQWrMS5eGZ7SpkuD5m5HsUywY6
 Edx5jMbu2Li49LdpjfIXcaYXMvKu6Yz0hVn5/u0YMahm3HHiDS26qWNU1iEP1d2U2TAS
 9twtK9uhkjUDUfAMcUHSr0iw9r1oLgu5yXlIYLOAhcjf5LrthrWCSaanh+DxWybTzLO7
 TcY7Xz13m58YWHd6zfFbM6mD8wn8XOOQGnODiQMJxJLGwiVFU1QAms3X7Ay7GX9/zpmM
 ypTA==
X-Gm-Message-State: AOAM5338IW3ylBKj4J9iWrypUMtnlAWDa2gpTyj8SpQiL83fO6BLfUub
 9ZTZUcLobTRdPMK6WwTWZAoLxQ==
X-Google-Smtp-Source: ABdhPJwcM/mvRUa1x6LP8GowZ/iDgM47WaAX67i0UXgUblW5EME1WshkbRtkPmA9S3/tyM1Y/cvb9A==
X-Received: by 2002:a5d:4e44:: with SMTP id r4mr2651863wrt.338.1599216071002; 
 Fri, 04 Sep 2020 03:41:11 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id q3sm19804440wmq.1.2020.09.04.03.41.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Sep 2020 03:41:10 -0700 (PDT)
Subject: Re: [PATCH v3 3/5] ASoC: qcom: Add support for lpass hdmi driver
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1598855964-1042-1-git-send-email-srivasam@codeaurora.org>
 <1598855964-1042-4-git-send-email-srivasam@codeaurora.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <ac1f0b9a-8e07-464c-b0df-6b8e5665a632@linaro.org>
Date: Fri, 4 Sep 2020 11:41:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1598855964-1042-4-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
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



On 31/08/2020 07:39, Srinivasa Rao Mandadapu wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Upadate lpass cpu and platform driver to support audio over dp.
> Also add lpass-hdmi.c and lpass-hdmi.h.
> 
> Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> ---
>   sound/soc/qcom/Kconfig           |   5 +
>   sound/soc/qcom/Makefile          |   2 +
>   sound/soc/qcom/lpass-apq8016.c   |   1 +
>   sound/soc/qcom/lpass-cpu.c       |  64 ++--
>   sound/soc/qcom/lpass-hdmi.c      | 684 +++++++++++++++++++++++++++++++++++++++
>   sound/soc/qcom/lpass-hdmi.h      | 129 ++++++++
>   sound/soc/qcom/lpass-ipq806x.c   |   1 +
>   sound/soc/qcom/lpass-lpaif-reg.h |  48 ++-
>   sound/soc/qcom/lpass-platform.c  | 287 ++++++++++++----
>   sound/soc/qcom/lpass.h           |  88 ++++-
>   10 files changed, 1225 insertions(+), 84 deletions(-)
>   create mode 100644 sound/soc/qcom/lpass-hdmi.c
>   create mode 100644 sound/soc/qcom/lpass-hdmi.h
> 
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index a607ace..509584c 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -12,6 +12,10 @@ config SND_SOC_LPASS_CPU
>   	tristate
>   	select REGMAP_MMIO
>   
> +config SND_SOC_LPASS_HDMI
> +	tristate
> +	select REGMAP_MMIO
> +
>   config SND_SOC_LPASS_PLATFORM
>   	tristate
>   	select REGMAP_MMIO
> @@ -30,6 +34,7 @@ config SND_SOC_LPASS_SC7180
>   	tristate
>   	select SND_SOC_LPASS_CPU
>   	select SND_SOC_LPASS_PLATFORM
> +	select SND_SOC_LPASS_HDMI
>   
>   config SND_SOC_STORM
>   	tristate "ASoC I2S support for Storm boards"
> diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
> index 7972c94..0bd90d7 100644
> --- a/sound/soc/qcom/Makefile
> +++ b/sound/soc/qcom/Makefile
> @@ -1,12 +1,14 @@
>   # SPDX-License-Identifier: GPL-2.0
>   # Platform
>   snd-soc-lpass-cpu-objs := lpass-cpu.o
> +snd-soc-lpass-hdmi-objs := lpass-hdmi.o
>   snd-soc-lpass-platform-objs := lpass-platform.o
>   snd-soc-lpass-ipq806x-objs := lpass-ipq806x.o
>   snd-soc-lpass-apq8016-objs := lpass-apq8016.o
>   snd-soc-lpass-sc7180-objs := lpass-sc7180.o
>   
>   obj-$(CONFIG_SND_SOC_LPASS_CPU) += snd-soc-lpass-cpu.o
> +obj-$(CONFIG_SND_SOC_LPASS_HDMI) += snd-soc-lpass-hdmi.o
>   obj-$(CONFIG_SND_SOC_LPASS_PLATFORM) += snd-soc-lpass-platform.o
>   obj-$(CONFIG_SND_SOC_LPASS_IPQ806X) += snd-soc-lpass-ipq806x.o
>   obj-$(CONFIG_SND_SOC_LPASS_APQ8016) += snd-soc-lpass-apq8016.o
> diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
> index 5c8ae22..a1bc7e2 100644
> --- a/sound/soc/qcom/lpass-apq8016.c
> +++ b/sound/soc/qcom/lpass-apq8016.c
> @@ -289,6 +289,7 @@ static struct lpass_variant apq8016_data = {
>   	.exit			= apq8016_lpass_exit,
>   	.alloc_dma_channel	= apq8016_lpass_alloc_dma_channel,
>   	.free_dma_channel	= apq8016_lpass_free_dma_channel,
> +	.id			= I2S_INTERFACE,

Before going into detail review, I see real issue in the overall 
approach here to add new interface to exiting lpass!!

Intention of struct lpass_variant is to address differences between SoCs 
or different lpass versions. But you should not duplicate this and use 
it for addressing differences between each lpass interfaces!

All the dai related register offsets should still go in to this 
structure and driver should be able to know which dai its talking to 
based on snd_soc_dai_driver id and select correct register offset.

Also on the other note, can you please split the patch if possible so 
that it will be easy for review. Specially I would like to see header 
file changes specific to adding new interface to be separate then 
followed by the actual interface implementation  and then the user.

I also see some unrelated changes like changing buffer sizes, which 
should go into different patch!

--srini
