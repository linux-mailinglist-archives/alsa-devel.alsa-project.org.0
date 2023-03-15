Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F33956BB8AC
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 16:55:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91D051578;
	Wed, 15 Mar 2023 16:54:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91D051578
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678895712;
	bh=sg2Bqz34h1diugWiWKrTrqn8j65b21iO6n6T82pTj8Q=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WGLjo9v6dG8yrRumGXO2YunKikqFWl5xVSZThfOVL0ROMRnbfzUvgH86qHth2vtH0
	 LcgRFVQEEqt2KkVCnFSu+SpMWxfuprd34cVVnNll22jiaMKD/yYzaA+LDubgs7pAzz
	 b7RMw+9MT0S+iX6BgDLMpyOOfk6ACcZgODP8uj9w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71050F80529;
	Wed, 15 Mar 2023 16:36:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F457F80534; Wed, 15 Mar 2023 16:36:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 14557F800C9
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 16:36:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14557F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wZtr5rdr
Received: by mail-ed1-x533.google.com with SMTP id o12so77140402edb.9
        for <alsa-devel@alsa-project.org>;
 Wed, 15 Mar 2023 08:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678894584;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/PfFdLqQlHO8Vn7coAAbRy5YAeqgKAjwX0Cp4mK8Xw=;
        b=wZtr5rdrEmy3kiuMjnNYR1OJ2Zm9F8DBZgGEHbWb9+EL2QBHtrgIPi+wAFOddrXiyR
         coYYZn8BWYK7hwQseGLT4r6mZUtfj1p/ikXppe3VsnUD3Rq/VOLShpBr3bDPuYQiq7/6
         VfTmvJ3tvuEdVS+LkvCIMLU42HqMxziYiVifaWLkMjL6VK9D0EO1LSKpKlPo1BE9Ig7j
         32f9p6Rz1erDH98y1eNOCJ5NYgoVzmEgubqCKRGM6gkCFar7O8lj/2g8rUBWfrN3J/w0
         5Y3ScGoewHvO0k8HzDZ3SdbClOZn07aNG4gTGXrSvEevp5XxWacfsjcSfpLoM5fUyY9h
         Lfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678894584;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/PfFdLqQlHO8Vn7coAAbRy5YAeqgKAjwX0Cp4mK8Xw=;
        b=DR8g5LwomgNU6NCXB+ZGydr9K2Yov2uHfX0P3JILifKttc46lGEtXZ8MDhBmW2AmAL
         JYJqorxPX8MtC7/sBUXpMWKqt3knZe0HGSEGKxZjzJDNC8nWoDbUi4I2Y7OoouxjvyIo
         VS9UxQBY+UCDNSaxiJbzrIJsPmOMGQU6XOeRYojG0xMzToVFpKQgl3Pg8Kd7Y3fylNsA
         ISQ1IdC/YuygzBXfYmS29+9N0Yn4f6qbG1vtYA7y1cRUIsU7IayoBZgMHou3FNQOJRdf
         wghtNEC2I41c5ozQbJ2Is+G7eqUPodPl/Kjv7XU+0RMwiJPKkrk/+GJrnYhdX5koU/78
         NSNA==
X-Gm-Message-State: AO0yUKXBmsdVa0Z/mm5iXq/APq1jnkOorPID4p/b8D0hBKoUEgiM2A7w
	O2IuJmE1HuJJ2N3yjs2LNeTppg==
X-Google-Smtp-Source: 
 AK7set8C5AGtQW3m6m+Ulvn+BoDnHFH/Tu0MDOm9ye4cpkeJ70y4GCB+IY2S3kcCdpAzpGHfCH4V+g==
X-Received: by 2002:a05:6402:389:b0:4fc:61a5:b9c8 with SMTP id
 o9-20020a056402038900b004fc61a5b9c8mr3104557edv.11.1678894584016;
        Wed, 15 Mar 2023 08:36:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd?
 ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id
 v3-20020a50d083000000b004c3e3a6136dsm2619502edd.21.2023.03.15.08.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 08:36:23 -0700 (PDT)
Message-ID: <01ee4307-cc8d-f327-85f4-585d4ffe4339@linaro.org>
Date: Wed, 15 Mar 2023 16:36:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v2] ASoC: dt-bindings: adi,adau17x1: Convert to DT
 schema
Content-Language: en-US
To: Vijaya Anand <sunrockers8@gmail.com>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230315000914.99083-1-sunrockers8@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315000914.99083-1-sunrockers8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FJDG22CTOHRDSE3NQ24DLCMSKMZ55WBI
X-Message-ID-Hash: FJDG22CTOHRDSE3NQ24DLCMSKMZ55WBI
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Daniel Baluta <daniel.baluta@nxp.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJDG22CTOHRDSE3NQ24DLCMSKMZ55WBI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15/03/2023 01:09, Vijaya Anand wrote:
> Convert the binding document for adi,adau17x1 from txt to yaml
> so one could validate dt-entries correctly and any future additions
> can go into yaml format. Add address and size cells to example to
> prevent errors regarding reg format.

Why this is still RFC? RFC means it is not ready for applying, not full
review, just some glance and comments. Some maintainers will not apply
RFC patches at all. What do you question here?

> 
> Signed-off-by: Vijaya Anand <sunrockers8@gmail.com>
> Cc: Daniel Baluta <daniel.baluta@nxp.com>
> ---
> Changes since v1:
> - added 'Codec' in title to clarify type of devices
> - put compatible devices in lexographic order
> - changed description of clocks
> - changed 'unevaluatedProperties' to 'additionalProperties'
> - changed node names to be generic

Best regards,
Krzysztof

