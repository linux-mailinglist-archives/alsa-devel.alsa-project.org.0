Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 849066E35CA
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Apr 2023 09:37:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E28DAE9;
	Sun, 16 Apr 2023 09:36:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E28DAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681630625;
	bh=gX4i3QlaYw43oc59+zIZaVL4odQMT5ZcGC1ZwbD7YhM=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CCBiBQN2VigTbmVbbLnuIHgWYjCgF7OPMxLPUA5mqTiLbibyofuUN3hjOLIU3rXPO
	 8XeyY5Sbnj57dVxmBmRWGRo+rocFBbbKj3kgjlSDQ2XlohwmK43H8HmVj2OqsMowjJ
	 74K858+CvFnnBSxX6CnR2PGKBnFn6Xyq5kIUJQRI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A422DF8025D;
	Sun, 16 Apr 2023 09:36:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0737EF80266; Sun, 16 Apr 2023 09:35:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 204EFF80212
	for <alsa-devel@alsa-project.org>; Sun, 16 Apr 2023 09:35:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 204EFF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vibBW6PQ
Received: by mail-ej1-x62d.google.com with SMTP id q23so46862066ejz.3
        for <alsa-devel@alsa-project.org>;
 Sun, 16 Apr 2023 00:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681630514; x=1684222514;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=icX7XcjgtMlnWNSDhGEw7WdKTxxAhEbhQfNXI8m76Y4=;
        b=vibBW6PQ+EaKqIBQq71PKTlnKp7fV//esgy33nWyejQ/ATRzkiffQiOb2/z+ONu4RK
         aNHP625triaHRYsSwC+Xf4dArh93XLlIA4k/h+yPKWplI06VgpR5KhV/G94NSbwjOwhL
         eYXntEANg/HhqtGjivvBviTfXdGPqNROivoz0btR4spOhwDuhGEFFF+wweIrJSU75Dpd
         sSMpwKQ4Jm+bfQ/8tP/JvAlaiktHtc4rqsCVb9yUlFhCG1uXfnqyOI6bYPljbzdeWmWf
         G7bWuv+w401tSV6xvPE5rn3mnmZZUONlcn7JfQxgD4vRkwVN99SSsAIzPXHrAf39Hwvg
         J09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681630514; x=1684222514;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=icX7XcjgtMlnWNSDhGEw7WdKTxxAhEbhQfNXI8m76Y4=;
        b=heH+pUAhm13jC1R5uEaY1HNnfwtzhJbaxyDR8DABa6wXdw1IYi3v5wL/tfmlpvC/aV
         EJcgFy2X36VfV/1oCgy0E+3QfTkwGcgrblPDFLREtxwtL0BmLygkXnPga6ulPUIPfPQe
         +BBLTSkV2hpIegbDyuN0C4/Zc44dSXCVga9JHYFNHUOCxkJNloKHxfmHebJ5SKLITKvF
         X8poqMVAK3mu1pZgxg1e0+oipiyS5vwZQD9wmQV44nyDNszEY2yGXR9kJpwJg9il/W+x
         qgy6rMQfFrvjwp4nrqRAy75FJEiySAWa0gN+TFcx0q/I+bsRUlLMuptclDnn43r9D0a2
         /qkQ==
X-Gm-Message-State: AAQBX9cDJ/W0AR1/XRNtyZAZpxHy4XC2YnhvI3DSTUs5NktUDSkVXbmM
	7E9phSzND3M/RDYvqjleLvXhHA==
X-Google-Smtp-Source: 
 AKy350Z6hU3qEZx11q55aIR3AL3dSOwTSbZgHQbm6OzEf9c10TYRQsseybowILHqI6LzRHRJnZR1ww==
X-Received: by 2002:a17:906:3e1b:b0:94d:69e0:6098 with SMTP id
 k27-20020a1709063e1b00b0094d69e06098mr4514622eji.45.1681630514005;
        Sun, 16 Apr 2023 00:35:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:29dd:ded4:3ccc:83db?
 ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
        by smtp.gmail.com with ESMTPSA id
 hu17-20020a170907a09100b0094ee4fc2840sm3141869ejc.45.2023.04.16.00.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 00:35:13 -0700 (PDT)
Message-ID: <92d0f4c7-ed53-5d84-3955-08d1ab8bbd98@linaro.org>
Date: Sun, 16 Apr 2023 09:35:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ASoC: dt-bindings: wm8753: Convert to dtschema
Content-Language: en-US
To: Saalim Quadri <danascape@gmail.com>
References: <5d629ff3-c5ae-bd00-e70d-8c0d58365ce3@linaro.org>
 <20230415201246.1200683-1-danascape@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230415201246.1200683-1-danascape@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HWUQ733ZIP5T5DSL5PD765E26M6OPI2B
X-Message-ID-Hash: HWUQ733ZIP5T5DSL5PD765E26M6OPI2B
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, broonie@kernel.org, daniel.baluta@nxp.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, robh+dt@kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HWUQ733ZIP5T5DSL5PD765E26M6OPI2B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15/04/2023 22:12, Saalim Quadri wrote:
>> You choose unusual bindings to convert to DT schema. It is fine but
>> honestly, less useful, with limited impact. This is an old, 12 year old
>> binding without users. Maybe it would be even removed by now...
>> I suggest converting ones which have a real impact - have users in DTS.
>> Otherwise you will be putting quite a lot of effort for no real gains...
>> because what is the difference between this binding being TXT and DT schema?
> 
> I am converting these bindings as part of my GSoC project where I need to convert
> as many files as possible during the given tenure, I am slowly trying to read files
> in other subsystems too and will push patches for other subsystems too.
> Is it fine?

In general it is fine. I wonder if we can change the goal of GSoC? I am
surprised that such goal was chosen in the first place. Converting old,
unused bindings to DT schema is okay, but it would be much better to do
this for the bindings which are actually used.

Because I still wonder - what is the difference between this binding
being TXT and DT schema?

> 
> About the part where you suggested to convert the txt into a single YAML, shall I

The bindings were incomplete, so after adding missing pieces they could
stay probably as separate bindings.

> continue working on them? As I can see Mark merged the previous 2 patches to linux-next



Best regards,
Krzysztof

