Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 743E693B55B
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2024 18:58:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41E84E82;
	Wed, 24 Jul 2024 18:58:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41E84E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721840319;
	bh=5JmJLMt7znCx017pyPoIq7UZLeqlEodflBEYHrF8fZE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IWJ44MJsZvskwtsRujLlynGeyqqEjArMwAZ1w4i+U5olHe7auMYAY7qn8aBbQqpn+
	 wbOFNRGk1qIqtczDAVMKrKFnqITdP+gm4asMUSI1OkRy/ndKwxxttEZX13Ef74NA9S
	 2oGRJLd5AeO53sGHX+BxKt8ykcR8AGaiTSen246U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1609FF8059F; Wed, 24 Jul 2024 18:58:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC881F805AF;
	Wed, 24 Jul 2024 18:58:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 211AEF8013D; Wed, 24 Jul 2024 18:48:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B349F8013D
	for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2024 18:43:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B349F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bxZHiUvg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CF1560E74;
	Wed, 24 Jul 2024 16:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06C00C32781;
	Wed, 24 Jul 2024 16:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721839433;
	bh=5JmJLMt7znCx017pyPoIq7UZLeqlEodflBEYHrF8fZE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=bxZHiUvgdMDRZyD+uEK7AGz9ydWj6piRkVdNTEMzXbUgH6a9S8WhJK2WlTH/UAQT+
	 i1O5hFChGTrC1kpcn7tU65mAQuQEPTMJkdMls38ULic5J9qhKqHmxETrZb9o2m5JGB
	 8rsnE9PHCFOljmgiF+JvLIds1sd/s1QgyA/uMat7+ATCfZ6Muc9WTrcxJtYVR4uNe1
	 S2MmpN+xVRZnM+beliSZALPZo010JzwpZ06hj+9ZVH+KYQ+Q5E+0xbEXD0x0D0iMC/
	 biOORFTmwTJyQ6jD1ZiD73Yyr6i/Q2TDRKnI7UqhshKwXnzPqlzCvkBp3XWMOuiZNd
	 IhDYJMcXZfPPQ==
Date: Wed, 24 Jul 2024 11:43:51 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: fabrice.gasnier@foss.st.com,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lars-Peter Clausen <lars@metafoo.de>, alsa-devel@alsa-project.org,
 Jonathan Cameron <jic23@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-iio@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20240724153639.803263-5-olivier.moysan@foss.st.com>
References: <20240724153639.803263-1-olivier.moysan@foss.st.com>
 <20240724153639.803263-5-olivier.moysan@foss.st.com>
Message-Id: <172183943127.3135721.14675824897973213166.robh@kernel.org>
Subject: Re: [PATCH v5 4/9] dt-bindings: iio: dfsdm: move to backend
 framework
Message-ID-Hash: T6444OMYQVL4J725PWZ5KWKDEIVOXLXF
X-Message-ID-Hash: T6444OMYQVL4J725PWZ5KWKDEIVOXLXF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T6444OMYQVL4J725PWZ5KWKDEIVOXLXF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 24 Jul 2024 17:36:32 +0200, Olivier Moysan wrote:
> Change the DFSDM binding to use the new IIO backend framework,
> along with the adoption of IIO generic channels.
> This binding change allows to add scaling support to the DFSDM.
> 
> Keep the legacy binding as deprecated for backward compatibility.
> 
> The io-backends property is supported only in generic IIO channel
> binding.
> 
> - Channel description with the generic binding (Audio and Analog):
> 
>   Properties superseded by generic properties:
>     st,adc-channels: becomes "reg" property in channel node
>     st,adc-channel-names: becomes "label" property in channel node
>   Properties moved to channel child node:
>     st,adc-channel-types: becomes st,adc-channel-type
>     st,adc-channel-clk-src, st,adc-alt-channel
> 
> - Analog binding:
> 
>   DFSDM filter channel is configured as an IIO backend consumer.
>   Add io-backends property in channel child nodes.
> 
>   DFSDM is no more configured as a channel consumer from SD modulator.
>   Use of io-channels in DFSDM node is deprecated.
> 
> - Audio binding:
> 
>   DFSDM audio DAI is configured as a channel consumer from DFSDM filter.
>   No change compare to legacy.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  | 124 +++++++++++++++---
>  1 file changed, 108 insertions(+), 16 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml:421:4: [error] no new line character at the end of file (new-line-at-end-of-file)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240724153639.803263-5-olivier.moysan@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

