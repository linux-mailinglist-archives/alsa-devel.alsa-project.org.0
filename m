Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D6940C509
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 14:18:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D34701838;
	Wed, 15 Sep 2021 14:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D34701838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631708304;
	bh=y30/xraOfow/hiwD8zaCw8ar78Nh6IqAeCuRMc0Mzcg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OCQiX9IWpynrfMKduHhHq+LeNIbqY/5ysv6h0CaitplUd142BoRZ0DQGbrXgqtA6U
	 j/dQMJfyo74o49Oi7Ei+GVZMMgXMpou9Ej7J/q3ECi6iDMlNN/6Rq577NXqEr+U9UU
	 aaKQsVajEiyC8MYJGQwxGni1fA2OxTdW4NiQWPsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43565F80227;
	Wed, 15 Sep 2021 14:17:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E8D9F8027C; Wed, 15 Sep 2021 14:17:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C77ABF800EF
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 14:16:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C77ABF800EF
Received: from ramsan.of.borg ([84.195.186.194])
 by michel.telenet-ops.be with bizsmtp
 id uCGq2500E4C55Sk06CGqVE; Wed, 15 Sep 2021 14:16:54 +0200
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mQTm8-004dtW-F5; Wed, 15 Sep 2021 14:12:28 +0200
Date: Wed, 15 Sep 2021 14:12:28 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
X-X-Sender: geert@ramsan.of.borg
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/2] ASoC: rt5682s: Add driver for ALC5682I-VS codec
In-Reply-To: <163152996584.45703.10295940257693172145.b4-ty@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2109151408390.1106350@ramsan.of.borg>
References: <20210831130258.19286-1-derek.fang@realtek.com>
 <163152996584.45703.10295940257693172145.b4-ty@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, devicetree@vger.kernel.org, lgirdwood@gmail.com,
 albertchen@realtek.com, Rob Herring <robh+dt@kernel.org>,
 derek.fang@realtek.com, shumingf@realtek.com, albertwang@realtek.com,
 flove@realtek.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

CC devicetree

On Mon, 13 Sep 2021, Mark Brown wrote:
> On Tue, 31 Aug 2021 21:02:57 +0800, derek.fang@realtek.com wrote:
>> From: Derek Fang <derek.fang@realtek.com>
>>
>> This is an initial codec driver for Realtek ALC5682I-VS codec.
>>
>>
>
> Applied to
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
>
> Thanks!
>
> [1/2] ASoC: rt5682s: Add driver for ALC5682I-VS codec
>      commit: bdd229ab26be9aa3306d01787e1467db92df6603
> [2/2] ASoC: dt-bindings: rt5682s: add bindings for rt5682s
>      commit: 50159fdb144b73984873bf2eeb9ff45d10a67f3a

This is now commit 50159fdb144b7398 ("ASoC: dt-bindings: rt5682s: add
bindings for rt5682s") in broonie/sound#for-next, breaking "make
dt_binding_check":

Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml: 'example' is not one of ['$id', '$schema', 'title', 'description', 'examples', 'required', 'allOf', 'anyOf', 'oneOf', 'definitions', '$defs', 'additionalProperties', 'dependencies', 'patternProperties', 'properties', 'if', 'then', 'else', 'unevaluatedProperties', 'deprecated', 'maintainers', 'select']
         from schema $id: http://devicetree.org/meta-schemas/base.yaml#
Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml: properties:clock-names:items: {'const': 'mclk'} is not of type 'array'
         from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml: properties:clock-output-names:items: 'oneOf' conditional failed, one must be fixed:
         [{'description': 'Name given for DAI word clock output.'}, {'description': 'Name given for DAI bit clock output.'}] is not of type 'object'
         Additional properties are not allowed ('description' was unexpected)
         from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml: properties:realtek,dmic1-data-pin: 'description' is a required property
         hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
         from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml: properties:realtek,dmic1-data-pin: 'oneOf' conditional failed, one must be fixed:
         'type' is a required property
                 hint: A vendor boolean property can use "type: boolean"
         Additional properties are not allowed ('enum' was unexpected)
                 hint: A vendor boolean property can use "type: boolean"
         Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml: properties:realtek,dmic1-data-pin: 'oneOf' conditional failed, one must be fixed:
                 '$ref' is a required property
                 'allOf' is a required property
                 hint: A vendor property needs a $ref to types.yaml
                 from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
         0 is not of type 'string'
                 hint: A vendor string property with exact values has an implicit type
         1 is not of type 'string'
                 hint: A vendor string property with exact values has an implicit type
         2 is not of type 'string'
                 hint: A vendor string property with exact values has an implicit type
         hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
         from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml: properties:realtek,dmic1-clk-pin: 'description' is a required property
         hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
         from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml: properties:realtek,dmic1-clk-pin: 'oneOf' conditional failed, one must be fixed:
         'type' is a required property
                 hint: A vendor boolean property can use "type: boolean"
         Additional properties are not allowed ('enum' was unexpected)
                 hint: A vendor boolean property can use "type: boolean"
         Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml: properties:realtek,dmic1-clk-pin: 'oneOf' conditional failed, one must be fixed:
                 '$ref' is a required property
                 'allOf' is a required property
                 hint: A vendor property needs a $ref to types.yaml
                 from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
         0 is not of type 'string'
                 hint: A vendor string property with exact values has an implicit type
         1 is not of type 'string'
                 hint: A vendor string property with exact values has an implicit type
         2 is not of type 'string'
                 hint: A vendor string property with exact values has an implicit type
         hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
         from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml: properties:realtek,jd-src: 'description' is a required property
         hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
         from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml: properties:realtek,jd-src: 'oneOf' conditional failed, one must be fixed:
         'type' is a required property
                 hint: A vendor boolean property can use "type: boolean"
         Additional properties are not allowed ('enum' was unexpected)
                 hint: A vendor boolean property can use "type: boolean"
         Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml: properties:realtek,jd-src: 'oneOf' conditional failed, one must be fixed:
                 '$ref' is a required property
                 'allOf' is a required property
                 hint: A vendor property needs a $ref to types.yaml
                 from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#
         0 is not of type 'string'
                 hint: A vendor string property with exact values has an implicit type
         1 is not of type 'string'
                 hint: A vendor string property with exact values has an implicit type
         hint: Vendor specific properties must have a type and description unless they have a defined, common suffix.
         from schema $id: http://devicetree.org/meta-schemas/vendor-props.yaml#

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
