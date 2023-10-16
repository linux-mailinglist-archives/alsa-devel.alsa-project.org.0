Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE0C7CB164
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 19:33:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C739284B;
	Mon, 16 Oct 2023 19:32:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C739284B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697477612;
	bh=KaEIm4c/EkFCJuatEjeAcAhh5JIp3BgaMmy16iMtauA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CC1LzpqfilqHj2xFGfNRykoFpBqywdoGbjwbIxDF1CnLhGI81W64CfurwtWtyMYvy
	 ziu0IFngbKVvPaMTEZt2FQ6MiYXAYaacZ+dyGTmlxE8ZsHgQuvtdL4QUh/aRj3oUP1
	 QNWiS2oV2kY/3gYm6hVsgTe4unBhglLiMZ82J8jg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA944F8024E; Mon, 16 Oct 2023 19:32:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04145F8024E;
	Mon, 16 Oct 2023 19:32:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19D70F8025F; Mon, 16 Oct 2023 19:32:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B540BF8019B
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 19:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B540BF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gkpNnBTX
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6b2018a11efso3083287b3a.0
        for <alsa-devel@alsa-project.org>;
 Mon, 16 Oct 2023 10:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697477523; x=1698082323;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vk1d7b5CEyLP0IPU6mHLkR7If10Kf7hMWt9uBIdr69E=;
        b=gkpNnBTXrTS2t9iz4df59NYtLzpfasCqGjEZpi2JtCZQ2vux1VKXpoof0G2wd1xGbA
         an5J8kzYwKwOqIetG/GHxnuoYr+IZ5BQY4aw0zx+q5ITImixW8VIiLoR8QvN5m2xtmOW
         0fjZWom5XjRDfCntH3/LKxBO/Cp70y1+/vLnDg19mzXI92mubkqJrGrMsv62xHR0+wwV
         UD97810cVnRrKgNqRBc4sSKobaJEi7tcoaTArLRdOq3yFDRRFirr51xvVfGwaJmQVhRK
         53v7khXUkg+3SOaC4mveQpKMzVLuoX36UcTWeBlNb3J+m0GkCvo1tB9ypXijBYPc2J21
         T4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697477523; x=1698082323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vk1d7b5CEyLP0IPU6mHLkR7If10Kf7hMWt9uBIdr69E=;
        b=OWWeQUr5wrhfo/hPF0BnSc//zRoIPcS1MOnlCLNs30iMVQt9QjgXXrab4Mlj0EanS0
         EQaAweoO0xgVLrFhhkA0XC8s27Y7r/wEJzMAjEA3v46lyWquaLZw2XPWZZOrNdj56iFJ
         1CpfuqqW/Sf+EdThr1nv5Gx2Nx9YZVpIewsHrx/YBWBpSmv0D+2BwXeG6yre6vhvJrbD
         AqGs5kDJXNurwVfJyHmI3+Kuhi9PRTJADrz1qQfDT6hyJ6iLkcxWRSY/pN9O9vvyTYH8
         p1zYsQeqlrmfKHdMb/cJ3Lnt89qbxnDZnIgrx7mxXCt31YYmKRoHPeNjBD/XxIRohv4y
         ATtQ==
X-Gm-Message-State: AOJu0Yz/tzw/PlIJplbYCI1tHOLcCwcSCANDw/kK8dq6Z/+kc+psvuwT
	7ltMAMNQ4B5rTQGSIn5lk6gFlw==
X-Google-Smtp-Source: 
 AGHT+IG3Zc8YucFlDIjDPOK8ia6NP6GE2jbgrQaL2IURvBqGUulyKHlppicyrh2EgU1NTXj4BL8uUw==
X-Received: by 2002:a05:6a20:3d85:b0:133:f0b9:856d with SMTP id
 s5-20020a056a203d8500b00133f0b9856dmr43166722pzi.17.1697477522909;
        Mon, 16 Oct 2023 10:32:02 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:9add:9fdd:7517:f866])
        by smtp.gmail.com with ESMTPSA id
 b21-20020a170902d31500b001c72f4334afsm8772925plc.20.2023.10.16.10.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 10:32:02 -0700 (PDT)
Date: Mon, 16 Oct 2023 11:31:59 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Julien Massot <julien.massot@iot.bzh>,
	Trevor Wu <trevor.wu@mediatek.com>, Simon Glass <sjg@chromium.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop kernel copy of common reserved-memory
 bindings
Message-ID: <ZS1zjxCVMnyl5dPN@p14s>
References: <20231013200851.347042-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231013200851.347042-1-robh@kernel.org>
Message-ID-Hash: LAKW4HMK4ND4JCOWYHTRHTLTRW7QKVPD
X-Message-ID-Hash: LAKW4HMK4ND4JCOWYHTRHTLTRW7QKVPD
X-MailFrom: mathieu.poirier@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LAKW4HMK4ND4JCOWYHTRHTLTRW7QKVPD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Oct 13, 2023 at 03:08:49PM -0500, Rob Herring wrote:
> The common reserved-memory bindings have recently been copied from the
> kernel tree into dtschema. The preference is to host common, stable
> bindings in dtschema. As reserved-memory is documented in the DT Spec,
> it meets the criteria.
> 
> The v2023.09 version of dtschema is what contains the reserved-memory
> schemas we depend on, so bump the minimum version to that. Otherwise,
> references to these schemas will generate errors.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/Makefile    |   2 +-
>  .../remoteproc/renesas,rcar-rproc.yaml        |   2 +-
>  .../bindings/reserved-memory/framebuffer.yaml |  52 -----
>  .../reserved-memory/memory-region.yaml        |  40 ----
>  .../reserved-memory/reserved-memory.txt       |   2 +-
>  .../reserved-memory/reserved-memory.yaml      | 181 ------------------
>  .../reserved-memory/shared-dma-pool.yaml      |  97 ----------
>  .../bindings/sound/mediatek,mt8188-afe.yaml   |   2 +-
>  8 files changed, 4 insertions(+), 374 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/memory-region.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
>  delete mode 100644 Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
> 
> diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
> index 8b395893bd85..3e886194b043 100644
> --- a/Documentation/devicetree/bindings/Makefile
> +++ b/Documentation/devicetree/bindings/Makefile
> @@ -6,7 +6,7 @@ DT_MK_SCHEMA ?= dt-mk-schema
>  DT_SCHEMA_LINT = $(shell which yamllint || \
>    echo "warning: python package 'yamllint' not installed, skipping" >&2)
>  
> -DT_SCHEMA_MIN_VERSION = 2022.3
> +DT_SCHEMA_MIN_VERSION = 2023.9
>  
>  PHONY += check_dtschema_version
>  check_dtschema_version:
> diff --git a/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
> index 4bea679a0f61..5c280117dc93 100644
> --- a/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/renesas,rcar-rproc.yaml
> @@ -31,7 +31,7 @@ properties:
>        remoteproc device. This is variable and describes the memories shared with
>        the remote processor (e.g. remoteproc firmware and carveouts, rpmsg
>        vrings, ...).
> -      (see ../reserved-memory/reserved-memory.yaml)
> +      (see reserved-memory/reserved-memory.yaml in dtschema project)

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  
>  required:
>    - compatible
> diff --git a/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml b/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
> deleted file mode 100644
> index 851ec24d6142..000000000000
> --- a/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: /reserved-memory framebuffer node
> -
> -maintainers:
> -  - devicetree-spec@vger.kernel.org
> -
> -allOf:
> -  - $ref: reserved-memory.yaml
> -
> -properties:
> -  compatible:
> -    const: framebuffer
> -    description: >
> -      This indicates a region of memory meant to be used as a framebuffer for
> -      a set of display devices. It can be used by an operating system to keep
> -      the framebuffer from being overwritten and use it as the backing memory
> -      for a display device (such as simple-framebuffer).
> -
> -unevaluatedProperties: false
> -
> -examples:
> -  - |
> -    / {
> -        compatible = "foo";
> -        model = "foo";
> -        #address-cells = <1>;
> -        #size-cells = <1>;
> -
> -        chosen {
> -            framebuffer {
> -                compatible = "simple-framebuffer";
> -                memory-region = <&fb>;
> -            };
> -        };
> -
> -        reserved-memory {
> -            #address-cells = <1>;
> -            #size-cells = <1>;
> -            ranges;
> -
> -            fb: framebuffer@80000000 {
> -                compatible = "framebuffer";
> -                reg = <0x80000000 0x007e9000>;
> -            };
> -        };
> -    };
> -...
> diff --git a/Documentation/devicetree/bindings/reserved-memory/memory-region.yaml b/Documentation/devicetree/bindings/reserved-memory/memory-region.yaml
> deleted file mode 100644
> index 592f180e6b0d..000000000000
> --- a/Documentation/devicetree/bindings/reserved-memory/memory-region.yaml
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/reserved-memory/memory-region.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: Reserved Memory Region
> -
> -maintainers:
> -  - devicetree-spec@vger.kernel.org
> -
> -description: |
> -  Regions in the /reserved-memory node may be referenced by other device
> -  nodes by adding a memory-region property to the device node.
> -
> -select: true
> -
> -properties:
> -  memory-region:
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
> -    description: >
> -      Phandle to a /reserved-memory child node assigned to the device.
> -
> -  memory-region-names:
> -    $ref: /schemas/types.yaml#/definitions/string-array
> -    description: >
> -      A list of names, one for each corresponding entry in the
> -      memory-region property
> -
> -additionalProperties: true
> -
> -examples:
> -  - |
> -    fb0: video@12300000 {
> -        /* ... */
> -        reg = <0x12300000 0x1000>;
> -        memory-region = <&display_reserved>;
> -    };
> -
> -...
> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> index 1810701a8509..8ce72996d500 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> @@ -1 +1 @@
> -This file has been moved to reserved-memory.yaml.
> +This file has been moved to reserved-memory.yaml in the dtschema repository.
> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> deleted file mode 100644
> index c680e397cfd2..000000000000
> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml
> +++ /dev/null
> @@ -1,181 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: /reserved-memory Child Node Common
> -
> -maintainers:
> -  - devicetree-spec@vger.kernel.org
> -
> -description: >
> -  Reserved memory is specified as a node under the /reserved-memory node. The
> -  operating system shall exclude reserved memory from normal usage one can
> -  create child nodes describing particular reserved (excluded from normal use)
> -  memory regions. Such memory regions are usually designed for the special
> -  usage by various device drivers.
> -
> -  Each child of the reserved-memory node specifies one or more regions
> -  of reserved memory. Each child node may either use a 'reg' property to
> -  specify a specific range of reserved memory, or a 'size' property with
> -  optional constraints to request a dynamically allocated block of
> -  memory.
> -
> -  Following the generic-names recommended practice, node names should
> -  reflect the purpose of the node (ie. "framebuffer" or "dma-pool").
> -  Unit address (@<address>) should be appended to the name if the node
> -  is a static allocation.
> -
> -properties:
> -  reg: true
> -
> -  size:
> -    oneOf:
> -      - $ref: /schemas/types.yaml#/definitions/uint32
> -      - $ref: /schemas/types.yaml#/definitions/uint64
> -    description: >
> -      Length based on parent's \#size-cells. Size in bytes of memory to
> -      reserve.
> -
> -  alignment:
> -    oneOf:
> -      - $ref: /schemas/types.yaml#/definitions/uint32
> -      - $ref: /schemas/types.yaml#/definitions/uint64
> -    description: >
> -      Length based on parent's \#size-cells. Address boundary for
> -      alignment of allocation.
> -
> -  alloc-ranges:
> -    $ref: /schemas/types.yaml#/definitions/uint32-array
> -    description: >
> -      Address and Length pairs. Specifies regions of memory that are
> -      acceptable to allocate from.
> -
> -  iommu-addresses:
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
> -    description: >
> -      A list of phandle and specifier pairs that describe static IO virtual
> -      address space mappings and carveouts associated with a given reserved
> -      memory region. The phandle in the first cell refers to the device for
> -      which the mapping or carveout is to be created.
> -
> -      The specifier consists of an address/size pair and denotes the IO
> -      virtual address range of the region for the given device. The exact
> -      format depends on the values of the "#address-cells" and "#size-cells"
> -      properties of the device referenced via the phandle.
> -
> -      When used in combination with a "reg" property, an IOVA mapping is to
> -      be established for this memory region. One example where this can be
> -      useful is to create an identity mapping for physical memory that the
> -      firmware has configured some hardware to access (such as a bootsplash
> -      framebuffer).
> -
> -      If no "reg" property is specified, the "iommu-addresses" property
> -      defines carveout regions in the IOVA space for the given device. This
> -      can be useful if a certain memory region should not be mapped through
> -      the IOMMU.
> -
> -  no-map:
> -    type: boolean
> -    description: >
> -      Indicates the operating system must not create a virtual mapping
> -      of the region as part of its standard mapping of system memory,
> -      nor permit speculative access to it under any circumstances other
> -      than under the control of the device driver using the region.
> -
> -  reusable:
> -    type: boolean
> -    description: >
> -      The operating system can use the memory in this region with the
> -      limitation that the device driver(s) owning the region need to be
> -      able to reclaim it back. Typically that means that the operating
> -      system can use that region to store volatile or cached data that
> -      can be otherwise regenerated or migrated elsewhere.
> -
> -allOf:
> -  - if:
> -      required:
> -        - no-map
> -
> -    then:
> -      not:
> -        required:
> -          - reusable
> -
> -  - if:
> -      required:
> -        - reusable
> -
> -    then:
> -      not:
> -        required:
> -          - no-map
> -
> -oneOf:
> -  - oneOf:
> -      - required:
> -          - reg
> -
> -      - required:
> -          - size
> -
> -  - oneOf:
> -      # IOMMU reservations
> -      - required:
> -          - iommu-addresses
> -
> -      # IOMMU mappings
> -      - required:
> -          - reg
> -          - iommu-addresses
> -
> -additionalProperties: true
> -
> -examples:
> -  - |
> -    / {
> -      compatible = "foo";
> -      model = "foo";
> -
> -      #address-cells = <2>;
> -      #size-cells = <2>;
> -
> -      reserved-memory {
> -        #address-cells = <2>;
> -        #size-cells = <2>;
> -        ranges;
> -
> -        adsp_resv: reservation-adsp {
> -          /*
> -           * Restrict IOVA mappings for ADSP buffers to the 512 MiB region
> -           * from 0x40000000 - 0x5fffffff. Anything outside is reserved by
> -           * the ADSP for I/O memory and private memory allocations.
> -           */
> -          iommu-addresses = <&adsp 0x0 0x00000000 0x00 0x40000000>,
> -                            <&adsp 0x0 0x60000000 0xff 0xa0000000>;
> -        };
> -
> -        fb: framebuffer@90000000 {
> -          reg = <0x0 0x90000000 0x0 0x00800000>;
> -          iommu-addresses = <&dc0 0x0 0x90000000 0x0 0x00800000>;
> -        };
> -      };
> -
> -      bus@0 {
> -        #address-cells = <1>;
> -        #size-cells = <1>;
> -        ranges = <0x0 0x0 0x0 0x40000000>;
> -
> -        adsp: adsp@2990000 {
> -          reg = <0x2990000 0x2000>;
> -          memory-region = <&adsp_resv>;
> -        };
> -
> -        dc0: display@15200000 {
> -          reg = <0x15200000 0x10000>;
> -          memory-region = <&fb>;
> -        };
> -      };
> -    };
> -...
> diff --git a/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml b/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
> deleted file mode 100644
> index 457de0920cd1..000000000000
> --- a/Documentation/devicetree/bindings/reserved-memory/shared-dma-pool.yaml
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: /reserved-memory DMA pool
> -
> -maintainers:
> -  - devicetree-spec@vger.kernel.org
> -
> -allOf:
> -  - $ref: reserved-memory.yaml
> -
> -properties:
> -  compatible:
> -    oneOf:
> -      - const: shared-dma-pool
> -        description: >
> -          This indicates a region of memory meant to be used as a shared
> -          pool of DMA buffers for a set of devices. It can be used by an
> -          operating system to instantiate the necessary pool management
> -          subsystem if necessary.
> -
> -      - const: restricted-dma-pool
> -        description: >
> -          This indicates a region of memory meant to be used as a pool
> -          of restricted DMA buffers for a set of devices. The memory
> -          region would be the only region accessible to those devices.
> -          When using this, the no-map and reusable properties must not
> -          be set, so the operating system can create a virtual mapping
> -          that will be used for synchronization. The main purpose for
> -          restricted DMA is to mitigate the lack of DMA access control
> -          on systems without an IOMMU, which could result in the DMA
> -          accessing the system memory at unexpected times and/or
> -          unexpected addresses, possibly leading to data leakage or
> -          corruption. The feature on its own provides a basic level of
> -          protection against the DMA overwriting buffer contents at
> -          unexpected times. However, to protect against general data
> -          leakage and system memory corruption, the system needs to
> -          provide way to lock down the memory access, e.g., MPU. Note
> -          that since coherent allocation needs remapping, one must set
> -          up another device coherent pool by shared-dma-pool and use
> -          dma_alloc_from_dev_coherent instead for atomic coherent
> -          allocation.
> -
> -  linux,cma-default:
> -    type: boolean
> -    description: >
> -      If this property is present, then Linux will use the region for
> -      the default pool of the contiguous memory allocator.
> -
> -  linux,dma-default:
> -    type: boolean
> -    description: >
> -      If this property is present, then Linux will use the region for
> -      the default pool of the consistent DMA allocator.
> -
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        const: restricted-dma-pool
> -then:
> -  properties:
> -    no-map: false
> -    reusable: false
> -
> -unevaluatedProperties: false
> -
> -examples:
> -  - |
> -      reserved-memory {
> -          #address-cells = <1>;
> -          #size-cells = <1>;
> -          ranges;
> -
> -          /* global autoconfigured region for contiguous allocations */
> -          linux,cma {
> -              compatible = "shared-dma-pool";
> -              reusable;
> -              size = <0x4000000>;
> -              alignment = <0x2000>;
> -              linux,cma-default;
> -          };
> -
> -          display_reserved: framebuffer@78000000 {
> -              reg = <0x78000000 0x800000>;
> -          };
> -
> -          restricted_dma_reserved: restricted-dma-pool@50000000 {
> -              compatible = "restricted-dma-pool";
> -              reg = <0x50000000 0x4000000>;
> -          };
> -      };
> -
> -...
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> index 90520f89208b..77af276ed2a2 100644
> --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> @@ -29,7 +29,7 @@ properties:
>      maxItems: 1
>      description: |
>        Shared memory region for AFE memif.  A "shared-dma-pool".
> -      See ../reserved-memory/reserved-memory.yaml for details.
> +      See dtschema reserved-memory/shared-dma-pool.yaml for details.
>  
>    mediatek,topckgen:
>      $ref: /schemas/types.yaml#/definitions/phandle
> -- 
> 2.42.0
> 
