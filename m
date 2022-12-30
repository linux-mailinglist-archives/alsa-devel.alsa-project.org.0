Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A935B659618
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Dec 2022 09:09:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD4BB17B6;
	Fri, 30 Dec 2022 09:08:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD4BB17B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672387771;
	bh=pZ2ZnkDieZF62XFXyycNzLFmps5YeqSJf1FfCPkAEaA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rG7xHJnUyvkwTIOUaSPRaDiQuO1N8JMt7yVhnXLJaxl81XtWurHH4J5wGcApEV1R8
	 Io/QuwZuIpP9CfplaXJaeaNb9iDiKHbAVP5HHHEQnx5IKbd+z153k0zS0MUm+veFuO
	 KlQlx5ZTeGVEtzTC3zDzL3/koMBvdBXdvKNDYxpo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29F10F80310;
	Fri, 30 Dec 2022 09:08:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C119F8049E; Fri, 30 Dec 2022 09:08:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1D25F80310
 for <alsa-devel@alsa-project.org>; Fri, 30 Dec 2022 09:08:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1D25F80310
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gcQi1AjR
Received: by mail-lf1-x12e.google.com with SMTP id bp15so30803921lfb.13
 for <alsa-devel@alsa-project.org>; Fri, 30 Dec 2022 00:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qZuUPPj7POQgrgUmQr0W44coDKoeQ+r4sHxkONGBEbo=;
 b=gcQi1AjRCRn0NUKC9qb1Lxm3ZX3cooPwQ0vv7LWza7T9fSIfpwbAFvDwGjXZZ/UM5+
 iWw8rLFaPnauTg3x8EAuk8EqYj51wHLdrv2B5lb7ukwnjBeCtQSCv3/It0AM39c1EHFJ
 AqxFb2a/6etdbc5UziuZZSNueKJ4uBe0zdU6urtjk3b3mDYDASMKng3eaLKJh8p5p0LU
 83volJT0FNUmMCCbwGxoH/6AeFs08P55kPZRFsAu9kR2NI1AEbh6uLubHO/b8x0CkVnq
 rxI9oWOU9xx6+aVdu7idMmC3DLP68NeRhPGQ8MiTjekZRjPDtuHbbJKNdVg+6TAt0wDz
 aaWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qZuUPPj7POQgrgUmQr0W44coDKoeQ+r4sHxkONGBEbo=;
 b=21LYK2xdd8HSo2xLnemUfp+KtdNZwhFb4JTDRr/4GVStYxfzQ/PCFsgZKM6HC/IDFP
 DERGijPMu1N9mpQycl9uiGJmwZnNTZigYZ0+n2X+rFhg9sHPfK1cPu2Olx1+A0mnGRtP
 uCuAS/oabDG+dRe/el0XwQA2M7//iHuiEKTls1J6rU3d1WIs1Ibw4w51qL4b9YNwYF/5
 e/ShstDuhB3CRgEhcJ63QJifVeCTVqmepKAFGsqbQVMWXB5o+lY25TE52Gb4lPueFItr
 essTSWmKL9yR1Pa/GuLD3yPncVJ6TUMLnxMjQJ43xUodTzKVAQfMSs9kcvrEWXtKPTk/
 FT0w==
X-Gm-Message-State: AFqh2kpNyaCtwtHpwrFj8uU1yZ7e0svGHavU1YPCzk2Y8OsDvnpYCHs9
 5e/pzTmIsi5XchdqGioOobFHFA==
X-Google-Smtp-Source: AMrXdXt2dvOLFZXV9QC0OXYs6SE6Jvai4T8mNKAEwswxW7IRGJJWozZmK0quXrerlcKLULgfRmjyKQ==
X-Received: by 2002:a05:6512:4002:b0:4b5:637f:f1b0 with SMTP id
 br2-20020a056512400200b004b5637ff1b0mr9675274lfb.2.1672387702887; 
 Fri, 30 Dec 2022 00:08:22 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a056512054400b004a9b9ccfbe6sm3396021lfl.51.2022.12.30.00.08.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Dec 2022 00:08:22 -0800 (PST)
Message-ID: <9b37ca5b-b28a-f5c0-661f-3c7168439470@linaro.org>
Date: Fri, 30 Dec 2022 09:08:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: apr: Make
 qcom,protection-domain optional again
Content-Language: en-US
To: Stephan Gerhold <stephan@gerhold.net>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>
References: <20221229151648.19839-1-stephan@gerhold.net>
 <20221229151648.19839-2-stephan@gerhold.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221229151648.19839-2-stephan@gerhold.net>
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
 Banajit Goswami <bgoswami@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, Rob Herring <robh+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 29/12/2022 16:16, Stephan Gerhold wrote:
> The protection domain functionality exists only in SoCs starting from
> MSM8998 [1], while the APR bindings are also used on older platforms.
> 
> Commit 41288c305836 ("ASoC: dt-bindings: qcom,apr: Split services to
> shared schema") made the "qcom,protection-domain" required but it
> should remain optional to avoid dtbs_check warnings on older platforms,
> e.g.:
> 
> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb:
>   apr: service@3: 'qcom,protection-domain' is a required property
>   From schema: Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
> 
> [1]: https://lore.kernel.org/all/20200312120842.21991-1-sibis@codeaurora.org/
> 
> Fixes: 41288c305836 ("ASoC: dt-bindings: qcom,apr: Split services to shared schema")
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

