Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B594E3997
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 08:29:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99FE416CD;
	Tue, 22 Mar 2022 08:28:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99FE416CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647934161;
	bh=xwYI/GjpA+D0alZlqZJKLtwSvNurQ5BHAbfpu2KYW1M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jn0WibDWUG9tMzUmQ7hX+5cikik9PkqgPvnjV4z729F/QU9Woog0a1D27j5NwJEb7
	 aIAa68Kwc5HmhQYbhPafHJ4K392Du2UZMARWKar3eC1YBysWtVii9LXUK/fTZOU66T
	 ohCnauSuIqm36AwIelXBcO8Zs6E8pq9tFjns5UBs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DC02F8047D;
	Tue, 22 Mar 2022 08:28:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 751F3F8016C; Tue, 22 Mar 2022 08:28:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B4F8F800FD
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 08:28:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B4F8F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vucamHCL"
Received: by mail-wr1-x429.google.com with SMTP id h23so23015704wrb.8
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 00:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=38s+vFh4hN6ma2OSEAh7532IeRnJs07vXfLx/FtTkeI=;
 b=vucamHCLCQ2IfBbc8GHxp5tlFQuyNU8dW3Bij+q2zvk5mWjPWiFriQ0nCNUerHF76w
 etA07VHJUUuBtndKIekxQRZ3AoouuVRcGZiyWY9dz8NelgiXQagbIQH2dKUxde1wutWF
 yK/y3ahbHCff65xR17gXHvDjSvg2ZEc9/QlsEFO9g8cnvYfX0wy1OoljQtfTxLNXdHyS
 5rh4+RfVULw2BppPS+qAy7AAfLROY8MXidF6g3uV0V+BjsvZgdVUAAh4Yl3Q9/iJpvHu
 Knf9mCXbrTb9dSUAvTMZ7OlurxJn8q/nSiNyp/Df6Ly3jgtwmRScxgViIr6wOY1taXXi
 qX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=38s+vFh4hN6ma2OSEAh7532IeRnJs07vXfLx/FtTkeI=;
 b=HhLHyTsNtf5PkLUIpumnHME2ncfbIHjtLD8CwUMkQwwehlhwKFSgo5HYjlhpRsdRf/
 fsyzvP52GPj2CRhtQf65FduqS6GLRkPlFKStWansvM0oOoJEN30NXvabvde20n/x65j7
 9nguDtVZY1kTP/Xtj7cX0igIMQoN0mdB7aRBoiUtwSBgWaw/zKClgvOyGVzm5yvsWBDm
 klUWMx6PeBQ/4guz5PH8nGdTnnu1ce5ZtuD/azLdvZfysFywwCFjQwyzFFEiG0BV/Ak4
 dE8LAHa4PVg9Q9p3tr4C+qOrkURXbDP0oCGkFCNHnXtBN7spAc4Eb4KCrJXc6BbmRbQF
 TiMQ==
X-Gm-Message-State: AOAM532J0wmlcAi3VWj7GuF1WhlTsrVgZGSP8wsNg5S8gyvJxaCvUgYW
 r3UFz9BLxWjjoi2LyrbDi6lM1w==
X-Google-Smtp-Source: ABdhPJxw76tp7UaWDyAzzlAXHenQ+pVHhGiPNLiCsPef6Wq5fjJ0xKBS3IZng/PGd8GOGsaF9wcHnA==
X-Received: by 2002:a05:6000:1ac7:b0:1f1:f9ee:7c57 with SMTP id
 i7-20020a0560001ac700b001f1f9ee7c57mr20441117wry.52.1647934078865; 
 Tue, 22 Mar 2022 00:27:58 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 j5-20020a05600c1c0500b0038ca4fdf7a5sm2053486wms.9.2022.03.22.00.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 00:27:58 -0700 (PDT)
Date: Tue, 22 Mar 2022 07:27:56 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: mfd: Fix pinctrl node name warnings
Message-ID: <Yjl6fP2Bylv6ud8W@google.com>
References: <20220303232350.2591143-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220303232350.2591143-1-robh@kernel.org>
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
> v3:
>  - And fix lochnagar-pinctrl nodename in 'required'. Sigh...
> ---
>  Documentation/devicetree/bindings/mfd/brcm,cru.yaml         | 4 ++--
>  Documentation/devicetree/bindings/mfd/cirrus,lochnagar.yaml | 6 +++---
>  .../devicetree/bindings/pinctrl/cirrus,madera.yaml          | 3 ---
>  3 files changed, 5 insertions(+), 8 deletions(-)

Requires rebase.  Doesn't presently apply.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
