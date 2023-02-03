Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C24C768A114
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 19:00:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C78981E9;
	Fri,  3 Feb 2023 18:59:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C78981E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675447236;
	bh=F+Ani0Tigp1PXHx0yn8YStluegZUofGAMUQ3n+hE6Zc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=en+/nubUE3SMeNcintg/IfhF/Ci4+IqpNPwL8ewxJJcjybNmYJMIKZaidIo3EuHOt
	 PKI8FkU+3nmUJzeaptjiWPeRbIuBoex8+4EfFhSH+W9HIjirfrdUmRhnyM0QpGgn2T
	 HvMvZV4cHrKRImNkZG0T5nxUI44xbyt36ZqTDxBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5079EF80022;
	Fri,  3 Feb 2023 18:59:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24FB7F80254; Fri,  3 Feb 2023 18:59:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EED2F80022
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 18:59:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EED2F80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=txMUNSAB
Received: by mail-wr1-x432.google.com with SMTP id m14so5332402wrg.13
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 09:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UnkV8eglfBQ3m7iE71cgfuq2SGzc7qznHVEMOlIyJ5k=;
 b=txMUNSAB2UzgNJC5K8ThvnqZcmDr9Xbfbuga4hMfATueyFe2FumlAI/I6oBTc9hSia
 baW6RsfPnETMBqGXWrZ/Lkqo5ZBLO77S6wFuMUn06uUTlmnQdaRUzUOjDqm+vv6rG1Ra
 b3BIPdH5JqeKuhOq8r3MqVDKUCda0NJ2GQbrmZ1IU4WgtC5UxTZxv80pruA73eaDRnF7
 sTi0S6ckGPDrfkNLw3Yz8+uY8OKf152X8h0z+h3tBgVnIoRo8x1m6CUquIXukViwnCQw
 I7PXau1BdzrMMgTjbZOVvam9wswmA9AMH4CUTxrk3IbSqJOqqnlB4A/YPyUK11O6k2jW
 Ebgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UnkV8eglfBQ3m7iE71cgfuq2SGzc7qznHVEMOlIyJ5k=;
 b=0iERd8Ndfz9QK2IZJ1OvnUPo0t9ypwc8z4a6iHCLLYNIiBMT8qlFcXLjqwVVuq6iIN
 TdSq0B1RVUm+B03b6aikkAiVvuVZw+wgBCvecPcNtKmMpoYG7VOYpWhejGO3sPr4nGE7
 73ZaVGiE1OAR73T0tTg4K8NwECuViMFD+H8YB1n9aYS5UTQCwEsi+iDfLLxzNp5ROkmS
 DvrxgqNT90o4s5rd1Jn2nrvtTnD/T2sHd6mHzdZ6vAOd+0LRpQ4OVjVDXmHkYixKPobn
 WpU4TiLp+NqZqLxPoK2nb+Y5NjpiGUYx7jhhYt5iTPymMeCENVXRZLuh0+mnpXSh6LEQ
 rqXg==
X-Gm-Message-State: AO0yUKXEWbbkFWSmGu05XZGSo4+OAojJeB7TybNSfetec9csQPTFugKp
 lQvwetRqsdQf5ADZFKrMrybQsA==
X-Google-Smtp-Source: AK7set+Tfe3BDkZewBOqFV5KXz7+EuxIJvkv67VKmNkAgrrkoHAC1MxgyKcfMByhaN7MOoO8d5gHWg==
X-Received: by 2002:a5d:5982:0:b0:2bf:eec5:3912 with SMTP id
 n2-20020a5d5982000000b002bfeec53912mr10791579wri.34.1675447169866; 
 Fri, 03 Feb 2023 09:59:29 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 h12-20020adff4cc000000b002c3d814cc63sm1758281wrp.76.2023.02.03.09.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 09:59:29 -0800 (PST)
Message-ID: <fede7119-4a9b-76a1-ae1a-7af5dd8d1032@linaro.org>
Date: Fri, 3 Feb 2023 18:59:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 9/9] ASoC: dt-bindings: meson: convert axg sound card
 control to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-10-jbrunet@baylibre.com>
 <f229e181-c56d-6ec7-2a1c-754690f70438@linaro.org>
 <1jfsbmn7ql.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1jfsbmn7ql.fsf@starbuckisacylon.baylibre.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 03/02/2023 15:13, Jerome Brunet wrote:
>>> +          Multiplication factor between the frame rate and master clock
>>> +          rate
>>> +
>>> +      sound-dai:
>>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>>
>> Old binding was saying it is just phandle
> 
> It is just a phandle but the bindings used to have problem with phandle
> that had cells.
> 
> See:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml?h=v6.2-rc6&id=d031d99b02eaf7363c33f5b27b38086cc8104082
> 
> Was it wrong or did the situation change since then ?

Then define it as having cells:

https://elixir.bootlin.com/linux/v5.18-rc1/source/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml#L42


Best regards,
Krzysztof

