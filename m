Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E948748E1E
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 21:41:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AC69847;
	Wed,  5 Jul 2023 21:40:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AC69847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688586087;
	bh=ETC77Qbifb8rrgCCM4xMBw/LJ4+9sdL5YWM/8hcT9H0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SyX55WhXcOaPyQdGB/K5fqV3Ppb8bJoi3q+CKE16O483K479atM4Hy//6duAEe3hh
	 LEn1uSb76uUR82W4/4nGaskrBUXffamTX2Mv5YH0plfRNDmI85BWQAXemliUg82Sfj
	 0//OYTbJXs8aShmNQJcbbLMcg42FKWgwYWg8pTp0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFCB8F80553; Wed,  5 Jul 2023 21:40:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1A91F80549;
	Wed,  5 Jul 2023 21:40:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57921F80558; Wed,  5 Jul 2023 21:39:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF77EF80100
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 21:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF77EF80100
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-783698a37beso355098839f.0
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Jul 2023 12:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688585983; x=1691177983;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OR44xsl8dcDDRHket6JLRoRPh10jvQanfxZD4Qq5o5A=;
        b=RZ5KQxI9JCfBivs4QNX4fp4nWKQ5Qxdr8FeT+O67uQXK3Yxv8vQ3NentJxzYf+EP6T
         IptjATC+aPX4OducfDqrsaEEFt+4MhRH0bFvuqZyVL/Xl0of5fXeQdhBC0WIGvtuFKNv
         6CjEcQRG3xWrWOxZ/qNb6c0oOWd+Rz3qrHOa+896PX7wqsEuYPZvVyMXvATWY9te6L67
         sbFMragE1IUMtYI57xylV/br3NfuW+W0YwlVeQXFJMa5RL7d5VaUoYerUgRNGKLlbECJ
         ChbVvi6LfwhF3oHrFhAX7494tI+5mGv4IqUob+5xS+N9MYzvTceRrx8iryUwNLV/mYx9
         CIkg==
X-Gm-Message-State: ABy/qLaqw057cfGQVvGe6WqBuSNbQbB2Hwv2/bPkbmhSjARQclDiylTc
	X9wlTdgnqL0e2U66hOMB2A==
X-Google-Smtp-Source: 
 APBJJlFTsATQZZbeDYi05vWkxMhLO+2kIHQFYrmGtwqcASMsu98qNuBpLmP0dT/ZyPLVLU0YF4GwxA==
X-Received: by 2002:a6b:f208:0:b0:77e:3598:e511 with SMTP id
 q8-20020a6bf208000000b0077e3598e511mr177308ioh.2.1688585983078;
        Wed, 05 Jul 2023 12:39:43 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 l10-20020a056638220a00b0042b1cd4c096sm3797893jas.74.2023.07.05.12.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 12:39:42 -0700 (PDT)
Received: (nullmailer pid 1714650 invoked by uid 1000);
	Wed, 05 Jul 2023 19:39:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: hugues.fruchet@foss.st.com, vkoul@kernel.org, linux-media@vger.kernel.org,
	gregkh@linuxfoundation.org, linux-phy@lists.infradead.org, lee@kernel.org,
	linux-kernel@vger.kernel.org, arnd@kernel.org, linux-serial@vger.kernel.org,
	mchehab@kernel.org, edumazet@google.com, arnaud.pouliquen@foss.st.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, jic23@kernel.org, pabeni@redhat.com,
	linux-usb@vger.kernel.org, alsa-devel@alsa-project.org,
	olivier.moysan@foss.st.com, fabrice.gasnier@foss.st.com, kuba@kernel.org,
	andi.shyti@kernel.org, alexandre.torgue@foss.st.com, conor+dt@kernel.org,
	richardcochran@gmail.com, will@kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, linux-mmc@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org,
	Oleksii_Moisieiev@epam.com, linux-spi@vger.kernel.org,
	linux-iio@vger.kernel.org, netdev@vger.kernel.org, ulf.hansson@linaro.org,
	devicetree@vger.kernel.org, robh+dt@kernel.org
In-Reply-To: <20230705172759.1610753-3-gatien.chevallier@foss.st.com>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-3-gatien.chevallier@foss.st.com>
Message-Id: <168858597155.1714560.12250834903693245143.robh@kernel.org>
Subject: Re: [PATCH 02/10] dt-bindings: bus: add device tree bindings for
 RIFSC
Date: Wed, 05 Jul 2023 13:39:32 -0600
Message-ID-Hash: MKBWANIRIIGBD3WVONI3VOU5XA3YL6XW
X-Message-ID-Hash: MKBWANIRIIGBD3WVONI3VOU5XA3YL6XW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MKBWANIRIIGBD3WVONI3VOU5XA3YL6XW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 05 Jul 2023 19:27:51 +0200, Gatien Chevallier wrote:
> Document RIFSC (RIF security controller). RIFSC is a firewall controller
> composed of different kinds of hardware resources.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  .../bindings/bus/st,stm32-rifsc.yaml          | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/st,stm32-rifsc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/st,stm32-rifsc.yaml: title: 'STM32 Resource isolation framework security controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230705172759.1610753-3-gatien.chevallier@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

