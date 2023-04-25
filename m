Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 578346EE6B8
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Apr 2023 19:31:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5366410E3;
	Tue, 25 Apr 2023 19:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5366410E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682443899;
	bh=MFHY/zMKVbuTlsy8wNydgg1+6cL9zuyXOy9Kbhl4KEs=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=K2z78BBDBGXBLt1+d922gUhdLPoxHzRSJFEikE5MM2ck94+S0o8hg8dspVP1xodzo
	 ZL9lJzAcZqIa+3Ym2y31td245kSnW41K7Ke5h5zp1sH2yi1z6YRqoPOVpVt6aLZQJ8
	 jG70EyTm54QhBmHywvpMA57SNS5o0VXSN23U91dE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91864F8018A;
	Tue, 25 Apr 2023 19:30:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76021F80236; Tue, 25 Apr 2023 19:30:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 253C2F800F8
	for <alsa-devel@alsa-project.org>; Tue, 25 Apr 2023 19:30:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 253C2F800F8
Received: by mail-oo1-f51.google.com with SMTP id
 006d021491bc7-549d9c295dfso1132540eaf.2
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Apr 2023 10:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682443831; x=1685035831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kx2MBexI4IdwwU3HpEq9VlXt44gc2MaIIVYzDB9fIV4=;
        b=NQ6XdII7E4DTNT8e12HCcyBtRBSf2scgWeBRLADWmLSVQirjeY4sPFmH35+FENlf+0
         ikFvszr/pBEJvwOsKSYVFR3kEq9dHrhuRsgR5gGVq0oAdZqOAftsSn6dJmaX0VCFN3bO
         mnwdfdxmvlmfE5m/k/7vv5uJbRLcCz7dAlvaNOgNdydm8cgaGFlg5G1wrDK+YnnFXk8V
         B+53cEEBPIYCIvh1jXrx2ky56Pk9tJGVdLxgNTLhLDGmbP2Zv9lrN3aPsfu2UccFlMAd
         2BfkGizD06BrF3JembaC6IXhQ6wPJiyTPaqx+pONTHciECXR26GA+6WTxu1nynglEKxv
         OZDw==
X-Gm-Message-State: AAQBX9c1NUfK4VwT135Au8eLtYYI+hqutXJ3L6N6qvxq48zOq59Ruv+y
	qj7OepdixHA53sX1v2UTkw==
X-Google-Smtp-Source: 
 AKy350YWtCrrLr3UM/3y9aq2ToOzHzoeNJ5TSClKRGZBXj25jO0yAiVnnnhvDs1DjJXnxt3FzDRMHw==
X-Received: by 2002:a4a:e058:0:b0:545:62bf:fd6c with SMTP id
 v24-20020a4ae058000000b0054562bffd6cmr6727843oos.0.1682443831133;
        Tue, 25 Apr 2023 10:30:31 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id
 m41-20020a4a952c000000b005251e3f92ecsm6259455ooi.47.2023.04.25.10.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 10:30:30 -0700 (PDT)
Received: (nullmailer pid 1984548 invoked by uid 1000);
	Tue, 25 Apr 2023 17:30:29 -0000
Date: Tue, 25 Apr 2023 12:30:29 -0500
From: Rob Herring <robh@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 1/4] dt-bindings: sound: Add simple-iio-aux
Message-ID: <20230425173029.GA1967523-robh@kernel.org>
References: <20230421124122.324820-1-herve.codina@bootlin.com>
 <20230421124122.324820-2-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230421124122.324820-2-herve.codina@bootlin.com>
Message-ID-Hash: BBCMR24H4NMTPRAZ2MEFA5XOMLS62PAJ
X-Message-ID-Hash: BBCMR24H4NMTPRAZ2MEFA5XOMLS62PAJ
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BBCMR24H4NMTPRAZ2MEFA5XOMLS62PAJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Apr 21, 2023 at 02:41:19PM +0200, Herve Codina wrote:
> Industrial I/O devices can be present in the audio path.
> These devices needs to be viewed as audio components in order to be
> fully integrated in the audio path.
> 
> simple-iio-aux allows to consider these Industrial I/O devices as
> auxliary audio devices.

What makes it simple? Any binding called simple or generic is a trigger 
for me. Best to avoid those terms. :)

Examples of devices would be useful here.

> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  .../bindings/sound/simple-iio-aux.yaml        | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/simple-iio-aux.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/simple-iio-aux.yaml b/Documentation/devicetree/bindings/sound/simple-iio-aux.yaml
> new file mode 100644
> index 000000000000..fab128fce4fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/simple-iio-aux.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/simple-iio-aux.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Simple IIO auxiliary
> +
> +maintainers:
> +  - Herve Codina <herve.codina@bootlin.com>
> +
> +description: |

Don't need '|'

> +  Auxiliary device based on Industrial I/O device channels
> +
> +allOf:
> +  - $ref: /schemas/iio/iio-consumer.yaml

You don't need to reference consumer schemas.

> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: simple-iio-aux
> +
> +  io-channels:
> +    description:
> +      Industrial I/O device channels used
> +
> +  io-channel-names:
> +    description:
> +      Industrial I/O channel names related to io-channels.
> +      These names are used to provides sound controls, widgets and routes names.
> +
> +  invert:

Property names should globally only have 1 type definition. This is 
generic enough I'd be concerned that's not the case.

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      A list of 0/1 flags defining whether or not the related channel is
> +      inverted
> +    items:
> +      enum: [0, 1]
> +      default: 0
> +      description: |
> +        Invert the sound control value compared to the IIO channel raw value.
> +          - 1: The related sound control value is inverted meaning that the
> +               minimum sound control value correspond to the maximum IIO channel
> +               raw value and the maximum sound control value correspond to the
> +               minimum IIO channel raw value.
> +          - 0: The related sound control value is not inverted meaning that the
> +               minimum (resp maximum) sound control value correspond to the
> +               minimum (resp maximum) IIO channel raw value.
> +
> +required:
> +  - compatible
> +  - io-channels
> +  - io-channel-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    aux {
> +        compatible = "simple-iio-aux";
> +        io-channels = <&iio 0>, <&iio 1>, <&iio 2>, <&iio 3>;
> +        io-channel-names = "CH0", "CH1", "CH2", "CH3";

Not really useful names. Do you have a real example?

> +        /* Invert CH1 and CH2 */
> +        invert = <0 1 1>;

IMO, invert should be same length as io-channels.

> +    };

How do support multiple instances? Say you have 2 sound cards (or 1 
sound card with multiple audio paths) each with different sets of IIO 
channels associated with it. You'd need a link to each 'aux' node. Why 
not just add io-channels to the sound card nodes directly? That's 
already just a virtual, top-level container node grouping all the 
components. I don't see why we need another virtual node grouping a 
subset of them.

Rob
