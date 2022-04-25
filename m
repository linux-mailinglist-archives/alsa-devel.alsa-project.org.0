Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AC050EB86
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 00:17:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA1D6184D;
	Tue, 26 Apr 2022 00:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA1D6184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650925060;
	bh=OGI3yIo69MD3uToKo6qDkJGp8r8e4eKqTD3NvuRMJZw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EwZCTHcwTBS+vDgk7gjV2dC0uU4Ra7YCPtKG42nDkn0Y/Hw62y/m5hTgKYXk5gkVY
	 iLooiUcG95Joh5E6+kzr/fcik4x7uBfOMgbw1ITtv/h2NyBYpIU8Mfv+jLB5q+tsYt
	 24bGv8jk9NSxjBHbJu2YlGaqvItxfzg1itvJuT08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A313F8016B;
	Tue, 26 Apr 2022 00:16:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59892F8016A; Tue, 26 Apr 2022 00:16:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DA75F800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 00:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DA75F800FA
Received: by mail-ot1-f42.google.com with SMTP id
 u17-20020a9d4d91000000b00605a73abac1so3797143otk.7
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 15:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pAnndawtmkUnKaymvAUKIHFVUO7wxjO7614Lrfui7b0=;
 b=JaIS/xmQ5NIK3soTPrtRjzXd7I2dTgK9pelCzT5NoEa05KDPdYu7g9eSKPDYQujwr3
 bHjPkMkupeZ897hV77pqFWwrKGFykynNZVx4ObdM3NFQMA7bjqY8cfNZMUNVUXn3+ElF
 wGPyWQdpM6ZrAHhqQdFgR+rVqu5hhUHfbvOwWrwyZVCfoigFEOqEL4b67fQotyDnkGR1
 gDktDjQfjqJerbrvDIkfY7QtGyonm+qOT+piSSWcjPigucTZ+NBu+yzN855IcjpOGEuF
 44tperMCJgzXegOLmXTyS22g3L9JEW4gozjD0etmAStDlM3AqN+MEuiu4C6nXDV5xxaz
 KvNA==
X-Gm-Message-State: AOAM532WUXk55e+B6aaG1qNkuLjLAEAkVbnujjswtQGpc5f8IK2P9Lok
 qm8hQvEtCdKDOOtd5xQV6g==
X-Google-Smtp-Source: ABdhPJyQC2EAtFQwZlhXb35X7/Amyr5Weeamh1E8SL8vFCDlnn2KP1B26/VAhdtzlqdwSbMI9hGkHQ==
X-Received: by 2002:a9d:6503:0:b0:5e6:d8b6:f684 with SMTP id
 i3-20020a9d6503000000b005e6d8b6f684mr7263746otl.289.1650924990039; 
 Mon, 25 Apr 2022 15:16:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 t22-20020a056870e75600b000e915a9121csm168977oak.52.2022.04.25.15.16.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 15:16:29 -0700 (PDT)
Received: (nullmailer pid 396470 invoked by uid 1000);
 Mon, 25 Apr 2022 22:16:29 -0000
Date: Mon, 25 Apr 2022 17:16:29 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Kaehn <kaehndan@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: sound: Add generic serial MIDI device
Message-ID: <YmcdvcyeJJBB1pqW@robh.at.kernel.org>
References: <20220425191602.770932-1-kaehndan@gmail.com>
 <20220425191602.770932-2-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425191602.770932-2-kaehndan@gmail.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com
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

On Mon, Apr 25, 2022 at 02:16:02PM -0500, Daniel Kaehn wrote:
> Adds dt-binding for snd-serial-generic serial MIDI driver

Bindings are for h/w and there's no such thing as generic h/w. There are 
some exceptions but you'll have to justify why this is special.


> Signed-off-by: Daniel Kaehn <kaehndan@gmail.com>
> ---
>  .../devicetree/bindings/sound/serialmidi.yaml | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/serialmidi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/serialmidi.yaml b/Documentation/devicetree/bindings/sound/serialmidi.yaml
> new file mode 100644
> index 000000000000..38ef49a0c2f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/serialmidi.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/serialmidi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Serial MIDI Device
> +
> +maintainers:
> +  - Daniel Kaehn <kaehndan@gmail.com>
> +
> +description: |

Don't need '|' unless there is formatting to preserve.

> +  Generic MIDI interface using a serial device. Can only be set to use standard speeds
> +  corresponding to supported baud rates of the underlying serial device. If standard MIDI
> +  speed of 31.25 kBaud is needed, configure the clocks of the underlying serial device
> +  so that a requested speed of 38.4 kBaud resuts in the standard MIDI baud rate.
> +
> +properties:
> +  compatible:
> +    const: serialmidi
> +
> +  speed:

Not a standard property and we already have 2 of them concerning baud 
rate.

> +    maxItems: 1
> +    description: |
> +      Speed to set the serial port to when the MIDI device is opened.
> +      If not specified, the underlying serial device is allowed to use its configured default speed.
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    serial {
> +        midi {
> +            compatible = "serialmidi";
> +            speed = <38400>;
> +        };
> +    };
> -- 
> 2.33.0
> 
> 
