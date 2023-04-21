Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ECB6EB326
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 22:55:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 343C1EA3;
	Fri, 21 Apr 2023 22:54:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 343C1EA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682110543;
	bh=a5CwD5uf+GmthiDT48DnWSNIYebDUIYZpOgRtyHgZjQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a0+91hpHe9Sp9qc4otrdN7Q8Aqd9vDYwRFUsEA+beS1ndcQpL4I6ckUZIk3Up4wBU
	 Ep4av2+8nKy00ZnRPmbI0VlunbipQDhH/TNY1ZsRpXqBl5uJdZETAjl6Bmu19/3//E
	 JRv+XdBkcchhEfwRNvJyFcMlwVGlvYVSU+WTzYOI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8378FF80149;
	Fri, 21 Apr 2023 22:54:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0210F80155; Fri, 21 Apr 2023 22:54:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 370EFF80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 22:54:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 370EFF80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=n0rsl/8R
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-94ef8b88a5bso298762666b.2
        for <alsa-devel@alsa-project.org>;
 Fri, 21 Apr 2023 13:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682110480; x=1684702480;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GYZHoYC7wlztlYopLT6LxxrM0NknP75pm7Ms/2PJwgA=;
        b=n0rsl/8R2V9y3wzfD7Sxd4rEuVOK2sktabc8D8rzUGU5rUTM9I/tvoRmnbTG+02gso
         tTBlqpGTyqDmC5oYaaGAjQiCyKooGRMhSelVywKf/oEsxWmbl/Ps5/9+tQkkavJmrk35
         XfFKC4yBgjHA0H1itN8ELPIomfPwN73EDsqQVazAhMl7YRlrlhh1zOoS3cFm86MrsTQu
         CaWUAlxt88tF7+44r3dbab1j15Q3PIVNS/A8nWeG5/M8EoX6fazwio2AYPJwR5+/Twtq
         oV+5wLWawlZfJ2hS5QVzsaq8BHGPRFyQ1i3v1EvvtM2+B9k+UK1flKQVsdvuse7RwYDU
         lNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682110480; x=1684702480;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GYZHoYC7wlztlYopLT6LxxrM0NknP75pm7Ms/2PJwgA=;
        b=D7xoxjUxXwqcO8whqgxUM/t8uTUuYyEEB7//0osG1rtKViuJ0Su1dwNBw+oIhEgTIN
         ApiNxI/5iqKrNmD5SqvuVfQi6EakKyfeBb261nqRRYAX8mPv7dE15hJygX8rWVTbxt0r
         xC1UmWrBBM+REGmBmIBKMdwsBCASA5mB3V7kgSNINcr2bZ3ISD1FPeUSL+HdT2XKDD95
         6x406wlbhYpVnYeB3eOMKoAR6pYv280AaC+wtXdSZGzoqzMyE2e7ySn0QNuEgtiT4OSl
         a9PA2dJHwoSZKlrGmf9WmclATmtGTot1jcKLwqjardoQKxQFgXV233Q+Cgn20vvgH5gV
         mm0Q==
X-Gm-Message-State: AAQBX9dG6B3I/JD2RShTGbpELCCx9ljf/n30CEM4fuUjfF5G3VM3izxy
	sd6k34J9Ar/0Wte9B7EMLYWzfA==
X-Google-Smtp-Source: 
 AKy350Z2WukYcX1QS1wd4iahLEW3T8sqciknGmxQYpQaDMgHjXtOAiihUIosstUiRU5vZ0BffN+C1w==
X-Received: by 2002:a17:907:a061:b0:8e1:12b6:a8fc with SMTP id
 ia1-20020a170907a06100b008e112b6a8fcmr3273183ejc.4.1682110480427;
        Fri, 21 Apr 2023 13:54:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:687d:8c5:41cb:9883?
 ([2a02:810d:15c0:828:687d:8c5:41cb:9883])
        by smtp.gmail.com with ESMTPSA id
 j19-20020a17090686d300b0094f109a5b3asm2503978ejy.135.2023.04.21.13.54.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 13:54:40 -0700 (PDT)
Message-ID: <03bcdcfd-3007-5124-428e-7be92d3aa8b2@linaro.org>
Date: Fri, 21 Apr 2023 22:54:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ASoC: max98088: make it selectable
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20230421200127.16234-1-fido_max@inbox.ru>
 <aa022833-2380-6a6f-6d7e-47b0098ae18d@linaro.org>
 <444ed682-9c5a-4d5b-8ba2-f1954c7719c5@sirena.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <444ed682-9c5a-4d5b-8ba2-f1954c7719c5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4JDXSM3JIDZNVJ2GP4BN7XWF2XPTZ5OZ
X-Message-ID-Hash: 4JDXSM3JIDZNVJ2GP4BN7XWF2XPTZ5OZ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Maxim Kochetkov <fido_max@inbox.ru>, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
 rf@opensource.cirrus.com, ckeepax@opensource.cirrus.com,
 shumingf@realtek.com, ryans.lee@analog.com, herve.codina@bootlin.com,
 wangweidong.a@awinic.com, ajye_huang@compal.corp-partner.google.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4JDXSM3JIDZNVJ2GP4BN7XWF2XPTZ5OZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 21/04/2023 22:43, Mark Brown wrote:
> On Fri, Apr 21, 2023 at 10:41:00PM +0200, Krzysztof Kozlowski wrote:
>> On 21/04/2023 22:01, Maxim Kochetkov wrote:
> 
>>> There is no way to select max98088 from menuconfig right now.
>>> Add a Kconfig menu description to allow building the driver standalone.
> 
>> Just like many other codecs used in embedded designs. Why exactly this
>> one should be user selectable, but others not?
> 
> Not all drivers are capable of interoperating with the generic cards,
> some require things like specifically programmed clocking setup.

This one so far is not used in any generic card, so I wonder...

Best regards,
Krzysztof

