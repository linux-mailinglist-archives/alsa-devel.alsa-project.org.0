Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5CB4FBF3F
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Apr 2022 16:34:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDE1D170E;
	Mon, 11 Apr 2022 16:33:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDE1D170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649687685;
	bh=4cfoGCIK4Blx8tbnAst3Uh4sOh0osjg5w6rKXIZXY3I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d4eei9Ao94GSB6vCpTFujh6Mg5RHf3GfIuLCyUN9bpyKoLozI46h+tYiEUClvJ6ZG
	 9tJ9NM2981C9Uju0l0OmLIXJ+nk2jrsG9QEy22/hky4aufDJYGpsDGg4uFjGwXDGM9
	 2FqI+1HS0QBLH8THxWv0EaW/RsvVfqTKVk2gCA90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25E31F8032D;
	Mon, 11 Apr 2022 16:33:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6248F80279; Mon, 11 Apr 2022 16:33:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE943F8011C
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 16:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE943F8011C
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-e2afb80550so5500094fac.1
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 07:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pI1Xw5xNi9j9AtJsJlqCP0NN4vjvtgLpRonltEt9T1c=;
 b=Y+aVfupwjI4g+XUpXgBXlARoqgFUqLSQzFouYPtwRr90Y+5PyRL+hKSLR5VqDYsURR
 NINauuhDg3BxxNu92Y9bIbS0lOBesHc+bF4UeIabePWZYiP7gjE1hIt7YKiQofgO1EjK
 Guq2YBB9i6wZFO7sx3xSMfxjdra5QyT/ZIpFL/dL8c7dmsX7WV1Nd4gcMCEwpN4i255z
 mlkljadhHa5b8Ca9qBbCGCmcnle+pf8HbY9P/HFIAxjxy0vyxIcawxa73YN08Qc0TOYd
 A+iUpwOXat92zWFdKxH8aBRT52RIu9bdszncoi+NfDAf9X/6EoujQi3qyuTB2oEHdOzy
 rOEQ==
X-Gm-Message-State: AOAM531zlm6fJzBjSze1Agjvne6mpNcb0OoXckjjAjmArFKcEey9T2Fm
 PkBelDLtYfFLfYtX9OuREA==
X-Google-Smtp-Source: ABdhPJxq1ZuYNrku4K6nBlt0MfSrQ3wf1GCzU34p5z6vhbKaTBIayAoVuNgbAziGi6Mmlx1Jei3wtg==
X-Received: by 2002:a05:6870:639e:b0:e2:ab7c:d868 with SMTP id
 t30-20020a056870639e00b000e2ab7cd868mr4279435oap.108.1649687614435; 
 Mon, 11 Apr 2022 07:33:34 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l12-20020a056808020c00b002da28c240dfsm11391855oie.16.2022.04.11.07.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 07:33:34 -0700 (PDT)
Received: (nullmailer pid 1187433 invoked by uid 1000);
 Mon, 11 Apr 2022 14:33:33 -0000
Date: Mon, 11 Apr 2022 09:33:33 -0500
From: Rob Herring <robh@kernel.org>
To: Raphael-Xu <13691752556@139.com>
Subject: Re: [PATCH v1 2/2] update to support either TAS2764 or TAS2780
Message-ID: <YlQ8PWyVlm/dH9Yg@robh.at.kernel.org>
References: <20220408141119.958-1-13691752556@139.com>
 <20220408141119.958-2-13691752556@139.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408141119.958-2-13691752556@139.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org, raphael-xu@ti.com,
 shenghao-ding@ti.com, navada@ti.com
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

On Fri, Apr 08, 2022 at 10:11:19PM +0800, Raphael-Xu wrote:
> update tas27xx.yaml to support either TAS2764 or TAS2780

DT patches must go to DT list. 

Now that this is in linux-next, it's breaking 'make dt_binding_check':


./Documentation/devicetree/bindings/sound/tas27xx.yaml:24:7: [error] syntax error: could not find expected ':' (syntax)
./Documentation/devicetree/bindings/sound/tas27xx.yaml:  while scanning a simple key
  in "<unicode string>", line 23, column 7
could not find expected ':'
  in "<unicode string>", line 24, column 7
make[1]: *** Deleting file 'Documentation/devicetree/bindings/sound/tas27xx.example.dts'
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 52, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 434, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 119, in get_single_data
    node = self.composer.get_single_node()
  File "_ruamel_yaml.pyx", line 706, in _ruamel_yaml.CParser.get_single_node
  File "_ruamel_yaml.pyx", line 724, in _ruamel_yaml.CParser._compose_document
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 775, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 889, in _ruamel_yaml.CParser._compose_mapping_node
  File "_ruamel_yaml.pyx", line 773, in _ruamel_yaml.CParser._compose_node
  File "_ruamel_yaml.pyx", line 852, in _ruamel_yaml.CParser._compose_sequence_node
  File "_ruamel_yaml.pyx", line 904, in _ruamel_yaml.CParser._parse_next_event
ruamel.yaml.scanner.ScannerError: while scanning a simple key
  in "<unicode string>", line 23, column 7
could not find expected ':'
  in "<unicode string>", line 24, column 7


> 
> Signed-off-by: Raphael-Xu <13691752556@139.com>
> ---
>  .../devicetree/bindings/sound/tas27xx.yaml     | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/tas27xx.yaml b/Documentation/devicetree/bindings/sound/tas27xx.yaml
> index 5bf8c76ecda1..191f4bceb4ee 100644
> --- a/Documentation/devicetree/bindings/sound/tas27xx.yaml
> +++ b/Documentation/devicetree/bindings/sound/tas27xx.yaml
> @@ -1,25 +1,27 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -# Copyright (C) 2020 Texas Instruments Incorporated
> +# Copyright (C) 2020-2022 Texas Instruments Incorporated
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/sound/tas2764.yaml#"
> +$id: "http://devicetree.org/schemas/sound/tas27xx.yaml#"

This belonged in patch 1.

>  $schema: "http://devicetree.org/meta-schemas/core.yaml#"
>  
> -title: Texas Instruments TAS2764 Smart PA
> +title: Texas Instruments TAS2764/TAS2780 Smart PA
>  
>  maintainers:
> -  - Dan Murphy <dmurphy@ti.com>
> +  - Shenghao Ding <shenghao-ding@ti.com>
>  
>  description: |
> -  The TAS2764 is a mono, digital input Class-D audio amplifier optimized for
> -  efficiently driving high peak power into small loudspeakers.
> -  Integrated speaker voltage and current sense provides for
> -  real time monitoring of loudspeaker behavior.
> +  The TAS2764/TAS2780 is a mono, digital input Class-D audio amplifier
> +  optimized for efficiently driving high peak power into small
> +  loudspeakers. Integrated speaker voltage and current sense provides
> +  for real time monitoring of loudspeaker behavior.
>  
>  properties:
>    compatible:
>      enum:
>        - ti,tas2764
> +      or
> +      - ti,tas2780

'or'  in not valid.

Please submit a fix ASAP.

Rob
