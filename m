Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 325795A1920
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 20:52:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7635E1621;
	Thu, 25 Aug 2022 20:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7635E1621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661453550;
	bh=ZVzSp+LhaVe67miSWt0Ck8nbsAq3kQRzMlHu+eEbWxY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dgRByB9cWFONawylshJW8uXAxnXnSUysX1hSI2ZCuTa9iVXU1v3aU6BM0uEdBj/Fj
	 3u2hJ5w2soaj/2FigdN2CZOx45cOgTyTSxkog7021DU2SdgVlNfNzzIWxfsgGUz+Qu
	 vNmpLKQ6Pl9RRLripStFRGalwYdxE7PKQybhkqzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF39BF80271;
	Thu, 25 Aug 2022 20:51:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DFBEF8025A; Thu, 25 Aug 2022 20:51:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D3A8F8014B
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 20:51:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D3A8F8014B
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-11cab7d7e0fso24886952fac.6
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 11:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=X/cVd+KOZMnW5AEd2SXFiu5+u+UnvgqvwY4tvjFkN5w=;
 b=XnZ4r25yeBVrh+JFp1PcD2ggydfw9VDhF0s0NMxFTSKf2qlTgIpCgUsosufsossaz1
 NAWZ219Bouu1VS3IHP1kIvtW7o88gLxcGCRmrQebjmFoF8lkCxfEtq+cn9M20OmrDKx4
 N9KW9HplwmyONOR10Is5EmNZmeLUrDHG7PtXa0YF9tojjLVEv2VjL/5EYiBHs7jZovEK
 Sncn/N0sk6kDw6M/2Ti+LovYGFkkeYFw9Q6B3mQTowNE5hE1FfHjDCJbWsW3Vj1OgaWd
 2BqqHl+WQO6xPBpodw21jlND7o/zjbIUAryVFgIxq2kwrzs69CpNO2i/kjI9pGeuOZei
 MzOw==
X-Gm-Message-State: ACgBeo0llvYm8tiz6+SCdYm61satfkC0KvqORGqPQpsruBbQE/M+e5y1
 S+FXipQnUaTNTtiOdaBFzg==
X-Google-Smtp-Source: AA6agR5at6NFTKiUyIw1Kb0xcXmMgTMvsyGSZx2gNvzl8dWpbxREgES9FDOSuEVhyNfyXQj8Dhkkag==
X-Received: by 2002:a05:6870:b148:b0:112:cfe1:5062 with SMTP id
 a8-20020a056870b14800b00112cfe15062mr227632oal.297.1661453481259; 
 Thu, 25 Aug 2022 11:51:21 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f20-20020a9d0394000000b0063736db0ae9sm5573904otf.15.2022.08.25.11.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 11:51:20 -0700 (PDT)
Received: (nullmailer pid 1486937 invoked by uid 1000);
 Thu, 25 Aug 2022 18:51:19 -0000
From: Rob Herring <robh@kernel.org>
To: Daniel Mack <daniel@zonque.org>
In-Reply-To: <20220825140412.2297211-1-daniel@zonque.org>
References: <20220825140412.2297211-1-daniel@zonque.org>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: max98396: Document data monitor
 properties
Date: Thu, 25 Aug 2022 13:51:19 -0500
Message-Id: <1661453479.979911.1486936.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, ryan.lee.analog@gmail.com, robh+dt@kernel.org,
 broonie@kernel.org, alsa-devel@alsa-project.org
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

On Thu, 25 Aug 2022 16:04:11 +0200, Daniel Mack wrote:
> This device features a data monitor that puts the device in software reset
> upon a configurable set of events.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
> v1 -> v2: fix a typo and remove a stray blank line
> 
>  .../bindings/sound/adi,max98396.yaml          | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/adi,max98396.yaml: properties:adi,dmon-stuck-threshold-bits: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/adi,max98396.yaml: properties:adi,dmon-magnitude-threshold-bits: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/adi,max98396.yaml: ignoring, error in schema: properties: adi,dmon-stuck-threshold-bits
Documentation/devicetree/bindings/sound/adi,max98396.example.dtb:0:0: /example-0/i2c/amplifier@39: failed to match any schema with compatible: ['adi,max98396']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

