Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C88D8AE766
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Apr 2024 15:06:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 270F514DC;
	Tue, 23 Apr 2024 15:06:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 270F514DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713877617;
	bh=5A2UR8bAkghWUWUfYypbaxzizbaVYfwCvDQzO4rNSP0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o21IaPP81iVRoXzNhxrFjp5F1pL2po2EodN7Ntu0YNYAvmSUZE14/MoCK897089EU
	 ksG4T3Zz2a3hmZWtoNMPS8esf12wA/OYyuWpknKeGlXTrbxfUcpxbtNThH5R8dwG9L
	 xuLnHtcUj4MK5NXju69yr9fmWFugZ+08MXxTkyXg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3033AF80589; Tue, 23 Apr 2024 15:06:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BCFF8F805A1;
	Tue, 23 Apr 2024 15:06:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4231F80423; Tue, 23 Apr 2024 15:06:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ACC45F801C0
	for <alsa-devel@alsa-project.org>; Tue, 23 Apr 2024 15:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACC45F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Amv6NGZ7
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-51ab4ee9df8so5681498e87.1
        for <alsa-devel@alsa-project.org>;
 Tue, 23 Apr 2024 06:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713877553; x=1714482353;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ehJp8IGQP8Qz6G2XT2Fya++YL6jKhQgUh1xIVBOWrI=;
        b=Amv6NGZ7yC0QDb8Ev80MbrbxjK97RiUO3lsIXw5WBkvXhidm6RH7Wi/mVqnqdmjXCU
         YY6WzjE5iO1KHIDdXXJZl5Tfa7mMNIU9t9iKKARaEgeGIaGEoXumes7Um+aPAwJIfKdN
         7DqOQVXo0ecaSi3cqbP7M+DGAcoS/63NwK544h7G04xkzfbiQh34SoHo7ZgB+ZFsVE8i
         3oGoHqSGSQPk6Yo042utRFQ1fRjo519Rt1+UmDayCQse3rg1zKeJwpBr1BLdKDypW47s
         GZBGVxL3ShuUAKAP6LqSK0VNQxxcUdORGZsTUlPmCdSQ/4tuRQrg4gZpDqIEFXbXWEfA
         qz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713877553; x=1714482353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ehJp8IGQP8Qz6G2XT2Fya++YL6jKhQgUh1xIVBOWrI=;
        b=Sm2Ha41WAU2pF8+yTjgQE1hqwtJHQi9/OyA96G3VcWbPM//i9gVlPZR7+KRAqse35a
         M71gkTCe2MExaoqzBUSsBVjDStqpqjHg9CHS2cXxHnnOOXqEyWCqc2YCWWy4cNx4cciH
         EAYT6RqYzPPj+DV5Qo28mmY+dm4qpVfEIv1z47GfKIXATGbCoyZlhmyqallfA1sYqz/6
         t3WukoE9l+vZ45QwSbxrB7RqXq9QXwx7uaUnA2OiMciZFHMLipPJ52dxI8VhWAos1nKn
         Dppr48d/Lrq8APfUw2ODWGYApGjS4LJw6d4+tuDXJ/3cob7xV9ljwoDedlMe7IzaeygE
         JXyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV/j6hzSqu05y1TFXRv4gc4of3cOE/Ez1sRY5t1OBe5ObP7jAE6oqRiIeiTnDBVoVKD8ni5OqpqwH8fe1WXWlxhOVsZbhyrzv8gjI=
X-Gm-Message-State: AOJu0Yy8zYa9NmC+iPWJ76MfTbNjLf3vUnGCWXe/tUW2RZx9tp3hCetS
	N05XX5XvY+WgLn9S9Zf4JSKQPhqXljnBI+OvVGFZjKnmbWXMiqBRIUbSGoNjDQI=
X-Google-Smtp-Source: 
 AGHT+IENCG+XV+ZCFF5kX7q625s4qkEBma4kX9+9/15z/8XLIss/sw3nHGITXHXQKBO7wKPP3HP5RA==
X-Received: by 2002:a05:6512:74b:b0:518:be31:9c33 with SMTP id
 c11-20020a056512074b00b00518be319c33mr8152823lfs.55.1713877553046;
        Tue, 23 Apr 2024 06:05:53 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id
 ep6-20020a056512484600b00519609524b4sm2008216lfb.69.2024.04.23.06.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 06:05:52 -0700 (PDT)
Message-ID: <330dd13e-3ed3-4582-abce-b3bd99898bc3@linaro.org>
Date: Tue, 23 Apr 2024 15:05:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: qcom: qcm6490: Add machine driver for
 qcm6490
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, quic_rohkumar@quicinc.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20240327113228.1706975-1-quic_mohs@quicinc.com>
 <20240327113228.1706975-3-quic_mohs@quicinc.com>
 <CAA8EJpqh0emOFUPSj8rPaKr2hZRWwOh9NNTco8fyJCtwXe9sSA@mail.gmail.com>
 <92b449da-1569-40f9-d8c9-48949c986853@quicinc.com>
 <CAA8EJprLB6+i4H5tK9LbJYOEH8v9QF78u-+HMmqPqfpvz5J8zw@mail.gmail.com>
 <7cd89939-e0d0-c43b-fa2a-224bf60f4166@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <7cd89939-e0d0-c43b-fa2a-224bf60f4166@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UHNMBUIOOUSAGQI4J6EMW2SXOWEDHB46
X-Message-ID-Hash: UHNMBUIOOUSAGQI4J6EMW2SXOWEDHB46
X-MailFrom: konrad.dybcio@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UHNMBUIOOUSAGQI4J6EMW2SXOWEDHB46/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/2/24 11:20, Mohammad Rafi Shaik wrote:
> On 3/30/2024 12:09 AM, Dmitry Baryshkov wrote:
>> Hi,
>>
>> On Fri, 29 Mar 2024 at 17:20, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
>>>
>>>
>>> On 3/27/2024 6:39 PM, Dmitry Baryshkov wrote:
>>>
>>> On Wed, 27 Mar 2024 at 13:34, Mohammad Rafi Shaik <quic_mohs@quicinc.com> wrote:
>>
>> Please turn off HTML mail composition and never ever send HTML email
>> to OSS mailing lists.
>> Now quotation levels are broken...
>>
>>>
>>> Add machine driver for qcm6490 SoC.
>>>
>>> This initial supports which includes WSA883x Speakers with onboard DMIC
>>> connected to internal LPASS codec via VA macros respectively and also
>>> WCD937x based headset.
>>>
>>> Add compatible for sound card on Qualcomm qcs6490 boards.
>>>
>>> Granted that qcm6490 is similar to sc7280, is there any reason why you
>>> can not use one of the existing sound card drivers? Like sc7280.c or
>>> sc8280xp.c?
>>>
>>> The qcs6490/qcm6490 has additional interfaces like MI2S, which requires additional machine driver modification.
>>>
>>> Example : Required new DAPM widget change in machine driver for MI2S interface which is specific to qcs6490/qcm6490.
>>>
>>> So, using new qcm6490 machine driver.
>>>
>>> Will try to use existing sc8280xp.c machine driver.
>>
>> What about sc7280? In the end, qcm6490 is sc7280 with different firmware / spin.
>>
>>
> 
> The sc7280 is tightly linked with realtek codec. which will only support for chrome.

Perhaps we should rename it and stop suggesting it's for all 7280-like platforms then..

> The sc8280xp.c machine driver is more suitable for qcm6490, will use same sc8280xp.

This in turn, should it become something like snd-qcom-audioreach?

Konrad
