Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5EE651FD6
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 12:40:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F338193D;
	Tue, 20 Dec 2022 12:40:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F338193D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671536458;
	bh=r1hkwmhTQ8bF4PLojf6JmnIAHVFcfnpYm2e2t+l11KI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=K2dUBa4x+U75z2w34CKb1m4iJ9csr6L9z29/roglGA9m8CojTktacWWsCYHFBiogk
	 jFORGq9dIaIeulfSrCvrYeK+kTwyQ8KWA24vTzXnpyOh6kLcZP3SBA1cxcLr1P6sGu
	 gt7CiQLmWCQNuMAFpf5SKxCW/q0sVZ39Im7LL0Uo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABD34F8025E;
	Tue, 20 Dec 2022 12:40:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE0B6F8025E; Tue, 20 Dec 2022 12:39:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA73FF8025E
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 12:39:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA73FF8025E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=S2MK+Zz2
Received: by mail-lf1-x136.google.com with SMTP id bf43so18167602lfb.6
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 03:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9m0+I3OxjCIA4oD/COGFew1hng7e6sPiMr9SO/CGNRY=;
 b=S2MK+Zz2Q7iM2gmMmK5M9KXS02FrFog6YxCjDMc9zcTgj0eDMy6C6mmwAujKP8bzoi
 NeMEgB/bdKHwGHtLdgeiIzzOQbfU/p84FeSoWQfPlZbA9y6kn80gzhCe1e/2+5vz+vLa
 CVOC7sk1GWB9THAJvpGcUqBd/+k1JaTakfMcueTAfVzfXm0ZT+mZXzQigZvUIxSiflfO
 6MCgaEiXRnbg7OdeOCeA6H7mTSBBOBDlMxKes+yFjdgjiNfsR2u+PS2wwr9/u+IZ4v5V
 dC+Z58vPTQIOlWJmaXslssnArwfoGefWtnttOfUIB1qpw+8pWBRCur2JvrNiZTMaY3u/
 auvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9m0+I3OxjCIA4oD/COGFew1hng7e6sPiMr9SO/CGNRY=;
 b=0AKWHmYttGRlxP2kHeR6BbfFvj5WNNU5j1w2ouVhAHZkq+rRiKWIubt4d75vuy2UCo
 vqHTWkOA7Ch3oSkh0OhQNPqi2O+zsfIlppHmiTItndfWuZfRRVk5wBxBqRZmLrSOdvjq
 d8EQxKwfdBgjuo1fHqkuN9HcZFeTt4rkppys1VtM2woRB3MbZRGrOCqVEYV+/gzDHt25
 /T1ksFxJN0pebikokXAuRpqiPN4KcxPNlhK1cb7Ts0FPW/VSKE5AVVNK/WDC28JblSJY
 ugWh+G+CuAw+7XAswueq8UVVvXct2682IEbjVwOaOga5/fgZiTKAmXDHnD1vVQGq/ot6
 AyEw==
X-Gm-Message-State: ANoB5pm8RVUAHjG5gsGPzoGLi4ly5hadTFc3ksFxOi/ZVdldESi5msfS
 6Y9Ruw0awU6h8WGsY+TqfjCBXQ==
X-Google-Smtp-Source: AA0mqf4U5gqd/MkaS2enu20RRxW7jyePuBL2Li+IyOdC0nYk+PvIE/Zy5Q7zy8s8F+OBa1N4whodtA==
X-Received: by 2002:a05:6512:b21:b0:4a4:68b9:19f9 with SMTP id
 w33-20020a0565120b2100b004a468b919f9mr15726181lfu.33.1671536395386; 
 Tue, 20 Dec 2022 03:39:55 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a19c517000000b004b5701b5337sm1426338lfe.104.2022.12.20.03.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 03:39:54 -0800 (PST)
Message-ID: <e55bea5f-3b89-ecc9-7615-d1f952239372@linaro.org>
Date: Tue, 20 Dec 2022 12:39:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH V6 5/5] ASoC: dt-bindings: Add schema for "awinic, aw883xx"
Content-Language: en-US
To: wangweidong.a@awinic.com
References: <777fea54-9396-05c2-d0a8-e614224a3133@linaro.org>
 <20221220112520.314802-1-wangweidong.a@awinic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221220112520.314802-1-wangweidong.a@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: zhaolei@awinic.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com,
 tanureal@opensource.cirrus.com, tiwai@suse.com, duanyibo@awinic.com,
 robh+dt@kernel.org, liweilei@awinic.com, cy_huang@richtek.com,
 yijiangtao@awinic.com, broonie@kernel.org, zhangjianming@awinic.com,
 krzysztof.kozlowski+dt@linaro.org, quic_potturu@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 20/12/2022 12:25, wangweidong.a@awinic.com wrote:
>>> +allOf:
>>> +  - $ref: name-prefix.yaml#
>>
>>> I think this file has now been renamed upstream.
>>
>> Thank you for your advice, but could you please describe why
> 
>> Why? To better reflect the contents.
> 
> Thank you very much for your reply.
> But I don't understand why this file has now been renamed upstream.

You asked the same question without helping to understand which part you
did not understand... So you will get similar answer - because old name
did not match the contents. Contents is now for something else, so old
name is not correct anymore.

Best regards,
Krzysztof

