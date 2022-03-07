Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0ED4CFD3E
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 12:45:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A182016F7;
	Mon,  7 Mar 2022 12:44:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A182016F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646653527;
	bh=XFHWg6bfpa5kzeaxDwST4Tl1SnfDnL+6gXb7udOInQ8=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=txR2iS0RA8mqIag05sJFcimSdhgO+7VRajAhjbaF/UuGnczAukrk0CPjrx5CzKgE1
	 w3hNYvSdzEZ16YBxoLAclbILVnLG+WDtsUHZYk0gim5e95wZ7FjGNuYvcQdsnr+cjL
	 hSLocCxsCpJoWx34e5yI7YLmCYCv+xZHDP7pwhKo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1152DF800D1;
	Mon,  7 Mar 2022 12:44:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A75B2F800D1; Mon,  7 Mar 2022 12:44:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99711F800D1
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 12:44:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99711F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="gweIYlmn"
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6EA383F1AF
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 11:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646653448;
 bh=7K92x3leOgbA5D2Deikx6J1ja1DW43dq73YDI+O/z/4=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=gweIYlmnNizpvo5NYP/2s81BKD9iIPl/FuoF+hqYJC+m9s9eYuqDQVBpW7E6yT0Vq
 9/iFLGbneWn7Bp07peIsx/QLQtL2gqXlQoOaWNQNkj26Rpwk5t/Ni4DmOH76vKMX1Y
 WxUZ5nasahYxog3iwu4VqEQY99rQ/XVNvauP0sLfJ5ZlEY+Pj5WbBWt25pWJOo4dAR
 NkdzEqcAE2wb7F7fo0HZwZ1Ad3pndl7s7DuVePolYV0vJkAfGZlSnaJWF1kOlEmfa+
 5ZCyNXw5EfPo2DnliSBlRwxyGGEe5bRPwOGIbtHwyGYvBBCBpkU9+B6SqhEe581HXz
 NdYYHYd7TDOhQ==
Received: by mail-ed1-f71.google.com with SMTP id
 r9-20020a05640251c900b00412d54ea618so8402769edd.3
 for <alsa-devel@alsa-project.org>; Mon, 07 Mar 2022 03:44:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7K92x3leOgbA5D2Deikx6J1ja1DW43dq73YDI+O/z/4=;
 b=f6gBZl5MhjdNoQoZk1AxnzoYR21pUAlU3D33Q7ASxUYp65M73206bhNQPq8XrJ3Xvg
 dUeJZKIYrH8lq3Qda+G5tWEk2Uyt9okWmdDVygqPi13AeMNT5zqz7SQYF6fe5M0p+fNx
 y8p1tGp+Q4gvHbeZWhLggr3iFSKBqaxr1tdrUK7H6c6A++ImWgFz5DUUuhl2G1esT4Zr
 t2Gp6vSu/hyhdso2Rh8gEYV5DG2bB+qgY71p5aQVw6UB+zpG5DFzfU++kbjzzH5qb9zg
 3C7VVwogdABPLkWZkyryS/Xmukxdo8XGKqCZcKQOCEbJDWoSCzbugKVJYYLHLnYbuzi1
 EKdw==
X-Gm-Message-State: AOAM533O1SKfmRN9loTr0yURAU3g5eCCYN9sm6CnWryRyYme53QqUfxo
 oLTp+igpDRkLBTWd3HAt0ksNi6f2N7c6hmrsaOAVaLCROydnXsvys56fW3BqhSp5t62mn2e2d7C
 yJDdWXzphs/Ygk5AytzQLf4L0B2ofwYgoWdB/dJJj
X-Received: by 2002:a17:907:608f:b0:6da:8d84:e272 with SMTP id
 ht15-20020a170907608f00b006da8d84e272mr8959405ejc.559.1646653448161; 
 Mon, 07 Mar 2022 03:44:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7CquB49ISr7Cb3Um7I9XdJ9HGKHMsRL215XarEZGvF2Bjnl7tyullhjBdnRCd/oaHDZEQ6A==
X-Received: by 2002:a17:907:608f:b0:6da:8d84:e272 with SMTP id
 ht15-20020a170907608f00b006da8d84e272mr8959392ejc.559.1646653448011; 
 Mon, 07 Mar 2022 03:44:08 -0800 (PST)
Received: from [192.168.0.142] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 dx10-20020a170906a84a00b006da8608e09fsm4624043ejb.9.2022.03.07.03.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 03:44:07 -0800 (PST)
Message-ID: <ff33d3a5-d2f3-8a7d-204e-0ab7205b932d@canonical.com>
Date: Mon, 7 Mar 2022 12:44:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/6] ASoC: dt-bindings: Document Microchip's PDMC
Content-Language: en-US
To: Codrin.Ciubotariu@microchip.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20220307100428.2227511-1-codrin.ciubotariu@microchip.com>
 <20220307100428.2227511-3-codrin.ciubotariu@microchip.com>
 <73c49f2b-ef2e-5ed8-f3d5-aa696f9af9e6@canonical.com>
 <38975dd7-2f54-8920-af28-0a002f0faf5e@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <38975dd7-2f54-8920-af28-0a002f0faf5e@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: lars@metafoo.de, Nicolas.Ferre@microchip.com, robh+dt@kernel.org,
 tiwai@suse.com, broonie@kernel.org
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

On 07/03/2022 12:34, Codrin.Ciubotariu@microchip.com wrote:
> On 07.03.2022 13:18, Krzysztof Kozlowski wrote:
>> On 07/03/2022 11:04, Codrin Ciubotariu wrote:
>>> +description:
>>> +  The Microchip Pulse Density Microphone Controller (PDMC) interfaces up to 4 digital microphones
>>> +  having Pulse Density Modulated (PDM) outputs.
>>
>> This exceeds 80 characters.
> 
> I thought it was raised to 100. checkpatch doesn't report anything also.

https://elixir.bootlin.com/linux/v5.17-rc7/source/Documentation/process/coding-style.rst#L104

The hard-constraint was lifted, but still 80 is preferred, unless
readability is increased with 100. That's not the case - readability is
the same, so keep 80.



Best regards,
Krzysztof
