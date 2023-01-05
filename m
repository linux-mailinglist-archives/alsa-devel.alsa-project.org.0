Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B045865F383
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 19:10:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80E7611C1B;
	Thu,  5 Jan 2023 19:09:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80E7611C1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672942225;
	bh=A7b+MSJTZrJEgJWlxhJX5XZNEsE/p1S0Kk86O/Oax44=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fjG4Vy+xQpwAjv7crYVZ5n6vPDUtlA+CdV/pd43GRQQk6aYSBLhOD4JS9ZJVjvsgN
	 0OcmgD2isLMv3HnzFT/lQmWohMDRFPa8Ql7kuAE+PMzBzUya9ZK+Zb0927dsl4iTUK
	 DTTcMlo6L56hS9weKvMhM7GnRG/6bGSOSsGsODy4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C39AF800C0;
	Thu,  5 Jan 2023 19:09:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C9E3F8047B; Thu,  5 Jan 2023 19:09:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6ECE0F8022B
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 19:09:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ECE0F8022B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JotekkWG
Received: by mail-wm1-x32b.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso1967886wmq.1
 for <alsa-devel@alsa-project.org>; Thu, 05 Jan 2023 10:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jTQXXh/dvztKjFBUGXCZQrUJyMbJ1vzV92prLWcVbIc=;
 b=JotekkWG9cVcUN6JY5FzoA6/kA2g/fpF4KEGZQR4qRVkQrBx7ji6MfDeBlrZKVbtoD
 e1TGJFo8OiWTEB4CXAtheRcgYGPawNmGwECJO2hWU8KgNJbFeep1MeJmDKdLk3N74yBA
 hb5DyDUqepXDN3MaZHPOmpfQBnig6p9rN+pXNnl44HUk+ekcSxSX4NtYeCzbcBYvXIk2
 ZiMVyIAYAM/PdVJBth2HVITnWn8fSH87jNjrJ87Ev2NS4eKnXiUaO4lHvkmSFKawZ4JX
 UZZYgmqX/R9RWhDaZ5oxfXD6cTDLB86HkXBhKC3J3i6VynGfqx6yphTzQN7xXUMpHTdP
 t9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jTQXXh/dvztKjFBUGXCZQrUJyMbJ1vzV92prLWcVbIc=;
 b=77R4kjHxtL83ZKiXF7fUZ/obw0eqeA5PJLQRiRU2lr9tAxlNx8jzO4UmoGxCpa1KJa
 iHkwEAairfusPw4aDlpHP7slnkzIUYdbeizTxNbt1QOwZiB5CiSEvL5cc/q05Z2D8D30
 QJFa4cC3iEP+MqMuvXsjaOIOdxY5noGnjCKcLFvLeYkvk+Zcr36uHCOSc0hLZM6DaZrI
 071SGtYBSGUQWpYP2yyGSGeypznkUwiHPzwjJadRk7HPXU7afHvib9T8ewJodsxkiSHH
 AamL/4QARq68iOgHKOC10EePhTA9dNUzO+V1l/7voWCgn2bOH+ft+n3maRnC2YL/r/Ev
 1eMQ==
X-Gm-Message-State: AFqh2krLUqYksnTfpBfq4TUxNelpV4WLVVm9pV06r321ppYvz0NBs5dn
 0ZP6kWUZSfA0NwBBDYDclr+iaw==
X-Google-Smtp-Source: AMrXdXtBbeH+ZaXZOnq96Ei2bJF3s4ZyM0k0lkiNPTScKXqcfHEVHc8v7Uqft1oLtnScRAJaxPzzaA==
X-Received: by 2002:a7b:cb89:0:b0:3d2:2101:1f54 with SMTP id
 m9-20020a7bcb89000000b003d221011f54mr36891279wmi.4.1672942152244; 
 Thu, 05 Jan 2023 10:09:12 -0800 (PST)
Received: from [192.168.1.100] ([178.197.217.234])
 by smtp.gmail.com with ESMTPSA id
 b22-20020a05600c4e1600b003d34faca949sm3211743wmq.39.2023.01.05.10.09.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 10:09:11 -0800 (PST)
Message-ID: <5b4d657c-1acf-f90b-be64-3e36cca96686@linaro.org>
Date: Thu, 5 Jan 2023 19:09:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 02/14] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, broonie@kernel.org,
 lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 robh+dt@kernel.org, agross@kernel.org
References: <20221223233200.26089-1-quic_wcheng@quicinc.com>
 <20221223233200.26089-3-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221223233200.26089-3-quic_wcheng@quicinc.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 24/12/2022 00:31, Wesley Cheng wrote:
> The QC ADSP is able to support USB playback and capture, so that the
> main application processor can be placed into lower CPU power modes.  This
> adds the required AFE port configurations and port start command to start
> an audio session.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  .../sound/qcom,q6dsp-lpass-ports.h            |   1 +
>  sound/soc/qcom/qdsp6/q6afe-dai.c              |  47 +++++
>  sound/soc/qcom/qdsp6/q6afe.c                  | 183 ++++++++++++++++++
>  sound/soc/qcom/qdsp6/q6afe.h                  |  46 ++++-
>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |  23 +++
>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h      |   1 +
>  sound/soc/qcom/qdsp6/q6routing.c              |   8 +
>  7 files changed, 308 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> index 9f7c5103bc82..746bc462bb2e 100644
> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> @@ -131,6 +131,7 @@
>  #define RX_CODEC_DMA_RX_7	126
>  #define QUINARY_MI2S_RX		127
>  #define QUINARY_MI2S_TX		128
> +#define USB_RX				129
>  
>  #define LPASS_CLK_ID_PRI_MI2S_IBIT	1

Bindings are separate patches. Please split.

Best regards,
Krzysztof

