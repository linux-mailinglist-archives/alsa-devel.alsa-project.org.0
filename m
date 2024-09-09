Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6B6971EC2
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 18:08:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5024950;
	Mon,  9 Sep 2024 18:08:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5024950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725898135;
	bh=oedIX6uAWwQ5NPlDFPjLpUk46TfdFMO2UIdsrGksh+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QOo6JxzD2nNPn/Ot9If5N9btd7qi8CL9HkQ8V6eCwdU9ustW6rWSdLMaIfhy+Fk60
	 7w2MEImNmn9fUp2JmrmQh4RdXJXopBCeX3c71XMurvxkPMhQrFYfKVuN47IUPr1zOn
	 t+T3k9SNUgtA8wmWX5rlVApEdpSvqgQeOhmZ/eiQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68830F805AC; Mon,  9 Sep 2024 18:08:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79D94F805B1;
	Mon,  9 Sep 2024 18:08:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6435BF801F5; Mon,  9 Sep 2024 18:08:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C280F8010B
	for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2024 18:08:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C280F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tdEG/gmq
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-374c6eb1d44so123091f8f.1
        for <alsa-devel@alsa-project.org>;
 Mon, 09 Sep 2024 09:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725898097; x=1726502897;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XT5l8P6NzbjGGFiTNVLcXv6l+wRZ27lZ2toZJg0ywbE=;
        b=tdEG/gmqU+Zwgiefm+ai43C06lHR1wC8aZTMeqAvRBX2QjH0LO6UUEHet3jNpvWEQg
         dVTjitO0YRClql75+NQ2I9/fM8B/D6TFFBK3iMYb5msyqHZZ93vgR/x0Ir4hiTcTGdBH
         JovITolSPakfe7wduR2xlhjHfvk4FmV8E8Qt1wfssopPgCvLo2nVDpUyNSxUlSE0gpfs
         0om70KivJ8osik4DrWnVBpiaZTUFGqPGG25QB6D15F/MsAtqUW2hVvcE0P86UuInlmDy
         iTaTNEjWWeOWdNPNBn7lDLjBbJSACZPxTW5qhJZxwpKhpAxYGwsEXUXVkQ5RwM+TNyt8
         N41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725898097; x=1726502897;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XT5l8P6NzbjGGFiTNVLcXv6l+wRZ27lZ2toZJg0ywbE=;
        b=YIIQGd5gZXcbi7lrfLXrMUo9ikuLmmL+fo4SoLPT+6r7vn/8I7Au7OpnyM5yojFiIT
         HPqiS7nxCQmF4dpt4z4BDjm7Ekrb8OvVg+AqmsNGhsLFQFwGO0oZUdQfAN6Pc2c+CBob
         TvenHOD34AmMATWng+yQ0mc5VeQZV7EciTgsNapDSp42IOXM/qMgYSA6fxGUsIUFo1fp
         mdb0T3O2QbpJ/hpdZF6Y/JMQr+toQCDDvawLQ3qTZFfBj5tBaVde0GKBtkjO+1xZG1Ax
         mTTwzxRtWtqP/44cW7IPvShY0noup/N6YPPqlqXDgNVC3xGShE1ZioZdkjJWXUN9LEXo
         9q4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYnSq8OyNFz+NARDBNt/HY0nbe0gKlRVZirxkpJeFgozTk7wCXKV4KYf7x9FR/jgrbDoXpY8vYc4ZY@alsa-project.org
X-Gm-Message-State: AOJu0YxmWaIKeHBxbzcTPxim4ZHuemrkIVyMD+xFnMgZRW79Coa7Cfkt
	ubDclVeyWdxwJSK3xl2Eth+560subJ3hYme5uqOtGLufJr+i/yt/S7WflI853LWNRMqVzddYjkr
	u
X-Google-Smtp-Source: 
 AGHT+IGMTZqgOJO2exltKV8g17LnzhtBMAzSkWU0AQcVhbO6zcCCl+H5Zok6BiW3wg3dWxEGKIHLCQ==
X-Received: by 2002:a5d:6d08:0:b0:378:955f:d243 with SMTP id
 ffacd0b85a97d-378955fd2damr2224248f8f.13.1725898096574;
        Mon, 09 Sep 2024 09:08:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d3700sm6396046f8f.88.2024.09.09.09.08.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 09:08:15 -0700 (PDT)
Message-ID: <adb3d03f-0cd2-47a7-9696-bc2e28d0e587@linaro.org>
Date: Mon, 9 Sep 2024 18:08:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soundwire: stream: Revert "soundwire: stream: fix
 programming slave ports for non-continous port maps"
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Vinod Koul <vkoul@kernel.org>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Sanyog Kale <sanyog.r.kale@intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20240904145228.289891-1-krzysztof.kozlowski@linaro.org>
 <Zt8H530FkqBMiYX+@opensource.cirrus.com>
 <8462d322-a40a-4d6c-99c5-3374d7f3f3a0@linux.intel.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <8462d322-a40a-4d6c-99c5-3374d7f3f3a0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BTJUK764IMFWUV3GGHCJEOLUPOGF5EWA
X-Message-ID-Hash: BTJUK764IMFWUV3GGHCJEOLUPOGF5EWA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BTJUK764IMFWUV3GGHCJEOLUPOGF5EWA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/09/2024 17:45, Pierre-Louis Bossart wrote:
> 
> 
> On 9/9/24 16:36, Charles Keepax wrote:
>> On Wed, Sep 04, 2024 at 04:52:28PM +0200, Krzysztof Kozlowski wrote:
>>> This reverts commit ab8d66d132bc8f1992d3eb6cab8d32dda6733c84 because it
>>> breaks codecs using non-continuous masks in source and sink ports.  The
>>> commit missed the point that port numbers are not used as indices for
>>> iterating over prop.sink_ports or prop.source_ports.
>>>
>>> Soundwire core and existing codecs expect that the array passed as
>>> prop.sink_ports and prop.source_ports is continuous.  The port mask still
>>> might be non-continuous, but that's unrelated.
>>>
>>> Reported-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>>> Closes: https://lore.kernel.org/all/b6c75eee-761d-44c8-8413-2a5b34ee2f98@linux.intel.com/
>>> Fixes: ab8d66d132bc ("soundwire: stream: fix programming slave ports for non-continous port maps")
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>
>> Would be good to merge this as soon as we can, this is causing
>> soundwire regressions from rc6 onwards.
> 
> the revert also needs to happen in -stable. 6.10.8 is broken as well.

It will happen. You do not need to Cc-stable (and it will not help, will
not be picked), because this is marked as fix for existing commit.

Best regards,
Krzysztof

