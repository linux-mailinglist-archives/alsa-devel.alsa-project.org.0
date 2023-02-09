Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD436902C8
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 10:04:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D1E0A4A;
	Thu,  9 Feb 2023 10:03:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D1E0A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675933461;
	bh=fPRMwRdDYLUvKgQFgRVJ1UoAM/pcx95BpSCqW5a/qc0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qa1BxMNLwwIdm6kk/8ZvCHCDg9fKEba5xIIkRSCXIVXN6k6HdBVTMxtCMHkot+X23
	 Z0S6g5x/gtnnEvA3JMBn6oFOqbSDRKSkx8QcESJD2H1smTe6Y4vXXDWF8JLGGrbJOr
	 29t/XjwUXJfeyMZPqkx4sLU8uq8yDpWQOTrc0Vzw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 199D9F80094;
	Thu,  9 Feb 2023 10:03:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B986F800E4; Thu,  9 Feb 2023 10:03:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBA38F80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 10:03:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBA38F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=f8Bj8q1S
Received: by mail-wr1-x430.google.com with SMTP id d14so1021404wrr.9
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 01:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KddnvB+SXjb84cC3PE1XW8IOwMIgrVI+rE/YkSmOZX0=;
        b=f8Bj8q1SFmwuKD2GFvYlhUixzeuCqp0yWlnDo13eYYidcOzljksBZyU1Sb6unC8ek7
         s/t4PNwFmfvEjoe0orcN+CJ+3spZjAk3RWEzkeMQmSnbg9qOWvY92NXOZnF56q6/327O
         MoDfIbzyAWo31LhJ5a0UEouIfTCDDpqPk5pFA1Anh3e2yonZ79fENVrpAPYPrMhxOY1+
         LLIxCkFqvxhpzHHnSQgvaVKtNy7zc/txqQlhGb3NkyU+ypDpd9EwiPvwgCHQE62bS8xG
         pY4XbkuQ8/Dws9GeGbRZVj/RDNDYO2jYb/XGh0EY7UVisUYSFXeyVRukwjLW7+XuitMu
         ScfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KddnvB+SXjb84cC3PE1XW8IOwMIgrVI+rE/YkSmOZX0=;
        b=5VDkhOChBZQ34YSZLxDbU6sb5lmjex/prQL+PffNUQZQWVmzHjFAmEBjIcqed8FF4U
         4iH/1WCaADcBlFPidXpl0BfHyeNwHjYk70b4eGSMZN20zQuLTIFvBcHDkBRCFaG26MhN
         5ikd9+9/PhhvM/oD/NbAHZHqQ4PC/t+Dcc34PvXtSDqfXhxFsapYjRJz5oFIZt7ShFK/
         6M/7O6R4sRMB5qZlFUw5HRTZjEsf1H4F2pppueI06ig3umSRhPgGRPGCaKv7GzDYWJjh
         qTn8AkRtJDbi95fSr69sPGJcvBu8WsdDsZ/krwXHil3zrcMd6yPxWJ4N6hAW8XmsWfMz
         Fqpg==
X-Gm-Message-State: AO0yUKWHOVlyFgQs5QAp4fODzz9Rar4Gwmt+F5nSyhiV7AEaPOl7Bz4H
	8jdhp2nB7SMXnpC696vsLMoRjw==
X-Google-Smtp-Source: 
 AK7set/Wf+UTKLXXpE+qh5czFozFlsmwQv2QwSegX9rUL/3WcoNIm4M2PM/Yh78fR38M6Yu3h0XAVw==
X-Received: by 2002:a5d:6206:0:b0:2c3:e868:cf54 with SMTP id
 y6-20020a5d6206000000b002c3e868cf54mr12210476wru.13.1675933397888;
        Thu, 09 Feb 2023 01:03:17 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 o26-20020a5d58da000000b002c3f1223059sm735417wrf.36.2023.02.09.01.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 01:03:17 -0800 (PST)
Message-ID: <e5bcad37-c7d3-9c3c-4947-d3f2f6d9fc60@linaro.org>
Date: Thu, 9 Feb 2023 10:03:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] ASoC: SMA1303: Remove the sysclk setting in devicetree
Content-Language: en-US
To: Ki-Seok Jo <kiseok.jo@irondevice.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230209084903.13000-2-kiseok.jo@irondevice.com>
 <da3e7391-ee89-3089-8501-91e9411161a7@linaro.org>
 <SLXP216MB00777BF2377ECE2366F694228CD99@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: 
 <SLXP216MB00777BF2377ECE2366F694228CD99@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XGL25FDOS7GTPV44FVSNNXNKOXFGASBZ
X-Message-ID-Hash: XGL25FDOS7GTPV44FVSNNXNKOXFGASBZ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XGL25FDOS7GTPV44FVSNNXNKOXFGASBZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/02/2023 10:01, Ki-Seok Jo wrote:
> 
>>> In SMA1303, this device does not support MCLK.
>>> So it need to remove sysclk setting in devicetree.
>>> v2: Modify the sysclk setting - using devm_clk_get for mclk.
>>>
>>> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Where? Where did you get this tag?
>>
>> Best regards,
>> Krzysztof
> 
> I'm sorry, I don’t' know what you're talking about.
> What tag are you talking about?
> Sorry, could you please elaborate?

>From where the tag "Reviewed-by: Krzysztof..." appear?

Best regards,
Krzysztof

