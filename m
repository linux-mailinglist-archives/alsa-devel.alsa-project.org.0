Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7493F573CFC
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 21:10:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F9E0174C;
	Wed, 13 Jul 2022 21:09:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F9E0174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657739402;
	bh=gvLxnwfcYf9Y3pRiZZFQ5lvdAiPOEjFM76rkyvYZ7C0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XfntIjRWlsbiUZPtWfgJMGlt+JP+QYSZhf0YJ/YUNaKt8cLEGGGO0dPAx8VKTwQvi
	 z79xcxJUbUxjOVqJViaFhDmrOMPZy1ZhrTD9e1KFIbx5VPz3J/IRcIsF8P2j3FxrX9
	 acsz5lJscbat6juaAEI7dYxOGHlcvy2eQBCiIU7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0596EF80254;
	Wed, 13 Jul 2022 21:09:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7F3CF80249; Wed, 13 Jul 2022 21:08:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 923BEF800AA
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 21:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 923BEF800AA
Received: by mail-io1-f48.google.com with SMTP id p128so11797323iof.1
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 12:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=gPp4fL4X3RNG52iSlBWKs2UeWMn8GTEKPSSMMNjkH1U=;
 b=Se0saM8R+DAKaXaF1l/qQieTACIfEGloN2r/Q73pldmJHQZ7iG7R1b/i85c+GX4D2B
 toIr+RPF8OgvRUBulU74aCSi45SFKPYlp4Q5b56hu1cUgxm1JDZEGh/yTA/rJ5aslnrp
 QaKy/vWNiLedNTHopLzusPqW0MEEsr8j4I68Npvkcls3l5Pv11+bFM6y6tez5F52OvC/
 19jl+6/YrkBOpZ+ufA4+ChIoyV0kz6PNiawupen1UkjO5bFLoiiYiT9Vn2IxSDWcByIB
 dxJdAZZFoKc30qDwl/1qNhc69mC/n34UuNvyAFl9Gn9S1na56WZLRUUSvWuQCivJ+eh3
 tP1g==
X-Gm-Message-State: AJIora+6KeWJ5MUBNQ4tC8ZcO9b5BpkK9VEZtJHLTPWDKWNhhtW7Eicx
 7NLGc3kUrrrNBVHpsTC6cQ==
X-Google-Smtp-Source: AGRyM1tgUY0yKG9P+IdNnaJ3ki7q6couzh1ID98oZ135ss6SXwXJQaykZeC8PS/uAXkXV0PG2IJogg==
X-Received: by 2002:a05:6638:4185:b0:33d:c7da:b119 with SMTP id
 az5-20020a056638418500b0033dc7dab119mr2732685jab.101.1657739329931; 
 Wed, 13 Jul 2022 12:08:49 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 h41-20020a022b29000000b0033f0a3a5fbbsm5566358jaa.175.2022.07.13.12.08.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 12:08:49 -0700 (PDT)
Received: (nullmailer pid 246144 invoked by uid 1000);
 Wed, 13 Jul 2022 19:08:47 -0000
From: Rob Herring <robh@kernel.org>
To: Ryan.Wanner@microchip.com
In-Reply-To: <20220713162538.139115-1-Ryan.Wanner@microchip.com>
References: <20220713162538.139115-1-Ryan.Wanner@microchip.com>
Subject: Re: [PATCH] ASoC: dt-bindings: atmel-i2s: Convert to json-schema
Date: Wed, 13 Jul 2022 13:08:47 -0600
Message-Id: <1657739327.994394.246143.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 nicolas.ferre@microchip.com, robh+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@microchip.com, linux-arm-kernel@lists.infradead.org
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

On Wed, 13 Jul 2022 09:25:38 -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Convert atmel i2s devicetree binding to json-schema.
> Change file name to match json-schema naming.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../bindings/sound/atmel,sama5d2-i2s.yaml     | 83 +++++++++++++++++++
>  .../devicetree/bindings/sound/atmel-i2s.txt   | 46 ----------
>  2 files changed, 83 insertions(+), 46 deletions(-)
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

