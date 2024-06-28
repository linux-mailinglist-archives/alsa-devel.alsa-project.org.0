Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D1991B6E4
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 08:17:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9404210B;
	Fri, 28 Jun 2024 08:17:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9404210B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719555475;
	bh=l7gsLp5MjVP+M2ZyjhkH26uqU/8io5Y0iOIiXhbVAnM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sO1OOMkpc0Dx5LZBL2y1UBVDWqibubndIhT7+ScH1FpFEp4tS8iF+T1M0Bl9HvNS5
	 TwLJYu5wF7p+NSRKotAX+Cd2spYHXydkmAhq+rsD3ZnbIrfsquVcsqzdWcHDkJ3hDb
	 TZHpQM0VzuKORPOQUr8EGajGBJDDHXVUFNOQoDtU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41872F80619; Fri, 28 Jun 2024 08:16:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C8A1F805D3;
	Fri, 28 Jun 2024 08:16:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE24FF80423; Fri, 28 Jun 2024 08:15:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6515EF8013D
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 08:15:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6515EF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ufKCslKs
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-367339bd00aso198723f8f.3
        for <alsa-devel@alsa-project.org>;
 Thu, 27 Jun 2024 23:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719555322; x=1720160122;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AtUb5OQN/rCaRa+K3+Qo1zvtzQ8MrCKt+xQVUJDy3Ew=;
        b=ufKCslKs+aRMElKmGt2eLlqIAKaFn9N6iGc0WtD15pRjrFdsYEczltFhGvVyy+cU+e
         7zcWa1daAf7epym8KUmmAARLEEuhwIf4BxGuvLS4JQcZpLtM9q6Ps8VKar/JV01Gq5fK
         ySpYwGX4SvUH9ELtxoN5eMjU7r4gQ4UgTdOmaBpOEx0uoB+Eh3dis3wVjw+/wIsPhXHj
         xbGdx1BcC706Es/kpnWRmDU8Jlhwr+hQht98r4CtcQVWQO5Jv8ee4WGohdq4XAV+dtW7
         p1XsypUwTk2LeadaD/T6s80Rz/6PelTutWDgc0rZlfj/MmldEJe5CNRHw1bGhIi/BPqe
         ImTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719555322; x=1720160122;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AtUb5OQN/rCaRa+K3+Qo1zvtzQ8MrCKt+xQVUJDy3Ew=;
        b=Qf8W/WOktMTwBSOPZ78Fdp2Qid3qCahc016Cmzcfk9054XdCJaULiVYp5BHOWYS3Hi
         Tg1uohHK4dPolNLNEzSm12ZNogUXy6Kz9s/hL6bEIupwUO23aoAPZ+xrtIx4N/wRdwOp
         xrF0LgL+gHMRqY3caeMKMAaxnpeJQxuMRjoFJ3uCEHmJNH9/ssiR4VQI3Dx+0HrXewu2
         64ZySO3aJlZrgWr47cnMUcNTMtSP7T7Uk+ut/s5qIu2gXwZr1RYmcnMOjOVfkN7xyd3m
         scT5G1agpq0Wp7UYMN3BRBYTDogcQCmwUcoq8agcPEDEG2Axs2CxubxcXesjt08cgtIk
         7nng==
X-Forwarded-Encrypted: i=1;
 AJvYcCURADNJxzUKDTqh+XEKZ3QFGD4wFQWRDTvblfWdvYXExJVE7Ok3MjluKE1/Se2o3rrUBITh5rTBuStdS+Dc2MJqOtkwjqYaAxM9QMQ=
X-Gm-Message-State: AOJu0Yz0RUtBEUgaVEqBHelC70Iop12Qqm4+fT3VY6Nk5WMIIfb8TojT
	YnYgiGWvHKw5yUjXc7LWNHIBxtFnmNUskVmSs8/qY3gHQdqkOAlFtrE3oZCdOd8=
X-Google-Smtp-Source: 
 AGHT+IE2QoQjlin+H5o8GTIG1qWNDbgtelmMLz2cdWhmBexcriO9gnaQbsPO7pk+8IYqza/O8cphCQ==
X-Received: by 2002:adf:f006:0:b0:35f:e0f:69a6 with SMTP id
 ffacd0b85a97d-366e9495cd7mr10154059f8f.27.1719555322104;
        Thu, 27 Jun 2024 23:15:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0cd72asm1227673f8f.10.2024.06.27.23.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 23:15:21 -0700 (PDT)
Message-ID: <9b723a41-26ec-41f4-92b2-801db79c6023@linaro.org>
Date: Fri, 28 Jun 2024 08:15:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] ASoC: dt-bindings: qcom,sm8250: add
 qrb4210-rb2-sndcard
To: Alexey Klimov <alexey.klimov@linaro.org>, linux-sound@vger.kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, lgirdwood@gmail.com,
 broonie@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, perex@perex.cz,
 tiwai@suse.com, linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, elder@linaro.org, dmitry.baryshkov@linaro.org,
 caleb.connolly@linaro.org, linux-kernel@vger.kernel.org
References: <20240628010715.438471-1-alexey.klimov@linaro.org>
 <20240628010715.438471-2-alexey.klimov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240628010715.438471-2-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: U7VXT7A3G5PQPIWAJWPXXYRVYIVCI7FO
X-Message-ID-Hash: U7VXT7A3G5PQPIWAJWPXXYRVYIVCI7FO
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7VXT7A3G5PQPIWAJWPXXYRVYIVCI7FO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/06/2024 03:07, Alexey Klimov wrote:
> Add adsp-backed soundcard compatible for QRB4210 RB2 platform,
> which as of now looks fully compatible with SM8250.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index b2e15ebbd1bc..a92ac8501138 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -31,6 +31,7 @@ properties:
>            - qcom,msm8916-qdsp6-sndcard
>            - qcom,qcm6490-idp-sndcard
>            - qcom,qcs6490-rb3gen2-sndcard
> +          - qcom,qrb4210-rb2-sndcard

Looks like fully compatible with sm8250, no?

Best regards,
Krzysztof

