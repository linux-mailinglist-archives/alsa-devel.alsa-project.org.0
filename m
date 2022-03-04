Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAA74CCF16
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 08:32:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A14118B2;
	Fri,  4 Mar 2022 08:32:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A14118B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646379171;
	bh=fpNP7k3LdP5YaXaBSUcjZ5GsJ5QqcW8nCOoaUoU1z7w=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TlRHc17RTNGJIzXt4GrlmWqyKHcsvqSJEveX0/rzEMv0w6eVTZ4MAefuxng2//rXe
	 bNFwq2qMoQ0rBu8Cbnv0rGIOCSE0TqwAieFFpj6V0uG4nsvTPh2gqMy6PhNp12TI1X
	 LE7P1M6BR9XFJ+Yus+M63KAOPTTg6megGjW5X34A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F14DF801F5;
	Fri,  4 Mar 2022 08:31:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EADB7F800F2; Fri,  4 Mar 2022 08:31:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE72FF800F2
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 08:31:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE72FF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="Zyk9Sltx"
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0A90E3F5FB
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 07:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646379092;
 bh=znesbVorVsm63iCSSQmBPsZdwQn81pwm1UwoEW27Z4s=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Zyk9SltxFPRFG8PTfyNHHH2W7EMJBbcAlbxw0HEhMNndN/414D31h8qOCHjJvIgro
 2avSunDNuTPbWVOVZOSoTH8iP5V8YEIMu44BxcbFbSXc66IS69Ua090Pv4UCzOsMdg
 Mg3nf3fB8GCk+FU2+5LPpM5BuHacHBPO6OKO915j6jHOdNpES9fpn172A2O/4RPMu7
 DhvYK4sL67H9d2CU/bV0c4OGS7wVKGivDHHd849SX2PnwBBgo2WFlPCIEISLHIOGOu
 DalFhPDlVMrOms1zEE93KuBi2otyjIABpwUBPQzULECKuWxoMKtm1BF8l34f339UAB
 8mISGJp8yHSNQ==
Received: by mail-ej1-f69.google.com with SMTP id
 le4-20020a170907170400b006dab546bc40so751691ejc.15
 for <alsa-devel@alsa-project.org>; Thu, 03 Mar 2022 23:31:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=znesbVorVsm63iCSSQmBPsZdwQn81pwm1UwoEW27Z4s=;
 b=MvorLaYI5d9RvUG4gSKNSB4QCHf0X4rkthcp2e0vz8Bb+X1OzFsQ2uP5v8gJ/CRyqR
 9nZ5doEtN1KwjE3EH7R4vUwXGzH5kY3MnibqIqB9Poz0F6egNVqgY8UBhnlVnTMl7ltr
 zxQDQTN5suWdagwBdDOg1D52Wyff3Cz9NtvV80hTr75iuEQJTDS8QZmv5H30A/0pr2el
 qiyae/YHiGzoZCZv4siHcAdNTCylvdGfFw23yKDMZbc5DR3Q/UfhwoN9kA663WGGZ/aW
 ZDfgTzxZZf5rdAwt3+sGy0+yxnQoZ+fA/ACTiqPsc8Y1rwxloywEjmTusFN7iS5LYnj3
 dJnQ==
X-Gm-Message-State: AOAM532ql6Z6mw9Ng8d8nRc/ny7e65HWXkBSpLq+ustCLn1LjL1jXUBQ
 F/ONmNyUTcGIKv8MouOPjqP4flNjmfOX6ETPxJdcX/FK18nqOnwnB4vNGizXwl/YnaDseneJsNX
 wrcxxoxfiJKd+xFUVUWE49o/0m86m3//3tj2BI1v/
X-Received: by 2002:a17:907:c0c:b0:6d1:8c46:6415 with SMTP id
 ga12-20020a1709070c0c00b006d18c466415mr30485463ejc.326.1646379090644; 
 Thu, 03 Mar 2022 23:31:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGxs7X16ZzeLCZ/AHvyM0eIiEfVTT/3+RbXNFeYwjEzaLA6uLgNdT/DxKdJK+w4/ntCeI8hg==
X-Received: by 2002:a17:907:c0c:b0:6d1:8c46:6415 with SMTP id
 ga12-20020a1709070c0c00b006d18c466415mr30485439ejc.326.1646379090348; 
 Thu, 03 Mar 2022 23:31:30 -0800 (PST)
Received: from [192.168.0.138] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108]) by smtp.gmail.com with ESMTPSA id
 t7-20020a1709063e4700b006da6357b1c0sm1445738eji.196.2022.03.03.23.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 23:31:29 -0800 (PST)
Message-ID: <53fbfcde-0f5e-8ea2-4bca-c7a414f96c57@canonical.com>
Date: Fri, 4 Mar 2022 08:31:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3] dt-bindings: mfd: Fix pinctrl node name warnings
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Linus Walleij <linus.walleij@linaro.org>, - <patches@opensource.cirrus.com>
References: <20220303232350.2591143-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220303232350.2591143-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
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

On 04/03/2022 00:23, Rob Herring wrote:
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
> 
> diff --git a/Documentation/devicetree/bindings/mfd/brcm,cru.yaml b/Documentation/devicetree/bindings/mfd/brcm,cru.yaml
> index be4a2df71c25..b85819fbb07c 100644
> --- a/Documentation/devicetree/bindings/mfd/brcm,cru.yaml
> +++ b/Documentation/devicetree/bindings/mfd/brcm,cru.yaml
> @@ -39,7 +39,7 @@ patternProperties:
>    '^phy@[a-f0-9]+$':
>      $ref: ../phy/bcm-ns-usb2-phy.yaml
>  
> -  '^pin-controller@[a-f0-9]+$':
> +  '^pinctrl@[a-f0-9]+$':
>      $ref: ../pinctrl/brcm,ns-pinmux.yaml
>  
>    '^syscon@[a-f0-9]+$':
> @@ -94,7 +94,7 @@ examples:
>              reg = <0x180 0x4>;
>          };
>  
> -        pin-controller@1c0 {
> +        pinctrl@1c0 {

DTS also need such change.

Best regards,
Krzysztof
