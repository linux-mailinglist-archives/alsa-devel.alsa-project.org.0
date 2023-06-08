Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF3A727B85
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 11:34:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 486FF6C0;
	Thu,  8 Jun 2023 11:34:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 486FF6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686216893;
	bh=WlXBrXkeZY4XPCWDL4EhJKTT36HfU9AD032Pi+zKI6E=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Ok0odXgR5VgHv5w+r4wV5i4VuhZ+0OJ+OcXT9HSBi/VFeXrcgLRSos1CbGXiwdYhl
	 IsRW1KDdRHpi7DSHlGOWfzzKeqAPNJgdrXejU5g26MUi/FZxnqSI8p+7cgBDskySjh
	 bMM0HwJh29kZdw9jjbWaJMa2skwaql8aCbLGNcJc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0E37F80130; Thu,  8 Jun 2023 11:34:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95753F8016C;
	Thu,  8 Jun 2023 11:34:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 528EDF80199; Thu,  8 Jun 2023 11:33:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9682CF80130
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 11:33:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9682CF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mc9adXQt
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9741caaf9d4so64656666b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Jun 2023 02:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686216831; x=1688808831;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XHrWR78MCn7GOVO6jP+VpXAA4JR1qkGlYZ5kPs6LqkE=;
        b=mc9adXQtN6XersVDRhnlail8T5GQnruABpjREJFga4locj60fiGQc3DEbqU5rE+wM+
         IVIRmVKEaZcE4Qy9s6zN5jyiM9QHKBST+8n1uIFdlmXdHCsph6CS4JwZa2QvxkCwPDYl
         bgtCgFQr+DKjuEqmvhtdkzII9qvgdRM6Wlrxs4j4/Td7UTrfzQBbkrAghZH2zKTVKqPL
         e7UBB+XDwWHcqsGVNv+uuTGhzlK09irLgNNfQG3gdsSs+cPGMH9MIhio02yScsNjZVWw
         2eKHG9bnllb38SZ8PzHa8aMw5MKsP9G69/UdaO3HxfnpoWHAxItZy1qIiFx2AU71TI3f
         Xwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686216831; x=1688808831;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHrWR78MCn7GOVO6jP+VpXAA4JR1qkGlYZ5kPs6LqkE=;
        b=h6PlmcKKbJXRDkjkr+W/oE3+3RkSxIxXiggbd3y60/6TeRT33PfX4o21FazvJwm8Tt
         6SY78aJOFilD2RQ2Qi+eD/06AhHLFlMXuNP6Zsnl80MKVmXNAzArcOPac1c6v0h8WAef
         YYOaQ6gX+6/9iqmHahDPPoXCRANWGhs3oOtYwqdoqEuWAmuGvqX5hHQgaoVUBjblFzLA
         9h8YmcmVFbkCkj05GcGz62b3C2PkfYEYAWzcT78TaFEc2fV+vILFRexIAzofeo3alwMh
         UwG0SEQMTLIZioxDg5E03eVX/ab5dG8lqRSdeCxzn6kvUWoVY6E8YETmSZF8stcuCus1
         2w8A==
X-Gm-Message-State: AC+VfDzrNF0GvYwUAAjg8s1dIXUWkx3UUgIXNIIsf75SLKX3fqTxpuCJ
	+GZBubcq8c0QBnwTlanDpTLgrA==
X-Google-Smtp-Source: 
 ACHHUZ5P3vA07L3KTs1RTP07AuvxF1iv5HiPlvFkqBvOQIBmIKUDz+s/jbEEE098Oeua68HrGDx7TQ==
X-Received: by 2002:a17:907:6d05:b0:966:54ac:17d7 with SMTP id
 sa5-20020a1709076d0500b0096654ac17d7mr9357802ejc.76.1686216830865;
        Thu, 08 Jun 2023 02:33:50 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 oz14-20020a170906cd0e00b0094e7d196aa4sm443537ejb.160.2023.06.08.02.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 02:33:50 -0700 (PDT)
Message-ID: <e4cc5966-0af9-80cc-c01f-b33620717a1e@linaro.org>
Date: Thu, 8 Jun 2023 11:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,wsa8840: Add WSA884x family
 of speakers
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230608085023.141745-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608085023.141745-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: Z4ZKNHPPRSV2SF6K3ZUVHPFYNDBWBNTF
X-Message-ID-Hash: Z4ZKNHPPRSV2SF6K3ZUVHPFYNDBWBNTF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z4ZKNHPPRSV2SF6K3ZUVHPFYNDBWBNTF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/06/2023 10:50, Krzysztof Kozlowski wrote:
> Add binding for WSA8840/WSA8845/WSA8845H smart speaker amplifiers used
> in Qualcomm QRD8550 board with SM8550 SoC.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/sound/qcom,wsa8840.yaml          | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
> new file mode 100644
> index 000000000000..a999f787aa4d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm WSA8840/WSA8845/WSA8845H smart speaker amplifier
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> +
> +description:
> +  WSA884X is a family of Qualcomm Aqstic smart speaker amplifiers using
> +  SoundWire digital audio interface.
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: sdw10217020400

There is a mistake here - should be version 2, so "sdw20217020400". I
will send a v2 a bit later.

Best regards,
Krzysztof

