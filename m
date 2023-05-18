Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B24B707E30
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 12:35:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3121D1FE;
	Thu, 18 May 2023 12:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3121D1FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684406100;
	bh=NIMesTxIQNJ9l9r+DIuX8MqZBgX/brCH6bSN8KR2WKY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EAI5LMAnXzzfHa93hWVFShjDhaa28rusK1iCKwLu8Twu3cPJ7AG1LyYHIvT5xcfDz
	 muDSca7Uh5cTVXxcXsKbqMPcuW1AEhvNVhRNF5ZhxfX+5wY28lbQC3RqB187VmTFsq
	 1KamDZR2G7XtFLC/5QoLbkpDR9z/6syWh62bHGnI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58BF7F8016D; Thu, 18 May 2023 12:33:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD9B6F8025A;
	Thu, 18 May 2023 12:33:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 915D4F80272; Thu, 18 May 2023 12:33:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62F2AF8016D
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 12:33:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62F2AF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=iNzIegnv
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-96598a7c5e0so294921266b.3
        for <alsa-devel@alsa-project.org>;
 Thu, 18 May 2023 03:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684405998; x=1686997998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G5DY7urOobiZRjR4OZIaCLmieV4AgS5HJDFTf9UwQ/Q=;
        b=iNzIegnvt/v1fYGMpoz9S98aOmexlCzQv28VuU/BJtCYsN/YFiuledKJJU82aaTO2X
         QFANvBymphaZl0YqelxhZ5qN5/UXKPKS8dF1hu2OC622ogu2FUl+qy7wFrhNlKA6+Zti
         5yLLHbVuhb9H4XD2WTkxWeNiPKO7WPuTYn9CgNWscdCeVao8YuYa1Kvxb4ihG2Mmt9j2
         e/idYHt0+nwycKdQBM+EHbRPTLLr6NHAhCG8z0LTMkxGXEiA/pKmCrif2e39JJ21Sz/O
         2WSDSuvKJ5FqH3M8Gm2CXPlMtXFzXdZbuE6y078K5mvux2sqdNctv/6kb9H/SSm9sGNT
         4+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684405998; x=1686997998;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G5DY7urOobiZRjR4OZIaCLmieV4AgS5HJDFTf9UwQ/Q=;
        b=l1sA9NMB4rDmNx6X+tFf89FmQOAokBRzWciKwgrJ+gB/+6RVG311BRkclVxP4yFrUz
         LmBS6Yiw3w6Wpa/oCxeUhf+6if3h9GgRX96D4KdLbBG9HhJjmFW5kPshicUF93EaoGXU
         uAutBa40MdiI/XMmAN5JUQDQNrcEt1iW5HjqGC6wmQRaUwStsCpqpIc13JCpD+ir/C+L
         0De5UcAHHB5JgweIBBGsqYFVDoSjDotEzvD98/O748rCVqKmbpajRF4V8qtmaX7sJ6db
         NZg3tKc+l+79hLSn5WEwFpzV6urBmpRX79igIsRguVgXBVJQS5/48dgTK7Yb1Nt+3+jH
         qIFw==
X-Gm-Message-State: AC+VfDyjLaGhEin2ocxR2t/W8IAyYiBChooxg462SqWim06QlwtsT8Kf
	d1eWg1Jv8kBfZ3mclnVrt2T3Og==
X-Google-Smtp-Source: 
 ACHHUZ7XP3poLOlWhhHsfzSWukjrGK+hIXKzIa0zdvIlPCzVZhQVUHfqf8Fja+Sd1wTHDINFUlDorg==
X-Received: by 2002:a17:907:728e:b0:96a:e7cc:b8b1 with SMTP id
 dt14-20020a170907728e00b0096ae7ccb8b1mr16378653ejc.56.1684405998503;
        Thu, 18 May 2023 03:33:18 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a2b:c408:5834:f48e?
 ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id
 bv17-20020a170906b1d100b00965c529f103sm777804ejb.86.2023.05.18.03.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 03:33:18 -0700 (PDT)
Message-ID: <cc4109d6-3125-0738-537d-34f9fa2c2fa1@linaro.org>
Date: Thu, 18 May 2023 12:33:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RESEND PATCH 00/12] ASoC: codecs: do not store status in state
 containe
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230518072753.7361-1-krzysztof.kozlowski@linaro.org>
 <ZGX8v3qjkmfMf+J1@finisterre.sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZGX8v3qjkmfMf+J1@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PANXCE7AUE5QI6COKJMXKRVBT3DIATAQ
X-Message-ID-Hash: PANXCE7AUE5QI6COKJMXKRVBT3DIATAQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PANXCE7AUE5QI6COKJMXKRVBT3DIATAQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18/05/2023 12:23, Mark Brown wrote:
> On Thu, May 18, 2023 at 09:27:41AM +0200, Krzysztof Kozlowski wrote:
>> Hi,
>>
>> Resend due to missing cover letter, so adding per-series tags was
>> not possible.
> 
> Please write proper cover letters, but don't resend for this.  You
> constantly raise small review errors in other people's submissions...

Since you asked for a cover letter and you did not apply the patchset (I
checked in your tree), that seemed like a feedback for something you
want me to fix.

If you want to give feedback which person should not immediately fix,
please state it explicitly or through applying patches.

If you give imprecise messages, don't be surprised you receive different
results.

Best regards,
Krzysztof

