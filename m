Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F117F73E385
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 17:37:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58445845;
	Mon, 26 Jun 2023 17:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58445845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687793861;
	bh=KTaDnHVK92yTDG/1WY38ab8eowqJLPi2XuO0cj1YIgM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KzHx6A2de9W/qsfKcLsWSFnNxs2vNK1kYgiOh4CT1kNFiUCHTXvyfvagNxxcYERFV
	 vhkpvYsPHVXhypmCt6UGfaUUFiAL39VQGhhI5t6yP8md40fliBVNdV8FZ9xSCha9rx
	 cWrt5G1fSO9dowGqQ9cT0+veVT6ZsnHZKIf1rcAc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 87F8FF80246; Mon, 26 Jun 2023 17:36:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 237C9F80212;
	Mon, 26 Jun 2023 17:36:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E46DEF80246; Mon, 26 Jun 2023 17:36:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C11E4F80093
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 17:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C11E4F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=D9mwgzNM
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f9b4a71623so32678505e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 26 Jun 2023 08:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687793783; x=1690385783;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SnVw1NqNJcB00wQMw/uTf6e21wRfweiPK9JrGx6RcVs=;
        b=D9mwgzNM/+uNromAIaOtv+8vCdJcxZGi2RkJpT8Xes9k32j6KEUBg8ZKxL33kbAaCO
         YtZd/Iie+psdVOLf1tA7YXJrbVYWhHMNb8fPmHFSN8Y+neyEhjj+RNTCzW2BBsbImRR8
         WU97HivRP0HDcLUv1IKfOgsNrRQ7w1/7iyu+v74DMsxZM2AXR9oH/OWA7Gqo19hwNTRz
         1R9FC6W4bDN38ki+xEOV+cDVd0qR9P5RJy8uVW+tthHX17xTAdMhqmmqwH0QKT7qGpdi
         IYWZ4kBybxrzzyrk9425FfOt8ztGjwmUGNTGzf6I3cJmKfkDX45pKA0ackIBOnIW9MaP
         WPsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687793783; x=1690385783;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SnVw1NqNJcB00wQMw/uTf6e21wRfweiPK9JrGx6RcVs=;
        b=PCupwzQRKMJDTozJqG24o7YIltY0n5SeWEBUhgAAhKNakzigLLxEDCJfoZ2eWWi2OM
         +oNl6yeF9CuDNzae9mecrw6gNuZm9B+bIRu3HQ2tU5IBs7XlSAXYHSD+cvQp/etH3CFI
         1+tjOMJWbAoXqx2DaXAyw3Vgk3UiDA8ACUdGSjY9ZIvT7xbP0HiqoOImruS5UoncetBL
         bXgeEgeXivhCbsMxWGs/HFgJPefQrn2bqAvLI5nhZnPnTm5rsH7LPqNJyaZRv3Gx0qB1
         P8AqG5py5gT0PA1AmWu63+dtHXSwvKY+oiu9PqDW8gVSeqOwAOfUIuvGqKsfsGUkFo88
         Zl4w==
X-Gm-Message-State: AC+VfDwTj7OB2BtmEOB6o/CpSxbVReW8a52irGZH5WjMg0vPK6BreB/c
	qwIhpnf8kpQJk6HEIhmBoUoEiQ==
X-Google-Smtp-Source: 
 ACHHUZ4FEXp87ZB3EcU+bYZN9wHCNNB8g6R8m5tOeOJIbVYlTsm0uefU0pHye2INl7YnnWSdeOC3YA==
X-Received: by 2002:a1c:4c14:0:b0:3f9:b0c2:9ff7 with SMTP id
 z20-20020a1c4c14000000b003f9b0c29ff7mr15585537wmf.30.1687793782804;
        Mon, 26 Jun 2023 08:36:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 s4-20020adfea84000000b002ca864b807csm7910245wrm.0.2023.06.26.08.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 08:36:22 -0700 (PDT)
Message-ID: <fc726c72-0503-b407-cad1-f24422f02ab2@linaro.org>
Date: Mon, 26 Jun 2023 17:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 3/5] ASoC: dt-bindings: Add StarFive JH7110 PWM-DAC
 controller
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, Walker Chen <walker.chen@starfivetech.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230626110909.38718-1-hal.feng@starfivetech.com>
 <20230626110909.38718-4-hal.feng@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230626110909.38718-4-hal.feng@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DTETRLED2O3G6QNX7M7AA6T6GAENTMDT
X-Message-ID-Hash: DTETRLED2O3G6QNX7M7AA6T6GAENTMDT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DTETRLED2O3G6QNX7M7AA6T6GAENTMDT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26/06/2023 13:09, Hal Feng wrote:
> Add bindings for the PWM-DAC controller on the JH7110
> RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../sound/starfive,jh7110-pwmdac.yaml         | 76 +++++++++++++++++++
>  1 file changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml b/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
> new file mode 100644
> index 000000000000..91a4213f2bd8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/starfive,jh7110-pwmdac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 PWM-DAC Controller
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The PWM-DAC Controller uses PWM square wave generators plus RC filters to
> +  form a DAC for audio play in StarFive JH7110 SoC. This audio play controller
> +  supports 16 bit audio format, up to 48K sampling frequency , up to left

No space before ,

> +  and right dual channels.
> +
> +maintainers:
> +  - Hal Feng <hal.feng@starfivetec


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

