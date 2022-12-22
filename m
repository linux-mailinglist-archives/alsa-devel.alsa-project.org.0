Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB35653CEB
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 09:23:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2512B3626;
	Thu, 22 Dec 2022 09:22:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2512B3626
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671697392;
	bh=5EkTd/yiyxVkxtbnkgYPmH6AR8rrZuwLISzumSGXlHI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KWk4aBv98s7Z0K50IWAez2PUA6tRlCkbaVBV6J2yxhJgz6Pwnqz08asGpJYaFZ1VM
	 QcN/XoX9bLpDN17webqJLUGEsmiYlud0Yn0J5uyj60lQYSZZx5yiKI0NVfvVjyIVFV
	 TpVFtFPCJkYhwnc6w5uEanDHUM1TNuEEUV4RCHvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9B37F80022;
	Thu, 22 Dec 2022 09:22:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DBB2F8025F; Thu, 22 Dec 2022 09:22:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EBF4F80158
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 09:22:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EBF4F80158
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=sK3G9nno
Received: by mail-lf1-x134.google.com with SMTP id g13so1633359lfv.7
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 00:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V8xj4W4AfLyt0Plm2fpuiknvRZurcRgUzKucmRtuk+I=;
 b=sK3G9nnolMDTk4qMTclOH921wTQ5gAutCdbF4FNSLnzmYz3BOPPYk1qF62y1YgRXqp
 DgDYSEhUQGAfq9xuXmoRw1EY+q5YeBKtnyhjiXnXXLIZVZi6q9m61iizO1dOiNzaIR25
 /SZvoRb8uILX7XjNjXc8iUVZEwgzNBCkR7LVxa1AzgHVqp7eKqMK0t1HOb1uoivtL/EL
 9TKvauhST1uD0Jz1SmtTSqNG0czEfkM+4vPPPCNntJRLEwFo8syP1kAfxhEAFzEeAwZT
 SJQws0LCbCUUAKzvq5KgTYqXaxXAx5CrvwUEpnwW6MXe0sWJGiFEARCBpxC1vCOX1iBV
 TBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V8xj4W4AfLyt0Plm2fpuiknvRZurcRgUzKucmRtuk+I=;
 b=RhwpBx+fM7hR1/NC4V//HFxkq3oEJa/vKpW0UQODNBMFTf711o6dV1ig15Fghr80YE
 Tr3uXts9k+ailbak+yaOSxS/pd0lWbGu1BbyOqU8kmvM45IH0Loz/iccYmtDou3xc3RC
 Y6RAxgtUUz74jqI7eWampVXemDihep/8w9X++ovaD+R5o6No1IJIgWpDyF8jx/pPXWZw
 qckg57XCsS0OqoG4Qep3JT6XIz1Ep+I1tTc4bA6HH46uRN+iUGcj7aMx/khuIxpVh0ya
 I+pJarftNOoUDV0JHRtd8fXWZX1j3iN5E+eyFMzcnYB91P+sZudoBLrUq2monaek1MqA
 PzPQ==
X-Gm-Message-State: AFqh2koDUJQlAD/l1ivUQLK5ia2j8EYdAAvY1mvMzeGG7Fk005OTgZde
 viV69qU8lVY3ei3jSbcddIOLHQ==
X-Google-Smtp-Source: AMrXdXv46dtJ8/0bd1GMpDX1GPrhizUp/3EDEr9v0cJkZ+OpGvvEINzxSQp2wiNGwdRJ7KtZgXjUxg==
X-Received: by 2002:a05:6512:23a5:b0:4b6:f027:2af8 with SMTP id
 c37-20020a05651223a500b004b6f0272af8mr1895663lfv.66.1671697326244; 
 Thu, 22 Dec 2022 00:22:06 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 j25-20020ac253b9000000b004b567e1f8e5sm2111296lfh.125.2022.12.22.00.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 00:22:05 -0800 (PST)
Message-ID: <7ee6e126-d4c1-bbe8-1dc3-8d33019166e0@linaro.org>
Date: Thu, 22 Dec 2022 09:22:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4] dt-bindings: sound: tlv320aic3x: Convert to dtschema
Content-Language: en-US
To: Jai Luthra <j-luthra@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221221145216.11400-1-j-luthra@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221221145216.11400-1-j-luthra@ti.com>
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
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 21/12/2022 15:52, Jai Luthra wrote:
> Convert bindings for TI's TLV320AIC3x audio codecs to dtschema.
> 
> The following properties are still found in some old dts files, but will
> be ignored by the driver:
> - adc-settle-ms
> - assigned-clock-parents, assigned-clock-rates, assigned-clocks
> - port
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

