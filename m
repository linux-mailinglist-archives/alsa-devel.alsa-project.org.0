Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A907A7B36FD
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 17:37:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3CC1E76;
	Fri, 29 Sep 2023 17:36:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3CC1E76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696001848;
	bh=z3KUEsqazjbR1hDsMbBF2Knw4QB51OgWhHZ20c5Nmfo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ct3MWOzN6dxE7Xu90Bp07m3D8jvDPCLZ7u2EQRChjUwrskSnUV4bIQ+Bsd3PLDHDe
	 aj0gPW1PpT0GFS3SZvG//zneLIWT0znQOa6SRPt36o8HSGCSKjte3mWtXdJ0jBeC14
	 Cbh+e6GDP9CzteGnz4qiD9gZzkGP41jkjEJLJgXM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F8F4F80589; Fri, 29 Sep 2023 17:35:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F63DF8057D;
	Fri, 29 Sep 2023 17:35:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B3A8F8057E; Fri, 29 Sep 2023 17:35:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CB03F8057C
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 17:35:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CB03F8057C
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KnBqDsMN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A29C6CE24E0;
	Fri, 29 Sep 2023 15:35:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC3FC433CA;
	Fri, 29 Sep 2023 15:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696001746;
	bh=z3KUEsqazjbR1hDsMbBF2Knw4QB51OgWhHZ20c5Nmfo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KnBqDsMNpmcMIqEz/7+dh2UUN3J/d+OfDIq97LxcXVxhClMZ54ula6pe1MF6LNqLW
	 m81aNDtRYLY5tTyXmqV6rZlMqrwroJ/R5Gm7DKG7aEHP26pzXzK3+LXKagVeAOtpe/
	 lU1mvNae3UvvAHYh74dUSDWQ6E36sViTAXyiVES950SI+GGVHX+L4ki1+j4kxhIF64
	 A/4er6VQTIMNPA86m3Qk1nEBkgpzemHoIIYNjU0gSVggG0jtqREsZ81ma4k2LloVwy
	 +b/fQpOilec8Il3sFMiwgY8fVjSlYYKWEihyh2PZHMSq8vw5yl5vr9f+BA1PNwY1N1
	 0nTnsc5JBHm7Q==
Received: (nullmailer pid 3601361 invoked by uid 1000);
	Fri, 29 Sep 2023 15:35:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: linux-crypto@vger.kernel.org, olivier.moysan@foss.st.com,
	kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net,
	hugues.fruchet@foss.st.com, linux-media@vger.kernel.org,
	ulf.hansson@linaro.org, edumazet@google.com, lee@kernel.org,
	arnd@kernel.org, richardcochran@gmail.com,
	Frank Rowand <frowand.list@gmail.com>, peng.fan@oss.nxp.com,
	linux-i2c@vger.kernel.org, Oleksii_Moisieiev@epam.com,
	krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
	arnaud.pouliquen@foss.st.com, netdev@vger.kernel.org,
	linux-mmc@vger.kernel.org, vkoul@kernel.org, andi.shyti@kernel.org,
	jic23@kernel.org, linux-iio@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	conor+dt@kernel.org, mchehab@kernel.org, robh+dt@kernel.org,
	dmaengine@vger.kernel.org, alexandre.torgue@foss.st.com,
	catalin.marinas@arm.com, gregkh@linuxfoundation.org,
	linux-arm-kernel@lists.infradead.org, fabrice.gasnier@foss.st.com,
	linux-ser@alsa-project.org, ial@vger.kernel.org,
	linux-phy@lists.infradead.org, herbert@gondor.apana.org.au,
	will@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230929142852.578394-5-gatien.chevallier@foss.st.com>
References: <20230929142852.578394-1-gatien.chevallier@foss.st.com>
 <20230929142852.578394-5-gatien.chevallier@foss.st.com>
Message-Id: <169600172458.3601338.4448633630933066320.robh@kernel.org>
Subject: Re: [PATCH v5 04/11] dt-bindings: bus: document ETZPC
Date: Fri, 29 Sep 2023 10:35:24 -0500
Message-ID-Hash: B54UUKZAYIVCV27FBFI4UDUNBL3RY5ZH
X-Message-ID-Hash: B54UUKZAYIVCV27FBFI4UDUNBL3RY5ZH
X-MailFrom: SRS0=CpPV=FN=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B54UUKZAYIVCV27FBFI4UDUNBL3RY5ZH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 29 Sep 2023 16:28:45 +0200, Gatien Chevallier wrote:
> Document ETZPC (Extended TrustZone protection controller). ETZPC is a
> firewall controller.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> 
> Changes in V5:
> 	- Renamed feature-domain* to access-control*
> 
> Changes in V2:
> 	- Corrected errors highlighted by Rob's robot
> 	- No longer define the maxItems for the "feature-domains"
> 	  property
> 	- Fix example (node name, status)
> 	- Declare "feature-domain-names" as an optional
> 	  property for child nodes
> 	- Fix description of "feature-domains" property
> 	- Reordered the properties so it matches ETZPC
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
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml: access-controller: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/st,stm32-etzpc.yaml: access-control-provider: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/st,stm32-etzpc.example.dtb: serial@4c001000: Unevaluated properties are not allowed ('access-controller' was unexpected)
	from schema $id: http://devicetree.org/schemas/serial/st,stm32-uart.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230929142852.578394-5-gatien.chevallier@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

