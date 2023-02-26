Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CB76A334D
	for <lists+alsa-devel@lfdr.de>; Sun, 26 Feb 2023 18:49:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48A071DE;
	Sun, 26 Feb 2023 18:48:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48A071DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677433785;
	bh=Rj5hDuHKofYCrCkBXrAyBlN/1viidnPuwS1ayxhEOCU=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AKtTE2CDlo8Ujl/jGc1oACIx1C3LzMDn9D09U+k27BQ22n1LS4Ppiy8UjTa3sV17q
	 D3S/nsAZwEixirA3Glf5q6T1OgSYIRk5rzqvxr4BV9Q6EGw/hUncx2QgiaO+yDkpPP
	 ZxE0B+TKAQ4CDx7aDUF19t9JzPsLB7I722Erw1Pw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B0ADF802BE;
	Sun, 26 Feb 2023 18:48:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5891F8049C; Sun, 26 Feb 2023 18:48:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28248F80236
	for <alsa-devel@alsa-project.org>; Sun, 26 Feb 2023 18:48:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28248F80236
Received: by mail-il1-f177.google.com with SMTP id h10so2763989ila.11
        for <alsa-devel@alsa-project.org>;
 Sun, 26 Feb 2023 09:48:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tACdGgGFajYXgjnpQBRHCU3URa1Aa3HOSGApSi6BQP0=;
        b=5t+G/g3h+B/Xu3bieHRZFwsSr0s/cUrYTfIn8W6LfONyh/QVc/5Ee57yKNxIABGpyQ
         vjZgPLE9xOWZ9hCWK/YcgEQCFlQGqk4RrcHop3UKQPMiy/MPnY8ohbBgAgt8Xe1XFeGK
         rRcMr3rbaEdQLW9Fnnl4Pfo5ZnW7EiTIJmI8crv9FnJPv9Hm6+S7iy22pIdUjzZ2YTuy
         AN9119NE2Mfz2IJmt9LW/Nyrni5phOX4km4PJmE1nTP0udwZWoaK+VzXDyLpIAYME8Pg
         P2olwkzPOGx3rjdPF8u1bDQbIkgC8rUdMri8e6Xf+DSZWMMrnFxP4WZkeNKe4HzX7mMo
         1NBw==
X-Gm-Message-State: AO0yUKXZ5YrM/O2agM41NCW2G878dukNm0XvnQ9KaE5etRJSHYeLE/rH
	rrUOyb7Sa0QA1Z6FtWMjEw==
X-Google-Smtp-Source: 
 AK7set8Wd5SMOa9NAntTVq35NywdsrvS0Q2rvoUt9kZ/yG7JfyCQCXnbFwE/T/rvGtqqOhUIjqeNHg==
X-Received: by 2002:a05:6e02:1a8c:b0:316:e793:9dba with SMTP id
 k12-20020a056e021a8c00b00316e7939dbamr15338967ilv.26.1677433719096;
        Sun, 26 Feb 2023 09:48:39 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:8ddf:ff6b:c94c:94fd:4442])
        by smtp.gmail.com with ESMTPSA id
 z19-20020a056638001300b003a9595b7e3asm1479085jao.46.2023.02.26.09.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:48:38 -0800 (PST)
Received: (nullmailer pid 84297 invoked by uid 1000);
	Sun, 26 Feb 2023 17:48:33 -0000
Date: Sun, 26 Feb 2023 11:48:33 -0600
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v6 01/10] dt-bindings: soc: fsl: cpm_qe: Add TSA
 controller
Message-ID: <20230226174833.GA76710-robh@kernel.org>
References: <20230217145645.1768659-1-herve.codina@bootlin.com>
 <20230217145645.1768659-2-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217145645.1768659-2-herve.codina@bootlin.com>
Message-ID-Hash: VISD46ACW34GZZA6Z7MUNU2M6EH7Z2JY
X-Message-ID-Hash: VISD46ACW34GZZA6Z7MUNU2M6EH7Z2JY
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Li Yang <leoyang.li@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VISD46ACW34GZZA6Z7MUNU2M6EH7Z2JY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Feb 17, 2023 at 03:56:36PM +0100, Herve Codina wrote:
> Add support for the time slot assigner (TSA)
> available in some PowerQUICC SoC such as MPC885
> or MPC866.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml | 215 ++++++++++++++++++
>  include/dt-bindings/soc/cpm1-fsl,tsa.h        |  13 ++
>  2 files changed, 228 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml
>  create mode 100644 include/dt-bindings/soc/cpm1-fsl,tsa.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml
> new file mode 100644
> index 000000000000..332e902bcc21
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml
> @@ -0,0 +1,215 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,cpm1-tsa.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PowerQUICC CPM Time-slot assigner (TSA) controller
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description:
> +  The TSA is the time-slot assigner that can be found on some PowerQUICC SoC.
> +  Its purpose is to route some TDM time-slots to other internal serial
> +  controllers.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,mpc885-tsa
> +          - fsl,mpc866-tsa
> +      - const: fsl,cpm1-tsa
> +
> +  reg:
> +    items:
> +      - description: SI (Serial Interface) register base
> +      - description: SI RAM base
> +
> +  reg-names:
> +    items:
> +      - const: si_regs
> +      - const: si_ram
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  '#fsl,serial-cells':

#foo-cells is for when there are differing foo providers which need 
different number of cells. That's not the case here.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    const: 1
> +    description:
> +      TSA consumers that use a phandle to TSA need to pass the serial identifier
> +      with this phandle (defined in dt-bindings/soc/fsl,tsa.h).
> +      For instance "fsl,tsa-serial = <&tsa FSL_CPM_TSA_SCC4>;".
