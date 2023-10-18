Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD18A7CDC82
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 14:59:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E6A5BC0;
	Wed, 18 Oct 2023 14:58:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E6A5BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697633985;
	bh=YmMdPkxXMZv77i3Q698/s5LwWcrdxHVaqBVt/QErdFI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=coisJf5Pf1rjMIxD0mtodxH4ZsJfLmw9fyBK3NGxb/OnEgbitS5LN6D7zag4dCLwR
	 s6pGsuz1CYoW6MXp8zBkJgPytx0ukEW2RQrKMUvNGYdXex6Nhm3deWoBtvU4H3PG0z
	 SvmQ0bGx/eN6zh7c7mr21tWHVd1WK7ranQin00ZQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13300F80558; Wed, 18 Oct 2023 14:58:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9CA6F80558;
	Wed, 18 Oct 2023 14:58:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05642F8055B; Wed, 18 Oct 2023 14:58:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB590F800C9
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 14:58:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB590F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Qk0n+/Nr
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40790b0a224so15141085e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 18 Oct 2023 05:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697633881; x=1698238681;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fr5bNJBFLMuIPEONfHq2XJxUXHhZ/+z0NpQUkCG4IxQ=;
        b=Qk0n+/Nrf3uxW2FqdefjTUh86SFGKXKrpSj/QKs9XLsVBufU9LA1YDWJ6jtYrNPD3m
         LWmjOuZpF2GsqKoshQvXsVAf2GbO32KZ6WB7k1XybmQ4BWqN+EiGbm5Lkdw/P5a62tkm
         PGK1CC58WCheSw5yyvmaKVx/6ivwS+Z2YGNk5z2wzFQUXl/Nw0+I5/DDiqy0cTkFnb7q
         y64/LH8zH0xeBEGzb8fvcO2KVNBwI8i67clTmExnsYmQ+L4FIt1PD8rnLFWOJoizzw9G
         zSgasCg0E7iYm1Skg6mpWkuWT2Iyw/uDxmTsuW5T8aTCiou8qRUXB2V0Nuff+t0DQvSh
         bstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697633881; x=1698238681;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr5bNJBFLMuIPEONfHq2XJxUXHhZ/+z0NpQUkCG4IxQ=;
        b=jG0pLLPSwKZsPlpOWlxDFBKceAaPZEumoGzveOF2WyBSSF7ZQb+JH098jjMJ5u5NZ5
         RuTD+H7pLwCUF3lCqW8lspB2xFv856lQUPOwEZX11aPFy/Rb+WeBqiTxxS97zUlTBUeT
         Bh76YjYVgteiLU77f+qCHnQyTN3q/1icIxnGDj5heS6bJJN25+AhuYw8suSQtDBmELlD
         xl94E7FFj7ziGgCiQ966R/Ts6tz3aQPnq+cs1dYh2elXbuhoqp+7f0e1cwebgBBDL9R6
         pC4evdC63rk+rlqt0L7CgXGVZa5AENkGSoITSOqxg9Jnx6ZMICFRxpdD3vu8X7VYvUp/
         rAqQ==
X-Gm-Message-State: AOJu0Yz98A4a9HAYuHgfp1QavUYyM5VNiMcMbsy8Z+21fyXtSsXrmRWH
	v9Vbvc2Vm7OhkpFP1qk2kY9UiA==
X-Google-Smtp-Source: 
 AGHT+IFMx1nw7RrrfF2jby2CNEyNERSDjSAkNAeiPbbJTFume3ii5cEer9QrawqbSvcQqpa9lpvgyQ==
X-Received: by 2002:a05:600c:3545:b0:403:b86:f624 with SMTP id
 i5-20020a05600c354500b004030b86f624mr3962206wmq.23.1697633881454;
        Wed, 18 Oct 2023 05:58:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.154])
        by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c35c400b0040531f5c51asm1665721wmq.5.2023.10.18.05.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 05:58:01 -0700 (PDT)
Message-ID: <b35a21a2-6e69-4033-8d51-2b67b08ac7b3@linaro.org>
Date: Wed, 18 Oct 2023 14:57:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: codecs: wsa884x: allow sharing reset GPIO
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20231018100055.140847-1-krzysztof.kozlowski@linaro.org>
 <3aa9e3a7-9417-44b4-87d8-fcf1a8b46daf@sirena.org.uk>
 <84f9f1c4-0627-4986-8160-b4ab99469b81@linaro.org>
 <b7aeda24-d638-45b7-8e30-80d287f498f8@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <b7aeda24-d638-45b7-8e30-80d287f498f8@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MU5GXYM3NFICDG3O7N6CLGB33BBADCAW
X-Message-ID-Hash: MU5GXYM3NFICDG3O7N6CLGB33BBADCAW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MU5GXYM3NFICDG3O7N6CLGB33BBADCAW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 18/10/2023 14:56, Mark Brown wrote:
> On Wed, Oct 18, 2023 at 02:38:00PM +0200, Krzysztof Kozlowski wrote:
>> On 18/10/2023 14:35, Mark Brown wrote:
> 
>>> How do the speakers coordinate?
> 
>> They don't and that's the generic problem of many Linux drivers. Not
>> only this one, but others as well.
> 
>> Device unbind (remove()) or runtime suspend of one speaker will affect
>> other speaker. I don't think any other drivers solved this, because this
>> is rather core's GPIO issue, thus I am not solving it here either. :(
> 
> I'd expect that the GPIO users should coordiante directly rather than
> rely on the GPIO API to do the coordination for them - there aren't
> enough semantics in the GPIO itself to do much more except possibly
> provide discovery services (which would be nice).  Look at how the
> regulator API manages multiple regulators sharing an enable GPIO for
> example, it adds an additional layer of reference counting when it
> identifies a shared GPIO.

OK, it is still regulator core, though. Not individual drivers problem.

Several other existing drivers have the same issue, so this should be
solved in a generic or shared way.

Best regards,
Krzysztof

