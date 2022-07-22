Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBA857EA09
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Jul 2022 00:46:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0C30184C;
	Sat, 23 Jul 2022 00:45:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0C30184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658529969;
	bh=q0GYJB53qaajgn2Rk8HKDPHWQvrBxjr3J6nXjmkYhtM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YIVbahowR5gmJ2f+LVQX0aDOGkz6NywXQFWPTJuvC9577JhHEMZ3wU0BVRTDQznxa
	 Kl9AUTjtmWo2539JT/2IaVYCspBNqTQ0EPfI5WSLNdNLuQABZA5FZoLw4AF+1qohYP
	 MEVPfEqdMqXga53WDF9gRP5oMj+MtT8AsmsbCqAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E648F80279;
	Sat, 23 Jul 2022 00:45:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE728F80246; Sat, 23 Jul 2022 00:45:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEF22F8016D
 for <alsa-devel@alsa-project.org>; Sat, 23 Jul 2022 00:45:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEF22F8016D
Received: by mail-oi1-f175.google.com with SMTP id p132so7073603oif.9
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 15:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=7XwmdpKQBMvYl+pH5ar534iWvJuw8dX5bUNNhw01JC0=;
 b=3+re1nnymmzV5jLHJ3gQ9q43THPUPFQf7UFLYPYoonr/bWIrlSuSnCJVD/mdvNcIlE
 IiC2fYbuhNOn2kCpgelPR3VAW8pnwAbPV+29+w2cWa0Fo8DVTNdqitr7FjcLVGkSRlOI
 7VK9XD6gB+gzLRUh/LHqVn8rlFfTqoJMaJUFdcRv3sf3cJSf0QolMseJeVuSw2Ix9RVG
 Cg/wtU/jSLqMkfegthVXmVi4oSrASZl5Zb5sQ55jOexTw1Spb4R7uxh0DgEsujU1ZVYT
 6mK5LptXL7iueZ2iSBIIFcmVGYTXzvWS4C748M9JeuCJvgmwik56+mDOiY3eX7/mlZHH
 AN1A==
X-Gm-Message-State: AJIora+/wPafLt9umAWcmnuxu4Uth2xstK8uEePTSVuFVxqN3Mzc5aNE
 4YPBMWAjXvfygh5H56HliA==
X-Google-Smtp-Source: AGRyM1t567gWXFWJV8Z8P3p6+RpUtCKsfkUs/yIOqGV6OA/Un4DLtV0hOWhNYRcnYaQXHgRiApZdsQ==
X-Received: by 2002:a05:6808:1286:b0:33a:9a90:68d2 with SMTP id
 a6-20020a056808128600b0033a9a9068d2mr861852oiw.235.1658529898372; 
 Fri, 22 Jul 2022 15:44:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a05683009c700b0061cb7f17ed7sm2466136ott.11.2022.07.22.15.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 15:44:57 -0700 (PDT)
Received: (nullmailer pid 20323 invoked by uid 1000);
 Fri, 22 Jul 2022 22:44:50 -0000
From: Rob Herring <robh@kernel.org>
To: Ryan.Wanner@microchip.com
In-Reply-To: <20220722152945.2950807-1-Ryan.Wanner@microchip.com>
References: <20220722152945.2950807-1-Ryan.Wanner@microchip.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: atmel-i2s: Convert to json-schema
Date: Fri, 22 Jul 2022 16:44:50 -0600
Message-Id: <1658529890.319757.20312.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alexandre.belloni@bootlin.com,
 alsa-devel@alsa-project.org, broonie@kernel.org, nicolas.ferre@microchip.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, claudiu.beznea@microchip.com,
 linux-arm-kernel@lists.infradead.org
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

On Fri, 22 Jul 2022 08:29:45 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Convert atmel i2s devicetree binding to json-schema.
> Change file name to match json-schema naming.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
> Note: running dtbs_check will fail unless updated with this patch,
> https://lore.kernel.org/linux-arm-kernel/20220707215812.193008-1-Ryan.Wanner@microchip.com/
> 
> v1 -> v2:
> - Fix formatting for clock description.
> - Fix formatting for dma description.
> 
>  .../bindings/sound/atmel,sama5d2-i2s.yaml     | 85 +++++++++++++++++++
>  .../devicetree/bindings/sound/atmel-i2s.txt   | 46 ----------
>  2 files changed, 85 insertions(+), 46 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/atmel,sama5d2-i2s.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/atmel-i2s.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


i2s@fc04c000: 'assigned-parrents' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/at91-kizbox3-hs.dtb
	arch/arm/boot/dts/at91-sama5d27_som1_ek.dtb
	arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dtb
	arch/arm/boot/dts/at91-sama5d2_icp.dtb
	arch/arm/boot/dts/at91-sama5d2_ptc_ek.dtb
	arch/arm/boot/dts/at91-sama5d2_xplained.dtb

