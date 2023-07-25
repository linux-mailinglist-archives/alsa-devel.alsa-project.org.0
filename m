Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A714D76208F
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 19:51:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7816F6C1;
	Tue, 25 Jul 2023 19:50:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7816F6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690307465;
	bh=w7dbONTIy2Co3mAFj/AcsnLbCERRs5c4tblF0g/VRPU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IFgJY8cUAKzuAWfSAJxjCZ377eidsw1yCoMcxEkUENxfvIXlDiu9A9WldNrshDz7l
	 FDmofe0M229g9cinlghvxrUAT477GR/+wCwkzofNqmiH53SAZMU7v26Dpb3M8G5ZMB
	 wb1ai2+mAIumoh5mgWzwOpbc7nQxc3ryW2UeT0fA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 936D5F8053B; Tue, 25 Jul 2023 19:49:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C209BF80163;
	Tue, 25 Jul 2023 19:49:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0118F802E8; Tue, 25 Jul 2023 19:49:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBFD1F80163
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 19:49:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBFD1F80163
Authentication-Results: alsa1.perex.cz;
	dkim=fail reason="signature verification failed" (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qRmvy9rH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5473F61847;
	Tue, 25 Jul 2023 17:49:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4F6C433C8;
	Tue, 25 Jul 2023 17:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690307369;
	bh=w7dbONTIy2Co3mAFj/AcsnLbCERRs5c4tblF0g/VRPU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qRmvy9rHWcDnpixwhpi8DTuQcPdUyIZr5ZNx9ydG3F5boc73mSyEcLxTRGyRsCrB3
	 vClccnArnxXoaiGAgIdoaS2+TOFRAoqZK63Wk0bXfrXFknhfb+CydSPKk0rOsuu3hH
	 TLEWzXb38mM81F0bbsLAvvpzt0taCiE7A8213w6F+7Ut1V3wYK9UY5byb1RK9gdLLH
	 A8/Iy7F8eWp47Q1Fq/3T9a96ynyIDqiSA2oI0PcsUAwZGhiXzTUnrxDNnd0AH129MP
	 pymfYyEwQoff+K9nqQse31QUqBocLgoqy3MvVJHBF8sdscLUh2TInqE0lKi9416xVB
	 K25mir6FU0ktQ==
Received: (nullmailer pid 3497934 invoked by uid 1000);
	Tue, 25 Jul 2023 17:49:25 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: kuba@kernel.org, will@kernel.org, linux-serial@vger.kernel.org,
 linux-phy@lists.infradead.org,
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, linux-spi@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>, lee@kernel.org, robh+dt@kernel.org,
 linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
 arnaud.pouliquen@foss.st.com, Oleksii_Moisieiev@epam.com, arnd@kernel.org,
 hugues.fruchet@foss.st.com, ulf.hansson@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jic23@kernel.org,
 alexandre.torgue@foss.st.com, pabeni@redhat.com, andi.shyti@kernel.org,
 netdev@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mmc@vger.kernel.org, edumazet@google.com, vkoul@kernel.org,
 dmaengine@vger.kernel.org, catalin.marinas@arm.com,
 herbert@gondor.apana.org.au, fabrice.gasnier@foss.st.com, mchehab@kernel.org,
 linux-iio@vger.kernel.org, richardcochran@gmail.com, davem@davemloft.net,
 conor+dt@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.
 org, alsa-devel@alsa-project.org, linux-crypto@vger.kernel.org,
 linux-i2c@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 olivier.moysan@foss.st.com
In-Reply-To: <20230725164104.273965-2-gatien.chevallier@foss.st.com>
References: <20230725164104.273965-1-gatien.chevallier@foss.st.com>
 <20230725164104.273965-2-gatien.chevallier@foss.st.com>
Message-Id: <169030736341.3497818.1740404012211043486.robh@kernel.org>
Subject: Re: [IGNORE][PATCH v2 01/11] dt-bindings: Document common device
 controller bindings
Date: Tue, 25 Jul 2023 11:49:25 -0600
Message-ID-Hash: 3SPQYP3GRK34T3PVWEXI3FOPZN77EUDM
X-Message-ID-Hash: 3SPQYP3GRK34T3PVWEXI3FOPZN77EUDM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3SPQYP3GRK34T3PVWEXI3FOPZN77EUDM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Tue, 25 Jul 2023 18:40:54 +0200, Gatien Chevallier wrote:
> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
> 
> Introducing of the common device controller bindings for the controller
> provider and consumer devices. Those bindings are intended to allow
> divided system on chip into muliple domains, that can be used to
> configure hardware permissions.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230725164104.273965-2-gatien.chevallier@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

