Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DD354545A
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 20:45:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 184C31EE5;
	Thu,  9 Jun 2022 20:44:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 184C31EE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654800316;
	bh=0N7xgqKjAP5eJxeDPeWM4+44Rbmj3uLwd6ncGwRiujE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p2BehLEU/nmaBCtHdXaTnozVsCrYbCDCDP4eyHTfYOzLCuBeRI7cvVIJ2SaMbos+k
	 mPuM+vcXiSuNENjLnxBl6ROA6UdDXJ6emp2jGvAbsyTPLi32LEHMK25DDrk1ogFXdE
	 D57NCRGnWPPnevINrM3x86vnT8xtix0PmLp9hlRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F761F80240;
	Thu,  9 Jun 2022 20:44:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04FC2F801F5; Thu,  9 Jun 2022 20:44:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DECBAF80116
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 20:44:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DECBAF80116
Received: by mail-io1-f52.google.com with SMTP id h8so4711532iof.11
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 11:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/DfCD3cuDBq5K2klbggsGdSn0HwRJ4iTJrrtYODZosg=;
 b=VBenEVkQGOruh0VafoqkObK1zBVra+GHE30nfFdg4MoYVsuUDXb8VK9assF6I0RzHV
 sWuEaF28nDn7N05JGZn+b9HIWm5NQFBGqxhJEUY3f+1LNCbNokLbtvCf8js3uOHGr5qo
 5JkeMXYz4jbN9pmM3mZrr4qruFQ55HFB2bE93sg5IYxks+bhGhhRcsQPeC9Lh+RF9N2Q
 hkyj9Xdn3L37AZmdAfmxna4lh3+457RpOYSZdOc1GeZyC1mjkt1tz3Ltovd3OkSOC9MV
 NCpcrIaNj182hCvzXqriC5PAjrDBGQp8tJ90T4DboqVx76oL2ydYNaKZqsShf8/8uAZO
 rvDg==
X-Gm-Message-State: AOAM5331kbq4MjSNaeFbrYxuZslKUTL959hAzetmQk+3kMLFw6CPVhgd
 xWD8zZb4vdCpgVvULZFWDQ==
X-Google-Smtp-Source: ABdhPJzjXxrVw5MMqaZ2JwPQdzsGl7hU7LgNBN7cipZ1qhkEhsMizNAjdXeJDaJ78eYYlXv4kPrOcg==
X-Received: by 2002:a02:ceba:0:b0:331:bd1c:a97f with SMTP id
 z26-20020a02ceba000000b00331bd1ca97fmr10014983jaq.216.1654800247972; 
 Thu, 09 Jun 2022 11:44:07 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a027b18000000b003313005be01sm9823472jac.141.2022.06.09.11.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 11:44:07 -0700 (PDT)
Received: (nullmailer pid 4097584 invoked by uid 1000);
 Thu, 09 Jun 2022 18:44:05 -0000
Date: Thu, 9 Jun 2022 12:44:05 -0600
From: Rob Herring <robh@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [RFC PATCH v2 1/5] dt-bindings: sound: Add Apple MCA I2S
 transceiver
Message-ID: <20220609184405.GA4091342-robh@kernel.org>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-2-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220606191910.16580-2-povik+lin@cutebit.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
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

On Mon, Jun 06, 2022 at 09:19:06PM +0200, Martin Povišer wrote:
> Add binding schema for MCA I2S transceiver found on Apple M1 and other
> chips.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> ---
>  .../devicetree/bindings/sound/apple,mca.yaml  | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/apple,mca.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/apple,mca.yaml b/Documentation/devicetree/bindings/sound/apple,mca.yaml
> new file mode 100644
> index 000000000000..c8a36d8c38ad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/apple,mca.yaml
> @@ -0,0 +1,102 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/apple,mca.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple MCA I2S transceiver
> +
> +description: |
> +  MCA is an I2S transceiver peripheral found on M1 and other Apple chips. It is
> +  composed of a number of identical clusters which can operate independently
> +  or in an interlinked fashion. Up to 6 clusters have been seen on an MCA.
> +
> +maintainers:
> +  - Martin Povišer <povik+lin@cutebit.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,t8103-mca
> +          - apple,t6000-mca
> +      - const: apple,mca
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 2

Need to define what each entry is.

> +
> +  interrupts:
> +    maxItems: 6
> +    description: |
> +      One interrupt per each cluster
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  dmas:
> +    minItems: 16
> +    maxItems: 24
> +    description: |
> +      DMA channels associated to the SERDES units within the peripheral. They
> +      are listed in groups of four per cluster, and within the cluster they are
> +      given in order TXA, RXA, TXB, RXB of the respective SERDES units.
> +
> +  dma-names:
> +    minItems: 16
> +    maxItems: 24
> +    description: |
> +      Names for the DMA channels: 'tx'/'rx', then cluster number, then 'a'/'b'
> +      based on the associated SERDES unit.

Express as a schema: 

items:
  pattern: '^(tx|rx)[0-5][ab]$'

> +
> +  clocks:
> +    minItems: 4
> +    maxItems: 6
> +    description: |
> +      Clusters' input reference clock.
> +
> +  power-domains:
> +    minItems: 5
> +    maxItems: 7
> +    description: |
> +      First the overall power domain for register access, then the power
> +      domains of individual clusters for their operation.
> +
> +  "#sound-dai-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - dmas
> +  - dma-names
> +  - clocks
> +  - power-domains
> +  - '#sound-dai-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mca: mca@9b600000 {
> +      compatible = "apple,t6000-mca", "apple,mca";
> +      reg = <0x9b600000 0x10000>,
> +            <0x9b500000 0x20000>;
> +
> +      clocks = <&nco 0>, <&nco 1>, <&nco 2>, <&nco 3>;
> +      power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
> +                      <&ps_mca2>, <&ps_mca3>;
> +      dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
> +             <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
> +             <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
> +             <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>;
> +      dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
> +                  "tx1a", "rx1a", "tx1b", "rx1b",
> +                  "tx2a", "rx2a", "tx2b", "rx2b",
> +                  "tx3a", "rx3a", "tx3b", "rx3b";
> +
> +      #sound-dai-cells = <1>;
> +    };
> -- 
> 2.33.0
> 
> 
