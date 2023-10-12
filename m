Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7487C727C
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Oct 2023 18:26:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7E84839;
	Thu, 12 Oct 2023 18:25:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7E84839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697127988;
	bh=9feK3ItMeeWwJ7VIPlyWwFyXf9aBwpQbldW6FpaCPok=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LaXH1PBEkwwZVqMuxHJ0UooOMvO19PmuL9XzrBVhczeDgS2LOhFbf1ifbgt6vRRMx
	 LWNimuDhY4Q1Am0Ofxg2EEuG7Qfn98KK4DJl/0SyTL4z52DdyWqMseMFHKN1Lwnn+O
	 RQRyfsVbxlyrbw4+JevDkMO17prJpEXEBQDmDRu4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40DC5F80310; Thu, 12 Oct 2023 18:25:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EE64F8027B;
	Thu, 12 Oct 2023 18:25:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90D8EF802BE; Thu, 12 Oct 2023 18:25:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46FAEF8019B
	for <alsa-devel@alsa-project.org>; Thu, 12 Oct 2023 18:25:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46FAEF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MmifaNqV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E5A6DB8253C;
	Thu, 12 Oct 2023 16:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCC2C433C8;
	Thu, 12 Oct 2023 16:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697127924;
	bh=9feK3ItMeeWwJ7VIPlyWwFyXf9aBwpQbldW6FpaCPok=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MmifaNqVW0KF2jEk/QREfOeHUJJUTjUuR3z0Y7YzK/2lxDPf9rHQGgKgaHY65EXWd
	 6A37+tC0FyDH0IMKT7Ape4MnoBEOrVGKvU4RIsui53qz7heLWtCnPICUmj+yprUCuc
	 y/lmrDPTmwebPd65iJ+2z2dEr03L1Hpcz3dlzsPShupRgJsA9uNtbI5kUJgFNBtn7d
	 dghuOJvsMkZXBhaHMk6fu7dC8hFFs0XdZmdQ5Bb22ZpEtUP8bd6Zg/l9lpQXRVsRPB
	 8aRf5Ww2EVmOdoQ2W1uN02GQAhG+B8FMklmXGFFe2AFvS9TU9Ce270JNi0ElWgr3vt
	 sYha2tz+uzW0Q==
Received: (nullmailer pid 1188735 invoked by uid 1000);
	Thu, 12 Oct 2023 16:25:22 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
 kernel@collabora.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20231012151538.468893-1-eugen.hristev@collabora.com>
References: <20231012151538.468893-1-eugen.hristev@collabora.com>
Message-Id: <169712792200.1188719.6103742227495646067.robh@kernel.org>
Subject: Re: [PATCH v3] dt-bindings: arm: mediatek: convert audsys and
 mt2701-afe-pcm to yaml
Date: Thu, 12 Oct 2023 11:25:22 -0500
Message-ID-Hash: PVB2KYJCZEHRIUNEFP3S2OEK7BK6AIKQ
X-Message-ID-Hash: PVB2KYJCZEHRIUNEFP3S2OEK7BK6AIKQ
X-MailFrom: rob@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PVB2KYJCZEHRIUNEFP3S2OEK7BK6AIKQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Thu, 12 Oct 2023 18:15:38 +0300, Eugen Hristev wrote:
> Convert the mediatek,audsys binding to YAML, together with the associated
> binding bindings/sound/mt2701-afe-pcm.yaml .
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
> Changes in v3:
> - not added Rb Conor Dooley since the patch was changed in a big essence
> - As per review by Krzysztof, also convert the mt2701-afe-pcm and reference
> the correct schema in the audsys binding.
> 
> Changes in v2:
> - remove comment reference to inexistent binding
> 
> 
>  .../bindings/arm/mediatek/mediatek,audsys.txt |  39 ---
>  .../arm/mediatek/mediatek,audsys.yaml         | 153 ++++++++++++
>  .../bindings/sound/mt2701-afe-pcm.txt         | 146 -----------
>  .../bindings/sound/mt2701-afe-pcm.yaml        | 229 ++++++++++++++++++
>  4 files changed, 382 insertions(+), 185 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/mt2701-afe-pcm.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/mt2701-afe-pcm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/mt2701-afe-pcm.yaml:11:4: [error] missing starting space in comment (comments)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231012151538.468893-1-eugen.hristev@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

