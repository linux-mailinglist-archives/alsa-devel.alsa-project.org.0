Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DFB8245D5
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jan 2024 17:09:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16BF5E91;
	Thu,  4 Jan 2024 17:09:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16BF5E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704384552;
	bh=vUPZrTE02edwa0EuohHPRi7tOmiQ0vX5dX7E/eqv6qM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iCXNWweZSZvu6+mXXf7O1ESOJvIXK2Rt1fjtG7jfXDFUw+QaF7JoR8R9xOY+EBx8M
	 ziW7HLDJ98hFsF9LE1rBSd9j99z9dEVeDCZrdl+0KtI+c3FZD83bFr5vtGhrut+RmR
	 riqtBqBQUc9JmkEhrtZx7OohS97C9ZuTNl3UCsJI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 669D2F804B2; Thu,  4 Jan 2024 17:08:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD9F8F8055B;
	Thu,  4 Jan 2024 17:08:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFA00F804B0; Thu,  4 Jan 2024 17:08:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A892DF802DB
	for <alsa-devel@alsa-project.org>; Thu,  4 Jan 2024 17:08:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A892DF802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yjLH6lFC
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50e835800adso688147e87.0
        for <alsa-devel@alsa-project.org>;
 Thu, 04 Jan 2024 08:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704384510; x=1704989310;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KY5xP96Le0ZniVFZKeXdx8efJcLyHwWo4sSLgDSws3A=;
        b=yjLH6lFCsMZzhCinqbU+wTUnpX5U8qL3l7N3c4nqlxzsR+EtrYZ3OCZgJT91OFXChS
         5TiaetPeU+++IK5/qR4+ft+EFhJEUv77W9WHJaNehmKor35cOxk/0S5VqXYvUCUIG0ku
         JfHvE8k37SCVlcBVpXU1ahqj2rXyg8cy5IccXnTcB/snYh9x8MEp9UYmosaAQkH3uONp
         rJWn1YHBEPxxBg9T7487ctEINa9Ux4Yjb2t1HXXulHNKWkwpA2rG7nMLh+PDI57y5Uw/
         DBFLvSSElF+3er7B/pwocDuyApN7adDp9CthXIcdBJ2uvsLoO6CB6vBZqed9llFn9DxD
         ySrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704384510; x=1704989310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KY5xP96Le0ZniVFZKeXdx8efJcLyHwWo4sSLgDSws3A=;
        b=Pn23Jd0xR6WAN9iYY9jKbGTEfOqLynAlMEdddpi6xAkw0lnRvjbtQKj3u4/8o7/GPB
         D2sIGfxGSrkbs5lC0jsPhGqHccxnIqTg061rzcmtg5M74H4U0YGAvSu2onYxVS+Ix9BA
         wuVYs7Wyfwl5+ccMcFVJ6Iu23njxBJ9z/Bro69JghCgDVoW5ztYMeMjV7r5k33GFjdVV
         I07474o+ab3dxuWDBcxYEwNrSl6EYoI9M39raZt20DEY3cA7Yp//gs0Olcr00UThk1jU
         lJYy6qy2D6Zfv4NFnwdaepd/iNY1HsVOdbdRZDGeFBnF9/N5pkYkhUYmTZIo8isqKECW
         rgvw==
X-Gm-Message-State: AOJu0YzJk10R4bKrvQ4qiIkU3KziUfmq4dRmtz+REgLN5I9ZXn9CMNbN
	+AO+sQUCw6X4Nq2jDHCWc1JAjW7VGSrbLw==
X-Google-Smtp-Source: 
 AGHT+IFdBGTKty8FQQCh4+yOFP87gFD5uvSSfcnO9iQ1ufQbalsz+gQU82XLyiqDp3JaZhe3SckTJQ==
X-Received: by 2002:ac2:44aa:0:b0:50e:8504:24c3 with SMTP id
 c10-20020ac244aa000000b0050e850424c3mr282750lfm.114.1704384509845;
        Thu, 04 Jan 2024 08:08:29 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id
 o6-20020a056402444600b0055473af90a6sm16421942edb.0.2024.01.04.08.08.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 08:08:29 -0800 (PST)
Message-ID: <fcbae47b-3b28-42f0-b93f-f83932025dc1@linaro.org>
Date: Thu, 4 Jan 2024 17:08:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] reset: add GPIO-based reset controller
Content-Language: en-US
To: Sean Anderson <sean.anderson@seco.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
References: <20231222150133.732662-1-krzysztof.kozlowski@linaro.org>
 <20231222150133.732662-3-krzysztof.kozlowski@linaro.org>
 <530e3473-eb3b-477c-8599-e7aa12779640@seco.com>
 <88bd6668-7e67-42c7-97b6-d7029f371349@linaro.org>
 <075990bb-5fdb-4d30-9484-9df6b978e805@seco.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <075990bb-5fdb-4d30-9484-9df6b978e805@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YQSDLLY4F4S5VFNTGCZSBJ77ZSFO4LIK
X-Message-ID-Hash: YQSDLLY4F4S5VFNTGCZSBJ77ZSFO4LIK
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YQSDLLY4F4S5VFNTGCZSBJ77ZSFO4LIK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 04/01/2024 17:04, Sean Anderson wrote:
> On 1/4/24 03:57, Krzysztof Kozlowski wrote:
>> On 28/12/2023 17:05, Sean Anderson wrote:
>>> On 12/22/23 10:01, Krzysztof Kozlowski wrote:
>>>> Add simple driver to control GPIO-based resets using the reset
>>>> controller API for the cases when the GPIOs are shared and reset should
>>>> be coordinated.  The driver is expected to be used by reset core
>>>> framework for ad-hoc reset controllers.
>>>
>>> How do we handle power sequencing? Often GPIOs need some pre/post delay in
>>> order to ensure proper power sequencing. For regular reset drivers, this is
>>> internal to the driver.
>>
>> It's not part of this patchset. Power sequencing is an old topic and
>> generic solutions were failing, rejected, did not solve the problems,
>> etc (choose your reason).
>>
>> Delays are device specific, so they go to drivers (depending on the
>> compatible). Complex power sequencing is way too much for simplified
>> reset-framework handling, so anyway it is expected you do it in your driver.
> 
> Well, the reason to bring it up is twofold:
> 
> - Traditionally, drivers expect the reset controller to handle all
>   necessary delays. For example, reset-k210 includes a 10us delay
>   between asserting and deasserting the reset. There's a similar thing
>   in reset-imx7, and several other reset drivers.
> - We would need to add custom assert/deassert delays to every driver
>   using this interface. These are not always added, since any given
>   device may require delays which can be inferred from its compatible.
>   However, an integrated system may require delays to be different from
>   what any individual device requires.
> 
>>>
>>> Maybe something like
>>>
>>> my-device {
>>> 	reset-gpios = <&gpio 555 GPIO_ACTIVE_LOW>;
>>>         reset-gpios-post-deassert-us = <100>;
>>
>> Feel free to add it later. This patchset, and actually all patches
>> should, solves one problem while allowing you to extend it later.
> 
> Yes, but we should try to avoid creating problems for ourselves in the
> future.
> 
>> If there is a architectural problem in my approach not allowing you to
>> extend it later, then we should discuss it.
> 
> Well, I brought up just such an architectural issue below...

Sorry, but where the issue? You did not present any arguments stating
that it is not possible to add your feature.

What is the problem to parse that property?

> 
>>> };
>>>
>>> Of course, this is a bit ambiguous if you have multiple devices using the same
>>> GPIO with different delays.
> 
> This is the most concerning one to me.
> 
>>> Maybe we take the max? But the driver below seems
>>> to only have access to one device. Which I suppose begs the question: how do
>>> we know when it's safe to deassert the reset (e.g. we've gotten to the point
>>> where all devices using this reset gpio have gotten far enough to detect that
>>> they use it)?
>>
>> The driver (reset consumer) knows when it is safe or not. You must
>> implement proper reset handling in your driver.
> 
> The driver has no idea whether it is safe or not. It just calls
> reset_assert/deassert at the appropriate time, and the reset
> framework/controller is supposed to coordinate things so e.g. the device
> doesn't get reset multiple times as multiple drivers all probe.


Sorry, then I don't get what you refer to. The driver calls deassert
when it is safe for it to do it, so the driver *knows*. Now, you claim
that driver does not know that... core also does not know, so no one knows.

Best regards,
Krzysztof

