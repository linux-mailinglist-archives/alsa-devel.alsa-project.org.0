Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 910846A8395
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Mar 2023 14:33:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8904F209;
	Thu,  2 Mar 2023 14:32:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8904F209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677763992;
	bh=FzgSbkNLgkaQ3YKmJiTEIpdhxfTG3WiuusF0aGr+QzU=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TcYRJsC+pt0gWhTPrmZ2SgyL+Coz3ody6TV2jQupG+QtRwEtho6biRxvvcUW/sp5q
	 PaVwe/+nL5eaMdAO0lZn9Sk6GCK8QS1fwpNCrpSFRhF9199jfn6ia5J/+osVLEKt3V
	 sZcCSPq3mS2HE6e/acb2Y/TN4n1JkVm2eIwZPRbw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DE86F804B1;
	Thu,  2 Mar 2023 14:31:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65E9CF804FE; Thu,  2 Mar 2023 14:31:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3086F8049C
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 14:31:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3086F8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YHV9vkfY
Received: by mail-ed1-x52b.google.com with SMTP id x3so4640070edb.10
        for <alsa-devel@alsa-project.org>;
 Thu, 02 Mar 2023 05:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677763909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pQfK7z1cF5xS5fOpKIQMzf1W9EJ2G3anNgIELaiZ9Bo=;
        b=YHV9vkfYEQ5XB5RagRNB5k0JDRHatmunEcxAGzm6oUMEOVF4goGuoImpehzDh98KzX
         dASgB5AP2AaumHEaPw1djqryok7FWg0hDiDLHX6TtwcCyhCKU9oR/UzPmwPzlt0aQDgz
         0lAK4zabgv+STpu9Ha/crrLFrOWpz3UwNf8dgWYeF3C1Lc8/ZXm0FzF/X9e6rVbFlXzW
         ZX7NanDIKJ1VsfUNSHwhIR1DxpmnMXy93YSc/Osbv/KamSTpgR/JITZGMMhos/PEa5C8
         F6WClSGtMYvtAsnEW8qyBc7yLtd/r1Sq5mLeXIzfqSauhFAgQmJW0jOgaKVDN2lrIKmf
         RZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677763909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pQfK7z1cF5xS5fOpKIQMzf1W9EJ2G3anNgIELaiZ9Bo=;
        b=0mArIVH+vd1IMvSeLzO4jnw0sRFJegG4rTLPwFdH/nW6zBq1iCt7HrM9K7MampSFmT
         Il/nGfasctTvHB6Mu2lUD1oU0CEIYHCMl3dYS2d5lxP5ungtK0Fsascz0aNngBb7FoI4
         NB4HLkAbOHQmZNpB0lIQ51IwVO4oxZoSNk3ggW7zyGlurllJp0ytxNtrFEYvHUtlRW9Z
         egJvbLE/JPYRfXtPZnZX1Imk+UmY4PGd1EStfRGOJB7lMFmBEN2Sf8Ouu7DAFdQCCmey
         BMIxOKhVtIhn/8qbCnmPzcG48sS01ALZKljjvG1+7Gcqb+vfQqBO1Jp+KkX9pAJ9wGOv
         33tQ==
X-Gm-Message-State: AO0yUKVVEXb0Fz1UiqLVonUkvVU1tdNXmK7vnN6eOPtP+PCPm43/DJTs
	dzvbGspFnTZMNGe5jg6vnQnUCQ==
X-Google-Smtp-Source: 
 AK7set/hE11XFsgkWSODqUZuAE6McTZ3VVe++bAR2CRMf/+3Je9cNA7pKsuG2Wvx1Mf6z9RFNKo8PA==
X-Received: by 2002:a05:6402:1acd:b0:4af:51dc:addb with SMTP id
 ba13-20020a0564021acd00b004af51dcaddbmr10658613edb.19.1677763908847;
        Thu, 02 Mar 2023 05:31:48 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 co1-20020a0564020c0100b004c0239e41d8sm771780edb.81.2023.03.02.05.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 05:31:47 -0800 (PST)
Message-ID: <53975f44-83cf-7942-ff2f-727a2d9a0bc3@linaro.org>
Date: Thu, 2 Mar 2023 14:31:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: maxim,max9867: add "mclk" property
Content-Language: en-US
To: richard.leitner@linux.dev, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ladislav Michl <ladis@linux-mips.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Benjamin Bara <benjamin.bara@skidata.com>
References: <20230302-max9867-v1-0-aa9f7f25db5e@skidata.com>
 <20230302-max9867-v1-2-aa9f7f25db5e@skidata.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230302-max9867-v1-2-aa9f7f25db5e@skidata.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RQ2USODQWHLSNNNI7I3DM723IJ2CX6S3
X-Message-ID-Hash: RQ2USODQWHLSNNNI7I3DM723IJ2CX6S3
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RQ2USODQWHLSNNNI7I3DM723IJ2CX6S3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 02/03/2023 12:55, richard.leitner@linux.dev wrote:
> From: Richard Leitner <richard.leitner@skidata.com>
> 
> Add clocks and clock-names properties to require a "mclk" definition for
> the maxim,max9867 codec.
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
>  Documentation/devicetree/bindings/sound/maxim,max9867.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/maxim,max9867.yaml b/Documentation/devicetree/bindings/sound/maxim,max9867.yaml
> index cefa43c3d34e..152340fe9cc7 100644
> --- a/Documentation/devicetree/bindings/sound/maxim,max9867.yaml
> +++ b/Documentation/devicetree/bindings/sound/maxim,max9867.yaml
> @@ -35,9 +35,17 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: "mclk"

Drop entire property, you do not need it for one clock.

Best regards,
Krzysztof

