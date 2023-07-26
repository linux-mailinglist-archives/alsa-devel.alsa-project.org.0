Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DDB763511
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 13:33:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E9863E7;
	Wed, 26 Jul 2023 13:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E9863E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690371234;
	bh=wq+kGX1o6azl/+AxJe/umF5svvBwne/PrZi7iuI++k0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GZsHIJdddW4o4QCne6udcT66Cy7qqwbokzzR2+WjBzILVwvAqFAEFpqrhTFdSvYiu
	 gZ7GD2/JJNw+4srZdMOvocBFhfSmF8Z+Tda7CtpGfhXfFMA6I9pajYk3gBhCkyS5XR
	 SgaVgfVYtzJivzba86DXxXLDAQVBUPLm9M3VGyx8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 197A9F801F5; Wed, 26 Jul 2023 13:33:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94436F80153;
	Wed, 26 Jul 2023 13:33:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B20EF8019B; Wed, 26 Jul 2023 13:32:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB341F800D2
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 13:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB341F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=e1hankn3
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6EAA361AA8;
	Wed, 26 Jul 2023 11:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA78AC433C8;
	Wed, 26 Jul 2023 11:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690371165;
	bh=wq+kGX1o6azl/+AxJe/umF5svvBwne/PrZi7iuI++k0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=e1hankn3CHxOhV5V7dL9xTWosq9z/AofiRirVkpOjA5iGzdOg2AqeCG/lPXcfSVuf
	 NLnHQ8xPlaS3pRI4KBAejMqJ/9BDmbpTNDdG4GGoJApzH9gUqgXlIXbAJMEuxctoIS
	 6TH+ublhNs4PXHTBz9tII/L0d5YdsiwqMQhhqqyOL6xfDC/m1t8m7XHlDAvW7/JeUA
	 Y7CJxKafOQrVbAqZyxMgeC6wgPtZF0Yp2f6Jx/Gi404YrKPKekJc1fm+VKNqhl8zF4
	 44iwHUskx7tCXskhYbfbD94aM0do3HAm8eFIcjFR2ae6oW991MwijW+S7cmTHLlyov
	 Y/YMdbOcLz5Dg==
Received: (nullmailer pid 1021823 invoked by uid 1000);
	Wed, 26 Jul 2023 11:32:41 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: olivier.moysan@foss.st.com, lee@kernel.org, netdev@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-iio@vger.kernel.org, will@kernel.org,
 Frank Rowand <frowand.list@gmail.com>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, andi.shyti@kernel.org,
 vkoul@kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 ulf.hansson@linaro.org, richardcochran@gmail.com, catalin.marinas@arm.com,
 conor+dt@kernel.org, edumazet@google.com, gregkh@linuxfoundation.org,
 alsa-devel@alsa-project.org, fabrice.gasnier@foss.st.com,
 linux-spi@vger.kernel.org, davem@davemloft.net, mchehab@kernel.org,
 pabeni@redhat.com, herbert@gondor.apana.org.au, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh+dt@kernel.org,
 alexandre.torgue@foss.st.com, hugues.fruchet@foss.st.com,
 krzysztof.kozlowski+dt@linaro.org, jic23@kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 Oleksii_Moisieiev@epam.com, linux-i2c@vger.kernel.org, kuba@kernel.org,
  linux-phy@lists.infradead.org, dmaengine@vger.kernel.org,
 arnaud.pouliquen@foss.st.com, arnd@kernel.org
In-Reply-To: <20230726090129.233316-1-gatien.chevallier@foss.st.com>
References: <20230726083810.232100-1-gatien.chevallier@foss.st.com>
 <20230726090129.233316-1-gatien.chevallier@foss.st.com>
Message-Id: <169037116156.1021724.12937477325696165938.robh@kernel.org>
Subject: Re: [PATCH v3 04/11] dt-bindings: bus: document ETZPC
Date: Wed, 26 Jul 2023 05:32:41 -0600
Message-ID-Hash: 6GGL6V7UXZHSF6O6KD5V3EUDD3UJH22X
X-Message-ID-Hash: 6GGL6V7UXZHSF6O6KD5V3EUDD3UJH22X
X-MailFrom: SRS0=X1iT=DM=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6GGL6V7UXZHSF6O6KD5V3EUDD3UJH22X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 26 Jul 2023 11:01:22 +0200, Gatien Chevallier wrote:
> Document ETZPC (Extended TrustZone protection controller). ETZPC is a
> firewall controller.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Changes in V2:
> 	- Corrected errors highlighted by Rob's robot
> 	- No longer define the maxItems for the "feature-domains"
> 	  property
> 	- Fix example (node name, status)
> 	- Declare "feature-domain-names" as an optional
> 	  property for child nodes
> 	- Fix description of "feature-domains" property
> 	- Reorder the properties so it matches RIFSC
> 	- Add missing "feature-domain-controller" property
> 
>  .../bindings/bus/st,stm32-etzpc.yaml          | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/st,stm32-etzpc.example.dtb: serial@4c001000: Unevaluated properties are not allowed ('feature-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/serial/st,stm32-uart.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230726090129.233316-1-gatien.chevallier@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

