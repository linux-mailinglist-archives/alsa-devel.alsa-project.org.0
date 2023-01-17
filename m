Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D4066DC62
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 12:29:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D665669E;
	Tue, 17 Jan 2023 12:28:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D665669E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673954979;
	bh=HtwUr3fctduzi7KooAZ2/J/+7UYQgi2zKghEHxuGUqA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=I0ABxPiO77RVSa27mYobSxKH/jq6m0CMHUogUVbd/hSlJYjiUJMHQyw4GGSzQ0JhQ
	 hMMGI6iI7AijtU6Th0QJkSUyQ17gegIOuQXmcGK1qgKK4Ih4p+86qUtszY1DG0O5/6
	 wqQTl7dMDlWo/dVlAP9cqopYKJpGlyc9JRnEpQcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ED4EF80083;
	Tue, 17 Jan 2023 12:28:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9BA2F8047B; Tue, 17 Jan 2023 12:28:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BE77F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 12:28:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BE77F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GhTYI1bo
Received: by mail-wm1-x32c.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so25575309wmb.2
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 03:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b7QySS8sX+rCfEVcFiwHdK87drcPLIRv7jTR3Ef+m7U=;
 b=GhTYI1bo1NtfTix5Cyo757ae2aRDocMqQr9D60ev6QWvCm4a5eV+2io6PjGmnMDZEk
 PWZsbPnsy8EBab75YCi86Fg8/DokN6jhraGvl9gn642eLGsOJzpD9OSTBckznQHTHVtG
 DLG8HK+bKJX59+/4H2tkvP5oVERBJiyL7hxxEx8jl/VPHJWDDEBpMvCpg9jie7+nQ5CE
 HXknNfPRRNtdC4UKN4ZLpqNDImcg7KJluYQqOBTbRx70xc1I3hygkT2Wr/qiaYGfN7cd
 mx3qr37/gcsYFm91tcOCIs3MeR4/SEwlHsNAvoUHXgETjDMGrX2y8ToLIcV+i7WILo2g
 8FbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b7QySS8sX+rCfEVcFiwHdK87drcPLIRv7jTR3Ef+m7U=;
 b=n4QakLwluU3GpuzuFtmdmGWppeXBcBEbbaGFz1qblQTkqo2DrpJtYGBRMCNqSuUQJo
 EY3eHmBWvB0LDqR3d8dou8pD8ddo1OAJwCOMpeitH0FS9Fp4Sb0YRCbpA90/Z5MLkpdb
 Ljy79pRCE2ajXsK77EyJL+JxZ1hxaBjD2fJq+xFKSOOYz10eii/R2ktmKz0jVMttdepU
 gGjtOigweICwpPPQCeDmJSZ5g6t0ksyLIQhXKwX5hLgzFn81q/+X17urxr9bdIk2vxkt
 IpFfVcwDOoqbzKicfdGySk2Kxx0CUivgdyylS0x75W8cBLqZi8t3VR6JKLYguUd/XPOQ
 tCyw==
X-Gm-Message-State: AFqh2kpXQrjGNRpHK0RFwbip+4mmQ9fhDwwHWpKeet/HdkToxGHgC4CA
 HqTAaO+5eUneU78YlHWYazDpRQ==
X-Google-Smtp-Source: AMrXdXtLnHaHuaeFv5L3Vh+VPC3Xb4+iZJCGtmnWJmdoM/jdqpG02sq79R8ekQkcRR1GCybLYG6nQg==
X-Received: by 2002:a05:600c:228d:b0:3d1:ee97:980 with SMTP id
 13-20020a05600c228d00b003d1ee970980mr2748366wmf.7.1673954907271; 
 Tue, 17 Jan 2023 03:28:27 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 c6-20020adffb06000000b002423620d356sm8398144wrr.35.2023.01.17.03.28.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 03:28:26 -0800 (PST)
Message-ID: <6e1a2182-ffbf-5684-dd2f-e3b862ad6763@linaro.org>
Date: Tue, 17 Jan 2023 12:28:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 01/10] dt-bindings: soc: fsl: cpm_qe: Add TSA controller
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
References: <20230113103759.327698-1-herve.codina@bootlin.com>
 <20230113103759.327698-2-herve.codina@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113103759.327698-2-herve.codina@bootlin.com>
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
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 13/01/2023 11:37, Herve Codina wrote:
> Add support for the time slot assigner (TSA)
> available in some PowerQUICC SoC such as MPC885
> or MPC866.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/soc/fsl/cpm_qe/fsl,tsa.yaml      | 260 ++++++++++++++++++
>  include/dt-bindings/soc/fsl,tsa.h             |  13 +
>  2 files changed, 273 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml
>  create mode 100644 include/dt-bindings/soc/fsl,tsa.h
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

