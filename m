Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FD769DCD4
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 10:24:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD94FE92;
	Tue, 21 Feb 2023 10:23:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD94FE92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676971484;
	bh=9bDgLTorDx+TnEnuyLBPVsgDFXo3m2VScQOdwuKRczc=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KVIbn/UgdMgiECI+d8jTn0Rz0i6v6XuxDx9JVslLvux2jXsy+GX1FDEezZlxvKnnG
	 DYJuyhzONkV/BgOlZ1ShfojPQpbyG/Cd/4fRBIAieDZJiHAH6FzR0XJvCV70PtcSuY
	 JJYauVAFbFhOBPUpa11ePWyzBhljn7FNmi4eb+kc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51354F8025A;
	Tue, 21 Feb 2023 10:23:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFEC1F80266; Tue, 21 Feb 2023 10:23:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 685FFF800BA
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 10:23:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 685FFF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WcNxXJgO
Received: by mail-ed1-x533.google.com with SMTP id cy6so8886834edb.5
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Feb 2023 01:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fbTzQmBbVkw2WG9RX4zaVnIA7NHcDhVJSDn4uazMha8=;
        b=WcNxXJgOyoqCc67id0lYZ4CTspgI/DMh4vHE66IHil5A1QL/Sws+BnpfRV8jnxR9Ix
         HK1DyCxKbxDj3p/MPxe0HIHIElhmfM9FClpRwSk8aLLoHV7oL0H+2xqa0mUaaf964fB/
         +VcavxxMzJaSWGpXxpyABv2JYSLsr8mItxmRGKfSybSiFENIP6xIbQLGQQzeWw6DzP4t
         RqOJLhdxMEYBZf34IhVkppik8aRYEyzDm7cr4jOjS4tbK6gM8JRCyD7EWR3OdqfSq1Nd
         WZ40bXgSeB35rPZq7T5g3SlA4q3d2jc1AoTcoOlIZcfbh12J2jbDKkfk0tXb4J1JmlQS
         AJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fbTzQmBbVkw2WG9RX4zaVnIA7NHcDhVJSDn4uazMha8=;
        b=yxn+XgK3vQwke4EKQCnxcwzqsuiajsHcwPVchXI1IYVboPgZhT1DbeToBl0ppShDtu
         NNMdZMyjN2wnYDfspTinFxqY+2k8tWauzeZfXnR2X28peuDiyAcIKKLd9I9bzFO+goe1
         76cu+IOUmWxFwH9TkChtHBJxrgojc2yjM0m91KdStoCyc04gR+SIDOaSeLSIyPL14ZbV
         XiJmjzIqOKa3qNEwpW0FWSMQt8ZR+o50UtqTfsz0AFNFS7hd0bORgb80L+FOi2r4yxz9
         BrSoMial7/UF1zfvqERApEnJpqCFoNaxibxTKnnI+5FuyjRl5v9s+kJt9nUdQmKk5l6y
         kNWw==
X-Gm-Message-State: AO0yUKVTO2AAsvXN0bpxG6cXA3fYM2+ZJb0ZGs4WkGHXt4V5LBbJK6Lk
	ejY8qm7/VjbkYWu/JOXc+ydppg==
X-Google-Smtp-Source: 
 AK7set8KQ6AMSa9DTyyfQ/QxgDiwki3JQ/hgmlwOWKJPZgURwegSKc0oEy44DyZ6U98clGYb22w9bQ==
X-Received: by 2002:aa7:c552:0:b0:4a0:e305:a0de with SMTP id
 s18-20020aa7c552000000b004a0e305a0demr4899297edr.19.1676971418212;
        Tue, 21 Feb 2023 01:23:38 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 t21-20020a50ab55000000b004acce817ab7sm1624262edc.2.2023.02.21.01.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 01:23:37 -0800 (PST)
Message-ID: <cbe2e397-7044-277d-08a8-93010de339ad@linaro.org>
Date: Tue, 21 Feb 2023 10:23:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: sama7g5-pdmc: add
 microchip,startup-delay-us binding
To: Claudiu.Beznea@microchip.com, robh@kernel.org
References: <20230217124151.236216-1-claudiu.beznea@microchip.com>
 <20230217124151.236216-3-claudiu.beznea@microchip.com>
 <20230220225601.GA545317-robh@kernel.org>
 <69c4eccd-9d81-ac0b-802a-8e4e0d57589a@microchip.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <69c4eccd-9d81-ac0b-802a-8e4e0d57589a@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7LFJA4JOAWLWNQP2OCFG7MP6A4XHBIWG
X-Message-ID-Hash: 7LFJA4JOAWLWNQP2OCFG7MP6A4XHBIWG
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tiwai@suse.com,
 Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7LFJA4JOAWLWNQP2OCFG7MP6A4XHBIWG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/02/2023 09:10, Claudiu.Beznea@microchip.com wrote:
> On 21.02.2023 00:56, Rob Herring wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On Fri, Feb 17, 2023 at 02:41:50PM +0200, Claudiu Beznea wrote:
>>> Add microchip,startup-delay-us binding to let PDMC users to specify
>>> startup delay.
>>
>> The diff tells me all this. Why does this need to be per platform?
> 
> PDMC can work with different kind of microphones, thus different boards
> could have different microphones. Depending on microphone type the PDMC
> would need to wait longer or shorter period than the default chosen period
> to filter unwanted noise. Thus the need of having this specified though
> device tree. Would you prefer to have this in commit message?

I believe you also had explain it to me, thus as you can see having it
in commit msg would spare you two questions...

Best regards,
Krzysztof

