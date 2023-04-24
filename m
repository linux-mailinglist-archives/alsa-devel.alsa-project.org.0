Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3F16EC668
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Apr 2023 08:41:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D7EFEDB;
	Mon, 24 Apr 2023 08:40:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D7EFEDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682318503;
	bh=ic4bkz2mUnqKzfePY6qhEkYW6Updpgcyk/H472Ei4eg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kfSuT1n0XF3SWcVJm6ZE4YE13cIjdnIxQyrWOUtO4kxLf7ILEKlQ8r5sh23YI+rKt
	 ZNX6/lSjopebKQqvg929iAbWLKW0BgjhMA28XvPhx66GQEEwTQo1LCwRNk0UUB6dcC
	 874+QEdSpn1Sdeezy1rqGzH9gJ8zz9HQ+kUWkUDk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B829F80137;
	Mon, 24 Apr 2023 08:40:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6E2BF8018A; Mon, 24 Apr 2023 08:40:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8293FF800AC
	for <alsa-devel@alsa-project.org>; Mon, 24 Apr 2023 08:40:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8293FF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=OwJqvfFa
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-506bfe81303so6809714a12.1
        for <alsa-devel@alsa-project.org>;
 Sun, 23 Apr 2023 23:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682318439; x=1684910439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ocZJKvnPOHMK9A+S2m8KMo3sHWWzxqf2OycGZyxNjIQ=;
        b=OwJqvfFa/3Q4COGt6Su24l4kgC7kiIDBgVXKNHjdCMGjuUsg9xDeoTWHduHsgvHBLh
         fhacM6Sjs0fXIgZCj0pj1+eTNDiOiGW7lNZHBcNAGXd3sAw5i4zWzyBpe6wYq80FUf5y
         tEBWhgHfDjxPbhzOdicR9UXj8FVilnMsQGBgtmz31ycvctXN+FwVtZ/GysT7K0qXvz8X
         QmVcH7MVoz7mq2ECkAYNSYGhv6FH34dzHq3pVoG/WFbPPr8zniXCFWuD95APERZSD0WG
         PXR9sIdqQKGdJb8FBRIWtM4UCaVOEPDq17otAdjT26FfOZFBZLSk/gx/Z2QkcjNrGtX3
         c8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682318439; x=1684910439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ocZJKvnPOHMK9A+S2m8KMo3sHWWzxqf2OycGZyxNjIQ=;
        b=Mceae6ord+aByASvE1wR1prQ4r2Too6ZWpgU7r7g1O6tzf+rOHMC3EwXr2zV25HdOG
         UvTyS3z5ZRJFMRBOexS8fGG650UFR+CcE/XrMiNJMdtAviEdk6+9FYCam5PoqJvAVNok
         KsqTUXE5G84yJNpMUHItYrWgjnuUXR4FsBHHhd8uP/kfr+Fu6SrtvRpT1fMlziSKSg7R
         n9xFCjj6TPehfV2dmlYqapMKVaXaRNCGotzeOaNgyVRsNVhf3VyE7Wti4GLq16Mk19NO
         gdrJ7Xb+ZAy3SuG13D/av4xEIEWq0vy7tAkJipUL2eN89IpVODIzTonVN4dkdZm6+W6i
         Axlw==
X-Gm-Message-State: AAQBX9faY3rvzgXkPLXvRJ5A2OD6SoWK/78DdziDOeB/JXLkQaaPAsbU
	xkXlhOdGUGljdNoXijrA1pbwSw==
X-Google-Smtp-Source: 
 AKy350aAmjs1Jtrgb5iSmp+C/duy2k6LPKZ5BBSS7OQXAfTE6cEn6/CwW3sAXNqve1NRGpRZMs+NNA==
X-Received: by 2002:a05:6402:160b:b0:506:9701:8436 with SMTP id
 f11-20020a056402160b00b0050697018436mr10664854edv.16.1682318439560;
        Sun, 23 Apr 2023 23:40:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:fcdb:bf53:d053:3a52?
 ([2a02:810d:15c0:828:fcdb:bf53:d053:3a52])
        by smtp.gmail.com with ESMTPSA id
 sb10-20020a1709076d8a00b00958079b676asm2695717ejc.122.2023.04.23.23.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Apr 2023 23:40:39 -0700 (PDT)
Message-ID: <600d0c3e-0b5a-88a8-fade-edf3e4dd8ac6@linaro.org>
Date: Mon, 24 Apr 2023 08:40:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] ASoC: max98090: make it selectable
To: Maxim Kochetkov <fido_max@inbox.ru>, alsa-devel@alsa-project.org
References: <20230421211950.20972-1-fido_max@inbox.ru>
 <0a2eca07-f266-164c-4a9f-f1000ae4efbc@linaro.org>
 <7fdf1f95-a9bb-8560-729c-b12bee302376@inbox.ru>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7fdf1f95-a9bb-8560-729c-b12bee302376@inbox.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3WXY3BSZVWRYJG5AAE7QH6JQIPR4Q5SO
X-Message-ID-Hash: 3WXY3BSZVWRYJG5AAE7QH6JQIPR4Q5SO
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, rf@opensource.cirrus.com,
 ckeepax@opensource.cirrus.com, shumingf@realtek.com, ryans.lee@analog.com,
 herve.codina@bootlin.com, wangweidong.a@awinic.com,
 ajye_huang@compal.corp-partner.google.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3WXY3BSZVWRYJG5AAE7QH6JQIPR4Q5SO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24/04/2023 07:07, Maxim Kochetkov wrote:
> 
> 
> On 23.04.2023 11:22, Krzysztof Kozlowski wrote:
>> On 21/04/2023 23:19, Maxim Kochetkov wrote:
>>> There is no way to select max98090 from menuconfig right now.
>>> Add a Kconfig menu description to allow building the driver standalone.
>>> It will allow this codec to be used by any other I2S master without
>>> adding extra sound card entry in Kconfig.
>>
>> For your sound card, you need extra sound card entry in Kconfig.
> 
> Ok. But why do we allow some other codecs to be selectable?

Mark explained reasons and I also pointed out that some are used through
generic card.

Best regards,
Krzysztof

