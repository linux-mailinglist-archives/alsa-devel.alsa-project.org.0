Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AF96FC72A
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 14:54:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E208B10E0;
	Tue,  9 May 2023 14:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E208B10E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683636888;
	bh=m+ja18UcJtV/TrOZRbyDshoNZ9nYr5y6RipZlEnSAWc=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o+vfiwyZ9SODKVZDu7yrOvQpTw9xqirFdcUjV5riRi9wDfRxw91l9J6tEWlag9r9a
	 SJuhrsn77z1N8xSjbj8+SGP3DUUiVttYJpxRLal3SxPOnNSOG1R6cD40ykDAWHqXQW
	 gV945lFjxv9go2ub2l68Dc/Iyu/b0Boo5LailCmE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A702FF80310;
	Tue,  9 May 2023 14:53:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAFFDF8032D; Tue,  9 May 2023 14:53:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7037BF80217
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 14:53:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7037BF80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NRJa4wR0
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50be0d835aaso10599248a12.3
        for <alsa-devel@alsa-project.org>;
 Tue, 09 May 2023 05:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683636830; x=1686228830;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AQ1fu2WVit0XpFYJO1HVXZdtM09g9xg4NWdbjKfjcdw=;
        b=NRJa4wR0L5sxYiBYsjvaSotaEAr3i/z5gi+yJfZyMbQ9M1G3IZF2Vg+1deYmCTWkeq
         sKoIpW1DstIc1l7EsIA5+Xviu/cOAXuZ944ggjj338Z1SOs4WjNv35C+Oiipi8IEuo3R
         QfLJm9Rk7r+efYiB53saEWK5bhdifTQKOFwDtQsSsDEhmCSrUp0CaEX0j+la+X05qCzu
         USi6IROBozT9gZ8Lr2FzpHkxrdCpkKIxUqP7WoOvJ1zfuwWM921C8uW19ygPCfIBVYPw
         vq30JP/lg7Bebnh0vdQYH27930zpQoTYp1Zk2tNFcoNOjDpUCm2Po5IXcAD2Jcu+1o0h
         sh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683636830; x=1686228830;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AQ1fu2WVit0XpFYJO1HVXZdtM09g9xg4NWdbjKfjcdw=;
        b=MzjBBDk5xUfLi9vV9USJvK/gdUahD2K10m0LBQXuAof3mhxM2abDEhqqXr/AaVA6NS
         pSSkSt5bOHQACDJfwSQGjCFMbk3FBh5Un9J9KONJzkcwKKxkQT0sDP5iw80t6VXEsL1t
         FtkmwGr5CQhP3g0j/BIfhmp9p13B5D216Hw5wu0Lkqp/ut6DYBOdFVRSyuXPzx1UY9kM
         0Ufjig3YL1/+PUqRcOho5wTPvr2UM5MGNG2ehB4oprjajiVkNgqCe7/JECHVQNGuZFBa
         JUqLwPIKu50sxn6J3hS8bY7FaRiajP+88Pt5vc2s/umCVu0dbqn4AjNBZbqwjYbMYiKm
         EHgQ==
X-Gm-Message-State: AC+VfDxYvPQ9YT/38noPWLFLeijfgh4aPjrqT3ltowGGPuQccePbDNBp
	Jd9MXgHysA60cH/y1S0CzPrVMA==
X-Google-Smtp-Source: 
 ACHHUZ5rMdpsKWEvTTEh/DvsOL9NDyPEkz0z+m31zmJLkkf82u2ZmFAqnlUjBTnJ0ThDeANQb8DwXg==
X-Received: by 2002:a17:907:9454:b0:953:291a:6705 with SMTP id
 dl20-20020a170907945400b00953291a6705mr12123308ejc.17.1683636830597;
        Tue, 09 May 2023 05:53:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76?
 ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id
 gz4-20020a170907a04400b009571293d6acsm1294306ejc.59.2023.05.09.05.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 05:53:48 -0700 (PDT)
Message-ID: <ffa9077a-db13-8272-fea1-93290f8bcd6b@linaro.org>
Date: Tue, 9 May 2023 14:53:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 2/3] ASoC: ingenic: Add compatible string for X1000 SoC
Content-Language: en-US
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 tsbogend@alpha.franken.de, paul@crapouillou.net
References: <20230509124238.195191-1-aidanmacdonald.0x0@gmail.com>
 <20230509124238.195191-2-aidanmacdonald.0x0@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230509124238.195191-2-aidanmacdonald.0x0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YPOWBVFJB22BT645BN2O2WH67HWSC7HX
X-Message-ID-Hash: YPOWBVFJB22BT645BN2O2WH67HWSC7HX
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YPOWBVFJB22BT645BN2O2WH67HWSC7HX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/05/2023 14:42, Aidan MacDonald wrote:
> The audio controller in the X1000 is similar to the JZ47xx SoCs.
> 
> Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
> ---
>  Documentation/devicetree/bindings/sound/ingenic,aic.yaml | 1 +

Subject: missing dt-bindings prefix (second).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

