Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE8C6E4F3C
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 19:31:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01B33DF8;
	Mon, 17 Apr 2023 19:30:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01B33DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681752705;
	bh=89Z1ZZ+dUfS2/etSukNbm6syOlaNd0yqrmrmIPikJtE=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=no0u8GhXbuBtbk+F+58Nva7MEXX3qV2bvcU5FolypRgUt5vDQZy+z7ZawhdcRpxo7
	 GNcbtb+IFPiufUR2L1BTaJgOBfywrhHBg57kW2H8H2IKBJk9iTmE5TgtglmBYwjoPv
	 eT8k7r5qD23mzspx+VXLwK9skcB10l9gJroERLdg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 469D2F8025D;
	Mon, 17 Apr 2023 19:30:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 488EEF80269; Mon, 17 Apr 2023 19:30:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04480F800E2
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 19:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04480F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fAjmPXPY
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9505214c47fso8228166b.1
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Apr 2023 10:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681752637; x=1684344637;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C8ScjprxHugKxCMDypee7pkLVAF7MNtBoWTiiYUu5i8=;
        b=fAjmPXPYv9sxADFt01EubdSTwYf2OscBpAyhagekVSESJ2xTEu4S2bVMYolTiHTSNc
         2aL7jDdJWOJ5ETzULCZMsykLc/DpaKvlbnzM9h+TiUXr8XXZvAte9lAMZWPrXneCee3P
         4regSv4wtvskxI+QT7ss+aKyV4YlnpurQSiMF4v6Xe3Mftj4umJSKjz9/yPfVDDHw2cu
         PG5Q/FgW1roQXDT90kqEZ5e4lmj1HmGesFhuenQeTs99FALORnnCHzarZECMl1FSydc+
         cHqw0qioJ/nsj0aH8P3nJdcSwi08I9YUd8v1kP2JaQmYIOZ+vl5zj0Lh5OXEpbDvKD7u
         faUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681752637; x=1684344637;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8ScjprxHugKxCMDypee7pkLVAF7MNtBoWTiiYUu5i8=;
        b=K1HQWovipGhRwmUI8sK43gUtrbLIrlvCXbtPmvR3ueMjtXj8ZOzHs+9DOvVqCKS/O7
         q6w9Fs/IqvffV5gHKJ3/TCwNZ49OP5wCbebVuKg0uEStaRZ0nYACUdrWcdXdCSuCNLOB
         I2b6X9VAQ+3sBHyXtUVYlFmWwUfVeulsb9TT7U7vw8kXT4Ao3NmembHzpIHmcT2iVMtx
         +JAbKYJYHe71LqcA8fdT6XrwcvMJWWwqiShKkCDilv05vZEemlgsip52nB3zBuEShA9+
         Svu3WDLk7opzgnQDeqQ9vJz10t+pM7QUn/j3fgNr9b7QCi6kKLnE4f1Y41cRv6DYRmwW
         BSkA==
X-Gm-Message-State: AAQBX9d6eNJgUwgAczuokw+2kyzVS+BwITbdGQbAyM7VtuSAclynL4X9
	hjp7MjxdJIrsXu4NzYBd8MOMYQ==
X-Google-Smtp-Source: 
 AKy350ayXgZG1crpJRLYvQIWlQU/hRPwltlRot+m5KtnYJtPu4J7sERlQH+W7BEMDoRJVrxr1lzZHA==
X-Received: by 2002:a50:ef01:0:b0:506:a770:ce9c with SMTP id
 m1-20020a50ef01000000b00506a770ce9cmr3266806eds.3.1681752637281;
        Mon, 17 Apr 2023 10:30:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:96aa:60eb:e021:6511?
 ([2a02:810d:15c0:828:96aa:60eb:e021:6511])
        by smtp.gmail.com with ESMTPSA id
 e6-20020a170906314600b0094a82a236cbsm6862968eje.129.2023.04.17.10.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 10:30:36 -0700 (PDT)
Message-ID: <45907ab4-ad1d-b4ff-a5b5-40e9bfc44e8d@linaro.org>
Date: Mon, 17 Apr 2023 19:30:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/4] ASoC: codecs: wcd934x: Simplify with dev_err_probe
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20230417141453.919158-1-krzysztof.kozlowski@linaro.org>
 <20230417141453.919158-2-krzysztof.kozlowski@linaro.org>
 <20aa9662-9cbb-4fbe-b6ed-3a6ba33e820a@sirena.org.uk>
 <c294d672-c2fa-7468-f02d-18d5230a1d95@linaro.org>
 <5d753a8a-b979-43f6-a403-8a51f69bac29@sirena.org.uk>
 <752c2dc1-65a9-a74a-d9ce-7db5ddbea5f8@linaro.org>
 <80be967f-b831-4a73-8474-09bb96bd2c32@sirena.org.uk>
 <1cc83bad-55c2-46b5-ad70-cac160b842c1@linaro.org>
 <7da0f237-b4ba-4c66-8061-a14c09a1e7a5@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7da0f237-b4ba-4c66-8061-a14c09a1e7a5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CZ4TXHJZRTEOODQBKWOKRAE6NXZHZZQG
X-Message-ID-Hash: CZ4TXHJZRTEOODQBKWOKRAE6NXZHZZQG
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CZ4TXHJZRTEOODQBKWOKRAE6NXZHZZQG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 17/04/2023 19:23, Mark Brown wrote:
> On Mon, Apr 17, 2023 at 06:32:07PM +0200, Krzysztof Kozlowski wrote:
> 
>> If you prefer, I can mention the message/EPROBE_DEFER difference in
>> commit msgs.
> 
> I know you prefer to maintain exacting standards in these areas.

I don't understand what do you mean here. Do you wish me to re-phrase
the commit msg or change something in the code?

Best regards,
Krzysztof

