Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0B84D02CC
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 16:27:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4826516E6;
	Mon,  7 Mar 2022 16:26:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4826516E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646666834;
	bh=lXa32raXsQ9vY23dNSesnIWnu9snxEoY/T+ghdLPcU0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JRO7mpEfOri/TA9VZv3xs+o3VgJOdEOFK+fidDfJ8qjsap9M/jNQNjuze/BagSiOK
	 aB0O7qX094okkMj4gucPe4Tnf5nuFOxEMDyNSxRkOlHZ5kCv1cUfcl0VYNuOm01vzq
	 9eXkti3CVRf10GK11R8AJPyt5UQVUr8bQILg9WCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1B3BF80159;
	Mon,  7 Mar 2022 16:26:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13823F8013F; Mon,  7 Mar 2022 16:26:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27D23F800D1
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 16:25:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27D23F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mvht7xuj"
Received: by mail-wm1-x32f.google.com with SMTP id r65so9420424wma.2
 for <alsa-devel@alsa-project.org>; Mon, 07 Mar 2022 07:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DLjppdPNclxnNzxkIl9swnhWDLoAKxeSBraXfxGifqM=;
 b=mvht7xuj6s4o9ZmX01iGIYCekCMF5uknxVLhzqWHRYyb3H+53XvrBpIOzqeh/RmImy
 DVprzHQIKou6ak1OByLmRVF0+Rsoejr/E4OX5HKMpktnQrORwlPV+b5rtkZANtWNcVP1
 kC/o+gK7h84s0KoAPBJUaRU4/MDswY3zqd6kR39dyk1akJBoyipXMp6lWaY7oBhCoeHw
 7A2LfUA8coeKRQ5sIFSeOIDVVW0UfYe5CgE5Nj8UTBbdPTxxjvfbQLK+HomiRW4k0rsb
 P/iJoXTHitpuOOpZhqCiM58A2eXJf8OJj1wqtwtDV6jNflvctVDQux35yyhKoCDO4C17
 UGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DLjppdPNclxnNzxkIl9swnhWDLoAKxeSBraXfxGifqM=;
 b=5+YqD2JeYvjC+dg3fFZzVTzxSEN1upXyXONWDpqY/LUZ7KVWlRBhqClmJbCOZqA4Tu
 WWDHda8iRI4EaQrH1Jk3DB3t7HmG2Z68Wc3PJAiIWx7IA77hbryJZ49XAy2J4acHJgSA
 YQQpKJ3KwbR4PIWn3dqWcIIFDFcaRwE16KthNAM6na0dM/ZcTsxoo+fR6r48pYdnIA1D
 p1ycyRo7Q34Sy9xS9GgCHujkt1fPICwgDUDPHDdUbOQ2YdsHzixi5BG1OAHPS8uZQJUU
 KMRUZ1esfRyv2/VR3YDjLnrdiQUXtQ+dMYD67jDPejJNKCqGy8jKc4VF55AnyEqp8HA1
 k0UQ==
X-Gm-Message-State: AOAM532DM2cmSRe8dutSTzDjVLILJYwuIlBfa63o5vs7XpHO1C0a2KEb
 8YS7hcMv9Z7ZndxB4mPqaeIxSw==
X-Google-Smtp-Source: ABdhPJwJyR6cT4CTpBHIlPWPVhFMW6Ck7YuUXyzycoVnA8ADZTVr5V4Yj4gd+AJbniIckaYf+dADbg==
X-Received: by 2002:a7b:c2f7:0:b0:389:860c:6d3d with SMTP id
 e23-20020a7bc2f7000000b00389860c6d3dmr9581242wmk.116.1646666757953; 
 Mon, 07 Mar 2022 07:25:57 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 h36-20020a05600c49a400b00382aa0b1619sm12843430wmp.45.2022.03.07.07.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 07:25:57 -0800 (PST)
Date: Mon, 7 Mar 2022 15:25:55 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: mfd: Fix pinctrl node name warnings
Message-ID: <YiYkAz0Xk2y3vytU@google.com>
References: <20220303195034.2261989-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220303195034.2261989-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 - <patches@opensource.cirrus.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
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

On Thu, 03 Mar 2022, Rob Herring wrote:

> The recent addition pinctrl.yaml in commit c09acbc499e8 ("dt-bindings:
> pinctrl: use pinctrl.yaml") resulted in some node name warnings:
> 
> Documentation/devicetree/bindings/mfd/cirrus,lochnagar.example.dt.yaml: \
>  lochnagar-pinctrl: $nodename:0: 'lochnagar-pinctrl' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
> Documentation/devicetree/bindings/mfd/cirrus,madera.example.dt.yaml: \
>  codec@1a: $nodename:0: 'codec@1a' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
> Documentation/devicetree/bindings/mfd/brcm,cru.example.dt.yaml: \
>  pin-controller@1c0: $nodename:0: 'pin-controller@1c0' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
> 
> Fix the node names to the preferred 'pinctrl'. For cirrus,madera,
> nothing from pinctrl.yaml schema is used, so just drop the reference.
> 
> Fixes: c09acbc499e8 ("dt-bindings: pinctrl: use pinctrl.yaml")
> Cc: Rafał Miłecki <rafal@milecki.pl>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Fix lochnagar-pinctrl nodename in example
> 
>  Documentation/devicetree/bindings/mfd/brcm,cru.yaml          | 4 ++--
>  Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml  | 4 ++--

Acked-by: Lee Jones <lee.jones@linaro.org>

>  Documentation/devicetree/bindings/pinctrl/cirrus,madera.yaml | 3 ---
>  3 files changed, 4 insertions(+), 7 deletions(-)

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
