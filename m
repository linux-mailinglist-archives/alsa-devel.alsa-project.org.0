Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA28B85F4D6
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 10:45:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 785EA847;
	Thu, 22 Feb 2024 10:45:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 785EA847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708595135;
	bh=AZb0GKWTjyQuJy4d01ujzb9cgMUxShN7fSsHS7F4YvU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pxGKBPjNmCWhu+9C0hM6wie7ic5bdhGnnEUHRWNWAO4FHQth42ix+SWXRbYcBBEwk
	 7Q6XG+irfrupO+tbG+XXaSfVU6d3bwDs/TltGHnsXTqfU2Rh1doMShILuBt2W2oUSD
	 ZkypX49tnL5YS/HAlXL4bn02yYTOsJbMablSUV9Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5CCEF805AB; Thu, 22 Feb 2024 10:45:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 382CAF80579;
	Thu, 22 Feb 2024 10:45:03 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A71C0F80496; Thu, 22 Feb 2024 10:44:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 134EFF8019B
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 10:44:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 134EFF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mq6ogYCl
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D751616E0;
	Thu, 22 Feb 2024 09:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78F5C433F1;
	Thu, 22 Feb 2024 09:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708595084;
	bh=AZb0GKWTjyQuJy4d01ujzb9cgMUxShN7fSsHS7F4YvU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=mq6ogYClJpPyCBivw+KiXP03j3AHNQyc/WKFJWpx0X+9+Nc7Wy9VFgTHToteLVyW0
	 9stLolKoOtDMbXFjfk6b9yz4DYhIwxtKdyBA5pIF5m8+XQzl4FvDMp9sNFq9D1hgfP
	 h4W0ZK/g0bys6rwMFCHoExcbTC2GagotPpR6paBLOUi9lf86G/lirnFmsGh4XzB6rF
	 4H1tEYPtXKSqc19nrmNVXo3jSQixt1DJrLe9AJk89w96C2BjZGL0dZTGPHXvfY8Ytw
	 FQbeIWjF4QEVQxcrTQ/poZ29/znbqlQrmy500yfAiCiK1ZR/flaqllVLjpdV5DPr93
	 dyFNZJMojeVjw==
Date: Thu, 22 Feb 2024 02:44:42 -0700
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: KCHSU0@nuvoton.com, devicetree@vger.kernel.org, SJLIN0@nuvoton.com,
 YHCHuang@nuvoton.com, broonie@kernel.org, lgirdwood@gmail.com,
 robh+dt@kernel.org, CTLIN0@nuvoton.com, supercraig0719@gmail.com,
 conor+dt@kernel.org, linux-kernel@vger.kernel.org, scott6986@gmail.com,
 dardar923@gmail.com, alsa-devel@alsa-project.org
In-Reply-To: <20240222083825.190854-2-wtli@nuvoton.com>
References: <20240222083825.190854-1-wtli@nuvoton.com>
 <20240222083825.190854-2-wtli@nuvoton.com>
Message-Id: <170859508176.1881441.18147139867694471359.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: Added schema for
 "nuvoton,nau8325"
Message-ID-Hash: OOIH2HZPFKUCYLDTG4TIHL3MV7FYD6ON
X-Message-ID-Hash: OOIH2HZPFKUCYLDTG4TIHL3MV7FYD6ON
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OOIH2HZPFKUCYLDTG4TIHL3MV7FYD6ON/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 22 Feb 2024 16:38:24 +0800, Seven Lee wrote:
> Added a DT schema for describing nau8325 audio amplifiers.
> 
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---
>  .../bindings/sound/nuvoton,nau8325.yaml       | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml: properties:nuvoton,dac-vref:enum:0: 'VDDA' is not of type 'integer'
	hint: An integer type must have integer constraints
	from schema $id: http://devicetree.org/meta-schemas/types.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml: properties:nuvoton,dac-vref:enum:1: 'VDDA*1.5/1.8V' is not of type 'integer'
	hint: An integer type must have integer constraints
	from schema $id: http://devicetree.org/meta-schemas/types.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml: properties:nuvoton,dac-vref:enum:2: 'VDDA*1.6/1.8V' is not of type 'integer'
	hint: An integer type must have integer constraints
	from schema $id: http://devicetree.org/meta-schemas/types.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/nuvoton,nau8325.yaml: properties:nuvoton,dac-vref:enum:3: 'VDDA*1.7/1.8V' is not of type 'integer'
	hint: An integer type must have integer constraints
	from schema $id: http://devicetree.org/meta-schemas/types.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/nuvoton,nau8325.example.dtb: codec@21: nuvoton,dac-vref:0: [2] is not one of ['VDDA', 'VDDA*1.5/1.8V', 'VDDA*1.6/1.8V', 'VDDA*1.7/1.8V']
	from schema $id: http://devicetree.org/schemas/sound/nuvoton,nau8325.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/nuvoton,nau8325.example.dtb: codec@21: Unevaluated properties are not allowed ('nuvoton,dac-vref' was unexpected)
	from schema $id: http://devicetree.org/schemas/sound/nuvoton,nau8325.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240222083825.190854-2-wtli@nuvoton.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

