Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2595B4F07
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Sep 2022 15:29:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1002516D1;
	Sun, 11 Sep 2022 15:29:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1002516D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662902994;
	bh=+TTE0PjXQmESjldWvUGUy0L9sNgYQU4qB1x8d2ZsoG4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rw31DdfPxNCa6si/maTTZw/V73ZK9kq8a2fAUZl/MXJnQ+hTUVsHZPJVr9r6jR3h7
	 suesv8zG2IQXfVTEZtsmPXA4DzEahdh6mUJckjlrOs8XYzMUCMUpdL+GRhfba55YpV
	 b/c3mY0hGuDK5y7zi3R8GYXpOmnyxJzKFYrs+cPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AFF3F80425;
	Sun, 11 Sep 2022 15:28:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9822F80256; Sun, 11 Sep 2022 15:28:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64AE9F800B8
 for <alsa-devel@alsa-project.org>; Sun, 11 Sep 2022 15:28:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64AE9F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="me0+3UlN"
Received: by mail-lf1-x130.google.com with SMTP id bt10so10699974lfb.1
 for <alsa-devel@alsa-project.org>; Sun, 11 Sep 2022 06:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=+9UPKb7Ii6FzBDArfIx0mfVT3Zwlk63jeV9czZ35D+0=;
 b=me0+3UlNEKv/v6DZqOPfcO4uSIDs3xkvdhHto4CLAR3VdMynR1c1Kbm3ZYrqIGKYfJ
 VLVB5MrinHp2+2Q3tl+14ZONtMbB+Xr6x0VJpnggNCZYXJwf7RTHoyqiOp+Vl6vjYZGg
 a5j3ubD8QHTK+OTZsBZ8ny6TrkyuCzAIkTLpMQW6OJFkU0x2x3TWHcH9lX4H1SsMoEsd
 v0pgK4CNWQjqw2ZBDAGNeIfkOzqmTcl6bfO+pJv55s0Df1cqB7wmquEsIOuZHuD5DTKF
 d9P1NH3QDR3ctRs0Im7NPYhBI78zEj/plZZlyMypPV4D9IRJeWwZsvcQiEZ9fkXpvZAS
 q+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+9UPKb7Ii6FzBDArfIx0mfVT3Zwlk63jeV9czZ35D+0=;
 b=IdQTCpOjnBeMA0hgtI2J1dpQkJ9ePullXYC1CEmXrMWPJxYWP+EdwWKzpLxkA4bnc+
 I2u5I0a/aF7BTYEy9tvrPF+596vvvqHXsnOeqpyVxs6RZIJv7xHu8LlMFJw8fcAhRwj0
 YAFDc8xnifmA9HXkqv4FqM8Lb+byYRojzVWj9IVN8IxIQ1wqx2L4TtIjRaFXCPiZViLv
 6tVznIIEVmDZM7SapknNV3hZFqr4VyZ87WZ33Ce3xPOHR367MXaPrDy1yQ2MiC5KUm+8
 k8wHwcdnvF1MgEbJJCefl7xeLhP621K70f7WJX90WUJ1prpqwnnDnqCecGIom2GkaDaq
 Nt5g==
X-Gm-Message-State: ACgBeo1GZ1WnfkjnAbOJK/p93Mp4Leuh/l0rL5k4Bs+kCwYaiaMnj1+q
 6vdOxjarKmA5OrkubjLYrSGUmQ==
X-Google-Smtp-Source: AA6agR5Qa+jJgnLCmlDWo1wDT3VmVkwiXfyp+ekNEOEo4vuUYmkt4gZpNxtizVLDAYMar2xpMDVxVw==
X-Received: by 2002:a05:6512:280d:b0:498:fd40:51d4 with SMTP id
 cf13-20020a056512280d00b00498fd4051d4mr4083477lfb.167.1662902922803; 
 Sun, 11 Sep 2022 06:28:42 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 bj24-20020a2eaa98000000b0026acfe1b3b4sm674886ljb.17.2022.09.11.06.28.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Sep 2022 06:28:42 -0700 (PDT)
Message-ID: <1bfa4397-47a1-ea46-5ced-8b69fb2452c0@linaro.org>
Date: Sun, 11 Sep 2022 15:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v9 2/2] ASoC: sun50i-dmic: dt-bindings: add DT bindings
 for DMIC controller
Content-Language: en-US
To: =?UTF-8?B?54+t5rab?= <fengzheng923@gmail.com>
References: <1661872039-40174-1-git-send-email-fengzheng923@gmail.com>
 <25072fba-64e2-df11-c8f0-a274037141f0@linaro.org>
 <CAE=m619qeaDYkWiB5kh50gY1Kndyrvo4oZuZjFKRCKK=j99K2w@mail.gmail.com>
 <0b8b2e01-5209-6437-c79e-3cff9b29bfcb@linaro.org>
 <CAE=m618WS-RKgWn6r1=Zfsd5N-gp3A4S725RtbDKDQ4PLsBk5w@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAE=m618WS-RKgWn6r1=Zfsd5N-gp3A4S725RtbDKDQ4PLsBk5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 samuel@sholland.org, lgirdwood@gmail.com, jernej.skrabec@gmail.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, wens@csie.org,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 11/09/2022 08:18, 班涛 wrote:
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> 于2022年9月8日周四 17:22写道：
> 
>> On 07/09/2022 15:03, 班涛 wrote:
>>>>> +++
>>>> b/Documentation/devicetree/bindings/sound/allwinner,sun50i-h6-dmic.yaml
>>>>> @@ -0,0 +1,79 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id:
>> http://devicetree.org/schemas/sound/allwinner,sun50i-h6-dmic.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Allwinner H6 DMIC Device Tree Bindings
>>>>
>>>> s/Device Tree Bindings//
>>>>
>>>
>>> So, modify it to 'Allwinner H6 DMIC Devices Tree Bindings', sure?
>>
>> You pasted the same message, so what is the modification? I wrote you a
>>  search&replace pattern.
>>
> 
> "s/Device Tree Bindings//"
> I don't understand what you mean.

It's a search&replace command from Unix tools...

https://www.cyberciti.biz/faq/how-to-use-sed-to-find-and-replace-text-in-files-in-linux-unix-shell/

https://vim.fandom.com/wiki/Search_and_replace#Basic_search_and_replace

Just remove that string.


Best regards,
Krzysztof
