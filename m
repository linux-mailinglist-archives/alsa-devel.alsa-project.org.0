Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AFF6B45C3
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 15:37:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F358B18B4;
	Fri, 10 Mar 2023 15:36:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F358B18B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678459020;
	bh=BA5jj7odVQsVOQwlWGlf/l5b8Td2tbD8N4ebtC4yC1I=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Xa8yDew38ZySbKueZ6XPvFw/YTaOdr3xrjTqRZWu1+kF4erCsSf+DNLjflzQ7vBK5
	 zECuKCbT+8ZvcykbTSunIcHwVRqEkSHYFlxbCKfurrk7GXBj8VO/97cQ9UWVDWgICn
	 PbU96F4iNS1ydv+1AXYjU7sDZzRYe1z3WHDM8nJM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6107EF8042F;
	Fri, 10 Mar 2023 15:36:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F2C7F8042F; Fri, 10 Mar 2023 15:36:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B43CF80093
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 15:35:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B43CF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NJm58VDW
Received: by mail-ed1-x535.google.com with SMTP id x3so21195564edb.10
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 06:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678458957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9dXUSpxrhc852kQQYbEFtQeOQhI46gAz+RPdDgDM6is=;
        b=NJm58VDWAWv6i7hMdG19RulhdsV5x/wxmH+8isFWJXUEqhG9N1Iqam21CFjdWwOcf7
         WbGU2ZLahrjJhgrwUXGZZOr/UUubNVwr+fffhEkmzZzlXjgYMTf5ileDas5NFPtnkRYz
         rT1ppaC7hRiXW/QJZrnMQFTP/hrCdqvLkxJJnhQuhlTf8Vju7UjALujTrLiQiCu3pQ8n
         0rBzVorTxQGCkdQN00kx2uvsvNBgqy/Ui+0y+4ofz7CSAFx+utphlSOdoiSIpzWxIxd8
         piE0QUGtQ4uGoqve0lwBw8SSB6y06R3Awp5eeMjAxsRBNwq71v3OhLkmVdKccRmAi/nc
         YzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678458957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9dXUSpxrhc852kQQYbEFtQeOQhI46gAz+RPdDgDM6is=;
        b=h38G/q1WF3P+ogAe0kF+os413iVe42jKAjbutqdkNDNZ40q61w9kMC7xW20wPGYhlE
         Mi7szOkT2tBBufBFwccLkpFS+gb+7U/xEuLdoz+PAUbPRFGaayBSP7ID8CJrS0GLCtoA
         PfqoTQLCCohUbM+cRindql4f3El1M/eRQLF3qFmUJL6LrGTg4zIcmIauXtKJV5ybjf0L
         xPvwCBc2/+R+RLLRcFjQSCzbJNjfoWGythiJxsgQAc7eBbGyzjxH9wQIPOth9G6SOI5t
         O5h3MtDHm9zUzE7ov8aZ/+C+LLy8w/ixuCf9RoykVhLjsWZxqgE6WZeAEDKthSF3YFc4
         1JDA==
X-Gm-Message-State: AO0yUKVftQQbBzA/zdOaa0l3nr6y/wNrCSVsMDrtjHrPEqQU4Rx4bSY8
	WB6hK5TwV9pZO60YK2iDbW+enQ==
X-Google-Smtp-Source: 
 AK7set/cT6KeCdA2Ngom7Mk8z4udlb+B1Ld/45Z85Z40xRKfE+CLp5lePmjx8hRRhNtGefKW/p0Myw==
X-Received: by 2002:a17:906:f255:b0:886:fcbf:a1e5 with SMTP id
 gy21-20020a170906f25500b00886fcbfa1e5mr22623077ejb.59.1678458956870;
        Fri, 10 Mar 2023 06:35:56 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:45c4:46be:ec71:4a51?
 ([2a02:810d:15c0:828:45c4:46be:ec71:4a51])
        by smtp.gmail.com with ESMTPSA id
 u23-20020a509517000000b004c0cc79f4aesm80130eda.92.2023.03.10.06.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 06:35:56 -0800 (PST)
Message-ID: <b5e4c34b-b0d2-0f73-7c0b-8233e545c068@linaro.org>
Date: Fri, 10 Mar 2023 15:35:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/9] ASoC: add audio digital codecs for Qualcomm SM8550
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JWADLMBEICKAA26ZXE2HGLCJCIWMWAIZ
X-Message-ID-Hash: JWADLMBEICKAA26ZXE2HGLCJCIWMWAIZ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JWADLMBEICKAA26ZXE2HGLCJCIWMWAIZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/03/2023 14:21, Krzysztof Kozlowski wrote:
> Hi,
> 
> Dependencies
> ============
> For va-macro bindings:
> https://lore.kernel.org/r/20221118071849.25506-2-srinivas.kandagatla@linaro.org
> 
> NOT a dependency
> ================
> The patchset can be applied independently of my previous fix:
> https://lore.kernel.org/linux-arm-msm/20230310100937.32485-1-krzysztof.kozlowski@linaro.org/T/#u

DTS implementing the bindings is here:

https://lore.kernel.org/linux-arm-msm/20230310134925.514125-1-krzysztof.kozlowski@linaro.org/T/#u

Best regards,
Krzysztof

