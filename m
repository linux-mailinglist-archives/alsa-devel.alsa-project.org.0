Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF01554D77
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 16:36:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39F521AF2;
	Wed, 22 Jun 2022 16:35:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39F521AF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655908574;
	bh=zx261cOhUZW+3p0tYAgy15qhI+yWktMGo5zYsxypKC4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CY3eVYp4WtirSH2T2S7w3H/Y+B4PesH4CVF61xL8Ki7YhHIYgJt4a6pCIsXh/wKyH
	 1tEqeCU80y19ZGiJjsIQbyG341U1ksxcIfstNiqAK6jS6lf9a7PP9jwQMVrCtWu/rs
	 phdkBhr8pwNiWN27YB5Eyp8lKkcJ6fd7WFZ+7N9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAED8F8032D;
	Wed, 22 Jun 2022 16:35:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0DFD2F802D2; Wed, 22 Jun 2022 16:35:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26423F80100
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 16:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26423F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="EzNqat5N"
Received: by mail-ej1-x636.google.com with SMTP id sb34so5636895ejc.11
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 07:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=H/cSfccrkMobuaWdmE/tdPoYRx0z9bpXg+/yToTVvnE=;
 b=EzNqat5NrSDe5C45j1gKPwkoY+xrhidH+Z3Io7mhsMwqTNnLBUaUqxRvEbatmHXAh8
 9R3VSv/sxc9Cka2XRU3PM+c1zHm/1nOsEmLooSA985j/kn3qrN4Nf6Y+KCn7AVfqwa8U
 oSUoxFP+uHkVZUNXblWZtsOPHxfd38C05M1J/W3+8xDSZanH8hUTP0xNCuvjt4qajvsK
 WPTsGa3qrNsJbMB7JVilnqYU99IMZ6Zz7HQH1j3Wi0gpZ3ZlD60gHK7iPQlvJOjq6Ljy
 yu1XE4KI2cVXyfy3y3xwGNHO7gy8kNWuEH3fveAZ6avUzs+XnGMyg2aRzXbypXDfewmG
 uc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H/cSfccrkMobuaWdmE/tdPoYRx0z9bpXg+/yToTVvnE=;
 b=3H8CWE03nmDKbfmhG2w/YBzIVv7V7waNyKQ1W8h26VJU7dfWA+8KMbKD2lvESBoRun
 rHl/XO2tBEDZ/3efw0MK6REwyBT5j6Mp3YujOedCcywCDuR/EbJ1okI/eL4tDJZOwrGG
 L7IpmJ2ggBvR+L/6qLWTRxptHWw0e72au8RiAWUVnrA3n93Sxt40AVNWB3xwn5kyXM7+
 ZUNRa5WNzOoYgUAyGaB1vN9RB+RXak2ob8gUCKZ80sqwOwpEsSXbO7LHhCACptM0ShV2
 kcoyISe95oUgMGZEqBmBwoWg71DZ2EnnDrbIxDNRrlbOkmr4gudJqUy43tThexmklm/D
 FQ5A==
X-Gm-Message-State: AJIora+AnvpqC0zo8HV30MWY158XS/pzLDwE3pX6Gh4I6mSWag880hXn
 XGpPBDV7Lwl7uKDdZ0uDUjq7MQ==
X-Google-Smtp-Source: AGRyM1vJVzIPqFGBsUHqfmMJi7WDemTnx1NnVJOZoZ49hmcATWo1tUFMa4ra8zQAsOYs2fyIGY6jyA==
X-Received: by 2002:a17:907:7b8d:b0:722:dcae:6417 with SMTP id
 ne13-20020a1709077b8d00b00722dcae6417mr3366157ejc.225.1655908505951; 
 Wed, 22 Jun 2022 07:35:05 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 g36-20020a056402322400b004357f88fcdcsm8144577eda.11.2022.06.22.07.35.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 07:35:05 -0700 (PDT)
Message-ID: <5421df1e-6e86-27a4-3da7-c15661aee190@linaro.org>
Date: Wed, 22 Jun 2022 16:35:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: Add bindings for WCD9335 DAIs
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20220622064758.40543-1-y.oudjana@protonmail.com>
 <20220622064758.40543-2-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220622064758.40543-2-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Yassine Oudjana <y.oudjana@protonmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
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

On 22/06/2022 08:47, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add bindings for the DAIs available in WCD9335 to avoid
> having to use unclear number indices in device trees.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  MAINTAINERS                              |  1 +
>  include/dt-bindings/sound/qcom,wcd9335.h | 15 +++++++++++++++
>  2 files changed, 16 insertions(+)
>  create mode 100644 include/dt-bindings/sound/qcom,wcd9335.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b774f21828f7..2bcc3cc129c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16366,6 +16366,7 @@ M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>  M:	Banajit Goswami <bgoswami@quicinc.com>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>  S:	Supported
> +F:	include/dt-bindings/sound/qcom,wcd9335.h
>  F:	sound/soc/codecs/lpass-va-macro.c
>  F:	sound/soc/codecs/lpass-wsa-macro.*
>  F:	sound/soc/codecs/msm8916-wcd-analog.c
> diff --git a/include/dt-bindings/sound/qcom,wcd9335.h b/include/dt-bindings/sound/qcom,wcd9335.h
> new file mode 100644
> index 000000000000..709d33ca748d
> --- /dev/null
> +++ b/include/dt-bindings/sound/qcom,wcd9335.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef __DT_QCOM_WCD9335_H
> +#define __DT_QCOM_WCD9335_H

Header guard should match better path, so:

__DT_SOUND_QCOM_WCD9335_H

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
