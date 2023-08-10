Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8131777906
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 15:03:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B96E1836;
	Thu, 10 Aug 2023 15:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B96E1836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691672608;
	bh=OpkDrXDEQX3GKbvJaJhRQfcUt9hTZh+CSxJ0/VTpFps=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h9PYST4S2ZfQFt3JEsws22re2M8FQa3kBST2b4vFn6/3Q6qbRdZPNcjGetxTCibCH
	 15/wj23SB5UHeihD1VaNrtg/pqhYHZz3kOGKLJJ1gHLNyHHWyj108DL7yiAIvAmleA
	 JKVzRvIKYwKhIGnCalJcaJYHMamsT+FxQwYk3P54=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAB9FF805AC; Thu, 10 Aug 2023 15:01:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BEF5F80589;
	Thu, 10 Aug 2023 15:01:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5502FF8016E; Thu, 10 Aug 2023 12:30:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7161FF800FB
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 12:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7161FF800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=SGnJ72WX
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6bcade59b24so717791a34.0
        for <alsa-devel@alsa-project.org>;
 Thu, 10 Aug 2023 03:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1691663436; x=1692268236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pfX2UO9uPMLGCJf+csL6XyU3QIcd01mEsKwWrpSRNS4=;
        b=SGnJ72WXikaU5xqUInA5M3UvYftl90Px6nU01CEkJphO/WsF5Q2X5gSU4xT6tchamL
         5oH6WUuttHrXL1mWEVgtVnnZcbyWQK/LF7pjeAbo0lqCgKuhyI2LHTGFBGyJVqpZP3jd
         7Ro7a7lBZSw2Q3l6rd0D5Ir21mM9lV0jqpqfROsleVpiV+VBfaaCQvlwJK9l7emWyXps
         8/kD9xmUX1yvQDY9601GcrdcL9zSua5LZ24RsKY6wRIfgaOFtkIWbGDREjHCZnusU9XY
         GCp9qb1WTiBL0TwB8aR0iGDjuhuYll95r5DPSw7mP4UBQ4VqxgXIvmewPTXRP901tW6V
         ezsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691663436; x=1692268236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfX2UO9uPMLGCJf+csL6XyU3QIcd01mEsKwWrpSRNS4=;
        b=dE7NQQEV3P69UX4lWTQK5ZOeRgBGHo6ZV0onvh9cIOHjgQ8t4rZUe4K37jw5s7Oirz
         J4n6yPWyR5AJDOY/TQDFDbju9NU6aWP6iYUHw5JIG9HcdBzgAq6y/MdpzMtK+FbPiC9z
         8VYlPsg89ffTlM2PD4TLvLqolF1Ekket4j+B9hUAsMKnYfYZ3wy9dt2tpmabv7jsFjTP
         IArIcRYj04XM0gllqILxKKIRLRVGNL09Ob/LIlg3i9h8m/vYWBjWjdxLdM0kJQ4vs0dr
         iw6eAg/ch2A7cIt1xCyGaZjYyq+0B9FgfoUeNJ1K3qXWFF0OrCARppUPvx/Yn13Brwrg
         6v5w==
X-Gm-Message-State: AOJu0YwNbz6KLd4igKrzNwenHmK4rK/NY4jIuBtSmQuJ2u3dK8v/3y86
	klFkdZFikUCTNHAymkOxIDzXrg==
X-Google-Smtp-Source: 
 AGHT+IF0r6GZclcogo6XbgwR5E95APycZzfccRq3VLl0HNlzfmMExbMjn9dfSBYwvsABTggoervb8w==
X-Received: by 2002:a05:6358:7e8f:b0:134:c279:c82a with SMTP id
 o15-20020a0563587e8f00b00134c279c82amr2360798rwn.29.1691663435963;
        Thu, 10 Aug 2023 03:30:35 -0700 (PDT)
Received: from [10.0.2.15] ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id
 y11-20020a63ad4b000000b00564250660f3sm1214409pgo.78.2023.08.10.03.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 03:30:35 -0700 (PDT)
Message-ID: <0bdbd852-d21d-3149-a34f-8d25ec3544e8@tuxon.dev>
Date: Thu, 10 Aug 2023 13:30:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] MAINTAINERS: update Claudiu Beznea's email address
To: Simon Horman <horms@kernel.org>, Jiri Pirko <jiri@resnulli.us>
Cc: nicolas.ferre@microchip.com, conor.dooley@microchip.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
 tiwai@suse.com, maz@kernel.org, srinivas.kandagatla@linaro.org,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, sre@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, alsa-devel@alsa-project.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230804050007.235799-1-claudiu.beznea@tuxon.dev>
 <ZM0Be8S8zII8wV4l@nanopsycho> <ZNS0708cDAt7H7ul@vergenet.net>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <ZNS0708cDAt7H7ul@vergenet.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: claudiu.beznea@tuxon.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: A6242FJZI4YSVT2GWBP7HQHBSM5BOPW6
X-Message-ID-Hash: A6242FJZI4YSVT2GWBP7HQHBSM5BOPW6
X-Mailman-Approved-At: Thu, 10 Aug 2023 13:01:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A6242FJZI4YSVT2GWBP7HQHBSM5BOPW6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10.08.2023 12:59, Simon Horman wrote:
> On Fri, Aug 04, 2023 at 03:47:39PM +0200, Jiri Pirko wrote:
>> Fri, Aug 04, 2023 at 07:00:07AM CEST, claudiu.beznea@tuxon.dev wrote:
>>> Update MAINTAINERS entries with a valid email address as the Microchip
>>> one is no longer valid.
>>>
>>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>> ---
>>>
>>> Changes in v2:
>>> - collected tags
>>> - extended the recipients list to include individual subsystem
>>>  maintainers and lists instead using only linux-kernel@vger.kernel.org
>>>  as suggested initially by get_maintainers.pl
>>
>> Consider adding entry in .mailmap as well please.
> 
> Hi Claudiu,
> 
> I'd like to echo Jiri's suggestion of adding .mailmap entry
> to reflect this change.

Hi, Simon, Jiri! It's on my list. I'll handled it asap.
