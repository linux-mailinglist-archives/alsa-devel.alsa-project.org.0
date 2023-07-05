Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 561EF748E1D
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 21:40:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AD531FC;
	Wed,  5 Jul 2023 21:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AD531FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688586041;
	bh=y1xNhn3TbRj2EGBYvKnXzaAoh84CV0kUN2P/Rntc9xw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eL4s6V5q/hYeEdU+WRM7ivmRsGe7H1Gq/SBrlHV/WX2n8AUb1n5Mv/dTkJjRDbf4U
	 sWonqe2bk3lPkEDkAWbgA0EpV9HUZMgSabDmOSEuj3bK7Hzv5g9jPvGd9VKreTr2WU
	 0DritzWQ/qDUH1syHog+7k6ZJERundfMEVlISfPA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0809F80104; Wed,  5 Jul 2023 21:39:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 135BDF80125;
	Wed,  5 Jul 2023 21:39:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A14FCF80125; Wed,  5 Jul 2023 21:39:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00908F80104
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 21:39:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00908F80104
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3460aee1d57so19688775ab.0
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Jul 2023 12:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688585978; x=1691177978;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n9XXXuHpMOQBfJPbmDE208zmHNLuLmJ5W06p0NFVR4Q=;
        b=bXjN09fEp6TUHqTaadbwKW5MWFA0Uf6bu9bkDBULm1oZKpmfJRGZ7n9kaq6oxk8v7s
         f2kZDFsCywHXq4uc2worQWsRGPqlCN8g9hr0EGNEEsVkV0VyFyBmI3k7CuBoJAPBaVNE
         4Ie9TfK05jbdG29UQplVyVcY1zHbz0ohWtVKXyNkpKXrbsrjBxIMxw2aOQzT7Ulg2rmS
         yQil2SRgIkZgaupTG7mO0uKGIbBFVrzHM65SpBayL84LY5vSeyv8r+OBFAf0781wV0yc
         Bqjv0zEzSyS+wSftG52s3f3lGZrmQJqNWQBpt1mw0xtSjuk0qap2lVMRWIfPRbmKEeaz
         SJNg==
X-Gm-Message-State: ABy/qLY3hEzxFQmLMvHGi0dVLOJYvpdYmDNlgTYCPztTdRUUkpA4Slyw
	hVU6qkREC80rk89zsbusCw==
X-Google-Smtp-Source: 
 APBJJlHeCCgfywEkTbD8TaGxOES0xf6LHwH4LNaopQfeQ1Mlc+0XwkrXc56AMYZDW2D01Tl0iYFNfw==
X-Received: by 2002:a92:c70d:0:b0:345:af3e:3aa8 with SMTP id
 a13-20020a92c70d000000b00345af3e3aa8mr110268ilp.25.1688585978167;
        Wed, 05 Jul 2023 12:39:38 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 n24-20020a5e8c18000000b007835686237asm7580752ioj.27.2023.07.05.12.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 12:39:37 -0700 (PDT)
Received: (nullmailer pid 1714647 invoked by uid 1000);
	Wed, 05 Jul 2023 19:39:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, lee@kernel.org, davem@davemloft.net,
	pabeni@redhat.com, linux-stm32@st-md-mailman.stormreply.com,
	linux-media@vger.kernel.org, mchehab@kernel.org, robh+dt@kernel.org,
	alexandre.torgue@foss.st.com, will@kernel.org, dmaengine@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-phy@lists.infradead.org,
	catalin.marinas@arm.com, Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
 arnd@kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	fabrice.gasnier@foss.st.com, edumazet@google.com, hugues.fruchet@foss.st.com,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	herbert@gondor.apana.org.au, Oleksii_Moisieiev@epam.com,
	andi.shyti@kernel.org, linux-crypto@vger.kernel.org, kuba@kernel.org,
	linux-mmc@vger.kernel.org, conor+dt@kernel.org, olivier.moysan@foss.st.com,
	linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org, jic23@kernel.org,
	linux-arm-kernel@lists.infradead.org, richardcochran@gmail.com,
	vkoul@kernel.org, krzysztof.kozlowski+dt@linaro.org, ulf.hansson@linaro.org,
	arnaud.pouliquen@foss.st.com
In-Reply-To: <20230705172759.1610753-2-gatien.chevallier@foss.st.com>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-2-gatien.chevallier@foss.st.com>
Message-Id: <168858597047.1714514.3836923282073685393.robh@kernel.org>
Subject: Re: [IGNORE][PATCH 01/10] dt-bindings: Document common device
 controller bindings
Date: Wed, 05 Jul 2023 13:39:32 -0600
Message-ID-Hash: CDVSKHMPM4LRLSEQRFSMPSRRTWBTQQ2K
X-Message-ID-Hash: CDVSKHMPM4LRLSEQRFSMPSRRTWBTQQ2K
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CDVSKHMPM4LRLSEQRFSMPSRRTWBTQQ2K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 05 Jul 2023 19:27:50 +0200, Gatien Chevallier wrote:
> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
> 
> Introducing of the common device controller bindings for the controller
> provider and consumer devices. Those bindings are intended to allow
> divided system on chip into muliple domains, that can be used to
> configure hardware permissions.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> 
> Depends-on: https://lore.kernel.org/lkml/c869d2751125181a55bc8a88c96e3a892b42f37a.1668070216.git.oleksii_moisieiev@epam.com/
> 
>  .../feature-domain-controller.yaml            | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/feature-controllers/feature-domain-controller.yaml: title: 'Generic Domain Controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230705172759.1610753-2-gatien.chevallier@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

