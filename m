Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B63D7686656
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Feb 2023 14:01:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40187832;
	Wed,  1 Feb 2023 14:00:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40187832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675256500;
	bh=pVYGNoOjinG7SrCWTecQYxGmZ7oqM0G+38edYB+oHHw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lQDb8k9zsHfgiKTW2YHCwyx3woLUk20oyAiWc58dxBVOzbgQP4X3fcWPL/7l8mAq2
	 nQuIKyd+8PBE41HBbhdjnQPBrA9Q5GWmdunL00OyfovHvNmPX2A4/7xTJLSboDxZ9S
	 JxqB0hlYE90S7jr5rNVK5LFtnXwtwAi2CjYaqSw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9CEDF8045D;
	Wed,  1 Feb 2023 14:00:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CF17F80423; Wed,  1 Feb 2023 14:00:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CF94F80155
 for <alsa-devel@alsa-project.org>; Wed,  1 Feb 2023 14:00:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CF94F80155
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=v5LDlYxQ
Received: by mail-wm1-x329.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso1335226wms.0
 for <alsa-devel@alsa-project.org>; Wed, 01 Feb 2023 05:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pVYGNoOjinG7SrCWTecQYxGmZ7oqM0G+38edYB+oHHw=;
 b=v5LDlYxQZ+bsz1e1EX5FJEj4EZhfjpQpGSYkTgoH1wvORyHsD3rKTwm7S9hHJKKpwe
 rR1T1oLcTFm24/bAFlm4FgJ1vw/8dZAwYAZtWPtmWUnctNe7OKvVkcOLRSKUxiz7lyb7
 mAPHkQKG4zpwXefdoS4al9fO0kWMWCkoUn6exxLT0XV43tMKiy3qx10BxanAbutKPJ/w
 Danr6n2+cNkbudmJYE4qXCWEd4mMYT6PYpwpriZddKO0bUPKr99DO4/qk1qqHWKt7l7V
 hER2nwnpXlxj/i1TOR7Pu3CeqpMyAxe3BP+HjwWkLdI4JU6d1srbH/UcCNUQYI71Vzgt
 Qvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pVYGNoOjinG7SrCWTecQYxGmZ7oqM0G+38edYB+oHHw=;
 b=ovIQOi1X3VAim+2VbQ74kvkj5jN4FJPgEe8qLFwA8HTNoO5F6eoUu48g03ALRZjLJg
 3ovv/1ExmRQaeXTvfke5Cv8DB+LwBJLtDcpDOAELBjvOEog0mxwvRo9hkCtuYb6k3+1E
 jr5SRJWjH1vgrBSD5EcC6CO+HWdExRHUtz60WuOfXxFIm3AvhN3Cc+zxIzQZV2Rd7dmz
 Z41YJLfqu4AFkvmDUYus66Da818WUp9xMPqdC9rafEdBw+5x8GFQYCR7gR7tpCgJePoy
 zcj9kRdYrzu8l9Ta0LeVxSxzi5zIPoZPofquyXEZ4NwJfNdseuQlukDdfufsQwlazOx2
 RUCw==
X-Gm-Message-State: AO0yUKWP4iAK/8XL6PbYz7mOnrgjx5QkWUSannKqUF93baVArEzOZeTT
 JOE4sLA2MrGtEurvRmwlqlnPwA==
X-Google-Smtp-Source: AK7set9g7b5Mfam7n/PRDNDBLuQhP05bAB3If4chbOznqTsU9vIBK2LesGlJ9dsAziXf80TwiCxTeQ==
X-Received: by 2002:a05:600c:3556:b0:3db:331b:bd57 with SMTP id
 i22-20020a05600c355600b003db331bbd57mr2022836wmq.23.1675256433672; 
 Wed, 01 Feb 2023 05:00:33 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 q4-20020adff944000000b002bfae3f6802sm17184325wrr.58.2023.02.01.05.00.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Feb 2023 05:00:33 -0800 (PST)
Message-ID: <9d29b6b3-c3df-6098-07b2-06daa8c6b3b1@linaro.org>
Date: Wed, 1 Feb 2023 14:00:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] ASoC: dt-bindings: irondevice,sma1303.yaml: Fix about
 breaking the checks
Content-Language: en-US
To: Kiseok Jo <kiseok.jo@irondevice.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230131050946.14385-1-kiseok.jo@irondevice.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230131050946.14385-1-kiseok.jo@irondevice.com>
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
 Rob Herring <robh@kernel.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 31/01/2023 06:09, Kiseok Jo wrote:
> Fix the bindings checks like syntax error.

BTW, so not only original patch was not tested but also fix was not
tested at all. This still fails next.

Best regards,
Krzysztof

