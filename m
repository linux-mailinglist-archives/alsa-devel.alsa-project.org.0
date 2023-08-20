Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D14781F42
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Aug 2023 20:29:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26C2A207;
	Sun, 20 Aug 2023 20:28:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26C2A207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692556174;
	bh=GqYN9bHJd1JVgYtzvKeFocBkDRzHfTLEqEawKra5ziE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HAaeWgj/MLSSOHSxp5QG50Z7aRR3zbjWR3CYevxZn+Lqu1IyjsUpLenkVSJ92JBod
	 bA0AnFkoOZuVsPrgXutqExVNyjssYs0Y2EqAabFqSix8cq7DJpseWLfnLhAYesTjiW
	 I92hhk0jjI547G2jajuAZBHSoSBN9whIf8LviQEc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2A0CF8025F; Sun, 20 Aug 2023 20:28:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49660F8016C;
	Sun, 20 Aug 2023 20:28:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 742C1F80199; Sun, 20 Aug 2023 20:28:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87B64F800F8
	for <alsa-devel@alsa-project.org>; Sun, 20 Aug 2023 20:28:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87B64F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KfvLNy6u
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 594ED6123E;
	Sun, 20 Aug 2023 18:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A811C433C8;
	Sun, 20 Aug 2023 18:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692556106;
	bh=GqYN9bHJd1JVgYtzvKeFocBkDRzHfTLEqEawKra5ziE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KfvLNy6upAHsQAyCXGA+nkttHkHbs3vrZ3ae3Vhve8xE4ZjKpQOLAIEt8W70ZDe/w
	 1X/EayBvDYRuCbP486WSreuXtUZAu6sV+bhBCpaWRhvhKlobuw42+q7+afzye6g+WW
	 lHT3YzL+H91jiiD8olXJDV2JbBeGi3rSr0lccW/mbgKG3n9ngudWkDIdEteqaYIEp0
	 jNL3h6QAdv0l+RAxa7a8kaqfNhPl9f4QM1mUexwsNg46joVBnAO090sGE5YOKrUsyC
	 gch5rctP0xUZY/Wew4BZ9MZXRQrpe+OWlFUe2WgksgM4G2/kI0/oB96DYgPmP8fBaT
	 9P5BC4qRnWFmQ==
Received: (nullmailer pid 4142974 invoked by uid 1000);
	Sun, 20 Aug 2023 18:28:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Adam Ford <aford173@gmail.com>
Cc: alsa-devel@alsa-project.org, aford@beaconembedded.com,
 Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20230820175655.206723-1-aford173@gmail.com>
References: <20230820175655.206723-1-aford173@gmail.com>
Message-Id: <169255610407.4142958.2451683336970751205.robh@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: fsl_easrc: Add support for
 imx8mp-easrc
Date: Sun, 20 Aug 2023 13:28:24 -0500
Message-ID-Hash: F7AMD3S7RNLM2VGZVMUBZ4DRKJJAEVI6
X-Message-ID-Hash: F7AMD3S7RNLM2VGZVMUBZ4DRKJJAEVI6
X-MailFrom: SRS0=EIXP=EF=robh_at_kernel.org=rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F7AMD3S7RNLM2VGZVMUBZ4DRKJJAEVI6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Sun, 20 Aug 2023 12:56:53 -0500, Adam Ford wrote:
> The i.MX8MP appears to have the same easrc support as the Nano, so
> add imx8mp as an option with a fallback to imx8mn.
> 
> Signed-off-by: Adam Ford <aford173@gmail.com>
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,easrc.example.dtb: easrc@300c0000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx8mn-easrc'] is too short
	'fsl,imx8mn-easrc' is not one of ['fsl,imx8mp-easrc']
	from schema $id: http://devicetree.org/schemas/sound/fsl,easrc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230820175655.206723-1-aford173@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

