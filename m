Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DC570F3C7
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 12:10:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F8A61F9;
	Wed, 24 May 2023 12:09:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F8A61F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684923035;
	bh=YueSUVCmpGPiwOfpPnIHv0hVmq2kXwftACAhsTc/YUA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l1N228v5LlPyZFchKJ4bOAfddgEfWMd1fwW+eyLp0xnN6VxF6u4kLdGvL5RYtKQvO
	 TRjf7pKufnvEb+2oJ7bQ9HLQDAXiFChIq8Ph7hij2Ba8Y+KyLlOtmWX1O8dFPW1IKW
	 Od2Mni55Cd2beIMYcRq4JXAHq1/QCU95lqPeHEQY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88DBEF8024E; Wed, 24 May 2023 12:09:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FA40F80249;
	Wed, 24 May 2023 12:09:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E301F8024E; Wed, 24 May 2023 12:09:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1651F8016A
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 12:09:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1651F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YGNM3Rgu
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f601c57d8dso7001865e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 24 May 2023 03:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684922974; x=1687514974;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mkWYRILc4zy51036RiiXREJqmRLbxu9AB+NtWj3Jni8=;
        b=YGNM3RguBhMUXngIJqlzwDDyrWHYTLPV2xGHTVfWE9MTPH8PGd8fAht8TnnHCOgJPJ
         DJ9Ef6jgsu6MQRw7ud6tN3KsnUFpBV12BTvyXayg4nhFmsUF0UY9DTUo2EvU+NaJF6dq
         Z7pP1kDLLmywsTj9Vk/8L8a8yOnHdZKWdGGuqxWhd/gJ512zN7EhaYhoVFJ2dVKtpwyA
         5CeUlkPHLeEOfVyYe84JvLYmt1SRIW4EGYtjJBIDGz7fmhnMKYgcXb9hEt4sshPCSY04
         7O+OWw3oUgwFFTslI0Yzw6tItCg8NOgEBrDTT5HS/lv532EGVlL5qzxgVn8+xZYQvC3b
         Dbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684922974; x=1687514974;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mkWYRILc4zy51036RiiXREJqmRLbxu9AB+NtWj3Jni8=;
        b=Uw0ffnId8AzcswJCOhnhRWguCj302qw/6BLFZE3KC9Y3oHTcIOVysiEEMl3MxiwuYV
         5U9P+de12mG1VtyMpHtvSbHKTuNDVn2zAN+U+0vMfqqyzw+h+URmhJVG0GUgywHN9Gyk
         WmLy/yRT5/6XZWjj77if33BPKq4hc8D84vauzP73udZEXNwFU6cRXbN1SD3LhGMGWN04
         V2T6lPX+Jir0uBPzC9IDwWgtHPNbC0pqGt+oW6STvu2eyLC4vMwuSPKPHOzNUM/IUeln
         RR7DLtkMmovId/3ckNJjTUbFS4FK5YxcRgxjrnebo8OVsJCY/2EmBk2/VsWFOQBNMBQx
         +9Hw==
X-Gm-Message-State: AC+VfDyr6xXU/Gt58fhk/AXRIB2v+qRCs2GXSR5KzL80tZ3nlqPEj/VD
	7ouqBzlXeMEWflychAtMGWbxwA==
X-Google-Smtp-Source: 
 ACHHUZ59u3mMLKjfTqBnaTrhebMf6WVp1mzKWUJdDg/MYHjYyDzloa73nCjuMEQFrhQ3qMK9cZnqIw==
X-Received: by 2002:a05:600c:1e01:b0:3f6:b44:3163 with SMTP id
 ay1-20020a05600c1e0100b003f60b443163mr3986833wmb.12.1684922974446;
        Wed, 24 May 2023 03:09:34 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 i1-20020a05600c354100b003f61177faffsm3488271wmq.0.2023.05.24.03.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 May 2023 03:09:33 -0700 (PDT)
Message-ID: <bdceb6e4-9de8-07ab-502b-c526e97a592d@linaro.org>
Date: Wed, 24 May 2023 11:09:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] ASoC: codecs: wsa883x: do not set can_multi_write
 flag
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 ckeepax@opensource.cirrus.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org
References: <20230523154605.4284-1-srinivas.kandagatla@linaro.org>
 <00283665-e44f-457b-b2c9-1acf59d1cbd8@sirena.org.uk>
 <c37b88ae-7f54-3c07-666f-010a5fd84bd1@linaro.org>
 <d94e734c-e816-4b3f-9fb3-a6589063c05a@sirena.org.uk>
 <af7b7d4f-d7ab-b5ef-e639-9a8b13de54ee@linaro.org>
 <c24b2f1c-3b08-492f-954c-c4f10ae5ad81@sirena.org.uk>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <c24b2f1c-3b08-492f-954c-c4f10ae5ad81@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: W7GJNJ7AGFZ32HULNDW3Z2JZSG4NG6AM
X-Message-ID-Hash: W7GJNJ7AGFZ32HULNDW3Z2JZSG4NG6AM
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W7GJNJ7AGFZ32HULNDW3Z2JZSG4NG6AM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 24/05/2023 10:48, Mark Brown wrote:
> On Wed, May 24, 2023 at 10:42:21AM +0100, Srinivas Kandagatla wrote:
>> On 24/05/2023 09:57, Mark Brown wrote:
> 
>>> I'm unclear, is this a limitation of the hardware or of the current
>>> Soundwire code?
> 
>> Its both.
> 
>> Codec itself does not have any private write callback to support this and
>> AFAIU Qualcomm Soundwire controller does not have any such hw facility to
>> program multi-registers for device at one shot.
> 
> How about the *CODEC* hardware?
> 
No, Codec does not have any such interface to write to device registers 
directly without going via Soundwire.

>> Is write callback used for both Bulk writes and multi-writes?
> 
> Only multi-write at this point but we probably should consider redoing
> bulk writes to use it as well.

By the looks of the code, its other way around.

> 
>> Is multi-write feature of regmap bus or device?
> 
> Well, I don't think any buses that understand registers have implemented
> it yet but there's nothing fundamental that means that a bus couldn't
> usefully do something with multi-write.  The current users all use raw
> buses that don't know anything about registers or values.
