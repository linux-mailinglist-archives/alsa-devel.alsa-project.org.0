Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9E36A195F
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Feb 2023 11:02:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBA8182C;
	Fri, 24 Feb 2023 11:01:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBA8182C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677232953;
	bh=qv1ebqxNKYeh2P2ahXxCf6dkKAslAGphNWhUKZ3rmH4=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fQkN+k70q+xFq7TiO7JHa99+lNqMfqPisqTDi6hRHsoBSCYade1lbP8SnW09o0QYz
	 OzItkrJ4yeGmU1uNhDu4ayrKBeLXSXKZaEK7SBb+TYkY89dkuChNXsBh07aIAI348g
	 tsb/j+Wsf8LB5qvG1UrHk1TqepIp5BGx3jCc/IdY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68B21F8053B;
	Fri, 24 Feb 2023 11:00:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B57CF80496; Thu, 23 Feb 2023 21:15:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 913FDF80038
	for <alsa-devel@alsa-project.org>; Thu, 23 Feb 2023 21:15:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 913FDF80038
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BaLgVKhu
Received: by mail-ed1-x52d.google.com with SMTP id cy6so41152562edb.5
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Feb 2023 12:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677183298;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kAb0qzqWSP/U+Kj5L5nLqdqYurAmo6JZhKfQvH683Pk=;
        b=BaLgVKhuX1clAmVVahaKedAK7xDb7n37VgbEl5j85och7Y9+re7M8ZB/GCXlN0iW4P
         RpY+bsTzN0egXJpJpNN6fArx526j4YSZMdYk9+RQAwoSaK8RddM/LoJ7NJ4WNge1jI4W
         293i+uUBsLoU17XWO6XQoOMRekI+h/hSXlrVMYaHq9e9lyshfu5uXQ+L7ErgJk07+5VO
         wf5Y+moJHpgaDl2hpoPsc/ktmPyHoaI1J4Y6eO9UQJ0D8/75X+SR2Hgj3Kz+Q7PDGUwJ
         wEKJF4emYuhPovJsIuKN13NKtTWZayn5CQ7InFhtxFJueiuJvH7c89YgRPQnJjKVVYvb
         GSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677183298;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kAb0qzqWSP/U+Kj5L5nLqdqYurAmo6JZhKfQvH683Pk=;
        b=YDkMtUB7KhsB0IoqOYL4tFhZm5b9frvK46Als/9mz0d6AaGT6QQYjIMFTTryh1/z7D
         Odb15ecRk/AsfJVQRQwrk/85mgHWOJrvqHPnDVAKKJWDv0CwDrc769ujB9ryq1n6Hn9J
         Ea46Cm6GHl5YUmDgusR1TP4juzHkB8XB2VQCb1Ca5t/ELCB1Y0g88g0DN64W29xJ1MK+
         gFint0A8gUEXEHbcOl1CCx4vDyBMUYC8TLFrmFa4Xzwta4snmVM9pGli+0A0Mz8j3Cgf
         VdGNNas/1vL9hcz7fzhjCDgRMsKmnkRW91lrKcJSUkY3JVdu15Wfi0xRtTJ7/8AnfnGw
         Tfhg==
X-Gm-Message-State: AO0yUKXVGfAylqtERzi+k2C4N6/IIiP04pqA3YkV0aVV2RszZNPfTMKq
	gw1nfDJtxwHAARLsBeVnJFM=
X-Google-Smtp-Source: 
 AK7set+fyV8NY7swJO99sprnqCQsbhtz4OVtCCE4+qb/xglPT66O02/tvTfiEpZ9YzNZX/uhSq5ksQ==
X-Received: by 2002:a05:6402:34d5:b0:4ac:8e63:300a with SMTP id
 w21-20020a05640234d500b004ac8e63300amr12695555edc.3.1677183298324;
        Thu, 23 Feb 2023 12:14:58 -0800 (PST)
Received: from [192.168.88.131] ([37.252.81.68])
        by smtp.gmail.com with ESMTPSA id
 s21-20020a50d495000000b004aee548b3e2sm5338830edi.69.2023.02.23.12.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 12:14:58 -0800 (PST)
Message-ID: <1db3bfe5-0982-b445-9c94-784478279028@gmail.com>
Date: Thu, 23 Feb 2023 23:14:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] Fix snprintf format warnings during 'alsa' kselftest
 compilation
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20230223143214.16564-1-ivan.orlov0322@gmail.com>
 <Y/eAyrYs+wEu180d@sirena.org.uk>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <Y/eAyrYs+wEu180d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DN5EGZCYT5MZ45TJOP5JG4OMUXRSDPMV
X-Message-ID-Hash: DN5EGZCYT5MZ45TJOP5JG4OMUXRSDPMV
X-Mailman-Approved-At: Fri, 24 Feb 2023 10:00:14 +0000
CC: tiwai@suse.com, shuah@kernel.org, alsa-devel@alsa-project.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DN5EGZCYT5MZ45TJOP5JG4OMUXRSDPMV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23.02.2023 18:05, Mark Brown wrote:

> What warnings are you seeing in what configuration (arch, toolchain, any
> custom options...)?  I'm not seeing anything when I test.  Are these
> perhaps architecture dependent warnings?
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Thank you for the review! I will follow the common subject lines style 
in the future.

I compiled the test via gcc 11.3.0 without any custom options, the arch 
is x86_64. There were five warnings during the test compilation, and all 
of them were caused by incorrect format in 'snprintf' function calls. As 
I know, using incorrect format in 'snprintf' creates an undefined 
behavior. Maybe there is a point to fix it?
