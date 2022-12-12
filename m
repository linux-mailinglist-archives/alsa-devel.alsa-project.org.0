Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DE0649A33
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 09:41:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1308418A1;
	Mon, 12 Dec 2022 09:41:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1308418A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670834516;
	bh=jR7Ae8xdiRmIVrJh5BfnSb+BFWETAFG4d5TGzha19IA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AKF8k5W8QbnW0aYgqeEenaRPHnAwQj9uygjvZ5rwa9inVHoutpM0jHXr4PiK/A6zs
	 zqldOL4lC9vBu4LtXNgmpWDL5x4RcP/Sa4fpXZuSWbJM2W4FQzPUo//MUun149gwvx
	 oVRbk265obm+NAoaoRlw8XQD7XT0TgewUwCswh+4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1D06F804B4;
	Mon, 12 Dec 2022 09:40:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B92A4F80494; Mon, 12 Dec 2022 09:40:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF836F80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 09:40:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF836F80141
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=H1Jk1RLO
Received: by mail-lj1-x22f.google.com with SMTP id f16so11734207ljc.8
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 00:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K+6fEYSz7m/CPUV4/+SEcQDFawyZfISqhe/v9Owp5pU=;
 b=H1Jk1RLOPg9VYMLvqyNaJw3wTLfyV51sNzM1xYb7d+lzkrEB6mVox9o567x5glUjH6
 fJ/lRVNJHtjhU2peVl8ruNNeZv94g+K5g4gMw5qQAXps/5ykovYIfR7SLwO/jU5ISYyR
 w6mIEpSlc3AK8WJR0/AVHxDt4WXy6vxLIBvvDuPaCLlT0CT4IzU+yn0Zi+idc1uSsfjQ
 sm2eMXJ9KSyEKlUpbbi0s7jZK8pNORQjbU3jP5MnoxY4rgpwUy9GMDzymnne27k02M4k
 qwGCTdIPoInshL+nQplRmu5UIdJ5Ijz54cXFCwG0Z+D1XFpFFeYZ84APYHHFfKRWLGqV
 XP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K+6fEYSz7m/CPUV4/+SEcQDFawyZfISqhe/v9Owp5pU=;
 b=Y1qWliG7qgCKA0aiga58giI5dAjeu6MkfmA/LYtYdgtmR9bH4q4NSNJ6XO0uBOnosO
 rpr9NEvveiEhR6cOj+PbT00yttanRruCSdF73Qxfc5qmxPlIOS4aY1epjHKBaTVWDGU4
 phnWXTS2zHU7dYwAVHaaVxXP24uKDPzo9QPXN6u2va65/jCxIxXA3JokfgxuJf3EDuWV
 sTl4R6RsDh84M72gdUasr7xFcFWfbKFGUuBzgxo792aZu4flZKG8BPplZqN3TveTN1w6
 stJDzRJ0xP+EtwsPiurq6XSCjGvmwo43Al6NPEXiHT4QZxRWlUvwlimqGvARc8XjB73+
 L4gw==
X-Gm-Message-State: ANoB5pm3LiIUU2mEBzr9p3ThpQCD7vy0o8oJDfMqJ35pHWqBSwAEFDoi
 rhg6UsOoWTQWYTXqpeIJgBW6PA==
X-Google-Smtp-Source: AA0mqf5SXiv1Zkg7HMMVCWRXZmcBBmj3rggFfCSnSxwz4n0RrQilNwopPTQTwh39iLbyyURas6wTZQ==
X-Received: by 2002:a05:651c:905:b0:277:155c:f4a3 with SMTP id
 e5-20020a05651c090500b00277155cf4a3mr3625178ljq.38.1670834448153; 
 Mon, 12 Dec 2022 00:40:48 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a2eb989000000b0027a197d8247sm1153836ljp.16.2022.12.12.00.40.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 00:40:47 -0800 (PST)
Message-ID: <e20884d2-5d30-9519-d070-8e2ac07f2171@linaro.org>
Date: Mon, 12 Dec 2022 09:40:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 10/12] dt-bindings: mediatek: mt8188: add audio afe
 document
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com"
 <lgirdwood@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
 <20221208033148.21866-11-trevor.wu@mediatek.com>
 <d7d9f3c7-b3e3-1e13-a80f-c7bf7b38a5b1@linaro.org>
 <45b4b287dfd57b99e0ba5675bf99194f6d84d9da.camel@mediatek.com>
 <fb34e446-2904-a357-e54b-3e82a2b0745c@linaro.org>
 <e08fab2a694313abc12e0f8303de3e2e704b388c.camel@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e08fab2a694313abc12e0f8303de3e2e704b388c.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 12/12/2022 03:43, Trevor Wu (吳文良) wrote:
>>>
>>>>> +    uniqueItems: true
>>>>> +    items:
>>>>> +      minimum: 0
>>>>> +      maximum: 15
>>>>> +
>>>>> +  "^mediatek,etdm-in[1-2]-mclk-always-on-rate-hz$":
>>>>> +    description: Specify etdm in mclk output rate for always
>>>>> on
>>>>> case.
>>>>
>>>> How is it different than assigned-clock-rates?
>>>>
>>>
>>> This includes clock enabling at init stage.
>>
>> assigned-clock-rates are also at init stage. I asked what is
>> different.
>>
> 
> If the property is used, there are three parts included in dai driver
> probe function.
> 
> 1. set clock parent (which APLL)
> 2. set clock rate (MCLK rate)
> 3. enable clock (MCLK On)
> 
> The first two parts can be done by existing dts clock properties, but
> the last one can't.
> When MCLK should be enabled at boot time and kept on, this property is used. That's why I say the property is designed for always-on case.

Heh, so the "always on case" means this property enables clock? How is
this even DT property? That's not how clocks should be kept enabled. You
need proper clock provider and consumer.


Best regards,
Krzysztof

