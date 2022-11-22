Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 392CD633773
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 09:50:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3E5D1F0;
	Tue, 22 Nov 2022 09:49:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3E5D1F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669107021;
	bh=wEsiUGpYUea6sqDdPm6N89L1KJRG9T4ivGnAgofL/XE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BLzMlIcHnsI23Nydb4vTUKL+M7wY5NnV+Iznp9f5HTEKNf8FZJhqSTkxsm5QTxwVb
	 xtYCJ7m7zFOKKoa+nT+fYzI/VZ8cjBIPnjDtPv1GbvjEf1Zb6aBseZ9RxcKAcAwkgs
	 LKGx4CjCeqDQx3KPdmGDLXPU2ba4AtrrWBEbbYzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B972F80310;
	Tue, 22 Nov 2022 09:49:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8C0DF80272; Tue, 22 Nov 2022 09:49:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, RCVD_IN_ZEN_BLOCKED_OPENDNS, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9746AF80115
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 09:49:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9746AF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KwrNqp1P"
Received: by mail-lf1-x129.google.com with SMTP id j4so22617249lfk.0
 for <alsa-devel@alsa-project.org>; Tue, 22 Nov 2022 00:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jEnkh3zk4jO+MDyInigAIrpi1FWlUFSvLcU2rQzTmRQ=;
 b=KwrNqp1P7h9O4XSWXQdKrnp9jleHGWBxdWetGuugUOnrGaqRc7JWf2hvz1nHeE85zO
 tq/tkRftw/5q7lyH9RgHkbYo/Xx6ST+xmgL//90Im9eZyhzzSYhgwOOZcm49xSbfx5kU
 rMUBqLnU+v+Ve+O9r15k1JovIBOQ0vsRclfcXNH7r3HritjeRcIlIWcSL3BOZJ5sBMHG
 FXXJNWvpPxhKwmYhTNSSgDH9p92dYPe9LJ7b7Lnx94OspR7cqLq0LS96rkydHMVTMWGN
 HxVyoLAuHPF0AaUpfdSqLwsKnmRyM34boTp6kpvqQfqYi/4QDOfO5TDOsGm1Em5gnkdP
 xnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jEnkh3zk4jO+MDyInigAIrpi1FWlUFSvLcU2rQzTmRQ=;
 b=Rzo4XaWIgy5kO/elLGnfo3R+uCvRpDV1VeAAAv2+fmfYVBYBabGBDNNuDzNcLQyItE
 Imm9QxhbR44J/XHpU38yFzns2rIT1kCxapBtM3IjHd79GzNfwm/33XLu8nMr8zaegEqs
 BJ1tWZocKpz1H0xnzJNUEJ6OhwUbU55JT09NIH3ptZn7Ng7f0YBy2HusynZ0uDwzvTkR
 +exggTKJVsU5R9LdRSUKxRoymrxtB6qwxgR4HNCqacw5NYOqAEvOkkVthmK1Qk1iIJ3D
 wQkZ5dMYZxTcuvBbnS1VNEcQXrWdkeRb4xMWm0nwrKpJiOSNppFH6BBKUKHrBAOjI8Ac
 bO1g==
X-Gm-Message-State: ANoB5pmDkPZQuJzL+nAtINWBdEmheC75L4h8hjrRjMAsK5YQ5RZHWdrj
 UDvMVPqCPWnNtKzE00khydsZQg==
X-Google-Smtp-Source: AA0mqf4r+HSOOP4lvZPpqedwiqd5uq37QoTBeb8cGRzkem43lIfDYDA63nIfFrpb4g0hBbDIy3ZvfA==
X-Received: by 2002:a19:3818:0:b0:4a2:4e8f:746 with SMTP id
 f24-20020a193818000000b004a24e8f0746mr2325218lfa.528.1669106954522; 
 Tue, 22 Nov 2022 00:49:14 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 dw7-20020a0565122c8700b004a91df49508sm2403562lfb.177.2022.11.22.00.49.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 00:49:13 -0800 (PST)
Message-ID: <53909e4f-ecab-b942-82cc-3b882c7d1938@linaro.org>
Date: Tue, 22 Nov 2022 09:49:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: Move fixed string node names under
 'properties'
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jerome Neanne <jerome.neanne@baylibre.com>,
 Andrew Davis <afd@ti.com>
References: <20221118223708.1721134-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118223708.1721134-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On 18/11/2022 23:37, Rob Herring wrote:
> Fixed string node names should be under 'properties' rather than
> 'patternProperties'. Additionally, without beginning and end of line
> anchors, any prefix or suffix is allowed on the specified node name.
> These cases don't appear to want a prefix or suffix, so move them under
> 'properties'.
> 
> In some cases, the diff turns out to look like we're moving some
> patterns rather than the fixed string properties.
> 

Yeah, quite confusing.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

