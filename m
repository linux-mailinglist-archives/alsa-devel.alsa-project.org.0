Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A4445E269
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 22:28:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5D1618E9;
	Thu, 25 Nov 2021 22:27:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5D1618E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637875684;
	bh=tOSdBjUx5TQniFhRkXb3LhxEkjCzX4K3hkghT5YEuqk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fEu6O1Bax4J6dlQAZvqXVZtsdJOG2FygYQRE6V9GurqU58TTuizXrXdKaPST27NU7
	 KdClphq4xeGIkEpmXG8MpBY3/BIPPqeymNvgU3NDdIAsG06wJMokfTYh+6/oe4UTVC
	 CM/mRth9ivyEL2+6mIhgwRlxHWZ9mNYpf4Eh2wAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69248F804DF;
	Thu, 25 Nov 2021 22:26:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E998BF804BC; Thu, 25 Nov 2021 22:26:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89BD3F80087
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 22:26:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89BD3F80087
Received: by mail-ot1-f53.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso11133730otf.12
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 13:26:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=enKrWb01zIUlLDcWec9IsDV9nL4gjphxHjIfLcnFxNM=;
 b=g99dlkcqhdWmAaBOIxr34mDq5govJW83v1wAWZmkXXKu1Sd/RBRUdfhdm+dN5GAvZj
 ga8vH6nsqN1kC4ttQhGBBHQroGCuB9u1c1ddd3zh00xAXD5FaoXwqQkWCYFN65k6jCYz
 69Engvyn9ckKbQ+2zJl9QcHVrPLbFsst793qjzRAAsuYLXqyfOUhXwwoGHxQTRzEkCBh
 KaAM2lID5wk8dqVmmaILxPsK6MFYwFOU3iwlKhCvKTroFISj4uxFi2OaoQ3UoTSTMv9v
 BxLkvsGofmxcaWT+dJjdvJUFlcCYphgB7sCsVcyVWSGYRT4kTIcPTdP9fsiSFmpFVnt2
 cLQA==
X-Gm-Message-State: AOAM533u2HXdU5vsGEmDYFrK/IHuXmaJ12mA0+X4c9p1nirraNd6qPUj
 2yTHzgY3V4mpFl9w56Jppg==
X-Google-Smtp-Source: ABdhPJzC8WF3V4q4Zkszhtmy5n3Ib8vaC3VBok3QPb6dv92gkCyEe7pE4+MBOF2mLf3L8Jo3yfdidQ==
X-Received: by 2002:a05:6830:25d6:: with SMTP id
 d22mr24856709otu.87.1637875589845; 
 Thu, 25 Nov 2021 13:26:29 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id z8sm654248oot.7.2021.11.25.13.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 13:26:29 -0800 (PST)
Received: (nullmailer pid 2858315 invoked by uid 1000);
 Thu, 25 Nov 2021 21:26:02 -0000
From: Rob Herring <robh@kernel.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20211125121521.31554-1-j-choudhary@ti.com>
References: <20211125121521.31554-1-j-choudhary@ti.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
Date: Thu, 25 Nov 2021 14:26:02 -0700
Message-Id: <1637875562.316639.2858314.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org
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

On Thu, 25 Nov 2021 17:45:21 +0530, Jayesh Choudhary wrote:
> Convert the bindings for McASP controllers for TI SOCs
> from txt to YAML schema.
> 
> Adds additional properties 'clocks', 'clock-names', 'power-domains'
> '#sound-dai-cells', 'num-serializer' and 'port' which were not there
> in the txt file.
> Adds 'dmas' and 'dma-names' in the example which were not there in
> the txt file.
> Changes 'interrupts' and 'interrupt-names' from optional to
> required properties.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
> Changelog:
> v2:
> - changes the commit message
> - modifies the properties 'clocks', 'clock-names', 'dma-names',
>   'dmas', 'interrupts' and 'interrupt-names' according to the
>   arm SOCs
> - adds 'port' and 'num-serializer' as node properties.
> 
>  .../bindings/sound/davinci-mcasp-audio.txt    |  86 ---------
>  .../bindings/sound/davinci-mcasp-audio.yaml   | 179 ++++++++++++++++++
>  2 files changed, 179 insertions(+), 86 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml: properties:clock-names: {'minItems': 1, 'maxItems': 3, 'items': [{'const': 'fck'}, {'const': 'ahclkx'}, {'const': 'ahclkr'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml: ignoring, error in schema: properties: clock-names
warning: no schema found in file: ./Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
Documentation/devicetree/bindings/sound/davinci-mcasp-audio.example.dt.yaml:0:0: /example-0/mcasp0@1d00000: failed to match any schema with compatible: ['ti,da830-mcasp-audio']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1559662

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

