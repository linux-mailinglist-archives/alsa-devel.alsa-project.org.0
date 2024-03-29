Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 108E5892112
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 16:59:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6914C2CC2;
	Fri, 29 Mar 2024 16:58:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6914C2CC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711727940;
	bh=A1bgOcngoGNeuXrg9Irwhjmy26htvQefZYRFRk1Yg1s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p9b/TrbRXg+kxbRnE3plKvE6CmIdi8avv6egzvM0qZBjYx0Qmmgfs4Rb7oZ5oWrTs
	 9YNH2BDTF+nnD0WzElNb7CKEkY//zAvZhOM9nnm7faiTnWzeZdIjRTYDVGkINNoyG9
	 uh/Wqp/oZqv2KFdcEJZueib1bQVlEOuWBD54+AAw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07B9AF8057C; Fri, 29 Mar 2024 16:58:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E917F8057D;
	Fri, 29 Mar 2024 16:58:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F1AFF8025F; Fri, 29 Mar 2024 16:58:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9557EF801D5
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 16:58:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9557EF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nY0nzVwG
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-41551526477so3215175e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 29 Mar 2024 08:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711727903; x=1712332703;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5iRY6WBaoFR3Ut7RsgjjeOP69wD4aIaTAzv0eG7uu5Q=;
        b=nY0nzVwGJe3f6lfcKgLlfUmVcOOTwuF/uuwhqklOqbvTfZGIyG5w75EJ8339f9Ncbl
         YQamKcHuVsqqFBH12rzZ/WiFv8TGtEVd5FTdEq0p3pxMYfKap4wErXfigQkZRmbeQfU6
         I7xFeIy5xTzbJ3BOo3/FKo9wBt4n5WCD+eXv/y1Cdom1Jc8Si110ou0GuJup77BNfFwR
         0nFPDskI34Q+03LlUeQDCz06JLXU4Mmqmbr9pZ8mNxBPL8+B7rzLXYckIbjhDkJMWvEe
         21sGeAGH1MNrAyDQyYDTeRDuPb4ZW4it0yj7eHcqM9MJxBfR87JhsqG8f/P8c1tB68jI
         cHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711727903; x=1712332703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iRY6WBaoFR3Ut7RsgjjeOP69wD4aIaTAzv0eG7uu5Q=;
        b=ONt3nb5FG3XiAmT8v0hFxRmV9y1NHUJFMIqB/3ZUQZ6R5Cn2Jgdj3dAbpecWCapVCr
         KxhR3iB+66drDlrK/gglUGkRhr4AeiRD+sWwr2pAfd0Z9sCfQjhycsJCxzRYQ05c2sos
         PSSmehNVousI42uUWeMvjPgXJvxQcr7boKsWuhSPTL8ZrjbwfyGJXl5LlRsbbmUM8vKt
         jftn2LCch+ZML7E3o8cg8VWO4Pv2yc+n/LD5TqN4wkOyKTNzGvyD7RNQB5xgd1+ih5JT
         QSOvtfgzslCnc9KUjzDr/LQ/r5u0esWUtnWNNV+DpD63nph/c+Ctzk/1l6iCxPkj7SOw
         9/Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/4QSIWiikvN8417BkW9dKyc83pgpsOSuk9xavbctBo89bJ7OK3nA6NxfxbapVV1bgBhJupTbJLQrbbJ/NsMn5vrP7aEKsdGv6az8=
X-Gm-Message-State: AOJu0YxKn+ontbEkV4l8WlzrjYPpRisK03dDIQEidXpdMhkJBBz3vh+A
	jG0yMLmlY6JejV9cG6HYgAlaz1WuIfiVNa/0Qq2S8DHwH9fVSGJSVjB/MUhZIXo=
X-Google-Smtp-Source: 
 AGHT+IGs8uMaED9NrwRWp6VqyH2obfV07nqS2HtPgQn6vsGCO8x4AzJBZmyKgceC6bz9Fi5is28FOw==
X-Received: by 2002:a05:600c:3ba7:b0:414:8938:70ec with SMTP id
 n39-20020a05600c3ba700b00414893870ecmr2089688wms.27.1711727902900;
        Fri, 29 Mar 2024 08:58:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 t12-20020a05600c450c00b004154853f778sm4681379wmo.48.2024.03.29.08.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 08:58:22 -0700 (PDT)
Message-ID: <a42c41aa-cbaa-463c-ade9-5083930dec64@linaro.org>
Date: Fri, 29 Mar 2024 16:58:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: qcom: qcm6490: Add machine driver for
 qcm6490
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, broonie@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, lgirdwood@gmail.com, tiwai@suse.com,
 quic_rohkumar@quicinc.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240327113228.1706975-1-quic_mohs@quicinc.com>
 <20240327113228.1706975-3-quic_mohs@quicinc.com>
 <CAA8EJpqh0emOFUPSj8rPaKr2hZRWwOh9NNTco8fyJCtwXe9sSA@mail.gmail.com>
 <92b449da-1569-40f9-d8c9-48949c986853@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <92b449da-1569-40f9-d8c9-48949c986853@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NVKHDIF5A4PK5UPO2W4UUUJW53T6DMHT
X-Message-ID-Hash: NVKHDIF5A4PK5UPO2W4UUUJW53T6DMHT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NVKHDIF5A4PK5UPO2W4UUUJW53T6DMHT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/03/2024 16:19, Mohammad Rafi Shaik wrote:
> 
> On 3/27/2024 6:39 PM, Dmitry Baryshkov wrote:
>> On Wed, 27 Mar 2024 at 13:34, Mohammad Rafi Shaik<quic_mohs@quicinc.com>  wrote:
>>> Add machine driver for qcm6490 SoC.
>>>
>>> This initial supports which includes WSA883x Speakers with onboard DMIC
>>> connected to internal LPASS codec via VA macros respectively and also
>>> WCD937x based headset.
>>>
>>> Add compatible for sound card on Qualcomm qcs6490 boards.
>> Granted that qcm6490 is similar to sc7280, is there any reason why you
>> can not use one of the existing sound card drivers? Like sc7280.c or
>> sc8280xp.c?
> 
> The qcs6490/qcm6490 has additional interfaces like MI2S, which requires 
> additional machine driver modification.
> 
> Example : Required new DAPM widget change in machine driver for MI2S 
> interface which is specific to qcs6490/qcm6490.
> 
> So, using new qcm6490 machine driver.
> 
> Will try to use existing sc8280xp.c machine driver.

In that case, if it does not fit into sc8280xp, it looks fine for a new
driver. Maybe just mention this in commit msg.

Best regards,
Krzysztof

