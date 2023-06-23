Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F261773DDC7
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:36:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28F00E94;
	Mon, 26 Jun 2023 13:35:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28F00E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779392;
	bh=jJtJ/GmDeff0DrYeAIlIKUgmaRtyXPMOA4Fr78rVGas=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HV6wxp594r8JbdRwJ2ZaeueTQLcNk6HF2Ez+RU3yL10vVY0QC4y1UlycHMpLSGbY1
	 GPIBaBFs6fiHi7CKgqq4b2D2dGAZLeAVNJlxoEm2xBD8plQ9CZFuodn2L50GKnq3U/
	 z/qP/r48J+0SaQFoyZbdmbMFoWFFJPYkSA2b+/Hw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A941F8057C; Mon, 26 Jun 2023 13:28:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1227F806D5;
	Mon, 26 Jun 2023 13:28:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B18DFF80141; Sat, 24 Jun 2023 01:43:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40303F80130
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 01:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40303F80130
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-34220bb6a80so4384035ab.0
        for <alsa-devel@alsa-project.org>;
 Fri, 23 Jun 2023 16:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687563796; x=1690155796;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fTiyezCl+ncjMsIOOS0sUB9bYyrGCDjIJOvndxohyZs=;
        b=MU/wzR4PbP8yGt0Vny4XWo7hCpozUz0bv9WulLt1gPAKLFLGU9/TWjrMxP74ZXnyFs
         CiQ+0K1tgOVMszzaWtxeoLaxnGSKWeDnpTFZ11oFV/K6FJh/tyg3klzEpIGczd9uc/Nf
         cUIf9STFV77gmDlCHDvvgivOWDaIgeBiotsWU6m2u5Hf6MxgjV5xdRD8HhfOg92UuNKr
         sHBSmgvWLnho/MeiNpzubTrtj53SJq7BUGrAEjj1G/opXfjvOADHSRT5g/kGGaR9xGKf
         +4uSzO6vq7lcrxTSPKVXI9uEpBit0GREQe1pq+Xnqm55bIV90ggtPirwzi6Um6NX6NE0
         M9nw==
X-Gm-Message-State: AC+VfDwEyNXZVlly5JrQRVQRqVQv7wABaJKeOiazXstqVtA6Eyahk0s8
	5yuu8yaQvN4UJBp6HH3Nig==
X-Google-Smtp-Source: 
 ACHHUZ704nUo/Qe+1L5BBq/vh9K03eeZluxsw6d51akGW3mbLVGxB1UGHdSEiXEdc5xMZV7l5fDOHg==
X-Received: by 2002:a5d:9483:0:b0:760:e308:107e with SMTP id
 v3-20020a5d9483000000b00760e308107emr15001057ioj.0.1687563796356;
        Fri, 23 Jun 2023 16:43:16 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 r27-20020a02c85b000000b0041407c67451sm72416jao.165.2023.06.23.16.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 16:43:15 -0700 (PDT)
Received: (nullmailer pid 1606691 invoked by uid 1000);
	Fri, 23 Jun 2023 23:43:09 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: ulf.hansson@linaro.org, krzysztof.kozlowski+dt@linaro.org,
	edumazet@google.com, broonie@kernel.org, arnd@arndb.de, maz@kernel.org,
	lgirdwood@gmail.com, alexandre.belloni@bootlin.com, alain.volmat@foss.st.com,
	p.zabel@pengutronix.de, mihai.sain@microchip.com, soc@kernel.org,
	linux-mtd@lists.infradead.org, cristian.birsan@microchip.com,
	jerry.ray@microchip.com, tudor.ambarus@linaro.org, miquel.raynal@bootlin.com,
	richard@nod.at, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	balamanikandan.gunasundar@microchip.com, lee@kernel.org, olivia@selenic.com,
	sboyd@kernel.org, mturquette@baylibre.com, kuba@kernel.org,
	Hari.PrasathGE@microchip.com, linux-kernel@vger.kernel.org,
	balakrishnan.s@microchip.com, alsa-devel@alsa-project.org,
	durai.manickamkr@microchip.com, sre@kernel.org, vkoul@kernel.org,
	linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org, andrew@lunn.ch,
	devicetree@vger.kernel.org, nayabbasha.sayed@microchip.com,
	linux-gpio@vger.kernel.org, nicolas.ferre@microchip.com, davem@davemloft.net,
	pabeni@redhat.com, linux-arm-kernel@lists.infradead.org, linux@roeck-us.net,
	wim@linux-watchdog.org, tglx@linutronix.de, horatiu.vultur@microchip.com,
	radu_nicolae.pirea@upb.ro, dharma.b@microchip.com, a.zummo@towertech.it,
	linux-mmc@vger.kernel.org, richard.genoud@gmail.com,
	claudiu.beznea@microchip.com, linus.walleij@linaro.org, conor+dt@kernel.org,
	herbert@gondor.apana.org.au, eugen.hristev@collabora.com,
	dmaengine@vger.kernel.org, netdev@vger.kernel.org, linux-spi@vger.kernel.org,
	linux@armlinux.org.uk, linux-watchdog@vger.kernel.org,
	linux-pm@vger.kernel.org, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
	linux-crypto@vger.kernel.org, neil.armstrong@linaro.org, vigneshr@ti.com,
	manikandan.m@microchip.com, linux-clk@vger.kernel.org, olof@lixom.net
In-Reply-To: <20230623203056.689705-32-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
 <20230623203056.689705-32-varshini.rajendran@microchip.com>
Message-Id: <168756378936.1606652.14221929175769628362.robh@kernel.org>
Subject: Re: [PATCH v2 31/45] dt-bindings: atmel-classd: add sam9x7
 compatible
Date: Fri, 23 Jun 2023 17:43:09 -0600
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: M7C6KWOYYGYR77DMCNBVT22QVMYGDRP7
X-Message-ID-Hash: M7C6KWOYYGYR77DMCNBVT22QVMYGDRP7
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:28:39 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M7C6KWOYYGYR77DMCNBVT22QVMYGDRP7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Sat, 24 Jun 2023 02:00:42 +0530, Varshini Rajendran wrote:
> Add sam9x7 compatible to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/sound/atmel,sama5d2-classd.yaml      | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/atmel,sama5d2-classd.example.dtb: sound@fc048000: compatible: 'oneOf' conditional failed, one must be fixed:
	['atmel,sama5d2-classd'] is too short
	from schema $id: http://devicetree.org/schemas/sound/atmel,sama5d2-classd.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230623203056.689705-32-varshini.rajendran@microchip.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

