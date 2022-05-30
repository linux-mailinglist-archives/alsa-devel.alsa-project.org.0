Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE76537472
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 08:48:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0892618D1;
	Mon, 30 May 2022 08:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0892618D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653893303;
	bh=vN3XM4Tk3zozSM4iUABa+ICVlHq6njWVhLE3VQLIARk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BOmUwo6FpjJbKdRZApc/tRpePsCEzBR0EnTUQO/lC1BggOswwsUncHT+O+1wWoTMU
	 YIJRyWlU3MrZUysQ3wyRc2TGNWz8tOu2DGEx016u/t8UesiqT8chX65bUHMbFoJ86I
	 k6b0IOtk9qdI7hQmarCP4ECkQipG9gZMaEUdfoDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FDE3F801F5;
	Mon, 30 May 2022 08:47:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFE8FF8019D; Mon, 30 May 2022 08:47:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 511A6F800DE
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 08:47:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 511A6F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="IKtAyacl"
Received: by mail-ej1-x634.google.com with SMTP id gh17so18904031ejc.6
 for <alsa-devel@alsa-project.org>; Sun, 29 May 2022 23:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xrqwB2lGToCBc+n6yqgpAq/qwvJrPGHrojmotRDLsjc=;
 b=IKtAyaclv+/udvM4J1zeyH39xL8DS2lor2+PCVpwyLvM8oa/ONWMY8HwrpoASrocHn
 HwbzPjz/cFil7MUweoTBV2wGpvHjq8BesQwmCVE3OEFurYL2s5mlP0JklIjmn7SMA42A
 YIOcQvTvQedjzTmlbqpZgpFME4pIQPJGhtb1t9wnIt+62g3xCUUPBH5WyJ3RE8O/PyM4
 rbBwjnsgusdAnWyBXhgNK+DrJMfuvb2y2R+VwnO/98oxKdCrbLbmF4RjplmSSEXaf9Le
 gpG0WFhnyknCCoz0NStiVkltHsk8j/FWMU21QluswTJxrlh2ELLz4rGA3NwBLIflplBi
 QcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xrqwB2lGToCBc+n6yqgpAq/qwvJrPGHrojmotRDLsjc=;
 b=nV6BkHbiAoINJkqh/cVY4sT3UNBhpNN9Rb7+wxEDkAT/g96vQhTVQqq4iNhibu7jtF
 n/9pLihhYFXbTq5pBG4eZtCh4GYuGloGAND1aajOqZCwuDukettnwRyqvkNsEuKt3kiD
 dJg7nSaStHXPHfVtjRwi2tasZusZmlJ+X7pJN5Cv9RpiwwtEfPm3SB98UMrrz4q450LP
 QBlRYLKTumBHIWzfeZpxuNF7d4nYuX13D83rEbY61TuE46QwIEX3a1CjBzBRkcJa0lES
 CWQ0T0Z627BCwODaLcnIZ0GU9ax6wEp8p8fxEQJdsWHQdHx7lLXW7F4opHYkB917VVGJ
 cKpQ==
X-Gm-Message-State: AOAM5329c+gVz2nihYpctcnz2KeZ9XHNsZBpF86tSXxO4V4YFpmntpWN
 6hKdnwh/ODC4I116WbYFB0Mj8g==
X-Google-Smtp-Source: ABdhPJxZjFdYQDaVPyTg6JpwNiieMtj79Gp3rSb2rXFI/eDktSp6zcMdBjr7J6dYdib+0gbBXfr6Sw==
X-Received: by 2002:a17:907:7ea2:b0:6fe:d945:7fe with SMTP id
 qb34-20020a1709077ea200b006fed94507femr28896841ejc.228.1653893234983; 
 Sun, 29 May 2022 23:47:14 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 kx17-20020a170907775100b006feded0fa87sm3682213ejc.218.2022.05.29.23.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 May 2022 23:47:14 -0700 (PDT)
Message-ID: <f284612d-c511-9a31-3e0a-e4fb1cc77c6e@linaro.org>
Date: Mon, 30 May 2022 08:47:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/6] ASoC: tegra: Add binding doc for OPE module
Content-Language: en-US
To: Sameer Pujar <spujar@nvidia.com>, broonie@kernel.org, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, perex@perex.cz, tiwai@suse.com
References: <1653647172-2569-1-git-send-email-spujar@nvidia.com>
 <1653647172-2569-2-git-send-email-spujar@nvidia.com>
 <149fbcfe-b62c-63a9-6c38-100d493788c3@linaro.org>
 <df57de4e-770d-7331-89e5-a2404fb42f96@nvidia.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <df57de4e-770d-7331-89e5-a2404fb42f96@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On 30/05/2022 06:21, Sameer Pujar wrote:
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-mbdrc.yaml
>>> @@ -0,0 +1,47 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/sound/nvidia,tegra210-mbdrc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Tegra210 MBDRC Device Tree Bindings
>> Previous comments - s/Device Tree Bindings//
>>   -  still applies. Please do not ignore it.
> 
> I did not ignore this. There was a comment from Mark on this earlier (v1) and I did not see further reply from you. I thought you were OK with the way it is. So if you are saying acronym part is OK and just to remove "Device Tree Bindings" I can send a v3 for this.

Yes, acronym is okay. Just remove the "Device Tree Bindings".


Best regards,
Krzysztof
