Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEC45BF931
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Sep 2022 10:27:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F19A74C;
	Wed, 21 Sep 2022 10:27:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F19A74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663748878;
	bh=GxLwzi7/wElSMXCDCnBBmEkbTssVazFVgTMgBa3hJOw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f1VrPWg/YY4w3GP7EUHFs7pVG+98PRsc2A7zkyIkBOCDH9kD1lFDUs0MiS8m/Daq+
	 NDInQw3JXMnoIh1PdK2c2ujB1qxFsnCWV0/Yoq7NgoA955WMmOJfEld+TrFmi7tdD8
	 Y6LABWQSitI+kuWME1m52NM6WPbvxG674l2Wwx+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4947F80425;
	Wed, 21 Sep 2022 10:26:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36063F80256; Wed, 21 Sep 2022 10:26:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F31ABF800F3
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 10:26:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F31ABF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="bak9Wbda"
Received: by mail-lf1-x12c.google.com with SMTP id u18so7941782lfo.8
 for <alsa-devel@alsa-project.org>; Wed, 21 Sep 2022 01:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=9KJJwj1s7Dp0oQBIoEw2O9tVMdNPTzRC2Bn8QNz1lZA=;
 b=bak9WbdaxzzxlosLYD5AgDCdwbWrSGFRBj9JCiZwg6CyAPVMBppsimakW+92rSRUjW
 xLnUTkDAnXwAS7d8G9NMEXZmgmvmODtiMw17u7dWdYZA/AqkiKVdSgjW9Lu9acj+mYDy
 kP+yGU89j0kZbhUlJIxfe7OeO4MQl5V6+DuBTTW34FhPKfBjZ21yz3hqZs19pxV7iQ1C
 EDhl5MZ2puMZtw/1MWfc3i1CRilaArwvUF7Q3ksLNAYYjtNP1BdqYy8lOTcxxL8HrwG9
 3vgDXl2tcJ4YVsFI/H8tSx6SzOpmtxswb6Ba8orsxC33J9tylEJ8uf4/Nx0KP3xMaxEd
 DXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=9KJJwj1s7Dp0oQBIoEw2O9tVMdNPTzRC2Bn8QNz1lZA=;
 b=iDepFu05qO5HpI6ZTQmPpb2yUdQgmSj120tJ/6HnK0+tgLqcJdHPitg+SQrmgQxRiG
 u8uLVIulNXC2Z7h0ibwqnvNKWvwPNwxNCbev2guEXEIzC1FsA6Pr9kWk7QGy2LWI6HIc
 bZPzIlOOnATiZciR2wrK975bREtFHQB17gKs4jAJMg8jiH4xvzroZPIuZVizDXHPPUrD
 T8eyDxruw4us1LvB6KKdUIlvev29B8wQebTQoR0DXSbN/R3rV2cQDGONX2VeR8n1Rc5g
 lSUYHai3HRvbbXKHJmwSzzBVGlmVBq+N9t7yHtayO0v2u+QCyN7V/s9eH8b+myJZh3DJ
 JzFw==
X-Gm-Message-State: ACrzQf1MXUHCoHG9MPJq6gtAK/DFIsaAJd2qZzC4E3RwxhwOK+nM09bN
 KGS7ddn5/8gQ6ecHmC4bBUp5zA==
X-Google-Smtp-Source: AMsMyM4QdzvfZZITqgLFRTgUk8vut+XtsP2NVx3OC2Rid6gZDVPdRIhc9BS39F0DfpmfaX8g4VaW4w==
X-Received: by 2002:a19:dc14:0:b0:494:82c3:e485 with SMTP id
 t20-20020a19dc14000000b0049482c3e485mr9523033lfg.542.1663748809789; 
 Wed, 21 Sep 2022 01:26:49 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 c14-20020ac25f6e000000b0047f7722b73csm334323lfc.142.2022.09.21.01.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Sep 2022 01:26:49 -0700 (PDT)
Message-ID: <f7d57145-0850-a2f4-ba18-9ce74dd53005@linaro.org>
Date: Wed, 21 Sep 2022 10:26:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 1/3] dt-bindings: sound: ti,ts3a227e: convert to yaml
Content-Language: en-US
To: Astrid Rost <astrid.rost@axis.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Dylan Reid <dgreid@chromium.org>
References: <20220921081834.22009-1-astrid.rost@axis.com>
 <20220921081834.22009-2-astrid.rost@axis.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921081834.22009-2-astrid.rost@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, kernel@axis.com,
 linux-kernel@vger.kernel.org, Astrid Rost <astridr@axis.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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

On 21/09/2022 10:18, Astrid Rost wrote:
> Convert from ts3a227e.txt to yaml.
> 
> Signed-off-by: Astrid Rost <astrid.rost@axis.com>

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.


Best regards,
Krzysztof
