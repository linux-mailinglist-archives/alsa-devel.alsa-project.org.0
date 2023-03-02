Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFFD6ACADA
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 18:41:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C0DA1150;
	Mon,  6 Mar 2023 18:40:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C0DA1150
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678124502;
	bh=RrW1piIzpapYsdd/1b5S7KS37OY1AbM+pNktrXQj1kQ=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hdZ8Mk2l3XWfmBv/cT3n9aqvx62UDsyGTZ/UGX8KBwEqJcdHukGKZcBctw6fwyIIQ
	 2o8rNhKEVlER04V4vch7XPws6fX/E55dYM5nk7F6T0GkzeBge76Okmq/O6rUE+QMRh
	 cGlLeOg6zW4u0qJAdtrlJ+bGAjWs7Mgcp5OL/f9Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ABC2F80564;
	Mon,  6 Mar 2023 18:38:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 439C5F80266; Thu,  2 Mar 2023 15:34:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from out-30.mta0.migadu.com (out-30.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31568F800DF
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 15:34:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31568F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=YfxbP5Wy
Date: Thu, 2 Mar 2023 15:34:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1677767681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ekEV5MAm7E6bjxp2q4ldu7Xx50sJODF+lRB04Y8cTWY=;
	b=YfxbP5WynmZcy/mSFqeS8QHrrfDbdj3xuSCY7Nbir/eL0wkrwMT1QYZLcNGOc2pLv4ipFE
	S00O9ppI7M8mC88e/oRAJsh7AhkuEd2tuJYR1l1vYYERKoYqHHEu8tnKE9g6F4plFuduMC
	jdKeqFfVfCr1e7TYwJ7FUuygQPCVQtI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: maxim,max9867: convert txt
 bindings to yaml
Message-ID: <ZACz/C/lMh/WsyrB@g0hl1n.net>
References: <20230302-max9867-v1-0-aa9f7f25db5e@skidata.com>
 <20230302-max9867-v1-1-aa9f7f25db5e@skidata.com>
 <167775917220.270950.1253335215666674705.robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <167775917220.270950.1253335215666674705.robh@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-MailFrom: richard.leitner@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BPURVGNALOFZN3JNLXVENFFJVHIFCDXA
X-Message-ID-Hash: BPURVGNALOFZN3JNLXVENFFJVHIFCDXA
X-Mailman-Approved-At: Mon, 06 Mar 2023 17:38:45 +0000
CC: Richard Leitner <richard.leitner@skidata.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Ladislav Michl <ladis@linux-mips.org>,
 Benjamin Bara <benjamin.bara@skidata.com>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BPURVGNALOFZN3JNLXVENFFJVHIFCDXA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Mar 02, 2023 at 07:05:02AM -0600, Rob Herring wrote:
> 
> On Thu, 02 Mar 2023 12:55:01 +0100, richard.leitner@linux.dev wrote:
> > From: Richard Leitner <richard.leitner@skidata.com>
> > 
> > Convert from max9867.txt to maxim,max9867.yaml and add missing
> > '#sound-dai-cells' property.
> > 
> > Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> > ---
> >  .../devicetree/bindings/sound/max9867.txt          | 17 --------
> >  .../devicetree/bindings/sound/maxim,max9867.yaml   | 51 ++++++++++++++++++++++
> >  2 files changed, 51 insertions(+), 17 deletions(-)
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):

Thank you for the pointer, Rob!

Will fix those in v2 and from now on run 'make DT_CHECKER_FLAGS=-m
dt_binding_check' before sending any patches 😉

regards;rl

> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/maxim,max9867.yaml: 'oneOf' conditional failed, one must be fixed:
> 	'unevaluatedProperties' is a required property
> 	'additionalProperties' is a required property
> 	hint: Either unevaluatedProperties or additionalProperties must be present
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> ./Documentation/devicetree/bindings/sound/maxim,max9867.yaml: $id: relative path/filename doesn't match actual path or filename
> 	expected: http://devicetree.org/schemas/sound/maxim,max9867.yaml#
> Error: Documentation/devicetree/bindings/sound/maxim,max9867.example.dts:18.9-13 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:434: Documentation/devicetree/bindings/sound/maxim,max9867.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1508: dt_binding_check] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230302-max9867-v1-1-aa9f7f25db5e@skidata.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 
