Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0421D518C77
	for <lists+alsa-devel@lfdr.de>; Tue,  3 May 2022 20:34:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FCFC886;
	Tue,  3 May 2022 20:34:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FCFC886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651602894;
	bh=7/ryOF1O8kUeE6Z2DXYUfIXwPpO9V9R58Hn/LW5fPgQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xw78GyjpqQ21Cw+IgpchHHkHT1Pj5TjRSn5Rs+uI6KS/8pS7I1+moprJ8OI0PA/Lk
	 ewZKtW1egVI3TWHpB/EUxxnuBYY9IguXzBSjSeClEVykiErxKz5NzYNHqn6bxXkYDg
	 xklV3Qng5HQKgPGQmVi8VDmy/ht337povTvjNKEo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1FD7F8025E;
	Tue,  3 May 2022 20:33:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C3EEF80236; Tue,  3 May 2022 20:33:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19CEBF80129
 for <alsa-devel@alsa-project.org>; Tue,  3 May 2022 20:33:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19CEBF80129
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-e9027efe6aso18002085fac.10
 for <alsa-devel@alsa-project.org>; Tue, 03 May 2022 11:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JD995VbXr1R+3XcKhoh2SmymKHzONLstnrCva28itOI=;
 b=3kZiswtJpbyn8fOJYYUNAr/46hedjVx7X6e0xO1565vCax3xIjsn2jGDzIl2Y+WyMk
 fNRfaqq0q47iH5C0bMusqXqB4TvHNjaB0ixI2axG86Luxnd9HB0FQjYMhT5Eoc3AAFB1
 pQ6jvzjZio/c6tgQ0KFGN3hE2DpxOJLYDDkh7EgDxKOTBzTo1xrRADjTcHT8hSBlWB0Y
 lIbxaqIPuoeyMznjVuhbcPGoywVioutWE/yK8F1836n43RpJQxrq4Pt/TrvoMouIJolX
 M31tTxtSi4KMFPmgq7oU9NWCUnJ2fLNYhQhR2phv5JyvUXj3xh5gQH+i+PuDOhUfJA7q
 GioQ==
X-Gm-Message-State: AOAM530ALlCzY2b5iLOrpW+Dnw5grwzMrA5fknccpu9aPWAWNgJHLtKZ
 uqWdbatRBTVbCYWaAXDtnA==
X-Google-Smtp-Source: ABdhPJxdLisMK7ntzYydEgULiZRYr/HCY5hCKYuOOWevIs2jkYangRQ/UUvLBeAa3/c5/hXVkcOfHw==
X-Received: by 2002:a05:6870:e9a0:b0:e6:9d2:ff42 with SMTP id
 r32-20020a056870e9a000b000e609d2ff42mr2404393oao.7.1651602822225; 
 Tue, 03 May 2022 11:33:42 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 dt48-20020a0568705ab000b000e686d13875sm7178556oab.15.2022.05.03.11.33.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 11:33:41 -0700 (PDT)
Received: (nullmailer pid 4011087 invoked by uid 1000);
 Tue, 03 May 2022 18:33:41 -0000
Date: Tue, 3 May 2022 13:33:41 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Kaehn <kaehndan@gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: sound: Add generic serial MIDI device
Message-ID: <YnF1hYpYvXrDtRyV@robh.at.kernel.org>
References: <20220502150404.20295-1-kaehndan@gmail.com>
 <20220502150404.20295-2-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502150404.20295-2-kaehndan@gmail.com>
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

On Mon, May 02, 2022 at 10:04:03AM -0500, Daniel Kaehn wrote:
> Adds dt-binding for a Generic MIDI Interface using a serial device.
> 
> Signed-off-by: Daniel Kaehn <kaehndan@gmail.com>
> ---
>  .../devicetree/bindings/sound/serialmidi.yaml | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/serialmidi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/serialmidi.yaml b/Documentation/devicetree/bindings/sound/serialmidi.yaml
> new file mode 100644
> index 000000000000..06a894e1b91d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/serialmidi.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/serialmidi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Serial MIDI Interface
> +
> +maintainers:
> +  - Daniel Kaehn <kaehndan@gmail.com>
> +
> +description: 
> +  Generic MIDI interface using a serial device. This denotes that a serial device is
> +  dedicated to MIDI communication, either to an external MIDI device through a DIN5
> +  or other connector, or to a known hardwired MIDI controller. This device must be a
> +  child node of a serial node.
> +
> +  Can only be set to use standard baud rates corresponding to supported rates of the
> +  parent serial device. If the standard MIDI baud of 31.25 kBaud is needed 
> +  (as would be the case if interfacing with arbitrary external MIDI devices),
> +  configure the clocks of the parent serial device so that a requested baud of 38.4 kBaud
> +  resuts in the standard MIDI baud rate, and set the 'current-speed' property to 38400.

s/resuts/results/

> +
> +properties:
> +  compatible:
> +    const: serialmidi

serial-midi would be a bit more readable. (And then align the filename 
with that.)

> +
> +  current-speed:
> +    $ref: /schemas/types.yaml#/definitions/uint32

Already has a type applied by serial.yaml, so you can drop.

> +    description: Baudrate to set the serial port to when this MIDI device is opened.
> +      If not specified, the parent serial device is allowed to use its default baud.
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
> +            current-speed = <38400>;
> +        };
> +    };
> -- 
> 2.33.0
> 
> 
