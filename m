Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CDA6FD89C
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 09:52:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACE6F1041;
	Wed, 10 May 2023 09:51:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACE6F1041
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683705146;
	bh=z8t1CGAGZOY2rngVKp5EzbSbFRUaz37i7Qo6sm3ulT0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=roP+Gu+/XiV7LSnpzYr9oFxMyb/blEoA+Y9ImMKqnvP6B2r50AFSKFU/Tl5cajMEG
	 KDVzNHMSpoD5daBxBIR1rNHPrDFtlgHux2CM4b32BEpmnTcVt0R/z6bnoKg41q76PF
	 cXcYdGj0ADrHon9efKHno6DAQDa2k/6RXU/w0eos=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55941F80551;
	Wed, 10 May 2023 09:51:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 211ACF80552; Wed, 10 May 2023 09:51:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E4FBF80549
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 09:51:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E4FBF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GXpSk4Fy
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9659f452148so1214742866b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 10 May 2023 00:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683705063; x=1686297063;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iW7mIjsbeTQgdo4bUMRJvZS21aehBrTgArVIcYbQGoM=;
        b=GXpSk4Fy8gpUVPJnIaKxcZC/u9hWbLTYWvWqlDbTyPJPbFs+Ye8DazCVFswRLh9//O
         XfcpfcIyIqT80xWgGEZ6CneWja769c72qEJQBaSr5UyzZzb0csNnQPoVr9A71nQOh+B/
         vuVOU782ZXln4eWYhEzuVrd5bwsvuPcPuIZVkdtjyRhuWlg7nK+F6CEr2mcZF1lzZ99t
         FUPHwWI+/AEwDvOtRq8dYsHFhRsBf8vUa9AuXYaeAP3s7iE087Xfc8/Kwdd9ecmIrqM5
         LiwAKP3bIQ37GPDupGZwYj83utKlxueZgHHgi3wF4szHq5zw5aI7WLcbmjc4Nat/oNlf
         0uMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683705063; x=1686297063;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iW7mIjsbeTQgdo4bUMRJvZS21aehBrTgArVIcYbQGoM=;
        b=lj8AifOnYI1pch2WJKsDs44qxiqbi+UCMmxj3nXo442Gh6T4WE84LT/NfVE87VQRzY
         4QfVCQTm885daXEayivmnv32itvB6Y5O00pDbHBdVbu/cJNgJccmzwe2N9aEct0vR1Ig
         MggD4I1igducK1Cz2UdB+wVA8RlEbtHE27g40NXY69S2GxQIpfC04jxotKc9ODmzVhyV
         bTIUsgDILkj9YwuF35X7NtEWBpFMwJVdwLv6ej13hmkY+fYj3EWqI9BJBYuq/Og+G+ZI
         Vin4ZGxy5eqBL/+yT5IbEHrt8BNhfqA8Jz1bv5Y8SgEViwxtPDkd2q8zAmn7dEawTU3Q
         cYDg==
X-Gm-Message-State: AC+VfDznZBPijlOc3Er4fM5l33HRJ+8ig61OKSgYUhDrEXqi5MqwpfkQ
	8eu2PvVStjRqNO5Sey6odJjt+A==
X-Google-Smtp-Source: 
 ACHHUZ7nbBgYEcv+qxcIJPx7vRKcuVTcXzNbXan5YR4QkBuj6NlqgkqEsNt58tGSuzwTXu6/V9z9Qg==
X-Received: by 2002:a17:907:2d9f:b0:969:e55f:cca2 with SMTP id
 gt31-20020a1709072d9f00b00969e55fcca2mr5883240ejc.38.1683705063246;
        Wed, 10 May 2023 00:51:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d?
 ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id
 gv28-20020a1709072bdc00b00965cfc209d5sm2353400ejc.8.2023.05.10.00.51.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:51:02 -0700 (PDT)
Message-ID: <7b8c22e3-75c1-8803-fb32-097d12fbde78@linaro.org>
Date: Wed, 10 May 2023 09:51:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add adi,ssm3515 amp schema
Content-Language: en-US
To: =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>
References: <20230509163828.86003-1-povik+lin@cutebit.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230509163828.86003-1-povik+lin@cutebit.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: APMGJA34SZBDNH3XBG2WPJPXRDO2HYBR
X-Message-ID-Hash: APMGJA34SZBDNH3XBG2WPJPXRDO2HYBR
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: asahi@lists.linux.dev, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/APMGJA34SZBDNH3XBG2WPJPXRDO2HYBR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/05/2023 18:38, Martin Povišer wrote:
> Add a DT schema for the SSM3515 amp by Analog Devices. It's a simple
> mono amplifier with digital input.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>


> +  reg:
> +    maxItems: 1
> +
> +  adi,ana-gain:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
> +    description: |
> +      The value to be set in the ANA_GAIN register field on the codec. This determines
> +      the full voltage span of the codec's analog output.
> +
> +      To quote the datasheet on the available options:
> +
> +        00: 8.4 V Full-Scale Gain Mapping
> +        01: 12.6 V Full-Scale Gain Mapping
> +        10: 14 V Full-Scale Gain Mapping
> +        11: 15 V Full-Scale Gain Mapping
> +
> +  '#sound-dai-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - adi,ana-gain
> +
> +additionalProperties: true

uinevaluatedProperties: false instead, so users can have name-prefix.

Best regards,
Krzysztof

