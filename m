Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 286B62930D8
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Oct 2020 23:58:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFB5A16FB;
	Mon, 19 Oct 2020 23:57:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFB5A16FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603144701;
	bh=yZWk3jU06ZfrimzDC19qf0Fd5wAuClK9rhtWsEHWQnE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nmW8741yBdDc746iMRwMG2dHw/WRVwL9enmoemZ1Bmk+Wf81Aad78dQJ+m0LvTPtt
	 uJUr+4kf81gWFT23yH6aw0sZzKzVceLYnDtpEhp/BsNf+wGrrkRxVLK8NHK32OUYxy
	 hlrK+ebRHraFHeq47pmRPKMO+rflKjgJM/GWbQmI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4715FF80264;
	Mon, 19 Oct 2020 23:56:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24854F80247; Mon, 19 Oct 2020 23:56:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_13,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F7B3F80121
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 23:56:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F7B3F80121
Received: by mail-oi1-f195.google.com with SMTP id u17so1772471oie.3
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 14:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PjydU190i7GN2JJAnYmlRKleN4kFxmQKH0ztDbomadk=;
 b=tzDHdjNpzqvrnYlI+9IK5c6SJvKCRe5chx6EYFKdEhNTYXBvCaHYT47kBznZiPkrYX
 YXhHfzpMXg70bt9FpnVipiSA8B1PxGLDRypn1UfUZ0M1AookZPqLWQrT15WEXo1F4Q3E
 fmF8GRPXFwh22hYBZX3vDltoBr5FqYBQH91WR6EHc1xmSsrKGRrtGc/KMaWbetTcZiV5
 GeLEUHq1hf+vQ62Xgi6kB2/+2qlVraJmDsPWydfaPlCqIIOMAv4HJvUNThZ3XiPlNGso
 e4ftYX5vM4/B7vxgdwx3nXf4Kvca9nIsoROkLgGHLQ7QB59y3afH+0qJg8zhDGvkSp/N
 cnqA==
X-Gm-Message-State: AOAM531XsjuIbX1bWMzf4/jY3IdSYh4jQC+onZQ2gmaMpALEO83RG5fh
 VVRv0b6xkfc6KfTvWcYpFg==
X-Google-Smtp-Source: ABdhPJw4Lum6ffck1YRawMIIyuUeY33/Wvg9VIm5C8dx7ePCdMYgUxZN7KQBNvd54FJAMw3Kp0RLig==
X-Received: by 2002:aca:37c5:: with SMTP id e188mr1067613oia.159.1603144590441; 
 Mon, 19 Oct 2020 14:56:30 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w128sm285335oie.47.2020.10.19.14.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 14:56:29 -0700 (PDT)
Received: (nullmailer pid 3669541 invoked by uid 1000);
 Mon, 19 Oct 2020 21:56:28 -0000
Date: Mon, 19 Oct 2020 16:56:28 -0500
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v4 08/15] Documentation: of: Convert graph bindings to
 json-schema
Message-ID: <20201019215628.GA3650804@bogus>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
 <1602859382-19505-9-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602859382-19505-9-git-send-email-spujar@nvidia.com>
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 rlokhande@nvidia.com, swarren@nvidia.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, jonathanh@nvidia.com,
 devicetree@vger.kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, mkumard@nvidia.com, viswanathl@nvidia.com,
 lgirdwood@gmail.com, nwartikar@nvidia.com, p.zabel@pengutronix.de,
 sharadg@nvidia.com, dramesh@nvidia.com
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

On Fri, Oct 16, 2020 at 08:12:55PM +0530, Sameer Pujar wrote:
> Convert device tree bindings of graph to YAML format.

Thanks for doing this.

> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/graph.txt  | 128 --------------------
>  Documentation/devicetree/bindings/graph.yaml | 170 +++++++++++++++++++++++++++
>  2 files changed, 170 insertions(+), 128 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/graph.txt
>  create mode 100644 Documentation/devicetree/bindings/graph.yaml

I'd like to move this to the dtschema repository instead.

> diff --git a/Documentation/devicetree/bindings/graph.yaml b/Documentation/devicetree/bindings/graph.yaml
> new file mode 100644
> index 0000000..67804c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/graph.yaml
> @@ -0,0 +1,170 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

As the original text defaulted to GPL2, this needs Philipp's permission 
to re-license.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/graph.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common bindings for device graphs
> +
> +description: |
> +  The hierarchical organisation of the device tree is well suited to describe
> +  control flow to devices, but there can be more complex connections between
> +  devices that work together to form a logical compound device, following an
> +  arbitrarily complex graph.
> +  There already is a simple directed graph between devices tree nodes using
> +  phandle properties pointing to other nodes to describe connections that
> +  can not be inferred from device tree parent-child relationships. The device
> +  tree graph bindings described herein abstract more complex devices that can
> +  have multiple specifiable ports, each of which can be linked to one or more
> +  ports of other devices.
> +
> +  These common bindings do not contain any information about the direction or
> +  type of the connections, they just map their existence. Specific properties
> +  may be described by specialized bindings depending on the type of connection.
> +
> +  To see how this binding applies to video pipelines, for example, see
> +  Documentation/devicetree/bindings/media/video-interfaces.txt.
> +  Here the ports describe data interfaces, and the links between them are
> +  the connecting data buses. A single port with multiple connections can
> +  correspond to multiple devices being connected to the same physical bus.
> +
> +maintainers:
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +definitions:
> +
> +  port:
> +    type: object
> +    description: |
> +      If there is more than one 'port' or more than one 'endpoint' node
> +      or 'reg' property present in the port and/or endpoint nodes then
> +      '#address-cells' and '#size-cells' properties are required in relevant
> +      parent node.

reg property.

> +
> +    patternProperties:
> +      "^endpoint(@[0-9a-f]+)?$":
> +        type: object
> +        properties:

reg?

> +          remote-endpoint:
> +            description: |
> +              phandle to an 'endpoint' subnode of a remote device node.
> +            $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  ports:
> +    type: object
> +    patternProperties:
> +      "^port(@[0-9a-f]+)?$":
> +        $ref: "#/definitions/port"

No reason for this to be under 'definitions'. Just move down.

> +
> +properties:
> +  ports:
> +    $ref: "#/definitions/ports"
> +
> +patternProperties:
> +  "^port(@[0-9a-f]+)?$":
> +    $ref: "#/definitions/port"
> +
> +additionalProperties: false

This needs to be true here. But you need this within 'ports' and 'port'. 
(I think... I think we only have extra properties within endpoint 
nodes.) 

> +
> +examples:
> +  # Organisation of ports and endpoints:
> +  #
> +  # Ports are described by child 'port' nodes contained in the device node.
> +  # Each port node contains an 'endpoint' subnode for each remote device port
> +  # connected to this port. If a single port is connected to more than one
> +  # remote device, an 'endpoint' child node must be provided for each link.
> +  # If more than one port is present in a device node or there is more than
> +  # one endpoint at a port, or a port node needs to be associated with a
> +  # selected hardware interface, a common scheme using '#address-cells',
> +  # '#size-cells' and 'reg' properties is used to number the nodes.
> +  - |
> +    device {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        port@0 {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            reg = <0>;
> +
> +            endpoint@0 {
> +                reg = <0>;
> +                // ...
> +            };
> +            endpoint@1 {
> +                reg = <1>;
> +                // ...
> +            };
> +        };
> +
> +        port@1 {
> +            reg = <1>;
> +
> +            endpoint {
> +                // ...
> +            };
> +        };
> +    };
> +
> +  # All 'port' nodes can be grouped under an optional 'ports' node, which
> +  # allows to specify #address-cells, #size-cells properties for the 'port'
> +  # nodes independently from any other child device nodes a device might
> +  # have.
> +  - |
> +    device {
> +        // ...
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <0>;
> +                // ...
> +
> +                endpoint@0 {
> +                    reg = <0>;
> +                    // ...
> +                };
> +                endpoint@1 {
> +                    reg = <1>;
> +                    // ...
> +                };
> +            };
> +
> +            port@1 {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                reg = <1>;
> +                // ...
> +            };
> +        };
> +    };
> +
> +  # Links between endpoints:
> +  #
> +  # Each endpoint should contain a 'remote-endpoint' phandle property that
> +  # points to the corresponding endpoint in the port of the remote device.
> +  # In turn, the remote endpoint should contain a 'remote-endpoint' property.
> +  # If it has one, it must not point to anything other than the local endpoint.
> +  # Two endpoints with their 'remote-endpoint' phandles pointing at each other
> +  # form a link between the containing ports.
> +  - |
> +    device-1 {
> +        port {
> +            device_1_output: endpoint {
> +                remote-endpoint = <&device_2_input>;
> +            };
> +        };
> +    };
> +
> +    device-2 {
> +        port {
> +            device_2_input: endpoint {
> +                remote-endpoint = <&device_1_output>;
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.7.4
> 
