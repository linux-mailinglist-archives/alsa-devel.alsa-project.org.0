Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 696E0AFDD36
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jul 2025 04:01:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFF6D60176;
	Wed,  9 Jul 2025 04:01:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFF6D60176
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752026491;
	bh=SCd2Rskvq412sYYjzoMaYjBEDDWKuLbV0h++4NRJ7Hs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kd9GCzT2J6c+DYYQudIfHmKH2TknGnYTH5cJqtLMtBDYec3JzV7LPADl9AQJ8DvIg
	 k/zYu88wHZ0AVy5JWUkj8kJ1iOSsbH1KJy2aenUuPmxWOykxqmJhBJIgxkdAxZLEe7
	 AEzFCaDeK6cGVbOF3Q885WhmLRa2m5l49VFYRUqs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0582F805C9; Wed,  9 Jul 2025 04:00:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9637F805BD;
	Wed,  9 Jul 2025 04:00:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 576E8F804F2; Wed,  9 Jul 2025 04:00:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17921F80124
	for <alsa-devel@alsa-project.org>; Wed,  9 Jul 2025 04:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17921F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vPp/d4xm
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D811C61151;
	Wed,  9 Jul 2025 02:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 614DFC4CEED;
	Wed,  9 Jul 2025 02:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752026429;
	bh=SCd2Rskvq412sYYjzoMaYjBEDDWKuLbV0h++4NRJ7Hs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=vPp/d4xmieKxl3KV4U+NXVMO0UtLsKDJYyTkoEpjqNWtAzrJyoM/zofD8TJXrbAPm
	 SWnAnNcwkdNkA/zFbs1EHhiobFGc3f3wk9LJM303f27o49ETNfZRnriXDIL5rX7/tB
	 UO9TKqLMhcq1N2vtM72KRIBoasNtxtoyas7T35Rz96orCLumUejoob5PinY1+cmdtb
	 Dfw93GcD1O1epJevRBYtH+tuGkhau9TpxKvsp4S2GL66e5OVjBRcOMSxChCkLKzTqK
	 J6Vg3BY7OhyWCFMaV+1F6ikOwi82usmJmxaYfqGD4hZ9aszzXiGqy9hcmb72CVO8SB
	 YYaXQi7gnQ5BA==
Date: Tue, 08 Jul 2025 21:00:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 krzk+dt@kernel.org, s.nawrocki@samsung.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, lgirdwood@gmail.com,
 broonie@kernel.org
To: ew kim <ew.kim@samsung.com>
In-Reply-To: <20250709001239.379695-1-ew.kim@samsung.com>
References: 
 <CGME20250709002434epcas2p29b2368f0de6c760b17565ad7f2c37a19@epcas2p2.samsung.com>
 <20250709001239.379695-1-ew.kim@samsung.com>
Message-Id: <175202642853.1975547.14734415377016191511.robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Add samsung,abox-generic document
Message-ID-Hash: MMNHDNUL56HA3QK4C3OGO3KT476FPX3F
X-Message-ID-Hash: MMNHDNUL56HA3QK4C3OGO3KT476FPX3F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MMNHDNUL56HA3QK4C3OGO3KT476FPX3F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 09 Jul 2025 09:12:39 +0900, ew kim wrote:
> Add soundcard bindings for the abox generic of exynus automotive.
> 
> Signed-off-by: ew kim <ew.kim@samsung.com>
> ---
>  .../bindings/sound/samsung,abox-generic.yaml  | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml:4:6: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml:5:10: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml:43:13: [error] string value is redundantly quoted with any quotes (quoted-strings)
./Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml:43:21: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml: maintainers:0: {'name': 'Eunwoo Kim', 'email': 'ew.kim@samsung.com'} is not of type 'string'
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml: properties:ranges: 'anyOf' conditional failed, one must be fixed:
	'maxItems' is a required property
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'type' is not one of ['maxItems', 'description', 'deprecated']
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	Additional properties are not allowed ('type' was unexpected)
		hint: Arrays must be described with a combination of minItems/maxItems/items
	'type' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/soc/samsung/abox-generic.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,abox-generic.yaml
Documentation/devicetree/bindings/sound/samsung,abox-generic.example.dts:26.11-18: Warning (ranges_format): /example-0/abox_generic@generic:ranges: empty "ranges" property but its #address-cells (2) differs from /example-0 (1)
Documentation/devicetree/bindings/sound/samsung,abox-generic.example.dts:18.44-27.11: Warning (unit_address_vs_reg): /example-0/abox_generic@generic: node has a unit name, but no reg or ranges property
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/samsung,abox-generic.example.dtb: abox_generic@generic (samsung,abox_generic): ranges: True is not of type 'object'
	from schema $id: http://devicetree.org/schemas/soc/samsung/abox-generic.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250709001239.379695-1-ew.kim@samsung.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

