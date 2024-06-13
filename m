Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 539159071FE
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 14:43:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FB34DE5;
	Thu, 13 Jun 2024 14:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FB34DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718282590;
	bh=Ba0f2L0qBaPnNOoB5ZkJeLek3EUUQwCaD5yKAe23nSU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=smxHqGt6+BkXL8BCUy5GUFav4P8+I45e7vByUXzvH1EFjLER60Pb4BIFeSMP9kzTM
	 tWKx92w+u5dtQXlPzskUgs4wwHwTTLgTcNeAalQwCRx3GiTVwW8Z4hCFXsPASsNjPj
	 Z4ceneytm2Q57OVaYYe5mm2FyINlF33PprmRf/LM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61BF0F8057A; Thu, 13 Jun 2024 14:42:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD20BF805B4;
	Thu, 13 Jun 2024 14:42:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2ED3F8057A; Thu, 13 Jun 2024 14:42:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BDE3F800D0
	for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2024 14:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BDE3F800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Gb6jHr9b
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57cad452f8bso982097a12.2
        for <alsa-devel@alsa-project.org>;
 Thu, 13 Jun 2024 05:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718282560; x=1718887360;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zDen0vJUW+xT9L+oF3bv30VDdb8wwl+RQxO77NA+7JU=;
        b=Gb6jHr9bX1qBMZ+1L2l54ZwZK7XaRVg+5tY4QYc+wlIDrgPOfcsdDliTk9oM95G8aA
         dxQEZXUe8dfeoVTPCHd+kLl6xhhmGOyKdLKJE+UbGV7ANvOI7MJaYw3VxWFYqzDVLa2j
         SiS31/40jfj6wtnls1z/Js1aNez+oo5yyyu6HEduQRM5cG9CIvB+8HW6TUzQrT64zi+u
         xYj2yw9lunHWhtbJXOV/nGpcozGl0Vez9iRw7f4MftPfXpCuRqJS6ktSnIDqwgervazh
         TPZ1w7aFvaJwKwjtEfDzmHs52ZbD1ocjKFsxFiIG6qtFhNBW4YJ6X1W+eMYhpGlMl4IE
         CWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718282560; x=1718887360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDen0vJUW+xT9L+oF3bv30VDdb8wwl+RQxO77NA+7JU=;
        b=WDqZC5IRuJ75SU18qQBlaU32Hyk74mXmcNo1Lze/dJ8dtcFCmE5zRySoUmn8xfIH/0
         ZqnRdlzwz5PeUZc7QccY2bvfqKwLSYfB76tl/ucThgzYFQIH0KrM3NM+oxQYNdD0xoQ/
         +glH/wMAK+anKcX5D49PB5pu62Q2Nu7xahmRv3GJpMbUQ3WCqQ6Gmci14TQYWHgWzeKB
         Iq73vDSm0oyMX+4rGeiho/s85fscU7dmVnew1MW59i4BvftCNJimapTCUjpIzsYgXSuf
         LNGxgzb52XUb8YyAJvaPcfI9W7+LB3X1g8uukFxArsQxe4Ucv3qAwI9IXUgZkXLKfb1f
         aJzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7ApFh8VTymGYJadYjgdtUCIYpPqs9pkStIgwjZTnl9SakwJnMEvxJlHZvn2Gfd7Oh5+LYbTaiq+SDdm9osi7Dq9xG/dl/GG6EOYE=
X-Gm-Message-State: AOJu0Yx6dp686eFOL9RwIjZ6krVvhadELWypjoj5bZuW+FymN1EyBNMP
	nKjeqUAC/juTfwB3bz311kLlhBNeKBRkK9k4/OX53+UbNZYVfe+zyrFwtuLZtD8=
X-Google-Smtp-Source: 
 AGHT+IHhniSGyoEipOniastD+bMxg3ST8u3KBQmi75/UrvUJzOGUDP3BZAKq+V+k4xmYl27dFY/zmQ==
X-Received: by 2002:a17:906:dfe6:b0:a6e:f91f:672c with SMTP id
 a640c23a62f3a-a6f47f8c006mr276509466b.25.1718282559957;
        Thu, 13 Jun 2024 05:42:39 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a6f56fa6a1esm68319166b.216.2024.06.13.05.42.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 05:42:39 -0700 (PDT)
Message-ID: <4de45d93-6ffe-4357-9aca-b9fadb3850f3@linaro.org>
Date: Thu, 13 Jun 2024 13:42:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: q6apm-lpass-dai: close graph on prepare errors
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>
References: <20240613-q6apm-fixes-v1-1-d88953675ab3@linaro.org>
 <CAA8EJpq7SN5J8Ye8nGfbJdKAC5Ws61iKMu6QO9ebnRV6q3EVNQ@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: 
 <CAA8EJpq7SN5J8Ye8nGfbJdKAC5Ws61iKMu6QO9ebnRV6q3EVNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WHKS4ER44FHSBEQJZFBDRNS5CEJKRFV6
X-Message-ID-Hash: WHKS4ER44FHSBEQJZFBDRNS5CEJKRFV6
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WHKS4ER44FHSBEQJZFBDRNS5CEJKRFV6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 13/06/2024 13:37, Dmitry Baryshkov wrote:
> [...]
> 
>> ---
>> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
> Note: this didn't go to linux-arm-msm, probably because of the use of
> an outdated tree for submission. This commit is v6.10-rc1, it probably
True I sent my patches on top if rc1 which is why b4 did not pick up all 
Cc's.

--srini
