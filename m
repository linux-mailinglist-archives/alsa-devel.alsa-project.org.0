Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A106F3CFA41
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 15:13:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2CDF8167A;
	Tue, 20 Jul 2021 15:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2CDF8167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626786822;
	bh=IRukrG0lQbrhR63TQuhf1CsfxaEyDUJRxHrCKHxVZ1o=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OUga+D6Nyl4CUkAXp9mY1k0Jh460JaRGA55HWM33YoITI1vlG+Hrh2F889JQBYYjK
	 jPPZejsIvgPDbX+HCFVVQdvcCRc0BryOLJgRO+xbWvW1THbW9J9fKRdrTiYBaB/Ilh
	 u39jwiLVrVsj1tjKTQKDhY0rAxJ5xlYPZeFG2Iow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2CB3F80227;
	Tue, 20 Jul 2021 15:12:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F58EF80218; Tue, 20 Jul 2021 15:12:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B283F80104
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 15:12:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B283F80104
Received: by mail-il1-f170.google.com with SMTP id y6so19055816ilj.13
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 06:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=MrD9zPiZTZvwVFMJ0sm25SmAJuUN1FGIWLE0xooWCJU=;
 b=qzpQpf6fiYaSroobd7Wj2sgSkmE+2tHrc5hL7pzQe9g4dsb4uHo7dhiq4Jo5t1RCeC
 tVrS0MpdP2mN8+bplfhou6QTAlFPdhje1z+7+SudM1buxq6wuK6vQFGuGBe9QF3bWaOB
 e+Vfbiazev41KiygY7ry+IPN7Q+hU1+ct+V8pj5M9vZuGUt4NpE0ROYNt2skZ1J6AdYQ
 FMIju6JBLc610qzxEW04kXwT1ZJ1q4EZBb+NgFHdsw731L9yQrtI50jtav0bhZVpKErC
 7V1XD5R8VOBbrdU8OyKg+mvwWANrnTqFh7wQAiQ0mBwhAvxAx6O6VhGF16zSizMaLJr7
 QEgA==
X-Gm-Message-State: AOAM530AUz8q1yHCoLGGEqq17joER3kzHJOjWWuKVf5HfqjdRKup3PoN
 SxP4lx2Y4L5TYif20tzpTg==
X-Google-Smtp-Source: ABdhPJxDm0VwI3x/qnyhQWulPyMMfC6oajosDUc1UI/060M93rUk1p7P2rq5nhNdKtKy8dOI5PsP2A==
X-Received: by 2002:a92:c7a2:: with SMTP id f2mr19724855ilk.3.1626786723965;
 Tue, 20 Jul 2021 06:12:03 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id x13sm11514009ilo.11.2021.07.20.06.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 06:12:03 -0700 (PDT)
Received: (nullmailer pid 4121604 invoked by uid 1000);
 Tue, 20 Jul 2021 13:11:58 -0000
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wnplvk2a.wl-kuninori.morimoto.gx@renesas.com>
References: <87a6mhwyqn.wl-kuninori.morimoto.gx@renesas.com>
 <87wnplvk2a.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 09/14] ASoC: audio-graph-card2: add Yaml Document
Date: Tue, 20 Jul 2021 07:11:58 -0600
Message-Id: <1626786718.731708.4121603.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
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

On Tue, 20 Jul 2021 10:41:01 +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch adds Audio Graph Card2 Yaml bindings.
> It is similar to Audio Graph Card, but different.
> 
> 	- audio-graph-card  used "dais"  to indicate DAI-links,
> 	  audio-graph-card2 uses "links" to it.
> 
> 	- audio-graph-card  used "phandle" to indicate bitclock/frame-master,
> 	  audio-graph-card2 uses flag to it.
> 
> 	- audio-graph-card  used "format" to indicate DAI format,
> 	  audio-graph-card2 assumes CPU/Codec drivers have .get_fmt support.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../sound/audio-graph-card2-items.yaml        | 80 +++++++++++++++++++
>  .../bindings/sound/audio-graph-card2.yaml     | 51 ++++++++++++
>  2 files changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card2-items.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/audio-graph-card2.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/audio-graph-card2-items.yaml: patternProperties:^ports(@[0-1])?$:properties: 'port(@[0-9a-f]+)?' does not match '^[#$a-zA-Z][a-zA-Z0-9,+\\-._@]{0,63}$'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/audio-graph-card2-items.yaml: ignoring, error in schema: patternProperties: ^ports(@[0-1])?$: properties
warning: no schema found in file: ./Documentation/devicetree/bindings/sound/audio-graph-card2-items.yaml
Documentation/devicetree/bindings/sound/audio-graph-card2.example.dt.yaml:0:0: /example-0/cpu: failed to match any schema with compatible: ['cpu-driver']
Documentation/devicetree/bindings/sound/audio-graph-card2.example.dt.yaml:0:0: /example-0/codec: failed to match any schema with compatible: ['codec-driver']
Documentation/devicetree/bindings/sound/audio-graph-card2-items.example.dt.yaml:0:0: /example-0/mix: failed to match any schema with compatible: ['audio-graph-card2-dsp']
Documentation/devicetree/bindings/sound/audio-graph-card2-items.example.dt.yaml:0:0: /example-0/multi: failed to match any schema with compatible: ['audio-graph-card2-multi']
Documentation/devicetree/bindings/sound/audio-graph-card2-items.example.dt.yaml:0:0: /example-0/codec2codec: failed to match any schema with compatible: ['audio-graph-card2-codec2codec']
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1507357

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

