Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E06FE748E22
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 21:41:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9492784B;
	Wed,  5 Jul 2023 21:40:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9492784B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688586092;
	bh=BE4iPx7mgDs4ftlxJJG4wodLVdP5/NyL6i2a9l/VhVU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j3XdhC2b2JkPHaipubfEDHDVDAWYffKarpiNIsgbSbALPnH2fbCT2H4n8fvdB4TIS
	 fka4e3/g4IfTElHLclV+WxehQJMZnyclZ6p6ZWDgYayWM7OHby4npEvgIg/xm23ipL
	 yAIdQeqIMUyfoUf1e9Npeshwc4TbUDeYJjj7D1fA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9999F80568; Wed,  5 Jul 2023 21:40:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AE34F8056F;
	Wed,  5 Jul 2023 21:40:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27C95F80553; Wed,  5 Jul 2023 21:39:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67A5EF80535
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 21:39:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67A5EF80535
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-77a62a84855so278432339f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 05 Jul 2023 12:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688585988; x=1691177988;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EmigWppDMAwntmLPkpHMViFD3zfbB0BalUBHyRmY93I=;
        b=JhdmiPctKxfGfC4guHmqefZXKa+/Jbnl2exZX1n1ixN4vwSDNVAA2etNEczs2pqhFb
         oKM/KPuWjksxLeyu2EJojIlqzbOFY6ZU2DufLKKB4vh0jaPenQtbEE9/iu56H9tebd36
         v9PvJLV5YITwmM32UiDRtOWItBhqQ1s20a32apgWIEMoLF5Wz2CxR66vE/M5Ihc6SgBS
         PpKiQg/yuqQFddI2MnuvANiITxBzF5ZaPGlI/fUF+nFfGRTGuHAtVVbe1gxcVK9Eiamp
         EicqWi/r8C6vg3zoq9fRSn+8CnogyMSgG7OTXi54hOoLR7qh3b184+OigVaQ7dnNUd72
         5Q0A==
X-Gm-Message-State: ABy/qLZzmQgS5jfFHveA3kmElgZAIY3vZmyEQC2U6ew6zxLUyXpHgqy/
	ZbOYy6Y/th/9xqzl6BoXDg==
X-Google-Smtp-Source: 
 APBJJlE1T+SG//kQOjsdrxPqC6WYFy+jVqYd/9wV9AIbQOA/LFJUSpnFw6o7MHDprdjfMYp8ihzVDA==
X-Received: by 2002:a6b:3c02:0:b0:786:45f7:fb7e with SMTP id
 k2-20020a6b3c02000000b0078645f7fb7emr58527iob.13.1688585988126;
        Wed, 05 Jul 2023 12:39:48 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 d21-20020a02a495000000b0042ad887f705sm6314042jam.143.2023.07.05.12.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 12:39:47 -0700 (PDT)
Received: (nullmailer pid 1714652 invoked by uid 1000);
	Wed, 05 Jul 2023 19:39:32 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: fabrice.gasnier@foss.st.com, jic23@kernel.org, conor+dt@kernel.org,
	hugues.fruchet@foss.st.com, richardcochran@gmail.com, will@kernel.org,
	davem@davemloft.net, vkoul@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-phy@lists.infradead.org, arnd@kernel.org, gregkh@linuxfoundation.org,
	linux-i2c@vger.kernel.org, linux-usb@vger.kernel.org,
	arnaud.pouliquen@foss.st.com, mchehab@kernel.org, olivier.moysan@foss.st.com,
	andi.shyti@kernel.org, alexandre.torgue@foss.st.com, kuba@kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org, pabeni@redhat.com, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Oleksii_Moisieiev@epam.com,
	lee@kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	robh+dt@kernel.org, ulf.hansson@linaro.org, catalin.marinas@arm.com,
	edumazet@google.com, linux-spi@vger.kernel.org, herbert@gondor.apana.org.au,
	linux-iio@vger.kernel.org, linux-crypto@vger.kernel.org
In-Reply-To: <20230705172759.1610753-4-gatien.chevallier@foss.st.com>
References: <20230705172759.1610753-1-gatien.chevallier@foss.st.com>
 <20230705172759.1610753-4-gatien.chevallier@foss.st.com>
Message-Id: <168858597253.1714602.9996873148476929300.robh@kernel.org>
Subject: Re: [PATCH 03/10] dt-bindings: bus: add device tree bindings for
 ETZPC
Date: Wed, 05 Jul 2023 13:39:32 -0600
Message-ID-Hash: VIADVX2D4SAOF2YRCZ45G5OHGJU6UUGF
X-Message-ID-Hash: VIADVX2D4SAOF2YRCZ45G5OHGJU6UUGF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VIADVX2D4SAOF2YRCZ45G5OHGJU6UUGF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 05 Jul 2023 19:27:52 +0200, Gatien Chevallier wrote:
> Document ETZPC (Extended TrustZone protection controller). ETZPC is a
> firewall controller.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  .../bindings/bus/st,stm32-etzpc.yaml          | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml: title: 'STM32 Extended TrustZone protection controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
Documentation/devicetree/bindings/bus/st,stm32-etzpc.example.dtb: /example-0/etzpc@5c007000: failed to match any schema with compatible: ['st,stm32mp13-sys-bus']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230705172759.1610753-4-gatien.chevallier@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

