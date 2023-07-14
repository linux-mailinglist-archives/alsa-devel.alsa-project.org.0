Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 086B0753DE2
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 16:43:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E87EA4B;
	Fri, 14 Jul 2023 16:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E87EA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689345832;
	bh=XEOxH2CqYyurx7m8JBdmTpu11TeU73bpGdvBcGnn5Hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p/JOSzG0iFnbkvmFzTXsHUSnXEB7UWDW8Dei/Hb4VluvLKSshBp6DMl5itIKGjPab
	 I+7vQJ+WFS6yUi2WK/8XaHbmJdmWRjOkmjzBBvMeXwPjh+/xlweYUYgmrBmALV/tf2
	 Wr0cZGvbRrye8QsQMqIeVdEltmNPkZneQ8wJqe8c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CBDDF80535; Fri, 14 Jul 2023 16:43:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 099ECF80236;
	Fri, 14 Jul 2023 16:43:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EFD8F80249; Fri, 14 Jul 2023 16:42:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E3791F800E4
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 16:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3791F800E4
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-34617b29276so7501835ab.0
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Jul 2023 07:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689345768; x=1691937768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KafqaUPjCBQvFb5pvwK1WdmWPTr611IYKGNe6Y4q1jw=;
        b=AWH9AYqvD/OeAS1NCRS6DNyTt35WqqsSLmr7NfWo61O99iOkLLzc/ylJ3Xstdmx1cp
         gmKY6n0W4aYYoZzsOYiG1tP48zM28i8ZBb7P4Z+b/bM6aNmgJpf6ymTxTi9u1h6gfSBc
         5hxKMTLpN8kWGHzhUmlWmlRHRG33MX+scgGV6mOVbY/oJS6ygDO4O20KAP3sVAGUp1qN
         DrgnRtj06ZcNusThEBrXXfOBlGG02+g/zEKVqvx+gT6FvMudvXWh0l6LP2LHFPMDhx30
         91Tf94TixET0aQeSdqVQ12mEasAlk9B0B/iHf2Jqc2YmetKOrYCWZt2abV7deIq9AGeK
         Q+YA==
X-Gm-Message-State: ABy/qLacpQ+l2+G/5jEx8eVUAQ+7Ee0NwR+v+Y5vihINQ2GrPanRqUAe
	NIgfc+YbLo+mF7cC//zIaA==
X-Google-Smtp-Source: 
 APBJJlGgw+aS9LF9nyYrifeO4PKMHlwWzPPjDwEY0tG7a8ECRbrBNcvL4TYX5yATAdGS/P2F6DiReg==
X-Received: by 2002:a05:6e02:1a62:b0:348:72fe:8de0 with SMTP id
 w2-20020a056e021a6200b0034872fe8de0mr443527ilv.14.1689345767787;
        Fri, 14 Jul 2023 07:42:47 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 h12-20020a92d84c000000b0034267d3fcc5sm2788971ilq.55.2023.07.14.07.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 07:42:47 -0700 (PDT)
Received: (nullmailer pid 3499251 invoked by uid 1000);
	Fri, 14 Jul 2023 14:42:45 -0000
Date: Fri, 14 Jul 2023 08:42:45 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?utf-8?B?IkFtYWRldXN6IFPFgmF3acWEc2tpIg==?=
 <amadeuszx.slawinski@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 14/15] ASoC: dt-bindings: renesas,rsnd.yaml: add
 common port-def
Message-ID: <20230714144245.GA3492124-robh@kernel.org>
References: <87mt04o96f.wl-kuninori.morimoto.gx@renesas.com>
 <87351wo921.wl-kuninori.morimoto.gx@renesas.com>
 <20230710151956.GA1992791-robh@kernel.org>
 <87lefn8gh9.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lefn8gh9.wl-kuninori.morimoto.gx@renesas.com>
Message-ID-Hash: 6ESFAWQRNT6TOCOI5JRDVBAN5IYRG5XG
X-Message-ID-Hash: 6ESFAWQRNT6TOCOI5JRDVBAN5IYRG5XG
X-MailFrom: robherring2@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ESFAWQRNT6TOCOI5JRDVBAN5IYRG5XG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 09:00:18AM +0900, Kuninori Morimoto wrote:
> 
> Hi Rob
> 
> Thank you for reviewing
> 
> 
> > > diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > index 8a821dec9526..d9808b130e8d 100644
> > > --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > @@ -9,6 +9,20 @@ title: Renesas R-Car Sound Driver
> > >  maintainers:
> > >    - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > >  
> > > +definitions:
> > 
> > $defs
> 
> Hmm... many drivers are using "definitions" ?

Patches welcome to change them. I don't think it's many (not counting 
types.yaml). Use of "definitions" or "$defs" is an exception.

> This kind of indication is very confusable...

"definitions" was common convention in early json-schema. "$defs" was 
added to the specification to standardize it.

> > >    port:
> > > -    $ref: audio-graph-port.yaml#/definitions/port-base
> > > -    unevaluatedProperties: false
> > > -    patternProperties:
> > > -      "^endpoint(@[0-9a-f]+)?":
> > > -        $ref: audio-graph-port.yaml#/definitions/endpoint-base
> > > -        properties:
> > > -          playback:
> > > -            $ref: /schemas/types.yaml#/definitions/phandle-array
> > > -          capture:
> > > -            $ref: /schemas/types.yaml#/definitions/phandle-array
> > > -        unevaluatedProperties: false
> > > +    $ref: "#/definitions/port-def"
> > 
> > It would be better if users just always used "ports { port {}; };" even 
> > in the single port case.
> 
> "ports" support is added, we can't modify past.

I don't understand. The graph APIs all work the same with or without 
'ports'. Changing the DT shouldn't affect the ABI.

Rob
