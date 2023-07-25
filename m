Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EE2762090
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 19:51:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABE18828;
	Tue, 25 Jul 2023 19:50:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABE18828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690307494;
	bh=WJL53er2hn/3EEx4DOJfAbOjXZnKjKBtRagFrtg05jg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N1w0u+as+G7X4/TpYW4ZipoJdpXZUq5nx7mEtHhtyQaLQft8dqi/dfyar0MMxSRbA
	 MhPer/HFxrNsD6tg75uaGzIgcSOHtvbgMH5hivjfPRgdm4PT2+5khN0GxdV20AglMR
	 VOnIeJ4iBsUxv3d+6zQUcWsAoH03WUBJe5I9cR9I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22EB4F80553; Tue, 25 Jul 2023 19:49:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61BEEF801F5;
	Tue, 25 Jul 2023 19:49:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6996EF801F5; Tue, 25 Jul 2023 19:49:49 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A2449F800C7
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 19:49:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2449F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CPO6RMRP
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B7DB561851;
	Tue, 25 Jul 2023 17:49:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6AB4C433CA;
	Tue, 25 Jul 2023 17:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690307375;
	bh=WJL53er2hn/3EEx4DOJfAbOjXZnKjKBtRagFrtg05jg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CPO6RMRPaMRtVah/1RA1wO5FXxmP2DhlHptZXjtjeJZn524snzFNmGkI4PM2ckIo6
	 7FXzBD4qXePRo3PzLIkOFhZGyDj+4aolBAs7lhubS+/sugRBmEv5uwY2APQucc4EIz
	 1nGGt64bGnlel2IpehCbvoOPhAXT8wnt5XPyu8AhkROpI7dA7thAncucJtelJljMnw
	 atiZpLOBvBZ0F/r5WTJZfurX5L65y1q7LeSvDTjmcEUXR6SWW06bn+O1CXh/QQgkcV
	 FpqLMVfkRM4VMT0UlbHKmPRIUz4d0EWFPpNeyuIHEERTM60aZDTVat5SY/xyjqL5hf
	 qQXqITOBkCDlA==
Received: (nullmailer pid 3497939 invoked by uid 1000);
	Tue, 25 Jul 2023 17:49:25 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: kuba@kernel.org, lee@kernel.org, andi.shyti@kernel.org,
 alsa-devel@alsa-project.org, linux-i2c@vger.kernel.org,
 richardcochran@gmail.com, linux-mmc@vger.kernel.org,
 arnaud.pouliquen@foss.st.com, olivier.moysan@foss.st.com, vkoul@kernel.org,
 linux-serial@vger.kernel.org, robh+dt@kernel.org,
 alexandre.torgue@foss.st.com, krzysztof.kozlowski+dt@linaro.org,
 ulf.hansson@linaro.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, hugues.fruchet@foss.st.com,
 mchehab@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-phy@lists.infradead.org, pabeni@redhat.com, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 edumazet@google.com, linux-crypto@vger.kernel.org, jic23@kernel.org,
 Frank Rowand <frowand.list@gmail.com>, arnd@kernel.org,
 linux-usb@vger.kernel.org, catalin.marinas@arm.com,
 linux-iio@vger.kernel.org, davem@davemloft.net, Oleksii_Moisieiev@epam.com,
 will@kernel.org, dmaengine@vger.kernel.org, netdev@vger.kernel.org,
 fabrice.gasnier@foss.st.com, linux-spi@vger.kernel.org, conor+dt@kernel.org,
 herbert@gondor.apana.org.au
In-Reply-To: <20230725164104.273965-4-gatien.chevallier@foss.st.com>
References: <20230725164104.273965-1-gatien.chevallier@foss.st.com>
 <20230725164104.273965-4-gatien.chevallier@foss.st.com>
Message-Id: <169030736534.3497905.9507005013968358402.robh@kernel.org>
Subject: Re: [PATCH v2 03/11] dt-bindings: bus: document ETZPC
Date: Tue, 25 Jul 2023 11:49:25 -0600
Message-ID-Hash: TTIFJGCVBNVVMIAPEWMDTFSRTNMRTNSD
X-Message-ID-Hash: TTIFJGCVBNVVMIAPEWMDTFSRTNMRTNSD
X-MailFrom: SRS0=nS92=DL=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TTIFJGCVBNVVMIAPEWMDTFSRTNMRTNSD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 25 Jul 2023 18:40:56 +0200, Gatien Chevallier wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230725164104.273965-4-gatien.chevallier@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

