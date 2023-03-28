Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F816CB9F7
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 10:59:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CC071F6;
	Tue, 28 Mar 2023 10:58:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CC071F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679993979;
	bh=VXeNGA3Y+MzuA+ghMXub7O/cVml5Z19GYS0mXtT/zMM=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=viYjOiHGMICV6wROkE4uuRirU05zgHfZ5B5hqr2hyZESZoqBmKPapo5Q/KSpgNyyG
	 5DMo4b3es4QUZsmO3W4QVe2kBHJ5PnYJZZxB86xpecyIZ9nXDZ1v4bsMXqQ1qEdqWm
	 yh5sVmqVxLy9wYhjG+6zp5Cn/ryFLOZV4Lcc0Cs4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1552DF8024E;
	Tue, 28 Mar 2023 10:58:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E981F80272; Tue, 28 Mar 2023 10:58:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA5A6F8021D
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 10:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA5A6F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ivg7HcYS
Received: by mail-ed1-x52b.google.com with SMTP id h8so46533909ede.8
        for <alsa-devel@alsa-project.org>;
 Tue, 28 Mar 2023 01:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679993918;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kpvilR/XMH01vCvH1yrllb4SROq3hX6QXJn5vfFvDPQ=;
        b=ivg7HcYSurzEcIJRyhtiqosZF0S7xNoMozSq8GQm95XA21gcNFA49bqhGKjvUkbUXH
         fPx0/XcFg9c5k5qK0KQD/Hb2Kft+M+FGVCZRg3lVSDzjfXWs09vQH0QTBUrUTGqNnnoH
         IN/42FTPss2XbI60ljcHBqsSZxOyhhh9M05y07K0zmryARMdhOx9BNHaGNOdLzYDfDhL
         3FiGIpxqxXcI2eOLqFzb5LGiTw2jX8B2cGgvhvR5JWTqpGezbapiwH4Aa7GglKygYT1l
         pXJ4q/fkgony3UAyTUUzv1omdqizfg8kpw+Fmj5ET9Dv2BQ9EvGT0dqI8MXccYrG3pK4
         /WdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679993918;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kpvilR/XMH01vCvH1yrllb4SROq3hX6QXJn5vfFvDPQ=;
        b=e9ei+tz/k7MsQPjYy3dPdkb9UMFHdqGrLGqN5NhbEID3IMgKU4pYUzjFefnV7CNHkS
         cQkugumsZS1guT/JHLMxHxkwhSngzHaQ4QNceeAARUq4RQsVc+EDxZRxfJ7qEY+Dl63d
         bbsCo5xHuznzh1zRF/4M5XGwqn9yVQOQG4b1x7+OYkpzxt8uHfVzYkbFOgqcOqWdrRHE
         sGsI3G3XzWtV1JmgMGrqcH3KmCE+8DcYKB5fpVWSKDuyVu/Z2+kyoOj67CpgWGuxYbZl
         D4gNBgyGQHSagfK0TzoEg1k62AxQdLNFgyFqEonYQkIzn4pq0ofZjEAAvc6C1m0niZgL
         mkJQ==
X-Gm-Message-State: AAQBX9dbV9EGHN0gjRpX1v017/W1u4AxVtO0oLYoI4e/TWzX2w9/tWEF
	yWaIZiqfRsGYJahGTXhbqledPw==
X-Google-Smtp-Source: 
 AKy350YCad6dmgcHiPby31nO1lCTaRrcmAnP6WSKHPXvnSI4p36XgIeKIaKsXzZVY6YOXxvI+VZyEg==
X-Received: by 2002:a17:906:2f96:b0:932:8cd:1021 with SMTP id
 w22-20020a1709062f9600b0093208cd1021mr14701563eji.33.1679993917953;
        Tue, 28 Mar 2023 01:58:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6?
 ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id
 gy24-20020a170906f25800b00930445428acsm15283740ejb.14.2023.03.28.01.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 01:58:37 -0700 (PDT)
Message-ID: <0824738d-d431-bb4a-16d8-e4e4064969c5@linaro.org>
Date: Tue, 28 Mar 2023 10:58:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4] ASoC: dt-bindings: alc5632: Convert to dtschema
Content-Language: en-US
To: Saalim Quadri <danascape@gmail.com>
References: <9490b5ef-3068-fcbb-0105-baf3839c21df@linaro.org>
 <20230328083347.54958-1-danascape@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328083347.54958-1-danascape@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JYAYMTM7YGSZ6VFUTFOXSPOA33WGROPW
X-Message-ID-Hash: JYAYMTM7YGSZ6VFUTFOXSPOA33WGROPW
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, broonie@kernel.org, daniel.baluta@nxp.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 leon@leon.nu
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JYAYMTM7YGSZ6VFUTFOXSPOA33WGROPW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/03/2023 10:33, Saalim Quadri wrote:
>> Please use scripts/get_maintainers.pl to get a list of necessary people
>> and lists to CC.  It might happen, that command when run on an older
>> kernel, gives you outdated entries.  Therefore please be sure you base
>> your patches on recent Linux kernel.
> 
> Apologies but, this is the output of get_maintainers.pl, is there something that I missed?
> 
> I am currently working no 6.3-rc3 as my base kernel.
> 
>> saalim@pavilion:~/workspace/linux$ scripts/get_maintainer.pl Documentation/devicetree/bindings/sound/alc5632.txt

It's not the correct way to run it. It should not even work at all -
there is no alc5632.txt file, so I really doubt you run it exactly like
this. Anyway:

git format-patch -1 -5
scripts/get_maintainer.pl v5-*

and you will get a bit different results.

Best regards,
Krzysztof

