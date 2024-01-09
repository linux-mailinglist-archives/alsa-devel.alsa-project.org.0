Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A844C82836D
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jan 2024 10:43:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF1843E7;
	Tue,  9 Jan 2024 10:42:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF1843E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704793389;
	bh=ai5d/rgBekvvHbKx5wnX7R9nEFEVURH3VsFvqAc5SHU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PHHjM4Q1A8MOUXD+F4WRvCtCV1B89QerczNODoJ6BxgWFRBhQ3wlvnABbBb7R1NLp
	 tf3FqOWaGvarz99c4BILuSwjt/gWwm/VIOa3yOzyTYWk1FQKJ5Ca3FkDjoL66W+91R
	 G27Ar95YLs/pUipgUihTCao4Zv2xnBcIGlsGQK4M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41356F80578; Tue,  9 Jan 2024 10:42:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4466F8057F;
	Tue,  9 Jan 2024 10:42:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0328F80254; Tue,  9 Jan 2024 10:41:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0628AF8014B
	for <alsa-devel@alsa-project.org>; Tue,  9 Jan 2024 10:41:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0628AF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IcFCQ/q+
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-557d554ca30so1521216a12.2
        for <alsa-devel@alsa-project.org>;
 Tue, 09 Jan 2024 01:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704793283; x=1705398083;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0zJ90jY4oWOFnJfno88cKUg2qN1kQaJOunAzUnYwuCg=;
        b=IcFCQ/q+hpjisnxgKe4hxQu8XgZ7JhKjX7fyCC2YmpcAkBzc60hLLTto1RuRxqFcuL
         Hc16odnhb3uxfSfRsQriPO+SbMUVAwDwH/Hnd1dA5cRIG0uBFjuZtJwOZ44ToN9NAMQ5
         BsImGgM3yD8NrKWZvOXS5xwmF6ClefZ1if3QYEmjPCrIVDI+FVJ7gjPrsYlhKfNPZc5h
         uIqqr6gzmQTh8BNvfpeYqSsrXixRUCGFMh66k/hGU+pS/C2WfeTWE0D3pPMkwHyhiHQT
         hgr18vV6q1q+GjyGEOeUQ8ZmnE914xvVE0HBCBwUffa26Ioh9oVtTZMLBA3FPqu1JLhH
         C7xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704793283; x=1705398083;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0zJ90jY4oWOFnJfno88cKUg2qN1kQaJOunAzUnYwuCg=;
        b=kUrig6nQcosPu7rV5D2C86UWQwmCthjEmazG1oJViPScVyjgCUCKjP4zOcCW2zRZVn
         YvnkofIDo2QJXoH+B55TnlEsGB9ayaI4gU0bJjzFEJ/hy36xUufvO1UYBZ9uvVRPL1Da
         7F07g5QlCYKwkFBo5j8jX7c81N0dA/wi/WaVt0r8jA2HQHyDQH5OPI87PodBjCzQXoIe
         pPUN1flrGLhHUq8Ve0BrvQbt3DUf6zIux4aPAc9axIRf2v7Ofe2C3w+rhjkmRdN1vNqJ
         CaGdHAcGVbwUbG0R4k93Y0gVpfUqPHEPxh+9qHBW2Av9L+wAjfrHbTQAXyAPfuOdSYbF
         Nd/A==
X-Gm-Message-State: AOJu0YxxHtr7K/mNbMQLy0Vop8/57SttdlgeCkEzupoC1S98Amvgx2W4
	D2UjrSvYsWJkTevKD5lsgu2LVylZ1V0IHw==
X-Google-Smtp-Source: 
 AGHT+IHUtB5K1UddO5opNaUa0N7/YstdHxJswKWyChocBkdbEGg6bv3HoNbpWtadsPfTK2aetAjLbQ==
X-Received: by 2002:aa7:c98d:0:b0:54c:4837:7583 with SMTP id
 c13-20020aa7c98d000000b0054c48377583mr2408092edt.47.1704793282802;
        Tue, 09 Jan 2024 01:41:22 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id
 bf13-20020a0564021a4d00b00557aa8d72c9sm752094edb.25.2024.01.09.01.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 01:41:22 -0800 (PST)
Message-ID: <93a89a11-fac1-49b3-92aa-1a4fd4bdd5b3@linaro.org>
Date: Tue, 9 Jan 2024 10:41:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] reset: add GPIO-based reset controller
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Sean Anderson <sean.anderson@seco.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
References: <20231222150133.732662-1-krzysztof.kozlowski@linaro.org>
 <20231222150133.732662-3-krzysztof.kozlowski@linaro.org>
 <530e3473-eb3b-477c-8599-e7aa12779640@seco.com>
 <88bd6668-7e67-42c7-97b6-d7029f371349@linaro.org>
 <075990bb-5fdb-4d30-9484-9df6b978e805@seco.com>
 <fcbae47b-3b28-42f0-b93f-f83932025dc1@linaro.org>
 <2be19fbf-4c73-4594-be42-31587dc7b747@seco.com>
 <d2d17b94-6f29-423d-a7e0-e24513a8e59f@linaro.org>
 <c15f1a71b01f7d3985ee8d3b42b6e1ae0dddd235.camel@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <c15f1a71b01f7d3985ee8d3b42b6e1ae0dddd235.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RAA753YHWZSFXB6QHPVDJYAMUDP3OBDW
X-Message-ID-Hash: RAA753YHWZSFXB6QHPVDJYAMUDP3OBDW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RAA753YHWZSFXB6QHPVDJYAMUDP3OBDW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05/01/2024 15:31, Philipp Zabel wrote:
>>>> Sorry, then I don't get what you refer to. The driver calls deassert
>>>> when it is safe for it to do it, so the driver *knows*. Now, you claim
>>>> that driver does not know that... core also does not know, so no one knows.
>>>
>>> Yes! That is the problem with this design. Someone has to coordinate the
>>> reset, and it can't be the driver. But the core also doesn't have enough
>>> information. So no one can do it.
>>
>> The point is that the driver coordinates.
> 
> Currently the reset controller API supports two types of shared resets.
> I hope distinguishing the two types and illustrating them helps the
> discussion:
> 
> 1) For devices that just require the reset to be deasserted while they
> are active, and don't care otherwise, there is the clk-like behavior
> described in [1].
> 
>   requested reset signal via reset_control_deassert/assert():
>     device A: ⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺\⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽/⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺
>     device B: ⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺\⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽/⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺
> 
>   actual reset signal to both devices:
>               ⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺\⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽/⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺
> 
> In this scenario, there should be no delays in the reset controller
> driver. reset_control_deassert() may return as soon as the physical
> reset signal is deasserted [2]. Any post-deassert delays required by
> the devices are handled in the device drivers, and they can be
> different for each device. The devices have to be able to cope with a
> (much) longer post-deassert delay than expected (e.g. device B in this
> case). It is assumed that the reset signal is initially asserted.
> 
> The reset-gpio patchset supports this.

Yep! :)

> 
> 2) The second type is for devices that require a single reset pulse for
> initialization, at any time before they become active. This is
> described in [3].
> 
>   requested reset signal via reset_control_reset/rearm():
>     device A: ⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽/⎺⎺\⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽
>     device B: ⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽/⎺⎺\⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽
> 
>   actual reset signal to both devices:
>               ⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽/⎺⎺\⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽
> 
> Here the reset controller needs to know the delay between assertion and
> deassertion - either baked into the hardware or as a delay call in the
> .reset callback.
> 
> This is not supported by the reset-gpio patchset. It could be

Yep, as well.

> implemented via a delay property in the device tree that would have to
> be the same for all devices sharing the reset line, and by adding the

Or through dedicated node to which reset-gpio binds, just like in Sean's
code some years ago. Nothing stops achieving that, except of course
convincing Rob. The point is that although my design does not solve it,
it also does not prevent it in the future.

> .reset callback to the reset controller driver. The only issue is that
> the initial state of the reset line should be deasserted, and at
> reset_control_get() time, when the reset-gpio controller is
> instantiated, it is not yet known which type the driver will use.
> 
> Sharing a reset line between devices of different type is not
> supported. Unfortunately, this will only fail at
> reset_control_deassert() / reset_control_reset() time when the second
> device tries to use the reset control in a different way than the
> first.
> 
> [1] https://docs.kernel.org/driver-api/reset.html#assertion-and-deassertion
> [2] https://docs.kernel.org/driver-api/reset.html#c.reset_control_deassert
> [3] https://docs.kernel.org/driver-api/reset.html#triggering
> 
>>> For example, say we want to share a reset GPIO between two devices. Each
>>> device has the following constraints:
>>>
>>> device post-assert delay post-deassert delay
>>> ====== ================= ===================
>>> A                  500us                 1ms
>>> B                    1ms               300us
>>
>> And now imagine that these values are incompatible between them, so
>> using 1ms on device A is wrong - too long.
>>
>> This is just not doable. You invented some imaginary case to prove that
>> hardware is broken.
>>
>> Now, if we are back to realistic cases - use just the longest reset time.
> 
> Right. This all only works if no device has an upper bound to the
> allowed delays on the shared reset line.

If device had an upper bound, it would be quite a conflicting design,
tricky to implement. I don't think we should target such case with
generic solution.

> 
> I interpret the post-assert delay to be the desired length of the reset
> pulse between the rising edge and the falling edge in case 2) above,
> since in case 1) a post-assert delay is not useful.
> 
> The post-deassert delays are not supposed to be handled by the reset
> controller drivers at all, except where they are needed to reach the
> deasserted state on the reset line. Reset drivers that do have post-
> deassert delays in the .deassert callback might be bending the rules a
> bit for convenience.


Best regards,
Krzysztof

