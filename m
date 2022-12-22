Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5926540A8
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 13:05:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2D69407D;
	Thu, 22 Dec 2022 13:04:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2D69407D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671710701;
	bh=gQZ1dC9nx+nmnFhlvnvj0LbMyg89ca2pOey9JSEGERA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PNK/A8qEjkI+JEphREqAzU3S22LdVYaxsWhbSVAq19F6e//ZAYs7gcvDsW3BePSQT
	 ZnJv4YWjS0dSTfZntmCc3cSagS7rcaM1vOhb6/LvPZuFN8xzQb3S81UG4DB4TTmtWs
	 cCu43BbOpqOoBCLywF0EmRHSNUOjcueDqqO9Kjwk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F800F80158;
	Thu, 22 Dec 2022 13:04:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC2F3F8026D; Thu, 22 Dec 2022 13:04:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C60A8F80022
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 13:03:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C60A8F80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=iSvMnFwR
Received: by mail-lj1-x22f.google.com with SMTP id n6so1651563ljj.11
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 04:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pv6qX3My3iKgcKC8fPRcBAdihPFD1OTlyTjs81HEvPg=;
 b=iSvMnFwRprHPbsiw/+zJY7fRsKjPP39B4vJ1CWjNOtgZXsGZINTugC1mS4nTX3NItT
 CyOmkAaudh4K3XTCSUR4POKmQAfAPwFw8A+/JYNsMfWwMZJdw+ak+LkKybk5a64X8C2q
 sQXuxwC5Y0TpZKkN9Irtj4FZv+V1lBthzlUopFMsoLU914ISCQ9ticD1YqELYen4pDGp
 d5hIQs9ow1An/h7tzAjm5ok8Z2DTtjQ9TeQVQz/AzES/ThNrh7SqfmLHxd5rsPzUJfAi
 S8+SIIhDZ5BXTKr4p6bERM+16BC1yKCS90OaUWggM72x7kN1FB9q5ZTHx5nc040e28Ng
 1wKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pv6qX3My3iKgcKC8fPRcBAdihPFD1OTlyTjs81HEvPg=;
 b=qU9AKPhFfhFmfdzJ7M6sW9ZH5SpEHJT+jmimyAlUvMyT2EyYNZ39J5xN9ihu1VgECy
 GDLwIjLI3lfRws/xv6dLOYfmC3l9h+TXvyOnnT+wDEXpYpzsRX/llnLB3W9zdo5CmbSj
 wF/e+5//n1jMO25pyK3TqG1HYtlQVicrRQFn9W2rh+FnENBcBtIqIklk0KGiHS3wCP5P
 12VCvHBmZoZMbcZ76PsdgdMWhpEHD3XAyjbxuVUxiSLWtVgQaEvZe6tFpg/Mm0QB061d
 X+Ts+wBVYG9rSkLaOJa0Ttn9Qgx8vdA8IB03sn9MEU0XwGQDuJ2BP1y2s8wE02QYh/9P
 Npaw==
X-Gm-Message-State: AFqh2kpJHIKW1sbiV0LGu7lRNwAC6ZrfVJfyh09thvMmCeflyeT+Dsv7
 GuCgGj2rkw5u/Wr/RGcu20GUdA==
X-Google-Smtp-Source: AMrXdXu24YdIUD1vSYqT1ow8qSxi/9t+oQUU4FKC7B9OlC6lUR2ntlD5a51LMAcbwZ2kQTKs1mwtNQ==
X-Received: by 2002:a05:651c:2321:b0:279:c27a:1335 with SMTP id
 bi33-20020a05651c232100b00279c27a1335mr1503443ljb.33.1671710637125; 
 Thu, 22 Dec 2022 04:03:57 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a2e88c1000000b0027f93fd606esm28977ljk.58.2022.12.22.04.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 04:03:56 -0800 (PST)
Message-ID: <e039f89c-41ca-8c7e-b755-9701a4571c39@linaro.org>
Date: Thu, 22 Dec 2022 13:03:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl,xcvr: Add compatible string
 for i.MX93 platform
Content-Language: en-US
To: Chancel Liu <chancel.liu@nxp.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20221222073618.1064415-1-chancel.liu@nxp.com>
 <20221222073618.1064415-2-chancel.liu@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221222073618.1064415-2-chancel.liu@nxp.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 22/12/2022 08:36, Chancel Liu wrote:
> Add compatible string "fsl,imx93-xcvr" for i.MX93 platform.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

